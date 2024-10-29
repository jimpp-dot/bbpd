import 'dart:io';
import 'dart:math';

import 'package:certificate/k.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'model/certifyRepository.dart';

/// 主播认证协议 dialog
class GodLicenseDialog extends StatelessWidget {
  static const String licenseName = 'godlicense';
  static const String KEY = 'godlicense.version';
  final String title;
  final String url;
  final bool mustAgree;
  final int version;

  const GodLicenseDialog({super.key, required this.title, required this.url, this.mustAgree = false, required this.version});

  static int _parseVersionFromLicenseContent(String content) {
    if (content.isEmpty) return 0;
    String firstLine = content.substring(0, content.indexOf('\n'));
    int version = 0;
    if (firstLine.contains('version=')) {
      version = Util.parseInt(firstLine.replaceAll(RegExp(r'[^0-9]'), ''));
    }

    return version;
  }

  static Future<int> updateLicenseAndGetVersion() async {
    XhrResponse? response;
    int oldVersion = 0;
    int newVersion = 0;
    File file;

    try {
      final directory = await getApplicationDocumentsDirectory();
      file = File('${directory.path}/$licenseName.html');

      bool exist = await file.exists();
      if (exist) {
        String licenseContent = file.readAsStringSync();
        oldVersion = _parseVersionFromLicenseContent(licenseContent);
      }

      String url = Util.licenseUrl(LicenseType.GOD_AUTH);
      Log.d('updateLicenseAndGetVersion:$url');
      final dio = Dio();
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        newVersion = _parseVersionFromLicenseContent(response.data);
        if (newVersion > oldVersion) {
          await file.writeAsString(response.data as String);
        }
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }

    int latestVersion = max<int>(newVersion, oldVersion);
    Session.setValue(KEY, '$latestVersion');

    return latestVersion;
  }

  static Future<bool> show(BuildContext context, int agreedVersion) async {
    final directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$licenseName.html');
    int licenseVersion = 0;

    bool localLicenseExist = await file.exists();

    //本地协议文件不存在，拷贝assets中的协议到本地
    if (!localLicenseExist) {
      String? licenseInAsset;
      try {
        licenseInAsset = await otaResourceBundle.loadString('assets/html/$licenseName.html');
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }

      if (licenseInAsset != null && licenseInAsset.isNotEmpty) {
        await file.writeAsString(licenseInAsset);
        localLicenseExist = true;
      } else {
        localLicenseExist = false;
      }
    }

    //读取协议版本
    if (localLicenseExist) {
      String licenseContent = file.readAsStringSync();
      licenseVersion = _parseVersionFromLicenseContent(licenseContent);
    }

    //从服务端更新license文件
    if (!localLicenseExist || licenseVersion == 0) {
      licenseVersion = await updateLicenseAndGetVersion();
    }

    bool agreed = false;
    if (licenseVersion > 0 && licenseVersion > agreedVersion) {
      String url = Uri.file(file.path).toString();
      agreed = await showDialog(
          context: System.context,
          barrierDismissible: false,
          builder: (context) {
            return GodLicenseDialog(
              title: K.cer_god_auth_protcol,
              url: url,
              mustAgree: false,
              version: licenseVersion,
            );
          });
    }
    return agreed;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];
    actions.add(Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(false),
        child: Container(
          height: 48,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Text(
            BaseK.K.base_dont_agree,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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
          onTap: () async {
            AgreeGodLicenseRsp result = await CertifyRepository.agreeGodLicense(version);
            bool agreeSuccess = result.success;

            if (!result.success && result.error == AgreeGodLicenseRsp.ERROR_TYPE_REQUEST_CONFIRM) {
              agreeSuccess = (await _showAlertDialog(context, result.msg ?? '')) ?? false;
            }
            Navigator.of(context).pop(agreeSuccess);
          },
          child: Container(
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              gradient: LinearGradient(
                colors: R.color.mainBrandGradientColors,
              ),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              BaseK.K.base_agree,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    ));

    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          height: 440,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 16,
                    right: 12,
                  ),
                  child: WebView(
                    initialUrl: url,
                  ),
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
      ),
    );
  }

  Future _showAlertDialog(BuildContext context, String? msg) {
    return showDialog(
        context: context,
        builder: (context) {
          return ConfirmDialog(
            content: msg ?? K.cer_god_single_mobile_notice,
            positiveButton: PositiveButton(
              text: K.sure,
              onPressed: () async {
                AgreeGodLicenseRsp result = await CertifyRepository.agreeGodLicense(version, confirm: 1);

                Navigator.of(context).pop(result.success);
              },
            ),
            negativeButton: NegativeButton(text: K.cancel),
          );
        });
  }
}
