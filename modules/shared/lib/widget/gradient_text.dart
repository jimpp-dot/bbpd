import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(this.data,
      {super.key,
      required this.gradient,
      this.style,
      this.maxLines,
      this.textAlign = TextAlign.start});

  final String? data;
  final Gradient gradient;
  final TextStyle? style;
  final TextAlign textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(Offset.zero & bounds.size,
            textDirection: Directionality.of(context));
      },
      child: Text(
        data ?? '',
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: (style == null)
            ? const TextStyle(color: Colors.white)
            : style!.copyWith(color: Colors.white),
      ),
    );
  }
}
