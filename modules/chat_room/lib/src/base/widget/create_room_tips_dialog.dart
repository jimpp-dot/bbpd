import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 游戏直播创建房间限制提示弹窗
///
class CreateTipsDialog extends StatelessWidget {
  final String content;
  final String btnText;

  const CreateTipsDialog({
    Key? key,
    required this.content,
    required this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: Util.width - 64,
          height: 196,
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsetsDirectional.only(
              top: 40, bottom: 20, start: 20, end: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.2,
                    color: R.color.mainTextColor,
                    fontSize: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Container(
                  width: 160,
                  height: 52,
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    gradient: LinearGradient(
                      colors: R.color.mainBrandGradientColors,
                    ),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    btnText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
