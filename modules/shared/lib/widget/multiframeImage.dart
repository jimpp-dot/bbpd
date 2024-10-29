import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared/shared.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';
import 'package:flutter/scheduler.dart';

typedef OnFrameEmitted = void Function(int count, int totalCount);

class MultiframeImage extends StatefulWidget {
  final bool loop;
  final bool pause;
  bool pauseShowFirst; // 初始暂停是否显示首帧
  final VoidCallback? onComplete;
  File? file;
  Future? delayToShowFuture;
  final OnFrameEmitted? onFrameEmitted;

  String? url;
  String? subDir;

  String? assetPath;

  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final Color? color;

  MultiframeImage.file(
    this.file, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.loop = false,
    this.pause = false,
    this.pauseShowFirst = false,
    this.onComplete,
    this.delayToShowFuture,
    this.onFrameEmitted,
    this.color,
  });

  MultiframeImage.network(this.url, this.subDir,
      {super.key,
      this.width,
      this.height,
      this.fit,
      this.alignment = Alignment.center,
      this.loop = false,
      this.pause = false,
      this.pauseShowFirst = false,
      this.onComplete,
      this.onFrameEmitted,
      this.delayToShowFuture,
      this.color});

  MultiframeImage.asset(
    this.assetPath, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.loop = false,
    this.pause = false,
    this.pauseShowFirst = false,
    this.onComplete,
    this.onFrameEmitted,
    this.color,
  });

  @override
  MultiframeImageState createState() {
    return MultiframeImageState();
  }

  /// 预加载
  static Future prepareFileByUrl(
      {required String url, required String subDir}) async {
    File file = await _getFile(url: url, subDir: subDir);

    if (!(await file.exists())) {
      String tmpFilePath = '${file.path}.tmp';
      try {
        await DownloadManager.download(url, tmpFilePath);
        File tmpFile = File(tmpFilePath);
        await tmpFile.rename(file.path);
      } catch (e) {
        Log.d('prepareFileByUrl url=$url error: $e');
      }
    }
  }

  static Future<bool> existCacheUrl(
      {required String url, required String subDir}) async {
    File file = await _getFile(url: url, subDir: subDir);

    return await file.exists();
  }

  static Future<File> _getFile(
      {required String url, required String subDir}) async {
    ///get file name by md5
    String md5 = _md5(url);
    String fileName = '$md5.webp';

    ///prepare sub dir
    String baseDir = join(Constant.temporaryDirectory.path, subDir);
    Directory directory = await Directory(baseDir).create(recursive: true);

    ///download file if not exists
    File file = File(join(directory.path, fileName));
    return file;
  }

  static String _md5(String data) {
    Uint8List content = const Utf8Encoder().convert(data);
    Digest digest = md5.convert(content);
    return hex.encode(digest.bytes).toLowerCase();
  }
}

class MultiframeImageState extends State<MultiframeImage> {
  bool _disposed = false;
  File? _imageFile;

  ui.Codec? _codec;
  ui.FrameInfo? _nextFrame;
  int _frameCount = 0;
  Duration? _shownTimestamp;
  Duration? _frameDuration;
  int _framesEmitted = 0;
  Timer? _timer;
  ui.Image? _imageInfo;

  final double _scale = 1.0;
  int _lastCallback = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _disposed = true;
    _cancel();
    super.dispose();
  }

  @override
  @protected
  void didUpdateWidget(MultiframeImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pauseShowFirst &&
        oldWidget.pause != widget.pause &&
        (oldWidget.url == widget.url ||
            oldWidget.file?.path == widget.file?.path ||
            oldWidget.assetPath == widget.assetPath)) {
      _replay();
    } else {
      if (oldWidget.url != widget.url ||
          oldWidget.file?.path != widget.file?.path ||
          oldWidget.assetPath != widget.assetPath) {
        _cancel();
        _load();
      }
    }
  }

  void _replay() async {
    if (_framesEmitted >= _frameCount && widget.loop == false) {
      _onCompleteDelay(_frameDuration!);
    } else {
      await _decodeNextFrameAndSchedule();
    }
  }

  void resetToPlay() {
    _cancel();
    _load();
  }

  /// 从第一帧开始播放，不将_codec置为null重放不会闪
  void replay() async {
    if (!mounted || _disposed) return;
    _framesEmitted = 0;
    if (_lastCallback > 0) {
      SchedulerBinding.instance.cancelFrameCallbackWithId(_lastCallback);
      _lastCallback = 0;
    }
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    if (_nextFrame != null) {
      _nextFrame = null;
    }
    // if (_codec != null) {
    //   _codec = null;
    // }
    _load();
  }

  void _cancel() {
    _framesEmitted = 0;
    if (_lastCallback > 0) {
      SchedulerBinding.instance.cancelFrameCallbackWithId(_lastCallback);
      _lastCallback = 0;
    }
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    if (_nextFrame != null) {
      _nextFrame = null;
    }

    _replaceImage(info: null);

    if (_codec != null) {
//      _codec.dispose();  //播放过程中调用了这一行容易crash
      _codec = null;
    }
  }

  void _load() async {
    if (widget.url != null) {
      await _prepareFileByUrl();
    } else if (widget.file != null) {
      _imageFile = widget.file;
    }

    _display();
  }

  Future _prepareFileByUrl() async {
    ///get file name by md5
    String md5 = _md5(widget.url!);
    String fileName = '$md5.webp';

    ///prepare sub dir
    String baseDir = join(Constant.temporaryDirectory.path, widget.subDir);
    Directory directory = await Directory(baseDir).create(recursive: true);

    ///download file if not exists
    File file = File(join(directory.path, fileName));
    if (!(await file.exists())) {
      String tmpFilePath = '${file.path}.tmp';
      try {
        await DownloadManager.download(widget.url!, tmpFilePath);
        File tmpFile = File(tmpFilePath);
        await tmpFile.rename(file.path);
      } catch (e) {
        Log.d('_prepareFileByUrl url=${widget.url}  error: $e');
      }
    }

    _imageFile = file;
  }

  String _md5(String data) {
    Uint8List content = const Utf8Encoder().convert(data);
    Digest digest = md5.convert(content);
    return hex.encode(digest.bytes).toLowerCase();
  }

  void _handleAppFrame(Duration timestamp) {
    _lastCallback = 0;
    if (_codec == null || _disposed || _nextFrame == null) {
      return;
    }

    //print('_handleAppFrame ${DateTime.now().millisecondsSinceEpoch}, ${_framesEmitted} / ${_codec.frameCount}');
    if (_isFirstFrame() || _hasFrameDurationPassed(timestamp)) {
      if (!Util.isAppActive) {
        /// app切到后台，不刷新。iOS锁屏再打开大概率会出闪现一下粉色图
        _timer = Timer(const Duration(milliseconds: 100) * timeDilation, () {
          _lastCallback =
              SchedulerBinding.instance.scheduleFrameCallback(_handleAppFrame);
        });
        return;
      }

      if (widget.pause) {
        if (widget.pauseShowFirst) {
          _emitFrame(ImageInfo(image: _nextFrame!.image, scale: _scale));
        }
        // _timer = Timer(const Duration(milliseconds: 100) * timeDilation, () {
        //   _lastCallback = SchedulerBinding.instance.scheduleFrameCallback(_handleAppFrame);
        // });
        return;
      }

      _emitFrame(ImageInfo(image: _nextFrame!.image, scale: _scale));
      _shownTimestamp = timestamp;
      _frameDuration = _nextFrame!.duration;
      _nextFrame = null;
      if (_framesEmitted >= _frameCount && widget.loop == false) {
        _onCompleteDelay(_frameDuration!);
      } else {
        _decodeNextFrameAndSchedule();
      }
      return;
    }
    Duration delay = _frameDuration! - (timestamp - _shownTimestamp!);
    if (delay < const Duration(microseconds: 0)) {
      _lastCallback =
          SchedulerBinding.instance.scheduleFrameCallback(_handleAppFrame);
      return;
    } else {
      _timer = Timer(delay * timeDilation, () {
        _lastCallback =
            SchedulerBinding.instance.scheduleFrameCallback(_handleAppFrame);
      });
    }
  }

  bool _isFirstFrame() {
    return _frameDuration == null;
  }

  bool _hasFrameDurationPassed(Duration timestamp) {
    assert(_shownTimestamp != null);
    return timestamp - _shownTimestamp! >= _frameDuration!;
  }

  Future<void> _decodeNextFrameAndSchedule() async {
    if (_codec == null) {
      _onError();
      return;
    }
    try {
      if (_disposed) return;
      _nextFrame = await _codec!.getNextFrame();
      if (_nextFrame == null) return;
    } catch (exception) {
      Log.d(exception);
      _onError();
      return;
    }
    _lastCallback =
        SchedulerBinding.instance.scheduleFrameCallback(_handleAppFrame);
  }

  void _emitFrame(ImageInfo? imageInfo) {
    _framesEmitted += 1;
    if (imageInfo?.image == null) return;
    if (widget.onFrameEmitted != null) {
      widget.onFrameEmitted!(_framesEmitted, _frameCount);
    }

    if (widget.pause && widget.pauseShowFirst) {
      setState(() {
        _imageInfo = imageInfo?.image;
      });
    } else {
      setState(() {
        _replaceImage(info: imageInfo!.image);
      });
    }
  }

  void _replaceImage({required ui.Image? info}) {
    final ui.Image? oldImageInfo = _imageInfo;
    SchedulerBinding.instance
        .addPostFrameCallback((_) => oldImageInfo?.dispose());
    _imageInfo = info;
  }

  Future<Uint8List?> _loadFileBytes() async {
    if (_imageFile != null) {
      Uint8List bytes = await _imageFile!.readAsBytes();
      return bytes;
    } else if (widget.assetPath != null) {
      String path = widget.assetPath!;
      if (!path.contains('assets')) {
        path = "assets/images/${widget.assetPath!}";
      }
      ByteData bytes = await otaResourceBundle.load(path);
      return bytes.buffer.asUint8List();
    }
    return null;
  }

  _display() async {
    if (!mounted || _disposed) return;
    try {
      Uint8List? bytes = await _loadFileBytes();
      if (bytes == null) {
        return;
      }
      final buffer = await ImmutableBuffer.fromUint8List(bytes);
      _codec = await PaintingBinding.instance
          .instantiateImageCodecFromBuffer(buffer);
      _frameCount = _codec!.frameCount;
    } catch (e) {
      Log.d(e);
      _onError();
      return;
    }
    if (_codec == null || _frameCount <= 0) {
      _onError();
      return;
    }
    if (mounted) {
      _framesEmitted = 0;
      if (widget.delayToShowFuture != null) {
        await widget.delayToShowFuture;
      }
      _decodeNextFrameAndSchedule();
      setState(() {});
    } else {
      Log.d("mounted error");
    }
  }

  _onError() {
    if (widget.onComplete != null) widget.onComplete!();
  }

  _onCompleteDelay(Duration duration) async {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(duration, _onComplete);
  }

  _onComplete() {
    if (widget.onComplete != null) widget.onComplete!();
  }

  @override
  Widget build(BuildContext context) {
    if (_imageInfo != null && _codec != null) {
      return RawImage(
        image: _imageInfo,
        scale: _scale,
        width: widget.width,
        height: widget.height,
        fit: widget.fit ?? BoxFit.fill,
        alignment: widget.alignment,
        color: widget.color,
        colorBlendMode: BlendMode.srcIn,
      );
    } else {
      return const SizedBox();
    }
  }
}
