import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// Webview活动半屏显示
class WebviewActivityHalfScreen extends StatefulWidget {
  final String url;
  final double? ratio; // 显示高度
  final Color? bgColor; // 背景颜色

  const WebviewActivityHalfScreen(this.url,
      {super.key, this.ratio, this.bgColor});

  static Future show(BuildContext context, String url,
      {double? ratio, Color? bgColor}) async {
    if (url.isEmpty) return;
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        enableDrag: false,
        routeSettings:
            RouteSettings(name: '/basewebview', arguments: {'url': url}),
        builder: (context) =>
            WebviewActivityHalfScreen(url, ratio: ratio, bgColor: bgColor));
  }

  @override
  State<WebviewActivityHalfScreen> createState() =>
      _WebviewActivityHalfScreenState();
}

class _WebviewActivityHalfScreenState extends State<WebviewActivityHalfScreen> {
  bool _loading = true;

  double get _pxHeight {
    if (widget.ratio == null || widget.ratio == 0) {
      return window.physicalSize.height * 0.75;
    }
    double height = window.physicalSize.width / widget.ratio!;
    return height > window.physicalSize.height
        ? window.physicalSize.height
        : height;
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    if (widget.bgColor != null) {
      bgColor = widget.bgColor!;
    } else {
      bgColor = _loading ? Colors.black.withOpacity(0.9) : Colors.transparent;
    }
    double height = _pxHeight / window.devicePixelRatio;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: Util.width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          BaseWebviewScreen(
            url: widget.url,
            embeddedWidget: true,
            transparent: true,
            onPageFinished: () {
              _loading = false;
              refresh();
            },
          ),
          if (_loading)
            const Center(
              child: Loading(label: ''),
            ),
        ],
      ),
    );
  }
}
