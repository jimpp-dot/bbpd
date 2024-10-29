import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class GIcon {
  String icon;
  double x;
  double y;

  GIcon(this.icon, this.x, this.y);
}

class GroupIconCircle extends StatelessWidget {
  final List<String> icons;
  final double width;
  final List<int> _imageRadiusArray = [52, 38, 34, 28, 24];
  final List<int> _radiusArray = [0, 20, 22, 34, 30];
  final List<double> _addY = [0.0, 0.0, 3.0, 0.0, 2.0];

  GroupIconCircle({super.key, required this.icons, this.width = 52});

  List<GIcon> _getIcon() {
    List<GIcon> list = [];
    int len = min(icons.length, _imageRadiusArray.length);
    int diff = len % 2 == 0 ? 45 : 0;
    for (int i = 0; i < len; i++) {
      list.add(
          GIcon((icons[i].isNotEmpty) ? ('${System.imageDomain}${icons[i]}!head100') : icons[i], _posX(i, len, diff), _posY(i, len, diff)));

      if (i >= 5) break;
    }

    return list;
  }

  double _posX(index, total, diff) {
    double radius = _radiusArray[total - 1] / 2;
    double patch = (_radiusArray[total - 1] - _imageRadiusArray[total - 1]) / 2;
    double r = (index / total * 360 + diff - 90) / 180 * pi;

    return cos(r) * radius + (width / 2 - radius) + patch;
  }

  double _posY(index, total, diff) {
    double radius = _radiusArray[total - 1] / 2;
    double patch = (_radiusArray[total - 1] - _imageRadiusArray[total - 1]) / 2;
    double r = (index / total * 360 + diff - 90) / 180 * pi;

    return sin(r) * radius + (width / 2 - radius) + patch + _addY[total - 1];
  }

  Widget _buildEmpty() {
    return SizedBox(width: width, height: width);
  }

  Widget _buildBody() {
    List<GIcon> list = _getIcon();
    if (list.isEmpty) return _buildEmpty();

    double radius = _imageRadiusArray[list.length - 1].toDouble();

    List<Widget> widgets = [];

    for (var icon in list) {
      widgets.add(PositionedDirectional(
        top: icon.y,
        start: icon.x,
        child: Container(
            width: radius,
            height: radius,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius / 2),
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                )),
            child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius / 2),
                ),
                child: CachedNetworkImage(
                  imageUrl: icon.icon,
                  fit: BoxFit.cover,
                  errorWidget: (icon.icon.isEmpty)
                      ? Image.asset(
                          R.imagePath("user_icon_default.png", package: ComponentManager.MANAGER_BASE_CORE),
                          fit: BoxFit.cover,
                        )
                      : null,
                ))),
      ));
    }

    return SizedBox(
      width: width,
      height: width,
      child: Stack(
        clipBehavior: Clip.none,
        children: widgets,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
