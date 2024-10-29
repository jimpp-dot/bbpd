import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/assets.dart';
import 'package:gift/slp_src/model/pb/slp_gift_extension.dart';

/// 礼物套装提示条
class GiftSuitTipsWidget extends StatelessWidget {
  final BbGiftPanelGift gift;
  final GestureTapCallback onTap;

  const GiftSuitTipsWidget(
      {super.key, required this.gift, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
        padding: const EdgeInsetsDirectional.all(0.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
                colors: [Color(0xFFFFE666), Color(0xFFFFFFAD)])),
        child: Container(
          height: 53,
          padding: const EdgeInsetsDirectional.only(start: 5.5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.5),
              gradient: const LinearGradient(
                  colors: [Color(0xFF6D83FF), Color(0xFFE2A1FF)])),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: gift.giftIcon + Util.getGiftUrlSuffix(),
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: gift.giftSuit.titleContent
                            .map((e) => TextSpan(
                                  text: e.content,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                        e.isBold ? FontWeight.w600 : null,
                                    color:
                                        Util.parseColor(e.color, Colors.white),
                                  ),
                                ))
                            .toList(),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 18,
                      child: MarqueeWidget(
                        child: Text.rich(
                          TextSpan(
                            children: gift.giftSuit.descContent
                                .map((e) => TextSpan(
                                      text: e.content,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight:
                                            e.isBold ? FontWeight.w600 : null,
                                        color: Util.parseColor(
                                            e.color, Colors.white),
                                      ),
                                    ))
                                .toList(),
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              R.img(
                Assets.gift$ic_next_small_svg,
                width: 14,
                height: 14,
                color: const Color(0xFF6A1FD3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
