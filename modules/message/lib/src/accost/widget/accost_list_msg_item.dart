import 'package:message/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/api_im_data.pb.dart';
import 'package:flutter/material.dart';
import 'package:message/src/model/private_hilist_model.dart';
import 'package:message/src/conversationOperateType.dart';
import 'package:shared/k.dart' as BaseK;

/// 私聊自动搭讪列表 消息Item
class AccostListMsgItem extends StatefulWidget {
  final PrivateHiListModel hiListModel;
  final OnConversationOperate onChanged;
  final OnDeleteByInner? onDeleteByInner;
  final int rid; //我自己所在房间id，_rid>0 表示在房间中

  const AccostListMsgItem(
      {super.key,
      required this.hiListModel,
      required this.onChanged,
      this.onDeleteByInner,
      this.rid = 0});

  @override
  State<StatefulWidget> createState() {
    return _AccostListMsgItemState();
  }
}

class _AccostListMsgItemState extends State<AccostListMsgItem> {
  SendUser? _sendUser;
  ConversationLastMessage? _message;
  ImUserData? _userItem;
  late Conversation _conversation;

  final IChatManager _chatManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);

  static const LOG_TAG = "_AccostListMsgItemState";

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    _conversation = widget.hiListModel.conversation;
    _message = _conversation.lastMessage;
    _sendUser = _message?.user;
    _userItem = widget.hiListModel.userInfo;
  }

  @override
  void didUpdateWidget(covariant AccostListMsgItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    initData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onItemTap,
        onLongPress: onLongTap,
        child: Container(
          padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  IPersonalDataManager personalDataManager = ComponentManager
                      .instance
                      .getManager(ComponentManager.MANAGER_PERSONALDATA);
                  personalDataManager.openImageScreen(
                      context, Util.parseInt(_conversation.targetId),
                      refer: const PageRefer('AccostList'));
                },
                child: CommonAvatar(
                  path: _userItem?.icon ?? _sendUser?.portraitUri,
                  size: 52,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          getName(),
                          style: TextStyle(
                              color: R.colors.mainTextColor, fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                        const SizedBox(width: 12),
                        _buildThirdText(Utility.getDateDiff(
                            widget.hiListModel.conversation.sentTime ~/ 1000)),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Expanded(child: _buildMessageContent()),
                        const SizedBox(width: 12),
                        _buildMessageStatus(),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 6),
            ],
          ),
        ));
  }

  void onItemTap() async {
    int uid = Util.parseInt(_conversation.targetId);
    UserInfo? info = await CachedNames.instance().get(uid, _conversation.type);
    _chatManager.openUserChatScreen(
      context,
      type: _conversation.type,
      targetId: Util.parseInt(_conversation.targetId),
      title: getName(),
      isFromHiList: true,
      official: info?.official ?? 0,
      refer: '${const PageRefer('AccostList')}',
    );
  }

  onLongTap() async {
    List<SheetItem> res = [];

    ///如果需要设置消息会话免打扰模式,那么需要转换自定义的ConversationType.Hi类型为融云对应的类型,否则报错
    res.add(SheetItem(BaseK.K.delete, "remove"));
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == 'remove') {
      bool ok = await Im.removeConversation(
          _conversation.type, _conversation.targetId);
      Log.d(tag: LOG_TAG, "remove result = $ok");

      ///删除操作（1.消息会话列表item中 2.消息会话进入的2级列表的item中）成功，需要消息(会话)列表合成操作结果并刷新
      if (ok) {
        widget.onChanged(ConversationOperateType.Delete, _conversation.type,
            _conversation.targetId);

        // HiList、AccostList、GroupList 等二级页面 删除时 通知当前页面移除Item
        widget.onDeleteByInner?.call(_conversation);
      }
    }
  }

  String getName() {
    if (_userItem != null) {
      return _userItem!.name;
    }

    if (_sendUser != null) {
      return _sendUser!.name ?? '';
    }
    return '';
  }

  Widget _buildMessageContent() {
    String? msgStr = _message?.content;
    if (_message?.extra != null && _message!.extra["type"] == "gift") {
      msgStr = K.msg_has_gift([_message!.content]);
    }

    return Text(
      msgStr ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: R.colors.secondTextColor,
        fontSize: 13,
      ),
    );
  }

  Widget _buildThirdText(String text) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: R.colors.thirdTextColor,
        fontSize: 13,
      ),
    );
  }

  Widget _buildMessageStatus() {
    bool hasConversation = widget.hiListModel.conversation != null;
    if (Session.joinBroker == true &&
        (widget.hiListModel.conversation.lastMessage?.user?.id ?? '') ==
            Session.uid.toString()) {
      /// 如果当前这个人是工会成员（即GS） && 最后一条消息是自己回的，则展示"已回"
      return Container(
        width: 36,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF313131).withOpacity(0.06),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          K.message_has_replied,
          style: TextStyle(
              color: const Color(0xFF313131).withOpacity(0.6),
              fontSize: 10,
              fontWeight: FontWeight.w500),
        ),
      );
    }
    if (hasConversation &&
        (widget.hiListModel.conversation.unreadCount ?? 0) <= 0) {
      /// 如果 unreadCount <= 0，则不显示红点（即已读）
      return const RedDot(width: 22, height: 22, showBorder: false, num: 0);
    } else if (hasConversation &&
        (widget.hiListModel.conversation.unreadCount ?? 0) > 0) {
      /// 如果 unreadCount > 0，则显示红点（即未读）
      return const RedDot(width: 22, height: 22, showBorder: false, num: null);
    }
    return const SizedBox.shrink();
  }
}
