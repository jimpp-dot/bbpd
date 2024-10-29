import 'package:shared/shared.dart';
import 'package:shared/widget/imageStretch/rawImageStretch.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageStretch extends StatefulWidget {
  const CachedNetworkImageStretch({
    super.key,
    this.placeholder,
    this.imageUrl,
    this.errorWidget,
    this.fadeOutDuration = const Duration(milliseconds: 300),
    this.fadeOutCurve = Curves.easeOut,
    this.fadeInDuration = const Duration(milliseconds: 700),
    this.fadeInCurve = Curves.easeIn,
    this.scale = 1.0,
    this.width,
    this.height,
    this.fit,
    required this.centerSlice,
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
  });

  static previewLoad() {}

  final Widget? placeholder;
  final String? imageUrl;
  final Widget? errorWidget;

  //todo...
  final Duration fadeOutDuration;
  final Curve fadeOutCurve;
  final Duration fadeInDuration;
  final Curve fadeInCurve;

  final double scale;
  final FilterQuality filterQuality;
  final Rect centerSlice;
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

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CachedNetworkImageStretch>
    with WidgetsBindingObserver {
  DownloadEntry? _entry;
  late ImageProvider _image;
  bool _invertColors = false;
  ImageStream? _imageStream;
  late ImageStreamListener _imageStreamListener;
  ImageInfo? _imageInfo;
  DownloadState _state = DownloadState.loading;

  @override
  initState() {
    super.initState();
    _init();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  dispose() async {
    if (_entry != null) {
      _entry!.removeListener(_onStateChanged);
      CachedImageManager.instance().remove(_entry!);
      _entry = null;
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
  void didUpdateWidget(CachedNetworkImageStretch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageUrl != oldWidget.imageUrl ||
        widget.scale != oldWidget.scale) {
      _init();
    }
  }

  @override
  void didChangeDependencies() {
    _invertColors = MediaQuery.of(context).invertColors;
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    _init(); // in case the image cache was flushed
    super.reassemble();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_entry?.value == DownloadState.error &&
        state == AppLifecycleState.resumed) {
      _init();
    }
  }

  _init() {
    if (_entry != null) {
      _entry!.removeListener(_onStateChanged);
      CachedImageManager.instance().remove(_entry!);
    }
    _entry = CachedImageManager.instance().add(widget.imageUrl);
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
      } else if (_entry?.value == DownloadState.loading &&
          _state != DownloadState.display &&
          widget.playback == false) {
        setState(() {
          _state = _entry!.value;
        });
      }
    }
  }

  void _resolveImage() {
//		final ImageSize imgSize = ImageSizGetter.getSize(_entry.image);
    bool inited = false;
//		if (widget.width != null && widget.height != null && imgSize != ImageSize.zero) {
//			final double widgetWidth = widget.width * Util.devicePixelRatio;
//			final double widgetHeight = widget.height * Util.devicePixelRatio;
//			if (widgetWidth < imgSize.width && widgetHeight < imgSize.height) {
//				_image = ResizeImage(
//					FileImage(_entry.image,
//						scale: widget.scale
//					),
//					width: widgetWidth.toInt(),
//					height: widgetHeight.toInt(),
//				);
//				inited = true;
//			}
//		}
    if (widget.cachedWidth != null || widget.cachedHeight != null) {
      _image = ResizeImage(
        FileImage(_entry!.image!, scale: widget.scale),
        width: widget.cachedWidth,
        height: widget.cachedHeight,
      );
      inited = true;
    }
    if (!inited) {
      _image = FileImage(_entry!.image!, scale: widget.scale);
    }

    Size? size = widget.width != null && widget.height != null
        ? Size(widget.width!, widget.height!)
        : null;

    final ImageStream newStream = _image.resolve(createLocalImageConfiguration(
      context,
      size: size,
    ));
    _updateSourceStream(newStream);
  }

  void _updateSourceStream(ImageStream? newStream) {
    if (_imageStream?.key == newStream?.key) return;
    if (_imageStream != null)
      _imageStream!.removeListener(_imageStreamListener);
    _imageStream = newStream;

    _imageStreamListener = ImageStreamListener(_handleImageChanged);
    _imageStream?.addListener(_imageStreamListener);
  }

  void _handleImageChanged(ImageInfo imageInfo, bool synchronousCall) {
    if (!mounted) return;
    setState(() {
      _imageInfo = imageInfo;
      _state = DownloadState.display;
    });
  }

  _addListenerNetwork() {
    CachedImageManager.instance().removeListener(_onNetworkChanged);
    CachedImageManager.instance().addListener(_onNetworkChanged);
  }

  _onNetworkChanged() {
    if (CachedImageManager.instance().value != ConnectivityResult.none &&
        _entry?.value == DownloadState.error &&
        mounted) {
      _init();
    }
  }

  _displayLoading() {
    if (widget.placeholder != null) {
      return widget.placeholder!;
    } else {
      return _displayEmpty();
    }
  }

  _displayError() {
    if (widget.errorWidget != null) {
      return widget.errorWidget!;
    } else {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: Container(
          color: R.color.secondBgColor,
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
    return RawImageStretch(
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
