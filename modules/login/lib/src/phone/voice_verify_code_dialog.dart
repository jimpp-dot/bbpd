import 'package:login/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class VoiceVerifyCodeDialog extends StatelessWidget {
  final String schemeTitle = K.login_voice_code_scheme_title;
  final List<String> schemes = [
    K.login_voice_code_scheme_1,
    K.login_voice_code_scheme_2,
    K.login_voice_code_scheme_3,
    K.login_voice_code_scheme_4,
    K.login_voice_code_scheme_5,
    K.login_voice_code_scheme_6
  ];

  VoiceVerifyCodeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 312,
        height: 352,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  K.login_dont_receive_code,
                  style: const TextStyle(
                    color: Color(0xFF202020),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    schemeTitle,
                    style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: AlignmentDirectional.centerStart,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: _buildContents(),
                  ),
                ),
                const Spacer(),
                _buildBtn(context),
                const SizedBox(height: 20),
              ],
            ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  size: 24,
                  color: R.color.thirdTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContents() {
    List<Widget> result = [];
    schemes.forEachIndexed((i, e) {
      result.add(
        Text(
          '${i + 1}、$e',
          style: const TextStyle(
            color: Color(0xB3202020),
            fontSize: 14,
          ),
        ),
      );
      result.add(const SizedBox(height: 3));
    });
    return result;
  }

  Widget _buildBtn(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(true),
      child: Container(
        width: 200,
        height: 48,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            colors: R.color.mainBrandGradientColors,
          ),
          shape: const StadiumBorder(),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          K.login_voice_code_send,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static Future<bool?> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => VoiceVerifyCodeDialog(),
    );
  }
}
