import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat/assets.dart';
import 'package:audioplayers/audioplayers.dart';

/// 音频播放控件
class QuickReplyVoiceWidget extends StatefulWidget {
  final AudioPlay audioPlay;
  final String audioUrl;
  final int audioLen;
  final bool canDark;

  const QuickReplyVoiceWidget(
      {super.key,
      required this.audioPlay,
      required this.audioUrl,
      required this.audioLen,
      this.canDark = true});

  @override
  State<QuickReplyVoiceWidget> createState() => _QuickReplyVoiceWidgetState();
}

class _QuickReplyVoiceWidgetState extends State<QuickReplyVoiceWidget> {
  int _leftSeconds = 0;

  bool get _isPlaying =>
      widget.audioPlay.currentPlayUrl == widget.audioUrl &&
      widget.audioPlay.playerState == PlayerState.playing;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(
        AudioPlay.eventAudioPlayChanged, _onPositionChangeEvent);
    eventCenter.addListener(AudioPlay.eventAudioStopChanged, _onStopEvent);
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(
        AudioPlay.eventAudioPlayChanged, _onPositionChangeEvent);
    eventCenter.removeListener(AudioPlay.eventAudioStopChanged, _onStopEvent);
  }

  void _onPositionChangeEvent(String type, dynamic data) {
    if (data is Map) {
      String? url = data['url'];
      if (url == widget.audioUrl) {
        _leftSeconds = Util.parseInt(data['seconds']);
        setState(() {});
      }
    }
  }

  void _onStopEvent(String type, dynamic data) {
    if (data is Map) {
      String? url = data['url'];
      if (url == widget.audioUrl) {
        _leftSeconds = 0;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkMode && widget.canDark;
    String icon;
    if (_isPlaying) {
      icon = isDark
          ? Assets.chat$ic_sound_pause_dark_webp
          : Assets.chat$ic_sound_pause_webp;
    } else {
      icon = isDark
          ? Assets.chat$ic_sound_play_dark_webp
          : Assets.chat$ic_sound_play_webp;
    }
    return GestureDetector(
      onTap: () async {
        if (widget.audioUrl != widget.audioPlay.currentPlayUrl) {
          await widget.audioPlay.stop();
          await widget.audioPlay.play(widget.audioUrl, widget.audioLen);
        } else {
          if (widget.audioPlay.playerState == PlayerState.playing) {
            await widget.audioPlay.stop();
          } else {
            await widget.audioPlay.play(widget.audioUrl, widget.audioLen);
          }
        }
      },
      child: Container(
        width: 67,
        height: 28,
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withOpacity(0.08)
              : Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            R.img(icon, width: 28, height: 28),
            Container(
              width: 39,
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsetsDirectional.only(end: 2),
              child: Text(
                '${_isPlaying ? _leftSeconds : widget.audioLen}s',
                style: TextStyle(
                    color: isDark
                        ? Colors.white.withOpacity(0.9)
                        : Colors.black.withOpacity(0.9),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
