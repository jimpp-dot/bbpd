import 'package:shared/shared.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';

const String _modeSoft = 'Soft';
const String _modeMedium = 'Medium';
const String _modeAggressive = 'Aggressive';
const String _modeAI = 'AI';
const String _modeAIBalanced = 'AIBalanced';

Future<int?> showZegoAnsSelectDialog(BuildContext context) async {
  void pop(BuildContext context, int mode) {
    RtcBizConfig.ansMode = mode;
    Navigator.pop(context, mode);
  }

  return showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'Zego的ans类型',
            style: TextStyle(fontSize: 16, color: R.color.mainTextColor),
          ),
          backgroundColor: R.color.mainBgColor,
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                pop(context, 0);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  _modeSoft,
                  style: TextStyle(color: R.color.mainTextColor),
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                pop(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  _modeMedium,
                  style: TextStyle(color: R.color.mainTextColor),
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                pop(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  _modeAggressive,
                  style: TextStyle(color: R.color.mainTextColor),
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                pop(context, 3);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  _modeAI,
                  style: TextStyle(color: R.color.mainTextColor),
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                pop(context, 4);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  _modeAIBalanced,
                  style: TextStyle(color: R.color.mainTextColor),
                ),
              ),
            ),
          ],
        );
      });
}

String getCurZegoAnsDes() {
  int? type = RtcBizConfig.ansMode;
  switch (type) {
    case 0:
      return _modeSoft;
    case 1:
      return _modeMedium;
    case 2:
      return _modeAggressive;
    case 3:
      return _modeAI;
    case 4:
      return _modeAIBalanced;
    default:
      return _modeAI;
  }
}
