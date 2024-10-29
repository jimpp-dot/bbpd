import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';

import 'model/new_room_choose_anchor_item.dart';
import 'model/new_room_privilege_repo.dart';

/// 新人房间特权选择主播页面

class NewRoomChooseAnchorBottomSheet extends StatelessWidget {
  final int privilegeId;
  final int rid;
  final int uid;
  final List<NewRoomChooseAnchorItem> items;

  const NewRoomChooseAnchorBottomSheet({
    super.key,
    required this.privilegeId,
    required this.rid,
    required this.uid,
    required this.items,
  });

  /// 打开新人房间特权选择主播页面
  static Future<bool?> show(
    BuildContext context, {
    required ChatRoomData room,
    required int privilegeId,
  }) async {
    List<NewRoomChooseAnchorItem> items = [];
    if (room.positions.isNotEmpty) {
      for (final RoomPosition item in room.positions) {
        if (item.uid == Session.uid) {
          continue;
        }
        if (item.name.isNotEmpty) {
          items.add(NewRoomChooseAnchorItem(
              uid: item.uid, icon: item.icon, name: item.name));
        }
      }
    }

    return await displayModalBottomSheet(
      context: context,
      defineBarrierColor: Colors.black.withOpacity(0.4),
      fullscreenDialog: true,
      builder: (context) => NewRoomChooseAnchorBottomSheet(
        privilegeId: privilegeId,
        rid: room.rid,
        uid: room.uid ?? 0,
        items: items,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: Util.height - 224 - MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: AssetImage(RoomAssets
              .chat_room$new_room_privilege_new_room_privilege_bg_webp),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: Util.width,
            height: 44,
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: [
                /// 返回箭
                PositionedDirectional(
                  top: 2,
                  start: 12,
                  width: 24,
                  height: 24,
                  child: BackButton(
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),

                /// 标题
                Text(
                  K.room_choose_anchor_nav_title,
                  style: R.textStyle.medium18,
                ),

                /// 规则说明
                PositionedDirectional(
                  top: 10,
                  end: 12,
                  width: 24,
                  height: 24,
                  child: GestureDetector(
                    onTap: () {
                      String url = Util.getHelpUrlWithQStr('k122');
                      BaseWebviewScreen.show(context, url: url);
                    },
                    child: R.img(RoomAssets.chat_room$ic_info_svg,
                        color: Colors.white, width: 24, height: 24),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: items.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: _buildItemWidget,
                    itemCount: items.length,
                  )
                : const EmptyWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildItemWidget(BuildContext context, int index) {
    NewRoomChooseAnchorItem item = items[index];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 64,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CommonAvatar(
                            path: item.icon,
                            shape: BoxShape.circle,
                            size: 40,
                            onTap: () {
                              IPersonalDataManager personalDataManager =
                                  ComponentManager.instance.getManager(
                                      ComponentManager.MANAGER_PERSONALDATA);
                              personalDataManager.openImageScreen(context, uid);
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item.name,
                            style: TextStyle(
                                color: R.color.mainTextColor, fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 16)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () async {
                    // 单人使用逻辑
                    NormalNull resp = await NewRoomPrivilegeRepo.privilegeUse(
                        rid, privilegeId, item.uid.toString());
                    if (resp.success) {
                      Fluttertoast.showCenter(msg: K.room_use_succ);
                      Navigator.of(context).pop(true);
                    } else {
                      Fluttertoast.showCenter(
                          msg: resp.msg.isNotEmpty == true
                              ? resp.msg
                              : K.room_use_fail);
                    }
                  },
                  child: Container(
                    width: 63,
                    height: 28,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: LinearGradient(
                          colors: R.color.mainBrandGradientColors),
                    ),
                    child: Text(
                      K.room_topic_to_use,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
