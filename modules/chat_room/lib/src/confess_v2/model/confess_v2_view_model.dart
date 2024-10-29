import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:chat_room/src/confess_v2/model/confess_v2_msg_handler.dart';
import 'package:chat_room/src/confess_v2/model/confess_v2_send_gift_view_model.dart';
import 'package:chat_room/src/confess_v2/model/confess_v2_square_view_model.dart';
import 'package:chat_room/src/confess_v2/pb/generated/confess_v2.pb.dart';
import 'confess_v2_data.dart';

/// 表白活动相关view model
/// [sendGiftViewModel] - 想对你说ViewModel
/// [squareViewModel] - 表白广场ViewModel
class ConfessV2ViewModel extends AbsRoomModel {
  /// 是否在加载中
  bool isLoading = false;

  /// 表白广场ViewModel
  late ConfessV2SquareViewModel squareViewModel;

  /// 想对你说送礼物ViewModel
  late ConfessV2SendGiftViewModel sendGiftViewModel;

  ConfessV2ViewModel(super.value);

  @override
  AbsRoomMsgHandler createMsgHandler(AbsRoomModel model, ChatRoomData room) =>
      ConfessV2MsgHandler(this, room);

  @override
  void init(ChatRoomData room) {
    super.init(room);

    squareViewModel = ConfessV2SquareViewModel();
    sendGiftViewModel = ConfessV2SendGiftViewModel(room);

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
  _onEventRoomRefresh(String type, Object? data) {
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
      Fluttertoast.showToast(msg: '未选择对象');
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
      {required List<ConfessV2RoomPosition> users,
      required ConfessStage gift,
      int giftNum = 1}) async {
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

    /// 先判断是否余额不足
    SheetCallback? result = await payManager.showRechargeSheet(
        System.context, gift.price * giftNum);
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
            'cid': 0,
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
}
