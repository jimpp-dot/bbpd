import 'dart:async';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/music_bean.dart';
import 'package:chat_room/src/base/widget/music/music_controller_widget.dart';
import 'package:chat_room/src/base/widget/music/music_to_play.dart';
import 'package:chat_room/src/base/widget/music/playing_gif_icon.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../music/widget/music_search_bar.dart';
import '../../roomNavUtil.dart';
import 'package:get/get.dart';

import 'logic/background_music_logic.dart';
import 'model/music_model.dart';

/// 房间背景音乐
///
class RoomBackgroundMusicScreen extends StatefulWidget {
  final ChatRoomData room;

  const RoomBackgroundMusicScreen({
    super.key,
    required this.room,
  });

  @override
  State<RoomBackgroundMusicScreen> createState() =>
      RoomBackgroundMusicScreenState();
}

class RoomBackgroundMusicScreenState extends State<RoomBackgroundMusicScreen>
    with RtcMixPlayerCallProtect {
  Music? _playing;
  int _progress = 0;
  int _duration = 0;
  Timer? _timer;

  RtcEngine get _engine => widget.room.rtcController.engine!;

  late BackgroundMusicLogic _logic;

  @override
  void initState() {
    super.initState();

    _logic = GetManager().put(BackgroundMusicLogic());
    _logic.loadMusic(widget.room.rid);

    _timer = Timer.periodic(const Duration(milliseconds: 1000), _onTimer);
    _playing = MusicController.data;
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    rtcMixCallDestroy();
    GetManager().delete<BackgroundMusicLogic>();
    super.dispose();
  }

  refreshUi() async {
    _duration = await _engine.getAudioMixingDuration();
    Log.d('refreshUi, _duration: $_duration');
    if (!mounted) return;
    setState(() {
      _progress = 0;
      _playing = MusicController.data;
    });
  }

  void _onUploadTaped() {
    RoomNavUtil.openWifiScreen(context, room: widget.room);
  }

  void _onSearchTaped() {
    RoomNavUtil.openMusicSearchScreen(context, widget.room,
        searchType: _logic.showZego ? 1 : 0,
        showUpload: _logic.displayUpload.value);
  }

  void _onRemoveItem(Music item) async {
    bool playing = _playing != null && _playing!.id == item.id;
    if (playing) {
      await _engine.stopAudioMixing();
    }
    _logic.removeMusic(item);
  }

  _onTimer(Timer timer) async {
    if (_playing != null && mounted) {
      try {
        if (_duration <= 0) {
          _duration = await _engine.getAudioMixingDuration();
        }
        _progress = await _engine.getAudioMixingCurrentPosition();
      } catch (e) {
        Log.d(e);
        return;
      }
      refresh();
    }
  }

  // 音乐播放模式按钮：顺序播放/随机播放/单曲循环
  _onPlayTypeClick() async {
    Log.d('_onPlayTypeClick, ${MusicController.playType}');

    if (MusicController.playType == MusicPlayType.Cycle) {
      MusicController.playType = MusicPlayType.Single;
    } else if (MusicController.playType == MusicPlayType.Single) {
      MusicController.playType = MusicPlayType.Random;
    } else {
      MusicController.playType = MusicPlayType.Cycle;
    }

    refresh();
  }

  // 上一曲
  _playPre() async {
    Log.d('_playPre');
    rtcMixCall(() => MusicController.playPreMusic(),
        preventFuc: () =>
            Fluttertoast.showToast(msg: K.busy_operation_please_wait));
  }

  // 下一曲
  _playNext() async {
    Log.d('_playNext');
    rtcMixCall(() => MusicController.playNextMusic(),
        preventFuc: () =>
            Fluttertoast.showToast(msg: K.busy_operation_please_wait));
  }

  _onPlayerClick() async {
    Log.d('_onPlayerClick');
    rtcMixCall(_handlePlayerClick,
        preventFuc: () =>
            Fluttertoast.showToast(msg: K.busy_operation_please_wait));
  }

  _handlePlayerClick() async {
    Music? data = MusicController.data;
    if (data == null) {
      if (MusicController.musicDatas.isEmpty) {
        Fluttertoast.showToast(msg: K.room_no_music_play);
        return;
      }
      MusicController.startPlayMusic(MusicController.musicDatas[0], index: 0);
      return;
    }
    int duration = await _engine.getAudioMixingDuration();
    Log.d(
        '_onPlayerClick, duration: $duration, isRelease: ${MusicController.isRelease}');
    if (duration == 0 || MusicController.isRelease) {
      MusicController.startPlayMusic(data);
      return;
    }
    bool isPlaying = _playing != null && MusicController.isPlaying;
    if (isPlaying) {
      await _engine.pauseAudioMixing();
    } else {
      await _engine.resumeAudioMixing();
    }
    MusicController.setIsPlaying(!isPlaying);
    refresh();
  }

  Widget _renderPlayer() {
    bool isPlaying =
        _playing != null && MusicController.isPlaying && _duration > 0;
    return MusicControllerWidget(
      musicVolume: MusicController.volumn.toDouble(),
      isPlaying: isPlaying,
      musicName: _playing == null ? '' : _playing!.name,
      progress: _progress,
      duration: _duration,
      playType: MusicController.playType,
      volumeChange: (volume) {
        MusicController.volumn = volume.toInt();
        _engine.adjustAudioMixingVolume(MusicController.volumn);
      },
      progressChange: (progress) async {
        await _engine.setAudioMixingPosition(progress);
        if (mounted) {
          setState(() {
            _progress = progress;
          });
        }
      },
      onTapPlayType: _onPlayTypeClick,
      onTapPreMusic: _playPre,
      onTapNextMusic: _playNext,
      onTapPlayMusic: _onPlayerClick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(K.room_my_music),
        actions: [
          Obx(
            () {
              if (_logic.displayUpload.value) {
                return CupertinoButton(
                  onPressed: _onUploadTaped,
                  child: Text(
                    K.upload,
                    style:
                        TextStyle(color: R.color.mainTextColor, fontSize: 14.0),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      body: GetBuilder<BackgroundMusicLogic>(
        builder: (logic) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MusicSearchBar(onTap: _onSearchTaped),
              _renderBody(),
              _renderPlayer(),
              SizedBox(height: Util.iphoneXBottom),
            ],
          );
        },
      ),
    );
  }

  Widget _renderBody() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 12.0, bottom: 8.0),
            child: Text(
              K.room_total_music(['${_logic.myMusics.length}']),
              textAlign: TextAlign.start,
              style: TextStyle(color: R.color.thirdTextColor, fontSize: 13.0),
            ),
          ),
          Expanded(
            child: ListView.builder(
              addAutomaticKeepAlives: true,
              itemCount: MusicController.musicDatas.length,
              itemExtent: 56.0,
              itemBuilder: (BuildContext context, int index) {
                Music item = MusicController.musicDatas.elementAt(index);
                bool playing = _playing != null && _playing!.id == item.id;
                return Slidable(
                  key: ValueKey(item.key),
                  direction: Axis.horizontal,
                  endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      extentRatio: 0.25,
                      children: [
                        SlidableAction(
                          label: K.room_remove,
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          autoClose: false,
                          onPressed: (context) => _onRemoveItem(item),
                        ),
                      ]),
                  closeOnScroll: true,
                  child: _MyMusicItem(
                    item,
                    playing: playing,
                    onTap: () => rtcMixCall(
                      () => MusicController.startPlayMusic(item, index: index),
                      preventFuc: () => Fluttertoast.showToast(
                          msg: K.busy_operation_please_wait),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _MyMusicItem extends StatelessWidget {
  final Music item;
  final bool playing;
  final VoidCallback? onTap;

  const _MyMusicItem(this.item, {this.playing = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.only(left: 16.0, right: 6.5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              item.name,
              style: TextStyle(color: R.color.mainTextColor, fontSize: 17),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          playing
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: MusicPlayingGifIcon(size: 27),
                )
              : InkWell(
                  onTap: onTap,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: MusicToPlayIcon(size: 32.0),
                  ),
                ),
        ],
      ),
    );
  }
}
