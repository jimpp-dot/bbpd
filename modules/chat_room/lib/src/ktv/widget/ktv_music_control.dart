// ignore_for_file: non_constant_identifier_names

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/ktv/repo/ktv_repo.dart';
import 'package:chat_room/src/ktv/utils/reporter.dart';
import 'package:chat_room/src/ktv/utils/time_util.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';

import '../ktv_music_controller.dart';
import '../model/ktv_music_model.dart';
import '../model/sound_type.dart';
import '../song_list/ktv_song_list_page.dart';
import 'music_progress_bar.dart';
import 'volume_control_bar.dart';
import 'package:provider/provider.dart' hide Selector;

String EVENT_KTV_MUSIC_CONTROL_TOUCH = 'ktv.music.control.touch';

/// 悬浮在顶部的音乐控制器
/// not used
class KtvMusicControl extends StatefulWidget {
  final KtvInfo ktvInfo;
  final ChatRoomData room;

  const KtvMusicControl({Key? key, required this.room, required this.ktvInfo})
      : super(key: key);

  @override
  State<KtvMusicControl> createState() => _KtvMusicControlState();
}

class _KtvMusicControlState extends State<KtvMusicControl> {
  final Color _controllerBgColor = Colors.black.withOpacity(0.3);
  final TextStyle _controllerTextStyle =
      TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.6));
  final TextStyle _controllerTextStyleHighlight = const TextStyle(
      fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500);
  SoundType _soundType = SoundType.accompany;
  bool _paused = false;

  ScrollController? _scrollController;

  RtcEngine? get _rtcEngine => widget.room.rtcController.engine;

  bool _showVoiceReverb = false;
  double voiceReverbItemWidth = 48.0;
  double voiceReverbItemSeparator = 8.0;

  @override
  void initState() {
    super.initState();

    _init();

    _showVoiceReverb =
        widget.room.currentRtcType == RtcBizConfig.rtcTypeTencent;

    if (_showVoiceReverb) {
      double initialScrollOffset;
      int initialIndex;
      int typeIndex = widget.room.trtcVoiceReverbType;
      if (typeIndex <= 2) {
        initialIndex = 0;
        initialScrollOffset = 0;
      } else if (typeIndex >= 8) {
        initialScrollOffset = voiceReverbItemWidth * 11 +
            voiceReverbItemSeparator * 10 -
            (Util.width - 44 - 24);
      } else {
        initialIndex = typeIndex - 2;
        initialScrollOffset =
            (voiceReverbItemWidth + voiceReverbItemSeparator) * initialIndex -
                10.0;
      }
      _scrollController =
          ScrollController(initialScrollOffset: initialScrollOffset);
    }
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(KtvMusicControl oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.ktvInfo.currentSong?.soundType !=
            oldWidget.ktvInfo.currentSong?.soundType ||
        widget.ktvInfo.currentSong?.status !=
            oldWidget.ktvInfo.currentSong?.status) {
      _init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (DragDownDetails details) {
        eventCenter.emit(EVENT_KTV_MUSIC_CONTROL_TOUCH);
      },
      onPanUpdate: (DragUpdateDetails details) {
        eventCenter.emit(EVENT_KTV_MUSIC_CONTROL_TOUCH);
      },
      onPanEnd: (DragEndDetails details) {
        eventCenter.emit(EVENT_KTV_MUSIC_CONTROL_TOUCH);
      },
      onPanCancel: () {
        eventCenter.emit(EVENT_KTV_MUSIC_CONTROL_TOUCH);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            top: 6, bottom: 6, end: 6, start: 2),
        child: Column(
          children: <Widget>[
            _buildChangeSong(),
            const Spacer(),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4),
              child: _buildVoiceReverbType(),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4),
              child: _buildMusicAdjust(),
            ),
            const SizedBox(height: 17),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 4),
              child: MusicProgressBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChangeSong() {
    return Row(
      children: <Widget>[
        //关闭按钮
        R.img('ktv/ktv_tune_close.svg',
            package: ComponentManager.MANAGER_BASE_ROOM, width: 24, height: 24),
        const SizedBox(width: 5),
        //切换原声和伴奏(合唱不能切换)
        if (!KtvMusicController.isChorus)
          GestureDetector(
            onTap: _onSwitchSound,
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: _controllerBgColor,
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
              child: Text(
                _soundType == SoundType.accompany
                    ? K.ktv_original_sound_close
                    : K.ktv_original_sound_open,
                style: _controllerTextStyleHighlight,
              ),
            ),
          ),
        const Spacer(),
        //点歌
        GestureDetector(
          onTap: () {
            _onOrder(context);
          },
          child: Container(
            height: 36,
            decoration: BoxDecoration(
              color: _controllerBgColor,
              borderRadius: BorderRadius.circular(18),
            ),
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
            child: Text(
              K.ktv_ordered +
                  (widget.room.config?.ktvInfo?.listCount.toString() ?? ''),
              style: _controllerTextStyleHighlight,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMusicAdjust() {
    bool isSinger = widget.ktvInfo.currentSong?.uid == Session.uid;
    bool showVolume = isSinger || KtvMusicController.isChorus;
    return SizedBox(
      height: 68,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //音量调节
          if (showVolume)
            Expanded(
              child: Column(
                children: <Widget>[
                  _buildVolumeChanger(SoundType.voice),
                  const Spacer(),
                  _buildVolumeChanger(SoundType.accompany),
                ],
              ),
            ),
          if (showVolume &&
              (!KtvMusicController.isChorus ||
                  Session.uid == widget.room.config?.uid))
            const SizedBox(width: 8),

          /// 房主做为伴唱时，需要展示暂停和切歌按钮
          if (!KtvMusicController.isChorus ||
              Session.uid == widget.room.config?.uid) ...[
            //暂停
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _onPause,
              child: Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: _controllerBgColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: AlignmentDirectional.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    R.img(
                      !_paused ? 'ktv/ktv_pause.svg' : 'ktv/ktv_resume.svg',
                      package: ComponentManager.MANAGER_BASE_ROOM,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      !_paused ? K.ktv_music_pause : K.ktv_music_resume,
                      style: _controllerTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _onNext,
              child: Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: _controllerBgColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: AlignmentDirectional.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    R.img('ktv/ktv_next.svg',
                        package: ComponentManager.MANAGER_BASE_ROOM,
                        width: 24,
                        height: 24),
                    const SizedBox(height: 2),
                    Text(
                      K.ktv_music_next,
                      style: _controllerTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            //切歌-下一首
          ]
        ],
      ),
    );
  }

  Widget _buildVolumeChanger(SoundType soundType) {
    String label = soundType == SoundType.voice
        ? K.ktv_music_voice
        : K.ktv_music_accompany;
    double initVolume = soundType == SoundType.voice
        ? KtvMusicController.voiceVolume / 100.0
        : KtvMusicController.accompanyVolume / 100.0;
    Widget controlBar = VolumeControlBar(
      onVolumeChanged: _onVolumeChanged,
      soundType: soundType,
      initVolume: initVolume,
    );
    bool isSinger = widget.ktvInfo.currentSong?.uid == Session.uid;
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: _controllerBgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Row(
        children: <Widget>[
          Text(
            label,
            style: _controllerTextStyle,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: isSinger || KtvMusicController.isChorus
                ? controlBar
                : IgnorePointer(child: controlBar),
          ),
        ],
      ),
    );
  }

  void _onVolumeChanged(double value, SoundType soundType) {
    Log.d(
        '_KtvMusicAreaState._onVolumeChanged soundType=$soundType, value=$value');
    if (soundType == SoundType.accompany) {
      KtvMusicController.accompanyVolume = (value * 100).toInt();
      _rtcEngine?.adjustAudioMixingVolume(KtvMusicController.accompanyVolume);
    } else if (soundType == SoundType.voice) {
      KtvMusicController.voiceVolume = (value * 100).toInt();
      if (widget.room.mute) {
        // 当前为关麦状态不设置人声
        _rtcEngine?.adjustRecordingSignalVolume(KtvMusicController.voiceVolume);
      }
    }
  }

  int _lastClickPauseTime = 0;

  void _onPause() async {
    int now = KtvTimeUtil.now();
    if (now - _lastClickPauseTime < _maxClickTimeGap) {
      return;
    }
    _lastClickPauseTime = now;
    if (widget.ktvInfo.currentSong?.isCountDown() == true) {
      Fluttertoast.showToast(
          msg: K.room_ktv_cant_pause_in_start_status,
          gravity: ToastGravity.CENTER);
      return;
    }
    Log.d('_KtvMusicAreaState._onPause');
    ChatRoomData room = widget.room;
    int progress = KtvMusicController.currentMixingPosition;
    if (!_paused) {
      bool success = await KtvRepo.pauseSing(
          Session.uid, room.rid, KtvRepo.END_SING_TYPE_PAUSE, progress);
      if (success) {
        KtvMusicController.pausePlayMusic();
        _paused = true;
        refresh();
      }
    } else {
      bool success = await KtvRepo.pauseSing(
          Session.uid, room.rid, KtvRepo.END_SING_TYPE_RESUME, progress);
      if (success) {
        KtvMusicController.resumePlayMusic();
        _paused = false;
        refresh();
      }
    }
  }

  int _lastClickNextTime = 0;
  final int _maxClickTimeGap = 500;

  void _onNext() async {
    int now = KtvTimeUtil.now();
    if (now - _lastClickNextTime < _maxClickTimeGap) {
      return;
    }
    _lastClickNextTime = now;
    int songId = widget.room.config?.ktvInfo?.currentSong?.sid ?? 0;
    int singUid = widget.room.config?.ktvInfo?.currentSong?.uid ?? 0;
    _reportSkip(widget.room.rid, songId, singUid);
    bool success =
        await KtvRepo.nextSong(Session.uid, widget.room.rid, songId, singUid);
    if (success) {
      KtvMusicController.dispose();
    }
  }

  void _reportSkip(int rid, int songId, int singUid) {
    double restPercent = 0.0;
    if (KtvMusicController.totalTime > 0) {
      restPercent = (KtvMusicController.totalTime -
              KtvMusicController.currentMixingPosition) /
          KtvMusicController.totalTime;
    }
    Log.d(
        "restPercent = $restPercent, ${KtvMusicController.totalTime}, ${KtvMusicController.currentMixingPosition}");
    if (restPercent > 0) {
      KtvReporter.skipSong(rid, songId, singUid, restPercent,
          widget.room.config?.originalRFT ?? '', 'manual');
    }
  }

  void _onOrder(BuildContext context) {
    bool isCreator = widget.room.createor?.uid == Session.uid;

    /// KTV跳转已点TAB
    KtvMusicModel model = context.read<KtvMusicModel>();
    KtvSongListPage.show(
      context,
      widget.room,
      SongSheetType.ordered,
      isRoomMaster: isCreator,
      autoMic: widget.room.config?.mode == RoomMode.Lock,
      musicNum: model.musicNum,
    );
  }

  void _onSwitchSound() {
    KtvMusicController.switchSoundType();
    refresh();
  }

  void _init() {
    _soundType = widget.ktvInfo.currentSong!.soundType;
    _paused = widget.ktvInfo.currentSong!.status == KtvSingStatus.pause;
  }

  Widget _buildVoiceReverbType() {
    if (!_showVoiceReverb) {
      return const SizedBox.shrink();
    }
    return Container(
      width: Util.width - 44,
      height: 118,
      decoration: BoxDecoration(
        color: _controllerBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsetsDirectional.only(top: 12, start: 12, end: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            K.room_voice_reverb_title,
            style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                height: 1.2),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: Util.width - 44 - 24,
            height: 70,
            child: ListView.separated(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 11,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: voiceReverbItemSeparator),
              itemBuilder: (context, index) => _buildVoiceReverbItem(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVoiceReverbItem(int index) {
    return GestureDetector(
      onTap: () {
        widget.room.trtcVoiceReverbType = index;
        widget.room.rtcController.engine?.setVoiceReverbType(index);
        if (mounted) {
          setState(() {});
        }
      },
      child: SizedBox(
        width: voiceReverbItemWidth,
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: voiceReverbItemWidth,
              height: voiceReverbItemWidth,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
                border: index == widget.room.trtcVoiceReverbType
                    ? Border.all(color: const Color(0xFF60C8FF), width: 1)
                    : null,
              ),
              alignment: AlignmentDirectional.center,
              child: getVoiceReverbIcon(index),
            ),
            const SizedBox(height: 4),
            Text(
              getVoiceReverbText(index),
              style: TextStyle(
                  fontSize: 11,
                  color: Colors.white.withOpacity(0.8),
                  height: 1.2),
            ),
          ],
        ),
      ),
    );
  }

  Widget getVoiceReverbIcon(int index) {
    return R.img('ic_voice_reverb_type_$index.webp',
        package: ComponentManager.MANAGER_BASE_ROOM);
  }

  String getVoiceReverbText(int index) {
    switch (index) {
      case 0:
        return K.room_voice_reverb_type_0;
      case 1:
        return 'KTV';
      case 2:
        return K.room_voice_reverb_type_2;
      case 3:
        return K.room_voice_reverb_type_3;
      case 4:
        return K.room_voice_reverb_type_4;
      case 5:
        return K.room_voice_reverb_type_5;
      case 6:
        return K.room_voice_reverb_type_6;
      case 7:
        return K.room_voice_reverb_type_7;
      case 8:
        return K.room_voice_reverb_type_8;
      case 9:
        return K.room_voice_reverb_type_9;
      case 10:
        return K.room_voice_reverb_type_10;
      default:
        return '';
    }
  }
}
