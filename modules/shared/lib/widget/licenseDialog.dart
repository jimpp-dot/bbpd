import 'dart:io';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../shared.dart';
import '../k.dart';

class LicenseDialog extends StatefulWidget {
  final String title;
  final String url;
  final bool mustAgree;
  final int? version;
  static const String TAG = "LicenceDialog";

  const LicenseDialog(
      {super.key,
      required this.title,
      required this.url,
      this.mustAgree = false,
      this.version});

  static int _parseVersionFromLicenseContent(String content) {
    int version = 0;
    if (content.contains('\n')) {
      String firstLine = content.substring(0, content.indexOf('\n'));
      if (firstLine.contains('version=')) {
        version = Util.parseInt(firstLine.replaceAll(RegExp(r'[^0-9]'), ''));
      }
    }
    return version;
  }

  static Future<int> _updateLicenseFromServer(
      LicenseType licenseType, File file, int oldVersion) async {
    String url = Util.licenseUrl(licenseType);
    Log.d(tag: TAG, "_updateLicenseFromServer:$url");
    XhrResponse response;
    int newVersion = 0;

    try {
      response = await Xhr.get(url);
      if (response.response != null &&
          response.response.toString().isNotEmpty) {
        String contentStr = response.response.toString();
        newVersion = _parseVersionFromLicenseContent(contentStr);

        await file.writeAsString(contentStr);
      }
    } catch (e) {
      Log.d(e);
    }

    return max<int>(newVersion, oldVersion);
  }

  static Future<int> _updateLicenseFile(
      LicenseType licenseType, String fileName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$fileName');

    bool exist = await file.exists();
    //本地协议文件不存在，拷贝assets中的协议到本地
    if (!exist) {
      String licenseInAsset =
          await otaResourceBundle.loadString('assets/html/$fileName');
      await file.writeAsString(licenseInAsset);
    }

    int licenseVersion = 0;
    if (licenseType == LicenseType.USER_AGREEMENT1) {
      //读取协议版本
      String licenseContent = file.readAsStringSync();
      licenseVersion = _parseVersionFromLicenseContent(licenseContent);
    }
    return await _updateLicenseFromServer(licenseType, file, licenseVersion);
  }

  static show(BuildContext context, {bool fromLogin = false}) async {
    _updateLicenseFile(LicenseType.USER_AGREEMENT2, 'agreement2.html');
    _updateLicenseFile(LicenseType.USER_AGREEMENT3, 'agreement3.html');

    //从服务端更新license文件
    int licenseVersion = await _updateLicenseFile(
        LicenseType.USER_AGREEMENT1, 'agreement1.html');
    int agreedVersion = Config.getInt('userlicense.version', -1);

    if (licenseVersion > agreedVersion) {
      /// 修复IOS 刚从APP STORE下载下来，第一次打开，能绕过这个隐私协议弹窗的问题
      if (Platform.isIOS && fromLogin) {
        await Future.delayed(const Duration(milliseconds: 1500));
      }

      Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/agreement1.html');
      String url = Uri.file(file.path).toString();
      bool hasShow = Config.getBool(BBConfigKey.hasShowPrivacyAgreement, false);
      Tracker.instance.track(TrackEvent.privacyAgreementPopup,
          properties: {'is_first': !hasShow});
      if (!hasShow) {
        Config.setBool(BBConfigKey.hasShowPrivacyAgreement, true);
      }
      bool? agreed = await DialogQueue.root.enqueue(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return LicenseDialog(
              title: K.license_dialog_title,
              url: url,
              mustAgree: true,
              version: licenseVersion,
            );
          });
      if (agreed != null && agreed) {
        Tracker.instance.track(TrackEvent.privacyAgreementPopupClick,
            properties: {'is_agreed': true});
        Config.set('userlicense.version', '$licenseVersion');
      } else {
        Tracker.instance.track(TrackEvent.privacyAgreementPopupClick,
            properties: {'is_agreed': false});
      }
    }
  }

  @override
  _LicenseDialogState createState() => _LicenseDialogState();
}

class _LicenseDialogState extends State<LicenseDialog> {
  WebViewController? _webViewController;
  bool _checkBoxSelect = false;

  @override
  void initState() {
    super.initState();
    Log.d(tag: LicenseDialog.TAG, "init state,load url:${widget.url}");
  }

  @override
  Widget build(BuildContext context) {
    Log.d(tag: LicenseDialog.TAG, "init");
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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                    ),
                    child: WebView(
                      initialUrl: widget.url,
                      backgroundColor: Colors.transparent,
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
                              url: url,
                              title: K.setting_user_protcol_agreement2);
                          return NavigationDecision.prevent;
                        } else if (path.endsWith('agreement3')) {
                          String url =
                              Util.licenseUrl(LicenseType.USER_AGREEMENT3);
                          BaseWebviewScreen.show(context,
                              url: url,
                              title: K.setting_user_protcol_agreement3);
                          return NavigationDecision.prevent;
                        } else if (path.endsWith('protocol5')) {
                          return NavigationDecision.navigate;
                        } else if (request.url
                            .startsWith(RegExp(r'http(s?):\/\/'))) {
                          BaseWebviewScreen.show(context, url: request.url);
                          return NavigationDecision.prevent;
                        }

                        Log.d('allowing navigation to $request');
                        return NavigationDecision.navigate;
                      },
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
                  Expanded(
                      child: (widget.url.contains("protocol5"))
                          ? _buildRoomTips()
                          : _buildNormalTips()),
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

  /// 房间协议地步提示单独处理
  Widget _buildRoomTips() {
    return RichText(
      text: TextSpan(
          children: [
            TextSpan(
              text: "《${widget.title}》",
            ),
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
