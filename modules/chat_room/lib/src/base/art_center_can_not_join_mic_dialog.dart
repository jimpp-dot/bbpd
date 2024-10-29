import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class ArtCenterCanNotJoinMicDialog extends StatelessWidget {
  final int toRid;
  const ArtCenterCanNotJoinMicDialog({super.key, required this.toRid});

  static Future<bool?> show({
    required BuildContext context,
    required int toRid,
  }) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.7,
      builder: (context) {
        return ArtCenterCanNotJoinMicDialog(
          toRid: toRid,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// do nothing
      },
      child: Container(
        width: Util.width,
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              K.room_art_center_can_not_join_mic_title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: R.color.mainTextColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: Util.width - 40,
              height: 1,
              color: R.color.secondBgColor,
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              K.room_art_center_cant_join_maic_subtitle_1,
              style: TextStyle(
                fontSize: 16,
                color: R.color.mainTextColor,
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              K.room_art_center_cant_join_maic_subtitle_2,
              style: TextStyle(
                fontSize: 13,
                color: R.color.secondTextColor,
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    /// 再等等
                    Navigator.of(context).pop(false);
                  },
                  child: Container(
                    width: (Util.width - 40 - 20) / 2,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(24),
                      color: const Color(0xFFF5F5F5),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      K.cancel,
                      style: TextStyle(
                        fontSize: 15,
                        color: R.color.mainTextColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    /// 前往主播所在房间
                    IRoomManager roomManager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_BASE_ROOM);
                    roomManager.openChatRoomScreenShow(context, toRid,
                        refer: 'art_center');
                  },
                  child: Container(
                    width: (Util.width - 40 - 20) / 2,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(24),
                      gradient: LinearGradient(
                        begin: AlignmentDirectional.centerStart,
                        end: AlignmentDirectional.centerEnd,
                        colors: R.color.mainBrandGradientColors,
                      ),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      K.room_join_anchor_room,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15 + Util.iphoneXBottom,
            )
          ],
        ),
      ),
    );
  }
}
