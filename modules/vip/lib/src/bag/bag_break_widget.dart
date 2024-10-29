import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/bag/animator_text.dart';
import 'package:vip/src/bag/bag_api.dart';
import 'package:vip/src/vip_mall/widget/commodity_break_item_top.dart';

import '../../k.dart';
import 'model/bag_bean.dart';

/// 物品分解
class BagBreakWidget extends StatefulWidget {
  final BagGoods bagGoods;

  const BagBreakWidget({super.key, required this.bagGoods});

  @override
  State<StatefulWidget> createState() => _BagBreakWidgetState();

  static Future<bool?> show(BuildContext context,
      {required BagGoods bagGoods}) async {
    return showDialog<bool?>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return BagBreakWidget(bagGoods: bagGoods);
      },
    );
  }
}

class _BagBreakWidgetState extends State<BagBreakWidget> {
  final GlobalKey _animTextKey = GlobalKey();
  int _selectedCount = 1;
  int _breakValue = 0;
  String _breakValueStr = "0";

  bool _showAnimText = false;

  @override
  Widget build(BuildContext context) {
    if (widget.bagGoods.breakPrice > 0) {
      _breakValue =
          (_selectedCount * widget.bagGoods.price / widget.bagGoods.breakPrice)
              .truncate();
      _breakValueStr = Util.numberToWString(_breakValue);
    }

    return Material(
      color: Colors.transparent,
      child: ConfirmDialog(
        title:
            "${Util.validStr(widget.bagGoods.tabTitle) ? widget.bagGoods.tabTitle : K.vip_bag_goods_title_default}${K.vip_goto_break}",
        width: 312,
        contentBuilder: (context) {
          return _buildContent();
        },
        positiveButton: PositiveButton(
          onPressed: (_breakValue < 1) ? null : () => _onConfirm(),
          canDisable: (_breakValue < 1),
          width: 132,
          height: 48,
        ),
        negativeButton: NegativeButton(
          onPressed: () => Navigator.of(context).pop(false),
          width: 132,
          height: 48,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 20),
        Container(
          height: 80,
          padding: const EdgeInsetsDirectional.only(
              start: 12, top: 5, bottom: 5, end: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFF6F7F9),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 70,
                height: 70,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return CommodityBreakItemTop(
                        ratio: 1.0, commodity: widget.bagGoods);
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.bagGoods.name ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            K.vip_bag_break_have,
                            style: TextStyle(
                              color: R.color.mainTextColor.withOpacity(0.7),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${widget.bagGoods.num}",
                            style: const TextStyle(
                              color: Color(0xFFFCA252),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            K.vip_bag_goods_unit,
                            style: TextStyle(
                              color: R.color.mainTextColor.withOpacity(0.7),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(width: 5),
                          _renderNameRightWidget(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  K.vip_bag_break_receive,
                  style: TextStyle(
                    color: R.color.mainTextColor.withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 2),
                CachedNetworkImage(
                  placeholder: const CupertinoActivityIndicator(),
                  imageUrl: Util.getRemoteImgUrl(widget.bagGoods.breakImage),
                  width: 24,
                  height: 24,
                  cachedHeight: 24.px,
                  cachedWidth: 24.px,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 2),
                Text(
                  _breakValueStr,
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onLongPress: () {
                    startAnim(1, _selectedCount, true);
                  },
                  onLongPressUp: () {
                    stopAnim();
                  },
                  onTap: _onReduceClick,
                  child: Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    child: R.img(
                      'ic_minus.svg',
                      width: 32,
                      height: 32,
                      package: ComponentManager.MANAGER_BASE_CORE,
                      color: R.color.mainTextColor.withOpacity(0.4),
                    ),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(minWidth: 32),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Offstage(
                        offstage: !_showAnimText,
                        child: AnimText(
                            key: _animTextKey,
                            color: R.color.mainTextColor,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Offstage(
                        offstage: _showAnimText,
                        child: Text(
                          _selectedCount.toString(),
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onLongPress: () {
                    startAnim(_selectedCount, widget.bagGoods.num ?? 0, false);
                  },
                  onLongPressUp: () {
                    stopAnim();
                  },
                  onTap: _onIncreaseClick,
                  child: Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    child: R.img(
                      'ic_add.svg',
                      width: 32,
                      height: 32,
                      package: ComponentManager.MANAGER_BASE_CORE,
                      color: R.color.mainTextColor.withOpacity(0.4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  /// 点击 +
  void _onIncreaseClick() {
    if (_selectedCount < (widget.bagGoods.num ?? 0)) {
      _selectedCount++;
      _showAnimText = false;
      setState(() {});
    }
  }

  /// 点击 -
  void _onReduceClick() {
    if (_selectedCount > 1) {
      _selectedCount--;
      _showAnimText = false;
      setState(() {});
    }
  }

  /// 长按 +
  void startIncreaseAnim(int begin, int end) {
    _showAnimText = true;
    (_animTextKey.currentState as AnimState)
        .startAnimator(begin, end, reverse: false, callback: (value) {
      _selectedCount = value;
      setState(() {});
    });
  }

  /// 长按 + :reverse = false ；长按 - :reverse = true
  void startAnim(int begin, int end, bool reverse) {
    if (begin == end) {
      return;
    }
    _showAnimText = true;
    (_animTextKey.currentState as AnimState)
        .startAnimator(begin, end, reverse: reverse, callback: (value) {
      _selectedCount = value;
      setState(() {});
    });
  }

  void stopAnim() {
    (_animTextKey.currentState as AnimState).stopAnimator();
  }

  // 商品名称右边文案
  Widget _renderNameRightWidget() {
    String text;
    Color bgColor = R.color.mainBrandColor.withOpacity(0.1);
    Color textColor = R.color.mainBrandColor;
    if ([
      ShopMailCommodityType.Gift,
      ShopMailCommodityType.Box,
      ShopMailCommodityType.Key,
      ShopMailCommodityType.Coupon,
      ShopMailCommodityType.Piece
    ].contains(widget.bagGoods.commodityType)) {
      text = K.vip_left_count(['${widget.bagGoods.num}']);
    } else {
      text = widget.bagGoods.leftTime;
      if (widget.bagGoods.expired == 1 || widget.bagGoods.useUp == 1) {
        bgColor = Colors.black.withOpacity(0.1);
        textColor = R.color.secondTextColor;
      }
    }
    return !Util.isStringEmpty(text)
        ? Container(
            padding: const EdgeInsetsDirectional.only(
                start: 5, end: 4, top: 3, bottom: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11), color: bgColor),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w500, color: textColor),
            ),
          )
        : const SizedBox.shrink();
  }

  void _onConfirm() async {
    RepCommodityResolve resp = await BagApi.breakGoods(
        widget.bagGoods.cid, widget.bagGoods.type ?? '', _selectedCount);
    if (resp.success) {
      Navigator.of(context).pop(true);
      Future(() {
        BagBreakResultWidget.show(context,
            icon: Util.getRemoteImgUrl(widget.bagGoods.breakImage),
            name: widget.bagGoods.breakName,
            num: resp.num);
      });
    } else {
      Fluttertoast.showToast(msg: K.vip_bag_break_failure);
    }
  }
}

class BagBreakResultWidget extends StatelessWidget {
  final String icon;
  final String name;
  final int num;

  const BagBreakResultWidget(
      {Key? key, required this.icon, required this.name, required this.num})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ConfirmDialog(
        title: K.vip_bag_break_success_title,
        width: 312,
        contentBuilder: (context) {
          return _buildContent();
        },
        positiveButton: PositiveButton(
          height: 48,
          onPressed: () => Navigator.of(context).pop(),
          text: K.vip_i_know,
          textSize: 18,
          width: 160,
        ),
        negativeButton: null,
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 15,
        ),
        Text(
          K.vip_bag_break_success_subtitle,
          style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
        ),
        const SizedBox(height: 15),
        CachedNetworkImage(
          imageUrl: Util.getRemoteImgUrl(icon),
          width: 60,
          height: 60,
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(color: R.color.thirdTextColor, fontSize: 13),
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              "x${Util.numberToWString(num)}",
              style: const TextStyle(color: Color(0xFFFDA252), fontSize: 13),
            ),
          ],
        )
      ],
    );
  }

  static Future<bool?> show(BuildContext context,
      {required String icon, required String name, required int num}) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return BagBreakResultWidget(icon: icon, name: name, num: num);
      },
    );
  }
}
