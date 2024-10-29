import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';

class GodRecommendItemPlayer extends StatefulWidget {
  final String audioUrl;
  final int duration;
  final int gender;

  const GodRecommendItemPlayer(
      {super.key,
      required this.audioUrl,
      required this.duration,
      required this.gender});

  @override
  State<GodRecommendItemPlayer> createState() => _GodRecommendItemPlayerState();
}

class _GodRecommendItemPlayerState extends State<GodRecommendItemPlayer> {
  late int _leftSeconds = widget.duration;

  bool _isPlaying = false;

  String get _audioPlayerBg {
    if (_isPlaying) {
      return widget.gender == 1
          ? Assets.rank$god_bg_audio_pause_blue_webp
          : Assets.rank$god_bg_audio_pause_pink_webp;
    } else {
      return widget.gender == 1
          ? Assets.rank$god_bg_audio_play_blue_webp
          : Assets.rank$god_bg_audio_play_pink_webp;
    }
  }

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('Home.Audio.Play', _onEvent);
    eventCenter.addListener('Home.Audio.Stop', _onEvent);
  }

  @override
  void dispose() {
    eventCenter.removeListener('Home.Audio.Play', _onEvent);
    eventCenter.removeListener('Home.Audio.Stop', _onEvent);
    super.dispose();
  }

  void _onEvent(String type, dynamic data) {
    if (data is Map && widget.audioUrl == Util.parseStr(data['url'])) {
      if (type == 'Home.Audio.Play') {
        _isPlaying = true;
        _leftSeconds = Util.parseInt(data['seconds']);
      } else if (type == 'Home.Audio.Stop') {
        _isPlaying = false;
        _leftSeconds = widget.duration;
      }
      refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return QuickTapFilterWidget(
      onTap: () {
        AudioPlay.instance().play(widget.audioUrl, widget.duration);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.dp)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child:
                  Container(color: Colors.black12, width: 72.dp, height: 24.dp),
            ),
          ),
          Container(
            width: 72.dp,
            height: 24.dp,
            alignment: AlignmentDirectional.centerStart,
            padding: EdgeInsetsDirectional.only(start: 48.dp),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(_audioPlayerBg))),
            child: Text(
              '$_leftSeconds"',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.dp,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
