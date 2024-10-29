import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/util/god_tag_util.dart';
import 'package:chat_room/src/base/widget/user_icon_plugin.dart';
import 'package:flutter/material.dart';
import '../roomNavUtil.dart';
import 'live_config_v3.dart';
import 'package:intl/intl.dart';

/// 用户列表-麦上&麦下
class LiveUserListV3 extends StatefulWidget {
  final ChatRoomData room;

  const LiveUserListV3({Key? key, required this.room}) : super(key: key);

  @override
  State<LiveUserListV3> createState() => LiveUserListV3State();
}

class LiveUserListV3State extends State<LiveUserListV3> {
  final double userPaddingEnd = 16;
  final double userMarginVertical = 8;
  final double containerPaddingBottom = 24;

  Size get _itemSize =>
      IconStyles[UserIconStyle.Live] ?? const Size(44.0, 44.0);

  @override
  Widget build(BuildContext context) {
    if (widget.room.config == null || widget.room.config?.liveDataV3 == null) {
      return const SizedBox.shrink();
    }

    List<RoomPosition> onMicUser = _buildOnMicUsers();
    List<LiveOffMicItem> offMicUser =
        widget.room.config?.liveDataV3!.offMicItems ?? [];

    if (onMicUser.isEmpty && offMicUser.isEmpty) {
      return const SizedBox.shrink();
    }

    bool showTotalNum = (widget.room.config?.liveDataV3?.onlineNum ?? 0) > 0;

    String? totalNum;
    if (showTotalNum) {
      if (widget.room.config!.liveDataV3!.onlineNum < 10000) {
        totalNum = '${widget.room.config!.liveDataV3!.onlineNum}';
      } else {
        NumberFormat format = NumberFormat();
        double money;
        if (widget.room.config!.liveDataV3!.onlineNum < 100000) {
          money = widget.room.config!.liveDataV3!.onlineNum ~/
              100 *
              100 /
              10000; // 取小数点时不进行四舍五入
          format.maximumFractionDigits = 2;
        } else if (widget.room.config!.liveDataV3!.onlineNum < 1000000) {
          money = widget.room.config!.liveDataV3!.onlineNum ~/
              1000 *
              1000 /
              10000; // 取小数点时不进行四舍五入
          format.maximumFractionDigits = 1;
        } else {
          money = (widget.room.config!.liveDataV3!.onlineNum ~/ 10000)
              .toDouble(); // 取小数点时不进行四舍五入
          format.maximumFractionDigits = 0;
        }

        format.minimumFractionDigits = 0;
        totalNum = '${format.format(money)}W';
      }
    }

    return Container(
      width: Util.width,
      height: _itemSize.height +
          userMarginVertical +
          userMarginVertical +
          containerPaddingBottom,
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      alignment: Alignment.topCenter,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        slivers: <Widget>[
          // 在线用户数
          if (showTotalNum)
            SliverToBoxAdapter(
              child: Container(
                alignment: AlignmentDirectional.topCenter,
                padding: EdgeInsetsDirectional.only(
                    top: (_itemSize.height - 32) / 2 + userMarginVertical,
                    end: userPaddingEnd),
                child: GestureDetector(
                  onTap: () {
                    RoomNavUtil.openRoomAdminScreen(
                      context,
                      rid: widget.room.rid,
                      purview: widget.room.purview,
                      types: widget.room.config?.types,
                      fullScreenDialog: true,
                      uid: widget.room.createor?.uid ?? 0,
                    );
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      totalNum ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          // 麦上用户
          if (onMicUser.isNotEmpty)
            SliverToBoxAdapter(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: onMicUser.map((e) => _buildOnMicUserItem(e)).toList(),
              ),
            ),
          // 分割线
          if (onMicUser.isNotEmpty && offMicUser.isNotEmpty)
            SliverToBoxAdapter(
              child: Container(
                width: 2,
                margin: EdgeInsetsDirectional.only(
                  top: (_itemSize.height - 12) / 2 + userMarginVertical,
                  bottom: (_itemSize.height - 12) / 2 + userMarginVertical,
                  end: userPaddingEnd,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.21),
                ),
              ),
            ),
          // 麦下用户
          if (offMicUser.isNotEmpty)
            SliverFixedExtentList(
              itemExtent: userPaddingEnd + _itemSize.width,
              delegate: FixedExtentSliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  LiveOffMicItem item = offMicUser.elementAt(index);
                  return _buildOffMicUserItem(item);
                },
                childCount: offMicUser.length,
              ),
            ),
        ],
      ),
    );
  }

  // 麦上用户列表
  List<RoomPosition> _buildOnMicUsers() {
    List<RoomPosition> onMicUser = [];
    int index = widget.room.isEightPosition ? 0 : 1;
    for (; index < widget.room.positions.length; index++) {
      RoomPosition item = widget.room.positions[index];
      if (item.uid > 0) {
        // 麦上有用户
        onMicUser.add(item);
      }
    }
    onMicUser.sort((a, b) => b.knightLevel.compareTo(a.knightLevel));
    return onMicUser;
  }

  // 单个麦上用户
  Widget _buildOnMicUserItem(RoomPosition item) {
    String godTagIcon = GodTagUtil.getGodTagByUid(item.uid);
    return Container(
      width: userPaddingEnd + _itemSize.width,
      padding: EdgeInsetsDirectional.only(end: userPaddingEnd),
      margin: EdgeInsetsDirectional.only(
          top: userMarginVertical, bottom: userMarginVertical),
      child: Column(
        children: [
          UserIcon(
            room: widget.room,
            position: item,
            size: IconSize.live,
            plugins: [
              PunishPlugin(widget.room.config?.liveDataV3?.pkConfigV3?.pkPunish
                  ?.getUserIconPunish(item.uid)),
            ],
          ),
          if (!Util.isStringEmpty(godTagIcon))
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 3),
              child: R.img(godTagIcon, height: 12, fit: BoxFit.fitHeight),
            ),
        ],
      ),
    );
  }

  Widget _buildOffMicUserItem(LiveOffMicItem item) {
    return Container(
      padding: EdgeInsetsDirectional.only(end: userPaddingEnd),
      margin: EdgeInsetsDirectional.only(
          top: userMarginVertical, bottom: userMarginVertical),
      child: CommonAvatar(
        path: item.icon,
        size: _itemSize.width,
        shape: BoxShape.circle,
        onTap: () => _onOffMicUserTap(item.uid),
      ),
    );
  }

  void _onOffMicUserTap(int uid) {
    RoomNavUtil.goToImageScreenDialog(context, null, widget.room, userId: uid);
  }
}
