import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

///房间item 用户头像合集
class RoomUsersAvatarsList extends StatelessWidget {
  final int maxCount;
  final int num;
  final List<String> micIcons;

  const RoomUsersAvatarsList(
      {Key? key, required this.micIcons, required this.num, this.maxCount = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildAvatars();
  }

  Widget _buildAvatars() {
    List<Widget> widgets = [];

    double totalWidth = 0;
    List<String> showIcons = [];
    for (int index = 0; index < micIcons.length; index++) {
      int addWidth = (index == 0 ? 21 : 15);
      if (index >= maxCount) {
        break;
      }

      totalWidth += addWidth;
      showIcons.add(micIcons[index]);
    }

    for (int index = 0; index < showIcons.length; index++) {
      widgets.add(
        PositionedDirectional(
          start: 15.0 * index,
          child: _buildAvatar(showIcons[index], index),
        ),
      );
    }
    return SizedBox(
      width: totalWidth,
      height: 21,
      child: Stack(
        children: widgets,
      ),
    );
  }

  Widget _buildAvatar(String url, int index) {
    bool needNum = index == maxCount - 1;
    return Container(
      width: 21,
      height: 21,
      foregroundDecoration: const ShapeDecoration(
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 0.5)),
        color: Colors.transparent,
      ),
      alignment: AlignmentDirectional.center,
      child: Stack(
        children: [
          CommonAvatar(
            path: url,
            suffix: '!head100',
            size: 21,
            shape: BoxShape.circle,
            resizeCacheWidth: true,
          ),
          if (needNum)
            Container(
              width: 21,
              height: 21,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.4),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                '$num+',
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
