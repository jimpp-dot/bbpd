import 'package:message/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:message/src/model/message_beans.dart';
import 'package:pulse_log/pulse_log.dart';
import '../fate/fate_bottom_dialog.dart';

class NearByPersonWidget extends StatefulWidget {
  final NearbyUserList? data;
  final bool showFate;

  const NearByPersonWidget({super.key, this.data, this.showFate = false});

  @override
  State<StatefulWidget> createState() {
    return _NearByPersonWidgetState();
  }
}

class _NearByPersonWidgetState extends State<NearByPersonWidget> {
  @override
  Widget build(BuildContext context) {
    if (!Util.validList(widget.data?.list) && !widget.showFate) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: Text(
            K.msg_nearby_person,
            style: TextStyle(
                color: R.colors.mainTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 110,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.showFate) ...[
                const SizedBox(width: 16),
                _buildFate(),
                const SizedBox(width: 16),
                Container(
                  margin: const EdgeInsetsDirectional.only(top: 18),
                  width: 2,
                  height: 16,
                  color: R.colors.dividerColor,
                ),
              ],
              if (!Util.isCollectionEmpty(widget.data?.list))
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        _buildUserItem(widget.data!.list[index], index),
                    itemCount: widget.data!.list.length,
                  ),
                ),
            ],
          ),
        ),
        Divider(
            height: 0.5,
            color: R.colors.dividerColor,
            indent: 16,
            endIndent: 16),
      ],
    );
  }

  Widget _buildUserItem(NearbyUserItem item, int index) {
    bool start = index == 0;
    bool end = index == widget.data!.list.length - 1;
    return Container(
      margin:
          EdgeInsetsDirectional.only(start: start ? 10 : 0, end: end ? 10 : 0),
      alignment: AlignmentDirectional.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          StatusAvatar(
            roomName: item.roomTypeName,
            roomIcon: item.acuteIcon,
            colors: Util.parseColors(item.bgColors),
            userAvatar: item.icon,
            uid: item.uid,
            rid: item.rid,
            onTap: () {
              if (item.rid > 0) {
                Tracker.instance
                    .track(TrackEvent.nearby_playing_click, properties: {
                  'rid': item.rid,
                  'to_uid': item.uid,
                  'room_property': item.roomProperty ?? '',
                  'room_type': item.roomType ?? '',
                });

                IRoomManager roomManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_BASE_ROOM);
                roomManager.openChatRoomScreenShow(context, item.rid,
                    from: RoomFrom.message_nearby,
                    refer: "near_by_person",
                    uid: item.uid);

                PulseLog.instance.event('click_event', properties: {
                  'click_tag': 'home_message_nearby_room_${item.rid}',
                });
              } else {
                IPersonalDataManager personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openImageScreen(context, item.uid,
                    refer: const PageRefer("near_by_person"));

                PulseLog.instance.event('click_event', properties: {
                  'click_tag': 'home_message_nearby_user_${item.uid}',
                });
              }
            },
          ),
          Container(
            width: 70,
            height: 26,
            alignment: AlignmentDirectional.center,
            child: Text(
              item.name ?? '',
              style: TextStyle(
                  color: R.colors.mainTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            item.distanceStr,
            style: TextStyle(color: R.colors.secondTextColor, fontSize: 9),
          )
        ],
      ),
    );
  }

  Widget _buildFate() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        Tracker.instance.track(TrackEvent.luck_click, properties: {
          'entrance': 'message',
        });

        int? re = await FateBottomDialog.show(context);

        if (re != null && widget.data != null) {
          widget.data!.leftCount = re;
          setState(() {});
        }
      },
      child: Column(
        children: [
          const SizedBox(height: 2),
          CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl('static/message/ic_fate_new.webp'),
            width: 52,
            height: 52,
          ),
          const SizedBox(height: 8),
          Text(
            K.msg_fate,
            style: TextStyle(
              color: R.colors.mainTextColor,
              fontSize: 12,
              height: 1.2,
            ),
          ),
          if (widget.data != null) const SizedBox(height: 7),
          if (widget.data != null)
            Text(
              K.msg_left_count(['${widget.data!.leftCount}']),
              style: TextStyle(
                color: R.colors.secondaryBrandColor,
                fontSize: 9,
                height: 1.0,
              ),
            ),
        ],
      ),
    );
  }
}
