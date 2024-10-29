import 'dart:math' as math;

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/widget/chat_room_bg_screen.dart';
import 'package:chat_room/src/base/widget/room_background_info.dart';
import 'package:chat_room/src/music/model/music_room_info.dart';
import 'package:chat_room/src/music/playlist/music_playlist_screen.dart';
import 'package:flutter/material.dart';

/// 音乐房 中间光盘
///
class MusicRoomArea extends StatefulWidget {
  final MusicRoomInfoResp? musicInfo;
  final ChatRoomData room;

  const MusicRoomArea({super.key, required this.room, this.musicInfo});

  @override
  State<MusicRoomArea> createState() => _MusicRoomAreaState();
}

class _MusicRoomAreaState extends State<MusicRoomArea>
    with TickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(duration: const Duration(seconds: 6), vsync: this)
          ..repeat();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? icon = widget.musicInfo?.data?.currentSong?.fromUser?.icon;
    return Stack(
      children: <Widget>[
        SizedBox(
          height: 239,
          child: _bgWidget(),
        ),
        //中间歌手头像和CD盘
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 30),
            child: AnimatedBuilder(
              animation: _animController,
              child: Container(
                width: 135,
                height: 135,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(RoomAssets.chat_room$music_music_cd_webp),
                    fit: BoxFit.fill,
                  ),
                ),
                alignment: AlignmentDirectional.center,
                child: Visibility(
                  visible: icon != null && icon.isNotEmpty,
                  child: CommonAvatar(
                    path: icon ?? '',
                    shape: BoxShape.circle,
                    size: 55,
                  ),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle:
                      _isPlaying() ? _animController.value * 2.0 * math.pi : 0,
                  child: child,
                );
              },
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 180),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 200.0),
              padding: const EdgeInsetsDirectional.only(top: 4, bottom: 4),
              child: Text(
                widget.musicInfo?.data?.currentSong?.name ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),

        /// 播放列表
        PositionedDirectional(
          end: 18.0,
          top: 62.0,
          child: InkWell(
            onTap: () {
              MusicPlayListScreen.openMusicPlayListScreen(context, widget.room);
            },
            child: Container(
              height: 22,
              padding: const EdgeInsetsDirectional.only(start: 9, end: 9),
              decoration: BoxDecoration(
                color: const Color(0xFF000000).withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.circular(11)),
              ),
              child: Row(
                children: [
                  R.img(
                    'music/music_room_note.webp',
                    package: ComponentManager.MANAGER_BASE_ROOM,
                    width: 12.0,
                    height: 12.0,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    K.room_music_playlist,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool _isPlaying() {
    var state = widget.musicInfo?.data?.currentSong?.state;
    return state == MusicRoomStatus.play || state == MusicRoomStatus.resume;
  }

  Widget _bgWidget() {
    RoomBackGroundInfo? backGroundInfo = _getBgInfo();
    if (backGroundInfo == null) return const SizedBox.shrink();

    return ChatRoomBgScreen(
      roomBackGroundInfo: backGroundInfo,
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      isPlaying: _isPlaying(),
      bgColor: Colors.transparent,
    );
  }

  RoomBackGroundInfo? _getBgInfo() {
    if (_isPlaying() &&
        widget.musicInfo?.data?.musicTheme?.dynamicIcon != null &&
        widget.musicInfo?.data?.musicTheme?.dynamicIcon.isNotEmpty == true) {
      return RoomBackGroundInfo(
        type: _getBgInfoType(widget.musicInfo?.data?.musicTheme?.iconType),
        url:
            '${System.imageDomain}${widget.musicInfo?.data?.musicTheme?.dynamicIcon}',
      );
    } else if (widget.musicInfo?.data?.musicTheme?.dynamicStaticIcon != null &&
        widget.musicInfo?.data?.musicTheme?.dynamicStaticIcon.isNotEmpty ==
            true) {
      return RoomBackGroundInfo(
        type: _getBgInfoType(
            widget.musicInfo?.data?.musicTheme?.dynamicStaticIconType),
        url:
            '${System.imageDomain}${widget.musicInfo?.data?.musicTheme?.dynamicStaticIcon}',
      );
    }
    return null;
  }

  RoomBackGroundType _getBgInfoType(String? type) {
    if (type == 'mp4') {
      return RoomBackGroundType.mp4;
    }
    return RoomBackGroundType.jpg;
  }
}
