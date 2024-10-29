import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../protobuf/generated/nest.pb.dart';

/// 我的飞船，作为老板同时有多个私密房
class PrivateMyRoomPanel extends StatefulWidget {
  final int rid;

  const PrivateMyRoomPanel({super.key, required this.rid});

  @override
  PrivateMyRoomState createState() {
    return PrivateMyRoomState();
  }

  static Future<bool?> show({required BuildContext context, required int rid}) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.5,
      defineBarrierColor: Colors.transparent,
      builder: (context) {
        return PrivateMyRoomPanel(
          rid: rid,
        );
      },
    );
  }
}

class PrivateMyRoomState extends State<PrivateMyRoomPanel> {
  List<NestBossNestItem>? datas;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    String url = '${System.domain}go/room/nest/nestList?rid=${widget.rid}';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      ApiNestBossListResponse res =
          ApiNestBossListResponse.fromBuffer(response.bodyBytes);
      if (res.success == true) {
        datas = res.list;
      } else if (Util.validStr(res.message)) {
        Fluttertoast.showCenter(msg: res.message);
      }
    } catch (e) {
      Log.d(e.toString());
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// do nothing
      },
      child: Container(
        width: Util.width,
        height: 379,
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          ),
          color: Color(0xFF171621),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              K.room_my_private_room,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 10, end: 10),
              height: 1,
              color: Colors.white10,
            ),
            Expanded(
              child: Util.validList(datas)
                  ? ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsetsDirectional.only(
                          start: 20,
                          end: 20,
                          top: 16,
                          bottom: 16 + Util.iphoneXBottom),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 16),
                      itemCount: datas!.length,
                      cacheExtent: 48,
                      itemBuilder: (context, index) {
                        return buildItem(datas![index]);
                      },
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(NestBossNestItem item) {
    return SizedBox(
      width: Util.width - 20 - 20,
      child: Row(
        children: [
          CommonAvatar(
            path: item.user.icon,
            size: 48,
            shape: BoxShape.circle,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.user.name,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  item.gsInRoom == true
                      ? K.room_private_room_gs_in
                      : K.room_private_room_gs_out,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withOpacity(0.5),
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              if (widget.rid == item.room.rid) {
                Fluttertoast.showCenter(msg: K.room_has_in_this_room);
                return;
              }
              IRoomManager roomManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_BASE_ROOM);
              roomManager.openChatRoomScreenShow(context, item.room.rid,
                  refer: 'my_private_room');
            },
            child: Container(
              width: 63,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(16),
                gradient: LinearGradient(
                  colors: R.color.mainBrandGradientColors,
                ),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.room_join_anchor_room,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
