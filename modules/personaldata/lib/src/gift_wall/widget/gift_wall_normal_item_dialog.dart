import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';

import '../../../assets.dart';

class GiftWallNormalItemDialog extends StatelessWidget {
  final GiftWallItem gift;
  final String bgImage;

  const GiftWallNormalItemDialog(
      {Key? key, required this.gift, required this.bgImage})
      : super(key: key);

  static Future show(BuildContext context, GiftWallItem gift, String bgImage) {
    return showDialog(
      context: context,
      builder: (context) => GiftWallNormalItemDialog(
        gift: gift,
        bgImage: bgImage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color iconBgColor = const Color(0xFF000000).withOpacity(0.5);
    Color txColor;
    txColor = Colors.white;
    int level = gift.level;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 304,
        height: 304 * 1149 / 753,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: (R.img(bgImage, package: Assets.package) as Image).image,
            alignment: AlignmentDirectional.topCenter,
            fit: BoxFit.fitWidth,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            _buildContent(iconBgColor, txColor),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  size: 24,
                  color: R.color.thirdTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(Color iconBgColor, Color txColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 25),
        Text(gift.name,
            style: TextStyle(
                color: txColor, fontSize: 18, fontWeight: FontWeight.w500)),
        const SizedBox(height: 30),
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: iconBgColor,
          ),
          alignment: AlignmentDirectional.center,
          child: CachedNetworkImage(
            placeholder: const CupertinoActivityIndicator(),
            imageUrl: Util.giftImgUrl(gift.gid),
            width: 100,
            height: 100,
            fit: BoxFit.contain,
            fadeInDuration: const Duration(microseconds: 0),
            fadeOutDuration: const Duration(microseconds: 0),
          ),
        ),
        const SizedBox(height: 18),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(K.personal_gift_wall_item_detail_price,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 13)),
            Image.asset(MoneyConfig.moneyIcon, width: 16, height: 16),
            Text('${gift.price}',
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(K.personal_gift_wall_item_detail_num,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 13)),
            Text('${gift.num}${K.def_frequency}',
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        if (gift.user.uid > 0) ...[
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(K.personal_gift_wall_item_detail_send,
                  style: TextStyle(color: R.color.mainTextColor, fontSize: 13)),
              Container(
                height: 34,
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Colors.transparent,
                ),
                padding: const EdgeInsetsDirectional.only(end: 15),
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonAvatar(
                        path: gift.user.icon, size: 34, shape: BoxShape.circle),
                    const SizedBox(width: 7),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 70),
                      child: Text(
                        gift.user.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 25),
      ],
    );
  }
}
