import 'package:flutter/material.dart';

class FadeAnimationWidget extends StatefulWidget {
  final Widget? child;
  final int fadeDuration;

  const FadeAnimationWidget({super.key, this.child, this.fadeDuration = 300});

  @override
  _FadeAnimationWidgetState createState() => _FadeAnimationWidgetState();
}

class _FadeAnimationWidgetState extends State<FadeAnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _fadeController;
  Animation<double>? _fadeAnimation;

  @override
  void initState() {
    super.initState();

    if (widget.child == null) return;

    _fadeController = AnimationController(
        duration: Duration(milliseconds: widget.fadeDuration), vsync: this)
      ..addListener(() {
        setState(() {});
      });
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _fadeController!, curve: Curves.ease));

    _fadeController!.forward();
  }

  @override
  void dispose() {
    _fadeController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child == null) return const SizedBox.shrink();

    return FadeTransition(
      opacity: _fadeAnimation!,
      child: widget.child,
    );
  }
}
