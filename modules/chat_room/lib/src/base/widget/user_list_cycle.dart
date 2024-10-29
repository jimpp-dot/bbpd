import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/user_list_mixin.dart';
import 'package:flutter/material.dart';

import '../../../assets.dart';
import '../../../k.dart';
import '../../biz_plugin/juke_music/juke_music_util.dart';
import '../../biz_plugin/juke_music/model/juke_music_repos.dart';

/// 点唱厅，演唱中，弧形麦位
class UserListCycle extends StatefulWidget {
  final ChatRoomData room;
  final int singerId; // 当前正在演唱的歌手uid
  final int musicId; // 当前正在演唱的歌曲id
  final UserIconStyle iconStyle;

  const UserListCycle({
    Key? key,
    required this.room,
    this.singerId = 0,
    this.musicId = 0,
    this.iconStyle = UserIconStyle.Normal,
  }) : super(key: key);

  @override
  UserListCycleState createState() => UserListCycleState();
}

class UserListCycleState extends State<UserListCycle> with UserListMixin {
  final extraHeight = 48;
  int currSingerId = 0; //当前正在演唱的歌手uid
  int currMusicId = 0; // 当前正在演唱的歌曲id
  static const String _tag = "_UserListCycleState";

  @override
  void initState() {
    super.initState();
    currSingerId = widget.singerId;
    currMusicId = widget.musicId;
    Log.d(
        tag: _tag,
        "initState,currentSinger:$currSingerId,currMusicId:$currMusicId");
  }

  void refreshSinger(int singerId, int musicId) {
    Log.d(tag: _tag, "refreshSinger : $singerId,$musicId");
    currSingerId = singerId;
    currMusicId = musicId;
    refresh();
  }

  @override
  void initConfigs() {
    room = widget.room;
    iconStyle = widget.iconStyle;
    itemWidth = extraHeight + (IconStyles[iconStyle]?.width ?? IconSize.normal);
    otherLeftMargin = 0;
    firstLeftMargin = 0;
  }

  @override
  Widget buildContent() {
    int len = room.positions.length;
    List<Widget> children = [];
    RoomPosition? singerPosition;
    Log.d(tag: _tag, "buildContent,currentSingerId :$currSingerId");
    for (int i = 0; i < len; i++) {
      children.add(buildUserItem(room.positions[i], itemWidth));
      if (room.positions[i].uid == currSingerId) {
        singerPosition = room.positions[i];
      }
    }
    double parentSize = Util.width - 2 * 20;
    return Container(
        alignment: AlignmentDirectional.center,
        margin: EdgeInsetsDirectional.only(
          top: room.config?.types == RoomTypes.RadioDefend ? 8.0 : 4.0,
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CustomCircleLayout(
              childList: children,
              childSize: itemWidth,
              parentSize: parentSize,
              radius: 130,
              reverse: true,
            ),

            ///相对头像居中
            PositionedDirectional(
                width: 180,
                height: 180,
                top: (parentSize - 180 - extraHeight) / 2,
                child: singerPosition != null
                    ? _buildSinger(singerPosition)
                    : _buildEmpty())
          ],
        ));
  }

  Widget _buildSinger(RoomPosition position) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        PositionedDirectional(
            child: R.img(
                Util.resizeUrl(
                    "/static/music_order/music_order_singer_mic.webp",
                    rw: 180),
                width: 180,
                height: 180)),
        PositionedDirectional(
            child: CommonAvatar(
                path: position.icon, size: 110, shape: BoxShape.circle)),
        PositionedDirectional(
            bottom: 20,
            child: Column(
              children: [
                Container(
                  height: 21,
                  padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFFFFD1EE), Color(0xFFFF3B99)]),
                      borderRadius: BorderRadius.circular(10.5)),
                  child: Row(
                    children: [
                      R.img(RoomAssets.chat_room$juke_music_playing_webp,
                          color: Colors.white, height: 11),
                      Text(K.room_juke_singing,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(position.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.normal)),
                    const SizedBox(width: 2),
                    if (JukeMusicUtil.canOperate || Session.uid == currSingerId)
                      GestureDetector(
                        onTap: () {
                          _stop(currMusicId);
                        },
                        child: Container(
                          height: 15,
                          width: 26,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7.5),
                          ),
                          child: Text(K.room_juke_next,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 9,
                                  height: 1.1,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                  ],
                )
              ],
            )),
      ],
    );
  }

  Widget _buildEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 110,
          height: 110,
          margin: const EdgeInsetsDirectional.only(bottom: 3),
          decoration: const ShapeDecoration(
            color: Colors.black12,
            shape: StadiumBorder(
                side: BorderSide(color: Colors.white60, width: 1)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              R.img(RoomAssets.chat_room$jukemusic_ic_mic_webp,
                  width: 24, height: 24, fit: BoxFit.fitWidth),
            ],
          ),
        ),
        Text(K.room_wait_for_seated,
            style: const TextStyle(
                color: Colors.white60,
                fontSize: 11,
                fontWeight: FontWeight.normal))
      ],
    );
  }

  void _stop(int musicId) async {
    bool success =
        await JukeMusicRepos.stopMusic(rid: widget.room.rid, musicId: musicId);
    if (success && mounted) {
      Fluttertoast.showToast(msg: K.room_juke_sing_done);
    }
  }
}
