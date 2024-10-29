import 'package:flutter/material.dart';

import '../shared.dart';

class AvatarGiftRow extends StatefulWidget {
  final int rid;
  final int uid;
  final String payKey;
  final List? gifts;
  final IPayManager payManager;
  final VoidCallback? onPayed;
  final PayErrorCallback? onPayError;
  final Color? giftItemBackground;
  final Color? giftItemBorderColor;
  double width;
  double height;
  double? minSideMargin;
  double? minMiddleMargin;
  double? maxMiddleMargin;
  final bool showDivider;

  AvatarGiftRow(
      {super.key,
      required this.rid,
      required this.uid,
      required this.payKey,
      this.gifts,
      required this.payManager,
      this.onPayed,
      this.onPayError,
      this.giftItemBackground,
      this.giftItemBorderColor,
      required this.width,
      required this.height,
      this.minSideMargin,
      this.minMiddleMargin,
      this.maxMiddleMargin,
      this.showDivider = true}) {
    minSideMargin ??= 24 * Util.ratio;
    minMiddleMargin ??= 12 * Util.ratio;
    maxMiddleMargin ??= 34 * Util.ratio;
  }

  @override
  _AvatarGiftRowState createState() => _AvatarGiftRowState();
}

class _AvatarGiftRowState extends State<AvatarGiftRow> {
  final double _giftWidth = 56 * Util.ratio;

  Widget _buildCoinGifts(List? avatarGifts) {
    if (avatarGifts == null || avatarGifts.isEmpty || !Session.supportCoinUse) {
      return Container();
    }

    List<AvatarGiftItem> items = [];
    for (var gift in avatarGifts) {
      if (gift is Map) {
        items.add(AvatarGiftItem.fromJson(gift));
      } else if (gift is HomeProfileGlist) {
        items.add(AvatarGiftItem.fromBuffModel(gift));
      }
    }

    return SizedBox(
      height: widget.height,
      child: Stack(
        children: <Widget>[
          Container(
            padding:
                EdgeInsetsDirectional.only(start: 0, bottom: 8 * Util.ratio),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      AvatarGiftItem item = items[index];
                      return GestureDetector(
                        onTap: () {
                          _payAvatarGift(item);
                        },
                        child: _buildAvatarGift(item, index, items.length),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          if (widget.showDivider == true)
            Container(
              width: double.infinity,
              height: 1.0,
              margin: EdgeInsetsDirectional.only(
                  start: widget.minSideMargin!, end: widget.minSideMargin!),
              color: R.color.dividerColor,
            ),
        ],
      ),
    );
  }

  Container _buildAvatarGift(AvatarGiftItem item, int index, int count) {
    double marginLeft = 0;
    double marginRight = widget.minSideMargin!;
    if (index == 0) {
      marginLeft = widget.minSideMargin!;
    }
    if (index == count - 1) {
      marginRight = widget.minSideMargin!;
    } else {
      marginRight = _calcGap(count);
    }
    return Container(
      padding: EdgeInsetsDirectional.only(start: marginLeft, end: marginRight),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: _giftWidth,
            height: _giftWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0 * Util.ratio),
              color: widget.giftItemBorderColor ?? R.color.dividerColor,
            ),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(2.0 * Util.ratio),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0 * Util.ratio),
                color: widget.giftItemBackground ?? R.color.mainBgColor,
              ),
              child: CachedNetworkImage(
                imageUrl: item.icon,
                width: 38,
                height: 38 * Util.ratio,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: -8 * Util.ratio,
            child: Container(
              width: 40 * Util.ratio,
              height: 16 * Util.ratio,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0 * Util.ratio),
                color: R.color.mainBrandColor,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  R.img('ic_coin.png',
                      package: ComponentManager.MANAGER_BASE_CORE,
                      fit: BoxFit.fill,
                      width: 12 * Util.ratio,
                      height: 12 * Util.ratio),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(start: 1.0 * Util.ratio),
                    child: Text(
                      '${item.price}',
                      style: TextStyle(
                          color: R.color.mainBgColor,
                          fontSize: 10 * Util.ratio,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _payAvatarGift(AvatarGiftItem item) {
    widget.payManager.payAvatarGift(
      context: context,
      key: widget.payKey,
      money: item.price,
      rid: widget.rid,
      uids: [widget.uid],
      giftId: item.id,
      giftNum: 1,
      onPayed: widget.onPayed,
      onPayError: widget.onPayError,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCoinGifts(widget.gifts);
  }

  @override
  void dispose() {
    super.dispose();
    widget.payManager.dispose(widget.payKey);
  }

  double _calcGap(int count) {
    if (count < 2) return widget.maxMiddleMargin!;
    double gap =
        (widget.width - 2 * widget.minSideMargin! - _giftWidth * count) /
            (count - 1);
    if (gap > widget.maxMiddleMargin!) {
      return widget.maxMiddleMargin!;
    } else if (gap < widget.minMiddleMargin!) {
      return widget.minMiddleMargin!;
    }
    return gap;
  }
}

class AvatarGiftItem {
  int id;
  String name;
  int price;
  String icon;

  AvatarGiftItem.fromJson(Map data)
      : id = Util.parseInt(data['id']),
        name = Util.notNullStr(data['name']),
        price = Util.parseInt(data['price']),
        icon = Util.notNullStr(data['icon']);

  AvatarGiftItem.fromBuffModel(HomeProfileGlist data)
      : id = Util.parseInt(data.id),
        name = data.name,
        price = Util.parseInt(data.price),
        icon = data.icon;
}
