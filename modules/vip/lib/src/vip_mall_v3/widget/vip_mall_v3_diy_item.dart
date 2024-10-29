import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/vip_mall_v3/widget/price_widget.dart';

import '../../../assets.dart';
import '../../pb/generated/rpc_credit_shop.pb.dart';
import '../../theme/vip_theme.dart';
import '../page/diy_page.dart';

class VipMallV3DiyItem extends StatelessWidget {
  final CreditGoodsIndex_CustomZoneItem diyItem;
  final VoidCallback? onBuy;
  const VipMallV3DiyItem({super.key, required this.diyItem, this.onBuy});

  _onItemTaped(BuildContext context) async {
    bool? res = await DiyPage.show(context,
        cid: diyItem.id, money: diyItem.money, score: diyItem.score);
    if (res == true && onBuy != null) {
      onBuy?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onItemTaped(context),
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
          child: Stack(
            children: [
              PositionedDirectional(
                  bottom: 0,
                  end: 0,
                  child: Rext.autoStyleImg(Assets.vip$mall_ic_diy_png,
                      height: 28)),
              Container(
                alignment: AlignmentDirectional.topStart,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      diyItem.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12, color: R.colors.secondTextColor),
                    ),
                    SizedBox(height: 2 * ratio),
                    PriceWidget(
                        price: diyItem.money,
                        subPrice: diyItem.score,
                        priceType: PriceType.diamond_score)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackground(double ratio) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: CachedNetworkImage(
            imageUrl: Util.cover375(diyItem.imageBg) ?? '',
            width: 104 * ratio,
            height: 93 * ratio,
            cachedWidth: (104 * ratio).px,
            cachedHeight: (93 * ratio).px,
            fit: BoxFit.cover,
          ),
        ),
        R.img(Util.getRemoteImgUrl(diyItem.image), width: 80),
      ],
    );
  }
}
