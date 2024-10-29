import 'package:shared/k.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../shared.dart';

class LicenseCheckBoxDialog extends StatefulWidget {
  final String title;
  final String url;

  const LicenseCheckBoxDialog({super.key, this.title = '', this.url = ''});

  static Future show(BuildContext context,
      {String title = '', String url = ''}) async {
    return DialogQueue.root.enqueue(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return LicenseCheckBoxDialog(
            title: title,
            url: url,
          );
        });
  }

  @override
  _LicenseCheckBoxDialogState createState() => _LicenseCheckBoxDialogState();
}

class _LicenseCheckBoxDialogState extends State<LicenseCheckBoxDialog> {
  WebViewController? _webViewController;
  bool _checkBoxSelect = false;

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: WebView(
                    initialUrl: widget.url,
                    onWebViewCreated: (WebViewController webViewController) {
                      _webViewController = webViewController;
                    },
                    navigationDelegate: (NavigationRequest request) {
                      Uri uri = Uri.parse(request.url);
                      String path = uri.path;
                      if (path.endsWith('agreement2')) {
                        String url =
                            Util.licenseUrl(LicenseType.USER_AGREEMENT2);
                        BaseWebviewScreen.show(context,
                            url: url, title: K.setting_user_protcol_agreement2);
                        return NavigationDecision.prevent;
                      } else if (path.endsWith('agreement3')) {
                        String url =
                            Util.licenseUrl(LicenseType.USER_AGREEMENT3);
                        BaseWebviewScreen.show(context,
                            url: url, title: K.setting_user_protcol_agreement3);
                        return NavigationDecision.prevent;
                      }

                      Log.d('allowing navigation to $request');
                      return NavigationDecision.navigate;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: _checkBoxAction,
                    child: _checkBoxWidget(),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: RichText(
                    text: TextSpan(
                        // children: [
                        //   TextSpan(
                        //     text:K.base_user_service_protcol,
                        //       style: R.textStyle.regular12.copyWith(color: R.color.mainBrandColor),
                        //     recognizer: TapGestureRecognizer()..onTap=(){
                        //       String url = Util.licenseUrl(LicenseType.USER_AGREEMENT2);
                        //       BaseWebviewScreen.show(context, url: url, title: K.setting_user_protcol_agreement2);
                        //     }
                        //   ),
                        //   TextSpan(
                        //       text:K.base_and,
                        //   ),
                        //   TextSpan(
                        //       text:K.base_privacy_policy,
                        //       style: R.textStyle.regular12.copyWith(color: R.color.mainBrandColor),
                        //       recognizer: TapGestureRecognizer()..onTap=(){
                        //         String url = Util.licenseUrl(LicenseType.USER_AGREEMENT3);
                        //         BaseWebviewScreen.show(context, url: url, title: K.setting_user_protcol_agreement3);
                        //       }
                        //   ),
                        // ],
                        text: '${K.base_has_read_and_know}《${widget.title}》',
                        style: R.textStyle.regular12),
                  )),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  if (_checkBoxSelect) {
                    Tracker.instance.track(TrackEvent.pop_up_page, properties: {
                      'pop_page': 'join_broker_agreement',
                      'action_type': 'agree',
                    });
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
                        .copyWith(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  Tracker.instance.track(TrackEvent.pop_up_page, properties: {
                    'pop_page': 'join_broker_agreement',
                    'action_type': 'disagree',
                  });
                  Navigator.of(context).pop(false);
                },
                child: Container(
                  height: 48,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFFF5F5F5),
                  ),
                  child: Text(
                    K.base_not_agree_and_out,
                    style: R.textStyle.medium16.copyWith(fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _checkBoxWidget() {
    return _checkBoxSelect
        ? Container(
            decoration: BoxDecoration(
              color: R.color.mainBrandColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: R.img('ic_select_small.svg',
                width: 20,
                height: 20,
                package: ComponentManager.MANAGER_BASE_CORE),
          )
        : Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: R.color.mainBrandColor, width: 2)),
          );
  }

  _checkBoxAction() {
    _checkBoxSelect = !_checkBoxSelect;
    if (mounted) {
      setState(() {});
    }
  }
}
