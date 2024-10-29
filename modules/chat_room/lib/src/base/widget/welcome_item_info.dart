import 'dart:io';

import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 进房间用户信息
// ignore: must_be_immutable
class WelcomeItemInfo extends StatelessWidget {
  final Welcome welcome;
  final String? effectLocalPath;
  late double ratio;

  WelcomeItemInfo({super.key, required this.welcome, this.effectLocalPath});

  @override
  Widget build(BuildContext context) {
    ratio = Util.ratio;
    if (effectLocalPath != null && effectLocalPath!.isNotEmpty && Session.lowDeviceSpecialEffect != 1) {
      return _renderEffect();
    }
    return _renderCommon(context);
  }

  /// 普通样式
  Widget _renderCommon(BuildContext context) {
    _ColorConfig colorConfig = _ColorConfig.get(welcome.iconGray == true ? 0 : welcome.vip);
    Color fontColor = Colors.white; // 字体颜色
    Color fontShadeColor = Colors.black.withOpacity(0.2); // 字体投影颜色

    List<Widget> res = [];

    // 显示爵位
    res.add(NobilityCornerMarker(titleNew: welcome.titleNew, height: 24 * ratio));

    // VIP、萌新、人气等级只显示一个，优先级：VIP > 新贵 > 萌新 > 人气等级
    if (welcome.vip > 0) {
      res.add(UserVipWidget(vip: welcome.vip, isGrey: welcome.iconGray, height: 24 * ratio));
    } else if (welcome.isNewNoble) {
      //新贵
      res.add(NewNobleWidget(height: 24 * ratio));
    } else if (welcome.isNewer) {
      // 萌新
      res.add(NewerWidget(height: 24 * ratio));
    } else if (welcome.popularityLevel > 0) {
      // 人气等级
      res.add(UserPopularity(popularityLevel: welcome.popularityLevel, height: 24 * ratio));
    }

    res.add(SizedBox(width: 2 * ratio));

    res.add(Flexible(
      child: Text(
        welcome.name ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: fontColor,
            fontSize: 13 * ratio,
            fontWeight: FontWeight.w500,
            shadows: fontShadeColor != null ? [Shadow(color: fontShadeColor, offset: const Offset(0, 0.5), blurRadius: 0.5)] : null),
      ),
    ));

    res.add(SizedBox(width: 12 * ratio));

    res.add(Text(
      K.room_coming,
      style: TextStyle(
          color: fontColor,
          fontSize: 13 * ratio,
          fontWeight: FontWeight.w500,
          shadows: fontShadeColor != null ? [Shadow(color: fontShadeColor, offset: const Offset(0, 0.5), blurRadius: 0.5)] : null),
    ));

    return Stack(
      clipBehavior: Clip.none,
      children: [
        _Background(
          radius: 15 * ratio,
          bgColor: colorConfig.bgColor,
          bgGradient: colorConfig.bgGradient,
          textDirection: Directionality.of(context),
          child: Container(
            height: 30 * ratio,
            constraints: BoxConstraints(maxWidth: 228 * ratio),
            padding: EdgeInsetsDirectional.only(start: 8 * ratio, end: 12 * ratio),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: res,
            ),
          ),
        ),
        PositionedDirectional(
          start: -8 * ratio,
          top: -7 * ratio,
          child: _renderRank(),
        )
      ],
    );
  }

  /// 有入场动效的样式
  Widget _renderEffect() {
    Color fontColor = Colors.white; // 字体颜色
    Color fontShadeColor = Colors.black.withOpacity(0.2); // 字体投影颜色
    // 优先使用入场动效的
    if (welcome.effect?.fontColor != null) {
      fontColor = welcome.effect!.fontColor!;
    }

    List<Widget> res = [];

    // 显示爵位
    res.add(NobilityCornerMarker(titleNew: welcome.titleNew, height: 24 * ratio));

    // VIP、新贵、萌新、人气等级只显示一个，优先级：VIP > 新贵 > 萌新 > 人气等级
    if (welcome.vip > 0) {
      res.add(UserVipWidget(vip: welcome.vip, isGrey: welcome.iconGray, height: 24 * ratio));
    } else if (welcome.isNewNoble) {
      //新贵
      res.add(NewNobleWidget(height: 24 * ratio));
    } else if (welcome.isNewer) {
      // 萌新
      res.add(NewerWidget(height: 24 * ratio));
    } else if (welcome.popularityLevel > 0) {
      // 人气等级
      res.add(UserPopularity(popularityLevel: welcome.popularityLevel, height: 24 * ratio));
    }

    res.add(SizedBox(width: 1 * ratio));

    res.add(Flexible(
      child: Text(
        welcome.name ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: fontColor,
            fontSize: 13 * ratio,
            fontWeight: FontWeight.w500,
            shadows: fontShadeColor != null ? [Shadow(color: fontShadeColor, offset: const Offset(0, 0.5), blurRadius: 0.5)] : null),
      ),
    ));

    res.add(SizedBox(width: 2 * ratio));

    res.add(Text(
      K.room_coming,
      style: TextStyle(
          color: fontColor,
          fontSize: 13 * ratio,
          fontWeight: FontWeight.w500,
          shadows: fontShadeColor != null ? [Shadow(color: fontShadeColor, offset: const Offset(0, 0.5), blurRadius: 0.5)] : null),
    ));

    // 有入场动效
    // 需要先清除内存缓存，不然动图无法播放
    imageCache.evict(FileImage(File(effectLocalPath!)));
    return SizedBox(
      width: 220 * ratio,
      height: 44 * ratio,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.file(File(effectLocalPath!), height: 44 * ratio, fit: BoxFit.fitHeight),
          Container(
            height: 30 * ratio,
            width: 172 * ratio,
            margin: EdgeInsetsDirectional.only(start: 34 * ratio, top: 7 * ratio),
            padding: EdgeInsetsDirectional.only(start: 2 * ratio, end: 1 * ratio),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: res,
            ),
          ),
          PositionedDirectional(
            start: -5 * ratio,
            top: -7 * ratio,
            child: _renderRank(),
          ),
          if (welcome.liveLabel != null && welcome.liveLabel!.isNotEmpty)
            UserLiveLabelWidget(
              welcome.liveLabel,
              UserLiveLabelType.effect,
              bgHeight: 44 * ratio,
            ),
        ],
      ),
    );
  }

  /// 榜单icon
  _renderRank() {
    String? imgSource;
    if (welcome.topWeek > 0 && welcome.topWeek <= 3) {
      imgSource = 'welcome_rank_week_${welcome.topWeek}.png';
    } else if (welcome.topMonth > 0 && welcome.topMonth <= 3) {
      imgSource = 'welcome_rank_month_${welcome.topMonth}.png';
    } else if (welcome.top > 0 && welcome.top <= 3) {
      imgSource = 'welcome_rank_total_${welcome.top}.png';
    }
    return imgSource != null
        ? R.img('welcome/$imgSource', package: ComponentManager.MANAGER_BASE_ROOM, width: 27 * ratio, height: 37 * ratio)
        : const SizedBox.shrink();
  }
}

class _Background extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final TextDirection textDirection;

  _Background({
    required double radius,
    required Color bgColor,
    required Gradient bgGradient,
    required Widget child,
    required this.textDirection,
  })  : _painter = _GradientPainter(radius: radius, bgColor: bgColor, bgGradient: bgGradient, textDirection: textDirection),
        _child = child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: _child,
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint(); // border
  final Paint _paint1 = Paint(); // 第一层背景
  final Paint _paint2 = Paint(); // 第二层背景
  final double radius;
  final Color bgColor; // 最底层背景
  final Gradient bgGradient; // 第二层背景
  final TextDirection textDirection;
  final double borderWidth = 1;
  final Gradient borderGradient = LinearGradient(colors: [Colors.white.withOpacity(0.9), Colors.white.withOpacity(0)]); // 边框渐变

  _GradientPainter({required this.radius, required this.bgColor, required this.bgGradient, required this.textDirection}) {
    _paint1.color = bgColor;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect = RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    canvas.save();
    canvas.drawRRect(outerRRect, _paint1);
    canvas.restore();

    canvas.save();
    _paint2.shader = bgGradient.createShader(outerRect, textDirection: textDirection);
    canvas.drawRRect(outerRRect, _paint2);
    canvas.restore();

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(borderWidth, borderWidth, size.width - borderWidth * 2, size.height - borderWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(innerRect, Radius.circular(radius - borderWidth));

    // apply gradient shader
    _paint.shader = borderGradient.createShader(outerRect, textDirection: textDirection);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.save();
    canvas.drawPath(path, _paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

/// 入场横幅背景配置
class _ColorConfig {
  final Color bgColor;
  final Gradient bgGradient;

  const _ColorConfig({required this.bgColor, required this.bgGradient});

  /// 根据VIP等级获取颜色配置
  static _ColorConfig get(int vip) {
    Color bgColor = const Color(0x33292929);
    List<Color> bgGradient = [const Color(0xE6767676), const Color(0x335B5B5B)];

    if (vip >= 61) {
      bgColor = const Color(0x33432311);
      bgGradient = [const Color(0xe6ef9924), const Color(0x33ffe000)];
    } else if (vip >= 41) {
      bgColor = const Color(0x334f220a);
      bgGradient = [const Color(0xe6FF6F1F), const Color(0x33ee9824)];
    } else if (vip >= 31) {
      bgColor = const Color(0x334f220a);
      bgGradient = [const Color(0xe6e55aa2), const Color(0x33fe6f1f)];
    } else if (vip >= 21) {
      bgColor = const Color(0x33500D56);
      bgGradient = [const Color(0xE6A850DA), const Color(0x33e55aa2)];
    } else if (vip >= 16) {
      bgColor = const Color(0x33280B46);
      bgGradient = [const Color(0xE66A51E9), const Color(0x33A851DA)];
    } else if (vip >= 11) {
      bgColor = const Color(0x33181d69);
      bgGradient = [const Color(0xE64176ea), const Color(0x336a51e9)];
    } else if (vip >= 6) {
      bgColor = const Color(0x33072830);
      bgGradient = [const Color(0xE62DBCDF), const Color(0x334177ea)];
    } else if (vip >= 1) {
      bgColor = const Color(0x33072830);
      bgGradient = [const Color(0xE634B9A5), const Color(0x332DBCDE)];
    }
    return _ColorConfig(bgColor: bgColor, bgGradient: LinearGradient(colors: bgGradient));
  }
}
