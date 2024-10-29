import 'package:login/k.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/k.dart' as base;
import 'package:shared/shared.dart';

class LoginConfirmDialog extends StatelessWidget {
  final Function() clickConfirm;

  const LoginConfirmDialog(this.clickConfirm, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: commonBoxDecorationWithParams(
            [R.colors.mainBgColor, R.colors.mainBgColor], 16),
        width: 312,
        padding: const EdgeInsetsDirectional.only(
            start: 20, end: 20, top: 24, bottom: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Text(
                K.login_confirm_title,
                style: TextStyle(
                  fontSize: 18,
                  color: R.color.mainTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text.rich(
                TextSpan(
                  text: K.login_agree_user_license,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: Util.fontFamily,
                      color: R.color.secondTextColor),
                  children: [
                    TextSpan(
                      text: base.K.base_user_service_protcol,
                      style: TextStyle(
                          fontSize: 16, color: R.color.mainBrandColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          String url =
                              Util.licenseUrl(LicenseType.USER_AGREEMENT2);
                          BaseWebviewScreen.show(context,
                              url: url,
                              title: base.K.setting_user_protcol_agreement2);
                        },
                    ),
                    TextSpan(
                      text: base.K.base_and,
                      style: TextStyle(
                          fontSize: 16, color: R.color.secondTextColor),
                    ),
                    TextSpan(
                      text: base.K.base_privacy_policy,
                      style: TextStyle(
                          fontSize: 16, color: R.color.mainBrandColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          String url =
                              Util.licenseUrl(LicenseType.USER_AGREEMENT3);
                          BaseWebviewScreen.show(context,
                              url: url,
                              title: base.K.setting_user_protcol_agreement3);
                        },
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 42),
            Ink(
              height: 48,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: R.color.mainBrandGradientColors),
                borderRadius: const BorderRadius.all(Radius.circular(24)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: R.color.mainBrandGradientColors),
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                ),
                child: InkWell(
                  onTap: clickConfirm,
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: Center(
                    child: Text(
                      K.login_confirm_agree_and_login,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 48,
              alignment: AlignmentDirectional.center,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  K.login_confirm_cancel,
                  style:
                      const TextStyle(fontSize: 13, color: Color(0x66202020)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<Object?> show<T>(
      BuildContext context, Function() clickConfirm) async {
    return await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 250),
      transitionBuilder: _buildMaterialDialogTransitions,
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Material(
          color: Colors.transparent,
          child: LoginConfirmDialog(clickConfirm),
        );
      },
    );
  }

  static Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOutCubic,
      ),
      child: SlideTransition(
        position: animation
            .drive(Tween(begin: const Offset(0, 0.05), end: Offset.zero)),
        child: ScaleTransition(
          scale: animation.drive(Tween(begin: 0.9, end: 1.0)),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
