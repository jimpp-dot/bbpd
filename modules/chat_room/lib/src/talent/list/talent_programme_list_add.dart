import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/talent/add/talent_edit_panel.dart';

import '../talent_constants.dart';
import 'talent_programme_listitem.dart';

class TalentListItemAdd extends StatelessWidget {
  final ChatRoomData room;
  final ReloadCallback? reloadCallback;
  final int index;

  const TalentListItemAdd({
    required this.room,
    this.reloadCallback,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.dp,
      alignment: Alignment.topCenter,
      child: _buildLine(context),
    );
  }

  Widget _buildLine(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool? refresh = await TalentEditPanel.show(context, room: room);
        Log.d(tag: TAG, 'add panel need refresh->$refresh');
        if (refresh == true) {
          reloadCallback?.call(index);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.dp),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.add_circle_rounded,
                color: talentPrimaryColor,
              ),
              SizedBox(width: 4.dp),
              Text(
                K.talent_listitem_add,
                style: TextStyle(
                  color: talentPrimaryColor,
                  fontSize: 15.dp,
                ),
              )
            ],
          ),
          SizedBox(height: 6.dp),
          Text(
            K.room_talent_list_add_tip,
            style: TextStyle(color: talentSecondTxtColor, fontSize: 11.dp),
          ),
        ],
      ),
    );
  }
}
