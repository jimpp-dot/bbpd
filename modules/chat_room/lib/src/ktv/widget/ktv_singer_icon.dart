import 'package:shared/shared.dart';
import 'package:shared/widget/sound_fast_ware.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:flutter/material.dart';

/// ktv 单人演唱者头像
///
class KtvSingerIcon extends StatelessWidget {
  final ChatRoomData room;

  final bool isPause;
  final String? icon;
  final int uid;

  const KtvSingerIcon(this.room,
      {super.key, required this.uid, this.icon, this.isPause = false});

  String get ring => room.getRingByUid(uid);

  String get frame => room.getFrameByUid(uid);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onIconTap(context);
      },
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            ValueListenableBuilder(
              valueListenable: room.speakers,
              builder: (context, speakers, child) {
                return SoundEffectWidget(
                  isSpeaking: speakers.containsKey(uid),
                  width: 62,
                  ring: ring,
                );
              },
            ),
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: Util.getUserIconUrl(icon),
                width: 62,
                height: 62,
              ),
            ),
            if (isPause == true) ...[
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(31),
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Text(
                K.ktv_paused,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
            if (frame.isNotEmpty)
              PositionedDirectional(
                top: -0.05 * 62,
                start: -0.05 * 62,
                child: SizedBox(
                  width: 62 * 1.1,
                  height: 62 * 1.1,
                  child: IgnorePointer(
                    child: CachedNetworkImage(
                      imageUrl: Util.getRemoteImgUrl(frame),
                      width: 62 * 1.1,
                      height: 62 * 1.1,
                      key: ObjectKey('ktv-chorus-user-icon-frame-$frame'),
                      errorWidget: const SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void onIconTap(BuildContext context) {
    if (uid > 0) {
      RoomNavUtil.goToImageScreenDialog(context, null, room, userId: uid);
    }
  }
}
