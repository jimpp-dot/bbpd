import 'package:chat/src/quick_reply/quick_reply_group_page.dart';
import 'package:shared/shared.dart';
import 'package:chat/src/match/match_notification.dart';
import 'package:chat/src/msg/received_gift_dialog.dart';
import 'package:flutter/material.dart';

import 'etc/etc_hi_history_page.dart';
import 'page/chat_evidence_screen.dart';
import 'etc/etc_user_pool_page.dart';
import 'userChatScreen.dart';
import 'widget/gif.dart';

class ChatManager extends IChatManager {
  @override
  Future openUserChatScreen(BuildContext context, {
    required String type,
    required int targetId,
    String? title,
    dynamic skillInfo,
    String? refer,
    String? extType,
    bool isFromHiList = false,
    int official = 0,
    bool isAbilityOrder = false,
    bool fromRoomPanel = false,
    int hiMatchScore = 0,
    VoidCallback? onPageLoad,
  }) async {
    UserChatScreen.openUserChatScreen(
      context,
      type: type,
      targetId: targetId,
      title: title,
      skillInfo: skillInfo,
      refer: refer,
      extType: extType,
      isFromHiList: isFromHiList,
      official: official,
      fromRoomPanel: fromRoomPanel,
      hiMatchScore: hiMatchScore,
      onPageLoad: onPageLoad,
    );
  }

  @override
  Widget getGifRemote({required String uri,
    VoidCallback? onComplete,
    bool loop = false,
    bool useCache = false,
    Key? key}) {
    return GifRemote(
      key: key,
      uri: uri,
      onComplete: onComplete,
      loop: loop,
      useCache: useCache,
    );
  }

  bool _showOrder = true;

  bool _displayInvite = true;

  @override
  void init({bool showOrder = true, bool displayInvite = true}) {
    _showOrder = showOrder;
    _displayInvite = displayInvite;
  }

  @override
  bool showOrder() {
    return _showOrder;
  }

  @override
  bool displayInvite() {
    return _displayInvite;
  }

  @override
  void showReceivedGiftDialog(BuildContext context, Map data) {
    ReceivedGiftDialog.show(context, data);
  }

  @override
  Future showHiMatchNotification(BuildContext context, Map data) {
    return MatchNotification.show(data);
  }

  @override
  Future<List<MessageContent>?> openChatEvidenceScreen(BuildContext context,
      {List<MessageContent>? msgList}) {
    return ChatEvidenceScreen.show(context, msgList);
  }

  /// 打开快捷回复分组页面
  @override
  Future showQuickReplyGroup(BuildContext context) {
    return QuickReplyGroupPage.launch(context);
  }

  @override
  Future showETCUserPoolPage(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ETCUserPoolPage(),
        settings: const RouteSettings(name: '/ETCUserPoolPage'),
      ),
    );
  }

  @override
  Future showETCHiListPage(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ETCHiHistoryPage(),
        settings: const RouteSettings(name: '/ETCHiListPage'),
      ),
    );
  }
}
