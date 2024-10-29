import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:video_player/video_player.dart';

/// 全屏播放器
///
class VideoPlayerFullScreen extends StatefulWidget {
  /// 外面传入的controller 由外面释放
  final VideoPlayerController? controller;
  final String? url;
  final String? cover;

  const VideoPlayerFullScreen({Key? key, this.controller, this.url, this.cover})
      : super(key: key);

  static Future playVideo(BuildContext context,
      {VideoPlayerController? controller, String? url, String? cover}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerFullScreen(
          controller: controller,
          url: url,
          cover: cover,
        ),
        settings: const RouteSettings(name: 'VideoPlayerFullScreen'),
      ),
    );
  }

  @override
  State<VideoPlayerFullScreen> createState() => _VideoPlayerFullScreenState();
}

class _VideoPlayerFullScreenState extends State<VideoPlayerFullScreen> {
  late VideoPlayerController _controller;
  double _dragEnd = 0.0;
  double _dragStart = 0.0;

  double volume = 0;

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();

    /// _controller 谁创建 谁释放
    _controller =
        widget.controller ?? VideoPlayerController.network(widget.url ?? '');
    if (_controller.value.isInitialized) {
      volume = _controller.value.volume;
      _play();
    } else {
      _controller.initialize().then((value) {
        _play();
      });
    }
  }

  void _play() async {
    await _controller.setLooping(true);
    await _controller.setVolume(1);
    if (!_controller.value.isPlaying) {
      await _controller.play();
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    _controller.setVolume(volume);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            PositionedDirectional(
              top: max(0, _dragEnd - _dragStart),
              start: 0,
              height: Util.height,
              width: Util.width,
              child: GestureDetector(
                onVerticalDragStart: (details) {
                  _dragStart = details.globalPosition.dy;
                },
                onVerticalDragUpdate: (details) {
                  _dragEnd = details.globalPosition.dy;
                  setState(() {});
                },
                onVerticalDragEnd: (details) {
                  if (_dragEnd - _dragStart > 300 ||
                      details.velocity.pixelsPerSecond.dy > 500) {
                    Navigator.of(context).pop();
                  } else {
                    _dragEnd = _dragStart = 0;
                    setState(() {});
                  }
                },
                child: _renderBody(),
              ),
            ),
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
        ),
      ),
    );
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
            child: Hero(
              tag: "${widget.url}",
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
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
        "player_btn_play.png",
        width: 80.0,
        height: 80.0,
        package: ComponentManager.MANAGER_VIDEO,
      ),
      onPressed: _onTapVideo,
    );
  }

  Widget _renderCover() {
    if (widget.cover == null) {
      return const SizedBox.shrink();
    }
    return CachedNetworkImage(
      imageUrl: widget.cover,
      width: Util.width,
      fit: BoxFit.contain,
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
