import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:gift/k.dart';
import 'package:flutter/material.dart';

/// 专属礼物
class SlpGiftNamingTipsWidget extends StatelessWidget {
  final BbGiftPanelGloryHourStarBanner data;
  final ChatRoomData? room;

  const SlpGiftNamingTipsWidget({Key? key, required this.data, this.room})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (room == null) return;
        if (data.jumpUrl.isNotEmpty) {
          SchemeUrlHelper.instance().jump(data.jumpUrl);
        } else {
          IRankManager rankManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_RANK);
          rankManager.showRankHoursDialog(context, room!.rid);
        }
      },
      child: Container(
        width: double.infinity,
        height: 54 + 8,
        margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
        child: Container(
          width: double.infinity,
          height: 54,
          margin: const EdgeInsets.all(1),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFF5A66FE), Color(0xFFC15DFF)]),
            borderRadius: BorderRadius.circular(11),
          ),
          alignment: AlignmentDirectional.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (data.rightIcon.isEmpty) ...[
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19),
                  ),
                  alignment: Alignment.center,
                  child: CommonAvatar(
                      path: data.leftIcon, size: 36, shape: BoxShape.circle),
                ),
              ] else ...[
                SizedBox(
                  width: 68,
                  height: 38,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(19),
                          ),
                          alignment: Alignment.center,
                          child: CommonAvatar(
                              path: data.leftIcon,
                              size: 36,
                              shape: BoxShape.circle),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(19),
                          ),
                          alignment: Alignment.center,
                          child: CommonAvatar(
                              path: data.rightIcon,
                              size: 36,
                              shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ),
                )
              ],
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      data.description,
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 4),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    K.gift_btn_activity_detail,
                    style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6A1FD3),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
