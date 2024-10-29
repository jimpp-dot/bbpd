import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:shared/shared.dart';
import 'package:path/path.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert' as convert;
import 'package:flutter/scheduler.dart';
import 'package:quiver/collection.dart';

class GifRemote extends StatefulWidget {
  final String uri;
  final bool loop;
  final VoidCallback? onComplete;
  final bool useCache;

  const GifRemote(
      {super.key,
      required this.uri,
      this.loop = false,
      this.onComplete,
      this.useCache = false});

  @override
  _GifRemoteState createState() {
    return _GifRemoteState();
  }
}

enum GifStatus { Check, Download, Display }

class _GifRemoteState extends State<GifRemote> {
  bool _disposed = false;
  GifStatus _status = GifStatus.Check;
  File? _image;

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

  String? _imageKey;

  /// 是否命中缓存，命中缓存直接使用缓存
  bool _inCache = false;

  /// 是否写入缓存
  bool _needCache = false;
  List<ui.FrameInfo> _cacheFrames = [];

  static LruMap<String, GifCache> imageCache =
      LruMap<String, GifCache>(maximumSize: 10);

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
  void didUpdateWidget(GifRemote oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.uri != widget.uri) {
      _cancel();
      _status = GifStatus.Check;
      _load();
    }
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
    if (_codec != null) {
      //this._codec.dispose();
      _codec = null;
    }
  }

  void _load() async {
    String gifDir = join(Constant.documentsDirectory.path, 'gif.v1');
    Directory directory = await Directory(gifDir).create(recursive: true);

    List<int> bytes = convert.utf8.encode(widget.uri);
    Digest digest = sha1.convert(bytes);
    _imageKey = digest.toString();

    File image = File(join(directory.path, '${_imageKey!}.gif'));
    File temp =
        File(join(Constant.temporaryDirectory.path, '${_imageKey!}.gif'));

    if (_disposed || !mounted) return;

    if (await image.exists() == false) {
      if (mounted == false) return;
      setState(() {
        _status = GifStatus.Download;
      });
      bool ok = await _download(widget.uri, temp.path);
      if (ok) {
        try {
          await temp.rename(image.path);
        } catch (e) {
          _onError();
          return;
        }
        if (_disposed || !mounted) return;
        _image = image;
        _display();
      } else {
        _onError();
      }
    } else {
      _image = image;
      _display();
    }
  }

  void _handleAppFrame(Duration timestamp) {
    _lastCallback = 0;
    if ((_codec == null && _inCache == false) ||
        _disposed ||
        _nextFrame == null) {
      return;
    }
    //Log.d('_handleAppFrame ${new DateTime.now().millisecondsSinceEpoch}, ${this._framesEmitted} / ${this._codec.frameCount}');
    if (_isFirstFrame() || _hasFrameDurationPassed(timestamp)) {
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
    if (_codec == null && _inCache == false) {
      _onError();
      return;
    }
    try {
      if (_disposed) return;
      _nextFrame = await getNextFrame();
      if (_nextFrame == null) return;
    } catch (exception) {
      Log.d(exception);
      _onError();
      return;
    }
    _lastCallback =
        SchedulerBinding.instance.scheduleFrameCallback(_handleAppFrame);
  }

  Future<ui.FrameInfo?> getNextFrame() async {
    if (_inCache && _cacheFrames.length == _frameCount) {
      if (_framesEmitted >= _frameCount) {
        _framesEmitted = 0;
      }

      if (_cacheFrames.length <= _framesEmitted) {
        Log.d('getNextFrame onError');
        _onError();
        return null;
      }

      return _cacheFrames[_framesEmitted];
    }

    ui.FrameInfo frame = await _codec!.getNextFrame();
    if (_needCache) {
      /// 图片尺寸大于500x500的不加入缓存，以防内存爆了
      if (_cacheFrames.length < _frameCount &&
          frame.image.width <= 500 &&
          frame.image.height <= 500) {
        _cacheFrames.add(frame);
      }

      if (_cacheFrames.length == _frameCount &&
          !imageCache.containsKey(_imageKey)) {
        _needCache = false;
        imageCache[_imageKey!] =
            GifCache(frameCount: _frameCount, frames: _cacheFrames);
        Log.d('getNextFrame set cache, _frameCount: $_frameCount');
        _inCache = true;
      }
    }
    return frame;
  }

  void _emitFrame(ImageInfo? imageInfo) {
    _framesEmitted += 1;
    if (imageInfo?.image == null) return;
    setState(() {
      _imageInfo = imageInfo!.image;
    });
  }

  _display() async {
    if (mounted == false || _disposed) return;
    try {
      if (widget.useCache &&
          !(AppConfig.isLowSideDevice || AppConfig.isMidSideDevice)) {
        if (imageCache.containsKey(_imageKey)) {
          GifCache? cache = imageCache[_imageKey!];
          int cacheFrameCount = cache?.frameCount ?? 0;
          if (cacheFrameCount > 0 &&
              cacheFrameCount == (cache?.frames.length ?? 0)) {
            _inCache = true;
            _cacheFrames = cache!.frames;
            _frameCount = cacheFrameCount;
          }
        }

        Log.d('_display inCache: $_inCache');

        if (!_inCache) {
          Uint8List bytes = await _image!.readAsBytes();
          final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
          _codec = await PaintingBinding.instance
              .instantiateImageCodecWithSize(buffer);
          _frameCount = _codec!.frameCount;
          Log.d('_display no cache, _frameCount: $_frameCount');
          _needCache = true;
        }
      } else {
        Uint8List bytes = await _image!.readAsBytes();
        final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
        _codec = await PaintingBinding.instance
            .instantiateImageCodecWithSize(buffer);
        _frameCount = _codec!.frameCount;
        Log.d('_display dont use cache, _frameCount: $_frameCount');
      }
    } catch (e) {
      Log.d(e);
      _onError();
      return;
    }
    if ((_codec == null && _inCache == false) || _frameCount <= 0) {
      _onError();
      return;
    }
    if (mounted) {
      _framesEmitted = 0;
      _decodeNextFrameAndSchedule();
      setState(() {
        _status = GifStatus.Display;
      });
    } else {
      Log.d("gif mounted error");
    }
  }

  _onError() {
    if (widget.onComplete != null) widget.onComplete!();
  }

  Future<bool> _download(String downloadUrl, String downloadSavePath) async {
    var dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cr, String host, int port) {
        return true;
      };
      client.findProxy = null;
    };
    try {
      await dio.download(downloadUrl, downloadSavePath,
          onReceiveProgress: (int received, int total) {});
      return true;
    } catch (e) {
      Log.d("dio.download error");
      Log.d(e);
    }
    return false;
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
    if (_imageInfo != null && (_codec != null || _inCache)) {
      return RepaintBoundary(
        child: RawImage(
          image: _imageInfo,
          scale: _scale,
        ),
      );
    } else if (_status == GifStatus.Download) {
      return const CupertinoActivityIndicator();
    } else {
      return Container();
    }
  }
}

class GifCache {
  final int frameCount;
  final List<ui.FrameInfo> frames;

  GifCache({required this.frameCount, required this.frames});
}
