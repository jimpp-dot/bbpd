import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:vip/k.dart';
import 'package:vip/src/bag/model/bag_bean.dart';
import 'package:vip/src/vip_mall/widget/commodity_list_item_top.dart';

import '../bag_open_box_panel.dart';
import '../bag_open_panel.dart';
import '../pretty_card/pretty_card_panel.dart';

typedef BagRefreshCallback = Function(bool refreshTab);

/// 背包商品item
class BagGoodsItemWidget extends StatelessWidget {
  final BagGoods item;
  final double ratio;
  final BagRefreshCallback refreshCallback;

  const BagGoodsItemWidget({super.key, required this.item, required this.ratio, required this.refreshCallback});

  _onItemTap(BuildContext context) async {
    Tracker.instance.track(TrackEvent.backpack_page, properties: {
      'backpack_page_click': 'item_card',
      'item_id': item.id,
      'item_type': item.type,
    });
    _sendData();
    bool? success;
    bool refreshTab = false;
    if (item.commodityType == ShopMailCommodityType.Box || item.commodityType == ShopMailCommodityType.Key) {
      refreshTab = true;
      success = await BagBoxOpenPanel.show(context, cid: item.cid, boxName: item.name ?? '');
    } else if (ShopMailCommodityType.PrettyCard == item.commodityType) {
      success = await PrettyCardPanel.show(context, item.id, item.cid, type: item.type);
    } else {
      success = await BagOpenPanel.show(context, item.id, item.type ?? '');
    }

    if (success == true) {
      refreshCallback(refreshTab);
    }
  }

  _sendData() {
    eventCenter.emit(EventConstant.EventBagItemChanged, item);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onItemTap(context);
      },
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        double ratio = constraints.maxWidth / 104;
        return Container(
          width: constraints.maxWidth,
          height: 139 * ratio,
          decoration: BoxDecoration(
            color: R.colors.mallItemBgColor,
            borderRadius: BorderRadius.circular(8),
            // boxShadow: [
            //   BoxShadow(
            //     blurRadius: 8,
            //     spreadRadius: 0,
            //     color: Colors.black.withOpacity(0.04),
            //     offset: const Offset(0, 4),
            //   ),
            // ],
          ),
          child: _renderItem(),
        );
      }),
    );
  }

  Widget _renderItem() {
    String desc = (item.desc ?? '').toCharacterBreakStr();
    if (item.unuseInvalidDurationDisplay != null) {
      desc = item.unuseInvalidDurationDisplay! + K.vip_dissappear_after;
    }

    return Container(
      decoration: BoxDecoration(
        color: R.colors.mallItemBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 93,
            child: LayoutBuilder(
              builder: (context, constraints) {
                double width = constraints.maxWidth;
                double height = constraints.maxHeight;
                return _renderItemTop(item, width, height);
              },
            ),
          ),
          Expanded(
            flex: 46,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: R.colors.mainTextColor),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    desc,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 11, color: R.colors.thirdTextColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _renderItemTop(BagGoods item, double width, double height) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          child: CachedNetworkImage(
            imageUrl: item.itemCover,
            width: width,
            height: height,
            cachedWidth: width.px,
            cachedHeight: height.px,
            fit: BoxFit.fill,
          ),
        ),
        CommodityListItemTop(ratio: ratio, commodity: item),
        // 穿戴状态
        if (item.using == 1 && item.expired != 1)
          PositionedDirectional(
            start: 4,
            bottom: 4,
            child: Container(
              alignment: Alignment.center,
              height: 18,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Text(K.vip_wearing, style: const TextStyle(color: Colors.white, fontSize: 11)),
            ),
          ),

        // 右上角个数
        if ((item.num ?? 0) > 1)
          PositionedDirectional(
            end: 4,
            top: 4,
            child: Container(
              height: 16,
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
              decoration: BoxDecoration(
                color: const Color(0xffff5f7d),
                borderRadius: BorderRadius.circular(8),
              ),
              child: NumText(
                '${item.num}',
                style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        // 优惠券
        if (item.coupon.isNotEmpty)
          PositionedDirectional(
            start: 0,
            bottom: 8,
            end: 0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 15,
                  alignment: AlignmentDirectional.center,
                  padding: const EdgeInsetsDirectional.only(start: 5, end: 7),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        R.imagePath('bag_bg_coupon.png', package: ComponentManager.MANAGER_VIP),
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(MoneyConfig.moneyIcon, width: 12, height: 12),
                      NumText(
                        Util.parseDouble(item.coupon) > 1.0
                            ? MoneyConfig.moneyNum(Util.parseInt(Util.parseDouble(item.coupon) * 100), fractionDigits: 2)
                            : MoneyConfig.moneyNum(Util.parseInt(Util.parseDouble(item.coupon) * 100)),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        _buildLevel(),
      ],
    );
  }

  /// 物品评级
  Widget _buildLevel() {
    if (Util.isStringEmpty(item.gradeIcon)) return const SizedBox.shrink();
    return PositionedDirectional(
      start: 4,
      top: 4,
      child: CachedNetworkImage(
        imageUrl: Util.getRemoteImgUrl(item.gradeIcon ?? ''),
        height: 14,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
