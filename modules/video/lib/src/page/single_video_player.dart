import 'dart:io';

import 'package:shared/shared.dart' hide Icon;
import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:video/assets.dart';
import 'package:video_player/video_player.dart';

/// 视频播放页
class SingleVideoPlayer extends StatefulWidget {
  final VideoInfo videoInfo;

  const SingleVideoPlayer({Key? key, required this.videoInfo})
      : super(key: key);

  @override
  SingleVideoPlayerState createState() => SingleVideoPlayerState();
}

class SingleVideoPlayerState extends State<SingleVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
    _init();
  }

  @override
  void dispose() {
    _controller.dispose();
    WakelockPlus.disable();
    super.dispose();
  }

  _init() {
    if (widget.videoInfo.fromFile ?? false) {
      if (widget.videoInfo.path != null) {
        _controller = VideoPlayerController.file(File(widget.videoInfo.path!))
          ..initialize().then((_) async {
            await _controller.setLooping(true);
            if (mounted) {
              setState(() {});
              _controller.play();
            }
          });
      }
    } else {
      if (widget.videoInfo.videoPath != null) {
        _controller = VideoPlayerController.network(widget.videoInfo.videoPath!)
          ..initialize().then((_) async {
            await _controller.setLooping(true);
            if (mounted) {
              setState(() {});
              _controller.play();
            }
          });
      }
    }
  }

  Widget _renderBody() {
    return Center(
      child: (_controller.value.isInitialized)
          ? _renderPlayer()
          : _renderLoading(),
    );
  }

  Widget _renderPlayer() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _onTapVideo,
          child: Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
        VideoProgressIndicator(
          _controller,
          allowScrubbing: false,
          colors:
              VideoProgressColors(playedColor: Colors.white.withOpacity(0.7)),
        ),
        if (!_controller.value.isPlaying)
          Center(
            child: _renderAction(),
          ),
      ],
    );
  }

  Widget _renderAction() {
    return IconButton(
      iconSize: 64.0,
      padding: const EdgeInsets.all(0.0),
      color: Theme.of(context).primaryColor,
      icon: R.img(
        Assets.video$player_btn_play_png,
        width: 80.0,
        height: 80.0,
      ),
      onPressed: _onTapVideo,
    );
  }

  Widget _renderCover() {
    String? image = widget.videoInfo.videoCover;
    if (image == null) {
      return Container();
    }
    return CachedNetworkImage(
      imageUrl: image,
      width: Util.width,
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _renderBody(),
        PositionedDirectional(
          top: 40,
          start: 0,
          child: IconButton(
            padding: const EdgeInsetsDirectional.only(
                start: 20, end: 12, top: 10, bottom: 10),
            icon: const Icon(Icons.close, size: 24, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }

  Widget _renderLoading() {
    if (!_controller.value.isPlaying) return _renderCover();

    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Color(0x80000000),
        valueColor: AlwaysStoppedAnimation(Colors.white),
        strokeWidth: 3.0,
      ),
    );
  }

  void _onTapVideo() async {
    bool isPlaying = _controller.value.isPlaying;
    if (isPlaying) {
      await _controller.pause();
      WakelockPlus.disable();
    } else {
      await _controller.play();
      WakelockPlus.enable();
    }

    if (mounted) {
      setState(() {});
    }
  }
}
