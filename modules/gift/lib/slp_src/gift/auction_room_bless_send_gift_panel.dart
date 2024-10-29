import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';
import '../../k.dart';
import '../../src/widget/normal_combo_gift_widget.dart';
import '../widget/slp_gift_num_select_widget.dart';
import '../widget/slp_page_gift_item_big.dart';

class AuctionRoomBlessSendGiftPanel extends StatefulWidget {
  final int uid;
  final String name;
  final String icon;
  final int rid;

  const AuctionRoomBlessSendGiftPanel(
      {super.key,
      required this.uid,
      required this.name,
      required this.icon,
      required this.rid});

  @override
  AuctionRoomBlessSendGiftState createState() {
    return AuctionRoomBlessSendGiftState();
  }
}

class AuctionRoomBlessSendGiftState
    extends State<AuctionRoomBlessSendGiftPanel> {
  BalanceInfo? _balanceInfo;
  IPayManager? _payManager;

  BbGiftPanelGift? _item;

  int _selectGiftNum = 1; // 打赏礼物数量
  final GlobalKey _selectNumKey = GlobalKey();

  bool _showCombo = false;
  final GlobalKey<NormalComboGiftWidgetState> _comboWidgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    load();

    eventCenter.addListener(EventConstant.EventUserMoneyChange, _onMoneyChange);
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        EventConstant.EventUserMoneyChange, _onMoneyChange);
    _comboWidgetKey.currentState?.endCombo();
    super.dispose();
  }

  _onMoneyChange(String type, dynamic value) async {
    _loadMoney();
  }

  void _loadMoney() async {
    _balanceInfo = await BalanceInfo.loadBalanceInfo();
    refresh();
  }

  void load() async {
    try {
      String url = '${System.domain}go/yy/gift/och?rid=${widget.rid}';
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      ResOchGiftList res = ResOchGiftList.fromBuffer(response.bodyBytes);
      if (res.success) {
        _loadMoney();
        if (res.data.list.isNotEmpty == true) {
          _item = res.data.list[0];
        }
        refresh();
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// do nothing
      },
      child: Container(
        width: Util.width,
        height: 350,
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          ),
          color: Color(0xFF171621),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitleByAuction(),
                Divider(
                  color: Colors.white.withOpacity(0.1),
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                Expanded(
                  child: _buildGiftItem(_item),
                ),
                _buildHandleBar(_item),
                SizedBox(
                    height: Util.iphoneXBottom > 0 ? Util.iphoneXBottom : 0),
              ],
            ),
            if (_showCombo)
              PositionedDirectional(
                end: 12,
                width: 60,
                height: 60,
                bottom: Util.iphoneXBottom,
                child: NormalComboGiftWidget(
                  _comboFinished,
                  _comboPay,
                  key: _comboWidgetKey,
                ),
              ),
          ],
        ),
      ),
    );
  }

  _comboFinished() {
    _showCombo = false;
    refresh();
  }

  _comboPay() {
    _submit(true);
  }

  Widget _buildTitleByAuction() {
    return Container(
      width: Util.width,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: AlignmentDirectional.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CommonAvatar(
            path: widget.icon,
            size: 28,
            shape: BoxShape.circle,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              widget.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 26),
        ],
      ),
    );
  }

  Widget _buildGiftItem(BbGiftPanelGift? gift) {
    if (gift == null) return const SizedBox.shrink();
    return SlpPageGiftItemBig(
      key: ValueKey('${gift.id}'),
      gift: gift,
    );
  }

  /// 操作条
  Widget _buildHandleBar(BbGiftPanelGift? gift) {
    List<Widget> widgets = [];

    if (gift == null || gift.id <= 0) return const SizedBox.shrink();

    int realTotalMoney = _balanceInfo?.available ?? 0;
    widgets = [
      Image.asset(MoneyConfig.moneyIcon, width: 24, height: 24),
      const SizedBox(width: 2),
      Container(
        constraints: const BoxConstraints(maxWidth: 168),
        child: FittedBox(
          fit: BoxFit.contain,
          child: NumText(
            MoneyConfig.moneyNum(realTotalMoney, fractionDigits: 2),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          ISettingManager? manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_SETTINGS);
          manager?.openRechargeScreen(context, refer: 'gift');
        },
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                K.gift_recharge,
                style: TextStyle(
                  color: R.color.mainBrandColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.navigate_next,
                color: R.color.mainBrandColor,
                size: 18,
              ),
            ],
          ),
        ),
      ),
      const Spacer(),
      // 选择数量
      if (!_showCombo)
        GestureDetector(
          onTap: _switchNum,
          child: Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: R.color.mainBrandColor, width: 1),
              borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(16),
                  bottomStart: Radius.circular(16)),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 4),
                  child: Text(
                    "x$_selectGiftNum",
                    style: TextStyle(
                      color: R.color.mainBrandColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                R.img(Assets.ic_up_arrow_svg,
                    width: 16,
                    height: 16,
                    color: R.color.mainBrandColor,
                    package: ComponentManager.MANAGER_GIFT,
                    key: _selectNumKey),
              ],
            ),
          ),
        ),
      // 赠送按钮
      if (!_showCombo)
        GestureDetector(
          onTap: () {
            _submit(false);
          },
          child: Container(
            width: 60,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
              borderRadius: const BorderRadiusDirectional.only(
                topEnd: Radius.circular(16),
                bottomEnd: Radius.circular(16),
              ),
            ),
            child: Text(
              K.give_something,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
    ];

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: 52,
      alignment: Alignment.center,
      child: Row(
        children: widgets,
      ),
    );
  }

  _switchNum() async {
    RenderBox rowRenderBox =
        _selectNumKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset =
        rowRenderBox.localToGlobal(Offset(rowRenderBox.size.width / 2.0, -20));

    List<BbGiftPanelChooseNumConfig> chooseNumConfig = [
      BbGiftPanelChooseNumConfig(num: 1, desc: '一心一意'),
      BbGiftPanelChooseNumConfig(num: 2, desc: '二人同心'),
      BbGiftPanelChooseNumConfig(num: 3, desc: '三生三世'),
      BbGiftPanelChooseNumConfig(num: 5, desc: '五福临门'),
      BbGiftPanelChooseNumConfig(num: 8, desc: '八方来财'),
      BbGiftPanelChooseNumConfig(num: 10, desc: '十全十美'),
      BbGiftPanelChooseNumConfig(num: 13, desc: '一生定情')
    ];

    SlpGiftNumSelectWidget.show(
            context, chooseNumConfig, _selectGiftNum, offset)
        .then((value) {
      if (Util.parseInt(value?[0]) > 0) {
        if (mounted) {
          setState(() {
            _selectGiftNum = value![0];
          });
        }
      }
    });
  }

  int get totalMoney => _selectGiftNum * (_item?.price ?? 0);

  bool _isPaying = false;

  void _submit(bool isCombo) async {
    if (_isPaying) {
      return;
    }
    _displayPay(isCombo);
  }

  _displayPay(bool isCombo) async {
    SheetCallback? result =
        await _payManager!.showRechargeSheet(context, totalMoney);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }
    _pay(result.value?.key, isCombo);
  }

  void _pay(String? type, bool isCombo) {
    _isPaying = true;
    ChatRoomData? room = ChatRoomData.getInstance();
    _payManager!.pay(context,
        key: 'gift',
        type: type ?? '',
        args: {
          'money': totalMoney,
          'type': 'package',
          'params': {
            'rid': room?.rid,
            'uids': '${widget.uid}',
            'positions':
                '${ChatRoomUtil.getPositionByUid(widget.uid)?.position ?? ''}',
            'position': '${ChatRoomUtil.getPositionByServer()?.position ?? ''}',
            'giftId': _item?.id ?? '',
            'giftNum': _selectGiftNum,
            'price': _item?.price ?? '',
            'cid': 0,
            'ctype': '',
            'duction_money': 0,
            'version': 2,
            'num': _selectGiftNum,
            'gift_type': 'normal',
            'refer': '${room?.refer}:room',
            if (isCombo) 'combo_id': _item?.id ?? '',
            'och': '1',
          }
        },
        showLoading: (type != IPayManager.pTAvailable),
        onPayed: () => _onPayed(isCombo),
        onError: _onPayError);
  }

  void _onPayError(bool isErrorCatch) {
    _isPaying = false;
  }

  void _onPayed(bool isCombo) {
    _isPaying = false;
    ChatRoomData? room = ChatRoomData.getInstance();

    Map<String, dynamic> properties = <String, dynamic>{
      'scene': 'room',
      'rid': room?.rid,
      'gift_name': _item?.name,
      'gift_id': _item?.id,
      'gift_price': _item?.price,
      'gift_num': _selectGiftNum,
      'user_num': 1,
      'total_price': totalMoney,
      'gift_type': 'normal',
      'chat_room_type': room?.config?.type,
      'chat_room_property': room?.config?.property.toString(),
      'chat_room_types': room?.config?.types.toString(),
      'is_combo': isCombo ? 1 : 2,
      if (!Util.isNullOrEmpty(room?.config?.typeName))
        'type_label': room?.config?.typeName,
      if (!Util.isNullOrEmpty(room?.config?.originalRFT))
        'room_factory_type': room?.config?.originalRFT,
      if (!Util.isNullOrEmpty(room?.config?.settlementChannel))
        'settlement_channel': room?.config?.settlementChannel,
    };
    if (isCombo) {
      properties['combo_num'] = 1;
    }
    String roomType = room?.config?.type ?? '';
    properties['time'] = DateTime.now().millisecondsSinceEpoch;
    properties['room_type'] = roomType;

    properties['to_uid'] = widget.uid;
    Tracker.instance.track(TrackEvent.send_gift, properties: properties);

    if (isCombo) {
      Map<String, dynamic> map = {
        'rid': room?.rid,
        'gift_id': _item?.id,
        'gift_name': _item?.name,
        'gift_type': 'normal',
        'room_type': room?.config?.type,
        'room_types': room?.config?.types.toString(),
        'room_property': room?.config?.property.toString(),
        'gift_price': _item?.price,
        'recipient_num': 1
      };
      Tracker.instance.track(TrackEvent.gift_combo, properties: map);
    }
    if (!isCombo) {
      Fluttertoast.showToast(msg: K.reward_suc, gravity: ToastGravity.BOTTOM);
      _showCombo = true;
      refresh();
    }

    eventCenter.emit("Gift.SendSuccess");
  }
}
