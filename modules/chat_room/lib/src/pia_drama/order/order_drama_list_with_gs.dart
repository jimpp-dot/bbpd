import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';
import '../../protobuf/generated/piadrama.pb.dart';
import 'order_drama_list_widget.dart';

/// GS列表+单人本列表
class OrderDramaListWithGs extends StatefulWidget {
  final ChatRoomData room;
  final OnItemOrder onItemOrder;

  const OrderDramaListWithGs(
      {Key? key, required this.room, required this.onItemOrder})
      : super(key: key);

  @override
  OrderDramaListWithGsState createState() {
    return OrderDramaListWithGsState();
  }
}

class OrderDramaListWithGsState extends State<OrderDramaListWithGs> {
  int selectIndex = 0;
  RoomPosition? selectGs;

  @override
  Widget build(BuildContext context) {
    List<RoomPosition> gsList = getGsList();
    if (selectIndex >= gsList.length) {
      selectIndex = 0;
    }

    if (gsList.isEmpty) {
      selectGs = null;
      return Center(
        child: Text(
          K.room_debate_pk_select_user_empty,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      );
    }

    selectGs = gsList[selectIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildGsList(gsList),
        Expanded(
          child: OrderDramaListWidget(
            rid: widget.room.realRid,
            uid: selectGs!.uid,
            type: 1,
            onItemOrder: onItemOrder,
          ),
        ),
      ],
    );
  }

  Widget _buildGsList(List<RoomPosition> gsList) {
    return SizedBox(
      width: Util.width,
      height: 64,
      child: ListView.builder(
        padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: _buildGs(index, gsList[index]),
          );
        },
        itemCount: gsList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildGs(int index, RoomPosition pos) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
        });
      },
      child: selectIndex == index
          ? Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: R.color.mainBrandColor, width: 1),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: CommonAvatar(
                    path: pos.icon,
                    size: 38,
                    shape: BoxShape.circle,
                  ),
                ),
                PositionedDirectional(
                  top: 28,
                  start: 12,
                  child: R.img(
                    'ic_checkbox_checked.svg',
                    width: 16,
                    height: 16,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 4),
              child: CommonAvatar(
                path: pos.icon,
                size: 40,
                shape: BoxShape.circle,
              ),
            ),
    );
  }

  /// 可以展示自己的单人本，但是不能点自己的本
  /// 去掉老板位
  List<RoomPosition> getGsList() {
    List<RoomPosition> users;
    users = widget.room.positions.where((RoomPosition pos) {
      return pos.uid > 0 && !ChatRoomUtil.isBossChair(pos);
    }).toList();
    if ((widget.room.isEightPosition || widget.room.isFivePosition)) {
      /// pia戏玩法，开启房主位的房主，大概率是不在房间，把icon放在最后
      users.add(RoomPosition.fromCreator(widget.room.createor!));
    }

    return users;
  }

  void onItemOrder(PiaJuBen juben) {
    if (selectGs!.uid == Session.uid) {
      Fluttertoast.showCenter(msg: K.room_cant_order_self_drama);
      return;
    }

    widget.onItemOrder(juben);
  }
}
