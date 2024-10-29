import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

import '../../protobuf/generated/common_artcenter.pb.dart';
import '../talent_constants_new.dart';

/// 编辑节目单的列表项
class TalentProgrammeListItemNew extends StatefulWidget {
  final ChatRoomData room;
  final int index;
  final bool last;

  final ArtListItem program;

  /// 是否能编辑
  final bool isEditing;

  /// 是否有编辑权限
  final bool isPermission;

  final VoidCallback editCallback;

  const TalentProgrammeListItemNew({
    required this.room,
    required this.index,
    required this.last,
    required this.program,
    required this.isEditing,
    required this.isPermission,
    required this.editCallback,
    super.key,
  });

  @override
  _TalentProgrammeListItemNewState createState() =>
      _TalentProgrammeListItemNewState();
}

class _TalentProgrammeListItemNewState
    extends State<TalentProgrammeListItemNew> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildLeftLine(), // 左侧线
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: 31.dp, top: 8.dp, end: 16.dp, bottom: 16.dp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 圆圈序号,支持，关注
              _buildLine1(),
              SizedBox(height: 15.dp),

              // 头像，主播名称，星光数
              _buildLine2(),
              SizedBox(height: 10.dp),

              // 节目单列表
              _buildLine3(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLeftLine() {
    return PositionedDirectional(
      start: 14.dp,
      top: 0,
      bottom: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 11.dp),
          (widget.index > 0)
              ? _buildVerticalLine(9)
              : const SizedBox(height: 9),
          Container(
            width: 11.dp,
            height: 11.dp,
            alignment: AlignmentDirectional.center,
            child: (widget.program.onLive)
                ? ClipOval(
                    child: SizedBox(
                      width: 11.dp,
                      height: 11.dp,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFDA69FF),
                        ),
                      ),
                    ),
                  )
                : ClipOval(
                    child: SizedBox(
                      width: 7.dp,
                      height: 7.dp,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ),
          ),
          if (!widget.last) Expanded(child: _buildVerticalLine(0)),
        ],
      ),
    );
  }

  Widget _buildVerticalLine(int height) {
    return Container(
      width: 1.dp,
      height: height > 0 ? height.dp : double.infinity,
      color: Colors.white.withOpacity(0.1),
    );
  }

  /// 第一行
  Widget _buildLine1() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 15.dp), // 确保最低13dp高度
        _buildSerialName(),
        SizedBox(width: 6.dp),
        _buildSeparation(),
        SizedBox(width: 6.dp),
        _buildTime(),
        _buildRID(),
        const Spacer(),
        // if (!widget.isEditing) _buildVote(),
      ],
    );
  }

  // $1号主播
  Widget _buildSerialName() {
    Color textColor;
    if (widget.program.onLive) {
      textColor = const Color(0xFFDA69FF);
    } else {
      textColor = Colors.white.withOpacity(0.6);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.program.onLive) ...[
          Container(
            height: 15.dp,
            margin: EdgeInsetsDirectional.only(end: 3.dp),
            padding:
                EdgeInsetsDirectional.only(start: 3.dp, end: 3.dp, top: 2.dp),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: talentPrimaryColor,
              borderRadius: BorderRadius.circular(2.dp),
            ),
            child: Text(
              K.room_talent_current,
              style: TextStyle(
                color: Colors.white,
                fontSize: 9.dp,
                height: 1.1,
              ),
            ),
          ),
          SizedBox(width: 4.dp),
        ],
        Text(
          K.room_talent_anchor_name(['${widget.index + 1}']),
          style: TextStyle(color: textColor, fontSize: 10.dp, height: 1.1),
        ),
      ],
    );
  }

  // 分割竖线
  Widget _buildSeparation() {
    return SizedBox(
      width: 1.dp,
      height: 8.dp,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.3)),
      ),
    );
  }

  Widget _buildTime() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        R.img(RoomAssets.chat_room$talent_new_ic_room_talent_program_time_webp,
            width: 13.dp, height: 12.dp),
        SizedBox(width: 4.dp),
        Text(
          "${Utility.formatDateToHourAndMin(widget.program.startTime)}-${Utility.formatDateToHourAndMin(widget.program.endTime)}",
          style: TextStyle(
            color: (widget.program.onLive)
                ? Colors.white
                : Colors.white.withOpacity(0.4),
            fontSize: 11.dp,
          ),
        ),
      ],
    );
  }

  Widget _buildRID() {
    if (widget.isPermission) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 10.dp),
          _buildSeparation(),
          SizedBox(width: 4.dp),
          Text(
            K.talent_room_id,
            style: TextStyle(
              color: const Color(0x80FFFFFF),
              fontSize: 11.dp,
            ),
          ),
          Text(
            '${widget.program.contentRid}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11.dp,
            ),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  /// 关注
  Widget _buildSubscribe() {
    if (widget.program.contentUid == Session.uid) {
      return const SizedBox.shrink();
    }
    bool unFollowed = !widget.program.isFollow;

    return (unFollowed)
        ? GestureDetector(
            onTap: () async {
              NormalNull response = await BaseRequestManager.onFollow(
                  '${widget.program.contentUid}');
              if (response.success) {
                widget.program.isFollow = true;
                Fluttertoast.showToast(
                    msg: K.followed, gravity: ToastGravity.CENTER);
                refresh();
              } else {
                if (response.msg.isNotEmpty) {
                  Fluttertoast.showToast(
                      msg: response.msg, gravity: ToastGravity.CENTER);
                }
              }
            },
            child: Container(
              height: 28.dp,
              padding: EdgeInsets.symmetric(horizontal: 13.dp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: buttonColors,
                ),
                borderRadius: BorderRadius.circular(14.dp),
              ),
              child: Text(
                unFollowed ? K.room_talent_follow : K.followed,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.dp,
                  height: 1.1,
                ),
              ),
            ),
          )
        : const SizedBox();
  }

  Widget _buildLine2() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAvatar(),
        SizedBox(width: 10.dp),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildName(),
              SizedBox(height: 4.dp),
              _buildInfo(),
              // SizedBox(height: 3.dp),
              // _buildStarNum(),
            ],
          ),
        ),
        SizedBox(width: 8.dp),
        widget.isEditing ? _buildEditBtn() : _buildSubscribe(),
      ],
    );
  }

  Widget _buildAvatar() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        CommonAvatar(
          path: widget.program.contentUidIcon,
          size: 40.dp,
          shape: BoxShape.circle,
        ),
        if (widget.program.inRid > 0) ...[
          InkWell(
            onTap: () {
              IRoomManager roomManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_BASE_ROOM);
              roomManager.openChatRoomScreenShow(context, widget.program.inRid);
            },
            child: Container(
              width: 40.dp,
              height: 40.dp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.dp),
                border: Border.all(color: const Color(0xFFFF5F7D), width: 1.dp),
              ),
              child: Container(
                width: 39.dp,
                height: 39.dp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19.5.dp),
                  border: Border.all(color: Colors.white, width: 1.dp),
                ),
              ),
            ),
          ),
          PositionedDirectional(
              bottom: -2,
              child: Container(
                height: 14.dp,
                padding: EdgeInsets.symmetric(horizontal: 2.dp),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5F7D),
                  borderRadius: BorderRadius.circular(4.dp),
                ),
                child: Text(
                  widget.program.inRoomTip,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9.dp,
                  ),
                ),
              )),
        ],
      ],
    );
  }

  Widget _buildName() {
    return Text(
      widget.program.contentUidName,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15.dp,
        height: 1.1,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildInfo() {
    return Text(
      widget.program.contentUidSign,
      style: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 11.dp,
        height: 1.1,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildLine3() {
    List<String> contents = [];
    if (widget.program.contentDesc.isNotEmpty) {
      contents = widget.program.contentDesc.split(',');
    }
    if (Util.isCollectionEmpty(contents)) {
      return const SizedBox.shrink();
    }
    return Container(
      decoration: BoxDecoration(
          color: talentMainTxtColor.withOpacity(0.04),
          borderRadius: BorderRadius.circular(12.dp)),
      child: GridView.builder(
        itemCount: contents.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
          crossAxisCount: 2,
          mainAxisSpacing: 10.dp,
          crossAxisSpacing: 10.dp,
          height: 17.dp,
        ),
        primary: false,
        padding: EdgeInsets.all(8.dp),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          var e = contents[index];
          return Container(
            height: 17.dp,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              '${1 + index}  $e',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: talentSecondTxtColor,
                fontSize: 11.dp,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEditBtn() {
    return GestureDetector(
      onTap: widget.editCallback,
      child: Container(
        height: 28.dp,
        padding: EdgeInsets.symmetric(horizontal: 13.dp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: talentSecondTxtColor, width: 0.5.dp),
          borderRadius: BorderRadius.circular(14.dp),
        ),
        child: Text(
          K.room_talent_edit,
          style: TextStyle(
            color: talentMainTxtColor.withOpacity(0.6),
            fontSize: 13.dp,
          ),
        ),
      ),
    );
  }
}
