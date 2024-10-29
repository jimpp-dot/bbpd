import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

import '../../talent_new/talent_constants_new.dart';

class TalentListItemAddNew extends StatelessWidget {
  final ChatRoomData room;
  final VoidCallback addCallback;
  final int index;

  const TalentListItemAddNew({
    required this.room,
    required this.addCallback,
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
      onTap: addCallback,
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
