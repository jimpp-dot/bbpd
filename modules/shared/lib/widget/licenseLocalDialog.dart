import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../shared.dart';
import '../k.dart';

class LicenseLocalDialog extends StatefulWidget {
  final String title;
  final String content;
  final bool mustAgree;
  static const String TAG = "LicenseLocalDialog";
  const LicenseLocalDialog(
      {super.key,
      required this.title,
      required this.content,
      this.mustAgree = false});

  static Future<bool?> show(BuildContext context, String title, String content,
      bool mustAgree) async {
    // 修复IOS 刚从APP STORE下载下来，第一次打开，能绕过这个隐私协议弹窗的问题
    return await DialogQueue.root.enqueue(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return LicenseLocalDialog(
              title: title, content: content, mustAgree: mustAgree);
        });
  }

  @override
  _LicenseLocalDialogState createState() => _LicenseLocalDialogState();
}

class _LicenseLocalDialogState extends State<LicenseLocalDialog> {
  WebViewController? _webViewController;
  bool _checkBoxSelect = false;

  @override
  Widget build(BuildContext context) {
    Log.d(tag: LicenseLocalDialog.TAG, "init");
    return WillPopScope(
      onWillPop: () async {
        _webViewController?.goBack();
        return false;
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 467,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: _wrapPadding(
                  Text(
                    widget.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Expanded(
                child: _wrapPadding(
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                      ),
                      child: Text(
                        widget.content,
                        style: const TextStyle(
                            fontSize: 15, color: Colors.black, height: 1.6),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  _wrapWithStack(
                      40, 20, 4, 20, _checkBoxWidget(28), _checkBoxAction),
                  Expanded(child: _buildNormalTips()),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              _wrapPadding(
                GestureDetector(
                  onTap: () {
                    if (_checkBoxSelect) {
                      Navigator.of(context).pop(true);
                    } else {
                      Fluttertoast.showCenter(
                          msg: K.base_need_agree_can_go_next_action);
                    }
                  },
                  child: Container(
                    height: 48,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                            colors: R.color.mainBrandGradientColors)),
                    child: Text(
                      K.base_agree_and_go,
                      style: R.textStyle.medium16
                          .copyWith(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              _wrapPadding(
                GestureDetector(
                  onTap: () {
                    if (widget.mustAgree) {
                      Fluttertoast.showToast(
                          msg: K.user_protcol_agreement_toast,
                          gravity: ToastGravity.CENTER);
                    } else {
                      Navigator.of(context).pop(false);
                    }
                  },
                  child: Container(
                    height: 48,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xFFF5F5F5),
                    ),
                    child: Text(
                      K.base_dont_agree,
                      style: R.textStyle.medium16.copyWith(
                          fontSize: 15, color: const Color(0xFF313131)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNormalTips() {
    return RichText(
      text: TextSpan(
          children: [
            TextSpan(
                text: K.base_user_service_protcol,
                style: R.textStyle.regular12
                    .copyWith(color: R.color.mainBrandColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    String url = Util.licenseUrl(LicenseType.USER_AGREEMENT2);
                    BaseWebviewScreen.show(context,
                        url: url, title: K.setting_user_protcol_agreement2);
                  }),
            TextSpan(
              text: K.base_and,
            ),
            TextSpan(
                text: K.base_privacy_policy,
                style: R.textStyle.regular12
                    .copyWith(color: R.color.mainBrandColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    String url = Util.licenseUrl(LicenseType.USER_AGREEMENT3);
                    BaseWebviewScreen.show(context,
                        url: url, title: K.setting_user_protcol_agreement3);
                  }),
          ],
          text: K.base_has_read_and_know,
          style:
              R.textStyle.regular12.copyWith(color: const Color(0xFF313131))),
    );
  }

  Widget _wrapPadding(Widget child) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: child,
    );
  }

  Widget _checkBoxWidget(double heightAndWidth) {
    return R.img(
      _checkBoxSelect
          ? 'ic_check_box_selected.webp'
          : 'ic_check_box_un_selected.webp',
      width: heightAndWidth,
      height: heightAndWidth,
      package: ComponentManager.MANAGER_BASE_CORE,
    );
  }

  Widget _wrapWithStack(double totalHeight, double childStart, double chlidEnd,
      double childWidth, Widget child, GestureTapCallback tapCallBack) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        PositionedDirectional(
          end: 4,
          child: child,
        ),
        GestureDetector(
          onTap: tapCallBack,
          child: Container(
            height: totalHeight,
            width: childStart + chlidEnd + childWidth,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }

  _checkBoxAction() {
    _checkBoxSelect = !_checkBoxSelect;
    if (mounted) {
      setState(() {});
    }
  }
}
