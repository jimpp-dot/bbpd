import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class HeartRaceBaseWidget {
  static Widget buildIcon() {
    return CachedNetworkImage(
      width: 85,
      height: 79,
      imageUrl:
          Util.getRemoteImgUrl('static/room/heart_race/heart_race_icon.webp'),
    );
  }

  static Widget buildBg(double bgWidth) {
    return RepaintBoundary(
      child: CachedNetworkImage(
        imageUrl:
            Util.getRemoteImgUrl('static/room/heart_race/heart_race_bg.webp'),
        width: bgWidth,
        height: bgWidth,
      ),
    );
  }

  static Widget buildHelp() {
    return GestureDetector(
      onTap: () {
        /// 心跳竞速H5
        String url = Util.getWebUrl('banban/banban-heartbeat-rule/home');
        showDialog(
            barrierDismissible: false,
            context: System.context,
            builder: (BuildContext context) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: Util.width - 50,
                        height: Util.height - 250,
                        child: BaseWebviewScreen(
                          url: url,
                          embeddedWidget: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 19),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: R.img(
                        'ic_help_close.webp',
                        width: 38,
                        height: 38,
                        package: ComponentManager.MANAGER_BASE_ROOM,
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 10, end: 10, top: 10, bottom: 10),
        child: Stack(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
            R.img(
              'ic_help.webp',
              width: 16,
              height: 16,
              color: Colors.white,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ],
        ),
      ),
    );
  }
}
