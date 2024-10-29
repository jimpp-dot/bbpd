import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// @Author bobzhou
/// @Description 房间item 用户头像合集
/// @Date 2022-03-21 18:20

class RoomItemWidgetAvatars extends StatelessWidget {
  final int maxCount;

  final List<String> micIcons;

  const RoomItemWidgetAvatars(
      {super.key, required this.micIcons, this.maxCount = 3});

  @override
  Widget build(BuildContext context) {
    return _buildAvatars();
  }

  Widget _buildAvatars() {
    List<Widget> widgets = [];

    double totalWidth = 0;
    List<String> showIcons = [];
    for (int index = 0; index < micIcons.length; index++) {
      int addWidth = (index == 0 ? 18 : 13);
      if (index >= maxCount) {
        break;
      }

      totalWidth += addWidth;
      showIcons.add(micIcons[index]);
    }

    for (int index = 0; index < showIcons.length; index++) {
      widgets.add(
        PositionedDirectional(
          start: 13.0 * index,
          child: _buildAvatar(showIcons[index], index),
        ),
      );
    }
    return SizedBox(
      width: totalWidth,
      height: 18,
      child: Stack(
        children: widgets,
      ),
    );
  }

  Widget _buildAvatar(String url, int index) {
    bool needNum = (index == maxCount - 1) && (micIcons.length > maxCount);
    return Container(
      width: 18,
      height: 18,
      foregroundDecoration: const ShapeDecoration(
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 0.5)),
        color: Colors.transparent,
      ),
      alignment: AlignmentDirectional.center,
      child: Stack(
        children: [
          CommonAvatar(
            path: url,
            suffix: Util.squareResizeSuffix(50),
            size: 18,
            shape: BoxShape.circle,
            resizeCacheWidth: true,
          ),
          if (needNum)
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.4),
              ),
              alignment: AlignmentDirectional.center,
              child: NumText(
                '${micIcons.length}', // 直接显示麦上人数，by 冬兵 2023.9.18
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
