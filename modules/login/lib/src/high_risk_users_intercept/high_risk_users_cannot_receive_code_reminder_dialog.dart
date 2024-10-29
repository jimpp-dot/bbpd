import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:login/k.dart';

class HighRiskUsersCannotReceiveCodeReminderDialog extends StatelessWidget {
  HighRiskUsersCannotReceiveCodeReminderDialog({Key? key}) : super(key: key);

  final String schemeTitle = K.login_voice_code_scheme_title;
  final List<String> schemes = [
    K.login_voice_code_scheme_1,
    K.login_voice_code_scheme_2,
    K.login_voice_code_scheme_3,
    K.login_voice_code_scheme_4,
    K.login_voice_code_scheme_5,
  ];

  static Future<void> show(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: EdgeInsets.zero,
          content: HighRiskUsersCannotReceiveCodeReminderDialog(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
              const SizedBox(height: 36),
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
}
