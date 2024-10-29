import 'dart:math';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:gift/slp_src/widget/slp_decorate_icon.dart';
import 'package:gift/slp_src/widget/slp_gift_num_select_widget.dart';
import 'package:gift/slp_src/widget/slp_gift_tips_widget.dart';
import 'package:gift/k.dart';
import 'package:chat_room/chat_room.dart';
import '../../assets.dart';
import '../model/pb/slp_gift_extension.dart';
import 'slp_decorate_pay_mixin.dart';
import 'slp_page_gift.dart';

/// 礼物面板--装扮
class SlpPageDecorate extends StatefulWidget {
  final GiftScene giftScene;
  final List<BbGiftPanelDecorates>? list;
  final BbGiftPanelData? data;
  final OnSelectMicChanged? getSelectUids;
  final ChatRoomData? room;
  final int id;
  final bool fromChat;
  final int topicId;

  const SlpPageDecorate({
    super.key,
    required this.giftScene,
    this.data,
    this.list,
    this.getSelectUids,
    this.room,
    this.id = 0,
    this.fromChat = false,
    this.topicId = 0,
  });

  @override
  SlpPageDecorateState createState() => SlpPageDecorateState();
}

class SlpPageDecorateState extends State<SlpPageDecorate>
    with SlpDecoratePayMixin, AutomaticKeepAliveClientMixin {
  ScrollController? controller;
  int crossAxisCount = 4;
  double childAspectRatio = 0.9;
  double horizontalPadding = 5.0;
  final GlobalKey _selectNumKey = GlobalKey();

  _switchNum() async {
    RenderBox rowRenderBox =
        _selectNumKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset =
        rowRenderBox.localToGlobal(Offset(rowRenderBox.size.width / 2.0, -20));
    SlpGiftNumSelectWidget.show(
            context, widget.data?.chooseNumConfig, selectNum, offset)
        .then((value) {
      if (Util.parseInt(value?[0]) > 0) {
        if (mounted) {
          setState(() {
            selectNum = value![0];
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initPay();
    if (widget.list != null && widget.list?.isNotEmpty == true) {
      selectedItem = widget.list?[0];
    }
  }

  @override
  void dispose() {
    super.dispose();
    disposePay();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (widget.list == null || widget.list?.isEmpty == true) {
      return Container();
    }
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              GridView.builder(
                  controller: controller,
                  itemCount: widget.list?.length ?? 0,
                  padding: EdgeInsetsDirectional.only(
                    start: horizontalPadding,
                    end: horizontalPadding,
                    bottom: 40,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: childAspectRatio,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                  ),
                  itemBuilder: (context, index) {
                    return _buildItem(widget.list?[index]);
                  }),
              PositionedDirectional(
                bottom: 0,
                start: 0,
                end: 0,
                child: _buildBottomTips(),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
          decoration: BoxDecoration(
            border: _isInRoom || darkMode
                ? null
                : Border(
                    top: BorderSide(color: R.color.dividerColor, width: 0.5)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildAntiCheat(),
              _buildHandleBar(),
            ],
          ),
        ),
      ],
    );
  }

  /// 列表Item
  _buildItem(BbGiftPanelDecorates? item) {
    return DecorateItem(
        key: ValueKey('decorate_${item?.id}'),
        item: item,
        isInRoom: _isInRoom,
        showDiscount: selectedItem?.id == item?.id && showDiscount(),
        isSelected: selectedItem?.id == item?.id,
        onItemTap: (selectedItem) {
          Tracker.instance.track(TrackEvent.room_gift_control, properties: {
            'room_gift_click': 'decorate',
            'rid': widget.room != null ? widget.room!.rid : 0,
            'item_id': selectedItem.id,
            'item_name': selectedItem.name,
          });
          setState(() {
            this.selectedItem = selectedItem;
          });
        });
  }

  /// 大额礼物防诈骗提示，未关注 && 大于100时提示
  Widget _buildAntiCheat() {
    if (!needShowCheat() || isFriend == true) return const SizedBox.shrink();
    return Container(
      color: _isInRoom || darkMode
          ? const Color(0xFF171621).withOpacity(0.7)
          : Colors.white,
      width: Util.width,
      padding: const EdgeInsetsDirectional.only(
          start: 16, top: 11, end: 16, bottom: 11),
      child: Text(
        BaseK.K.base_anti_cheat,
        style: TextStyle(fontSize: 13, color: R.color.thirdBrightColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// 底部提示
  Widget _buildBottomTips() {
    return SlpDecorateTipsWidget(
        item: selectedItem, showDiscount: showDiscount(), totalNum: totalNum());
  }

  /// 底部支付栏
  Widget _buildHandleBar() {
    Color brandColor = R.color.mainBrandColor;
    List<Widget> widgets = [];

    double ratio = min(Util.ratio, 1);

    BbGiftPanelDecorates? item = selectedItem;
    if (item == null) return Container();

    if (item.moneyType == 'coin') {
      // 金币礼物
      int realTotalMoney = widget.data?.extend != null
          ? widget.data!.extend.goldCoin.toInt()
          : 0;

      widgets = [
        R.img(BaseAssets.ic_coin_png,
            width: 24 * ratio,
            height: 24 * ratio,
            package: ComponentManager.MANAGER_BASE_CORE),
        SizedBox(width: 4 * ratio),
        NumText(
          "$realTotalMoney",
          style: TextStyle(
            color: _isInRoom || darkMode ? Colors.white : R.color.mainTextColor,
            fontSize: 16 * ratio,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(width: 4 * ratio),
        GestureDetector(
          onTap: () {
            MissionManager.gotoMissionCenter(context);
          },
          child: Padding(
            padding:
                EdgeInsetsDirectional.only(start: 3 * ratio, end: 3 * ratio),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  K.gift_get_coin,
                  style: TextStyle(
                    color: _isInRoom || darkMode
                        ? brandColor
                        : R.color.mainBrandColor,
                    fontSize: 15 * ratio,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.navigate_next,
                  color: _isInRoom || darkMode
                      ? brandColor
                      : R.color.mainBrandColor,
                  size: 18 * ratio,
                ),
              ],
            ),
          ),
        ),
      ];
    } else if (item.moneyType == 'bean') {
      int realTotalMoney = widget.data?.extend.goldBean ?? 0;

      widgets = [
        Image.asset(MoneyConfig.goldBeanIcon,
            width: 24 * ratio, height: 24 * ratio),
        SizedBox(width: 4 * ratio),
        NumText(
          "$realTotalMoney",
          style: TextStyle(
            color: _isInRoom || darkMode ? Colors.white : R.color.mainTextColor,
            fontSize: 15 * ratio,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
          ),
        ),
        GestureDetector(
          onTap: () {
            ISettingManager? manager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_SETTINGS);
            manager?.showExchangeBeanScreen(context, refer: 'gift');
          },
          child: Padding(
            padding:
                EdgeInsetsDirectional.only(start: 5 * ratio, end: 5 * ratio),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  K.gift_exchange,
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
    } else {
      int realTotalMoney = widget.data?.extend.totalMoney ?? 0;

      widgets = [
        Image.asset(MoneyConfig.moneyIcon,
            width: 24 * ratio, height: 24 * ratio),
        SizedBox(width: 4 * ratio),
        NumText(
          MoneyConfig.moneyNum(realTotalMoney, fractionDigits: 2),
          style: TextStyle(
            color: _isInRoom || darkMode ? Colors.white : R.color.mainTextColor,
            fontSize: 15 * ratio,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
          ),
        ),
        GestureDetector(
          onTap: () {
            ISettingManager? manager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_SETTINGS);
            manager?.openRechargeScreen(context, refer: 'gift');
          },
          child: Padding(
            padding:
                EdgeInsetsDirectional.only(start: 5 * ratio, end: 5 * ratio),
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
    }

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
                bottomStart: Radius.circular(16 * ratio)),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.only(end: 4 * ratio),
                child: Text(
                  "x$selectNum",
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
        onTap: submit,
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
      padding: EdgeInsetsDirectional.only(start: 16 * ratio, end: 16 * ratio),
      height: 52,
      alignment: Alignment.center,
      child: Row(
        children: widgets,
      ),
    );
  }

  bool get _isInRoom {
    return isGiftSceneInRoom(widget.giftScene);
  }

  bool isSelect(int id) {
    return false;
  }

  @override
  bool get wantKeepAlive => true;
}

/// 列表Item
class DecorateItem extends StatefulWidget {
  final BbGiftPanelDecorates? item;
  final bool isInRoom; // 是否在房间
  final bool isSelected; // 是否选中
  final _OnItemTap? onItemTap;
  final bool showDiscount;

  const DecorateItem(
      {Key? key,
      this.item,
      this.isInRoom = false,
      this.isSelected = false,
      this.onItemTap,
      this.showDiscount = false})
      : super(key: key);

  @override
  _DecorateItemState createState() => _DecorateItemState();
}

class _DecorateItemState extends State<DecorateItem>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _scaleAnimation;

  double _scale = 1.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addListener(_onAnimationListener);
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller!, curve: Curves.elasticOut));
  }

  void _onAnimationListener() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller?.removeListener(_onAnimationListener);
    _controller?.dispose();
    super.dispose();
  }

  _onGiftTaped() {
    if (widget.onItemTap != null && widget.item != null) {
      widget.onItemTap!(widget.item!);
    }
    _controller?.forward(from: 0);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_controller?.isAnimating == true) {
      _scale = _scaleAnimation?.value;
    } else {
      _scale = 1;
    }
    return GestureDetector(
      onTap: () => _onGiftTaped(),
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Transform.scale(
                      scale: _scale,
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: Center(
                            child: RepaintBoundary(
                                child: SlpDecorateIcon(item: widget.item))),
                      ),
                    ),
                    Text(
                      widget.item?.name ?? '',
                      style: TextStyle(
                        color: widget.isInRoom || darkMode
                            ? Colors.white
                            : R.color.mainTextColor,
                        fontSize: 12.0,
                      ),
                      maxLines: 1,
                    ),
                    _renderPrice(),
                  ],
                ),
                _renderNumBadge(),
              ],
            ),
            if (widget.isSelected)
              R.img(Assets.ic_gift_select_svg,
                  package: ComponentManager.MANAGER_GIFT,
                  fit: BoxFit.fill,
                  color: const Color(0xff7d2ee6)),
          ],
        ),
      ),
    );
  }

  /// 右上角角标
  Widget _renderNumBadge() {
    if (widget.showDiscount &&
        (widget.item?.ductionRate ?? 0) > 0 &&
        (widget.item?.ductionRate ?? 0) < 100) {
      return PositionedDirectional(
        end: 5,
        top: 5,
        child: _renderDiscount(),
      );
    }

    if ((widget.item?.hasCoupon() ?? false) &&
        widget.item?.coupon != null &&
        (widget.item?.coupon.num ?? 0) > 0) {
      return PositionedDirectional(
        end: 5,
        top: 5,
        child: _renderCoupon(),
      );
    } else if ((widget.item?.ductionRate ?? 0) > 0 &&
        (widget.item?.ductionRate ?? 0) < 100) {
      return PositionedDirectional(
        end: 5,
        top: 5,
        child: _renderDiscount(),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  /// 价格
  Widget _renderPrice() {
    String unit;
    int price = widget.item?.price ?? 0;

    String displayPrice;

    // 金币礼物单位为金
    if (widget.item?.moneyType == 'coin') {
      unit = K.gift_coin_unit;
      displayPrice = '$price';
    } else if (widget.item?.moneyType == 'bean') {
      unit = K.gift_gold_bean_unit;
      displayPrice = '$price';
    } else {
      unit = MoneyConfig.moneyName;
      displayPrice = MoneyConfig.moneyNum(price);
    }
    return Text(
      "$displayPrice$unit",
      style: TextStyle(
        color: widget.isInRoom || darkMode
            ? Colors.white60
            : R.color.secondTextColor,
        fontSize: 10,
      ),
    );
  }

  /// 优惠券
  Widget _renderCoupon() {
    if ((widget.item?.hasCoupon() ?? false) &&
        widget.item?.coupon != null &&
        (widget.item?.coupon.num ?? 0) > 0) {
      return Coupon(
        color: R.color.thirdBrightColor,
        child: Container(
          width: 24,
          height: 12,
          alignment: Alignment.center,
          child: Text(
            '${widget.item?.coupon.num}',
            style: const TextStyle(
              fontSize: 9.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  /// 折扣
  Widget _renderDiscount() {
    if ((widget.item?.ductionRate ?? 0) > 0 &&
        (widget.item?.ductionRate ?? 0) < 100) {
      return Container(
        height: 13,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient:
              LinearGradient(colors: [Color(0xFFFD7493), Color(0xFFFF8441)]),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        alignment: Alignment.center,
        child: Text(
          K.gift_decorate_discount([
            Util.removeDecimalZeroFormat((widget.item?.ductionRate ?? 0) / 10)
          ]),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 9,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}

typedef _OnItemTap = Function(BbGiftPanelDecorates item);
