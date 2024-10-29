import 'dart:math';

import 'package:shared/shared.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/player/rtc_music_player.dart';
import 'package:chat_room/src/base/room_music_control.dart';

import '../../../assets.dart';
import '../background_music/music_controller.dart';

typedef OnCloseListener = Function();

/// 房间氛围弹窗底部音频播放控件
class AtmosphereMusicWidget extends StatefulWidget {
  final String iconUrl;
  final String musicUrl;
  final String title;
  final OnCloseListener? onCloseListener;

  const AtmosphereMusicWidget({
    super.key,
    this.iconUrl = '',
    this.musicUrl = '',
    this.title = '',
    this.onCloseListener,
  });

  @override
  State<AtmosphereMusicWidget> createState() => _AtmosphereMusicState();
}

class _AtmosphereMusicState extends State<AtmosphereMusicWidget>
    with RtcAudioTickerStateMixin, RtcMixPlayerCallProtect {
  double? _dragValue;

  @override
  void initState() {
    super.initState();
    audioPlayer.initState(MusicScene.atmosphere);
    _startPlay();
  }

  @override
  void dispose() {
    rtcMixCallDestroy();
    super.dispose();
  }

  void _startPlay() {
    var samePath = audioPlayer.isCurrentPlayPath(widget.musicUrl);
    if (!samePath || audioPlayer.isError) {
      audioPlayer.startPlay(widget.musicUrl);
    }
    startTimer();
  }

  @override
  void didUpdateWidget(AtmosphereMusicWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.musicUrl != widget.musicUrl) {
      _startPlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    double current = 0.0;
    if (duration > 0) {
      current = max(0.0, min(1.0, progress / duration));
    }
    if (_dragValue != null) {
      current = _dragValue!;
    }

    return Container(
      height: 80 + Util.iphoneXBottom,
      width: double.infinity,
      color: const Color(0x98FFFFFF),
      child: Column(
        children: [
          Divider(
            height: 1,
            color: R.color.dividerColor,
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 16, end: 16, top: 16, bottom: 16 + Util.iphoneXBottom),
            child: Row(
              children: [
                _buildImage(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTitleProgress(),
                      _buildSlider(current),
                    ],
                  ),
                ),
                _buildPlayBtn(),
                _buildCloseBtn(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 音乐的标题和播放时间进度
  Widget _buildTitleProgress() {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 10),
          child: Text(
            _getProgressText(),
            style: TextStyle(color: R.color.thirdTextColor, fontSize: 11),
          ),
        )
      ],
    );
  }

  /// 中间播放器进度条
  Widget _buildSlider(double currentProgress) {
    return Container(
      height: 10,
      margin: const EdgeInsetsDirectional.only(start: 3, top: 6),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: R.color.mainBrandColor,
          inactiveTrackColor: R.color.mainTextColor.withOpacity(0.04),
          trackShape: const RoundedRectSliderTrackShape(),
          overlayShape: SliderComponentShape.noOverlay,
          thumbShape: _DoubleCircleThumbShape(
            outerRadius: 6,
            outerColor: R.color.mainBrandColor,
            innerRadius: 4,
            innerColor: Colors.white,
          ),
          trackHeight: 6,
        ),
        child: Slider(
            value: currentProgress,
            onChangeStart: (double value) {
              Log.d(tag: 'audio', "onChangeStart $value");
            },
            onChangeEnd: (double value) async {
              Log.d(tag: 'audio', "onChangeEnd $value");
              int position = (value * duration).toInt();
              await audioPlayer.setAudioMixingPosition(position);
              _dragValue = null;
              refresh();
            },
            onChanged: (double value) {
              _dragValue = value;
              refresh();
            }),
      ),
    );
  }

  /// 左侧图片
  Widget _buildImage() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          placeholder: const CupertinoActivityIndicator(),
          imageUrl: widget.iconUrl,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// 右侧播放/暂停按钮
  Widget _buildPlayBtn() {
    return InkWell(
      onTap: () => rtcMixCall(() {
        if (!audioPlayer.isInited) {
          _startPlay();
          return;
        }
        if (audioPlayer.isPlaying) {
          audioPlayer.pause();
        } else {
          audioPlayer.resume();
        }
        refresh();
      }),
      child: Container(
        width: 32,
        height: 32,
        margin: const EdgeInsetsDirectional.only(start: 22, end: 12),
        decoration: BoxDecoration(
            color: R.color.mainBrandColor, shape: BoxShape.circle),
        child: R.img(
          audioPlayer.isPlaying
              ? RoomAssets.chat_room$ktv_ktv_pause_svg
              : RoomAssets.chat_room$atmosphere_atmosphere_resume_svg,
          width: 24,
          height: 24,
          color: Colors.white,
        ),
      ),
    );
  }

  /// 右侧关闭按钮
  Widget _buildCloseBtn() {
    return InkWell(
      onTap: () async {
        stopAudio();
        MusicController.stopPlay();
        widget.onCloseListener?.call();
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
            color: Color(0x0A313131), shape: BoxShape.circle),
        child: R.img(
          RoomAssets.chat_room$icon_close_svg,
          width: 32,
          height: 32,
          color: const Color(0xFFA5A5A5),
        ),
      ),
    );
  }

  String _getProgressText() {
    String formatProgress = RtcAudioPlayer.formatTime(progress);
    String formatDuration = RtcAudioPlayer.formatTime(duration);
    return '$formatProgress/$formatDuration';
  }
}

/// 定制进度条指示器双圆样式
class _DoubleCircleThumbShape extends SliderComponentShape {
  final double outerRadius;
  final double innerRadius;
  final Color outerColor;
  final Color innerColor;

  _DoubleCircleThumbShape(
      {required this.outerRadius,
      required this.innerRadius,
      required this.outerColor,
      required this.innerColor});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(outerRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    canvas.drawCircle(
      center,
      outerRadius,
      Paint()..color = outerColor,
    );

    canvas.drawCircle(
      center,
      innerRadius,
      Paint()..color = innerColor,
    );
  }
}
