import 'package:chat_room/chat_room.dart';
import 'package:get/get.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

import 'graffiti_gift_controller.dart';

/// 选择用户列表
class GraffitiGiftUserList extends StatelessWidget {
  const GraffitiGiftUserList({super.key});

  GraffitiGiftController get _controller => Get.find<GraffitiGiftController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GraffitiGiftController>(
      id: userListKey,
      builder: (controller) => Row(
        children: [
          _buildPrefix(),
          const SizedBox(width: 10),
          Expanded(child: _buildUserList()),
          const SizedBox(width: 10),
          _buildActionBtn(),
        ],
      ),
    );
  }

  Widget _buildPrefix() {
    return Text(
      K.room_bidding_send_gift,
      style: const TextStyle(
          color: Colors.white54, fontSize: 13, fontWeight: FontWeight.w400),
    );
  }

  Widget _buildUserList() {
    List<RoomPosition> list = _controller.userList;
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => _buildItem(list[index]),
      itemCount: list.length,
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    );
  }

  Widget _buildActionBtn() {
    bool isAllSelected = _controller.isAllSelected;
    return GestureDetector(
      onTap: _controller.onAllUserSelected,
      child: Container(
        width: 52,
        height: 30,
        alignment: AlignmentDirectional.center,
        decoration: isAllSelected
            ? const BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              )
            : BoxDecoration(
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
        child: Text(
          isAllSelected ? K.cancel : K.room_all_mic,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget _buildItem(RoomPosition item) {
    bool isSelected = _controller.isUserSelected(item.uid);
    return SizedBox(
      width: 32,
      height: 32,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          GestureDetector(
            onTap: () => _controller.onUserTap(item.uid),
            child: Container(
              width: 32,
              height: 32,
              decoration: isSelected
                  ? BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      border: Border.all(color: R.color.mainBrandColor),
                    )
                  : null,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: Util.squareResize(item.icon, 75),
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  errorWidget: R.img(BaseAssets.shared$ic_user_none_png,
                      width: 30, height: 30),
                ),
              ),
            ),
          ),
          if (isSelected)
            PositionedDirectional(
              top: 0,
              end: 0,
              child: R.img(RoomAssets.chat_room$ic_selected_main_brand_webp,
                  width: 12, height: 12),
            ),
        ],
      ),
    );
  }
}
