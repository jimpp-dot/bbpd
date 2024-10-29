import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class BottomBarCenterActivityBtn extends StatelessWidget {
  final ActMiddleBarsData data;

  const BottomBarCenterActivityBtn({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Color color =
        Util.parseColor(darkMode ? data.darkColor : data.lightColor) ??
            Colors.transparent;
    return GestureDetector(
      onTap: () {
        Tracker.instance.track(TrackEvent.click_home_tab_center,
            properties: {'uid': Session.uid, 'refer': data.content});
        SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, data.jumpUrl);
      },
      child: SizedBox(
        height: 87.5,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(data.icon),
              fit: BoxFit.fill,
              width: 77,
              height: 77,
            ),
            PositionedDirectional(
              bottom: 0,
              child: Text(data.content,
                  style: TextStyle(fontSize: 10, color: color), maxLines: 1),
            ),
          ],
        ),
      ),
    );
  }
}
