import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 塔罗牌礼物提示
class SlpGiftTopActivityTip extends StatelessWidget {
  final double width;
  final BbGiftPanelActivityBanner data;

  const SlpGiftTopActivityTip(this.data, {super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    if (data.icon.isEmpty) {
      return const SizedBox.shrink();
    }

    if (data.iconH * data.iconW == 0) {
      // 如果没有宽高，直接显示老样式
      return GestureDetector(
        onTap: () {
          if (data.url.isEmpty) return;
          String url = Uri.decodeFull(data.url);
          Log.d('SlpGiftTopActivityTip url=$url');
          SchemeUrlHelper.instance().jump(url);
        },
        child: CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(data.icon),
            width: width,
            fit: BoxFit.fitWidth),
      );
    }

    double rate = width / data.iconW;
    double height = data.iconH * rate;
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(data.icon), fit: BoxFit.fill),
          ...List.generate(data.actions.length, (index) {
            BbGiftPanelActivityBannerActions action = data.actions[index];
            return PositionedDirectional(
                start: action.x * rate,
                top: action.y * rate,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (action.url.isEmpty) return;
                    String url = Uri.decodeFull(action.url);
                    Log.d('SlpGiftTopActivityTip url=$url');
                    SchemeUrlHelper.instance().jump(url);
                  },
                  child: SizedBox(
                    width: action.w * rate,
                    height: action.h * rate,
                  ),
                ));
          })
        ],
      ),
    );
  }
}
