import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:gift/slp_src/gift_api.dart';

const String graffitiAreaKey = 'graffitiAreaKey';
const String giftTipsKey = 'giftTipsKey';
const String giftListKey = 'giftListKey';
const String userListKey = 'userListKey';
const String moneyKey = 'moneyKey';

/// 涂鸦礼物控制器
class GraffitiGiftController extends GetxController {
  final ChatRoomData room;

  /// 单人打赏uid
  final int uid;

  GraffitiGiftController(this.room, this.uid);

  ScreenStatus _screenStatus = ScreenStatus.Loading;

  ScreenStatus get screenStatus => _screenStatus;

  final List<BbGiftPanelGift> _giftList = [];

  List<BbGiftPanelGift> get giftList => _giftList;

  int _money = 0;

  int get money => _money;

  /// 用户列表
  final List<RoomPosition> _userList = [];

  List<RoomPosition> get userList => _userList;

  /// 是否显示送礼人列表
  bool get showUserList => _userList.isNotEmpty;

  /// 选中的uid
  final List<int> _selectedUids = [];

  List<int> get selectedUids => _selectedUids;

  /// 是否全麦
  bool get isAllSelected => _selectedUids.length == _userList.length;

  /// 选中的礼物
  BbGiftPanelGift? _selectedGift;

  BbGiftPanelGift? get selectedGift => _selectedGift;

  /// 能否涂鸦
  bool get canGraffiti => _selectedGift != null;

  /// 涂鸦点位列表
  final List<List<Offset>> _srcList = [];

  List<List<Offset>> get srcList => _srcList;

  /// 涂鸦控件的尺寸
  Offset? _sizeOffset;

  /// 涂鸦点位数量
  int get graffitiPointCount {
    int count = 0;
    for (var list in _srcList) {
      count += list.length;
    }
    return count;
  }

  /// 是否显示礼物价格提示(已选中礼物+选中用户数量大于0+涂鸦点位大于0)
  bool get showGiftTips =>
      canGraffiti && _selectedUids.isNotEmpty && _srcList.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    _initUserList();
    _selectAllUser();
    loadGraffitiGiftList();
  }

  void _initUserList() {
    if (uid > 0) {
      // 单人打赏,不显示送礼人列表
      _selectedUids.add(uid);
    } else {
      IGiftManager giftManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
      List<RoomPosition> list =
          giftManager.getGiftUsers(room) as List<RoomPosition>;
      _userList.addAll(list.where((e) => e.uid > 0 && e.uid != Session.uid));
    }
  }

  /// 加载涂鸦礼物列表
  Future<void> loadGraffitiGiftList({bool isRetry = true}) async {
    if (isRetry) {
      _screenStatus = ScreenStatus.Loading;
      update([giftListKey]);
    }
    ResGraffitiGift resp = await GiftApi.getGraffitiGiftList();
    if (resp.success && resp.data.list.isNotEmpty) {
      _giftList.clear();
      _giftList.addAll(
        resp.data.list.map(
          (e) => BbGiftPanelGift(
            id: e.id,
            name: e.name,
            price: e.price,
            icon: Util.giftImgUrl(e.id),
          ),
        ),
      );
      _selectedGift = _giftList.first;
      _money = resp.data.money;
      _screenStatus = ScreenStatus.Ready;
    } else {
      _screenStatus = ScreenStatus.Error;
    }
    update([graffitiAreaKey, giftListKey, moneyKey]);
  }

  /// 用户是否选中
  bool isUserSelected(int uid) => _selectedUids.contains(uid);

  /// 用户点击
  void onUserTap(int uid) {
    if (isUserSelected(uid)) {
      // 之前是选中状态,需要从选中列表中移除
      _selectedUids.remove(uid);
    } else {
      // 之前非选中状态,需添加到选中列表
      _selectedUids.add(uid);
    }
    update([giftTipsKey, userListKey]);
  }

  /// 全选/取消全选
  void onAllUserSelected() {
    if (isAllSelected) {
      _selectedUids.clear();
    } else {
      _selectedUids.clear();
      _selectAllUser();
    }
    update([giftTipsKey, userListKey]);
  }

  /// 全选
  void _selectAllUser() {
    _selectedUids.addAll(_userList.map((e) => e.uid));
  }

  /// 是否选中的礼物
  bool isGiftSelected(BbGiftPanelGift gift) => gift.id == _selectedGift?.id;

  /// 点击礼物
  Future<void> onGiftTap(BbGiftPanelGift gift) async {
    if (isGiftSelected(gift)) return; // 切换礼物时才需刷新
    if (_selectedGift != null && _srcList.isNotEmpty) {
      // 切换礼物时,需要提示用户
      var result = await showDialog(
        context: System.context,
        builder: (context) => ConfirmDialog(
          title: K.graffiti_gift_change_title,
          content: K.graffiti_gift_change_content,
        ),
      );
      if (result != true) return;
    }
    _selectedGift = gift;
    _srcList.clear();
    update([graffitiAreaKey, giftListKey, giftTipsKey]);
  }

  /// 涂鸦点位添加
  void onPointAdded(Offset sizeOffset) {
    _sizeOffset = sizeOffset;
    update([giftTipsKey]);
  }

  /// 撤销一笔
  void onCancelDraw() {
    if (_srcList.isNotEmpty) {
      // 每一笔的所有点在同一个list中
      _srcList.removeLast();
      update([graffitiAreaKey, giftTipsKey]);
    }
  }

  /// 清除画布
  void onClearDraw() {
    if (_srcList.isNotEmpty) {
      _srcList.clear();
      update([graffitiAreaKey, giftTipsKey]);
    }
  }

  /// 充值
  void recharge(BuildContext context) {
    ISettingManager? manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    manager?.openRechargeScreen(context, refer: 'gift');
  }

  /// 发送涂鸦礼物
  Future<void> sendGraffitiGift(BuildContext context) async {
    if (_selectedGift == null || _srcList.isEmpty || _sizeOffset == null)
      return;
    if (_selectedUids.isEmpty) {
      Fluttertoast.showCenter(msg: K.please_selecet_a_target_at_least);
      return;
    }

    List<List<String>> points = [];
    for (var list in _srcList) {
      points.addAll(
          list.map((e) => [e.dx.toStringAsFixed(2), e.dy.toStringAsFixed(2)]));
    }
    _pay(context, points);
  }

  /// 支付
  Future<void> _pay(BuildContext context, List<List<String>> points) async {
    int giftNum = points.fold(0, (sum, list) => sum + list.length) ~/ 2;
    int totalPrice = _selectedGift!.price * giftNum * _selectedUids.length;
    IPayManager payManager0 =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result =
        await payManager0.showRechargeSheet(context, totalPrice);
    if (result == null ||
        result.value == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    // 添加控件尺寸
    points.insert(0, [
      _sizeOffset!.dx.toStringAsFixed(2),
      _sizeOffset!.dy.toStringAsFixed(2)
    ]);

    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    payManager.pay(
      context,
      key: 'gift',
      type: result.value!.key,
      refer: 'graffiti_gift',
      args: {
        'money': totalPrice,
        'type': 'package',
        'params': {
          'rid': room.rid,
          'uids': _selectedUids.join(','),
          'positions': _userList
              .where((e) => _selectedUids.contains(e.uid))
              .map((e) => e.position)
              .toList(),
          'position': ChatRoomUtil.getPositionByServer()?.position ?? -1,
          'giftId': _selectedGift!.id,
          'giftNum': giftNum,
          'price': _selectedGift!.price,
          'version': 2,
          'gift_type': 'normal',
          'all_mic': isAllSelected ? 1 : 0,
          'graffiti_feature': points,
        },
      },
      showLoading: true,
      onPayed: () => Navigator.of(context).pop(),
    );
  }
}
