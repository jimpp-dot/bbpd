import 'package:flutter/material.dart';

class ImagesAnimator extends StatefulWidget {
  final List<Image> imageCaches;
  final bool Function() isAnimating;

  final Image? staticImage;
  final Duration? duration;
  final double? width;
  final double? height;
  final Color? backColor;

  double get theWidth {
    return width != null ? width! : imageCaches[0].width!;
  }

  double get theHeight {
    return height != null ? height! : imageCaches[0].height!;
  }

  Duration get theDuration {
    return duration != null ? duration! : const Duration(milliseconds: 500);
  }

  const ImagesAnimator(this.imageCaches, this.isAnimating,
      {this.staticImage,
      this.duration,
      this.width,
      this.height,
      this.backColor,
      Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ImagesAnimatorState();
  }
}

class _ImagesAnimatorState extends State<ImagesAnimator> {
  bool _disposed = false;
  bool _isAnimating = false;
  int _imageIndex = 0;
  Container? _container;

  void _updateImage(bool repeat) {
    _isAnimating = false;

    if (_disposed || widget.imageCaches.isEmpty) {
      return;
    }

    if (!widget.isAnimating()) {
      setState(() {
        _imageIndex = 0;
        _container = Container(
            color: widget.backColor ?? Colors.transparent,
            height: widget.theHeight,
            width: widget.theWidth,
            child: widget.staticImage ?? widget.imageCaches[0]);
      });
      return;
    }

    _isAnimating = true;

    setState(() {
      if (_imageIndex >= widget.imageCaches.length) {
        _imageIndex = 0;
      }
      _container = Container(
          color: widget.backColor ?? Colors.transparent,
          height: widget.theHeight,
          width: widget.theWidth,
          child: widget.imageCaches[_imageIndex]);
      _imageIndex++;
    });

    if (repeat) {
      Future.delayed(widget.theDuration, () {
        _updateImage(true);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
    widget.imageCaches.clear();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isAnimating()) {
      if (!_isAnimating) {
        _updateImage(true);
      }
    } else {
      _updateImage(false);
    }

    return _container!;
  }
}
