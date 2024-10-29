import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player/video_player.dart' as Video;

class VideoPlayerWidget extends StatefulWidget {
  final VideoInfo videoInfo;
  final bool fromFile;
  final bool muteAudio;
  final bool enableAction;
  final bool showError;
  final double containerWidth;
  final double containerHeight;
  final bool enableCrop; // 等比缩放填满容器
  final bool videoPlay;

  const VideoPlayerWidget(
      {super.key,
      required this.videoInfo,
      this.fromFile = false,
      this.muteAudio = false,
      this.enableAction = true,
      this.showError = true,
      this.enableCrop = false,
      this.containerWidth = 0.0,
      this.containerHeight = 0.0,
      this.videoPlay = true});

  @override
  VideoPlayerWidgetState createState() => VideoPlayerWidgetState();
}

class VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _controller;
  double? _aspectRatio;
  double _width = 0.0;
  double _videoHeight = 0.0;
  double _videoWidth = 0.0;
  bool _display = false;
  bool _displayTitle = false;
  String? _errorDescription;

  @override
  void didUpdateWidget(VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoInfo.videoPath != widget.videoInfo.videoPath ||
        oldWidget.videoPlay != widget.videoPlay) {
      _clear();
      _init();
    }
  }

  @override
  void initState() {
    super.initState();
    eventCenter.addListener("Navigator.Page.Push", _onNavigatorChanged);
    eventCenter.addListener("Navigator.Page.Pop", _onNavigatorChanged);
    _init();
  }

  @override
  void dispose() {
    eventCenter.removeListener("Navigator.Page.Push", _onNavigatorChanged);
    eventCenter.removeListener("Navigator.Page.Pop", _onNavigatorChanged);
    _controller?.removeListener(_onChanged);
    _controller?.dispose();

    super.dispose();
  }

  _onNavigatorChanged(String type, dynamic data) {
    if (data is String) {
      if (type == "Navigator.Page.Push" &&
          (data == '/previewFriendCard' ||
              data == '/ChatMatchList' ||
              data == '/SearchEggWidget')) {
        _controller?.pause();
      } else if (type == "Navigator.Page.Pop" &&
              (data == '/previewFriendCard') ||
          data == '/ChatMatchList' ||
          data == '/SearchEggWidget') {
        _controller?.play();
      }
    }
  }

  _clear() {
    _aspectRatio = null;
  }

  _init() {
    if (_controller != null) {
      _controller!.removeListener(_onChanged);
      _controller!.dispose();
    }
    setState(() {
      _errorDescription = null;
      if (widget.fromFile) {
        if (widget.videoInfo.path != null) {
          _controller =
              VideoPlayerController.file(File(widget.videoInfo.path!));
        }
      } else {
        if (widget.videoInfo.videoPath != null) {
          _controller =
              VideoPlayerController.network(widget.videoInfo.videoPath!);
        }
      }

      _controller?.setLooping(true);
      _controller?.addListener(_onChanged);
      if (widget.muteAudio == true) _controller?.setVolume(0.0);
      _controller?.initialize();
      if (widget.videoPlay) _controller?.play();
    });
  }

  _onChanged() {
    Log.d(_controller?.value);
    Log.d(_controller?.value.isBuffering);
    Log.d(_controller?.value.buffered);
    bool changed = false;
    VideoPlayerValue? value = _controller?.value;
    if (_aspectRatio == null &&
        value?.size != null &&
        value!.size.width > 0 &&
        value.size.height > 0) {
      changed = true;
      _videoHeight = MediaQuery.of(context).size.width *
          value.size.height /
          value.size.width;
      _videoWidth = MediaQuery.of(context).size.width;
      _aspectRatio = value.size.width / value.size.height;

      if (widget.enableCrop) {
        if (_videoHeight < widget.containerHeight) {
          _videoHeight = widget.containerHeight;
          _videoWidth = _videoHeight * _aspectRatio!;
        }
      }
    }

    if (value?.duration != null &&
        value?.position != null &&
        value!.duration.inMilliseconds > 0) {
      changed = true;
      _width = Util.width *
          value.position.inMilliseconds /
          value.duration.inMilliseconds;
    }

    if (!_display &&
        value?.isBuffering == false &&
        value!.buffered.isNotEmpty) {
      changed = true;
      _display = true;
    }

    if (_errorDescription == null && value?.errorDescription != null) {
      Log.d("---------------------> error ${value?.errorDescription}");
      _errorDescription = value?.errorDescription;
      changed = true;
    }

    if (changed == true) {
      setState(() {});
    }

    Log.d("_aspectRatio $_aspectRatio");
  }

  Widget _renderBody() {
    if (_display && widget.videoPlay) {
      return OverflowBox(
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        child: SizedBox(
          width: _videoWidth,
          height: _videoHeight,
          child: Video.VideoPlayer(_controller!),
        ),
      );
    } else {
      return const CupertinoActivityIndicator();
    }
  }

  Widget _renderAction() {
    if (_controller?.value == null || !_displayTitle) {
      return Container();
    }
    if (_controller?.value.isPlaying == true) {
      return IconButton(
        iconSize: 64.0,
        padding: const EdgeInsets.all(0.0),
        color: Theme.of(context).primaryColor,
        icon: const Icon(Icons.pause_circle_outline),
        onPressed: () {
          _controller?.pause();
        },
      );
    } else {
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
        onPressed: () {
          _controller?.play();
          setState(() {
            _displayTitle = !_displayTitle;
          });
        },
      );
    }
  }

  _renderInit() {
    if (_display == false) {
      if (widget.videoInfo.cover == null) {
        return Container(
          color: Colors.black,
        );
      }
      String? image = widget.videoInfo.videoCover;
      return Container(
        color: Colors.black,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container(
        color: Colors.black,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_errorDescription != null && widget.showError) {
      return ErrorData(
        error: R.string('video_error_retry'),
        onTap: () {
          _init();
        },
      );
    }
    return Stack(
      children: <Widget>[
        PositionedDirectional(
            start: 0.0, bottom: 0.0, end: 0.0, top: 0.0, child: _renderInit()),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            setState(() {
              _displayTitle = !_displayTitle;
            });
            if (_displayTitle) {
              _controller?.pause();
            } else {
              if (widget.videoPlay) _controller?.play();
            }
          },
          child: Center(child: _renderBody()),
        ),
        if (widget.enableAction)
          PositionedDirectional(
            start: 0.0,
            bottom: 0.0,
            end: 0.0,
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                width: _width,
                height: 2.0,
                color: Colors.white.withOpacity(0.75),
              ),
            ),
          ),
        Center(
          child: _renderAction(),
        )
      ],
    );
  }
}
