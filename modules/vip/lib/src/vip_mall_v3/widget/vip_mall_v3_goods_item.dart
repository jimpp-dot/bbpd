import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/vip_mall/widget/buy_panel.dart';
import 'package:vip/src/vip_mall/widget/commodity_list_item_top.dart';
import 'package:vip/src/pb/generated/store.pb.dart';
import 'package:vip/src/vip_mall_v3/widget/price_widget.dart';

import '../../../k.dart';
import '../../theme/vip_theme.dart';
import 'package:provider/provider.dart' hide Selector;

/// 商品item - 通用（外层一行3个）
class VipMallV3GoodsItem extends StatelessWidget {
  final StoreCommodityItem commodity;
  final VoidCallback? onBuy;

  const VipMallV3GoodsItem({super.key, required this.commodity, this.onBuy});

  /// 商品点击
  _onItemTaped(BuildContext context, StoreCommodityItem commodity,
      VoidCallback? onBuy) async {
    if (commodity.owner.uid > 0 && commodity.owner.uid != Session.uid) {
      /// 定制礼物
      Fluttertoast.showToast(msg: K.vip_store_custom_commodity_toast);
      return;
    }
    _reportPageClickEvent(commodity);
    if (commodity.jumpUrl.isNotEmpty) {
      SchemeUrlHelper.instance()
          .jump(commodity.jumpUrl, type: commodity.jumpType);
      return;
    }
    eventCenter.emit(EventConstant.EventShopGoodItemChanged, itemTopCommodity);

    bool? isBuy =
        await BuyPanel.show(context, cid: commodity.cid, type: commodity.type);
    if (isBuy == true) {
      context.read<ProfilePayload>().loadBagRedPoint();
      if (onBuy != null) {
        onBuy();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onItemTaped(context, commodity, onBuy),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double ratio = constraints.maxWidth / 104;
          return Container(
            width: constraints.maxWidth,
            height: double.infinity,
            decoration: BoxDecoration(
              color: VipTheme.colors.mallItemBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: _buildContent(ratio),
          );
        },
      ),
    );
  }

  Widget _buildContent(double ratio) {
    return Column(
      children: [
        _buildBackground(ratio),
        Expanded(
          child: Container(
            alignment: AlignmentDirectional.topStart,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  commodity.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontSize: 12, color: R.colors.secondTextColor),
                ),
                SizedBox(height: 2 * ratio),
                PriceWidget(
                    priceType: commodity.lightScore > 0
                        ? PriceType.diamond_score
                        : PriceType.diamond,
                    price: commodity.price,
                    subPrice: commodity.lightScore),
                if (commodity.owner.uid > 0) ...[
                  SizedBox(height: 4 * ratio),
                  Container(
                    width: 80 * ratio,
                    height: 20 * ratio,
                    decoration: const ShapeDecoration(
                      shape: StadiumBorder(),
                      color: Color(0x0F1D60DD),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonAvatar(
                            path: commodity.owner.icon,
                            size: 20,
                            shape: BoxShape.circle),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            commodity.owner.name,
                            style: TextStyle(
                                color: R.colors.mainTextColor, fontSize: 9),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _reportPageClickEvent(StoreCommodityItem commodity) {
    TrackEvent event = TrackEvent.shop_firstpage;
    Tracker.instance.track(event, properties: {
      'shop_page_click': 'item_card',
      'item_type': commodity.type,
      'item_id': '${commodity.cid}',
    });
  }

  Widget _buildLimitBuyMask(double ratio) {
    return Container(
      width: 104 * ratio,
      height: 93 * ratio,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        color: Colors.black.withOpacity(0.6),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            start: 4,
            bottom: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                R.img('ic_lock.svg',
                    width: 16,
                    height: 16,
                    package: ComponentManager.MANAGER_BASE_CORE),
                if (commodity.numTotal > 0) ...[
                  const SizedBox(width: 3),
                  Text(
                    "${K.vip_store_limited_stock}:${commodity.numStock}/${commodity.numTotal}",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 10),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          PositionedDirectional(
            end: 4,
            top: 0,
            child: CachedNetworkImage(
              imageUrl: commodity.cornerIcon,
              height: 24,
              cachedHeight: 24.px,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCorner(double ratio) {
    if (commodity.numTotal > 0) {
      return PositionedDirectional(
        start: 0,
        end: 0,
        bottom: 0,
        child: Container(
          width: double.infinity,
          height: 24,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [
                const Color(0x002E295D),
                const Color(0xFF151230).withOpacity(0.6)
              ],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            "${K.vip_store_limited_stock}:${commodity.numStock}/${commodity.numTotal}",
            style:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 10),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }

    if (commodity.cornerIcon.isNotEmpty) {
      return PositionedDirectional(
        start: 4,
        bottom: 4,
        child: CachedNetworkImage(
          imageUrl: commodity.cornerIcon,
          height: 18,
          cachedHeight: 18.px,
          fit: BoxFit.fitHeight,
        ),
      );
    } else if (commodity.cornerDesc.isNotEmpty) {
      return PositionedDirectional(
        start: 4,
        bottom: 4,
        child: Container(
          height: 18,
          padding: const EdgeInsets.symmetric(horizontal: 7),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFF202020),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Text(
            commodity.cornerDesc,
            style: const TextStyle(
                color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildBackground(double ratio) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: CachedNetworkImage(
            imageUrl: Util.cover375(commodity.imageBg) ?? '',
            width: 104 * ratio,
            height: 93 * ratio,
            cachedWidth: (104 * ratio).px,
            cachedHeight: (93 * ratio).px,
            fit: BoxFit.cover,
          ),
        ),
        CommodityListItemTop(ratio: ratio, commodity: itemTopCommodity),
        if (!Util.isStringEmpty(commodity.gradeIcon) ||
            (commodity.ductionRate > 0 && commodity.ductionRate < 100))
          _buildLevel(),

        /// 商品其他小标签 如： 🔒/corner
        (commodity.limited > 0)
            ? _buildLimitBuyMask(ratio)
            : _buildCorner(ratio),
      ],
    );
  }

  Widget _buildLevel() {
    if (commodity.ductionRate > 0 && commodity.ductionRate < 100) {
      return PositionedDirectional(
        start: 4.dp,
        top: 4.dp,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(7.dp),
            gradient: const LinearGradient(
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
              colors: [Color(0xFFFF70FF), Color(0xFFFF3D5E)],
            ),
          ),
          padding: EdgeInsetsDirectional.only(
              start: 4.dp, end: 4.dp, top: 2.dp, bottom: 2.dp),
          alignment: AlignmentDirectional.center,
          child: NumText(
            '${commodity.ductionRate.toDouble() / 10.0}${K.mall_discount}',
            style:
                const TextStyle(color: Colors.white, fontSize: 10, height: 1.1),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    } else if (!Util.isStringEmpty(commodity.gradeIcon)) {
      return PositionedDirectional(
        start: 4,
        top: 4,
        child: CachedNetworkImage(
          imageUrl: Util.getRemoteImgUrl(commodity.gradeIcon),
          height: 14,
          fit: BoxFit.fitHeight,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  IShopMailCommodity get itemTopCommodity => SimpleShopMailCommodity(
      type: commodity.type,
      image: commodity.image,
      avatar: commodity.avatar,
      bubbleDesc: commodity.bubbleDesc,
      bubbleFontColor: commodity.bubbleFontColor);
}

class EmptyCommodityV3Widget extends StatelessWidget {
  const EmptyCommodityV3Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double ratio = constraints.maxWidth / 104;
        return Container(
          width: constraints.maxWidth,
          height: 139 * ratio,
          decoration: BoxDecoration(
            color: R.colors.mainBgColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.04),
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 104 * ratio,
                height: 93 * ratio,
                alignment: AlignmentDirectional.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [Color(0xFF6B6B6E), Color(0xFF434147)],
                  ),
                ),
                child: R.img('mall/ic_gift.svg',
                    package: ComponentManager.MANAGER_VIP,
                    width: 80 * ratio,
                    height: 80 * ratio),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    '暂无该物品',
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 13, color: R.colors.mainTextColor),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
