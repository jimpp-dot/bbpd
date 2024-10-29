import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:chat_room/src/vindicate/model/vindicate_msg_handler.dart';
import 'package:chat_room/src/vindicate/model/vindicate_send_gift_view_model.dart';
import 'package:chat_room/src/vindicate/model/vindicate_square_view_model.dart';
import 'vindicate_data.dart';

/// 表白活动相关view model
/// [sendGiftViewModel] - 想对你说ViewModel
/// [squareViewModel] - 表白广场ViewModel
class VindicateViewModel extends AbsRoomModel<VindicateData> {
  /// 是否在加载中
  bool isLoading = false;

  /// 表白广场ViewModel
  late VindicateSquareViewModel squareViewModel;

  /// 想对你说送礼物ViewModel
  late VindicateSendGiftViewModel sendGiftViewModel;

  int? uid;

  int? from;

  VindicateViewModel(VindicateData value, this.uid, this.from) : super(value);

  @override
  AbsRoomMsgHandler createMsgHandler(AbsRoomModel model, ChatRoomData room) =>
      VindicateMsgHandler(this, room);

  @override
  void init(ChatRoomData room) {
    super.init(room);

    squareViewModel = VindicateSquareViewModel();
    sendGiftViewModel = VindicateSendGiftViewModel(room, uid, from);

    if (from == 1 && uid != null && uid! > 0) {
      _setFrom(from);
    }

    room.addListener(RoomConstant.Event_Refresh, _onEventRoomRefresh);

    sendGiftViewModel.loadData();
  }

  @override
  void dispose() {
    room?.removeListener(RoomConstant.Event_Refresh, _onEventRoomRefresh);

    super.dispose();
  }

  @override
  void loadData() {}

  /// 房间刷新消息，用来刷新当前麦上用户的状态
  _onEventRoomRefresh(String type, dynamic data) {
    sendGiftViewModel.loadRoomPositionUsers();
  }

  /// 显示个人资料的底部弹窗面板
  void actionForShowPersonalProfileBottomSheetDialog(int uid) {
    RoomNavUtil.goToImageScreenDialog(System.context, null, room!, userId: uid);
  }

  /// 赠送礼物
  void actionForSendGift() {
    /// 判断是否已选中了用户
    if (sendGiftViewModel.selectedUser == null) {
      Fluttertoast.showToast(msg: BaseK.K.gift_select_send_user);
      return;
    }

    _payGifts(
        users: [sendGiftViewModel.selectedUser!],
        gift: sendGiftViewModel.selectedGift!,
        giftNum: sendGiftViewModel.selectedGiftNum);
  }

  /// 支付并赠送礼物
  ///
  /// [users] 麦上的人，目前只支持一次送一个
  /// [gift] 礼物对象
  /// [giftNum] 礼物数量
  Future _payGifts(
      {required List<VindicateRoomPosition> users,
      required VindicateGiftData gift,
      int giftNum = 1}) async {
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

    /// 先判断是否余额不足
    SheetCallback? result = await payManager.showRechargeSheet(
        System.context, ((gift.price) * giftNum).toInt());
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    payManager.pay(System.context,
        key: 'gift',
        type: result.value?.key ?? '',
        refer: 'gift',
        args: {
          'money': gift.price * giftNum,
          'type': 'package',
          'params': {
            'rid': room?.rid ?? 0,
            'uids': users.map((e) => e.roomPosition.uid).join(','),
            'positions': users.map((e) => e.roomPosition.position).join(','),
            'position': users.map((e) => e.roomPosition.uid).firstWhere(
                (element) => element == Session.uid,
                orElse: () => 1),
            'giftId': gift.giftId,
            'giftNum': giftNum,
            'price': gift.price,
            'cid': gift.giftCid,
            // 'ctype': 'gift',
            'ctype': '',
            'duction_money': 0,
            'version': 2,
            'num': giftNum,
            'gift_type': 'normal',
            'star': 0,
            'show_pac_man_guide':
                Config.getBool('has_show_pac_man_guide', false) ? 0 : 1,
            'refer': '${room?.refer}:room',
            'all_mic': 0,
          },
        },
        showLoading: false, onPayed: () {
      Toast.showBottom(System.context, K.reward_suc);

      /// 礼物送出通知
      sendGiftViewModel.onSendGiftSuccess(users, gift);
    });
  }

  _setFrom(int? value) {
    from = value;
    notifyListeners();
  }
}
