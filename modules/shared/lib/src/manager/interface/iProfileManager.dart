import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../iResourceLoader.dart';

abstract class IProfileManager extends IResourceLoader {
  bool get showInviteCode;

  void initConfig(bool showInviteCode);

  Future openReceptionTask(BuildContext context, int rid);

  bool functionCenterShowRedDot();

  bool taskCenterShowRedDot();

  Future<dynamic> bottomSheetShowNewUserRankPage(BuildContext context);

  Future<dynamic> bottomSheetShowTransferUserPage(BuildContext context);

  Future<dynamic> openAuthenticateCenterPage(
      BuildContext context, bool supportGod,
      {bool supportRed = true,
      bool supportQualification = false,
      bool needRecommendBroker = false});

  Future openGsPhotoPage(BuildContext context);

  Future<void> openNewUserPayGs(BuildContext context);

  void openTaskCenter(BuildContext context);

  Future<void> openLoveTestIndexPage(BuildContext context);

  Future<void> openAnchorTaskScreen(BuildContext context,
      {bool isAide = false, bool isFullScreen = true});

  Future<void> showPersonallyTagsPage(BuildContext context);

  Future<void> showRecommendTagsGsPage(BuildContext context, List jsonData);

  Widget getLaunchAudioPlayPage(
      AdScreenAudioData audioData, int showTime, VoidCallback onClose);
}
