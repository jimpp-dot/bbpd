import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

/// 麦位连线 麦下用户快照
///
class MicLinkOffMicUser extends StatelessWidget {
  final ChatRoomData room;

  const MicLinkOffMicUser(this.room, {super.key});

  void _joinMic(BuildContext context) async {
    if (room.config?.mode == RoomMode.Lock && Session.uid != room.config?.uid) {
      // 非自由上麦，排麦
      await RoomRepository.queue(room.realRid, RoomConstant.Queue_Join,
          needCertify: true,
          type: room.needVerify,
          newType: room.needVerifyNew);
    } else {
      // 自由上麦，上麦
      await RoomRepository.joinMic(room.realRid, -1,
          uid: 0,
          needCertify: true,
          type: room.needVerify,
          newType: room.needVerifyNew);
    }
  }

  @override
  Widget build(BuildContext context) {
    /// true：排麦中 false：未排麦
    bool isWaitingMic = room.wait.contains(Session.uid);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonAvatar(
          path: Session.icon,
          shape: BoxShape.circle,
          size: 44,
          color: const Color.fromRGBO(255, 255, 255, 0.5),
          colorBlendMode: BlendMode.modulate,
        ),
        const SizedBox(height: 6),
        if (isWaitingMic)
          Container(
            width: 44,
            height: 15,
            alignment: AlignmentDirectional.center,
            decoration: const ShapeDecoration(
                shape: StadiumBorder(), color: Colors.white30),
            child: const Text(
              '已申请',
              style: TextStyle(
                  fontSize: 9,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          )
        else
          GestureDetector(
            onTap: () => _joinMic(context),
            child: Container(
              width: 44,
              height: 15,
              alignment: AlignmentDirectional.center,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                gradient: LinearGradient(
                    colors: [Color(0xFFFF8E2B), Color(0xFFE6D030)]),
              ),
              child: const Text(
                '申请上座',
                style: TextStyle(
                    fontSize: 9,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
      ],
    );
  }
}
