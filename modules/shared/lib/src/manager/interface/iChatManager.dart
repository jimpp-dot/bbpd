import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../iResourceLoader.dart';

abstract class IChatManager extends IResourceLoader {
  /// 打开聊天界面
  /// [type] 会话类型
  /// [targetId] 会话id
  /// [title] 标题
  Future openUserChatScreen(
    BuildContext context, {
    required String type,
    required int targetId,
    String? title,
    dynamic skillInfo,
    String? refer,
    String? extType,
    bool isFromHiList = false,
    int official = 0,
    bool fromRoomPanel = false,
    int hiMatchScore,
    VoidCallback? onPageLoad,
  });

  ///
  Widget getGifRemote({required String uri, VoidCallback? onComplete, bool loop = false, bool useCache = false, Key? key});

  /// [displayInvite] 私聊页是否展示邀约按钮
  void init({bool showOrder, bool displayInvite = true});

  bool showOrder();

  bool displayInvite();

  /// 收到他人在商城送的礼物弹出提示框
  void showReceivedGiftDialog(BuildContext context, Map data);

  /// 展示嗨歌在线匹配通知
  Future showHiMatchNotification(BuildContext context, Map data);

  /// 打开聊天证据页面
  Future<List<MessageContent>?> openChatEvidenceScreen(BuildContext context, {List<MessageContent>? msgList});

  /// 打开快捷回复分组页面
  Future showQuickReplyGroup(BuildContext context);

  /// 跳转到建联用户池页面
  Future showETCUserPoolPage(BuildContext context);

  /// 跳转到招呼数据页面
  Future showETCHiListPage(BuildContext context);
}
