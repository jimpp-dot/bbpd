import 'package:vap_player/vap_channel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class VapView extends StatefulWidget {
  /// 完整的文件路径
  final String filePath;

  /// 重复播放次数，值为-1时无限循环播放，为0时正常播放结束不再重复
  final int repeatCount;

  /// 融合信息：图片List vap支持嵌入图片,图片需要提前下载到本地，传本地路径
  final List<String>? imgList;

  /// 融合信息：文字List vap支持嵌入文字
  final List<String>? textList;

  /// 完成回调
  final VoidCallback? onComplete;

  /// 渲染每帧的回调
  final OnRenderFrame? onRenderFrame;

  Future? delayToShowFuture;

  VapView({
    super.key,
    required this.filePath,
    this.repeatCount = 0,
    this.imgList,
    this.textList,
    this.onComplete,
    this.onRenderFrame,
    this.delayToShowFuture,
  });

  @override
  State<StatefulWidget> createState() {
    return _VapViewState();
  }
}

class _VapViewState extends State<VapView> with WidgetsBindingObserver {
  late VapChannel _vapChannel;
  int? _textureId;
  bool _videoStarted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _init();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // print("--" + state.toString());
    switch (state) {
      //切换前台时,可回调，初始化时，收不到回调
      case AppLifecycleState.resumed:
        // _refresh();
        break;
      //切换后台时,inactive，pause先后回调
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        // _doDispose();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void didUpdateWidget(VapView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.filePath != oldWidget.filePath) {
      _doDispose().then((value) {
        _init();
      });
    }
  }

  void _init() async {
    _vapChannel = VapChannel(
      onStart: _onStart,
      onComplete: widget.onComplete,
      onRenderFrame: widget.onRenderFrame,
    );
    _textureId = await _vapChannel.initialize(
      filePath: widget.filePath,
      repeatCount: widget.repeatCount,
      imgList: widget.imgList,
      textList: widget.textList,
      delayToShowFuture: widget.delayToShowFuture,
    );
    print('_VapViewState._init _textureId = $_textureId');
    _videoStarted = false;

    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _textureId != null && _videoStarted ? Texture(textureId: _textureId!) : Container());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _doDispose();
    super.dispose();
  }

  Future _doDispose() async {
    if (_textureId == null) {
      return;
    }

    int id = _textureId!;
    _textureId = null;
    _videoStarted = false;
    print('_VapViewState._doDispose _textureId = $id');
    await _vapChannel.dispose(id);
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void _onStart() {
    _videoStarted = true;
    _refresh();
  }
}
