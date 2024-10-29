import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/vip_mall/widget/commodity_list_item_top.dart';

class WelfarePondItemWidget extends StatelessWidget {
  final ShopMailCommodity data;
  final GestureTapCallback? onTap;
  final bool showName;

  const WelfarePondItemWidget(
      {required this.data, this.onTap, this.showName = true, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double ratio = constraints.maxWidth / 104;
            return Container(
              alignment: AlignmentDirectional.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildCommodityAndBackground(ratio),
                  if (showName) SizedBox(height: 4 * ratio),
                  if (showName)
                    Text(
                      data.name ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: const Color(0XFF202020), fontSize: 13 * ratio),
                    ),
                ],
              ),
            );
          },
        ));
  }

  Widget _buildCommodityAndBackground(double ratio) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CachedNetworkImage(
            imageUrl: data.itemCover,
            width: 104 * ratio,
            height: 104 * ratio,
            fit: BoxFit.cover,
          ),
          CommodityListItemTop(ratio: ratio, commodity: data),
        ],
      ),
    );
  }
}
