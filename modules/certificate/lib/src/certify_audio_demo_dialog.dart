import 'dart:math';

import 'package:certificate/assets.dart';
import 'package:shared/shared.dart';
import 'package:certificate/k.dart';
import 'package:flutter/material.dart';

/// 示例语音
class CertifyAudioDemoDialog extends StatefulWidget {
  final List<String> demos;

  const CertifyAudioDemoDialog({super.key, required this.demos});

  @override
  _CertifyAudioDemoDialogState createState() => _CertifyAudioDemoDialogState();

  static Future show(BuildContext context, List<String> demos) async {
    await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CertifyAudioDemoDialog(demos: demos);
        });
  }
}

class _CertifyAudioDemoDialogState extends State<CertifyAudioDemoDialog> {
  String getDemoStr() {
    int index =
        widget.demos.length > 1 ? Random().nextInt(widget.demos.length - 1) : 0;
    return widget.demos[index];
  }

  @override
  Widget build(BuildContext context) {
    String demoStr = getDemoStr();

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 200,
        width: 339,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    K.cer_audio_example_title,
                    style: R.textStyle.caption,
                  ),
                ),
                TextButton.icon(
                  onPressed: refresh,
                  icon: Icon(
                    Icons.sync,
                    color: R.color.thirdTextColor,
                  ),
                  label: Text(
                    K.cer_change_audio_example,
                    style: R.textStyle.subCaption,
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                PositionedDirectional(
                  top: 0,
                  start: 0,
                  child: R.img(
                    Assets.certificate$certify_quote1_svg,
                    width: 16,
                    color: R.color.mainBrandColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    demoStr,
                    style: R.textStyle.body1,
                  ),
                ),
                PositionedDirectional(
                  bottom: 0,
                  end: 0,
                  child: R.img(
                    Assets.certificate$certify_quote2_svg,
                    width: 16,
                    package: ComponentManager.MANAGER_CERTIFICATE,
                    color: R.color.mainBrandColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
