import 'package:flutter/material.dart';

import '../iResourceLoader.dart';

abstract class IMessageManager extends IResourceLoader {
  void openVisitorPage(BuildContext context, int time);

  bool useDingDongAsHiConvName();

  void setUseDingDongAsHiConvName(bool use);

  /// 打开房间私聊消息面板
  Future openChatMessagePanel(BuildContext context, {Key? key});

  /// 打开好友在玩列表页
  Future openFriendsPlayingPage(BuildContext context);

  /// 打开好友列表
  Future openContactPage(
    BuildContext context, {
    Key? key,
    ContactTab initialPage = ContactTab.friend,
    bool onlySelectUser = false,
    bool showFootprint = false,
  });

  StatelessWidget getSlpMessagePopWindow({bool showRoom = true, String? refer});

  /// 打开附近的人的匹配请求页
  Future openMatchRequestListPage(BuildContext context, int remainMatchNum);

  /// 打开打招呼页面
  Future openSayhiBottomSheet(BuildContext context, int remainMatchNum, {int newRequestNum = 0});

  /// 同意好友请求
  Future acceptMatchRequest(int uid);

  Widget getMessagePage();

  /// 打开房间私聊消息面板
  void openFriendAddPage(BuildContext context, {Key? key, bool showStranger = false, String refer = ''});

  /// 自动搭讪主设置页
  Future openAccostConfigPage(BuildContext context);

  // 手机通讯录页面
  void openPhoneFriendPage(BuildContext context);

  /// 快捷消息
  Widget quickMsgListView(ValueChanged<Map> onSend);

  /// 自动回复设置页
  Future openAutoReplyConfigPage(BuildContext context);

  /// 录制声音对话框
  Future openRecordAudioDialog(BuildContext context, {int maxRecordSeconds = 60, int minRecordSeconds = 5});

  /// 打开今日缘分弹窗
  Future openFateDialog(BuildContext context);

  /// 打开打赏消息（陌生人）页面
  Future openRewardStrangerScreen(BuildContext context);
}

enum ContactTab {
  friend, // 好友
  follow, // 关注
  fans, // 粉丝
  companion, //陪伴榜
  group, // 群组
}
