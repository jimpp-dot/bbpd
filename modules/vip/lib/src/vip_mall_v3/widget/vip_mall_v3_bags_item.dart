import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../pb/generated/rpc_shop.pb.dart';
import '../../theme/vip_theme.dart';
import 'bags_buy_panel.dart';
import 'package:provider/provider.dart' hide Selector;

class VipMallV3BagsItem extends StatelessWidget {
  final ShopBag bag;
  final VoidCallback? onBuy;

  const VipMallV3BagsItem({super.key, required this.bag, this.onBuy});

  _onItemTaped(BuildContext context, VoidCallback? onBuy) async {
    bool? isBuy = await BagsBuyPanel.show(context, bag.bagId);
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
      onTap: () => _onItemTaped(context, onBuy),
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
                  bag.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontSize: 12, color: R.colors.secondTextColor),
                ),
                SizedBox(height: 2 * ratio),
                _buildDesc(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesc() {
    return Row(
      children: [
        R.img(MoneyConfig.moneyIcon,
            width: 10.dp, height: 10.dp, wholePath: true),
        const SizedBox(width: 2),
        NumText(
          '${bag.price}',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: R.colors.mainTextColor,
            fontFamily: Util.numFontFamily,
            package: ComponentManager.MANAGER_BASE_CORE,
          ),
          maxLines: 1,
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
            imageUrl: Util.cover375(bag.imageBg) ?? '',
            width: 104 * ratio,
            height: 93 * ratio,
            cachedWidth: (104 * ratio).px,
            cachedHeight: (93 * ratio).px,
            fit: BoxFit.cover,
          ),
        ),
        R.img(
          Util.getRemoteImgUrl(bag.image),
          height: 80 * ratio,
        ),
        _buildCorner(ratio),
      ],
    );
  }

  Widget _buildCorner(double ratio) {
    if (bag.bTag.isNotEmpty) {
      return PositionedDirectional(
        start: 4.dp,
        top: 4.dp,
        height: 14.dp,
        child: Container(
          height: 14.dp,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(7.dp),
            gradient: const LinearGradient(
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
              colors: [Color(0xFFFFA875), Color(0xFFFF4C20)],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 4.dp),
          alignment: AlignmentDirectional.center,
          child: Text(
            bag.bTag,
            style:
                const TextStyle(color: Colors.white, fontSize: 10, height: 1.1),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
