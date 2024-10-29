import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/ktv/utils/ktv_theme.dart';

/// 一个假的自动生成UI样式，用来虚拟生成过程提供占位文件。
class GenerateDialog extends StatefulWidget {
  const GenerateDialog({super.key});

  @override
  State<StatefulWidget> createState() => _GenerateDialogState();

  static Future<bool?> show(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return const GenerateDialog();
      },
    );
  }
}

class _GenerateDialogState extends State<GenerateDialog> {
  double _progress = 0.0;

  static const int _maxSeconds = 5;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    const period = Duration(milliseconds: 200);
    double perGrow = (200 / (_maxSeconds * 1000));
    _timer = Timer.periodic(period, (timer) {
      // Log.d('----period--- perGrow=$perGrow,_progress=$_progress');
      _progress += perGrow;
      if (_progress >= 1) {
        _timer?.cancel();
        _timer = null;
        Navigator.of(context).pop(true);
        return;
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: Center(
          child: SizedBox(
            width: 250,
            height: 250,
            child: GestureDetector(
              onTap: () {
                /// do noting
              },
              child: Container(
                decoration: ShapeDecoration(
                    color: KtvTheme.mainBgColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Text(
                          '${(_progress * 100).round().toString()}%',
                          style: TextStyle(
                              color: KtvTheme.mainTextColor, fontSize: 14),
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(
                            value: _progress,
                            strokeWidth: 3.0,
                            backgroundColor: KtvTheme.secondBgColor,
                            valueColor:
                                AlwaysStoppedAnimation(KtvTheme.mainBrandColor),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 20),
                      child: Text(K.ktv_auto_generating,
                          style: TextStyle(
                              color: KtvTheme.mainTextColor, fontSize: 14)),
                    ),
                    const SizedBox(height: 20),
                    GradientButton(
                      K.cancel,
                      width: 100,
                      height: 40,
                      colors: KtvTheme.gradientColors,
                      onTap: () {
                        Navigator.of(context).pop(false);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
