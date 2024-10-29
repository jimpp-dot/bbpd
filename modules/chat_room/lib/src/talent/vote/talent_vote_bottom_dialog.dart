import 'dart:ui';

import 'package:chat_room/k.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/talent/data/talent_models.dart';
import 'package:chat_room/src/talent/data/talent_repo.dart';
import 'package:chat_room/src/talent/talent_constants.dart';

import 'talent_vote_help_dialog.dart';

/// 支持主播底部弹窗
class TalentVoteBottomDialog extends StatefulWidget {
  final ChatRoomData room;
  final int programId;
  final CurrentAnchor anchor;
  final bool performing;

  const TalentVoteBottomDialog({
    super.key,
    required this.room,
    required this.programId,
    required this.anchor,
    required this.performing,
  });

  @override
  _TalentVoteBottomDialogState createState() => _TalentVoteBottomDialogState();

  static Future showBottomDialog(BuildContext context, ChatRoomData room,
      int programId, CurrentAnchor anchor, bool performing) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return TalentVoteBottomDialog(
          room: room,
          programId: programId,
          anchor: anchor,
          performing: performing,
        );
      },
    );
  }
}

class _TalentVoteBottomDialogState extends State<TalentVoteBottomDialog> {
  /// 当前用户的剩余星光数
  int? _myStarNum;

  @override
  void initState() {
    super.initState();
    _loadStarNum();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: 146.dp + Util.iphoneXBottom,
          decoration: BoxDecoration(
            color: const Color(0xB3171621),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.dp),
            ),
          ),
          child: Column(
            children: [
              /// 标题，星光值，说明入口
              _buildLine1(),

              Divider(color: const Color(0x14202020), height: 0.5.dp),

              // 主播头像名称，支持入口
              Padding(
                padding: EdgeInsetsDirectional.only(start: 16.dp, top: 16.dp),
                child: _buildLine2(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLine1() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: 16.dp, top: 16.dp, bottom: 16.dp),
          child: Text(
            K.room_talent_vote_title,
            style: TextStyle(
              color: talentMainTxtColor,
              fontSize: 16.dp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(),
        Row(
          children: [
            R.img(
              RoomAssets.chat_room$talent_talent_star_webp,
              width: 22.dp,
              height: 22.dp,
            ),
            SizedBox(width: 5.dp),
            _buildMyStar(),
            GestureDetector(
              onTap: _onTapHelp,
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 12.dp,
                  end: 15.dp,
                ),
                child: Icon(
                  Icons.help_outline_rounded,
                  color: talentMainTxtColor.withOpacity(0.7),
                  size: 22.dp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMyStar() {
    if (_myStarNum != null) {
      return Text(
        'x$_myStarNum',
        style: TextStyle(
          color: Colors.white,
          fontSize: 13.dp,
          height: 1.1,
        ),
      );
    }
    return SizedBox(width: 10.dp, height: 10.dp, child: const Loading());
  }

  Widget _buildLine2() {
    return Row(
      children: [
        CommonAvatar(
          path: widget.anchor.icon,
          size: 50.dp,
          shape: BoxShape.circle,
        ),
        SizedBox(width: 7.dp),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.anchor.name,
                style: TextStyle(
                  color: talentMainTxtColor,
                  fontSize: 16.dp,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (widget.performing == true)
                Row(
                  children: [
                    Container(
                      height: 14.dp,
                      margin: EdgeInsetsDirectional.only(end: 4.dp),
                      padding: EdgeInsetsDirectional.only(
                          start: 3.dp, end: 3.dp, top: 2.dp),
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
                      K.room_talent_performing,
                      style: TextStyle(
                        color: talentPrimaryColor.withOpacity(0.6),
                        fontSize: 12.dp,
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
        GestureDetector(
          onTap: _onTapSupport,
          child: Container(
            height: 28.dp,
            margin: EdgeInsetsDirectional.only(end: 15.dp),
            padding: EdgeInsets.symmetric(horizontal: 19.dp),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: buttonColors,
              ),
              borderRadius: BorderRadius.circular(16.dp),
            ),
            child: Text(
              K.room_talent_support,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.dp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onTapHelp() {
    TalentVoteHelpDialog.show(context, widget.room.rid);
  }

  Future<void> _onTapSupport() async {
    var resp = await TalentRepo.giveStar(programId: widget.programId);
    if (resp.success == true) {
      // 打赏成功
      _loadStarNum();
    } else if (resp.msg != null) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  void _loadStarNum() async {
    DataRsp<int> resp = await TalentRepo.getStarBg();
    if (resp.success == true) {
      _myStarNum = resp.data;
      _refresh();
    } else if (resp.msg != null) {
      Fluttertoast.showToast(msg: resp.msg);
    }
  }

  _refresh() {
    if (mounted) setState(() {});
  }
}
