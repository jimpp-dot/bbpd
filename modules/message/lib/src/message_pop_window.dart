import 'package:message/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../message.dart';

/// 快乐星球的弹窗样式
class CommonMessagePopWindow extends StatelessWidget {
  final bool showRoom;
  final String? refer;

  const CommonMessagePopWindow({super.key, this.showRoom = true, this.refer});

  @override
  Widget build(BuildContext context) {
    return _buildPopWidget(context);
  }

  /// 添加朋友
  void _onTapAddFriend(BuildContext context) {
    Navigator.pop(context);
    if (Session.isLogined == false) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }
    FriendAddScreen.show(context, refer: refer ?? '');
  }

  /// 创建群组
  void _onTapGroupChat(BuildContext context) async {
    Navigator.pop(context);
    ContactPage.show(context, isStartNewChat: true);
  }

  /// 清理异常用户
  void _onTapClearUnusualUser(BuildContext context) async {
    bool? sure = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
              title: K.msg_clear_user,
              content: K.msg_clear_content,
              bgColor: R.colors.mainBgColor,
              titleTextColor: R.colors.mainTextColor,
              contentTextColor: R.colors.mainTextColor,
              negativeButton: NegativeButton(
                textColor: R.colors.secondTextColor,
                bgColor: R.colors.moduleBgColor,
              ));
        });
    if (sure == true) {
      NormalString resp = await Api.clearUnusualUsers();
      if (resp.data.isNotEmpty) {
        Fluttertoast.showToast(msg: resp.data, gravity: ToastGravity.CENTER);
      } else if (resp.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: resp.msg, gravity: ToastGravity.CENTER);
      }
    }
  }

  /// 我的房间
  void _onTapRoom(BuildContext context) {
    Navigator.pop(context);
    if (Session.isLogined == false) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openInitOperateDisplay(context, refer: refer);
  }

  Widget _buildPopWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 14),
      padding: const EdgeInsetsDirectional.only(
        top: 12,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: R.colors.mainBgColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildItem('ic_add_friend.svg', K.msg_add_friend,
              () => _onTapAddFriend(context)),
          _buildItem('ic_group_chat.svg', K.msg_start_group_chat,
              () => _onTapGroupChat(context)),
          _buildItem('ic_clear_user.svg', K.msg_clear_data,
              () => _onTapClearUnusualUser(context)),
          if (!Util.isAndroidVerify && showRoom == true)
            _buildItem('ic_my_room.svg', K.msg_my_room,
                () => _onTapRoom(Constant.context)),
        ],
      ),
    );
  }

  Widget _buildItem(String icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 24, end: 32, top: 12, bottom: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            R.img(
              icon,
              width: 24,
              height: 24,
              color: R.colors.mainTextColor,
              package: ComponentManager.MANAGER_MESSAGE,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8),
              child: Text(
                title,
                style: TextStyle(
                  color: R.colors.mainTextColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
