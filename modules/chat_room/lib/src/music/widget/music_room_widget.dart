import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/chat_room_bg_screen.dart';
import 'package:chat_room/src/base/widget/room_background_info.dart';
import 'package:chat_room/src/music/model/music_room_info.dart';
import 'package:chat_room/src/music/playlist/music_playlist_manager.dart';
import 'package:chat_room/src/music/repo/music_room_repo.dart';
import 'package:chat_room/src/music/widget/music_room_area.dart';
import 'package:chat_room/src/music/widget/music_room_user_list.dart';
import 'package:flutter/material.dart';

/// 一起听
///
class MusicRoomWidget extends StatefulWidget {
  final ChatRoomData room;
  final bool displayEmoteAtMic;
  final VoidCallback? onSettingClick;

  const MusicRoomWidget(
      {super.key,
      required this.room,
      this.displayEmoteAtMic = true,
      this.onSettingClick});

  @override
  State<MusicRoomWidget> createState() => _MusicRoomWidgetState();
}

class _MusicRoomWidgetState extends State<MusicRoomWidget>
    with
        RoomTemplateMixin<MusicRoomWidget>,
        RoomFloatingBannerMixin<MusicRoomWidget> {
  static const String TAG = '_MusicRoomWidgetState';

  MusicRoomInfoResp? _musicInfo;

  @override
  void initState() {
    super.initState();
    widget.room.addListener(
        RoomConstant.Event_Music_Room_Theme_Refresh, _musicRoomThemeChange);
    MusicPlayListManager.inst.songCtrlVM.addListener(_onCurrentSongChange);
    MusicPlayListManager.inst.initMusicRoomState(widget.room);
    _load();
  }

  @override
  void dispose() {
    widget.room.removeListener(
        RoomConstant.Event_Music_Room_Theme_Refresh, _musicRoomThemeChange);
    MusicPlayListManager.inst.songCtrlVM.removeListener(_onCurrentSongChange);
    MusicPlayListManager.inst.disposeMusicRoomState();
    super.dispose();
  }

  _onCurrentSongChange() {
    _musicInfo?.data?.currentSong =
        MusicPlayListManager.inst.songCtrlVM.songCtrl?.currentSong;
    Log.d(
        tag: TAG,
        '_onCurrentSongChange, currentSong: ${_musicInfo?.data?.currentSong?.toJson()}');
    refresh();
  }

  /// 房间主题变化
  _musicRoomThemeChange(String type, Object? data) {
    if (data is Map && data.containsKey('theme') && data['theme'] != null) {
      try {
        MusicTheme theme = MusicTheme.fromJson(data['theme']);
        _musicInfo?.data?.musicTheme = theme;
        refresh();
      } catch (e) {
        Log.d(e);
      }
    }
  }

  _load() async {
    MusicRoomInfoResp rsp =
        await MusicRoomRepo.getMusicRoomInfo(widget.room.rid);
    if (rsp.success == true) {
      Log.d(
          tag: TAG,
          'getMusicRoomInfo, rsp:${rsp.data?.musicTheme?.toJson().toString()}');

      if (rsp.data?.robot?.currentSong != null &&
          rsp.data!.robot!.currentSong!.sid > 0) {
        /// 优先使用服务端机器人信息
        rsp.data?.currentSong = rsp.data?.robot?.currentSong;
      }
      Log.d(
          tag: TAG,
          ' _load, currentSong: ${rsp.data?.currentSong?.toJson()}, robotUid: ${rsp.data?.robot?.robotUid}');
      MusicPlayListManager.inst.songCtrlVM
          .refreshCurrentSong(rsp.data?.currentSong);
      if (rsp.data?.robot?.robotUid != null && rsp.data!.robot!.robotUid > 0) {
        MusicPlayListManager.inst.remoteRobotVM.refreshRobotInfo(
            rsp.data!.robot!.robotUid, rsp.data!.robot!.playMode);
      }
      _musicInfo = rsp;
    }

    if (_musicInfo != null) {
      refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        _bgWidget(),
        Positioned.fill(
          child: _renderBodyMusic(context),
        ),
        PositionedDirectional(
          end: 0,
          bottom: preMadeRecruitBottom,
          child: buildFloatingBanner(widget.room),
        ),
        ...renderExtra(context, widget.room),
      ],
    );
  }

  Widget _renderBodyMusic(BuildContext context) {
    return Column(
      children: [
        RoomHeaderNormal(
            room: widget.room, onSettingClick: widget.onSettingClick),
        const SizedBox(height: 22),
        MusicRoomArea(room: widget.room, musicInfo: _musicInfo),
        MusicRoomUserList(
          room: widget.room,
          displayEmoteAtMic: widget.displayEmoteAtMic,
        ),
        renderMessageList(widget.room),
        renderController(widget.room),
        SizedBox(height: MediaQuery.of(context).padding.bottom),
      ],
    );
  }

  Widget _bgWidget() {
    if (_musicInfo == null ||
        _musicInfo?.data?.musicTheme?.bgUrl == null ||
        _musicInfo!.data!.musicTheme!.bgUrl.isEmpty) {
      return const SizedBox.shrink();
    }

    RoomBackGroundInfo? backGroundInfo = _getBgInfo();
    return ChatRoomBgScreen(
      roomBackGroundInfo: backGroundInfo,
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      isPlaying: _isPlaying(),
    );
  }

  RoomBackGroundInfo? _getBgInfo() {
    if (_musicInfo?.data?.musicTheme?.bgType == 'mp4') {
      return RoomBackGroundInfo(
          type: RoomBackGroundType.mp4,
          url: '${System.imageDomain}${_musicInfo!.data!.musicTheme!.bgUrl}');
    } else if (_musicInfo?.data?.musicTheme?.bgUrl != null) {
      return RoomBackGroundInfo(
          type: RoomBackGroundType.jpg,
          url: '${System.imageDomain}${_musicInfo!.data!.musicTheme!.bgUrl}');
    }
    return null;
  }

  bool _isPlaying() {
    var state = _musicInfo?.data?.currentSong?.state;
    return state == MusicRoomStatus.play || state == MusicRoomStatus.resume;
  }
}
