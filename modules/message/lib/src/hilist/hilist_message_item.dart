import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/api_im_data.pb.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:message/src/conversationOperateType.dart';
import 'package:message/src/model/private_hilist_model.dart';
import 'package:message/src/widget/in_room_label.dart';

import '../../k.dart';
import 'package:auto_size_text/auto_size_text.dart';

/// 私聊用户打招呼列表 消息Item
class HiListMessageItem extends StatefulWidget {
  final PrivateHiListModel hiListModel;
  final OnConversationOperate onChanged;
  final OnDeleteByInner? onDeleteByInner;
  final int rid; //我自己所在房间id，_rid>0 表示在房间中

  const HiListMessageItem({super.key, required this.hiListModel, required this.onChanged, this.onDeleteByInner, this.rid = 0});

  @override
  State<StatefulWidget> createState() {
    return _HiListMessageItemState();
  }
}

class _HiListMessageItemState extends State<HiListMessageItem> {
  SendUser? _sendUser;
  ConversationLastMessage? _message;
  ImUserData? _userItem;
  UserConfig? _userConfig;
  late Conversation _conversation;

  final IChatManager _chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);

  static const LOG_TAG = "_HiListMessageItemState";

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
    _userConfig = widget.hiListModel.userConfig;
  }

  @override
  void didUpdateWidget(covariant HiListMessageItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTap,
      onLongPress: onLongTap,
      child: Rext.themeCardContainer(
        cornerRadius: 16,
        margin: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        child: Column(
          children: [
            _buildUserInfo(),
            const SizedBox(
              height: 12,
            ),
            _buildMessageInfo(),
          ],
        ),
      ),
    );
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
      refer: '${const PageRefer('HiList')}',
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
      bool ok = await Im.removeConversation(_conversation.type, _conversation.targetId);
      Log.d(tag: LOG_TAG, "remove result = $ok");

      ///删除操作（1.消息会话列表item中 2.消息会话进入的2级列表的item中）成功，需要消息(会话)列表合成操作结果并刷新
      if (ok) {
        widget.onChanged(ConversationOperateType.Delete, _conversation.type, _conversation.targetId);

        // HiList、AccostList、GroupList 等二级页面 删除时 通知当前页面移除Item
        widget.onDeleteByInner?.call(_conversation);
      }
    }
  }

  Widget _buildUserInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openImageScreen(context, Util.parseInt(_conversation.targetId), refer: const PageRefer('HiList'));
              },
              child: CommonAvatar(
                path: Utility.formatImageUrl(userIcon),
                size: 64,
                shape: BoxShape.circle,
              ),
            ),
            _buildPhotoNum()
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(child: _buildLevelInfo()),
      ],
    );
  }

  Widget _buildPhotoNum() {
    if (_userItem != null && _userItem!.photoNum > 0) {
      return PositionedDirectional(
          bottom: 4,
          child: Container(
            decoration: ShapeDecoration(shape: const StadiumBorder(), color: Colors.black.withOpacity(0.7)),
            padding: const EdgeInsetsDirectional.only(start: 8, end: 8, top: 1, bottom: 1),
            child: Row(
              children: [
                R.img("message_ic_photo.png", package: ComponentManager.MANAGER_MESSAGE, width: 12, height: 12),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  _userItem!.photoNum > 99 ? "99+" : _userItem!.photoNum.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ));
    }
    return Container();
  }

  Widget _buildLevelInfo() {
    List<Widget> tagList = getUserTags();

    bool isMark = !Util.isCollectionEmpty(_userItem?.marks);

    String text = "";
    if (isMark) {
      text = _userItem!.marks.join("、");
    } else {
      String source = MessageFrom.getMessageFromByMap(_message?.extra);
      if (!Util.isStringEmpty(source)) {
        text = K.msg_hi_item_source([source]);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      getName(),
                      style: TextStyle(color: R.colors.mainTextColor, fontSize: 16, height: 1.1),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (showDaka() || showJiaren()) // 大咖外显 | 佳人外显
                    ...[
                    const SizedBox(width: 4),
                    showDaka() ? dakaWidget() : jiarenWidget(), // 优先显示大咖
                  ],
                ],
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            _buildOnlineState()
          ],
        ),
        SizedBox(
          height: getDividerHeight(),
        ),
        _userItem != null
            ? Row(mainAxisSize: MainAxisSize.min, children: tagList)
            : const SizedBox(
                height: 15,
              ),
        SizedBox(
          height: getDividerHeight(),
        ),
        if (!Util.isStringEmpty(text))
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: isMark ? R.colors.mainBrandColor : R.colors.secondTextColor, fontSize: 13),
          )
      ],
    );
  }

  String getName() {
    if (_userItem != null) {
      return _userItem!.name;
    }

    if (_sendUser != null) {
      return _sendUser!.name ?? '';
    }
    return "";
  }

  bool showDaka() {
    bool showDaka = false;
    if (_userItem != null) {
      // 快乐星球APP 且 此人是大咖
      showDaka = (_userItem!.daka == 1);
    }
    return showDaka;
  }

  bool showJiaren() {
    bool showJiaren = false;
    if (_userItem != null) {
      // 快乐星球APP 且 此人是大咖
      showJiaren = (_userItem!.jiaren == 1);
    }
    return showJiaren;
  }

  String get userIcon {
    if (_userItem != null) {
      return _userItem!.icon;
    }
    if (_sendUser != null) {
      return _sendUser!.portraitUri ?? '';
    }
    return "";
  }

  double getDividerHeight() => (_userItem != null && (_userItem!.vip > 0 || _userItem!.popularity > 0)) ? 2 : 4;

  List<Widget> getUserTags() {
    double padding = 4.0;

    List<Widget> tagList = [];

    if (_userItem == null) {
      return tagList;
    }

    tagList.add(
      UserSexAndAgeWidget(sex: _userItem!.sex, age: _userItem!.age),
    );

    //Log.d(LOG_TAG, "${_userItem.toString()}");

    //vip等级
    if (_userItem!.vip > 0) {
      tagList.add(Padding(
        padding: EdgeInsetsDirectional.only(start: padding),
        child: UserVipWidget(vip: _userItem!.vip),
      ));
    }

    //人气等级
    if (_userItem!.popularity > 0) {
      tagList.add(Padding(
        padding: EdgeInsetsDirectional.only(start: padding),
        child: UserPopularity(popularityLevel: _userItem!.popularity),
      ));
    }

    // 爵位
    if (!NobilityUtil.titleIsInvalid(_userItem!.titleNew)) {
      tagList.add(Padding(
        padding: EdgeInsetsDirectional.only(start: padding),
        child: UserNobilityWidget(titleNew: _userItem!.titleNew),
      ));
    }
    return tagList;
  }

  Widget _buildOnlineState() {
    // 在房间里
    if (_userConfig != null && _userConfig!.room != null && _userConfig!.room! > 0) {
      String text;
      List<Color> colors;
      if (_userConfig!.room == widget.rid) {
        //在同一房间
        text = K.msg_hi_list_in_same_room;
        colors = [const Color(0xFF60C8FF), const Color(0xFF62FAD7)];
      } else {
        text = !Util.isStringEmpty(_userConfig!.prefix) ? (_userConfig!.prefix ?? '') : BaseK.K.chat;
        colors = [const Color(0xFFEA6AFF), const Color(0xFF81DAFF)];
      }
      return InkWell(
        onTap: () {
          int rid = _userConfig!.room ?? 0;
          int uid = Util.parseInt(_userItem?.uid);
          IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager.openChatRoomScreenShow(context, rid, from: RoomFrom.follow_list, refer: 'message', uid: uid);
        },
        child: InRoomLabel(
          label: text,
          colors: colors,
        ),
      );
    } else if (_userItem?.onlineData.online ?? false) {
      //在线
      return _buildThirdText(K.msg_online_text);
    } else if ((_userItem?.onlineData.onlineDateline ?? 0) > 0) {
      // 多长时间以前在线
      return _buildThirdText(K.msg_how_long_online([Utility.getDateDiff(_userItem!.onlineData.onlineDateline)]));
    }
    return Container();
  }

  Widget _buildMessageInfo() {
    return Container(
      height: 28,
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 8),
      decoration: BoxDecoration(color: R.colors.homeBgColor.withOpacity(0.3), borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          _buildThirdText(Utility.getDateDiff(widget.hiListModel.conversation.sentTime ~/ 1000)),
          const SizedBox(
            width: 4,
          ),
          Expanded(child: _buildMessageContent()),
          _buildUnReadCount()
        ],
      ),
    );
  }

  Widget _buildMessageContent() {
    String msgStr = _message?.content ?? '';
    if (_message?.extra != null && _message?.extra["type"] == "gift") {
      msgStr = K.msg_has_gift([_message?.content ?? '']);
    }

    return AutoSizeText(
      msgStr,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: R.colors.secondTextColor,
        fontSize: 13,
      ),
    );
  }

  Widget _buildUnReadCount() {
    if (_conversation.unreadCount > 0) {
      return Container(
        width: 19,
        height: 16,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.imagePath("msg_unread_count_bg.png", package: ComponentManager.MANAGER_MESSAGE)),
            fit: BoxFit.cover,
          ),
        ),
        child: Text(
          _conversation.unreadCount > 99 ? "99+" : _conversation.unreadCount.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildThirdText(String text) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: R.colors.thirdTextColor,
        fontSize: 11,
      ),
    );
  }
}
