import 'dart:math';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift/a.dart';
import 'package:gift/slp_src/gift_api.dart';
import 'package:gift/slp_src/widget/slp_piece_bag_bar.dart';
import 'package:gift/src/common.dart';
import 'package:chat_room/chat_room.dart';
import '../../assets.dart';
import '../../k.dart';
import 'slp_page_gift.dart';
import '../model/pb/slp_gift_extension.dart';

typedef BagShowMicUsersCallback = Function(bool show, bool setState);

class SlpPageBag extends StatefulWidget {
  final GiftScene giftScene;
  final BbGiftPanelData? data;
  final ChatRoomData? room;
  final VoidCallback refreshCallback;
  final BagShowMicUsersCallback showMicUsersCallback;
  final OnSelectMicChanged? getSelectUids;
  final bool isCpLinkPromote; //连连看麦位助力打赏
  final int topicId;
  final int defaultId; // 默认选中物品cid

  const SlpPageBag({
    Key? key,
    required this.giftScene,
    this.data,
    required this.refreshCallback,
    required this.showMicUsersCallback,
    required this.defaultId,
    this.room,
    this.getSelectUids,
    this.isCpLinkPromote = false,
    this.topicId = 0,
  }) : super(key: key);

  @override
  SlpPageBagState createState() {
    return SlpPageBagState();
  }
}

class SlpPageBagState extends State<SlpPageBag>
    with AutomaticKeepAliveClientMixin {
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  int _bagId = 0;
  int _num = 1; // 开箱子的数量
  int _star = 0; // xxx类型

  int _selectGiftNum = 1; // 打赏礼物数量

  int _giftPrice = 0; // 礼物单价
  int _totalPrice = 0; // 礼物总价
  int _totalNum = 0;

  ScrollController? controller;
  final int _crossAxisCount = 4;
  final double _childAspectRatio = 0.9;

  // room 相关
  List<RoomPosition> _users = []; // 所有的麦上用户

  bool get _isInRoom {
    return isGiftSceneInRoom(widget.giftScene);
  }

  @override
  void initState() {
    super.initState();
    if (widget.data?.commodities != null &&
        widget.data?.commodities.isNotEmpty == true) {
      int index = 0;
      if (widget.defaultId > 0) {
        int i = 0;
        for (BbGiftPanelCommodities item in widget.data!.commodities) {
          if (item.cid == widget.defaultId) {
            index = i;
            break;
          }
          i++;
        }
        if (index > 0) {
          int scrollIndex = 0;
          if (widget.data!.commodities.length <= 2 * _crossAxisCount ||
              index < _crossAxisCount) {
            // 所有礼物不超过一页不用滚动，（部分手机显示不到3行）
            // 选中礼物在第一屏内不用滚动
            scrollIndex = 0;
          } else {
            scrollIndex = index ~/ _crossAxisCount;
          }
          double initialScrollOffset = scrollIndex *
              ((Util.width - 5 * 2) / _crossAxisCount / _childAspectRatio);
          controller =
              ScrollController(initialScrollOffset: initialScrollOffset);
        }
      }
      int maxNum = widget.data?.commodities[index].maxNum ?? 0;
      _num = min(99, max(1, maxNum));
      _bagId = widget.data?.commodities[index].id ?? 0;
      _star = widget.data?.commodities[index].star ?? 0;
      _onShowMicUsers(init: true);
    }

    _initUsers();
  }

  _initUsers() {
    if (_isInRoom) {
      IGiftManager giftManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
      _users = giftManager.getGiftUsers(widget.room) as List<RoomPosition>;
    }
  }

  @override
  void dispose() {
    _payManager.dispose('gift');
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.data?.commodities == null ||
        widget.data?.commodities.isEmpty == true) {
      return Center(
        child: Text(
          K.empty_bag,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      );
    }
    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            crossAxisCount: _crossAxisCount,
            shrinkWrap: true,
            childAspectRatio: _childAspectRatio,
            controller: controller,
            padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
            children: widget.data?.commodities.isNotEmpty == true
                ? widget.data!.commodities.map((bag) {
                    int bagId = bag.id;
                    bool selected = _bagId == bagId;
                    String icon = '${System.imageDomain}${bag.image}';
                    return InkWell(
                      key: ValueKey('$bagId'),
                      onTap: () {
                        int maxNum = Util.parseInt(bag.maxNum);
                        _bagId = bagId;
                        _onShowMicUsers();
                        setState(() {
                          _num = min(99, max(1, maxNum));
                          _star = bag.star;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.expand,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 70,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      buildImage(icon, bag.type),
                                      _renderCoupon(bag),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 2, start: 2, end: 2),
                                  child: Text(
                                    bag.name,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: _isInRoom || darkMode
                                          ? Colors.white
                                          : R.color.mainTextColor,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 15,
                                  child: _renderPrice(bag),
                                ),
                              ],
                            ),
                            _renderNumBadge(bag),
                            if (selected)
                              R.img(Assets.ic_gift_select_svg,
                                  package: ComponentManager.MANAGER_GIFT,
                                  fit: BoxFit.fill,
                                  color: const Color(0xffC1FF25)),
                          ],
                        ),
                      ),
                    );
                  }).toList()
                : [],
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
          decoration: BoxDecoration(
            // color: _isInRoom ? Color(0xFF1C1C1E) : Colors.transparent,
            border: _isInRoom
                ? null
                : Border(
                    top: BorderSide(
                      color: R.color.dividerColor,
                      width: 0.5,
                    ),
                  ),
          ),
          child: buildBottomBar(context),
        ),
      ],
    );
  }

  Widget buildImage(String icon, String type) {
    if (type == 'header') {
      return UserIconFrame(
        size: _getIconSize(type) ?? 50,
        frameUrl: icon,
      );
    }

    return RepaintBoundary(
      child: CachedNetworkImage(
        placeholder: const CupertinoActivityIndicator(),
        imageUrl: icon,
        height: _getIconSize(type),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget buildBottomBar(BuildContext context) {
    BbGiftPanelCommodities? current = _getCurrentBag();
    if (current == null) {
      return const SizedBox.shrink();
    }
    if (current.type == 'piece') {
      return SlpPieceBagBar(
        id: current.id,
        globalPiece: widget.data?.globalPiece,
        rid: widget.room?.rid ?? 0,
        onCombine: () {
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
        },
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildOpenBoxTips(),
          _buildFooter(),
        ],
      );
    }
  }

  double? _getIconSize(String type) {
    Map<String, double> res = {
      'exp': 35.0,
      'box': 55.0,
      'header': 50.0,
      'mounts': 60.0,
      'title': 60.0,
      'defend': 60.0,
      'gift': 55.0,
      'key': 55.0,
      'radio-defend': 45.0,
      'coupon': 45,
      'piece': 75,
      'bubble': 50,
    };

    return res.containsKey(type) ? res[type] : 50.0;
  }

  /// coupon类型的物品
  Widget _renderCoupon(BbGiftPanelCommodities bag) {
    double ductionMoney = bag.ductionMoney / 100;
    if (bag.type == 'coupon') {
      return Container(
        height: 15,
        constraints: const BoxConstraints(minWidth: 36),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(R.imagePath(Assets.bg_money_png,
              package: ComponentManager.MANAGER_GIFT)),
        )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(MoneyConfig.moneyIcon, width: 10, height: 10),
            NumText(
              (ductionMoney >= 1.0
                  ? MoneyConfig.moneyNum(Util.parseInt(ductionMoney * 100))
                  : MoneyConfig.moneyNum(Util.parseInt(ductionMoney * 100),
                      fractionDigits: 2)),
              style: const TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  /// 物品价格
  Widget _renderPrice(BbGiftPanelCommodities bag) {
    int price = bag.price;
    String priceText;
    if (bag.giftType == 'coin') {
      // 金币礼物
      priceText = '$price${K.gift_coin_unit}';
    } else if (bag.giftType == 'bean') {
      // 金豆礼物
      priceText = '$price${K.gift_gold_bean_unit}';
    } else {
      priceText = MoneyConfig.moneyNum(price) + MoneyConfig.moneyName1;
    }
    if (price > 0 &&
        bag.type != 'header' &&
        bag.type != 'mounts' &&
        bag.type != 'bubble') {
      return Text(
        priceText,
        style: TextStyle(
          color:
              _isInRoom || darkMode ? Colors.white60 : R.color.thirdTextColor,
          fontSize: 10,
        ),
      );
    }
    return Container();
  }

  /// 右上角数量角标
  Widget _renderNumBadge(BbGiftPanelCommodities bag) {
    int num = bag.num;
    String type = bag.type;
    String numStr = num > 9999 ? '9999+' : num.toString();
    if (num <= 1) {
      return Container();
    }

    TextStyle textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    );
    if (type == 'coupon') {
      return PositionedDirectional(
        end: 7,
        top: 4,
        child: Coupon(
          color: R.color.thirdBrightColor,
          child: Container(
            height: 16,
            padding: const EdgeInsetsDirectional.only(start: 2, end: 2),
            constraints: const BoxConstraints(
              minWidth: 26,
            ),
            alignment: Alignment.center,
            child: Text(
              numStr,
              style: textStyle,
            ),
          ),
        ),
      );
    } else {
      return PositionedDirectional(
        end: 7,
        top: 4,
        child: Container(
          height: 16,
          padding: const EdgeInsetsDirectional.only(start: 2, end: 2),
          constraints: const BoxConstraints(
            minWidth: 26,
          ),
          decoration: BoxDecoration(
            color: R.color.thirdBrightColor,
            borderRadius: BorderRadius.circular(8.5),
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            numStr,
            style: textStyle,
          ),
        ),
      );
    }
  }

  BbGiftPanelCommodities? _getCurrentBag() {
    if (widget.data?.commodities != null &&
        widget.data?.commodities.isNotEmpty == true &&
        _bagId > 0) {
      try {
        final ret = widget.data?.commodities.firstWhereOrNull((bag) {
          return bag.id == _bagId;
        });
        if (ret != null) {
          return ret;
        }
        BbGiftPanelCommodities current = widget.data!.commodities[0];
        setState(() {
          _bagId = current.id;
        });
        return current;
      } catch (e) {}
    }
    return null;
  }

  Widget _buildOpenBoxTips() {
    BbGiftPanelCommodities? current = _getCurrentBag();
    if (current != null && (current.type == 'box' || current.type == 'key')) {
      return buildOpenBoxTips(context, widget.giftScene, current.giftImage);
    }
    return const SizedBox();
  }

  /// 操作条
  Widget _buildFooter() {
    BbGiftPanelCommodities? current = _getCurrentBag();
    if (current == null) return Container();

    Log.d('current.type: ${current.type}');

    switch (current.type) {
      case 'gift': // 礼物
      case 'group_pk_coupon': // 团战pk道具
        return _showSendGiftBar(current)
            ? _renderSendGiftBar(current)
            : _renderGiftFooter(current);
      case 'defend': // 守护
      case 'radio-defend': // 电台守护
        return _renderGiftFooter(current);
      case 'title': // 爵位
        return _renderTitleFooter(current);
      case 'coupon':
        return _renderCouponFooter(current);
      case 'header': // 头像框
      case 'mounts': // 坐骑
      case 'bubble': // 聊天气泡
      case 'effect': // 入场特效
      case 'decorate': // 主页装扮
      case 'card_decorate': // 资料卡装扮
      case 'ring': // 麦上光圈
        return _renderHeaderMountsFooter(current);
      case 'box': // 箱子
      case 'key': // 钥匙
        return _renderOpenBox(current);
      case 'expcard': // 道具体验卡
        return _renderExpcardFooter(current);
    }

    return const SizedBox();
  }

  Widget _renderExpcardFooter(BbGiftPanelCommodities current) {
    bool showUse = (current.subType == 'direct-use');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 52,
      alignment: AlignmentDirectional.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              current.description,
              style: TextStyle(
                color: _isInRoom || darkMode
                    ? Colors.white.withOpacity(0.6)
                    : R.color.mainTextColor,
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (showUse) ...[
            const SizedBox(width: 8),
            _buildFooterBtn(K.use_something, () {
              _onTapExpcardUse(current.cid, widget.room?.realRid ?? 0);
            }),
          ],
        ],
      ),
    );
  }

  Future _onTapExpcardUse(int cid, int rid) async {
    NormalNull resp = await GiftApi.useExpcard(cid, rid);
    if (resp.success) {
      Fluttertoast.showCenter(msg: K.gift_prop_use_success);
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    } else {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  bool _showSendGiftBar(BbGiftPanelCommodities current) =>
      ((current.type == 'gift' || current.type == 'group_pk_coupon') &&
          _isInRoom &&
          (current.moneyType == 'money' ||
              current.moneyType == 'coin' ||
              current.moneyType == 'bean'));

  Widget _renderSendGiftBar(BbGiftPanelCommodities bag) {
    double ratio = min(Util.ratio, 1);
    bool showUse = bag.jumpType == 'room' && bag.tryVoice == false;

    List<Widget> widgets = [];
    widgets.add(const Spacer());
    // if (!showUse) {
    //   widgets.add(
    //     GestureDetector(
    //       onTap: () {
    //         _switchNum();
    //       },
    //       child: Container(
    //         width: 60 * ratio,
    //         height: 30 * ratio,
    //         decoration: BoxDecoration(
    //           border: Border.all(color: R.color.mainBrandColor, width: 1),
    //           borderRadius: BorderRadiusDirectional.only(
    //                   topStart: Radius.circular(16 * ratio), bottomStart: Radius.circular(16 * ratio))
    //               .resolve(Directionality.of(context)),
    //         ),
    //         alignment: Alignment.center,
    //         child: Row(
    //           mainAxisSize: MainAxisSize.min,
    //           children: <Widget>[
    //             Padding(
    //               padding: EdgeInsetsDirectional.only(end: 4 * ratio),
    //               child: Text(
    //                 "x$_selectGiftNum",
    //                 style: TextStyle(
    //                   color: R.color.mainBrandColor,
    //                   fontSize: 13 * ratio,
    //                   fontWeight: FontWeight.w500,
    //                 ),
    //               ),
    //             ),
    //             R.img(
    //               Assets.ic_up_arrow_svg,
    //               width: 16 * ratio,
    //               height: 16 * ratio,
    //               color: R.color.mainBrandColor,
    //               package: ComponentManager.MANAGER_GIFT,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }

    widgets.add(
      GestureDetector(
        onTap: () {
          _submit();
        },
        child: Container(
          width: 90 * ratio,
          height: 40 * ratio,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
            //   borderRadius: BorderRadius.circular(16 * ratio)
            // borderRadius: showUse
            //     ? BorderRadius.circular(16 * ratio)
            //     : BorderRadiusDirectional.only(
            //         topEnd: Radius.circular(16 * ratio),
            //         bottomEnd: Radius.circular(16 * ratio),
            //       ),

            gradient: const LinearGradient(
                colors: [Color(0xFFEBFF0F), Color(0xFFC1FF25)]),
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(25 * ratio),
              bottomEnd: Radius.circular(25 * ratio),
              bottomStart: Radius.circular(25 * ratio),
              topStart: Radius.circular(25 * ratio),
            ),
          ),
          child: Text(
            showUse ? K.use_something : K.give_something,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16 * ratio,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );

    return Container(
      padding: EdgeInsetsDirectional.only(start: 20 * ratio, end: 20 * ratio),
      height: 52,
      alignment: Alignment.center,
      child: Row(
        children: widgets,
      ),
    );
  }

  _switchNum() async {
    final List<SheetItem> res = [];
    for (String value in A.gift_num_array_new) {
      res.add(SheetItem('$value${K.gift_unit_g}', "", Util.parseInt(value)));
    }
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: K.please_select_num, data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    setState(() {
      _selectGiftNum = result.value?.extra;
    });
  }

  void _submit() {
    BbGiftPanelCommodities? bag = _getCurrentBag();
    if (bag == null) {
      return;
    }

    if (bag.jumpType == 'room') {
      if (bag.tryVoice == false) {
        int rid = bag.jumpRid;
        if (rid > 0) {
          _showJumpRoomDialog(rid);
        } else {
          Fluttertoast.showToast(
              msg: K.git_no_room_enter, gravity: ToastGravity.CENTER);
        }
        return;
      }
    }

    int userNum = _isInRoom ? _getSelectUid().length : 1;
    if (userNum <= 0) {
      Fluttertoast.showToast(
          msg: K.please_selecet_a_target_at_least,
          gravity: ToastGravity.CENTER);
      return;
    }
    _totalNum = _selectGiftNum * userNum;
    if (_totalNum > bag.num) {
      Fluttertoast.showToast(
          msg: K.gift_bag_not_enough, gravity: ToastGravity.CENTER);
      return;
    }

    _giftPrice = bag.price;
    _totalPrice = _giftPrice * _selectGiftNum * userNum;
    _pay(bag,
        type: bag.type == 'group_pk_coupon' ? 'grouppk-prop-use' : 'package');
  }

  void _pay(BbGiftPanelCommodities bag, {String type = 'package'}) {
    _payManager.pay(context,
        key: 'gift',
        type: 'available',
        refer: 'gift',
        args: {
          'money': _totalPrice,
          'type': type,
          'params': {
            'rid': widget.room?.rid,
            'uids': _getSelectUid().join(','),
            'positions': _getSelectPosition().join(','),
            'position': _getMyPosition(),
            'giftId': bag.extId,
            'giftNum': _selectGiftNum,
            'price': _giftPrice,
            'cid': bag.id,
            'ctype': bag.type, // gift、group_pk_coupon
            'duction_money': 0,
            'version': 2,
            'num': _totalNum,
            'gift_type': bag.giftType,
            'star': 0,
            if (widget.isCpLinkPromote) 'is_cplink_aid': true,
            'refer': '${widget.room?.refer}:room',
            if (Util.parseInt(widget.topicId) > 0)
              'topicid': '${widget.topicId}',
          }
        },
        onPayed: () => _onPayed(bag),
        onError: (isErrorCatch) => _onPayError(isErrorCatch));
  }

  _onPayed(BbGiftPanelCommodities bag) {
    ChatRoomData? room0 = _isInRoom ? ChatRoomData.getInstance() : null;

    Map<String, dynamic> properties = <String, dynamic>{
      'scene': _isInRoom
          ? 'room'
          : widget.giftScene == GiftScene.private
              ? 'private'
              : 'order',
      'rid': _isInRoom ? widget.room?.rid : 0,
      'gift_name': bag.name,
      'gift_id': bag.extId,
      'gift_price': _giftPrice,
      'gift_num': _selectGiftNum,
      'user_num': _isInRoom ? _getSelectUid().length : 1,
      'total_price': _giftPrice * _selectGiftNum,
      'gift_type': bag.giftType,
      'is_combo': 2,
      if (room0 != null) 'chat_room_type': room0.config?.type,
      if (room0 != null)
        'chat_room_property': room0.config?.property.toString(),
      if (room0 != null) 'chat_room_types': room0.config?.types.toString(),
      if (!Util.isNullOrEmpty(room0?.config?.typeName))
        'type_label': room0?.config?.typeName,
      if (!Util.isNullOrEmpty(room0?.config?.originalRFT))
        'room_factory_type': room0?.config?.originalRFT,
      if (!Util.isNullOrEmpty(room0?.config?.settlementChannel))
        'settlement_channel': room0?.config?.settlementChannel,
    };

    if (_isInRoom) {
      ChatRoomData? room = ChatRoomData.getInstance();
      String roomType = room?.config?.type ?? '';
      properties['time'] = DateTime.now().millisecondsSinceEpoch;
      properties['room_type'] = roomType;
      properties['refer'] = room?.refer ?? '';
      properties['is_pk'] = room?.gpkEnable ?? false;
      if (room?.config?.game == Games.Wolf) {
        IWereWolfManager wereWolfManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_WERE_WOLF);
        properties['game_type'] = wereWolfManager.getGameType();
      }
    }

    if (_isInRoom) {
      _getSelectUid().forEach((element) {
        properties['to_uid'] = element;
        Tracker.instance.track(TrackEvent.send_gift, properties: properties);
      });
    }

    if (ModalRoute.of(context)?.isCurrent ?? false) {
      Navigator.of(context).pop(true);
    }

    eventCenter.emit("Gift.SendSuccess");
  }

  _onPayError(bool e) {}

  // 选中的uids
  List<int> _getSelectUid() {
    List<int> uids =
        widget.getSelectUids != null ? widget.getSelectUids!() : [];
    return uids;
  }

  /// 礼物
  Widget _renderGiftFooter(BbGiftPanelCommodities current) {
    var text = K.reward_give + current.name + K.derect_use;
    if (current.type == 'defend') {
      text = K.buy_to_anyone + current.name + K.derect_use;
    } else if (current.type == 'radio-defend') {
      text = K.buy_in_radio + current.name + K.derect_use;
    }

    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 18.0,
        end: 18.0,
      ),
      height: 60,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: _isInRoom || darkMode
              ? const Color(0x99FFFFFF)
              : R.color.mainTextColor,
          fontSize: 13,
        ),
        maxLines: 2,
      ),
    );
  }

  /// 爵位
  Widget _renderTitleFooter(BbGiftPanelCommodities current) {
    bool isContinue = current.isContinue > 0;
    String message = isContinue
        ? K.renew_only + current.extName + K.use_in_title
        : K.first_open_only + current.extName + K.use_in_title;

    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 18.0,
        end: 18.0,
      ),
      height: 60,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: _isInRoom || darkMode
                    ? const Color(0x99FFFFFF)
                    : R.color.mainTextColor,
                fontSize: 13,
              ),
            ),
          ),
          Container(
            height: 32,
            width: 60,
            margin: const EdgeInsetsDirectional.only(start: 10),
            decoration: BoxDecoration(
              color: _isInRoom || darkMode
                  ? const Color(0x14FFFFFF)
                  : R.color.secondBgColor,
              borderRadius: BorderRadius.circular(23),
            ),
            child: InkWell(
              onTap: () {
                _onPresent(current);
              },
              borderRadius: BorderRadius.circular(23),
              child: Center(
                child: Text(
                  K.give_something,
                  style: TextStyle(
                    color: _isInRoom || darkMode
                        ? Colors.white.withOpacity(0.3)
                        : R.color.mainTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          // _buildFooterBtn(K.give_something, () => _onPresent(current)),
          _buildFooterBtn(K.use_something, () => _onUse(current)),
        ],
      ),
    );
  }

  /// 头像框/坐骑
  Widget _renderHeaderMountsFooter(BbGiftPanelCommodities current) {
    String text = '';
    bool showPresentBtn = false;
    bool showUseBtn = false;
    bool showDownBtn = false;
    int used = Util.parseInt(current.used);

    List<String> formats = [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn];
    if (used == 0) {
      // 未使用过
      showPresentBtn = true;
      showUseBtn = true;

      int periodDays = Util.parseInt(current.period, 0);
      int periodHour = Util.parseInt(current.periodHour, 0);
      if (periodDays > 0) {
        text = '${K.gift_validity} $periodDays ${K.gift_day}';
      } else if (periodHour > 0) {
        text = '${K.gift_validity} $periodHour ${K.gift_hour}';
      } else {
        text = K.permanent_validity;
      }
    } else if (current.inUse == 0) {
      // 使用过但未佩戴
      showUseBtn = true;
      String end = formatDate(
          DateTime.fromMillisecondsSinceEpoch(current.periodEnd * 1000),
          formats);
      text = '${K.gift_validity} $end ${K.gift_invalid}';
    } else {
      // 使用中
      showDownBtn = true;

      int periodEnd = current.periodEnd;
      if (periodEnd > 0) {
        String expireTime = formatDate(
            DateTime.fromMillisecondsSinceEpoch(periodEnd * 1000), formats);
        text = expireTime + K.gift_invalid;
      } else {
        text = K.permanent_validity;
      }
    }

    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 18.0,
        end: 18.0,
      ),
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: _isInRoom || darkMode
                    ? const Color(0x99FFFFFF)
                    : R.color.mainTextColor,
                fontSize: 14,
              ),
            ),
          ),
          showPresentBtn
              ? Container(
                  height: 32,
                  width: 60,
                  margin: const EdgeInsetsDirectional.only(start: 10),
                  decoration: BoxDecoration(
                    color: _isInRoom || darkMode
                        ? const Color(0x14FFFFFF)
                        : R.color.secondBgColor,
                    borderRadius: BorderRadius.circular(23),
                  ),
                  child: InkWell(
                    onTap: () {
                      _onPresent(current);
                    },
                    borderRadius: BorderRadius.circular(23),
                    child: Center(
                      child: Text(
                        K.give_something,
                        style: TextStyle(
                          color: _isInRoom || darkMode
                              ? Colors.white
                              : R.color.mainTextColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
          showUseBtn
              ? _buildFooterBtn(K.use_something, () {
                  if (used == 0) {
                    _onUse(current);
                  } else {
                    _onHeaderOp(current, true);
                  }
                })
              : Container(),
          showDownBtn
              ? _buildFooterBtn(
                  K.gift_discharge, () => _onHeaderOp(current, false))
              : Container(),
        ],
      ),
    );
  }

  /// 优惠券
  Widget _renderCouponFooter(BbGiftPanelCommodities current) {
    String text = K.permanent_validity;
    List<String> formats = [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn];
    int periodEnd = current.periodEnd;
    if (periodEnd > 0) {
      String end = formatDate(
          DateTime.fromMicrosecondsSinceEpoch(periodEnd * 1000000), formats);
      text = '${K.gift_validity}$end${K.gift_invalid}';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 52,
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _getCouponText(current),
            style: TextStyle(
              color: _isInRoom || darkMode
                  ? Colors.white.withOpacity(0.4)
                  : R.color.mainTextColor,
              fontSize: 12.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              text,
              style: TextStyle(
                color: _isInRoom || darkMode
                    ? Colors.white.withOpacity(0.4)
                    : R.color.secondTextColor,
                fontSize: 9.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 开箱子
  Widget _renderOpenBox(BbGiftPanelCommodities current) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 18.0, end: 18.0, top: 10, bottom: 10),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: _buildSumHandler(),
          ),
          Container(
            height: 32,
            width: 60,
            margin: const EdgeInsetsDirectional.only(start: 10),
            decoration: BoxDecoration(
              color: _isInRoom || darkMode
                  ? const Color(0x14FFFFFF)
                  : R.color.secondBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () {
                _openBox(1);
              },
              borderRadius: BorderRadius.circular(16),
              child: Center(
                child: Text(
                  Session.useStar != BoxGameType.None
                      ? K.gift_open_a_pac
                      : K.open_a_box,
                  style: TextStyle(
                    color: _isInRoom || darkMode
                        ? Colors.white
                        : R.color.mainTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          _buildFooterBtn(
              '$_num${Session.useStar != BoxGameType.None ? K.gift_open_pac : K.in_succession}',
              () {
            _openBox(_num);
          }),
        ],
      ),
    );
  }

  /// 获取优惠券描述
  String _getCouponText(BbGiftPanelCommodities current) {
    switch (current.couponType) {
      case 'gift':
        if (Util.parseInt(current.onlyNewpay) == 0) {
          return K.could_use_in_reward + current.extName + K.gift_use_in;
        } else {
          return K.new_account_reward_only + current.extName + K.gift_use_in;
        }
      case 'defend':
        return K.can_buy_for_everybody + current.extName + K.gift_use_in;
      case 'radio-defend':
        return K.buy_in_radio_only + current.extName + K.gift_use_in;
      case 'title':
        if (Util.parseInt(current.isContinue) == 0) {
          return K.first_open_only + current.extName + K.use_in_title;
        } else {
          return K.renew_only + current.extName + K.use_in_title;
        }
      case 'key':
        if (Util.parseInt(current.onlyNewpay) == 0) {
          return K.gift_buy +
              current.extName +
              K.can_deduction +
              MoneyConfig.originPrice1(current.ductionMoney);
        } else {
          return K.can_buy_new_account_only +
              current.extName +
              K.can_deduction +
              MoneyConfig.originPrice1(current.ductionMoney);
        }
      case 'vip_mic':
      case 'discount':
      case 'knight':
        return current.description;
      default:
        return '';
    }
  }

  /// 数量加减控件
  Widget _buildSumHandler() {
    return Row(
      children: [
        Text(
          R.string('select_num'),
          style: TextStyle(
            color: _isInRoom || darkMode
                ? const Color(0x99FFFFFF)
                : R.color.secondTextColor,
            fontSize: 15,
          ),
        ),
        InkWell(
          onTap: () {
            _onMinus();
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: R.img(
              BaseAssets.ic_subtract_num_svg,
              width: 16,
              height: 16,
              color: R.color.thirdTextColor,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
        ),
        Center(
          child: NumText(
            _num.toString(),
            style: TextStyle(
                color: _isInRoom ? Colors.white : R.color.mainTextColor,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
        InkWell(
          onTap: () {
            _onAdd();
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: R.img(
              BaseAssets.ic_add_num_svg,
              width: 16,
              height: 16,
              color: R.color.thirdTextColor,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
        ),
      ],
    );
  }

  /// footer中的button
  Widget _buildFooterBtn(String text, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 10),
      height: 32,
      width: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: R.color.mainBrandGradientColors,
        ),
        borderRadius: BorderRadius.circular(23),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(23),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  /// 数量减1
  void _onMinus() {
    if (_num > 1) _num--;
    setState(() {});
  }

  /// 数量加1
  void _onAdd() {
    BbGiftPanelCommodities? current = _getCurrentBag();
    int maxNum = min(99, Util.parseInt(current?.maxNum));
    if (current == null || current.type == 'exp' || _num >= maxNum) {
      return;
    }

    setState(() {
      _num++;
    });
  }

  /// 使用
  void _onUse(BbGiftPanelCommodities current) async {
    bool result = await BaseBagApi.onHeaderUse(current.id, current.name,
        num: _num, type: current.type);
    if (result == true) {
      if (current.type == 'header') {
        eventCenter.emit(EventConstant.EventCurrentHeaderFrameChanged);
      }
    }
    if (result == true) widget.refreshCallback();
  }

  /// 赠送
  void _onPresent(BbGiftPanelCommodities current) async {
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    dynamic result = await giftManager.openSendGift(
      context,
      cid: Util.parseInt(current.id),
      num: _num,
      name: current.name,
    );
    if (result == true) widget.refreshCallback();
  }

  /// 头像框操作
  void _onHeaderOp(BbGiftPanelCommodities current, bool putOn) async {
    bool result;
    if (putOn) {
      result = await BaseBagApi.onHeaderOn(current.id, current.name,
          type: current.type);
    } else {
      result = await BaseBagApi.onHeaderOff(current.id, current.name,
          type: current.type);
    }
    if (result == true) {
      if (current.type == 'header') {
        eventCenter.emit(EventConstant.EventCurrentHeaderFrameChanged);
      }
    }
    if (result == true) widget.refreshCallback();
  }

  String _fetchBoxTypeByCid(int cid) {
    switch (cid) {
      case 2:
      case 5:
        return 'copper';
      case 3:
      case 6:
        return 'silver';
      case 4:
      case 7:
        return 'gold';
    }
    return '';
  }

  String _getKeyName(String type) {
    if (type == 'gold') {
      return BoxUtil.goldKeyName;
    } else if (type == 'silver') {
      return BoxUtil.silverKeyName;
    } else {
      return BoxUtil.copperKeyName;
    }
  }

  int _fetchKeyCidByCid(int cid) {
    switch (cid) {
      case 2:
      case 5:
        return 5;
      case 3:
      case 6:
        return 6;
      case 4:
      case 7:
        return 7;
    }
    return 0;
  }

  /// 开箱子
  void _openBox(int num) async {
    BbGiftPanelCommodities? current = _getCurrentBag();
    if (current == null ||
        num <= 0 ||
        (current.type != 'box' && current.type != 'key')) {
      String tips = K.gift_cant_open_pac_for_the_moment([BoxUtil.boxActName]);
      Fluttertoast.showToast(msg: tips, gravity: ToastGravity.CENTER);
      return;
    }
    int cid = current.cid;
    int boxNum = current.boxNum;
    int keyNum = current.keyNum;
    _boxType = _fetchBoxTypeByCid(cid);
    if (boxNum >= num && keyNum >= num) {
      try {
        await _loadBoxDetail(_fetchKeyCidByCid(cid));
        XhrResponse response = await Xhr.postJson(
            "${System.domain}account/openbox",
            {
              'type': _boxType ?? '',
              'num': num.toString(),
              'rid': _isInRoom ? (widget.room?.rid ?? 0).toString() : '0',
              'version': '1',
              'star': '$_star',
              'show_pac_man_guide':
                  Config.getBool('has_show_pac_man_guide', false) ? '0' : '1',
            },
            throwOnError: true);

        Map res = response.value();
        if (res['success'] == true) {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }

          BoxUtil.showGame(
              context: context, giftId: 0, starId: _star, giftNum: num);
        } else {
          if (res['msg'] != null && res['msg'] is String) {
            Fluttertoast.showToast(
                msg: res['msg'], gravity: ToastGravity.CENTER);
          }
        }
      } catch (e) {
        Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      }
    } else {
      // 钥匙不足
      if (num > keyNum) {
        int needNum = num - keyNum;

        if ((widget.data?.extend.showBuyHeader ?? 0) > 0) {
          // 服务端允许弹窗。 水晶够时，自动购买；水晶不够时，弹窗
          if (BuyHeaderDialog.needShowDialog(cid)) {
            // 本地flag需要弹窗
            bool? r = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return BuyHeaderDialog(
                    cid: cid,
                    num: needNum.abs(),
                    totalMoney: ((widget.data?.extend.totalMoney ?? 0) / 100)
                        .toStringAsFixed(2),
                  );
                });
            if (r == null || r == false) {
              return;
            }
          }
        } else if ((widget.data?.extend.openBoxUserMoney ?? 0) > 0) {
          // 允许用钱直接开箱子
        } else {
          // 提示钥匙不足
          String keyName = _getKeyName(_fetchBoxTypeByCid(cid));
          Toast.show(context, R.string('key_not_enough', args: [keyName]));
          return;
        }

        //查看用户是否有优惠券
        int keyCid = _fetchKeyCidByCid(cid);
        BbGiftPanelKeyCoupons? currentCoupons = widget.data?.keyCoupons
            .firstWhereOrNull((element) => element.cid == _keyCid);
        if (currentCoupons != null) {
          if (currentCoupons.onlyNewpay > 0 && currentCoupons.state == 0) {
          } else {
            _couponId = currentCoupons.id;
            _ductionMoney = currentCoupons.ductionMoney;
          }
        }

        _boxNum = num;
        _keyCid = keyCid;
        _needBuyNum = needNum;
        _keyPrice = current.keyPrice;
        _boxMoney = _keyPrice * _needBuyNum;
        _purchaseOptions();
      }
      if (num > boxNum) {
        String tips = K.gift_no_enough_pac([BoxUtil.commonBoxName]);
        Fluttertoast.showToast(msg: tips, gravity: ToastGravity.CENTER);
        return;
      }
    }
  }

  bool _tryUseAvailable = false; // 尝试使用余额支付
  int _couponId = 0; // 优惠券id
  int _ductionMoney = 0; // 优惠金额
  String? _boxType; // 箱子类型 金、银、铜
  int _boxNum = 0; // 开多少个箱子
  int _keyCid = 0; // 钥匙的cid
  int _needBuyNum = 0; // 还需要买多少把钥匙
  int _keyPrice = 0; // 钥匙的价格
  int _boxMoney = 0; // 一共需要花的钱

  /// 开箱子支付方式
  _purchaseOptions() async {
    int realTotalMoney = widget.data?.extend.totalMoney ?? 0;
    await _loadBoxDetail(_keyCid);
    if (realTotalMoney >= _boxMoney) {
      _tryUseAvailable = true;
      _purchaseOpenBox('available');
    } else {
      _openBoxWithSwitchType();
    }
  }

  /// 拉取下boxDetail接口，新用户未在背包点过对应的box，后台不会生成box数据，导致礼物面板的背包无法购买或者使用
  Future _loadBoxDetail(int cid) async {
    String url = "${System.domain}account/boxdetail?cid=$cid&act_version=2";
    try {
      XhrResponse response = await Xhr.getJson(url);
    } catch (e) {
      Log.d(e);
    }
  }

  _openBoxWithSwitchType() async {
    SheetCallback? result = await _payManager.showRechargeSheet(
        context, _boxMoney - _ductionMoney,
        onlyRecharge: true);
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == IPayManager.pTRecharge) {
      // 充值成功刷新余额
      widget.refreshCallback();
      return;
    }

    _purchaseOpenBox(result.value?.key);
  }

  _purchaseOpenBox(String? type) {
    _payManager.pay(context,
        key: 'gift',
        type: type ?? '',
        refer: 'gift',
        args: {
          'money': _boxMoney,
          'type': 'shop-buy',
          'params': {
            'num': _needBuyNum,
            'cid': _keyCid,
            'price': _keyPrice,
            'type': _boxType,
            'opennum': _boxNum,
            'rid': _isInRoom ? (widget.room?.rid ?? 0) : 0,
            'coupon_id': _couponId,
            'duction_money': _ductionMoney,
            'version': 2,
            'star': '$_star',
            'show_pac_man_guide':
                Config.getBool('has_show_pac_man_guide', false) ? 0 : 1,
            if (Util.parseInt(widget.topicId) > 0)
              'topicid': '${widget.topicId}',
          }
        },
        onPayed: _onOpenBoxPayed,
        onError: _onOpenBoxPayError);
  }

  _onOpenBoxPayed() {
    _tryUseAvailable = false;
    _keyCid = 0;

    Navigator.of(context).pop();

    BoxUtil.showGame(
        context: context, giftId: 0, starId: _star, giftNum: _boxNum);
  }

  _onOpenBoxPayError(bool isErrorCatch) {
    if (_tryUseAvailable) {
      _tryUseAvailable = false;
      _openBoxWithSwitchType();
    }
  }

  _onShowMicUsers({bool init = false}) {
    BbGiftPanelCommodities? bag = _getCurrentBag();
    bool show = bag != null && _showSendGiftBar(bag);
    widget.showMicUsersCallback(show, init == false);
  }

  // 选中的麦序
  List<int> _getSelectPosition() {
    List<int> positions = [];
    for (int i = 0; i < _users.length; ++i) {
      RoomPosition p = _users[i];
      if (_getSelectUid().contains(p.uid)) {
        positions.add(p.position);
      }
    }

    return positions;
  }

  // 我的麦序
  int _getMyPosition() {
    int myPosition = -1;

    // _position
    widget.room?.positions.forEach((RoomPosition position) {
      int uid = position.uid;
      if (uid > 0 && uid == Session.uid) {
        myPosition = position.position;
      }
    });

    return myPosition;
  }

  void _showJumpRoomDialog(int rid) async {
    bool result = await showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: K.gift_jump_to_other_room,
      ),
    );

    if (result == true) {
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(context, rid,
          from: RoomFrom.gift_panel, refer: 'gift_panel_bag');
    }
  }

  @override
  bool get wantKeepAlive => true;
}
