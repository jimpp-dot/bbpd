import 'package:shared/shared.dart';
import 'package:shared/model/report_type.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

/// 神秘人
///
class MysteryInfoPanelV1 extends StatelessWidget {
  final ChatRoomData room;
  final HomeProfileData profile;
  final int from; //0:房间坑位 1:公屏消息 2:其他 3: 世界频道

  const MysteryInfoPanelV1(this.profile, this.room, this.from, {Key? key})
      : super(key: key);

  _kickOut(BuildContext context) async {
    await ChatRoomUtil.kickOut(System.context,
        room: room, uid: profile.base.uid);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width,
      height: 485,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 37),
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl('static/personal/bg_mystery.webp'),
              width: Util.width,
              height: 448,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(top: 37),
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(16.0),
                topEnd: Radius.circular(16.0),
              ),
            ),
            alignment: AlignmentDirectional.topCenter,
            child: _buildHeaderNew(context),
          ),
          PositionedDirectional(
            top: 0,
            child: IgnorePointer(
              child: CachedNetworkImage(
                imageUrl:
                    Util.getRemoteImgUrl(profile.mysteryInfo.headerBanner),
                width: Util.width,
                fit: BoxFit.fitWidth,
                cachedWidth: Util.width.px,
              ),
            ),
          ),
          PositionedDirectional(
            top: 10,
            child: Column(
              children: [
                CommonAvatarWithFrame(
                  childWidget: CommonAvatar(
                    path: profile.base.icon,
                    size: 80.dp,
                    shape: BoxShape.circle,
                  ),
                  framePath:
                      Util.getRemoteImgUrl(profile.mysteryInfo.headerEffect),
                  overflow: -4.dp,
                  headerFrameSize: 88.dp,
                ),
                const SizedBox(height: 8),
                Text(
                  K.personaldata_mystery_user,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 举报 踢人
  Widget _buildHeaderNew(BuildContext context) {
    bool me = profile.base.uid == Session.uid;

    bool showKickOut = from != 3 &&
        profile.base.uid != Session.uid &&
        (room.purview == Purview.Createor ||
            room.purview == Purview.SuperAdmin) &&
        !(room.config != null &&
            room.config?.property == RoomProperty.Game &&
            room.config?.type == 'juben');

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          if (showKickOut)
            InkWell(
              onTap: () => _kickOut(context),
              child: Text(
                K.kick_out,
                style: TextStyle(
                    fontSize: 13, color: Colors.white.withOpacity(0.4)),
              ),
            ),
          if (showKickOut && !me)
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
              child: Container(
                  width: 1, height: 12, color: Colors.white.withOpacity(0.4)),
            ),
          if (!me)
            InkWell(
              onTap: () {
                Navigator.pop(context);
                IPersonalDataManager manager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                manager.openReportScreen(context,
                    uid: profile.base.uid, reportType: ReportType.User);
              },
              child: Text(
                K.report,
                style: TextStyle(
                    fontSize: 13, color: Colors.white.withOpacity(0.4)),
              ),
            ),
        ],
      ),
    );
  }
}
