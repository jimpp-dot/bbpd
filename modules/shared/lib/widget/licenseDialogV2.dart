import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../shared.dart';
import '../k.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

/// 苹果权限弹窗
class LicenseDialogV2 extends StatefulWidget {
  final String? title;
  final String? url;
  final bool mustAgree;
  final int? version;
  static const String TAG = "LicenceDialogV2";
  static const String agreementUrl =
      "https://www.happyxq.cc.cn/public/agreement1.html";

  const LicenseDialogV2(
      {Key? key, this.title, this.url, this.mustAgree = false, this.version})
      : super(key: key);

  static show(BuildContext context, {bool fromLogin = false}) async {
    bool hasShow = Config.getBool(BBConfigKey.hasShowPrivacyAgreement, false);
    Tracker.instance.track(TrackEvent.privacyAgreementPopup,
        properties: {'is_first': !hasShow});
    if (!hasShow) {
      Config.setBool(BBConfigKey.hasShowPrivacyAgreement, true);
    }
    // 服务端下发的版本号
    int agreedVersion = Config.getInt('Config.license_dialog_version', -1);
    String url = '$agreementUrl?version=1';
    Uri uri = Uri.parse(url);
    Map<String, String> params = uri.queryParameters;
    int originVersion = Util.parseInt(params['version']);
    // 本地存储的版本号
    int localVersion = Config.getInt('license_dialog_local_version', -1);
    if (localVersion < originVersion) {
      localVersion = originVersion;
      Config.set('license_dialog_local_version', localVersion.toString());
    }
    // 协议更新后，需要弹窗 和 第一次安装的时候弹窗
    if (agreedVersion > localVersion || agreedVersion == -1) {
      if (agreedVersion > localVersion) {
        // html会有缓存，当版本号有更新的时候，设置新版本号来更新html页面
        url = replaceVersion(url, agreedVersion);
        Config.set('license_dialog_local_version', agreedVersion.toString());
      }
      bool? agreed = await DialogQueue.root.enqueue(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return LicenseDialogV2(
              title: K.license_dialog_title,
              url: url,
              mustAgree: true,
            );
          });
      if (agreed == true) {
        Tracker.instance.track(TrackEvent.privacyAgreementPopupClick,
            properties: {'is_agreed': true});
      } else {
        Tracker.instance.track(TrackEvent.privacyAgreementPopupClick,
            properties: {'is_agreed': false});
      }
    }
  }

  static String replaceVersion(String url, int newVersion) {
    RegExp reg = RegExp(r'version=(\d+)');
    return url.replaceAll(reg, 'version=$newVersion');
  }

  @override
  _LicenseDialogV2State createState() => _LicenseDialogV2State();
}

class _LicenseDialogV2State extends State<LicenseDialogV2> {
  WebViewController? _webViewController;
  bool _checkBoxSelect = false;
  ConnectivityResult? _connectionStatus;
  Connectivity? _connectivity;
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription = _connectivity?.onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (mounted) {
        setState(() {
          _connectionStatus = result;
          _webViewController = null;
        });
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    _webViewController = null;
    super.dispose();
  }

  Future<void> initConnectivity() async {
    _connectivity = Connectivity();
    ConnectivityResult? connectionStatus;
    try {
      connectionStatus = await _connectivity?.checkConnectivity();
    } on PlatformException catch (e) {
      Log.d(e);
      connectionStatus = ConnectivityResult.none;
    }
    if (mounted) {
      setState(() {
        _connectionStatus = connectionStatus;
      });
    }
  }

  _loadHtmlFromAssets(String filePath) async {
    String fileHtmlContents = await otaResourceBundle.loadString(filePath);
    _webViewController?.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  Widget build(BuildContext context) {
    Log.d(tag: LicenseDialogV2.TAG, "init");
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
                    widget.title ?? '',
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
                          initialUrl:
                              _connectionStatus != ConnectivityResult.none
                                  ? widget.url
                                  : '',
                          backgroundColor: Colors.transparent,
                          onWebViewCreated:
                              (WebViewController webViewController) {
                            _webViewController = webViewController;
                            if (_connectionStatus == ConnectivityResult.none) {
                              _loadHtmlFromAssets(
                                  'assets/html/agreement1.html');
                            }
                          },
                          navigationDelegate: (NavigationRequest request) {
                            Uri uri = Uri.parse(request.url);
                            String path = uri.path;
                            if (path == '/help/agreement2') {
                              String url =
                                  Util.licenseUrl(LicenseType.USER_AGREEMENT2);
                              BaseWebviewScreen.show(context,
                                  url: url,
                                  title: K.setting_user_protcol_agreement2);
                              return NavigationDecision.prevent;
                            } else if (path == '/help/agreement3') {
                              String url =
                                  Util.licenseUrl(LicenseType.USER_AGREEMENT3);
                              BaseWebviewScreen.show(context,
                                  url: url,
                                  title: K.setting_user_protcol_agreement3);
                              return NavigationDecision.prevent;
                            } else if (path.endsWith('protocol5')) {
                              return NavigationDecision.navigate;
                            }
                            return NavigationDecision.navigate;
                          })),
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
                      child: (widget.url?.contains("protocol5") == true)
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
                          .copyWith(color: Colors.white, fontSize: 15),
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
