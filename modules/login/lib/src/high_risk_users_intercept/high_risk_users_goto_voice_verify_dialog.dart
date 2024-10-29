import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:login/k.dart';

import '../../assets.dart';
import 'high_risk_users_voice_verify_code_dialog.dart';

class HighRiskUsersGotoVoiceVerifyDialog extends StatelessWidget {
  const HighRiskUsersGotoVoiceVerifyDialog({Key? key}) : super(key: key);

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
          content: const HighRiskUsersGotoVoiceVerifyDialog(),
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  bottom: 20,
                ),
                child: R.img(
                  Assets.login$verify_dialog_icon_webp,
                  width: 180,
                  height: 144,
                  fit: BoxFit.contain,
                  package: ComponentManager.MANAGER_LOGIN,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 24,
                  end: 24,
                  bottom: 25,
                ),
                child: Text(
                  K.login_high_risk_account_need_verify,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: R.color.secondTextColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  HighRiskUsersVoiceVerifyCodeDialog.show(context);
                },
                child: Container(
                  height: 48,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        colors: R.color.mainBrandGradientColors,
                      )),
                  child: Text(
                    K.login_goto_voice_auth,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  height: 48,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: Text(
                    K.login_no_verify_now,
                    style: TextStyle(
                      fontSize: 13,
                      color: R.color.thirdTextColor,
                    ),
                  ),
                ),
              )
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
}
