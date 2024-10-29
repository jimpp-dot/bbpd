import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/model/function_center_bean.dart';
import 'package:profile/src/model/gs_task_bean.dart';
import 'package:profile/src/model/task_center_bean.dart';
import 'package:profile/src/new_user_pay_gs_collect_page.dart';
import 'package:profile/src/new_user_ranking_page.dart';
import 'package:profile/src/transfer_user_page.dart';
import 'package:profile/src/widget/function_center.dart';
import 'package:profile/src/widget/gs_task_widget.dart';
import 'package:profile/src/widget/task_center.dart';
import 'package:profile/src/love_test/love_test_index_page.dart';

import 'anchor_task/anchor_task_screen.dart';
import 'authenticate_center_page.dart';
import 'gs_photo_page.dart';
import 'launch_audio/launch_audio_play_page.dart';
import 'model/pb/generated/api_tone.pb.dart';
import 'widget/personality_labels_dialog.dart';
import 'widget/recommend_tags_gs_dialog.dart';

class ProfileManager extends IProfileManager {
  @override
  void initConfig(bool showInviteCode) {}

  /// 个人页tab是否展现邀请有礼
  @override
  bool get showInviteCode {
    return false; //新不夜初版先屏蔽
  }

  @override
  Future openReceptionTask(BuildContext context, int rid) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return GsTaskScreen(
        taskType: GsTaskType.receptionTask,
        rid: rid,
      );
    }));
  }

  @override
  bool functionCenterShowRedDot() {
    FunctionCenterBean? bean = FunctionCenterUtil.getFunctionCenterBean();
    if (bean != null && !Util.isCollectionEmpty(bean.items)) {
      for (int i = 0; i < bean.items.length; i++) {
        FunctionItem item = bean.items[i];
        if (!Util.isStringEmpty(item.tipType)) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  bool taskCenterShowRedDot() {
    TaskCenterBean? bean = TaskCenter.getBean();
    if (bean != null && !Util.isStringEmpty(bean.tips)) {
      return true;
    }
    return false;
  }

  @override
  Future<dynamic> bottomSheetShowNewUserRankPage(BuildContext context) {
    return BottomSheetNewUserRankPage.show(context);
  }

  @override
  Future<dynamic> bottomSheetShowTransferUserPage(BuildContext context) {
    return BottomSheetTransferUserPage.show(context);
  }

  @override
  Future<dynamic> openAuthenticateCenterPage(
      BuildContext context, bool supportGod,
      {bool supportRed = true,
      bool supportQualification = false,
      bool needRecommendBroker = false}) {
    return AuthenticateCenter.show(context, supportGod,
        supportRed: supportRed,
        supportQualification: supportQualification,
        needRecommendBroker: needRecommendBroker);
  }

  @override
  Future openGsPhotoPage(BuildContext context) {
    return GsPhotoPage.openGsPhotoPage(context);
  }

  @override
  Future<void> openNewUserPayGs(BuildContext context) {
    return NewUserPayCollectGsPage.show(context);
  }

  @override
  void openTaskCenter(BuildContext context) {
    MissionManager.gotoMissionCenter(context, initTab: MissionManager.TAB_TASK);
  }

  @override
  Future<void> openLoveTestIndexPage(BuildContext context) {
    return LoveTestIndexPage.show(context);
  }

  @override
  Future<void> openAnchorTaskScreen(BuildContext context,
      {bool isAide = false, bool isFullScreen = true}) {
    return AnchorTaskScreen.show(context,
        isAide: isAide, isFullScreen: isFullScreen);
  }

  @override
  Future<void> showPersonallyTagsPage(BuildContext context) {
    return PersonalityLbsDialog.show(context);
  }

  @override
  Future<void> showRecommendTagsGsPage(BuildContext context, List jsonData) {
    return RecommendTagsGsPage.show(context, jsonData);
  }

  @override
  Widget getLaunchAudioPlayPage(
      AdScreenAudioData audioData, int showTime, VoidCallback onClose) {
    return LaunchAudioPlayPage(
      ToneAudio(
        id: audioData.id,
        uid: audioData.uid,
        icon: audioData.icon,
        nickname: audioData.nickname,
        hotWord: audioData.hotWord,
        audioDuration: audioData.audioDuration,
        url: audioData.url,
        isUse: true,
      ),
      onClose: onClose,
      showTime: showTime,
      launchScreen: true,
    );
  }
}
