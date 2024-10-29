import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class CirclePositionWidget extends StatelessWidget {
  final String positionText;
  final Gradient? gradient;

  const CirclePositionWidget(
      {super.key, required this.positionText, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        gradient: gradient ??
            const LinearGradient(
                colors: [Color(0xFFFFE95B), Color(0xFFFFCE2E)]),
        shape: const CircleBorder(
          side: BorderSide(color: Color(0xFF4B4B4B), width: 1.0),
        ),
      ),
      child: Text(
        positionText,
        style: R.textStyle.caption.copyWith(
            fontSize: 10,
            color: const Color(0xFF4B4B4B),
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
