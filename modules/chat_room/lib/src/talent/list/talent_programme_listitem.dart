import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/talent/add/talent_edit_panel.dart';
import 'package:chat_room/src/talent/data/talent_models.dart';
import 'package:chat_room/src/talent/vote/talent_vote_bottom_dialog.dart';

import '../talent_constants.dart';
import 'talent_list_line_widget.dart';

typedef ReloadCallback = void Function(int index);
typedef OnUpCallback = void Function(int index);
typedef OnDownCallback = void Function(int index);

/// 编辑节目单的列表项
class TalentProgrammeListItem extends StatefulWidget {
  final ChatRoomData room;
  final int index;
  final Program program;
  final bool isEditing;

  /// 是否表演中
  final bool performing;
  final ReloadCallback? reloadCallback;
  final OnUpCallback? onUpCallback;
  final OnDownCallback? onDownCallback;

  const TalentProgrammeListItem({
    required this.room,
    required this.index,
    required this.program,
    required this.isEditing,
    required this.performing,
    this.reloadCallback,
    this.onUpCallback,
    this.onDownCallback,
    super.key,
  });

  @override
  _TalentProgrammeListItemState createState() =>
      _TalentProgrammeListItemState();
}

class _TalentProgrammeListItemState extends State<TalentProgrammeListItem> {
  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      child: Stack(
        fit: StackFit.loose,
        children: [
          /// 左侧线
          positionListLineWidget(
            index: widget.index,
            performing: widget.performing,
            isEditing: widget.isEditing,
            onUpCallback: widget.onUpCallback,
            onDownCallback: widget.onDownCallback,
          ),

          Padding(
            padding: EdgeInsetsDirectional.only(
                start: widget.isEditing ? 40.dp : 31.dp,
                top: widget.isEditing ? 25.dp : 13.dp,
                end: 16.dp,
                bottom: 14.dp),
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
      ),
    );
  }

  /// 第一行
  Widget _buildLine1() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSerialName(),
        const Spacer(),
        if (!widget.isEditing) _buildVote(),
      ],
    );
  }

  // $1号歌手
  Widget _buildSerialName() {
    Color textColor;
    if (widget.performing) {
      textColor = const Color(0xFFDA69FF);
    } else {
      textColor = Colors.white.withOpacity(0.6);
    }

    return Row(
      children: [
        // 确保最低14dp高度
        SizedBox(height: 14.dp),
        if (widget.performing)
          Container(
            height: 14.dp,
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
        Text(
          K.room_talent_serial_name(['${widget.index + 1}']),
          style: TextStyle(color: textColor, fontSize: 10.dp, height: 1.1),
        ),
      ],
    );
  }

  Widget _buildVote() {
    return GestureDetector(
      onTap: () async {
        Navigator.of(System.context).pop();
        TalentVoteBottomDialog.showBottomDialog(
          System.context,
          widget.room,
          widget.program.id,
          widget.program.anchor!,
          widget.performing,
        );
      },
      child: _buildVoteContainer(widget.program.myVoteNum > 0),
    );
  }

  // 去投票
  Widget _buildVoteContainer(bool voted) {
    Color bgColor =
        voted ? talentPrimaryColor : talentMainTxtColor.withOpacity(0.2);
    Color txtColor =
        voted ? talentPrimaryColor : talentMainTxtColor.withOpacity(0.6);
    return Container(
      height: 22.dp,
      padding: EdgeInsetsDirectional.only(
        start: 2.dp,
        end: 6.dp,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.dp),
        border: Border.all(color: bgColor, width: 1.dp),
      ),
      child: Row(
        children: [
          R.img(
            voted
                ? RoomAssets.chat_room$talent_talent_star_webp
                : RoomAssets.chat_room$talent_talent_star_grey_webp,
            width: 15.dp,
            height: 15.dp,
          ),
          SizedBox(width: 1.dp),
          Text(
            '${widget.program.starNum}',
            style: TextStyle(color: txtColor, fontSize: 11.dp),
          ),
        ],
      ),
    );
  }

  /// 关注
  Widget _buildSubscribe() {
    if (widget.program.anchor?.uid == Session.uid) {
      return const SizedBox.shrink();
    }
    bool unFollowed = widget.program.follow == 0;

    return GestureDetector(
      onTap: () async {
        if (unFollowed) {
          NormalNull response = await BaseRequestManager.onFollow(
              '${widget.program.anchor?.uid ?? 0}');
          if (response.success) {
            widget.program.follow = 1;
            Fluttertoast.showToast(
                msg: K.followed, gravity: ToastGravity.CENTER);
            _refresh();
          } else {
            if (response.msg.isNotEmpty) {
              Fluttertoast.showToast(
                  msg: response.msg, gravity: ToastGravity.CENTER);
            }
          }
        }
      },
      child: Container(
        height: 28.dp,
        padding: EdgeInsets.symmetric(horizontal: 13.dp),
        alignment: Alignment.center,
        decoration: unFollowed
            ? BoxDecoration(
                gradient: const LinearGradient(
                  colors: buttonColors,
                ),
                borderRadius: BorderRadius.circular(14.dp),
              )
            : _editDecoration,
        child: Text(
          unFollowed ? K.room_talent_follow : K.followed,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.dp,
            height: 1.1,
          ),
        ),
      ),
    );
  }

  Widget _buildLine2() {
    CurrentAnchor anchor = widget.program.anchor!;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: anchor.inRid > 0
                            ? const Color(0xFFFF5F7D)
                            : Colors.transparent,
                        width: 2),
                    shape: BoxShape.circle),
                child: CommonAvatar(
                  path: widget.program.anchor?.icon ?? '',
                  size: 40.dp,
                  shape: BoxShape.circle,
                  onTap: () {
                    if (anchor.inRid > 0) {
                      IRoomManager manager = ComponentManager.instance
                          .getManager(ComponentManager.MANAGER_BASE_ROOM);
                      manager.openChatRoomScreenShow(context, anchor.inRid,
                          refer: 'talent_programme');
                    } else {
                      IPersonalDataManager manager = ComponentManager.instance
                          .getManager(ComponentManager.MANAGER_PERSONALDATA);
                      manager.openImageScreen(context, Session.uid);
                    }
                  },
                ),
              ),
            ),
            if (anchor.inRid > 0)
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFFF5F7D),
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      K.room_game_live_ing,
                      style: const TextStyle(color: Colors.white, fontSize: 9),
                    ),
                  ),
                ),
              )
          ],
        ),
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
        widget.isEditing ? _buildEditBtn() : _buildSubscribe(),
      ],
    );
  }

  Widget _buildName() {
    return Text(
      widget.program.anchor?.name ?? '',
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
      widget.program.intro,
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
    if (Util.isCollectionEmpty(widget.program.contents)) {
      return const SizedBox.shrink();
    }
    return Container(
      decoration: BoxDecoration(
          color: talentMainTxtColor.withOpacity(0.04),
          borderRadius: BorderRadius.circular(12.dp)),
      child: GridView.builder(
        itemCount: widget.program.contents.length,
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
          var e = widget.program.contents[index];
          return Padding(
            padding: EdgeInsetsDirectional.only(bottom: 3.dp),
            child: Text(
              '${1 + index} $e',
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
      onTap: () async {
        bool? refresh = await TalentEditPanel.show(context,
            room: widget.room,
            program: widget.program,
            position: widget.index + 1);
        Log.d(tag: TAG, 'add panel need refresh->$refresh');
        if (refresh == true) {
          widget.reloadCallback?.call(widget.index);
        }
      },
      child: Container(
        height: 28.dp,
        padding: EdgeInsets.symmetric(horizontal: 13.dp),
        alignment: Alignment.center,
        decoration: _editDecoration,
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

  final Decoration _editDecoration = BoxDecoration(
    border: Border.all(color: talentSecondTxtColor, width: 1.dp),
    borderRadius: BorderRadius.circular(14.dp),
  );

  _refresh() {
    if (mounted) setState(() {});
  }
}
