import 'package:flutter/material.dart';

class ElasticScaleAnim extends StatefulWidget {
  final Widget? child;

  const ElasticScaleAnim({super.key, this.child});

  @override
  _ElasticScaleAnimState createState() => _ElasticScaleAnimState();
}

class _ElasticScaleAnimState extends State<ElasticScaleAnim>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late AnimationController fadeController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    fadeController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    fadeAnimation = CurvedAnimation(parent: controller, curve: Curves.linear);

    controller.addListener(() {
      setState(() {});
    });
    fadeController.addListener(() {
      setState(() {});
    });

    controller.forward();
    fadeController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    fadeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: widget.child,
      ),
    );
  }
}
