import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/room_background_info.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChatRoomBgScreen extends StatefulWidget {
  final Size? size;
  final RoomBackGroundInfo? roomBackGroundInfo;
  final bool isPlaying;
  final Color? bgColor;
  final BoxFit? fit;
  final AlignmentGeometry alignment;

  const ChatRoomBgScreen({
    Key? key,
    this.roomBackGroundInfo,
    this.size,
    this.isPlaying = true,
    this.bgColor,
    this.fit,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  _ChatRoomBgScreenState createState() => _ChatRoomBgScreenState();
}

class _ChatRoomBgScreenState extends State<ChatRoomBgScreen> {
  late Size _size;
  Offset? _bigHeadPosition; // 大头位位置
  bool? _hasBigHead; // 是否有大头位;

  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _size = widget.size ?? Size.copy(MediaQuery.of(context).size);
    if (isVideo() && widget.isPlaying) {
      _playOrPause(widget.isPlaying);
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      _initBigHeadPosition();
    });
  }

  @override
  void dispose() {
    _disposePlayer();
    super.dispose();
  }

  void _initBigHeadPosition() {
    ChatRoomData? room = ChatRoomData.getInstance();
    if (room?.config == null) return;
    RenderBox? renderBox =
        room?.bigHeadKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      _hasBigHead = true;
      Offset bigHeadPosition = renderBox.localToGlobal(Offset.zero);
      if (_bigHeadPosition != bigHeadPosition) {
        _bigHeadPosition = bigHeadPosition;
        setState(() {});
      }
    } else {
      if (_hasBigHead != false) {
        _hasBigHead = false;
        setState(() {});
      }
    }
  }

  void _playOrPause(bool play) {
    if (widget.roomBackGroundInfo?.type != RoomBackGroundType.mp4 ||
        Util.isStringEmpty(widget.roomBackGroundInfo?.url)) {
      return;
    }
    if (play) {
      if (_controller == null) {
        _initPlayer(widget.roomBackGroundInfo!.url);
      } else {
        if (!_controller!.value.isPlaying) _controller?.play();
      }
    } else {
      if (_controller == null) {
        return;
      }
      if (_controller!.value.isPlaying) _controller?.pause();
    }
  }

  void _initPlayer(String url) {
    _disposePlayer();
    _controller = VideoPlayerController.network(url)
      ..initialize().then((_) async {
        await _controller?.setLooping(true);
        await _controller
            ?.setVolume(widget.roomBackGroundInfo?.needSilent == true ? 0 : 1);
        if (mounted) {
          setState(() {});
          _controller?.play();
        }
      });
  }

  void _disposePlayer() {
    Log.d('_disposePlayer');
    _controller?.dispose();
    _controller = null;
  }

  @override
  void didUpdateWidget(covariant ChatRoomBgScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Log.d('didUpdateWidget oldurl=${oldWidget.roomBackGroundInfo.url}  newUrl = ${widget.roomBackGroundInfo.url}');
    // Log.d('didUpdateWidget oldurl=${oldWidget.roomBackGroundInfo.type}  newUrl = ${widget.roomBackGroundInfo.type}');

    /// 类型 或者url变化 先释放player
    if (oldWidget.roomBackGroundInfo?.type != widget.roomBackGroundInfo?.type ||
        oldWidget.roomBackGroundInfo?.url != widget.roomBackGroundInfo?.url) {
      _disposePlayer();
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      _initBigHeadPosition();
    });

    if (widget.roomBackGroundInfo == null || !isVideo()) return;

    _playOrPause(widget.isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    return _wrapMask(_buildBody());
  }

  Widget _buildBody() {
    if (Util.isStringEmpty(widget.roomBackGroundInfo?.url))
      return const SizedBox.shrink();

    if (isVideo()) {
      return SizedBox(
        width: _size.width,
        height: _size.height,
        child: (_controller != null && _controller!.value.isInitialized)
            ? VideoPlayer(_controller!,
                key: Key(widget.roomBackGroundInfo!.url))
            : const SizedBox.shrink(),
      );
    } else {
      return Container(
        width: _size.width,
        height: _size.height,
        color: widget.bgColor ?? Colors.black,
        child: CachedNetworkImage(
          placeholder: R.img(
            'room_background_normal.webp',
            width: _size.width,
            height: _size.height,
            package: ComponentManager.MANAGER_BASE_ROOM,
            cachedWidth: _size.width.px,
            cachedHeight: _size.height.px,
            fit: widget.fit ?? BoxFit.cover,
          ),
          errorWidget: R.img(
            'room_background_normal.webp',
            width: _size.width,
            height: _size.height,
            package: ComponentManager.MANAGER_BASE_ROOM,
            cachedWidth: _size.width.px,
            cachedHeight: _size.height.px,
            fit: widget.fit ?? BoxFit.cover,
          ) ,
          imageUrl: Util.parseIcon(widget.roomBackGroundInfo!.url),
          fit: widget.fit ?? BoxFit.cover,
          alignment: widget.alignment,
          width: _size.width,
          height: _size.height,
          fadeInDuration: const Duration(milliseconds: 0),
          fadeOutDuration: const Duration(milliseconds: 0),
        ),
      );
    }
  }

  // 蒙层
  Widget _wrapMask(Widget child) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topCenter,
      children: [
        child,
        _renderBgDecorate(),
        // 蒙层
        PositionedDirectional(
          start: 0,
          top: 0,
          width: Util.width,
          height: Util.height,
          child: Container(
            width: Util.width,
            height: Util.height,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ],
    );
  }

  /// 背景装饰
  Widget _renderBgDecorate() {
    if (_hasBigHead == null) return const SizedBox.shrink();
    String? decorate = widget.roomBackGroundInfo?.decorate;
    if (decorate == null || decorate.isEmpty) return const SizedBox.shrink();
    double height = 140;
    double top;
    if (_hasBigHead == true && _bigHeadPosition != null) {
      top = _bigHeadPosition!.dy - 43;
    } else {
      top = 75;
    }

    // Log.d('ChatRoomBgScreen', '_renderBgDecorate top=$top _hasBigHead=$_hasBigHead _bigHeadPosition=$_bigHeadPosition');

    return PositionedDirectional(
      top: top,
      height: height,
      child: CachedNetworkImage(
        imageUrl: Util.parseIcon(decorate),
        fit: BoxFit.fitHeight,
        height: height,
        fadeInDuration: const Duration(milliseconds: 0),
        fadeOutDuration: const Duration(milliseconds: 0),
      ),
    );
  }

  bool isVideo() {
    return widget.roomBackGroundInfo?.type == RoomBackGroundType.mp4;
  }
}
