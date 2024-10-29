import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';

import '../../assets.dart';

/// 表白玩法提示条

class SlpGiftConfessWidget extends StatelessWidget {
  final String tips;
  final String icon;
  final String jumpPage;

  const SlpGiftConfessWidget(
      {Key? key,
      required this.tips,
      required this.icon,
      required this.jumpPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!Util.validStr(jumpPage)) return;
          SchemeUrlHelper.instance().checkSchemeUrlAndGo(
            System.context,
            SchemeUrlHelper.instance().concatSchemeUrl(
                jumpPage, SchemeUrlHelper.scheme_path_common_redirect),
          );
        },
        child: Container(
          height: 56,
          padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
          margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF171621).withOpacity(0.7),
            image: DecorationImage(
              image: AssetImage(
                R.imagePath(
                  Assets.gift_top_confess_tips_bg_webp,
                  package: ComponentManager.MANAGER_GIFT,
                ),
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            children: [
              if (Util.validStr(icon)) ...[
                CachedNetworkImage(
                  imageUrl: icon,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 20),
              ],
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      K.gift_confess,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF640093),
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      tips,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        color: const Color(0xFF640093).withOpacity(0.8),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 50)
            ],
          ),
        ));
  }
}
