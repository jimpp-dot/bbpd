import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class SkillTag extends StatelessWidget {
  final String label;

  const SkillTag({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 20,
        constraints: const BoxConstraints(
          minWidth: 40,
        ),
        padding: const EdgeInsetsDirectional.only(
          start: 6,
          end: 6,
        ),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: R.color.mainBrandColor.withOpacity(0.08),
        ),
        child: Text(
          label,
          maxLines: 1,
          style: TextStyle(
            color: R.color.mainBrandColor,
            fontSize: 11,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
