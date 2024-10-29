import 'package:certificate/src/page/certificate_detail_screen.dart';
import 'package:certificate/src/page/certificate_main_screen.dart';
import 'package:shared/shared.dart';
import 'package:certificate/src/certificate_icon.dart';
import 'package:certificate/src/godLicenseDialog.dart';
import 'package:flutter/material.dart';

import 'categoryInterestScreen.dart';
import 'page/certificate_healer_screen.dart';

class CertificateManager implements ICertificateManager {
  @override
  void loadStrings() {}

  @override
  Future openCertificateVerifyScreen(BuildContext context,
      {bool updateIcon = true}) {
    if (updateIcon) {
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CertificateIconScreen(),
          settings: const RouteSettings(name: '/certificateIconScreen'),
        ),
      );
    } else {
      return CertificateMainScreen.show(context);
    }
  }

  /// 打开兴趣选择页
  @override
  Future openCategoryInterestScreen(BuildContext context) {
    return CategoryInterestScreen.openCategoryInterestScreen(context);
  }

  @override
  Future getGodLicenseVersion() {
    return GodLicenseDialog.updateLicenseAndGetVersion();
  }

  @override
  Future openGodLicenseDialog(BuildContext context, int agreedVersion) {
    return GodLicenseDialog.show(context, agreedVersion);
  }

  /// 打开具体资质认证页面v2
  @override
  Future openCertificateResultScreenV2(
      BuildContext context, int cid, String name) {
    if (cid == 203) {
      return CertificateHealerScreen.showHealerScreen(context, cid, name);
    }
    return CertificateDetailScreen.show(context, cid, name);
  }
}
