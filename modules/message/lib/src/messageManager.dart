import 'package:flutter/material.dart';
import 'package:message/message.dart';
import 'package:message/src/accost/slp/slp_accost_config_page.dart';
import 'package:message/src/auto_reply/auto_reply_config_page.dart';
import 'package:message/src/message_list_page_new.dart';
import 'package:message/src/phone_friend_screen.dart';
import 'package:message/src/quick_msg/widget/quick_msg_list_view.dart';
import 'package:message/src/reward_stranger_widget.dart';
import 'package:message/src/room_message_panel.dart';
import 'package:message/src/visitor/visitor_page.dart';
import 'package:message/src/widget/record_audio_dialog.dart';
import 'package:shared/shared.dart';

import 'fate/fate_bottom_dialog.dart';

class MessageManager extends IMessageManager {
  MessageManager({bool initFamiliarCache = true}) {
    if (initFamiliarCache == true) {
      // 初始化familiar缓存
      FamiliarCache.instance.init();
    }
  }

  @override
  void openVisitorPage(BuildContext context, int time) {
    VisitorPage.show(context, time: time);
  }

  bool _useDingDongAsHiConvName = false;

  @override
  void setUseDingDongAsHiConvName(bool use) {
    _useDingDongAsHiConvName = use;
  }

  @override
  bool useDingDongAsHiConvName() {
    return _useDingDongAsHiConvName;
  }

  @override
  Future openChatMessagePanel(BuildContext context, {Key? key}) {
    return RoomMessagePanel.openRoomMessagePanel(context, key: key);
  }

  @override
  Future openFriendsPlayingPage(BuildContext context) {
    return FriendsPlayingPage.show(context);
  }

  @override
  Future openContactPage(
    BuildContext context, {
    Key? key,
    ContactTab initialPage = ContactTab.friend,
    bool onlySelectUser = false,
    bool showFootprint = false,
  }) {
    return ContactPage.show(
      context,
      key: key,
      initialPage: initialPage,
      onlySelectUser: onlySelectUser,
      showFootprint: showFootprint,
    );
  }

  @override
  StatelessWidget getSlpMessagePopWindow({bool showRoom = true, String? refer}) {
    return CommonMessagePopWindow(showRoom: showRoom, refer: refer);
  }

  @override
  Future openMatchRequestListPage(BuildContext context, int remainMatchNum) {
    return NearbyMatchRequestListPage.show(context, remainMatchNum);
  }

  @override
  Future openSayhiBottomSheet(BuildContext context, int remainMatchNum, {int newRequestNum = 0}) {
    return SayhiMatchBottomSheet.show(context, remainMatchNum, newRequestNum);
  }

  @override
  Future acceptMatchRequest(int uid) async {
    BaseResponse response = await Api.acceptMatchRequest(uid);
    return response.success;
  }

  @override
  Widget getMessagePage() {
    return const NewMessagePageScreen();
  }

  @override
  void openFriendAddPage(BuildContext context, {Key? key, bool showStranger = false, String refer = ''}) {
    FriendAddScreen.show(context, key: key, showStranger: showStranger, refer: refer);
  }

  @override
  Future openAccostConfigPage(BuildContext context) {
    return SlpAccostConfigPage.openSlpAccostConfigPage(context);
  }

  @override
  void openPhoneFriendPage(BuildContext context) {
    PhoneFriendScreen.show(context);
  }

  @override
  Widget quickMsgListView(ValueChanged<Map> onSend) {
    return QuickMsgListView(onSend: onSend);
  }

  @override
  Future openAutoReplyConfigPage(BuildContext context) {
    return AutoReplyConfigPage.show(context);
  }

  @override
  Future openRecordAudioDialog(BuildContext context, {int maxRecordSeconds = 60, int minRecordSeconds = 5}) {
    return RecordAudioDialog.openRecordAudioDialog(context, maxRecordSeconds: maxRecordSeconds, minRecordSeconds: minRecordSeconds);
  }

  @override
  Future openFateDialog(BuildContext context) {
    return FateBottomDialog.show(context);
  }

  @override
  Future openRewardStrangerScreen(BuildContext context) {
    return RewardStrangerWidget.show(context);
  }
}
