import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_room/src/protobuf/generated/online_list.pb.dart';
import 'invite_private_room_logic.dart';
import '../../../k.dart';

/// 商业房创建关联小房：邀请用户列表:单个Tab
class InvitePrivateList extends StatefulWidget {
  /// 取哪个tab的数据
  final bool hasPermissionTab;

  const InvitePrivateList({Key? key, required this.hasPermissionTab})
      : super(key: key);

  @override
  InvitePrivateListState createState() {
    return InvitePrivateListState();
  }
}

class InvitePrivateListState extends State<InvitePrivateList>
    with AutomaticKeepAliveClientMixin {
  late InvitePrivateRoomLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.find<InvitePrivateRoomLogic>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GetBuilder<InvitePrivateRoomLogic>(builder: (logic) {
      List user =
          widget.hasPermissionTab ? logic.users : logic.noPermissionUsers;
      if (!Util.validList(user)) {
        return const Center(child: EmptyWidget());
      }
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(context, user[index]);
        },
        itemCount: user.length,
      );
    });
  }

  Widget _buildItem(BuildContext context, ListData data) {
    return GestureDetector(
      onTap: () async {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, data.uid,
            refer: const PageRefer('InviteRelativeRoomInvitePage'));
      },
      child: _buildItemWidget(data),
    );
  }

  Widget _buildItemWidget(ListData data) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 20.0, end: 20.0, top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          CommonAvatar(
            path: data.icon,
            shape: BoxShape.circle,
            size: 52,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${data.uid}',
                  style: TextStyle(
                    fontSize: 13,
                    color: R.color.thirdTextColor,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          _buildInviteButton(data.uid),
        ],
      ),
    );
  }

  Widget _buildInviteButton(int uid) {
    return GestureDetector(
      onTap: () {
        if (logic.inviteUids.contains(uid)) {
          logic.removeInviteUid(uid);
        } else {
          logic.addInviteUid(uid);
        }
      },
      child: Container(
        width: 63,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(14),
          gradient: LinearGradient(
            colors: R.color.mainBrandGradientColors
                .map((e) =>
                    e.withOpacity(logic.inviteUids.contains(uid) ? 0.5 : 1))
                .toList(),
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img(
              logic.inviteUids.contains(uid)
                  ? 'ic_has_add.png'
                  : 'ic_add_padding.png',
              width: 14,
              height: 14,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
            const SizedBox(width: 2),
            Text(
              K.room_share_invite,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.2,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
