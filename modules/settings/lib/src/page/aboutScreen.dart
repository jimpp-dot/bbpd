import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:settings/k.dart';
import 'package:settings/src/model/account_info_model.dart';
import 'package:settings/src/model/setting_repository.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';

/// 关于我们
class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AboutScreen(),
      settings: const RouteSettings(name: '/about'),
    ));
  }
}

class _ScreenState extends State<AboutScreen> {
  String version = '';
  String buildNumber = '';
  String fu = '';
  AboutInfo? _aboutInfo;
  final String _url = Util.happyxq.ccLinkUrl;
  String versionInfo = '';

  @override
  void initState() {
    super.initState();
    _init();
    _load();
  }

  _init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        version = packageInfo.version;
        buildNumber = packageInfo.buildNumber;
        versionInfo = "Version $version($buildNumber)";
      });
    }
  }

  void _load() async {
    DataRsp<AboutInfo> dataRsp = await SettingRepository.getAboutInfo();
    _aboutInfo = dataRsp.data;
    if (!mounted) return;
    if (!(dataRsp.success == true) || _aboutInfo == null) {
      return;
    }
    setState(() {});
  }

  Future<void> _launchURL() async {
    if (await canLaunch(_url)) {
      await launch(_url, forceSafariVC: false);
    } else {
      throw 'Could not launch $_url';
    }
  }

  Widget _buildLogo(double heightRatio) {
    return Center(
      child: Container(
        width: 88.0 * heightRatio,
        height: 88.0 * heightRatio,
        margin: EdgeInsets.only(top: 48 * heightRatio, bottom: 16.0 * heightRatio),
        child: R.img(
          Constant.logoPath,
          width: 88.0 * heightRatio,
          height: 88.0 * heightRatio,
          package: ComponentManager.MANAGER_BASE_CORE,
        ),
      ),
    ).onDoubleTap(() {
      setState(() {
        versionInfo = "Version $version($buildNumber) - ${DeviceInfo.channel}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightRatio = 0.89 * Util.height / 667;

    // if (kDebugMode) {
    //   versionInfo = "Version $version($buildNumber) - ${DeviceInfo.channel}";
    // }
    return Scaffold(
      appBar: BaseAppBar(
        K.setting_about_us,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backgroundColor: Colors.transparent,
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
      ),
      backgroundColor: R.colors.homeSecondBgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildLogo(heightRatio),
          Center(
            child: Text(
              Util.appName,
              style: TextStyle(fontSize: 17.0, color: R.color.mainTextColor, fontWeight: FontWeight.w500),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 2.0),
              child: Text(
                versionInfo,
                style: TextStyle(
                  color: R.color.secondTextColor,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 350),
          Center(
            child: Column(
              children: [
                const Text(
                  '联系我们',
                  style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "微信公众号:",
                      style: TextStyle(fontSize: 12.0, color: R.color.secondTextColor),
                    ),
                    const Text(
                      "  快乐星球App",
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _showOfficial,
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "官网:  ",
                        style: TextStyle(fontSize: 13.0, color: R.color.secondTextColor),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(158, 255, 78, 1),
                              width: 0.5, // Se the thickness of the bottom border
                            ),
                          ),
                        ),
                        child: Text(
                          Util.happyxq.ccLinkUrl,
                          style: const TextStyle(
                            fontSize: 13.0,
                            color: Color.fromRGBO(158, 255, 78, 1),
                            // decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _toICP,
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ICP备案：',
                        style: TextStyle(fontSize: 11, color: R.color.secondTextColor),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: R.color.secondTextColor,
                              width: 0.5, // Se the thickness of the bottom border
                            ),
                          ),
                        ),
                        child: Text(
                          '鄂ICP备2023014017号-3A',
                          style: TextStyle(
                            fontSize: 11,
                            color: R.color.secondTextColor,
                            // decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).withCommonBg();
  }

  bool isShowOfficial = false;

  showUserLicense(LicenseType licenseType) async {
    String fileName = 'agreement2.html';
    String title = BaseK.K.setting_user_protcol_agreement2;
    String url = Util.licenseUrl(LicenseType.USER_AGREEMENT2);
    if (licenseType == LicenseType.USER_AGREEMENT2) {
      fileName = 'agreement2.html';
      title = BaseK.K.setting_user_protcol_agreement2;
    } else if (licenseType == LicenseType.USER_AGREEMENT3) {
      fileName = 'agreement3.html';
      title = BaseK.K.setting_user_protcol_agreement3;
      url = Util.licenseUrl(LicenseType.USER_AGREEMENT3);
    }

    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$fileName');
    bool fileExist = false;
    try {
      fileExist = await file.exists();
    } catch (e) {
      Log.d(e);
    }
    if (fileExist) {
      BaseWebviewScreen.show(context, url: Uri.file(file.path).toString(), title: title);
    } else {
      BaseWebviewScreen.show(context, url: url, title: title);
    }
  }

  void _showOfficial() async {
    if (isShowOfficial) return;
    isShowOfficial = true;
    String uuid = await SettingRepository.getUuid(Session.uid);
    await launch(_aboutInfo?.fullUrl(Session.uid, uuid) ?? '', forceSafariVC: false);
    isShowOfficial = false;
  }

  void _toICP() {
    launch('https://beian.miit.gov.cn/state/outPortal/loginPortal.action/#/Integrated/index', forceSafariVC: false);
  }
}
