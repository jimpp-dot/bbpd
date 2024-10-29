import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VAPSimulatorPlayer extends StatefulWidget {
  final String vapAsset;
  final VoidCallback? onComplete;
  const VAPSimulatorPlayer({Key? key, required this.vapAsset, this.onComplete})
      : super(key: key);

  @override
  _VAPSimulatorPlayerState createState() => _VAPSimulatorPlayerState();
}

class _VAPSimulatorPlayerState extends State<VAPSimulatorPlayer> {
  VideoPlayerController? _controller;
  bool _completed = false;
  @override
  void initState() {
    super.initState();
    initController();
  }

  void initController() {
    _controller = VideoPlayerController.file(File(widget.vapAsset));
    _controller!.initialize().then((_) {
      if (mounted) {
        setState(() {
          _controller!.play();
        });
      }
    });
    _controller!.addListener(() {
      if (playCompleted()) {
        // 播放完成逻辑
        if (mounted) {
          setState(() {
            _completed = true;
            widget.onComplete?.call();
          });
        }
      }
    });
  }

  bool playCompleted() {
    return _controller?.value.position == _controller?.value.duration &&
        (_controller?.value.position ?? Duration.zero) > Duration.zero;
  }

  @override
  Widget build(BuildContext context) {
    Widget child = const SizedBox.shrink();
    if (_controller?.value.isInitialized == true && !_completed) {
      child = AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: VideoPlayer(_controller!),
      );
    }
    return child;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
