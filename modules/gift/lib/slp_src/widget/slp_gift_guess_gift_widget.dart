import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';

/// 礼物猜猜乐提示条

class SlpGiftGuessGiftWidget extends StatelessWidget {
  final String title;
  final String tips;
  final String icon;
  final String jumpPage;

  const SlpGiftGuessGiftWidget(
      {Key? key,
      required this.title,
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
            gradient: const LinearGradient(
                colors: [Color(0xFF99B0FF), Color(0xFFC366FF)]),
          ),
          foregroundDecoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFFEB0FF), width: 1),
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
          ),
          child: Row(
            children: [
              if (Util.validStr(icon)) ...[
                CachedNetworkImage(
                  imageUrl: icon,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      tips,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 30,
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Colors.white,
                ),
                child: Text(K.gift_go_understand,
                    style: const TextStyle(
                        color: Color(0xFF9A62FE),
                        fontSize: 13,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ));
  }
}
