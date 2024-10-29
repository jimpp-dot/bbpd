import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:login/k.dart';
import 'package:login/src/phone/voice_verify_code_dialog.dart';

class VoiceCodeButton extends StatelessWidget {
  final VoidCallback? onTapSend;

  const VoiceCodeButton({Key? key, this.onTapSend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool? send = await VoiceVerifyCodeDialog.show(context);
        if (send == true) {
          if (onTapSend != null) {
            onTapSend!();
          }
          Fluttertoast.showCenter(msg: K.login_voice_code_send_toast);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        alignment: AlignmentDirectional.center,
        child: Text(
          K.login_dont_receive_code,
          style: TextStyle(
            color: R.color.mainBrandColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
