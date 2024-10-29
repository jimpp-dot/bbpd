import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';

class CrossPKListItem extends StatelessWidget {
  final RoomCrossPkRole item;
  final RoomCrossPKMode mode;
  final bool added; // 是否已添加到邀请
  final VoidCallback? onTapButton;

  const CrossPKListItem({
    Key? key,
    required this.item,
    this.mode = RoomCrossPKMode.ROOM_CROSS_PK_MODE_2,
    this.added = false,
    this.onTapButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, end: 10),
            child: CommonAvatar(
              path: item.icon,
              size: 40,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        item.name,
                        style: const TextStyle(
                            color: Color(0xFF313131), fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 4),
                      child: UserSexWidget(sex: item.sex, size: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    R.img(
                      RoomAssets.chat_room$crosspk_ic_people_svg,
                      width: 12,
                      height: 12,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 4),
                      child: Text(
                        '${item.audience}',
                        style: const TextStyle(
                            color: Color(0xFF737373), fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 12),
                    R.img(
                      RoomAssets.chat_room$crosspk_ic_hot_svg,
                      width: 12,
                      height: 12,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 4),
                      child: Text(
                        '${item.real}',
                        style: const TextStyle(
                            color: Color(0xFF737373), fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildBtn(),
        ],
      ),
    );
  }

  Widget _buildBtn() {
    if (item.state == 1) {
      return _buildPKing();
    } else {
      if (mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_2 ||
          mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_TOWER) {
        return _buildCanPK();
      } else {
        if (added == true) {
          return _buildAdded();
        } else {
          return _buildAdd();
        }
      }
    }
  }

  Widget _buildCanPK() {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        width: 63,
        height: 28,
        margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          K.room_invite_pk,
          style: const TextStyle(
              color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildPKing() {
    return Container(
      width: 63,
      height: 28,
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: R.color.mainBrandColor),
        color: Colors.black,
      ),
      child: Text(
        K.room_in_pk,
        style: TextStyle(
            color: R.color.mainBrandColor,
            fontSize: 13,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildAdd() {
    return GestureDetector(
      onTap: () {
        onTapButton?.call();
      },
      child: Container(
        width: 63,
        height: 28,
        margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          K.room_add,
          style: const TextStyle(
              color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildAdded() {
    return Container(
      width: 63,
      height: 28,
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(0xFFE4E7EE), Color(0xFFD5D8E0)]),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        K.room_already_added,
        style: const TextStyle(
            color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
      ),
    );
  }
}
