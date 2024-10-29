import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/video_player/video_play_fullscreen.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:provider/provider.dart' hide Selector;

class MateMomentVideoWidget extends StatefulWidget {
  final String? url;
  final double? width;
  final double? height;
  final Moment? moment;
  final bool autoPlay;
  final String videoUrl;
  final MomentFlowPage? pageKey;
  final bool? isInView;
  final String? topicName; // 页面标签

  const MateMomentVideoWidget({
    super.key,
    this.url,
    required this.width,
    required this.height,
    this.moment,
    this.autoPlay = false,
    required this.videoUrl,
    required this.pageKey,
    this.isInView,
    this.topicName,
  });

  @override
  _MateMomentVideoWidgetState createState() => _MateMomentVideoWidgetState();
}

class _MateMomentVideoWidgetState extends State<MateMomentVideoWidget>
    with WidgetsBindingObserver {
  static const String tag = 'MomentVideoWidgetState';

  bool get _isAutoPlayVideo => widget.autoPlay;

  bool _oldVisible = true;
  int _videoDuration = 0;
  DateTime? _startPlayTime;
  bool _display = false;

  String? _uniqueId;
  bool _mute = true;
  late MomentVideoProvider provider;

  VideoPlayerController? _controller;

  bool _isVideoTaped = false;

  @override
  void initState() {
    super.initState();
    provider = context.read<MomentVideoProvider>();
    provider.addListener(_scrollChange);

    _init();
  }

  _init() {
    _oldVisible = true;

    var uuid = const Uuid();
    _uniqueId = uuid.v4();
    _display = false;

    if (_isAutoPlayVideo) {
      _controller = VideoPlayerController.network(widget.videoUrl)
        ..initialize().then((_) async {
          Log.d('video initialize${widget.videoUrl}', tag: tag);
          _display = true;
          await _controller!.setVolume(0);
          await _controller!.setLooping(true);
          _videoDuration = _controller!.value.duration.inMilliseconds;
          if (mounted) {
            setState(() {});
            _startVideo();
          }
        });
    }
  }

  void _scrollChange() async {
    int state = provider.scrollState(widget.pageKey);
    Log.d('_scrollChange: $state');
    if (state == 1) {
      if (_oldVisible) {
        _startVideo();
      }
    } else {
      _pauseVideo();
    }
  }

  @override
  void dispose() {
    _oldVisible = false;
    if (_isAutoPlayVideo) {
      _stopVideo();
    }
    provider.removeListener(_scrollChange);
    super.dispose();
  }

  /// 视频点击
  _onVideoTaped() async {
    trackerReport(
        moment: widget.moment,
        page: widget.pageKey,
        clickType: 'video',
        topicName: widget.topicName);
    _isVideoTaped = true;
    await VideoPlayerFullScreen.playVideo(context,
        controller: _controller,
        url: widget.videoUrl,
        cover: widget.moment?.videoCover?.url);
    _isVideoTaped = false;
  }

  void _startVideo() async {
    if (_isAutoPlayVideo) {
      if (_controller != null && !_controller!.value.isPlaying) {
        Log.d('video _startVideo', tag: tag);
        await _controller!.play();
        _startPlayTime = DateTime.now();
      }
    }
  }

  void _pauseVideo() async {
    if (_isAutoPlayVideo) {
      Log.d('video _pauseVideo', tag: tag);
      if (_controller != null &&
          _controller!.value.isPlaying &&
          !_isVideoTaped) {
        _controller!.pause();
        _report();
      }
    }
  }

  void _stopVideo() async {
    if (_controller != null) {
      _controller!.dispose();
      _report();
    }
  }

  void _onVideoVisible(bool visible) async {
    if (_oldVisible == visible) {
      return;
    }
    _oldVisible = visible;

    if (_controller != null) {
      if (visible) {
        if (!_controller!.value.isPlaying) {
          _startVideo();
        }
      } else {
        if (_controller!.value.isPlaying) {
          _pauseVideo();
        }
      }
    }
  }

  _report() {
    if (_startPlayTime == null ||
        _controller == null ||
        !_controller!.value.isInitialized) return;

    int playTime = DateTime.now().difference(_startPlayTime!).inMilliseconds;
    if (widget.moment != null && playTime > 0) {
      _startPlayTime = null;
      // Log.d('report play time: $playTime');
      // Log.d('report video duration : $_videoDuration');

      Tracker.instance.track(TrackEvent.flow_media_time, properties: {
        'page': getFlowPage(widget.pageKey),
        'flow_type': widget.moment?.flowType,
        'owner_uid': widget.moment?.uid,
        'moment_id': widget.moment?.topicId,
        'media_type': 'video',
        'tag': widget.moment?.reportTag,
        'total_time': _videoDuration,
        'play_time': playTime,
      });
    }
  }

  _refresh() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_isAutoPlayVideo) {
      if (BaseConfig.instance.useMusicPkg &&
          widget.moment != null &&
          widget.moment!.workInfo != null) {
        return _buildWorkVideo();
      } else {
        return _buildAutoVideo();
      }
    } else {
      return MomentSingleImageWidget(
        url: widget.url ?? '',
        onTap: _onVideoTaped,
        width: widget.width,
        height: widget.height,
        moment: widget.moment,
        isVideo: true,
      );
    }
  }

  Widget _renderCover(Size size) {
    if (_display == false) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.black,
          alignment: AlignmentDirectional.center,
          child: (widget.url == null || widget.url!.isEmpty)
              ? const CupertinoActivityIndicator()
              : CachedNetworkImage(
                  imageUrl: widget.url,
                  width: size.width,
                  height: size.height,
                  cachedWidth: size.width.px,
                  cachedHeight: size.height.px,
                  fit: BoxFit.cover,
                ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildVideoWidget(Size size) {
    return IgnorePointer(
      child: Hero(
        tag: widget.videoUrl,
        child: AspectRatio(
          aspectRatio: size.width / size.height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: VideoPlayer(_controller!),
          ),
        ),
      ),
    );
  }

  ///录唱作品动态，视频尺寸和底部栏跟普通视频有区别
  Widget _buildWorkVideo() {
    double maxHeight = 340;
    Size size = getWorkVideoBoxSize(widget.width, widget.height);
    double topOffset = (maxHeight - size.height) / 2; //裁剪视频并垂直居中展示
    return VisibilityDetector(
      key: ValueKey(_key),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction <= 0.2) {
          _onVideoVisible(false);
        } else if (visibilityInfo.visibleFraction >= 0.8) {
          _onVideoVisible(true);
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: size.width,
          height: size.height > maxHeight ? maxHeight : size.height,
          child: Stack(
            children: [
              PositionedDirectional(
                top: topOffset,
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: GestureDetector(
                    onTap: _onVideoTaped,
                    behavior: HitTestBehavior.translucent,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        _buildVideoWidget(size),
                        _renderCover(size),
                      ],
                    ),
                  ),
                ),
              ),
              _buildBottomWorkInfoWidget(),
              PositionedDirectional(
                top: 8,
                start: 8,
                child: GestureDetector(
                  onTap: () async {
                    _mute = !_mute;
                    await _controller?.setVolume(_mute ? 0 : 1);
                    _refresh();
                  },
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.2)),
                    child: R.img(
                      !_mute ? 'ic_video_no_mute.png' : 'ic_video_mute.png',
                      package: ComponentManager.MANAGER_MOMENT,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomWorkInfoWidget() {
    WorkInfo workInfo = widget.moment!.workInfo!;
    return PositionedDirectional(
      bottom: 0,
      start: 0,
      end: 0,
      child: Container(
        height: 67.5,
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0x00000000),
                const Color(0xFF000000).withOpacity(0.6)
              ],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
            ),
            borderRadius: const BorderRadiusDirectional.only(
                bottomStart: Radius.circular(10),
                bottomEnd: Radius.circular(10))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.all(7),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                        colors: [Color(0xFF393939), Color(0xFF161616)],
                      )),
                  child: CommonAvatar(
                    path: workInfo.singerIcon,
                    size: 17.6,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: MarqueeText(
                    text: '${workInfo.singerName}-${workInfo.songName}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    speed: 10,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                R.img('ic_moment_goto_sing.svg',
                    fit: BoxFit.fill,
                    width: 36,
                    height: 30,
                    package: ComponentManager.MANAGER_MOMENT),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Size getWorkVideoBoxSize(double? width, double? height) {
    if (width != null && height != null && width > 0 && width > 0) {
      double containerWidth = 213.3;
      double containerHeight = containerWidth * height / width;
      return Size(containerWidth, containerHeight);
    }
    return const Size(213.3, 426.6);
  }

  Widget _buildAutoVideo() {
    // Log.d('build video: ${widget.width},${widget.height}');
    Size? size = getFixedVideoBoxSize(widget.width, widget.height);

    return VisibilityDetector(
      key: ValueKey(_key),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction <= 0.2) {
          _onVideoVisible(false);
        } else if (visibilityInfo.visibleFraction >= 0.8) {
          _onVideoVisible(true);
        }
      },
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: GestureDetector(
          onTap: _onVideoTaped,
          behavior: HitTestBehavior.translucent,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildVideoWidget(size),
              _renderCover(size),
              _buildVolumeWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVolumeWidget() {
    return PositionedDirectional(
      bottom: 8,
      start: 8,
      child: GestureDetector(
        onTap: () async {
          _mute = !_mute;
          await _controller?.setVolume(_mute ? 0 : 1);
          _refresh();
        },
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.black.withOpacity(0.2)),
          child: R.img(
            !_mute ? 'ic_video_no_mute.png' : 'ic_video_mute.png',
            package: ComponentManager.MANAGER_MOMENT,
          ),
        ),
      ),
    );
  }

  String get _key {
    return Util.md5Encryption(
        '${getFlowPage(widget.pageKey)}_${widget.videoUrl}_$_uniqueId');
  }
}
