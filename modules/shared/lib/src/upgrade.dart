import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

class UpgradeInfo {
  String? versionName;
  String? message;
  String? url;
  String? md5;
  bool? force;
  String? packageName;
  String? appId; // for iOS
  String? gwUrl; //去官网的URL

  UpgradeInfo({this.versionName, this.message, this.url, this.md5, this.force, this.packageName, this.appId});
}

class Upgrade {
  static OverlayEntry? _overlayEntry;

  static showUpgradeDialog(UpgradeInfo upgradeInfo) {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      dismissDialog();
      var overlayState = Overlay.of(System.context);
      OverlayEntry overlayEntry;
      overlayEntry = OverlayEntry(builder: (context) {
        return UpgradeTipsDialog(info: upgradeInfo);
      });
      _overlayEntry = overlayEntry;
      overlayState.insert(overlayEntry);
    });
  }

  static dismissDialog() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  static Future<void> checkUpgrade(BuildContext context) async {
    Map? resultMap = await _requestUpgrade();
    UpgradeInfo info = UpgradeInfo();
    if (resultMap != null && Util.parseBool(resultMap['success'])) {
      Log.d('checkUpgrade:$resultMap');
      Map data = Util.parseMap(resultMap['data']);
      if (data['type'] == 'native') {
        info.versionName = Util.parseStr(data['version_code']);
        info.url = Util.parseStr(data['url']);
        info.md5 = Util.parseStr(data['md5']);
        info.message = Util.parseStr(data['message']);
        info.force = Util.parseInt(data['force']) == 1;
//        info.force = true;
        info.packageName = Util.parseStr(data['package']);
        info.appId = resultMap['appId']?.toString();
//        info.appId = '1456076638';
//         HiveUtil.putString('appinfo.appid', info.appId);
        info.gwUrl = Util.parseStr(data['gwurl']);

        _showConfirmDialog(context, info);
      }
    }

    return;
  }

  static _showConfirmDialog(BuildContext context, UpgradeInfo upgradeInfo) {
    showUpgradeDialog(upgradeInfo);
  }

  static Future<Map?> _requestUpgrade() async {
    String channel = await SharedAppPlugin.getWalleChannel();

    String mac = DeviceInfo.mac;

    final int versionCode = Util.parseInt(Constant.versionCode);
//    final int versionCode = 20; // for test 强制升级
//    final int versionCode = 9; // for test 非强制升级
    final String versionName = Constant.versionName;
    const String currentJSVersion = "0";
//    String appName = "miban";  // for test
    String appName = Util.isAndroid ? await SharedAppPlugin.getMetadata('UPGRADE_APP_NAME') : Constant.packageName;
    String uid = Session.uid.toString();

    String platform = Util.isAndroid ? 'android' : 'ios';

    /// 升级用独立域名，防止被封
    String path =
        'reportnew?version=$versionCode&versionname=$versionName&jsversion=$currentJSVersion&platform=$platform&app=$appName&channel=$channel&mac=$mac&uid=$uid';

    List<String> urls = [];
    urls.add('${System.domain}$path');
    // urls.add('${System.upgradeDomain}$path');
    // urls.add('http://116.62.18.44:8080/$path');
    // urls.add('http://121.41.7.29:8080/$path');

    Map? resultMap;
    try {
      resultMap = await _doHttpReq(urls);
    } catch (e) {
      Log.d("check update error: $e");
    }
    return resultMap;
  }

  static Future<Map?> _doHttpReq(List<String>? urls) async {
    if (urls == null || urls.isEmpty) {
      return null;
    }

    for (int i = 0; i < urls.length; i++) {
      Map? res = await _request(urls[i]);
      if (res != null) {
        return res;
      }
    }

    return null;
  }

  static Future<Map?> _request(String url) async {
    Map? responseBody;
    try {
      var httpClient = HttpClient();
      var uri = Uri.parse(url);
      var request = await httpClient.getUrl(uri);
      Log.d('uri==>>$uri');
      var response = await request.close();
      Log.d('responseBody==>>$response');
      if (response.statusCode == 200) {
        dynamic rsp = await response.transform(utf8.decoder).join();
        Log.d('responseBody==>>$rsp');
        responseBody = json.decode(rsp);
        Log.d('responseBody==>>$responseBody');
      }
    } catch (e) {
      Log.d('_request, error: $e');
    }
    return responseBody;
  }

  static late File mApkFile;
  static late File mTmpFile;
  static const String TMP_FILE = "upgrade.apk.tmp";
  static const String APK_FILE = "upgrade.apk";

  static init() async {
    String type = "upgrade";
    String? saveDirPath = await SharedAppPlugin.getExternalFilesDir(type);
    var context = path.Context(style: Style.platform);
    String savePath = context.join(saveDirPath!, TMP_FILE);
    mTmpFile = File(savePath);
    String apkPath = context.join(saveDirPath, APK_FILE);
    mApkFile = File(apkPath);

    bool exists = await mApkFile.exists();
    if (exists) {
      mApkFile.deleteSync();
    }
  }

  static Future<bool> downloadFile(String url, String md5, ProgressCallback? onProgress) async {
    try {
      Dio dio = Dio();

      bool tmpExists = await mTmpFile.exists();
      if (tmpExists) {
        mTmpFile.deleteSync();
      }
      bool apkExists = await mApkFile.exists();
      if (apkExists) {
        mApkFile.deleteSync();
      }

      onProgress ??= _onDownloadProgress;
      await dio.download(url, mTmpFile.path, onReceiveProgress: onProgress);

      String fileMD5 = await SharedAppPlugin.getFileMD5(mTmpFile.path);
      if (md5 == fileMD5) {
        mTmpFile.renameSync(mApkFile.path);
        return true;
      } else {
        bool exists = await mTmpFile.exists();
        if (exists) {
          mTmpFile.deleteSync();
        }
        return false;
      }
    } catch (e) {
      Log.d(e);
      return false;
    }
  }

  static _onDownloadProgress(int received, int total) {
    Log.d("_onDownloadProgress: download $received / $total");
  }

  static installApk() async {
    var exists = await mApkFile.exists();
    if (exists) {
      SharedAppPlugin.installApk(mApkFile);
    }
  }

  static Future<bool> checkApkExists() async {
    return mApkFile.exists();
  }
}

/// 立即更新screen
class UpgradeScreen extends StatefulWidget {
  final UpgradeInfo mUpgradeInfo;

  const UpgradeScreen({Key? key, required this.mUpgradeInfo}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<UpgradeScreen> {
  double mProgress = 0.0;
  bool mIsDownloading = false;

  @override
  void initState() {
    super.initState();
    Upgrade.init();
  }

  _onUpgradeTaped() async {
    String? newPackage = widget.mUpgradeInfo.packageName;
    if (newPackage != null && newPackage.isNotEmpty) {
      bool gotoMarketSuccess = await SharedAppPlugin.goToAppMarket(newPackage);
      if (gotoMarketSuccess) {
        return;
      }
    }

    if (mIsDownloading) {
      return;
    }

    bool apkExists = await Upgrade.checkApkExists();
    if (apkExists) {
      await Upgrade.installApk();
      return;
    }

    mIsDownloading = true;
    _refresh();
    bool downloadSuccess = await Upgrade.downloadFile(widget.mUpgradeInfo.url ?? '', widget.mUpgradeInfo.md5 ?? '', _onDownloadProgress);
    mIsDownloading = false;
    mProgress = 0;
    _refresh();

    if (downloadSuccess) {
      await Upgrade.installApk();
    } else {
      //提示下载失败
      String msg = K.download_error_check_storage;
      Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      if (widget.mUpgradeInfo.force ?? false) {
        return false;
      } else {
        return true;
      }
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: BaseAppBar.custom(
          leading: widget.mUpgradeInfo.force != true ? BackButton(color: R.color.mainTextColor) : Container(),
          title: Text(
            K.update_tips,
            style: TextStyle(color: R.color.mainTextColor, fontSize: 22),
          ),
        ),
        body: Container(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 30, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsetsDirectional.only(bottom: 15),
                child: Text(
                  widget.mUpgradeInfo.versionName ?? '',
                  style: R.textStyle.subhead,
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.only(top: 15, bottom: 35),
                child: Text(
                  widget.mUpgradeInfo.message ?? '',
                  style: R.textStyle.subhead,
                ),
              ),
              GestureDetector(
                onTap: _onUpgradeTaped,
                child: Container(
                  height: 48,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    _getProgressText(),
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  _onDownloadProgress(int received, int total) {
    Log.d("in State _onDownloadProgress: download $received / $total");
    mProgress = received / total;
    Log.d("in State _onDownloadProgress: progress $mProgress");
    _refresh();
  }

  String _getProgressText() {
    String progressText = mIsDownloading ? "${K.the_download_progress}：${(mProgress * 100).toStringAsFixed(2)}%" : K.update_now;
    Log.d("in State _getProgressText: $progressText");
    return progressText;
  }
}

class UpgradeTipsDialog extends StatefulWidget {
  final UpgradeInfo info;

  const UpgradeTipsDialog({Key? key, required this.info}) : super(key: key);

  @override
  _UpgradeTipsDialogState createState() => _UpgradeTipsDialogState();
}

class _UpgradeTipsDialogState extends State<UpgradeTipsDialog> {
  late UpgradeInfo upgradeInfo;

  @override
  void initState() {
    super.initState();
    upgradeInfo = widget.info;
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      if (upgradeInfo.force ?? false) {
        return false;
      } else {
        return true;
      }
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.2),
        body: AlertDialog(
          backgroundColor: R.color.dialogBgColor,
          title: Text(
            "${K.there_is_new_version} V${upgradeInfo.versionName}",
            style: R.textStyle.subhead,
          ),
          content: Text(
            upgradeInfo.message ?? '',
            style: TextStyle(fontSize: 16.0, color: R.color.secondTextColor),
          ),
          actions: <Widget>[
            if (_needShowLeftButton(upgradeInfo))
              CupertinoButton(
                onPressed: () {
                  if (upgradeInfo.force ?? false) {
                    _showUpgradeWebsite(upgradeInfo);
                  } else {
                    Upgrade.dismissDialog();
                  }
                },
                child: Text(
                  upgradeInfo.force == true ? K.go_official_website : K.cancel,
                  style: TextStyle(color: R.color.mainBrandColor, fontSize: 14),
                ),
              ),
            CupertinoButton(
              onPressed: () {
                if (Util.isAndroid) {
                  Upgrade.dismissDialog();
                  //打开立即更新页面
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpgradeScreen(mUpgradeInfo: upgradeInfo),
                    ),
                  );
                } else {
                  SharedAppPlugin.gotoAppStoreDetailPage(upgradeInfo.appId ?? '');
                }
              },
              child: Text(
                K.update_now,
                style: TextStyle(color: R.color.mainBrandColor, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _needShowLeftButton(UpgradeInfo upgradeInfo) {
    //强制升级时，iOS左侧无按钮，Android下发的官网URL为空时左侧无按钮
    if (upgradeInfo.force ?? false) {
      if (!Util.isAndroid || (Util.isAndroid && (upgradeInfo.gwUrl == null || upgradeInfo.gwUrl!.isEmpty))) {
        return false;
      }
    }

    return true;
  }

  void _showUpgradeWebsite(UpgradeInfo upgradeInfo) async {
    //去官网
    try {
      String url = upgradeInfo.gwUrl ?? '';
      if (Util.isAndroid) {
        SharedAppPlugin.showUpgradeWebsite(url);
      } else {
        launch(url);
      }
    } on PlatformException {
      Log.d("android_view_url error");
    }
  }
}
