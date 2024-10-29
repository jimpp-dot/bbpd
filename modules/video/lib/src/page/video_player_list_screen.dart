import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'single_video_player.dart';

/// 视频播放页
class VideoPlayerListScreen extends StatefulWidget {
  final int index;
  final List<VideoInfo> videos;

  const VideoPlayerListScreen({Key? key, this.index = 0, required this.videos})
      : super(key: key);

  @override
  _VideoPlayerListScreenState createState() => _VideoPlayerListScreenState();
}

class _VideoPlayerListScreenState extends State<VideoPlayerListScreen> {
  double _dragEnd = 0.0;
  double _dragStart = 0.0;

  Widget _renderBody() {
    if (widget.videos.isEmpty) {
      return const EmptyWidget();
    } else {
      return Swiper(
        itemBuilder: (BuildContext context, int index) {
          VideoInfo video = widget.videos.elementAt(index);
          return SingleVideoPlayer(videoInfo: video);
        },
        itemCount: widget.videos.length,
        index: min(0, widget.videos.length - 1),
        autoplay: false,
        loop: false,
        onIndexChanged: (int index) {},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.transparent,
                height: Util.height,
                width: Util.width,
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
