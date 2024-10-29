import 'package:flutter/material.dart';

import '../iResourceLoader.dart';

abstract class ICertificateManager extends IResourceLoader {
  /// 打开添加新资质界面
  Future openCertificateVerifyScreen(BuildContext context,
      {bool updateIcon = true});

  /// 打开兴趣选择页
  Future openCategoryInterestScreen(BuildContext context);

  ///打开认证主播协议弹窗
  Future openGodLicenseDialog(BuildContext context, int agreedVersion);

  ///获取认证主播协议版本
  Future getGodLicenseVersion();

  /// 打开具体资质认证页面v2
  Future openCertificateResultScreenV2(
      BuildContext context, int cid, String name);
}
