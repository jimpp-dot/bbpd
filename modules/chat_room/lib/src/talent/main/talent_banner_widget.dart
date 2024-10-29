import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/talent/data/talent_main_view_model.dart';

import '../data/talent_models.dart';
import 'package:provider/provider.dart' hide Selector;

class TalentBannerWidget extends StatefulWidget {
  final VoidCallback? onBannerClick;

  const TalentBannerWidget({this.onBannerClick, super.key});

  @override
  _TalentBannerWidgetState createState() => _TalentBannerWidgetState();
}

class _TalentBannerWidgetState extends State<TalentBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onBannerClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: Util.width,
        height: (Util.width - 24) / 371 * 74,
        child: Consumer<TalentMainViewModel>(
          builder: (context, model, child) {
            BroadcasterInfoResp? data = model.data;
            return Stack(
              children: [
                if (data?.bannerV2.isNotEmpty ?? false)
                  CachedNetworkImage(
                    imageUrl: data!.bannerV2,
                    placeholder: const DefaultPlaceholder(),
                    width: Util.width - 24,
                    fit: BoxFit.fitWidth,
                  ),

                // 下一个节目文案
                PositionedDirectional(
                  start: 50,
                  bottom: 10,
                  child: LimitedBox(
                    maxWidth: 120,
                    child: MarqueeText(
                      text: data?.bannerText ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 12.dp),
                      speed: 15,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
