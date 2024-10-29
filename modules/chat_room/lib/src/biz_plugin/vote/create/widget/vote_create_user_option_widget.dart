import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/vote/create/vote_create_view_model.dart';
import 'package:chat_room/src/biz_plugin/vote/create/widget/vote_user_select_dialog.dart';
import 'package:chat_room/src/protobuf/generated/plugin_vote.pb.dart';
import 'package:flutter/material.dart';

/// 创建投票-按用户投票
class VoteCreateUserOptionWidget extends StatefulWidget {
  final VoteCreateViewModel viewModel;

  const VoteCreateUserOptionWidget({super.key, required this.viewModel});

  @override
  _VoteCreateUserOptionWidgetState createState() =>
      _VoteCreateUserOptionWidgetState();
}

class _VoteCreateUserOptionWidgetState
    extends State<VoteCreateUserOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
              top: 12.dp, bottom: 12.dp, start: 16.dp, end: 16.dp),
          child: Text(
            K.vote_select_user,
            style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
        _renderUserOption()
      ],
    );
  }

  /// 用户选项
  Widget _renderUserOption() {
    VoteCreateViewModel viewModel = widget.viewModel;
    List<Widget> children = [];
    for (OptionUser user in viewModel.info.users) {
      children.add(Column(
        children: [
          SizedBox(
            width: 47.dp,
            height: 47.dp,
            child: Stack(
              children: [
                PositionedDirectional(
                  start: 0,
                  bottom: 0,
                  width: 42.dp,
                  height: 42.dp,
                  child: CommonAvatar(
                      path: user.icon, size: 42.dp, shape: BoxShape.circle),
                ),
                PositionedDirectional(
                    top: 0.dp,
                    end: 0.dp,
                    width: 18.dp,
                    height: 18.dp,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            viewModel.info.users.removeWhere(
                                (element) => element.uid == user.uid);
                          });
                        },
                        child: R.img(RoomAssets.chat_room$vote_ic_delete_png,
                            width: 18.dp, height: 18.dp))),
              ],
            ),
          ),
          SizedBox(height: 4.dp),
          Container(
              width: 42.dp,
              alignment: AlignmentDirectional.center,
              padding: EdgeInsetsDirectional.only(end: 5.dp),
              child: Text(user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(color: R.color.secondTextColor, fontSize: 10))),
        ],
      ));
    }
    if (children.length < viewModel.voteRule!.optionMaxNum) {
      children.add(GestureDetector(
        onTap: () {
          List<OptionUser> list = widget.viewModel.room.positions
              .map((e) => OptionUser(uid: e.uid, name: e.name, icon: e.icon))
              .toList();
          showUserSelectDialog(context, list, viewModel.info.users)
              .whenComplete(() {
            if (mounted) setState(() {});
          });
        },
        child: Container(
          width: 42.dp,
          height: 42.dp,
          margin: EdgeInsetsDirectional.only(top: 5.dp),
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.dp),
            color: R.color.secondBgColor,
          ),
          child: Icon(Icons.add, size: 24.dp, color: R.color.secondTextColor),
        ),
      ));
    }
    return Padding(
      padding:
          EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp, bottom: 12.dp),
      child: Wrap(
        spacing: 16.dp,
        runSpacing: 16.dp,
        children: children,
      ),
    );
  }
}
