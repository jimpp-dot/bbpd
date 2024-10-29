import 'package:flutter/material.dart';

/// 针对 Image 的扩展
extension ImageExt on Image {
  Image sizeExt(double width, double height) {
    return copyWith(width: width, height: height);
  }

  Image widthExt(double width) {
    return copyWith(width: width);
  }

  Image heightExt(double height) {
    return copyWith(height: height);
  }

  Image colorExt(Color color) {
    return copyWith(color: color);
  }

  Image colorBlendModeExt(BlendMode colorBlendMode) {
    return copyWith(colorBlendMode: colorBlendMode);
  }

  Image fitExt(BoxFit fit) {
    return copyWith(fit: fit);
  }

  Image alignmentExt(Alignment alignment) {
    return copyWith(alignment: alignment);
  }

  Image repeatExt(ImageRepeat repeat) {
    return copyWith(repeat: repeat);
  }

  Image centerSliceExt(Rect centerSlice) {
    return copyWith(centerSlice: centerSlice);
  }

  Image matchTextDirectionExt(bool matchTextDirection) {
    return copyWith(matchTextDirection: matchTextDirection);
  }

  Image filterQualityExt(FilterQuality filterQuality) {
    return copyWith(filterQuality: filterQuality);
  }

  Image copyWith({
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    Alignment? alignment,
    ImageRepeat? repeat,
    Rect? centerSlice,
    bool? matchTextDirection,
    FilterQuality? filterQuality,
  }) {
    return Image(
      key: key,
      image: image,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
      colorBlendMode: colorBlendMode ?? this.colorBlendMode,
      fit: fit ?? this.fit,
      alignment: alignment ?? this.alignment,
      repeat: repeat ?? this.repeat,
      centerSlice: centerSlice ?? this.centerSlice,
      matchTextDirection: matchTextDirection ?? this.matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality ?? this.filterQuality,
    );
  }
}
