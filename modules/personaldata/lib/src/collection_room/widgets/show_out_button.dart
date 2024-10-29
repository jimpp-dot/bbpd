import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/K.dart';

/// 对外展示按钮
class ShowOutButton extends StatelessWidget {
  final bool isEnable;

  final bool hasShowed;

  final VoidCallback? onTap;

  final double width;

  final double height;

  final double fontSize;

  const ShowOutButton({
    Key? key,
    this.isEnable = true,
    this.hasShowed = false,
    this.onTap,
    this.width = 76,
    this.height = 28,
    this.fontSize = 13,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnable ? onTap : null,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.all(Radius.circular(height)),
          border: Border.all(color: Colors.white.withOpacity(0.4), width: 1.5),
          gradient: LinearGradient(
            colors: _getBgColors(),
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
          ),
        ),
        child: _buildTitle(),
      ),
    );
  }

  List<Color> _getBgColors() {
    List<Color> colors;

    if (!isEnable) {
      colors = const [
        Color(0xFFBEC0DD),
        Color(0xFFF4F7FC),
      ];
    } else if (isEnable && hasShowed) {
      colors = const [
        Color(0xFFFD8849),
        Color(0xFFFFD518),
      ];
    } else {
      colors = R.color.mainBrandGradientColors;
    }

    return colors;
  }

  Widget _buildTitle() {
    return Center(
      child: Text(
        hasShowed ? K.personal_cr_did_show : K.personal_cr_show,
        style: R.textStyle.medium14.copyWith(
            fontSize: fontSize,
            color: Colors.white.withOpacity(isEnable ? 1 : 0.7)),
      ),
    );
  }
}
