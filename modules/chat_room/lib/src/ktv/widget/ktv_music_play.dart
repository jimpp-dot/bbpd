import 'dart:async';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/ktv/model/ktv_music_model.dart';
import 'package:chat_room/src/ktv/utils/ktv_lrc_util.dart';
import 'package:chat_room/src/ktv/widget/ktv_music_one_singer.dart';
import 'package:chat_room/src/ktv/widget/ktv_pk_gift_dialog.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lyric/flutter_lyric.dart';
import 'package:chat_room/src/ktv/spectrum/song_spectrum_widget.dart';

import '../ktv_music_controller.dart';
import '../model/sound_type.dart';
import '../utils/ktv_theme.dart';
import '../utils/time_util.dart';
import 'ktv_count_down_widget.dart';
import 'ktv_music_idle_singer.dart';
import 'ktv_music_two_singer.dart';
import 'ktv_no_singer_tips_widget.dart';
import 'ktv_room_top_widget.dart';

/// 顶部 当前点歌状态 & 排行榜入口
/// 中间 歌词 or 提示区域
///
class KtvMusicPlay extends StatefulWidget {
  final ChatRoomData room;
  final KtvInfo ktvInfo;
  final KtvMusicModel model;
  final VoidCallback? onRankTap;

  const KtvMusicPlay(
      {Key? key,
      required this.room,
      required this.ktvInfo,
      required this.model,
      this.onRankTap})
      : super(key: key);

  @override
  _KtvMusicPlayState createState() => _KtvMusicPlayState();
}

class _KtvMusicPlayState extends State<KtvMusicPlay>
    with TickerProviderStateMixin {
  /// 没有点歌
  static const int INDEX_NO_SINGER = 0;

  /// 仅主唱
  static const int INDEX_SINGING = 1;

  /// 合唱
  static const int INDEX_CHORUS_ADD = 2;

  bool _showSpectrum = true;

  int _currentIndex = INDEX_NO_SINGER;

  /// 状态切换，是否需要动画
  bool needAni = false;

  bool _showSendGiftDialog = true;

  /// 进房时间戳
  int _startTime = 0;

  /// pk 模式弹出送礼引导最小时间55s
  static const int MIN_START_TIME = 55 * 1000;

  /// pk 模式弹出送礼引导最大时间65s
  static const int MAX_END_TIME = 65 * 1000;

  static const String LOG_TAG = '_KtvMusicPlayState';

  /// 无人唱歌到有人唱歌，歌词的淡入动画
  late AnimationController _animController;
  late Animation<double> _fadeOut;
  late Animation<Offset> _slideOut;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slideIn;

  //歌词控制器
  late LyricController _lyricController;
  final TextStyle _curLineStyle = const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.7);
  final TextStyle _otherLineStyle = TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontSize: 15,
      fontWeight: FontWeight.w500,
      height: 1.6);

  List<Lyric> _lyrics = [];
  Timer? _progressTimer;

  RtcEngine? get _rtcEngine => widget.room.rtcController.engine;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        value: 1.0, duration: const Duration(milliseconds: 1000), vsync: this);
    CurvedAnimation curve =
        CurvedAnimation(parent: _animController, curve: Curves.easeInOutSine);
    _fadeOut = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 1.0, end: 0.0), weight: 24),
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 24),
    ]).animate(curve);

    _slideOut = TweenSequence([
      TweenSequenceItem<Offset>(
          tween:
              Tween(begin: const Offset(0, 0), end: const Offset(0, 20 / 92)),
          weight: 24),
      TweenSequenceItem<Offset>(
          tween: Tween(
              begin: const Offset(0, 20 / 92), end: const Offset(0, 20 / 92)),
          weight: 24),
    ]).animate(curve);

    _fadeIn = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 24),
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 1.0), weight: 24),
    ]).animate(curve);

    _slideIn = TweenSequence([
      TweenSequenceItem<Offset>(
          tween: Tween(
              begin: const Offset(0, 20 / 92), end: const Offset(0, 20 / 92)),
          weight: 24),
      TweenSequenceItem<Offset>(
          tween:
              Tween(begin: const Offset(0, 20 / 92), end: const Offset(0, 0)),
          weight: 24),
    ]).animate(curve);

    _lyricController = LyricController(vsync: this);
    KtvMusicController.spectrumController = SoundSpectrumController();
    KtvMusicController.onSpectrumLoaded = loadSpectrum;

    _startTime = DateTime.now().millisecondsSinceEpoch;

    _currentIndex = _getIndex();
    _init();
  }

  void loadSpectrum() {
    refresh();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      KtvMusicController.currentMixingPosition =
          await _rtcEngine?.getAudioMixingCurrentPosition();
      KtvMusicController.spectrumController?.start(
          start:
              Duration(milliseconds: KtvMusicController.currentMixingPosition));
    });
  }

  void _init() async {
    KtvInfo ktvInfo = widget.ktvInfo;
    if (ktvInfo.currentSong == null ||
        (ktvInfo.currentSong!.status != KtvSingStatus.sing &&
            ktvInfo.currentSong!.status != KtvSingStatus.pause)) {
      return;
    }

    await _tryJoinMic(ktvInfo);
    _lyrics = await KtvLrcUtil.prepareLyrics(ktvInfo);
    _restartProgressTimer();
  }

  Future _restartProgressTimer() async {
    const int intervalMilliSecs = 200;
    int rTime = MIN_START_TIME +
        Random().nextInt(MAX_END_TIME - MIN_START_TIME); //(55s-65s之内)
    _progressTimer?.cancel();
    _lyricController.progress =
        Duration(milliseconds: KtvMusicController.currentMixingPosition);
    _progressTimer = Timer.periodic(
        const Duration(milliseconds: intervalMilliSecs), (timer) async {
      if (widget.ktvInfo.currentSong == null ||
          widget.ktvInfo.currentSong!.status == KtvSingStatus.pause ||
          widget.ktvInfo.currentSong!.status == KtvSingStatus.wait ||
          widget.ktvInfo.currentSong!.isCountDown()) {
        return;
      }
      if (!mounted) return;
      bool isSinger = widget.ktvInfo.currentSong!.uid == Session.uid;
      if (!isSinger && !KtvMusicController.isChorus) {
        KtvMusicController.currentMixingPosition =
            KtvMusicController.currentMixingPosition + intervalMilliSecs;
      } else {
        KtvMusicController.syncScore();
        KtvMusicController.currentMixingPosition =
            await _rtcEngine?.getAudioMixingCurrentPosition();
      }
      _lyricController.progress =
          Duration(milliseconds: KtvMusicController.currentMixingPosition);
      _tryShowPkGiftDialog(rTime);
      refresh();
    });
  }

  void _tryShowPkGiftDialog(int rTime) {
    int now = DateTime.now().millisecondsSinceEpoch;
    if ((widget.room.ktvPkRank?.isPkModeOpen ?? false) &&
        KtvMusicController.currentMixingPosition >= rTime &&
        KtvMusicController.currentMixingPosition <= MAX_END_TIME &&
        _showSendGiftDialog &&
        Session.uid != widget.ktvInfo.currentSong?.uid &&
        (now - _startTime) > 30 * 1000) {
      _showSendGiftDialog = false;
      Log.d(
          tag: LOG_TAG,
          'show send gift dialog...time = ${KtvMusicController.currentMixingPosition}');
      KtvPkGiftDialog.show(context, widget.room, widget.ktvInfo);
    }
  }

  void _updateIndex() {
    int oldIndex = _currentIndex;
    _currentIndex = _getIndex();
    if ((oldIndex == INDEX_NO_SINGER && _currentIndex == INDEX_SINGING) ||
        (oldIndex == INDEX_SINGING && _currentIndex == INDEX_CHORUS_ADD)) {
      needAni = true;
    } else {
      needAni = false;
    }

    if (oldIndex == INDEX_NO_SINGER && _currentIndex != INDEX_NO_SINGER) {
      if (!widget.ktvInfo.currentSong!.isCountDown()) {
        isCountDownBeforeLyrics = false;
        startAnim();
      }
    }
  }

  Future _tryJoinMic(KtvInfo ktvInfo) async {
    if (ktvInfo.currentSong?.uid == Session.uid && !ChatRoomUtil.isMic) {
      bool isGranted = await ChatRoomUtil.checkAudioAuthorization();
      if (!isGranted) {
        Log.w('checkAudioAuthorization isGranted is false');
        return;
      }

      await RoomRepository.joinMic(
        widget.room.rid,
        -1,
        uid: 0,
        toastError: true,
        toastSuccess: false,
        needCertify: true,
        type: widget.room.needVerify,
        newType: widget.room.needVerifyNew,
        onStage: true,
      );
    }
  }

  bool isCountDownBeforeLyrics = false;

  void startAnim() {
    _animController.reset();
    _animController.forward();
  }

  int _getIndex() {
    int singerID = widget.ktvInfo.currentSong?.uid ?? 0;
    if (singerID <= 0) {
      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
        if (mounted) widget.model.singMode = KtvMusicSingMode.none;
      });

      return INDEX_NO_SINGER;
    }

    int chorusID = widget.ktvInfo.chorus?.uid ?? 0;

    if (chorusID > 0) {
      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
        if (mounted) widget.model.singMode = KtvMusicSingMode.chorus;
      });

      return INDEX_CHORUS_ADD;
    }

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      if (mounted) widget.model.singMode = KtvMusicSingMode.leadSing;
    });

    return INDEX_SINGING;
  }

  @override
  void didUpdateWidget(KtvMusicPlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.ktvInfo.currentSong == null ||
        oldWidget.ktvInfo.currentSong == null) {
      return;
    }

    if (widget.ktvInfo.currentSong?.status !=
            oldWidget.ktvInfo.currentSong!.status ||
        widget.ktvInfo.currentSong?.sid != oldWidget.ktvInfo.currentSong!.sid ||
        (widget.ktvInfo.currentSong!.brcProgress -
                    oldWidget.ktvInfo.currentSong!.brcProgress)
                .abs() >
            KtvMusicController.maxDelta) {
      if (widget.ktvInfo.currentSong!.sid !=
              oldWidget.ktvInfo.currentSong!.sid ||
          widget.ktvInfo.currentSong!.uid !=
              oldWidget.ktvInfo.currentSong!.uid) {
        _showSendGiftDialog = true;
      }
      _init();
    }

    if (widget.ktvInfo.currentSong!.uid != oldWidget.ktvInfo.currentSong!.uid ||
        (widget.ktvInfo.chorus?.uid ?? 0) !=
            (oldWidget.ktvInfo.chorus?.uid ?? 0)) {
      /// 播放状态变更，或者主唱/合唱变更，刷新状态
      _updateIndex();
    }

    if ('${widget.ktvInfo.currentSong!.uid}-${widget.ktvInfo.currentSong!.pid}' ==
            '${oldWidget.ktvInfo.currentSong!.uid}-${oldWidget.ktvInfo.currentSong!.pid}' &&
        oldWidget.ktvInfo.currentSong!.isCountDown() &&
        !widget.ktvInfo.currentSong!.isCountDown()) {
      isCountDownBeforeLyrics = true;
      startAnim();
    }
  }

  @override
  void dispose() {
    _lyricController.dispose();
    _animController.dispose();
    _progressTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 31,
          child: _buildTop(),
        ),
        const SizedBox(height: 42),
        _buildSinger(),
        ...buildSpectrum(),
        Stack(
          clipBehavior: Clip.none,
          children: [
            PositionedDirectional(
              top: -30,
              start: -30,
              child: R.img(
                RoomAssets.chat_room$ktv_ktv_lyrics_bg_webp,
                width: 360,
                height: 150,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ),
            _buildLyricsOrDetail(),
          ],
        ),
      ],
    );
  }

  List<Widget> buildSpectrum() {
    List<Widget> spectrumList = [];
    if (_lyrics.isNotEmpty && KtvMusicController.canShowSpectrum) {
      if (_showSpectrum) {
        spectrumList.add(_buildScore());
        spectrumList.add(_buildSpectrum());
      }

      /// 展开收起按钮
      spectrumList.add(_buildExpandBtn());
    }
    return spectrumList;
  }

  Widget _buildScore() {
    return Row(
      children: [
        const SizedBox(width: 10),
        ValueListenableBuilder<double>(
          valueListenable: KtvMusicController.score,
          builder: (context, score, child) {
            return Container(
              width: 50,
              height: 15,
              alignment: AlignmentDirectional.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(6), topEnd: Radius.circular(6)),
                color: Color(0x33CCFAF2),
              ),
              child: Text(
                K.room_ktv_music_score([score.toStringAsFixed(1)]),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            );
          },
        ),
        const Spacer(),
      ],
    );
  }

  /// 打分器UI
  Widget _buildSpectrum() {
    return SoundSpectrumWidget(
      controller: KtvMusicController.spectrumController!,
      spectrumModel: KtvMusicController.spectrumModel,
      totalTime: Duration(
          milliseconds: Util.parseInt(widget.ktvInfo.currentSong!.playTime)),
      firstLyricStartMs: getFirstLyricStartMs(),
      height: 56.dp,
      borderColor: Colors.transparent,
      dividerColor: Colors.white10,
      bgGradient:
          const LinearGradient(colors: [Color(0x33CCFAF2), Color(0x331CC9AA)]),
      borderRadius: 10.dp,
      slidingNodeHeight: 3.dp,
      indicatorSize: 10.dp,
      showFloater: false,
      bgGlassEffect: true,
    );
  }

  /// 返回第一首歌词的秒时间，如果歌词不存在返回-1
  int getFirstLyricStartMs() {
    int firstLyricStartMs = -1;
    if (_lyrics.isNotEmpty) {
      /// 跳过试听
      firstLyricStartMs = _lyrics.first.startTime.inMilliseconds;
    }
    return firstLyricStartMs;
  }

  /// 打分器收起打开Btn
  Widget _buildExpandBtn() {
    String path = _showSpectrum
        ? RoomAssets.chat_room$ktv_spectrum_up_webp
        : RoomAssets.chat_room$ktv_spectrum_down_webp;
    return Row(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () {
            _showSpectrum = !_showSpectrum;
            refresh();
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 18.dp),
            child: R.img(
              path,
              width: 21.dp,
              height: 12.dp,
            ),
          ),
        ),
      ],
    );
  }

  /// 顶部状态栏
  Widget _buildTop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildSongNameAndProcess()),
        KtvRankLabel(widget.room,
            isPkMode: widget.room.ktvPkRank?.isPkModeOpen ?? false),
      ],
    );
  }

  /// 歌名和进度
  Widget _buildSongNameAndProcess() {
    if (_currentIndex == INDEX_NO_SINGER) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LimitedBox(
          maxWidth: 120,
          child: Text(
            '${widget.ktvInfo.currentSong!.sname}-${widget.ktvInfo.currentSong!.singerName}',
            style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w500,
                height: 1.2),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.ktvInfo.currentSong!.soundType == SoundType.accompany
                  ? K.ktv_original_sound_close
                  : K.ktv_original_sound_open,
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white.withOpacity(0.6),
                  height: 1.2),
            ),
            const SizedBox(width: 8),
            Text(
              KtvTimeUtil.mmss(KtvMusicController.totalTime -
                  KtvMusicController.currentMixingPosition),
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Colors.white.withOpacity(0.6),
                  height: 1.2),
            )
          ],
        ),
      ],
    );
  }

  /// 演唱者
  Widget _buildSinger() {
    if (_currentIndex == INDEX_NO_SINGER) {
      return KtvMusicIdleSinger(widget.room);
    } else if (_currentIndex == INDEX_SINGING) {
      return KtvMusicOneSinger(
          room: widget.room, ktvInfo: widget.ktvInfo, needAni: needAni);
    } else if (_currentIndex == INDEX_CHORUS_ADD) {
      return KtvMusicTwoSinger(
          room: widget.room, ktvInfo: widget.ktvInfo, needAni: needAni);
    }

    return KtvMusicIdleSinger(widget.room);
  }

  Widget _buildLyricsOrDetail() {
    if (_currentIndex == INDEX_NO_SINGER) {
      return const KtvNoSingerTipsWidget();
    } else {
      if (_lyrics.isNotEmpty && !widget.ktvInfo.currentSong!.isCountDown()) {
        return AnimatedBuilder(
          animation: _animController,
          builder: (BuildContext context, _) {
            return Stack(
              children: [
                FadeTransition(
                  opacity: _fadeIn,
                  child: SlideTransition(
                    position: _slideIn,
                    child: ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (Rect bounds) {
                        return KtvTheme.lyricGradient.createShader(bounds);
                      },
                      child: LyricWidget(
                        size: const Size(300, 92),
                        lyrics: _lyrics,
                        controller: _lyricController,
                        remarkLyrics: null,
                        enableDrag: false,
                        lyricStyle: _otherLineStyle,
                        currLyricStyle: _curLineStyle,
                        lyricMaxWidth: 300,
                        lyricGap: 2,
                      ),
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: _fadeOut,
                  child: SlideTransition(
                    position: _slideOut,
                    child: isCountDownBeforeLyrics
                        ? _buildCountDown()
                        : const KtvNoSingerTipsWidget(),
                  ),
                ),
              ],
            );
          },
        );
      } else if (widget.ktvInfo.currentSong!.isCountDown()) {
        return _buildCountDown();
      }
    }

    return const SizedBox(height: 92);
  }

  Widget _buildCountDown() {
    return Container(
      width: 300,
      height: 92,
      alignment: AlignmentDirectional.center,
      child: KtvCountDownWidget(widget.ktvInfo),
    );
  }
}
