import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class RoundNetIcon extends StatelessWidget {
  final String? url;
  final double size;
  final GestureTapCallback? onTap;
  final bool? inRoom; // 是否在房间
  final bool showBorder;
  final bool isOnline;

  const RoundNetIcon({
    super.key,
    required this.url,
    this.size = 52,
    this.onTap,
    this.inRoom = false,
    this.showBorder = true,
    this.isOnline = false,
  });

  static String? _getUrl(String? path, String? suffix) {
    String? url;
    if (path != null) {
      url = Util.imageFullUrl(path);
      if (suffix != null &&
          !url.contains(RegExp(r'!head(\d+)')) &&
          !url.contains('x-oss-process=image/resize')) {
        url = url + suffix;
      }
      url = Util.recombineUrl(url);
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox.fromSize(
        size: Size(size, size),
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: inRoom != null && inRoom!
                        ? null
                        : showBorder
                            ? Border.all(color: R.color.secondBgColor, width: 1)
                            : null,
                  ),
                  child: ClipOval(
                    child: _buildIcon(),
                  ),
                ),
                if (inRoom != null && inRoom!)
                  Positioned.fill(
                    child: GradientBorder(
                      borderGradient: LinearGradient(
                          colors: R.colors.mainBrandGradientColors,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderWidth: 1.5,
                      borderRadius: 25,
                    ),
                  ),
              ],
            ),
            if (inRoom != null && inRoom!)
              PositionedDirectional(
                bottom: 0,
                end: 2,
                child: Container(
                  width: 16.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF85FF67), Color(0xFF85FF67)],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: RepaintBoundary(
                    child: R.img(
                      "living_small.webp",
                      package: ComponentManager.MANAGER_BASE_CORE,
                      width: 12.0,
                      color: Colors.black,
                      height: 12.0,
                    ),
                  ),
                ),
              ),
            if (inRoom == false && isOnline)
              PositionedDirectional(
                bottom: 0,
                end: size > 52 ? 4 : 2,
                child: const OnlineDot(padding: 0),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (url == null || url!.trim().isEmpty) {
      return R.img(
        'user_icon_default.png',
        width: size,
        height: size,
        fit: BoxFit.cover,
        package: ComponentManager.MANAGER_BASE_CORE,
      );
    } else {
      return RepaintBoundary(
        child: CachedNetworkImage(
          imageUrl: _getUrl(url, '!head100'),
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorWidgetType: ErrorWidgetType.defaultUserIcon,
          placeholder: R.img(
            "user_icon_default.png",
            width: size,
            height: size,
            package: ComponentManager.MANAGER_BASE_CORE,
          ),
        ),
      );
    }
  }
}
