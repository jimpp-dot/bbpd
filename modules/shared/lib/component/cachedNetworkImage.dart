import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path/path.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/shared.dart';

import '../assets.dart';

class DefaultPlaceholder extends StatelessWidget {
  const DefaultPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }
}

enum ErrorWidgetType {
  defaultUserIcon, //用户头像
  emptyWidget, //默认空
}

class CachedNetworkImage extends StatefulWidget {
  CachedNetworkImage({
    super.key,
    this.placeholder,
    this.imageUrl,
    this.supportDark,
    this.errorWidget,
    this.errorWidgetType = ErrorWidgetType.emptyWidget,
    this.fadeOutDuration = const Duration(milliseconds: 0),
    this.fadeOutCurve = Curves.easeOut,
    this.fadeInDuration = const Duration(milliseconds: 0),
    this.fadeInCurve = Curves.easeIn,
    this.scale = 1.0,
    this.width,
    this.height,
    this.fit,
    this.centerSlice,
    this.colorBlendMode,
    this.filterQuality = FilterQuality.low,
    this.color,
    this.playback = true, //图片切换不会显示空白或者loading
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.matchTextDirection = false,
    this.httpHeaders,
    this.cachedWidth,
    this.cachedHeight,
    this.loadComplete,
    this.displayComplete,
    this.suffix,
    this.onlyFirstFrame = false,
  })  : assert(imageUrl != null),
        trace = StackTraceUtil.currentStackTrace;

  final Widget? placeholder;
  final String? imageUrl;
  final Widget? errorWidget;
  final ErrorWidgetType errorWidgetType;
  final Duration fadeOutDuration;
  final Curve fadeOutCurve;
  final Duration fadeInDuration;
  final Curve fadeInCurve;
  final Function? loadComplete;
  final Function? displayComplete;

  final double scale;
  final FilterQuality filterQuality;
  final Rect? centerSlice;
  final BlendMode? colorBlendMode;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final ImageRepeat repeat;
  final bool matchTextDirection;
  final Map<String, String>? httpHeaders;
  final bool playback;
  final int? cachedWidth;
  final int? cachedHeight;
  final String? suffix;
  final StackTrace? trace;
  final bool? supportDark;
  final bool onlyFirstFrame;

  @override
  State<StatefulWidget> createState() => _State();
}

enum DownloadState { loading, complete, display, error }

class _State extends State<CachedNetworkImage> with WidgetsBindingObserver, TickerProviderStateMixin {
  DownloadEntry? _entry;
  ImageProvider? _image;
  bool _invertColors = false;
  ImageStream? _imageStream;
  ImageStreamCompleter? _imageStreamCompleter;
  late ImageStreamListener _imageStreamListener;
  ImageInfo? _imageInfo;
  DownloadState _state = DownloadState.loading;

  bool _inImageCache = false;
  late Object _imageCacheKey;

  String? _url;

  @override
  initState() {
    super.initState();
    _imageStreamListener = ImageStreamListener(_handleImageChanged, onError: _imageErrorListener);
    _init();
    WidgetsBinding.instance.addObserver(this);
  }

  String? _getUrl(String? path, String? suffix) {
    String? url;
    if (path != null && path.trim().isNotEmpty) {
      if (widget.supportDark == true) {
        String pathExt = p.extension(path);
        path = darkMode ? p.setExtension(path, '_dark$pathExt') : path;
      }
      url = Util.imageFullUrl(path);
      if (suffix != null &&
          !url.contains(RegExp(r'!lfit_wh(\d+)')) &&
          !url.contains(RegExp(r'!head(\d+)')) &&
          !url.contains(RegExp(r'!cover(\d+)')) &&
          !url.contains('x-oss-process=image/resize')) {
        url = url + suffix;
      }
      url = Util.recombineUrl(url);
    }

    // Fix Domain missing
    if (url != null) {
      Uri? uri = Uri.tryParse(url);

      // If domain missing or not match image domain
      final imageUri = Uri.parse(System.imageDomain);
      String imageHostConfig = AppConfig.getConfig(AppConfig.image_domain);
      bool validRemoteImg = (jsonDecode(imageHostConfig) as List).contains(imageUri.host);

      if (uri != null && uri.host != imageUri.host && !validRemoteImg) {
        uri = uri.replace(
          scheme: imageUri.scheme,
          host: imageUri.host,
          port: imageUri.port,
        );
        url = uri.toString();
      }
    }
    return url;
  }

  @override
  dispose() async {
    if (_entry != null) {
      _entry!.removeListener(_onStateChanged);
      CachedImageManager.instance().remove(_entry!);
      _entry = null;
    }

    if (_imageStreamCompleter != null) {
      _imageStreamCompleter!.removeListener(_imageStreamListener);
      _imageStreamCompleter = null;
    }

    if (_imageStream != null) {
      _imageStream!.removeListener(_imageStreamListener);
      _imageStream = null;
    }
    CachedImageManager.instance().removeListener(_onNetworkChanged);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didUpdateWidget(CachedNetworkImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageUrl != oldWidget.imageUrl || widget.scale != oldWidget.scale) {
      _init();
    }
  }

  @override
  void didChangeDependencies() {
    _invertColors = MediaQuery.of(this.context).invertColors;
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    _init(); // in case the image cache was flushed
    super.reassemble();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_entry != null && _entry!.value == DownloadState.error && state == AppLifecycleState.resumed) {
      _init();
    }
  }

  _init() async {
    _url = _getUrl(widget.imageUrl, widget.suffix);
    if (_url == null || _url!.isEmpty) return;
    if (_imageStreamCompleter != null) {
      _imageStreamCompleter!.removeListener(_imageStreamListener);
      _imageStreamCompleter = null;
    }

    /// 解决切换图片（动态webp）时出现闪烁的问题：
    /// 复现场景：
    /// 1.上一个不在内存里，下载后_imageStream.addListener,
    /// 2.didUpdateWidget,命中cache，_imageStream没有removeListener，导致_imageStreamListener监听了前后两个图片的ImageChange
    /// 需要在此处调用_imageStream.removeListener
    if (_imageStream != null) {
      _imageStream!.removeListener(_imageStreamListener);
      _imageStream = null;
    }

    File imageFile = CachedImageManager.instance().getFileByUrl(_url!);
    _image = _getImageProvider(imageFile);
    if (_image is! FileImage) {
      _imageCacheKey = await _image!.obtainKey(ImageConfiguration.empty);
    } else {
      //如此优化可以避免一次await影响性能
      _imageCacheKey = _image!;
    }
    _inImageCache = imageCache.containsKey(_imageCacheKey);

    if (_entry != null) {
      _entry!.removeListener(_onStateChanged);
      CachedImageManager.instance().remove(_entry!);
      _entry = null;
    }

    if (_inImageCache) {
      _imageStreamCompleter = imageCache.putIfAbsent(
          _imageCacheKey, () => _image!.loadImage(_imageCacheKey, PaintingBinding.instance.instantiateImageCodecWithSize));
      _imageStreamCompleter?.addListener(_imageStreamListener);

      if (widget.loadComplete != null) widget.loadComplete!();
      return;
    }

    _entry = CachedImageManager.instance().add(_url!, trace: widget.trace, width: widget.width, height: widget.height);
    _entry!.addListener(_onStateChanged);
    if (widget.playback == false || _state != DownloadState.display) {
      _state = _entry!.value;
    }
  }

  _onStateChanged() {
    if (mounted) {
      if (_entry?.value == DownloadState.error) {
        _addListenerNetwork();
        setState(() {
          _state = _entry!.value;
        });
      } else if (_entry?.value == DownloadState.complete) {
        _resolveImage();
        if (widget.loadComplete != null) widget.loadComplete!();
      } else if (_entry?.value == DownloadState.loading && _state != DownloadState.display && widget.playback == false) {
        setState(() {
          _state = _entry!.value;
        });
        if (widget.displayComplete != null) {
          widget.displayComplete!();
        }
      }
    }
  }

  void _resolveImage() {
    Size? size = widget.width != null && widget.height != null ? Size(widget.width!, widget.height!) : null;

    final ImageStream newStream = _image!.resolve(createLocalImageConfiguration(
      this.context,
      size: size,
    ));
    _updateSourceStream(newStream);
  }

  ImageProvider<Object> _getImageProvider(File imageFile) {
    ImageProvider? imageProvider;
    bool inited = false;
    if (widget.cachedWidth != null || widget.cachedHeight != null) {
      imageProvider = ResizeImage(
        FileImage(imageFile, scale: widget.scale),
        width: widget.cachedWidth,
        height: widget.cachedHeight,
      );
      inited = true;
    } else if ((widget.width != null || widget.height != null) && widget.fit != BoxFit.cover && widget.fit != BoxFit.contain) {
      /// 低端机强制使用resize
      imageProvider = ResizeImage(
        FileImage(imageFile, scale: widget.scale),
        width: Util.getCommonCacheSize(widget.width),
        height: Util.getCommonCacheSize(widget.height),
      );
      inited = true;
    }
    if (!inited) {
      imageProvider = FileImage(imageFile, scale: widget.scale);
    }
    return imageProvider!;
  }

  void _updateSourceStream(ImageStream newStream) {
    if (_imageStream?.key == newStream.key) return;
    if (_imageStream != null) _imageStream!.removeListener(_imageStreamListener);
    _imageStream = newStream;
    _imageStream?.addListener(_imageStreamListener);
  }

  void _handleImageChanged(ImageInfo imageInfo, bool synchronousCall) {
    if (!mounted) return;
    if (widget.onlyFirstFrame) {
      if (_imageStreamCompleter != null) {
        _imageStreamCompleter!.removeListener(_imageStreamListener);
        _imageStreamCompleter = null;
      }
      if (_imageStream != null) {
        _imageStream!.removeListener(_imageStreamListener);
        _imageStream = null;
      }
    }
    setState(() {
      _imageInfo = imageInfo;
      _state = DownloadState.display;
    });

    if (widget.displayComplete != null) {
      widget.displayComplete!();
    }
  }

  void _imageErrorListener(Object exception, StackTrace? stackTrace) {
    // 图片异常捕获，防止抛到bugly
    Log.e(exception, stackTrace: stackTrace);
  }

  _addListenerNetwork() {
    CachedImageManager.instance().removeListener(_onNetworkChanged);
    CachedImageManager.instance().addListener(_onNetworkChanged);
  }

  _onNetworkChanged() {
    if (CachedImageManager.instance().value != ConnectivityResult.none &&
        (_entry != null && _entry?.value == DownloadState.error) &&
        mounted) {
      _init();
    }
  }

  Widget _displayLoading() {
    return widget.placeholder ?? _displayEmpty();
  }

  Widget _displayError() {
    if (widget.errorWidget != null) {
      return GestureDetector(
        onTap: () async {
          if (kDebugMode) {
            await Clipboard.setData(ClipboardData(text: _url ?? ''));
            Fluttertoast.showToast(msg: _url, gravity: ToastGravity.CENTER);
          }
        },
        child: widget.errorWidget!,
      );
    } else {
      return GestureDetector(
        onTap: () async {
          if (kDebugMode) {
            await Clipboard.setData(ClipboardData(text: _url ?? ''));
            Fluttertoast.showToast(msg: _url, gravity: ToastGravity.CENTER);
          }
        },
        child: widget.errorWidgetType == ErrorWidgetType.defaultUserIcon
            ? R.img(
                BaseAssets.shared$ic_user_none_png,
                package: ComponentManager.MANAGER_BASE_CORE,
                width: widget.width,
                height: widget.height,
              )
            : R.img(
                BaseAssets.shared$img_loading_failed_webp,
                package: ComponentManager.MANAGER_BASE_CORE,
                width: widget.width,
                height: widget.height,
              ),
      );
    }
  }

  _displayEmpty() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_state == DownloadState.loading || _state == DownloadState.complete) {
      return _displayLoading();
    }

    if (_state == DownloadState.error) {
      return _displayError();
    }

    if (_inImageCache || (widget.fadeInDuration == Duration.zero || widget.fadeOutDuration == Duration.zero)) {
      return _buildRawImage();
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          FadeWidget(
            duration: widget.fadeInDuration,
            curve: widget.fadeInCurve,
            child: _buildRawImage(),
          ),
          FadeWidget(
            duration: widget.fadeOutDuration,
            curve: widget.fadeOutCurve,
            direction: AnimationDirection.reverse,
            child: _displayLoading(),
          )
        ],
      ),
    );
  }

  RawImage _buildRawImage() {
    return RawImage(
      image: _imageInfo?.image,
      width: widget.width,
      height: widget.height,
      scale: _imageInfo?.scale ?? 1.0,
      color: widget.color,
      colorBlendMode: widget.colorBlendMode,
      fit: widget.fit,
      alignment: widget.alignment,
      repeat: widget.repeat,
      centerSlice: widget.centerSlice,
      matchTextDirection: widget.matchTextDirection,
      invertColors: _invertColors,
      filterQuality: widget.filterQuality,
    );
  }
}

/// The direction in which an animation is running.
enum AnimationDirection {
  /// The animation is running from beginning to end.
  forward,

  /// The animation is running backwards, from end to beginning.
  reverse,
}

/// Helper Widget to Fade in or out
class FadeWidget extends StatefulWidget {
  /// Child widget being faded
  final Widget? child;

  /// Fade duration
  final Duration duration;

  /// Duration direction, forward is from invisible to visible
  final AnimationDirection direction;

  /// Animation curve. See [Curves] for more options.
  final Curve curve;

  /// Fading [child] in or out depending on [direction] with a [curve] and
  /// [duration]./
  const FadeWidget(
      {this.child,
      this.duration = const Duration(milliseconds: 800),
      this.direction = AnimationDirection.forward,
      this.curve = Curves.easeOut,
      super.key});

  @override
  _FadeWidgetState createState() => _FadeWidgetState();
}

class _FadeWidgetState extends State<FadeWidget> with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;
  late bool hideWidget;

  @override
  Widget build(BuildContext context) {
    if (hideWidget) {
      return const SizedBox.shrink();
    }

    return FadeTransition(
      opacity: opacity,
      child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);
    final curved = CurvedAnimation(parent: controller, curve: widget.curve);
    var begin = widget.direction == AnimationDirection.forward ? 0.0 : 1.0;
    var end = widget.direction == AnimationDirection.forward ? 1.0 : 0.0;
    opacity = Tween<double>(begin: begin, end: end).animate(curved);
    controller.forward();

    hideWidget = false;
    if (widget.direction == AnimationDirection.reverse) {
      opacity.addStatusListener(animationStatusChange);
    }
  }

  @override
  void dispose() {
    opacity.removeStatusListener(animationStatusChange);
    controller.dispose();
    super.dispose();
  }

  void animationStatusChange(AnimationStatus status) {
    setState(() {
      hideWidget = widget.direction == AnimationDirection.reverse && status == AnimationStatus.completed;
    });
  }
}

class DownloadEntry extends ValueNotifier<DownloadState> {
  final String url;
  final int index;
  File? image;

  DownloadEntry({required this.url, required this.index}) : super(DownloadState.loading);
}

class PreCache {
  final String? url;
  final BuildContext? context;
  DownloadEntry? _entry;

  PreCache(this.context, this.url) {
    _init();
  }

  _init() {
    _entry = CachedImageManager.instance().add(url);
    _entry?.addListener(_onStateChanged);
  }

  _onStateChanged() {
    if (_entry?.value == DownloadState.complete) {
      _entry!.removeListener(_onStateChanged);
      final FileImage image = FileImage(_entry!.image!, scale: 1.0);

      image.resolve(createLocalImageConfiguration(
        context ?? Constant.context,
        size: null,
      ));
      _entry = null;
    } else if (_entry?.value == DownloadState.error) {
      _dispose();
    }
  }

  _dispose() {
    if (_entry != null) {
      _entry!.removeListener(_onStateChanged);
      _entry = null;
    }
  }
}

class CachedImageManager extends ValueNotifier<ConnectivityResult> {
  static CachedImageManager? _instance;

  static CachedImageManager instance() {
    _instance ??= CachedImageManager();
    return _instance!;
  }

  final Map<int, DownloadEntry> _data = {};
  final Map<String, List<int>> _res = {};
  late StreamSubscription<ConnectivityResult> _stream;
  int _index = 0;
  late Connectivity _conn;

  CachedImageManager() : super(ConnectivityResult.none) {
    _conn = Connectivity();
    _stream = _conn.onConnectivityChanged.listen(_onNetworkChanged);
  }

  void _onNetworkChanged(ConnectivityResult result) {
    if (value != result) {
      value = result;
    }
  }

  static PreCache preCache(BuildContext context, String? url) {
    return PreCache(context, url);
  }

  DownloadEntry add(String? url, {StackTrace? trace, double? width, double? height}) {
    url ??= '';
    _index++;
    DownloadEntry entry = DownloadEntry(
      url: url,
      index: _index,
    );
    _data[_index] = entry;
    if (!_res.containsKey(url)) {
      _res[url] = [];
    }
    _res[url]?.add(_index);
    if (_res[url]?.length == 1) {
      _download(url, trace: trace, width: width, height: height);
    }
    return entry;
  }

  final Map<String, String> _cache = {};

  _md5ByCache(String url) {
    if (_cache.containsKey(url)) {
      return _cache[url];
    } else {
      String key = _md5(url);
      _cache[url] = key;
      return key;
    }
  }

  final Map<String, int> _existsCached = {};
  final int _maxCheckDuration = 1000 * 10;

  Future<bool> _exists(File image) async {
    int now = DateTime.now().millisecondsSinceEpoch;
    String path = image.path;
    if (_existsCached.containsKey(path) && now - _existsCached[path]! < _maxCheckDuration) {
      return true;
    }
    bool ok = await image.exists();
    if (ok) {
      _existsCached[path] = now;
    }
    return ok;
  }

  evictExistsCache(String path) {
    _existsCached.remove(path);
  }

  String _getFilePathByUrl(String url) {
    String key = _md5ByCache(url);
    String path = join(Constant.temporaryDirectory.path, key);
    return path;
  }

  File getFileByUrl(String url) {
    String path = _getFilePathByUrl(url);
    return File(path);
  }

  Future<bool> existsCachedImage(String url) async {
    File image = getFileByUrl(url);
    return _exists(image);
  }

  _download(String url, {StackTrace? trace, double? width, double? height}) async {
    if (url.isEmpty || (!url.startsWith("http://") && !url.startsWith('https://'))) {
      _error(url);
      return;
    }
    String path = _getFilePathByUrl(url);
    String pathTemp = '$path.temp';
    File image = File(path);
    File temp = File(pathTemp);
    bool ok = true;
    String errorInfo = '';
    if (await _exists(image) == false) {
      for (int i = 0; i < 3; i++) {
        Dio dio = Dio();
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
          client.badCertificateCallback = (X509Certificate cr, String host, int port) {
            return true;
          };
          client.findProxy = null;
        };
        try {
          int bodySize = 0;
          dio.options.connectTimeout = const Duration(seconds: 5);
          dio.options.receiveTimeout = const Duration(seconds: 15);

          Response res = await dio.download(url, temp.path, onReceiveProgress: (int received, int total) {
            if (bodySize != total) {
              bodySize = total;
            }
          });

          if ((url.startsWith(System.imageDomain) || url.startsWith(System.imageOriginDomain)) &&
              (res.headers[Headers.contentLengthHeader] == null ||
                  res.headers[Headers.contentLengthHeader]!.isEmpty ||
                  int.tryParse(res.headers[Headers.contentLengthHeader]![0]) != bodySize)) {
            //// imageDomain路径下的图片下载必须要做文件大小校验
            ok = false;
            errorInfo = 'size not right';
          } else if ((!url.startsWith(System.imageDomain) && !url.startsWith(System.imageOriginDomain)) &&
              ((res.headers[Headers.contentLengthHeader] != null &&
                  res.headers[Headers.contentLengthHeader]!.isNotEmpty &&
                  int.tryParse(res.headers[Headers.contentLengthHeader]![0]) != bodySize))) {
            /// 兼容非imageDomain路径下的图片，header中没有contentLengthHeader的情况
            ok = false;
            errorInfo = 'no in imageDomain';
          } else {
            await temp.rename(image.path);
            break;
          }
          Log.d("download ok $url");
        } catch (e, s) {
          if (i == 0) {
            StackTraceUtil.printStackTrace(tag: 'Download image error', url: url, trace: trace);
            ImageDownloadChecker.uploadErrorNetImageUrl(url);
          }
          ok = false;
          // Log.e(e, stackTrace: s, tag: url);
          errorInfo = e.toString();
        }
      }
    }

    if (ok) {
      _success(url, image);
      ImageDownloadChecker.checkInvalidImage(url, image, width, height, trace: trace);
    } else {
      PulseLog.instance.log(ImageFailBody(ImageAction.download, url, errorInfo));
      _error(url);
    }
  }

  _success(String url, File image) {
    if (!_res.containsKey(url)) return;
    for (var index in _res[url]!) {
      if (_data.containsKey(index)) {
        _data[index]!.image = image;
        _data[index]!.value = DownloadState.complete;
      }
    }
    _remove(url);
  }

  _error(String url) {
    if (!_res.containsKey(url)) return;
    for (var index in _res[url]!) {
      if (_data.containsKey(index)) {
        _data[index]!.image = null;
        _data[index]!.value = DownloadState.error;
      }
    }
    _remove(url);
  }

  _remove(String url) {
    if (!_res.containsKey(url)) return;
    for (var index in _res[url]!) {
      _data.remove(index);
    }
    _res.remove(url);
  }

  String _md5(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes).toLowerCase();
  }

  void removeCaches(List<String> urls, {bool evictMemory = false}) {
    try {
      for (String url in urls.expand((element) => ['${System.imageOriginDomain}$element', '${System.imageDomain}$element'])) {
        // 同时移除cdn、和oss上对应的缓存
        File file = getFileByUrl(url);
        if (file.existsSync()) {
          file.deleteSync();

          if (evictMemory) {
            imageCache.evict(FileImage(file));
          }
        }
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  remove(DownloadEntry entry) {
    int index = entry.index;
    if (_data.containsKey(index)) {
      if (_res.containsKey(entry.url)) {
        _res[entry.url]?.remove(entry.index);
      }
      if (_res.isEmpty) _res.remove(entry.url);
      _data.remove(index);
      entry.dispose();
    }
  }

  Future<bool> downloadAsync(String url, {StackTrace? trace}) async {
    if (url.isEmpty || (!url.startsWith("http://") && !url.startsWith('https://'))) {
      return false;
    }
    String path = _getFilePathByUrl(url);
    String pathTemp = '$path.temp';
    File image = File(path);
    File temp = File(pathTemp);
    bool ok = true;
    String errorInfo = '';
    if (await _exists(image) == false) {
      for (int i = 0; i < 3; i++) {
        Dio dio = Dio();
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
          client.badCertificateCallback = (X509Certificate cr, String host, int port) {
            return true;
          };
          client.findProxy = null;
        };
        try {
          int bodySize = 0;
          dio.options.connectTimeout = const Duration(seconds: 5);
          dio.options.receiveTimeout = const Duration(seconds: 15);
          Response res = await dio.download(url, temp.path, onReceiveProgress: (int received, int total) {
            if (bodySize != total) {
              bodySize = total;
            }
          });

          if ((url.startsWith(System.imageDomain) || url.startsWith(System.imageOriginDomain)) &&
              (res.headers[Headers.contentLengthHeader] == null ||
                  res.headers[Headers.contentLengthHeader]!.isEmpty ||
                  int.tryParse(res.headers[Headers.contentLengthHeader]![0]) != bodySize)) {
            //// imageDomain路径下的图片下载必须要做文件大小校验
            ok = false;
            errorInfo = 'size not right';
          } else if ((!url.startsWith(System.imageDomain) && !url.startsWith(System.imageOriginDomain)) &&
              ((res.headers[Headers.contentLengthHeader] != null &&
                  res.headers[Headers.contentLengthHeader]!.isNotEmpty &&
                  int.tryParse(res.headers[Headers.contentLengthHeader]![0]) != bodySize))) {
            /// 兼容非imageDomain路径下的图片，header中没有contentLengthHeader的情况
            ok = false;
            errorInfo = 'no in imageDomain';
          } else {
            await temp.rename(image.path);
            break;
          }
        } catch (e) {
          if (i == 0) {
            StackTraceUtil.printStackTrace(tag: 'Download image error', url: url, trace: trace);
            ImageDownloadChecker.uploadErrorNetImageUrl(url);
          }
          ok = false;
          Log.d("dio.download error, url: $url, count: $i");
          errorInfo = e.toString();
        }
      }
    }

    if (!ok) {
      PulseLog.instance.log(ImageFailBody(ImageAction.download, url, errorInfo));
    }

    return ok;
  }
}
