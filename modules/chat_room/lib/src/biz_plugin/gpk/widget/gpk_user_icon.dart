import 'package:shared/shared.dart';
import 'package:shared/widget/sound_fast_ware.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/punish/model/punish_beans.dart';
import 'package:chat_room/src/base/widget/user_icon_outerborder.dart';

class GPKUserIcon extends StatefulWidget {
  final double size;
  final double borderWidth;
  final List<UserPunish>? userPunish;
  final String? icon;
  final int uid;
  final bool isSpeaking;
  final bool? displayEmoteAtMic;
  final bool? isOffLine;
  final bool? isMicForbid;

  const GPKUserIcon({
    super.key,
    required this.uid,
    required this.size,
    this.borderWidth = 2,
    this.userPunish,
    this.icon,
    required this.isSpeaking,
    this.displayEmoteAtMic = true,
    this.isOffLine,
    this.isMicForbid,
  });

  @override
  _GPKUserIconState createState() => _GPKUserIconState();
}

class _GPKUserIconState extends State<GPKUserIcon> {
  Color bgColor = const Color(0xff000000).withOpacity(0.2);

  double get size => widget.size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: ChatRoomUtil.getGlobalKey(widget.uid), //打赏产生的礼物动画需要根据该key找到坐标做位移效果
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: _buildStackContent(),
      ),
    );
  }

  List<Widget> _buildStackContent() {
    return <Widget>[
      _buildImage(),
      _buildPunishCover(),
      _buildWaterSound(),
      _buildEmoteAtMic(),
      _buildOffLine(),
      _buildMicStatus(),
      UserOuterBorderWidget(size: size),
    ];
  }

  /// 麦克风水波纹
  Widget _buildWaterSound() {
    return SoundEffectWidget(
      isSpeaking: widget.isSpeaking,
      aniColor: R.color.mainBrandColor,
      width: size,
      borderWidth: 3.0,
    );
  }

  /// 麦上的表情
  Widget _buildEmoteAtMic() {
    if (widget.displayEmoteAtMic ?? false) {
      return EmoteAtMic(
        uid: widget.uid,
        position: 0,
        width: size,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  /// 用户头像
  Widget _buildImage() {
    double itemWidth = size;
    String? icon = widget.icon;
    if (icon != null && icon.isNotEmpty) {
      bool hasPunishMa = false;
      //惩罚的头像马赛克
      if (widget.userPunish != null && widget.userPunish!.isNotEmpty) {
        int index = widget.userPunish!
            .indexWhere((element) => element.type == SystemPunishType.mask);
        if (index >= 0) {
          hasPunishMa = true;
        }
      }
      if (hasPunishMa) {
        return ImageBlurWidget(
          borderRadius: itemWidth / 2,
          child: CommonAvatar(
            path: icon,
            shape: BoxShape.circle,
            size: itemWidth,
          ),
        );
      } else {
        return CommonAvatar(
          path: icon,
          shape: BoxShape.circle,
          size: itemWidth,
        );
      }
    } else {
      return Container(
        width: itemWidth,
        height: itemWidth,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(itemWidth / 2),
        ),
      );
    }
  }

  //惩罚的搞笑头像框
  Widget _buildPunishCover() {
    if (widget.userPunish != null && widget.userPunish!.isNotEmpty) {
      Log.d("this.widget.userPunish is not null");
      int index = widget.userPunish!
          .indexWhere((e) => e.type == SystemPunishType.header);
      if (index >= 0) {
        UserPunish userPunish = widget.userPunish![index];
        String frameImage = userPunish.content;
        double overflow = -5.0;
        if (size <= 44) {
          // 小麦位的头像框适配
          overflow = -3.0;
        }
        return PositionedDirectional(
          start: overflow,
          end: overflow,
          top: overflow,
          bottom: overflow,
          child: IgnorePointer(
            child: CachedNetworkImage(
              imageUrl: frameImage,
              errorWidget: Container(),
            ),
          ),
        );
      }
    }
    return const SizedBox.shrink();
  }

  /// 离线蒙层&文案
  Widget _buildOffLine() {
    if (widget.isOffLine == null || widget.isOffLine == false) {
      return const SizedBox.shrink();
    }
    return IgnorePointer(
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(size / 2 + 1),
        child: Container(
          color: Colors.black.withOpacity(0.4),
          width: size,
          height: size,
          alignment: Alignment.center,
          child: Text(
            K.room_offline,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF9B9B9B),
            ),
          ),
        ),
      ),
    );
  }

  /// 麦克风状态
  Widget _buildMicStatus() {
    if (widget.isMicForbid == true) {
      return PositionedDirectional(
        end: 0.0,
        bottom: 0.0,
        child: IgnorePointer(
          child: R.img(
            RoomAssets.chat_room$live_room_live_pk_mic_forbiden_webp,
            width: 16.0,
            height: 16.0,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
