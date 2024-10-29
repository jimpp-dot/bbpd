import 'package:flutter/material.dart';
import '../shared.dart';
import '../k.dart';

/// 标题栏右侧通用的"说明"按钮
class ExplainButton extends StatelessWidget {
  final GestureTapCallback? onTap;

  const ExplainButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 12, end: 20),
        alignment: Alignment.center,
        child: Text(
          K.base_explain,
          style: TextStyle(
            fontSize: 14,
            color: R.colors.mainTextColor,
          ),
        ),
      ),
    );
  }
}
