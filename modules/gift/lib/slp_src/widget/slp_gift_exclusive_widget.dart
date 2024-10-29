import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:gift/k.dart';
import 'package:flutter/material.dart';

/// 专属礼物
class SlpGiftExclusiveWidget extends StatelessWidget {
  final ExclusiveGiftInfo? data;
  final ChatRoomData? room;

  const SlpGiftExclusiveWidget({Key? key, required this.data, this.room})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if ((data?.next.uid ?? 0) > 0) {
          IRoomManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          manager.openRoomAdminScreen(
            context,
            rid: room?.rid ?? 0,
            purview: room?.purview,
            types: room?.config?.types,
            uid: room?.createor?.uid ?? 0,
            defaultTab: 'week',
          );
        }
      },
      child: Container(
        width: double.infinity,
        height: 52,
        margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
        child: GradientBorder(
          borderGradient: const LinearGradient(
            colors: [Color(0xFFFD81FF), Color(0xFF5CF0FF)],
          ),
          borderRadius: 12,
          borderWidth: 1,
          child: Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFC15DFF), Color(0xFF5A66FE)],
              ),
              borderRadius: BorderRadius.circular(11),
            ),
            alignment: AlignmentDirectional.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonAvatar(
                    path: data?.next.icon, size: 36, shape: BoxShape.circle),
                const SizedBox(width: 6),
                SizedBox(
                  width: 60,
                  child: Text(
                    data?.preAnnotation ?? '',
                    style: const TextStyle(
                      color: Color(0xFFF5D3B9),
                      fontSize: 10,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  width: 1,
                  height: 26,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    color: Color(0x66FFFFFF),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data?.notice ?? '',
                        style: const TextStyle(
                            color: Color(0xFFF5D3B9), fontSize: 11),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            K.gift_timer_counter,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            data?.tips ?? '',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                R.img(
                  'ic_next.svg',
                  width: 16,
                  height: 16,
                  color: Colors.white.withOpacity(0.5),
                  package: ComponentManager.MANAGER_PROFILE,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
