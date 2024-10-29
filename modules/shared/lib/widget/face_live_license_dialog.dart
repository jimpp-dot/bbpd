import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/k.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../shared.dart' hide AnimTabBar;

/// 实人认证授权弹窗
class FaceLiveLicenseDialog extends StatefulWidget {
  const FaceLiveLicenseDialog({super.key});

  @override
  FaceLiveLicenseState createState() {
    return FaceLiveLicenseState();
  }

  static Future<bool?> show(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const FaceLiveLicenseDialog();
        });
  }
}

class FaceLiveLicenseState extends State<FaceLiveLicenseDialog> {
  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];
    actions.add(Expanded(
      flex: 1,
      child: SizedBox(
        height: 48,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(false);
          },
          child: Container(
            alignment: AlignmentDirectional.center,
            height: 48,
            decoration: commonBoxDecoration(
                linearGradientColor: R.colors.translateGradientColors,
                borderRadius: 24),
            child: Text(
              K.base_dont_agree,
              style: TextStyle(
                  color: R.color.mainTextColor.withOpacity(0.6),
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    ));
    actions.add(const SizedBox(width: 8));
    actions.add(Expanded(
      flex: 1,
      child: SizedBox(
        height: 48,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(true),
          child: Container(
            alignment: AlignmentDirectional.center,
            height: 48,
            decoration: commonBoxDecoration(borderRadius: 24),
            child: Text(
              K.base_agree,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    ));

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                K.base_face_live_license_title,
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                top: 16,
                right: 12,
              ),
              child: ExtendedText(
                '${K.base_face_live_license_1_ali}\n'
                '@<<${K.base_face_live_license_2_ali}>>@\n\n'
                '${K.base_face_live_license_3}',
                onSpecialTextTap: (data) {
                  String url =
                      'https://help.aliyun.com/document_detail/103075.html';
                  BaseWebviewScreen.show(context, url: url);
                },
                specialTextSpanBuilder: FaceSpecialTextSpanBuilder(),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 22,
                bottom: 20,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: actions,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FaceSpecialText extends SpecialText {
  static const String flag = "@";

  FaceSpecialText(TextStyle? textStyle, SpecialTextGestureTapCallback? onTap)
      : super(flag, flag, textStyle, onTap: onTap);

  @override
  TextSpan finishText() {
    String faceText = toString();
    if (faceText.isNotEmpty) {
      faceText = faceText.safeSubstring(1);
      if (faceText.isNotEmpty) {
        faceText = faceText.safeSubstring(0, faceText.length - 1);
      }
    }
    return TextSpan(
        text: faceText,
        style: textStyle.copyWith(
            color: R.color.mainBrandColor,
            fontSize: 16.0,
            decoration: TextDecoration.underline),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            if (onTap != null) onTap!(faceText);
          });
  }
}

class FaceSpecialTextSpanBuilder extends SpecialTextSpanBuilder {
  @override
  TextSpan build(String data,
      {TextStyle? textStyle, SpecialTextGestureTapCallback? onTap}) {
    if (data == "") return const TextSpan(text: '');
    List<InlineSpan> inlineList = [];
    if (data.isNotEmpty) {
      SpecialText? specialText;
      String textStack = "";
      //String text
      for (int i = 0; i < data.length; i++) {
        String char = data[i];
        if (specialText != null) {
          if (!specialText.isEnd(char)) {
            specialText.appendContent(char);
          } else {
            inlineList.add(specialText.finishText());
            specialText = null;
          }
        } else {
          textStack += char;
          specialText =
              createSpecialText(textStack, textStyle: textStyle, onTap: onTap);
          if (specialText != null) {
            if (textStack.length - specialText.startFlag.length >= 0) {
              textStack = textStack.substring(
                  0, textStack.length - specialText.startFlag.length);
              if (textStack.isNotEmpty) {
                inlineList.add(TextSpan(text: textStack, style: textStyle));
              }
            }
            textStack = "";
          }
        }
      }

      if (specialText != null) {
        inlineList.add(TextSpan(
            text: specialText.startFlag + specialText.getContent(),
            style: textStyle));
      } else if (textStack.isNotEmpty) {
        inlineList.add(TextSpan(text: textStack, style: textStyle));
      }
    }

    return TextSpan(children: inlineList, style: textStyle);
  }

  @override
  SpecialText? createSpecialText(String flag,
      {int? index,
      TextStyle? textStyle,
      SpecialTextGestureTapCallback? onTap}) {
    if (flag == "") return null;

    if (isStart(flag, FaceSpecialText.flag)) {
      return FaceSpecialText(textStyle, onTap);
    }
    return null;
  }
}
