import 'package:flutter/material.dart';

class ColorfulTextWidget extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final Widget? child;
  final Gradient gradient;

  const ColorfulTextWidget({
    super.key,
    required this.gradient,
    this.text,
    this.child,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    assert(child != null || text != null);
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child ??
          Text(
            text!,
            style: style?.copyWith(color: Colors.white) ??
                const TextStyle(color: Colors.white),
          ),
    );
  }
}
