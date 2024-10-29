import 'package:shared/assets.dart';
import 'package:gift/k.dart';
import 'package:shared/k.dart' as BaseK;
import 'dart:math';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift/slp_src/model/pb/slp_gift_extension.dart';
import '../../assets.dart';
import '../diy_gift/slp_diy_gift_panel.dart';
import '../widget/slp_gift_num_select_widget.dart';

/// 按打赏对象解锁礼物面板
class SlpReceiverLockGift extends StatefulWidget {
  final BbGiftPanelExtend? accountMoney;
  final BbGiftPanelGift? gift;
  final List<RoomPosition>? inMicUids;

  /// 麦上用户，用于查询position
  final List<BbGiftPanelChooseNumConfig>? chooseNumConfig;
  final int rid;
  final String? refer;
  final int myPosition;
  final bool isInRoom;

  /// chat: uid  room: 单人打赏的id
  final int id;

  final bool fromChat;

  // 是否显示亲密付
  final bool showIntimate;

  const SlpReceiverLockGift({
    super.key,
    this.accountMoney,
    this.gift,
    this.inMicUids,
    this.chooseNumConfig,
    this.rid = 0,
    this.refer,
    this.myPosition = 0,
    this.id = 0,
    this.isInRoom = false,
    this.fromChat = false,
    required this.showIntimate,
  });

  @override
  SlpReceiverLockGiftState createState() {
    return SlpReceiverLockGiftState();
  }

  static Future<bool?> show(
    BuildContext context, {
    BbGiftPanelExtend? accountMoney,
    BbGiftPanelGift? gift,
    List<RoomPosition>? inMicUids,
    List<BbGiftPanelChooseNumConfig>? chooseNumConfig,
    int rid = 0,
    String? refer,
    int myPosition = 0,
    int id = 0,
    bool isInRoom = false,
    bool fromChat = false,
    required bool showIntimate,
  }) {
    return displayModalBottomSheet(
        context: context,
        maxHeightRatio: 504 / Util.height,
        settings: const RouteSettings(name: '/receiver_lock_gift_panel'),
        builder: (BuildContext context) {
          return SlpReceiverLockGift(
            accountMoney: accountMoney,
            gift: gift,
            inMicUids: inMicUids,
            chooseNumConfig: chooseNumConfig,
            rid: rid,
            refer: refer,
            myPosition: myPosition,
            id: id,
            isInRoom: isInRoom,
            fromChat: fromChat,
            showIntimate: showIntimate,
          );
        });
  }
}

class SlpReceiverLockGiftState extends State<SlpReceiverLockGift> {
  /// 解锁了该礼物的GS列表
  ResGiftSuperGsList? gsList;

  final GlobalKey _selectNumKey = GlobalKey();
  int _selectGiftNum = 1; // 打赏礼物数量
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  List<int> selectUids = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    String url = '${System.domain}go/yy/gift/superGsList';
    try {
      String uids;
      if (Util.parseInt(widget.id) > 0) {
        /// 私聊，房间单人打赏
        uids = '${widget.id}';
      } else {
        List<int> users = [];
        widget.inMicUids?.forEach((element) {
          if (element.uid > 0 && element.uid != Session.uid) {
            users.add(element.uid);
          }
        });
        uids = users.join(',');
      }
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'uids': uids, 'gift_id': '${widget.gift?.id ?? 0}'},
          pb: true,
          throwOnError: true);
      gsList = ResGiftSuperGsList.fromBuffer(response.bodyBytes);
    } catch (e) {
      gsList = ResGiftSuperGsList(msg: e.toString(), success: false);
    }

    if (mounted) {
      setState(() {
        if (Util.validList(gsList?.data.users)) {
          /// 默认全选
          gsList?.data.users.forEach((element) {
            selectUids.add(element.uid);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: 504,
      padding: const EdgeInsetsDirectional.only(bottom: 34),
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(16), topEnd: Radius.circular(16)),
        color: R.color.mainBgColor,
      ),
      child: Column(
        children: [
          Container(
            width: Util.width,
            height: 48,
            alignment: AlignmentDirectional.center,
            child: Text(
              '${widget.gift?.privilege.receiverTag ?? ''}${K.gift_privilege}${K.gift}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: R.color.mainTextColor,
              ),
            ),
          ),
          Expanded(child: _buildGiftAndGs()),
          if (Util.validList(gsList?.data.users)) _buildHandleBar(),
        ],
      ),
    );
  }

  Widget _buildGiftAndGs() {
    return CustomScrollView(
      slivers: [
        _buildGift(),
        ..._buildGs(),
      ],
    );
  }

  List<Widget> _buildGs() {
    List<Widget> widgets = [];
    if (gsList == null) {
      widgets.add(SliverToBoxAdapter(
        child: Container(
          width: 227,
          height: 227,
          alignment: AlignmentDirectional.center,
          child: const CupertinoActivityIndicator(),
        ),
      ));
    } else if (!Util.validList(gsList?.data.users)) {
      String text = K.gift_receiver_lock_no_user(
          [widget.gift?.privilege.receiverTag ?? '']);
      if (gsList?.success != true && Util.validStr(gsList?.msg)) {
        text = gsList?.msg ?? '';
      }
      widgets.add(SliverToBoxAdapter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: Util.width - 40,
              height: 1,
              color: R.color.secondBgColor,
              margin: const EdgeInsetsDirectional.only(
                  start: 20, end: 20, top: 58, bottom: 10),
            ),
            R.img(
              BaseAssets.bb_null_webp,
              width: 180,
              height: 180,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: R.color.secondTextColor,
              ),
            ),
          ],
        ),
      ));
    } else {
      widgets.add(_buildGsTitle());
      widgets.add(
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _buildGsItem(gsList?.data.users[index]);
            },
            childCount: gsList?.data.users.length ?? 0,
          ),
        ),
      );
    }

    return widgets;
  }

  Widget _buildGsTitle() {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 46,
          ),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Text(
                K.gift_receiver_lock_gs_title(
                    [widget.gift?.privilege.receiverTag ?? '']),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: R.color.mainTextColor,
                  height: 1.1,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (selectUids.length == gsList?.data.users.length) {
                      selectUids.clear();
                    } else {
                      selectUids.clear();
                      gsList?.data.users.forEach((element) {
                        selectUids.add(element.uid);
                      });
                    }
                  });
                },
                child: Container(
                  width: 68,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(14),
                    border: Border.all(
                        width: 1,
                        color: R.color.mainTextColor.withOpacity(0.1)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      SelectedIcon(
                        size: 14,
                        selected:
                            selectUids.length == gsList?.data.users.length,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        K.gift_choose_all,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: R.color.secondTextColor,
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildGsItem(GiftSuperGsUser? item) {
    return Container(
      width: Util.width - 32,
      height: 76,
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 12),
      decoration: BoxDecoration(
        color: R.color.secondBgColor,
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 16, top: 16, bottom: 20, end: 12),
            child: CommonAvatar(
              path: item?.icon ?? '',
              shape: BoxShape.circle,
              size: 40,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              SizedBox(
                width: Util.width - 84 - 76,
                child: Text(
                  item?.name ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: R.color.mainTextColor,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UserSexAndAgeWidget(
                    sex: item?.sex,
                    age: item?.age,
                  ),
                  UserPopularity(
                    popularityLevel: item?.popularityLevel,
                    height: 22,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (selectUids.contains(item?.uid ?? 0)) {
                  selectUids.remove(item?.uid ?? 0);
                } else {
                  selectUids.add(item?.uid ?? 0);
                }
              });
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 26, bottom: 26, start: 24, end: 12),
              child: SelectedIcon(
                selected: selectUids.contains(item?.uid ?? 0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGift() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(12),
              color: R.color.secondBgColor,
            ),
            alignment: AlignmentDirectional.center,
            child: CachedNetworkImage(
              imageUrl: (widget.gift?.giftIcon ?? '') + Util.getGiftUrlSuffix(),
              width: 60,
              height: 60,
              cachedWidth: Util.getCommonCacheSize(60),
              cachedHeight: Util.getCommonCacheSize(60),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            widget.gift?.name ?? '',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: R.color.mainTextColor,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(MoneyConfig.moneyIcon, width: 16, height: 16),
              const SizedBox(
                height: 2,
              ),
              Text(
                MoneyConfig.moneyNum(Util.parseInt((widget.gift?.price))),
                style: TextStyle(
                  fontSize: 13,
                  color: R.color.secondTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiyButton() {
    return GestureDetector(
      onTap: showDiy,
      child: Container(
        height: 52,
        width: Util.width - 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(26),
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          BaseK.K.base_next_step,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void showDiy() async {
    /// 进入diy礼物编辑页面
    if (!(ModalRoute.of(context)?.isCurrent ?? false)) return;
    BbGiftPanelGift? gift = widget.gift;
    if (gift == null) return;

    int userNum = selectUids.length;
    if (userNum <= 0) {
      Fluttertoast.showToast(
          msg: K.please_selecet_a_target_at_least,
          gravity: ToastGravity.CENTER);
      return;
    }

    List<RoomPosition> select = [];

    for (int uid in selectUids) {
      RoomPosition? user = widget.inMicUids?.firstWhereOrNull(
        (element) => (element.uid == uid),
      );
      if (user != null) {
        select.add(user);
      }
    }

    bool? send = await SlpDiyGiftPanel.show(
      context,
      accountMoney: widget.accountMoney,
      gifts: widget.gift?.diyGift,
      inMicUids: select,
      chooseNumConfig: widget.chooseNumConfig,
      rid: widget.rid,
      refer: widget.refer,
      myPosition: widget.myPosition,
      fromChat: widget.fromChat,
      showIntimate: widget.showIntimate,
    );

    if (send == true && (ModalRoute.of(context)?.isCurrent ?? false)) {
      Navigator.of(context).pop(true);
    }
  }

  /// 操作条
  Widget _buildHandleBar() {
    if ((widget.gift?.isDiyGift ?? false) && !(widget.gift?.isUnity ?? false)) {
      /// diy礼物展示下一步button
      return _buildDiyButton();
    }

    List<Widget> widgets = [];
    double ratio = min(Util.ratio, 1);

    double numMaxWidth = 168 * Util.ratio;
    int realTotalMoney = widget.accountMoney?.totalMoney ?? 0;
    widgets = [
      Image.asset(MoneyConfig.moneyIcon, width: 24 * ratio, height: 24 * ratio),
      SizedBox(width: 2 * ratio),
      Container(
        constraints: BoxConstraints(maxWidth: numMaxWidth),
        child: FittedBox(
          fit: BoxFit.contain,
          child: NumText(
            MoneyConfig.moneyNum(realTotalMoney, fractionDigits: 2),
            style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 15 * ratio,
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
          padding: EdgeInsetsDirectional.only(start: 4 * ratio, end: 4 * ratio),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                K.gift_recharge,
                style: TextStyle(
                  color: R.color.mainBrandColor,
                  fontSize: 15 * ratio,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.navigate_next,
                color: R.color.mainBrandColor,
                size: 18 * ratio,
              ),
            ],
          ),
        ),
      ),
    ];

    widgets.addAll([
      const Spacer(),
      // 选择数量
      GestureDetector(
        onTap: _switchNum,
        child: Container(
          width: 60 * ratio,
          height: 30 * ratio,
          decoration: BoxDecoration(
            border: Border.all(color: R.color.mainBrandColor, width: 1),
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(16 * ratio),
              bottomStart: Radius.circular(16 * ratio),
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.only(end: 4 * ratio),
                child: Text(
                  "x$_selectGiftNum",
                  style: TextStyle(
                    color: R.color.mainBrandColor,
                    fontSize: 13 * ratio,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              R.img(Assets.ic_up_arrow_svg,
                  width: 16 * ratio,
                  height: 16 * ratio,
                  color: R.color.mainBrandColor,
                  package: ComponentManager.MANAGER_GIFT,
                  key: _selectNumKey),
            ],
          ),
        ),
      ),
      // 赠送按钮
      GestureDetector(
        onTap: () {
          _submit();
        },
        child: Container(
          width: 60 * ratio,
          height: 30 * ratio,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(16 * ratio),
              bottomEnd: Radius.circular(16 * ratio),
            ),
          ),
          child: Text(
            K.give_something,
            style: TextStyle(
                color: Colors.white,
                fontSize: 13 * ratio,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ]);

    return Container(
      padding: EdgeInsets.only(left: 16 * ratio, right: 16 * ratio),
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

    List<BbGiftPanelChooseNumConfig>? chooseNumConfig = widget.chooseNumConfig;

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

  bool _tryUseAvailable = false; // 尝试使用余额支付
  int _cid = 0; // 背包礼物id
  String _ctype = ''; // // 背包礼物类型
  int _ductionMoney = 0; // 优惠金额
  int _onlyNewPay = 0; // 是否限制为仅新支付账户可用
  int _state = 0; // 券状态，只有账户充值后，才能使用优惠券，避免小号刷券
  int _totalNum = 0;
  int _giftPrice = 0; // 礼物单价
  int _totalPrice = 0; // 礼物总价
  String? _giftType; // 礼物类型：normal、coin（金币礼物,只能用金币赠送）、bean(金豆礼物)
  bool _isPaying = false;

  _submit() async {
    if (!(ModalRoute.of(context)?.isCurrent ?? false)) return;
    BbGiftPanelGift? gift = widget.gift;
    if (gift == null) return;

    int userNum = selectUids.length;
    if (userNum <= 0) {
      Fluttertoast.showToast(
          msg: K.please_selecet_a_target_at_least,
          gravity: ToastGravity.CENTER);
      return;
    }
    int finalGiftNum = _selectGiftNum;
    if (finalGiftNum <= 0) {
      Fluttertoast.showToast(
          msg: K.please_select_a_gift_num, gravity: ToastGravity.CENTER);
      return;
    }

    _giftType = gift.giftType;

    _giftPrice = gift.price;

    if (_giftPrice <= 0) return;

    _ctype = gift.ctype;
    _cid = gift.cid;
    int cnum = gift.cnum; // 如果背包有该礼物，则返回礼物数量
    Log.d('_submit:$cnum');
    // 重置
    _ductionMoney = 0;
    _onlyNewPay = 0;
    _state = 0;

    if (_cid > 0 &&
        (((_ctype == 'gift' || _ctype == 'key' || _ctype == 'pub_drink') &&
                cnum >= finalGiftNum * userNum) ||
            (_ctype == 'coupon' && cnum >= 1))) {
      _ductionMoney = gift.ductionMoney;
      _onlyNewPay = gift.onlyNewpay;
      _state = gift.state;
    } else {
      _cid = 0;
      _ctype = '';
    }

    _totalPrice = _giftPrice * finalGiftNum * userNum;

    _totalNum =
        _cid > 0 && ((_ctype == 'key') && cnum >= finalGiftNum * userNum)
            ? 0
            : finalGiftNum * userNum;

    int realTotalMoney = widget.accountMoney?.totalMoney ?? 0;

    if (gift.giftType == 'coin' || gift.giftType == 'bean') {
      // 金币礼物，客户端不做金币和背包是否有足够的判断，错误提示由后台返回
      _pay('available');
      return;
    } else if (_cid > 0 && _ctype == 'coupon') {
      if (Util.isAndroid && !Util.isLocale) {
        if ((_onlyNewPay <= 0 || _state > 0) &&
            realTotalMoney + _ductionMoney >= _totalPrice) {
          _tryUseAvailable = true;
          _pay('available');
          return;
        } else {
          _displayDiscount();
        }
      } else {
        if ((_onlyNewPay <= 0 || _state > 0) &&
            realTotalMoney + _ductionMoney >= _totalPrice) {
          _tryUseAvailable = true;
          _pay('available');
        } else {
          _displayPay();
        }
      }
    } else if (realTotalMoney >= _totalPrice ||
        (_cid > 0 && (_ctype == 'gift' || _ctype == 'pub_drink')) ||
        _totalNum == 0) {
      // _totalNum == 0时，表示背包有足够的钥匙，可以直接支付
      _tryUseAvailable = true;
      _pay('available');
    } else {
      _displayPay();
    }
  }

  _displayDiscount() async {
    SheetCallback? result = await _payManager.showRechargeSheet(
        context, (_totalPrice) - (_ductionMoney));
    if (result == null || result.reason == SheetCloseReason.Active) {
      _isPaying = false;
      return;
    }

    if (result.value?.key == null) {
      _isPaying = false;
      return;
    }

    if (result.value?.key == IPayManager.pTRecharge) {
      _isPaying = false;
      return;
    }

    _pay(result.value?.key);
  }

  _displayPay() async {
    SheetCallback? result = await _payManager.showRechargeSheet(
        context, (_totalPrice) - (_ductionMoney));
    if (result == null || result.reason == SheetCloseReason.Active) {
      _isPaying = false;
      return;
    }

    if (_onlyNewPay == 1 && _state == 0 && result.value?.key == 'available') {
      _isPaying = false;
      Toast.showCenter(context, K.please_recharge_first);
      return;
    }

    if (result.value?.key == IPayManager.pTRecharge) {
      _isPaying = false;
      return;
    }

    _pay(result.value?.key);
  }

  _pay(String? type) {
    int finalGiftNum = _selectGiftNum;
    if (_isPaying) return;
    _isPaying = true;

    if (widget.isInRoom == true) {
      _payManager.pay(context,
          key: 'gift',
          type: type ?? '',
          refer: 'gift',
          args: {
            'money': _totalPrice,
            'type': 'package',
            'params': {
              'rid': widget.rid,
              'uids': selectUids.join(','),
              'positions': _getSelectPosition().join(','),
              'position': widget.myPosition,
              'giftId': widget.gift?.id ?? 0,
              'giftNum': finalGiftNum,
              'price': _giftPrice,
              'cid': _cid,
              'ctype': _ctype,
              'duction_money': _ductionMoney,
              'version': 2,
              'num': _totalNum,
              'gift_type': _giftType,
              'show_pac_man_guide':
                  Config.getBool('has_show_pac_man_guide', false) ? 0 : 1,
              'refer': '${widget.refer}:room',
            }
          },
          onPayed: () => _onPayed(),
          onError: (isErrorCatch) => _onPayError(isErrorCatch),
          onPayAppOpen: () {
            _isPaying = false;
          });
    } else {
      _payManager.pay(context,
          key: 'gift',
          type: type ?? '',
          refer: 'gift',
          args: {
            'money': _totalPrice,
            'type': 'chat-gift',
            'params': {
              'to': widget.id,
              'giftId': widget.gift?.id ?? 0,
              'giftNum': finalGiftNum,
              'cid': _cid,
              'ctype': _ctype,
              'duction_money': _ductionMoney,
              'version': 2,
              'num': _totalNum,
              'gift_type': _giftType,
            }
          },
          onPayed: () => _onPayed(),
          onError: (isErrorCatch) => _onPayError(isErrorCatch),
          onPayAppOpen: () {
            _isPaying = false;
          });
    }
  }

  // 选中的麦序
  List<int> _getSelectPosition() {
    List<int> positions = [];
    if (widget.inMicUids == null || widget.inMicUids?.isEmpty == true) {
      return positions;
    }
    for (int i = 0; i < widget.inMicUids!.length; ++i) {
      RoomPosition p = widget.inMicUids![i];
      if (selectUids.contains(p.uid)) {
        positions.add(p.position);
      }
    }

    return positions;
  }

  void _onPayed() {
    _isPaying = false;
    int finalGiftNum = _selectGiftNum;

    ChatRoomData? room =
        widget.isInRoom == true ? ChatRoomData.getInstance() : null;

    Map<String, dynamic> properties = <String, dynamic>{
      'scene': 'room',
      'rid': widget.rid,
      'gift_name': widget.gift?.name ?? '',
      'gift_id': widget.gift?.id ?? 0,
      'gift_price': _giftPrice,
      'gift_num': finalGiftNum,
      'user_num': selectUids.length,
      'total_price': _giftPrice * finalGiftNum,
      'gift_type': _giftType,
      'is_combo': 2,
      if (room != null) 'chat_room_type': room.config?.type,
      if (room != null) 'chat_room_property': room.config?.property.toString(),
      if (room != null) 'chat_room_types': room.config?.types.toString(),
      if (!Util.isNullOrEmpty(room?.config?.typeName))
        'type_label': room?.config?.typeName,
      if (!Util.isNullOrEmpty(room?.config?.originalRFT))
        'room_factory_type': room?.config?.originalRFT,
      if (!Util.isNullOrEmpty(room?.config?.settlementChannel))
        'settlement_channel': room?.config?.settlementChannel,
    };

    if (widget.isInRoom == true) {
      String roomType = room?.config?.type ?? '';
      properties['time'] = DateTime.now().millisecondsSinceEpoch;
      properties['room_type'] = roomType;
      properties['refer'] = room?.refer ?? '';
      properties['is_pk'] = false;
      if (room?.config?.game == Games.Wolf) {
        IWereWolfManager wereWolfManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_WERE_WOLF);
        properties['game_type'] = wereWolfManager.getGameType();
      }
    }

    if (widget.isInRoom == true) {
      for (var element in selectUids) {
        properties['to_uid'] = element;
        Tracker.instance.track(TrackEvent.send_gift, properties: properties);
      }
    } else {
      properties['to_uid'] = widget.id;
      Tracker.instance.track(TrackEvent.send_gift, properties: properties);
    }

    _tryUseAvailable = false;
    eventCenter.emit("Gift.SendSuccess");
    if (ModalRoute.of(context)?.isCurrent ?? false) {
      Navigator.of(context).pop(true);
    }
  }

  void _onPayError(bool isErrorCatch) {
    _isPaying = false;
    if (_tryUseAvailable) {
      _tryUseAvailable = false;
      _displayPay();
    }
  }
}
