import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 首页顶部menu红点封装
class RedPoint extends StatefulWidget {
  final VoidCallback? onClick;
  final bool black;
  final Color? iconColor;
  final bool displayTopRightRedPoint;

  const RedPoint({
    super.key,
    this.onClick,
    this.black = false,
    this.iconColor,
    this.displayTopRightRedPoint = false,
  });

  @override
  _RedPointState createState() => _RedPointState();
}

class _RedPointState extends State<RedPoint> {
  late bool _display;

  @override
  initState() {
    _display = _getDisplay();
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  bool _getDisplay() {
    return false; // 强制不显示红点
//    if (Util.isVerify) return false;
//    return Util.parseInt(Config.getInt('_banner', 0)) > Config.getInt('banner.point', 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        InkWell(
          onTap: widget.onClick,
          child: Container(
            width: kToolbarHeight,
            height: kToolbarHeight,
            alignment: AlignmentDirectional.center,
            child: R.img(
              "icon_top_menu.svg",
              width: 24.0,
              height: 24.0,
              color: widget.iconColor ?? R.color.mainTextColor,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
        ),
        widget.displayTopRightRedPoint
            ? PositionedDirectional(
                end: 16.0,
                top: 13.0,
                child: IgnorePointer(
                  child: R.img(
                    'redpoint.png',
                    width: 12.0,
                    height: 12.0,
                    package: ComponentManager.MANAGER_BASE_CORE,
                  ),
                ),
              )
            : Container(),
        _display
            ? PositionedDirectional(
                start: 13.0,
                top: 6.0,
                child: IgnorePointer(
                  child: R.img(
                    'redpoint.png',
                    width: 15.0,
                    height: 15.0,
                    package: ComponentManager.MANAGER_BASE_CORE,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
