import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/ktv/model/sing_tuner_widget.dart';
import 'package:flutter/material.dart';

import '../model/ktv_music_model.dart';
import '../model/sound_type.dart';
import '../repo/ktv_repo.dart';
import '../utils/reporter.dart';
import '../utils/time_util.dart';
import '../ktv_music_controller.dart';
import 'package:provider/provider.dart' hide Selector;

/// Ktv 歌曲播放时 底部操作栏
///
class KtvMusicControlBar extends StatefulWidget {
  final ChatRoomData room;

  const KtvMusicControlBar({Key? key, required this.room}) : super(key: key);

  @override
  State<KtvMusicControlBar> createState() => _KtvMusicControlBarState();
}

class _KtvMusicControlBarState extends State<KtvMusicControlBar> {
  static const int _maxClickTimeGap = 500;

  bool _isSwitching = false;

  final Throttle _switchThrottle =
      Throttle(duration: const Duration(milliseconds: 1000));

  int _lastClickPauseTime = 0;
  int _lastClickNextTime = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _switchThrottle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(21.dp),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 42.dp,
          color: const Color(0x1FFFFFFF),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOriginSoundBtn(),
              _buildTuningBtn(),
              _buildPlayBtn(),
              _buildNextBtn(),
            ],
          ),
        ),
      ),
    );
  }

  /// 打开或关闭原唱
  Widget _buildOriginSoundBtn() {
    // 合唱不能切换
    if (KtvMusicController.isChorus) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: _switchOriginSong,
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 12.dp),
        width: 56.dp,
        height: 24.dp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(11.dp)),
          border: Border.all(color: Colors.white.withOpacity(0.5), width: 0.5),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          KtvMusicController.currentSoundType == SoundType.accompany
              ? K.ktv_original_sound_close
              : K.ktv_original_sound_open,
          style: TextStyle(fontSize: 10.dp, color: Colors.white, height: 1.1),
        ),
      ),
    );
  }

  /// 调音
  Widget _buildTuningBtn() {
    return Consumer<KtvMusicModel>(
      builder: (context, value, child) {
        return Visibility(
          visible: _showTuningBtn(),
          child: GestureDetector(
            onTap: _openTuningView,
            child: SizedBox(
              width: 60.dp,
              height: 42.dp,
              child: Center(
                child: R.img(
                  RoomAssets.chat_room$ktv_sing_tune_webp,
                  color: Colors.white,
                  width: 28.dp,
                  height: 28.dp,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// 播放/暂停
  Widget _buildPlayBtn() {
    var show =
        !KtvMusicController.isChorus || Session.uid == widget.room.config?.uid;
    if (!show) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: _switchPlaySong,
      child: SizedBox(
        width: 60.dp,
        height: 42.dp,
        child: Center(
          child: R.img(
            !KtvMusicController.isPaused
                ? RoomAssets.chat_room$ktv_sing_pause_webp
                : RoomAssets.chat_room$ktv_sing_play_webp,
            color: Colors.white,
            width: 28.dp,
            height: 28.dp,
          ),
        ),
      ),
    );
  }

  /// 下一首
  Widget _buildNextBtn() {
    var show =
        !KtvMusicController.isChorus || Session.uid == widget.room.config?.uid;
    if (!show) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: _switchNextSong,
      child: SizedBox(
        width: 60.dp,
        height: 42.dp,
        child: Center(
          child: R.img(
            RoomAssets.chat_room$ktv_sing_next_webp,
            color: Colors.white,
            width: 28.dp,
            height: 28.dp,
          ),
        ),
      ),
    );
  }

  /// 打开关闭/原唱
  void _switchOriginSong() async {
    if (_isSwitching) {
      Fluttertoast.showToast(msg: K.busy_operation_please_wait);
      return;
    }
    _switchThrottle.call(() async {
      _isSwitching = true;
      KtvMusicController.switchSoundType();
      _isSwitching = false;
      refresh();
    },
        preventFuc: () =>
            Fluttertoast.showToast(msg: K.busy_operation_please_wait));
  }

  /// 打开调音面板
  void _openTuningView() async {
    var musicModel = context.read<KtvMusicModel>();
    await TunerBottomDialog.showTunerDialog(context,
        provider: musicModel, realTimeChange: false);
  }

  /// 播放/暂停歌曲
  void _switchPlaySong() async {
    int now = KtvTimeUtil.now();
    if (now - _lastClickPauseTime < _maxClickTimeGap) {
      return;
    }
    _lastClickPauseTime = now;
    if (widget.room.config?.ktvInfo?.currentSong?.isCountDown() == true) {
      Fluttertoast.showToast(
          msg: K.room_ktv_cant_pause_in_start_status,
          gravity: ToastGravity.CENTER);
      return;
    }
    int progress = KtvMusicController.currentMixingPosition;

    if (!KtvMusicController.isPaused) {
      bool success = await KtvRepo.pauseSing(
          Session.uid, widget.room.rid, KtvRepo.END_SING_TYPE_PAUSE, progress);
      if (success) {
        KtvMusicController.pausePlayMusic();
        refresh();
      }
    } else {
      bool success = await KtvRepo.pauseSing(
          Session.uid, widget.room.rid, KtvRepo.END_SING_TYPE_RESUME, progress);
      if (success) {
        KtvMusicController.resumePlayMusic();
        refresh();
      }
    }
  }

  /// 下一首歌曲
  void _switchNextSong() async {
    bool result = await showSongSwitchDialog(context);
    if (result == false) {
      return;
    }

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
    if (restPercent > 0) {
      KtvReporter.skipSong(rid, songId, singUid, restPercent,
          widget.room.config?.originalRFT ?? '', 'manual');
    }
  }

  /// 切换歌曲的弹窗提示
  Future<bool> showSongSwitchDialog(BuildContext context) async {
    bool? result = await showDialog(
      context: context,
      builder: (context) {
        return ConfirmDialog(
          title: K.room_song_switch_tip,
          negativeButton: NegativeButton(text: K.cancel),
          positiveButton: PositiveButton(text: K.room_confirm),
        );
      },
    );
    return result == true;
  }

  bool _showTuningBtn() {
    bool isSinger = KtvMusicController.isSinger;
    bool isChorus = KtvMusicController.isChorus;
    return isSinger || isChorus;
  }
}
