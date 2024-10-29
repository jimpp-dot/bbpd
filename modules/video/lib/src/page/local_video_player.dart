import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:video/assets.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class LocalVideoPlayerScreen extends StatefulWidget {
  final File videoFile;

  static Future openLocalVideoPlayerScreen(
      BuildContext context, File videoFile) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        settings: const RouteSettings(name: '/LocalVideoPlayerScreen'),
        builder: (context) => LocalVideoPlayerScreen(videoFile),
      ),
    );
  }

  const LocalVideoPlayerScreen(this.videoFile, {Key? key}) : super(key: key);

  @override
  _LocalVideoPlayerScreenState createState() => _LocalVideoPlayerScreenState();
}

class _LocalVideoPlayerScreenState extends State<LocalVideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) async {
        await _controller.setLooping(true);
        if (mounted) {
          setState(() {});
          _controller.play();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

  Widget _renderBody() {
    return Center(
      child: (_controller.value.isInitialized)
          ? _renderPlayer()
          : _renderLoading(),
    );
  }

  Widget _renderLoading() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Color(0x80000000),
        valueColor: AlwaysStoppedAnimation(Colors.white),
        strokeWidth: 3.0,
      ),
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

  _onDeleteVideo() {
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        '',
        actionTitle: BaseK.K.delete,
        onPressed: () => _onDeleteVideo(),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onTapVideo,
        child: Center(
          child: _renderBody(),
        ),
      ),
    );
  }
}
