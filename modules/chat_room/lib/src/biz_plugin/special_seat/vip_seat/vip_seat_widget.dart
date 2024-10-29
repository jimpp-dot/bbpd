import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/cupertino.dart';

import './vip_seat_detail_widget.dart';

/// vip 麦位or cp麦位
class VipSeatWidget extends StatelessWidget {
  final ChatRoomData room;
  final VipMicUserSimple? user;
  static double frameSize = 64;
  static double iconSize = 48;

  const VipSeatWidget(this.room, {Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: SizedBox(
        width: frameSize,
        height: frameSize,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ((user?.uid ?? 0) > 0) ? _buildUserIcon() : _buildEmptyIcon(),
            if (user?.frame.isNotEmpty ?? false)
              CachedNetworkImage(
                imageUrl: Util.getImgUrl(user?.frame ?? ''),
                width: frameSize,
                height: frameSize,
                cachedWidth: frameSize.px,
                cachedHeight: frameSize.px,
                fit: BoxFit.fill,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyIcon() {
    return Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF3D0B98).withOpacity(0.5),
        border: Border.all(
            width: 1, color: const Color(0xFFFFE46A).withOpacity(0.5)),
      ),
      alignment: AlignmentDirectional.center,
      child: R.img(RoomAssets.chat_room$boss_svg,
          width: 24, height: 24, package: ComponentManager.MANAGER_BASE_ROOM),
    );
  }

  Widget _buildUserIcon() {
    return CommonAvatar(
      path: user?.icon ?? '',
      size: iconSize,
      shape: BoxShape.circle,
      loadingWidget: const CupertinoActivityIndicator(),
    );
  }

  void _onTap(BuildContext context) {
    Tracker.instance.track(TrackEvent.vip_seat_click, properties: {
      'uid': Session.uid,
      'seat_uid': user?.uid ?? 0,
    });
    VipSeatDetailWidget.show(context, room: room);
  }
}
