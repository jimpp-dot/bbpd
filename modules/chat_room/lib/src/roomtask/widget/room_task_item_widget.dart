import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/roomtask/model/room_business_task.dart';
import 'package:chat_room/src/roomtask/model/room_task.dart';

typedef OnItemBtnTap = void Function(RoomTaskItem taskItem);

class RoomTaskItemWidget extends StatelessWidget {
  final RoomTaskItem taskItem;
  final bool todaySigned;
  final OnItemBtnTap? onItemBtnTap;

  const RoomTaskItemWidget(this.taskItem, this.todaySigned, this.onItemBtnTap,
      {super.key});

  String get btnText {
    if (taskItem.type == TaskType.signIn) {
      return todaySigned ? K.room_task_signed : K.room_task_signin;
    } else if (taskItem.taskIsComplete == true) {
      return K.room_task_has_done;
    } else if (taskItem.type == TaskType.online ||
        taskItem.type == TaskType.onMic) {
      return taskItem.isBusinessRoom ? K.room_go_complete : K.room_find_friends;
    } else if (taskItem.type == TaskType.sendGift) {
      return K.room_red_packet_gift_button;
    } else {
      return '';
    }
  }

  _onBtnTap() {
    if (onItemBtnTap != null) onItemBtnTap!(taskItem);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            width: 48,
            height: 48,
            imageUrl: taskItem.iconURL,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  taskItem.title,
                  style: TextStyle(color: R.color.mainTextColor, fontSize: 14),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: <Widget>[
                    if (taskItem.rateText.isNotEmpty)
                      Text(
                        taskItem.rateText,
                        style: TextStyle(
                            color: R.color.secondTextColor, fontSize: 12),
                      ),
                    if (taskItem.rateText.isNotEmpty)
                      const SizedBox(
                        width: 12,
                      ),
                    Text(
                      taskItem.bonusText,
                      style: const TextStyle(
                          color: Color(0xFFFDA252), fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: _onBtnTap,
            child: Container(
              height: 28,
              padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
              alignment: AlignmentDirectional.center,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient: (taskItem.type == TaskType.signIn && todaySigned) ||
                        (taskItem.taskIsComplete == true)
                    ? LinearGradient(colors: R.color.darkGradientColors)
                    : LinearGradient(colors: R.color.mainBrandGradientColors),
              ),
              child: Text(
                btnText,
                style: const TextStyle(fontSize: 13, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
