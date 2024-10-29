import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'colorful_container.dart';

/// [show] 是否显示炫彩昵称
/// [key] 字体渐变色
/// [paint] 字体颜色， [show] 值为true时，[paint]才会有值
typedef ColorfulTextBuild = Widget Function(bool show, {Key? key, Paint paint});

///
/// 炫彩昵称 VIP/人气等级大于等于35以上且VIP/人气没有变灰显示炫彩昵称，显示三种样式：
///
/// * VIP/人气达到35级
/// * VIP/人气达到41级
/// * VIP/人气达到61级
///
class ColorfulNickName extends StatelessWidget {
  final ColorfulTextBuild textBuild; // 不符合显示炫彩昵称VIP/人气等级时显示
  final int level; // VIP/人气等级
  final bool isPrettyId; // 是否是靓号ID，如果是靓号ID，则扫光3次，暂停6s，再进行扫光，循环往复
  final List<Color>? colors; // 彩色昵称

  const ColorfulNickName(
      {super.key,
      required this.textBuild,
      this.level = 0,
      this.isPrettyId = false,
      this.colors});

  @override
  Widget build(BuildContext context) {
    if (colors != null && colors!.isNotEmpty) {
      // 彩色昵称
      return _renderSimpleColorfulName(context, colors!);
    }
    if (isPrettyId) {
      // 靓号ID
      return renderPrettyUid(context);
    }

    if (level > 60) {
      return renderLevel3(context);
    }

    if (level > 40) {
      return renderLevel2(context);
    }

    if (level > 34) {
      return renderLevel1(context);
    }

    return textBuild(false);
  }

  /// 靓号ID
  Widget renderPrettyUid(BuildContext context) {
    // 字体没有渐变可以使用RepaintBoundary
    return RepaintBoundary(
      child: ColorfulContainer(
        childBuild: (key, offset, size) => _renderChild(
          context: context,
          offset: offset,
          size: size,
          colors: [
            const Color(0xFFA3FF00),
            const Color(0xFFA3FF00),
          ],
          key: key,
        ),
        shimmerGradient: const LinearGradient(
          colors: [
            Color(0xFFFFFB2D),
            Color(0xFFFFFB2D),
            Color(0xFFFFFB2D),
            Color(0xFFFFFB2D),
            Color(0xFFFFFB2D),
          ],
        ),
        shimmerTiltAngel: 40,
        isPrettyId: isPrettyId,
        loop: 3,
      ),
    );
  }

  /// VIP/人气 35~41级
  Widget renderLevel1(BuildContext context) {
    // 字体没有渐变可以使用RepaintBoundary
    return RepaintBoundary(
      child: ColorfulContainer(
        childBuild: (key, offset, size) => _renderChild(
          context: context,
          offset: offset,
          size: size,
          colors: [
            const Color(0xFFFF955A),
            const Color(0xFFFF955A),
          ],
          key: key,
        ),
        shimmerGradient: const LinearGradient(
          colors: [
            Color(0x00FEDB6F),
            Color(0xFFFEDB6F),
            Colors.white,
            Color(0xFFFEDB6F),
            Color(0x00FEDB6F),
          ],
        ),
        shimmerTiltAngel: 40,
        isPrettyId: isPrettyId,
      ),
    );
  }

  /// VIP/人气 41~61级
  Widget renderLevel2(BuildContext context) {
    return ColorfulContainer(
      childBuild: (key, offset, size) => _renderChild(
        context: context,
        offset: offset,
        size: size,
        colors: [
          const Color(0xFFFFE735),
          const Color(0xFFFBAC3D),
        ],
        key: key,
      ),
      shimmerGradient: const LinearGradient(
        colors: [
          Color(0x00FFFD90),
          Color(0xffFFFD90),
          Colors.white,
          Color(0xffFFFD90),
          Color(0x00FFFD90),
        ],
      ),
      shimmerTiltAngel: 40,
      isPrettyId: isPrettyId,
    );
  }

  /// VIP/人气 61级及以上
  Widget renderLevel3(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        PositionedDirectional(
          start: -10,
          end: -10,
          top: -4,
          bottom: -8,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return R.img(
                BaseAssets.shared$bg_colorful_name_level_3_png,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                fit: BoxFit.fill,
              );
            },
          ),
        ),
        ColorfulContainer(
          childBuild: (key, offset, size) => _renderChild(
            context: context,
            offset: offset,
            size: size,
            colors: [
              const Color(0xFFFFE735),
              const Color(0xFFFF6C35),
              const Color(0xFFDD35FF),
            ],
            key: key,
          ),
          shimmerGradient: const LinearGradient(
            colors: [
              Color(0x00FFFD90),
              Color(0xffFFFD90),
              Colors.white,
              Color(0xffFFFD90),
              Color(0x00FFFD90),
            ],
          ),
          shimmerTiltAngel: 40,
          isPrettyId: isPrettyId,
        ),
      ],
    );
  }

  Widget _renderSimpleColorfulName(BuildContext context, List<Color> colors) {
    return ColorfulContainer(
      childBuild: (key, offset, size) {
        return _renderChild(
          context: context,
          offset: offset,
          size: size,
          colors: colors,
          key: key,
        );
      },
    );
  }

  Widget _renderChild({
    required BuildContext context,
    required Offset offset,
    required Size size,
    required List<Color> colors,
    bool show = true,
    Key? key,
  }) {
    if (offset.dx.isNaN) {
      offset = Offset.zero;
    }
    Shader shader = LinearGradient(
      colors: colors,
    ).createShader(Offset(offset.dx, 0) & size,
        textDirection: Directionality.of(context));
    return textBuild(show, key: key, paint: Paint()..shader = shader);
  }
}
