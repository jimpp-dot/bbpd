import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import 'package:personaldata/k.dart';
import 'package:personaldata/src/room_user_profile/widget/room_user_profile_style.dart';

/// 动态图片
class RoomUserProfileCirclePicWidget extends StatelessWidget {
  final ChatRoomData room;
  final int uid;
  final RepCirclePics albumPics;

  const RoomUserProfileCirclePicWidget({
    Key? key,
    required this.room,
    required this.uid,
    required this.albumPics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildCirclePics(context);
  }

  Widget _buildCirclePics(BuildContext context) {
    int num = 5;
    if (Util.width < 375) {
      num = 4;
    }
    String leftCount = '';
    if (albumPics.list.length > num) {
      int left = albumPics.list.length - (num - 1); // 最后一张不算
      leftCount = left >= 99 ? '+99' : '+$left';
    }

    return RoomUserProfileInfoContainer(
      title: K.moment,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.pop(context);
          IPersonalDataManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          manager.openImageScreen(context, uid,
              rid: room.rid,
              refer: const PageRefer('room'),
              initialTab: ImageScreenTabType.moment);
        },
        child: Row(children: <Widget>[
          ...albumPics.list
              .take(num)
              .toList()
              .asMap()
              .entries
              .map((entry) => _renderPicItem(
                  entry.value, entry.key == num - 1 ? leftCount : ''))
              .expand((_) => [_, const SizedBox(width: 8)]),
          const Spacer(),
          R.img(BaseAssets.shared$icon_next_fq_svg,
              color: R.color.thirdTextColor,
              width: 16,
              height: 16,
              package: ComponentManager.MANAGER_BASE_CORE),
          const SizedBox(width: 8),
        ]),
      ),
    );
  }

  Widget _renderPicItem(CirclePicItem data, String leftStr) {
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Stack(
        children: [
          CommonAvatar(
            path: Util.splitPx(data.url),
            size: 44,
            borderRadius: BorderRadius.circular(8),
            suffix: '!head100',
          ),
          if (!Util.isStringEmpty(leftStr))
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Center(
                child: Text(
                  leftStr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
