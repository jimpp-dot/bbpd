import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import '../base/widget/mic_follow_btn.dart';

class DatingUserIcon extends StatelessWidget {
  final ChatRoomData room;
  final RoomPosition position;

  /// 是否接待or房主
  final bool isAnchor;

  final double? width;
  final String? emptyDesc;
  final int? sex;

  const DatingUserIcon(
    this.room,
    this.position, {
    super.key,
    this.width,
    this.emptyDesc,
    this.sex,
    this.isAnchor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 102,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.11),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              const SizedBox(height: 12),
              UserIcon(
                room: room,
                position: position,
                size: 54,
                emptyMicBuilder: (context) =>
                    room.config?.mode == RoomMode.Auto && position.lock
                        ? _buildLockMic()
                        : sex == null
                            ? _buildEmptyReception()
                            : _buildEmptyMic(),
              ),
              const Spacer(),
              _buildBottomInfo(),
            ],
          ),
          if (isAnchor)
            PositionedDirectional(
              top: 0,
              start: 0,
              child: RoomCounter(
                name: '',
                uid: position.uid,
                counter: room.config?.counter,
                decoration: const BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(10),
                      bottomEnd: Radius.circular(10)),
                ),
              ),
            ),
          PositionedDirectional(
            top: 0,
            end: 0,
            child: DatingSponsorAtMic(position: position, room: room),
          )
        ],
      ),
    );
  }

  Widget _buildEmptyReception() => Container(
        width: 54,
        height: 54,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white10),
        alignment: AlignmentDirectional.center,
        child: R.img(
          RoomAssets.chat_room$base_empty_join_webp,
          color: Colors.white70,
          width: 24,
          height: 24,
        ),
      );

  Widget _buildEmptyMic() => Container(
        width: 54,
        height: 54,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white10),
        alignment: AlignmentDirectional.center,
        child: R.img(
          sex == 1
              ? BaseAssets.shared$icon_sex_colours_male_svg
              : BaseAssets.shared$icon_sex_colours_female_svg,
          color: Colors.white70,
          width: 24,
          height: 24,
        ),
      );

  Widget _buildLockMic() => Container(
        width: 54,
        height: 54,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white10),
        alignment: AlignmentDirectional.center,
        child: R.img(
          RoomAssets.chat_room$base_empty_close_webp,
          color: Colors.white70,
          width: 24,
          height: 24,
        ),
      );

  Widget _buildBottomInfo() {
    if (position.uid <= 0) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Text(
          emptyDesc ?? '',
          style: const TextStyle(
              color: Color(0xFFBBBBBB),
              fontSize: 10,
              fontWeight: FontWeight.w500),
        ),
      );
    }

    return Container(
      height: 24,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.11),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 3),
          UserSexWidget(
            size: 16,
            sex: position.sexValue,
            iconSize: 12,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              position.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          MicFollowBtn(room, user: position),
          const SizedBox(width: 3),
        ],
      ),
    );
  }
}
