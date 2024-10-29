import 'dart:math';

import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/room_position_plugin.pb.dart';
import 'package:chat_room/src/base/widget/associated_room/associated_room_repo.dart';

class AssociatedRoomPendant extends StatefulWidget {
  final int rid;
  final int mainRid;

  const AssociatedRoomPendant(
      {super.key, required this.rid, required this.mainRid});

  @override
  State<AssociatedRoomPendant> createState() => _AssociatedRoomPendantState();
}

class _AssociatedRoomPendantState extends State<AssociatedRoomPendant> {
  final List<RoomChildrenRoomListItem> _roomList = [];

  /// 折叠状态
  bool _foldStatus = true;

  @override
  Widget build(BuildContext context) {
    return _foldStatus ? _buildFold() : _buildExpend();
  }

  Widget _buildFold() {
    return GestureDetector(
      onTap: _onExpandTap,
      child: Container(
        width: 38,
        height: 72,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(RoomAssets
                .chat_room$associated_ic_associated_room_entrance_bg_fold_webp),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          children: [
            R.img(
              RoomAssets.chat_room$associated_ic_associated_room_arrow_webp,
              width: 20,
              height: 72,
            ),
            R.img(
              widget.mainRid > 0
                  ? RoomAssets
                      .chat_room$associated_ic_associated_room_to_main_webp
                  : RoomAssets
                      .chat_room$associated_ic_associated_room_to_small_webp,
              width: 12,
              height: 58,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  double get _expandWidth => min(_roomList.length * 50 + 18, 180);

  Widget _buildExpend() {
    double width = _expandWidth;
    return SizedBox(
      width: width,
      height: 72,
      child: Stack(
        children: [
          PositionedDirectional(
            start: 0,
            child: R.img(
              RoomAssets
                  .chat_room$associated_ic_associated_room_entrance_bg_expend_webp,
              width: 180,
              height: 72,
            ),
          ),
          PositionedDirectional(
            end: 0,
            bottom: 0,
            child: R.img(
              RoomAssets
                  .chat_room$associated_ic_associated_room_entrance_extra_webp,
              width: 33,
              height: 35,
            ),
          ),
          SizedBox(
            width: width,
            height: 72,
            child: Row(
              children: [
                GestureDetector(
                  onTap: _onFoldTap,
                  child: Transform.rotate(
                    angle: pi,
                    child: R.img(
                      RoomAssets
                          .chat_room$associated_ic_associated_room_arrow_webp,
                      width: 20,
                      height: 72,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => _buildItem(_roomList[index]),
                    itemCount: _roomList.length,
                    itemExtent: 50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(RoomChildrenRoomListItem itemData) {
    return GestureDetector(
      onTap: () => _turn2Room(itemData.rid, fromRid: widget.rid),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 3, end: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFFCE78D)),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: R.img(Util.squareResize(itemData.icon, 100),
                    width: 38, height: 38),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              K.associated_room_item_name([
                (itemData.name.length >= 2
                    ? itemData.name.substring(0, 2)
                    : itemData.name),
              ]),
              style: const TextStyle(
                  color: Color(0xFFFCE78D),
                  fontSize: 9,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  /// 展开按钮点击事件
  void _onExpandTap() {
    if (widget.mainRid > 0) {
      // 返回主房间
      _turn2Room(widget.mainRid);
    } else {
      // 展开关联子房间列表
      _loadRoomList();
    }
  }

  /// 加载关联子房间列表
  void _loadRoomList() async {
    if (!_foldStatus) return;
    _foldStatus = false;
    RoomChildrenRoomListRsp resp =
        await AssociatedRoomRepo.getAssociatedRoomList(widget.rid);
    if (resp.success && resp.data.isNotEmpty) {
      // _roomList.clear();
      _roomList.addAll(resp.data);
      refresh();
    } else {
      _foldStatus = true;
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  /// 折叠按钮点击事件
  void _onFoldTap() {
    _foldStatus = true;
    refresh();
  }

  /// 跳转到指定房间
  void _turn2Room(int toRid, {int fromRid = 0}) {
    IRoomManager? roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    if (fromRid == 0) {
      // 返回主房间
      roomManager?.openChatRoomScreenShow(context, toRid);
    } else {
      // 跳转到关联子房间
      roomManager?.openChatRoomScreenShow(context, toRid, mainRid: fromRid);
    }
  }
}
