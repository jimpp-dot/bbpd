import 'dart:ui' as ui;
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

// 逐步把Class R转化为空安全, 放到这里
extension Rext on R {
  /// 自适应主题的图片，原则上暗黑主题图片加_dark固定后缀
  static Widget autoStyleImg(
    String path, {
    Key? key,
    bool? dark,
    String? package,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    bool wholePath = false,
    int? cachedWidth,
    int? cachedHeight,
    bool matchTextDirection = false,
  }) {
    bool darkStyle = dark ?? darkMode;
    String pathExt = p.extension(path);
    String imgPath = darkStyle ? p.setExtension(path, '_dark$pathExt') : path;

    return R.img(
      key: key,
      imgPath,
      package: package,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      wholePath: wholePath,
      cachedWidth: cachedWidth,
      cachedHeight: cachedHeight,
      matchTextDirection: matchTextDirection,
    );
  }

  static AssetImage brandBgImage({bool? dark}) {
    return const AssetImage(BaseAssets.shared$ic_home_top_bg_webp);
  }

  static Container brandBgImageContainer(
      {double? width,
      double? height,
      bool? dark,
      BoxDecoration? decoration,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      AlignmentGeometry? alignment,
      BoxConstraints? constraints,
      Widget? child}) {
    return Container(
      width: width ?? Util.width,
      height: height ?? Util.height,
      alignment: alignment,
      padding: padding,
      margin: margin,
      constraints: constraints,
      decoration: decoration == null
          ? BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: brandBgImage(dark: dark),
                fit: BoxFit.fitWidth,
              ),
            )
          : decoration.copyWith(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: brandBgImage(dark: dark),
                fit: BoxFit.fitWidth,
              ),
            ),
      child: child,
    );
  }

  /// 顶部背景
  static Container themeTopBgContainer(
      {double? width,
      double? height,
      double? cornerRadius,
      Color? bgColor,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      AlignmentGeometry? alignment,
      Decoration? foregroundDecoration,
      Widget? child}) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      alignment: alignment,
      foregroundDecoration: foregroundDecoration,
      child: Stack(
        fit: width != null ? StackFit.expand : StackFit.loose,
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(width: width, height: height),
          // 最底层渐变高斯模糊背景
          Positioned.fill(
            child: ClipRRect(
              borderRadius:
                  BorderRadius.all(Radius.circular(cornerRadius ?? 0)),
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(width: width, height: height, color: bgColor),
              ),
            ),
          ),
          Padding(padding: padding ?? const EdgeInsets.only(), child: child),
        ],
      ),
    );
  }

  /// 主题卡片容器
  /// 亮色主题：高斯模糊渐变背景+内渐变边框+中渐变边框+外边框+阴影
  /// 暗色主题：外边框+阴影
  static Container themeCardContainer(
      {double? width,
      double? height,
      double? cornerRadius,
      bool? dark,
      List<Color>? darkBgColors,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      AlignmentGeometry? alignment,
      Widget? child}) {
    bool darkStyle = dark ?? darkMode;
    return Container(
        width: width,
        height: height,
        alignment: alignment,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerRadius ?? 0),
          gradient: darkStyle
              ? LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: darkBgColors ??
                      [const Color(0xFF27252D), const Color(0xFF27252D)],
                )
              : null,
          boxShadow: darkStyle
              ? null
              : const [
                  BoxShadow(
                    color: Color(0xFF27252D),
                    offset: Offset(0, 2),
                    blurRadius: 6,
                    spreadRadius: 0,
                  )
                ],
        ),
        child: darkStyle
            ? Padding(
                padding: padding ?? const EdgeInsets.only(),
                child: child,
              )
            : Stack(
                fit: height != null ? StackFit.expand : StackFit.loose,
                children: [
                  // 最底层渐变高斯模糊背景
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(cornerRadius ?? 0)),
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(
                          sigmaX: 2,
                          sigmaY: 2,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0x9CFAFAFF), Color(0xFFE7E7FF)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 最外层深色边框
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF000000).withOpacity(0.08),
                            width: 1),
                        borderRadius: cornerRadius != null
                            ? BorderRadius.circular(cornerRadius)
                            : null,
                      ),
                    ),
                  ),
                  // 倒数第二层渐变白色边框
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(0.5),
                      child: GradientBorder(
                        borderGradient: LinearGradient(
                            colors: [
                              const Color(0xFFFFFFFF).withOpacity(0.2),
                              const Color(0x00FFFFFF)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderWidth: 2,
                        borderRadius:
                            cornerRadius != null ? cornerRadius - 0.5 : 0,
                      ),
                    ),
                  ),
                  // 最内层浅白色边框
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(1.5),
                      child: GradientBorder(
                        borderGradient: LinearGradient(
                            colors: [
                              const Color(0xFFFFFFFF).withOpacity(0.4),
                              const Color(0xFFFFFFFF).withOpacity(0.2)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderWidth: 1.5,
                        borderRadius:
                            cornerRadius != null ? cornerRadius - 1.5 : 0,
                      ),
                    ),
                  ),
                  if (child != null)
                    Container(
                      alignment: alignment,
                      padding: padding ?? const EdgeInsets.only(),
                      child: child,
                    )
                ],
              ));
  }
}

extension TextStyleThemeExt on TextStyle {
  TextStyle withGradient(List<Color> colors, {Offset? start, Offset? end}) {
    return copyWith(
        color: null,
        foreground: Paint()
          ..shader = ui.Gradient.linear(start ?? const Offset(0, 0),
              end ?? const Offset(100, 0), colors));
  }
}

extension BoxDecorationThemeExt on BoxDecoration {
  BoxDecoration withStyle({BoxDecoration? light, BoxDecoration? dark}) {
    return darkMode
        ? copyWith(
            color: dark?.color ?? color,
            image: dark?.image ?? image,
            border: dark?.border ?? border,
            borderRadius: dark?.borderRadius ?? borderRadius,
            boxShadow: dark?.boxShadow ?? boxShadow,
            gradient: dark?.gradient ?? gradient,
            backgroundBlendMode:
                dark?.backgroundBlendMode ?? backgroundBlendMode,
            shape: dark?.shape ?? shape,
          )
        : copyWith(
            color: light?.color ?? color,
            image: light?.image ?? image,
            border: light?.border ?? border,
            borderRadius: light?.borderRadius ?? borderRadius,
            boxShadow: light?.boxShadow ?? boxShadow,
            gradient: light?.gradient ?? gradient,
            backgroundBlendMode:
                light?.backgroundBlendMode ?? backgroundBlendMode,
            shape: light?.shape ?? shape,
          );
  }
}
