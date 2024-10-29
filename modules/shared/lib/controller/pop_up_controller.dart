import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../shared.dart';
import '../src/activity_dialog/activity_api.dart';
import '../src/activity_dialog/activity_dialog.dart';
import '../src/pbModel/generated/banban_popup.pb.dart';
import '../src/pbModel/generated/boot_app_dialog.pb.dart';
import '../src/pbModel/generated/checkin.pb.dart';
import '../src/sign/sign_api.dart';
import '../src/sign/sign_dialog.dart';

const bool debug = false;
const String tag = 'PopupController';

/// 首页弹窗业务Controller,首页弹窗以队列形式插入
/// 其中包括1.人脸识别弹窗；2:新人签到;3.安全手机号;4.Vip管家；5.青少年模式；6.ios评价弹窗, 8.活动弹窗
class PopupController {
  final HomePageState _pageState;
  static const String _tag = "PopupController";

  PopupController(HomePageState homePageState) : _pageState = homePageState;

  /// 1.人脸识别
  void checkFaceAuth(BuildContext context) async {
    if (!Session.isLogined) return;
    ResHomePopUpAuth resp = await BaseApi.loadFaceAuth();
    if (resp.success && resp.data.show) {
      ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
      settingManager.showFaceRecognitionDialog(
          firstTip: resp.data.firstTips, secondTip: resp.data.secondTips, canSkip: resp.data.supportCancel, auto: true);
    }
  }

  /// 2.新手签到
  Future<void> showSignPanel(BuildContext context) async {
    Log.d(tag: _tag, "rsp：${Session.isLogined}");
    if (!Session.isLogined) return;
    Log.d(tag: _tag, "rsp：${_pageState.isHomePageShowing}");
    if (_pageState.isHomePageShowing) {
      int nowTime = DateTime.now().millisecondsSinceEpoch;
      int lastShowTime = await HiveUtil.get<int>('${Session.uid}_${HiveBoxConstant.lastShowSignTime}', defaultValue: 0) ?? 0;
      if (!Utility.isSameDay(nowTime, lastShowTime)) {
        CheckInHomeRsp rsp = await SignApi.getSignHome(0);
        if (!rsp.success) {
          Log.d(tag: _tag, "showSignPanel:ignore,response error");
          return;
        }
        Log.d(tag: _tag, "rsp：${rsp}");
        bool showForwardCheckOnly = rsp.data.leftSeconds > 0 ? false : true; //仅展示进阶签到
        bool hasForwardCard = rsp.data.canNormal; //是否有进阶签到卡
        if (showForwardCheckOnly && !hasForwardCard) {
          if (Utility.isSameWeek(nowTime, lastShowTime)) {
            Log.d(tag: _tag, "showSignPanel:ignore,no forwardCard available and is same week");
            return;
          }
        }
        // SignDialog.show(context,
        //     defRookieData: rsp.data, pageStyle: showForwardCheckOnly ? PAGESTYLE.FORWARD_ONLY : PAGESTYLE.ROOKIE);

        SignDialog.show(context, defRookieData: rsp.data, pageStyle: PAGESTYLE.ROOKIE);

        HiveUtil.put<int>('${Session.uid}_${HiveBoxConstant.lastShowSignTime}', DateTime.now().millisecondsSinceEpoch);
      } else {
        Log.d(tag: _tag, "showSignPanel:ignore,same day");
      }
    } else {
      Log.d(tag: _tag, "showSignPanel:ignore,not in front");
    }
  }

  /// 3.检查是否需要弹绑定安全手机号弹窗
  Future<void> checkShowBindSafePhoneIfNeed(BuildContext context) async {
    if (!Session.isLogined) {
      return;
    }
    if (!Session.hasMobile) {
      int dateNow = DateTime.now().millisecondsSinceEpoch.toInt() ~/ 1000;
      int lastDate = Config.getInt(BBConfigKey.lastTimeShowBindSafePhoneAlert, 0);
      int dif = dateNow - lastDate;
      if (dif < 0) {
        Config.set(BBConfigKey.lastTimeShowBindSafePhoneAlert, dateNow.toString());
      }
      if (dif > (86400 * 7)) {
        ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
        bool canPhoneAuth = await loginManager.checkEnvAvailable();
        if (canPhoneAuth) {
          ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
          settingManager.openBindSafeMobileDialog(context);
          Config.set(BBConfigKey.lastTimeShowBindSafePhoneAlert, dateNow.toString());
        }
      }
    }
  }

  /// 4.检查是否弹SVIP管家弹框
  void checkShowSVipStewardDialog(BuildContext context, bool againShowSVipStewardDialog) {
    if (!Session.isLogined) return;

    ///总共三种弹窗，高潜用户，潜在用户，KA用户

    Map extra = {};
    bool showStockUserSVipStewardDialog = false;
    String data = Config.get('${Session.uid}_stock_user_add_ka_steward_data');
    if (Util.validStr(data)) {
      try {
        extra = json.decode(data);
      } catch (e) {
        Log.d("_checkShowSVipStewardDialog...$e");
      }
      if (extra.isNotEmpty) {
        if (Util.parseInt(extra['type']) == 1 || Util.parseInt(extra['type']) == 2) {
          KAUserDialog.show(context, extra);
          Config.delete('${Session.uid}_stock_user_add_ka_steward_data');
          return;
        } else {
          showStockUserSVipStewardDialog = true;
        }
      }
    }

    /// 如果type = 1 或者 type = 2 不走下面的逻辑
    if (showStockUserSVipStewardDialog && Config.getBool('${Session.uid}_stock_user_show_svip_steward_dialog', false)) {
      // 对存量用户进行KA建联弹框
      IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openAddSVipStewardDialog(context, extra, alwaysShow: true);
    } else if (Config.getBool('${Session.uid}_show_svip_steward_dialog', false) || againShowSVipStewardDialog) {
      // 对增量用户进行KA建联弹框
      IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openAddSVipStewardDialog(context, {}, oneOnly: true);
    }
  }

  /// 5.青少年模式弹窗
  void showJuvenilesGuideDialog() {
    ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.showJuvenilesGuideDialog();
  }

  /// 6.ios评价弹窗
  void showIosPreviewDialog(BuildContext context) {
    if (!Util.isAndroid && _pageState.isHomePageShowing) {
      AppIOSReviewDialog.show(context);
    }
  }

  /// 7.KA用户APP评价弹框
  void showKaEvaluateDialog(BuildContext context) {
    IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.showKaEvaluateDialog(context);
  }

  Future<void> loadActivityConfig(BuildContext context) async {
    if (!Session.isLogined) return;
    ApiBootAppResponse rsp = await ActivityApi.getActivityConfig();
    if (!rsp.success) {
      Log.d(tag: _tag, "showActivityDialog:ignore,response error");
      return;
    }
    for (BootAppPopup element in rsp.data.popups) {
      if (element.pType == BootAppPopupType.BootAppPopupTypeCommon) {
        // 通用弹窗
        showActivityDialog(context, element);
      }
    }
  }

  /// 8.活动弹窗:
  /// 需求：https://docs.google.com/document/d/1gzdRS_nBMHC8bJaX1rdMoIEWO4dJdfB-OWTACAZaF_4/edit
  Future<void> showActivityDialog(BuildContext context, BootAppPopup popUpData) async {
    int maxCount = popUpData.maxCount;
    // bizId 弹窗ID，区分BootAppPopupTypeCommon同类型的不同弹窗
    int hasShowCount =
        await HiveUtil.get<int>('${Session.uid}_${popUpData.bizId}_${HiveBoxConstant.showActivityDialog}', defaultValue: 0) ?? 0;
    if (hasShowCount >= maxCount) {
      return;
    }
    if (_pageState.isHomePageShowing) {
      await HiveUtil.put<int>('${Session.uid}_${popUpData.bizId}_${HiveBoxConstant.showActivityDialog}', hasShowCount + 1);
      BootActivityDialog.show(context, popUpData.commonData, popUpData.bizId);
    } else {
      Log.d(tag: _tag, "showActivityDialog:ignore,not in front");
    }
  }
}
