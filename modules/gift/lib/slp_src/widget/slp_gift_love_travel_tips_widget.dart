import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';

/// 爱的旅行机票提示条

class SlpGiftLoveTravelTipsWidget extends StatelessWidget {
  final String tips;
  final String icon;
  final String jumpPage;

  const SlpGiftLoveTravelTipsWidget(
      {Key? key,
      required this.tips,
      required this.icon,
      required this.jumpPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
      child: GradientBorderBox(
        gradientColors: const [Color(0xFF9EEEFE), Color(0xFFCDEEFB)],
        begin: AlignmentDirectional.centerStart,
        end: AlignmentDirectional.centerEnd,
        borderWidth: 1,
        borderRadius: 12,
        child: Container(
          height: 58,
          padding: const EdgeInsetsDirectional.only(start: 7, end: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                  colors: [Color(0xFF4EEDDE), Color(0xFF3CBBFD)])),
          child: Row(
            children: [
              if (Util.validStr(icon)) ...[
                CachedNetworkImage(
                  imageUrl: icon,
                  width: 42,
                  height: 42,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 7),
              ],
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      K.gift_love_travel,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF006193),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      tips,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF006193)),
                    ),
                  ],
                ),
              ),
              if (Util.validStr(jumpPage))
                GestureDetector(
                  onTap: () {
                    if (!Util.validStr(jumpPage)) return;
                    BaseWebviewScreen.show(context, url: jumpPage);
                  },
                  child: Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Text(
                      K.gift_go_understand,
                      style: TextStyle(
                          fontSize: 14,
                          color: R.color.mainBrandColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
