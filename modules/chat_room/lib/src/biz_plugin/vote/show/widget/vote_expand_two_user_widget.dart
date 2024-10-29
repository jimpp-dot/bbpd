import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/vote/show/vote_view_controller_mixin.dart';
import 'package:chat_room/src/biz_plugin/vote/show/vote_view_model.dart';
import 'package:chat_room/src/biz_plugin/vote/show/widget/vote_time_count_down_widget.dart';
import 'package:chat_room/src/biz_plugin/vote/show/widget/vote_user_option_progress_widget.dart';
import 'package:chat_room/src/protobuf/generated/plugin_vote.pb.dart';
import 'package:flutter/material.dart';

/// 投票-两人PK
class VoteExpandTwoUserWidget extends StatefulWidget {
  final VoteViewModel viewModel;
  final VoidCallback? foldClick; // 最小化

  const VoteExpandTwoUserWidget(
      {super.key, required this.viewModel, this.foldClick});

  @override
  _VoteExpandTwoUserWidgetState createState() =>
      _VoteExpandTwoUserWidgetState();
}

class _VoteExpandTwoUserWidgetState extends State<VoteExpandTwoUserWidget>
    with VoteViewControllerMixin<VoteExpandTwoUserWidget> {
  @override
  Widget build(BuildContext context) {
    VoteViewModel viewModel = widget.viewModel;
    List<VoteOptions> optionList = widget.viewModel.vote!.base.options;
    VoteOptions leftOption = optionList[0];
    VoteOptions rightOption = optionList[1];
    VoteDynamic? leftDynamic = viewModel.getVoteData(leftOption.id);
    VoteDynamic? rightDynamic = viewModel.getVoteData(rightOption.id);
    Vote vote = viewModel.vote!;
    double width = Util.width - 16.dp * 2;
    return Container(
      width: width,
      margin: EdgeInsetsDirectional.only(bottom: 50.dp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.dp),
        color: Colors.white,
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          VoteTimeCountDownWidget(
            width: 126.dp,
            height: 29.dp,
            fontSize: 15,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              VoteTimeCountDownWidget(
                width: 126.dp,
                height: 29.dp,
                fontSize: 15,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 16.dp, end: 16.dp, top: 14.dp),
                child: Text(
                  titleWithOption(vote),
                  style: const TextStyle(
                      color: Color(0xff313131),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 12.dp),
              _renderContent(
                  leftOption, rightOption, leftDynamic, rightDynamic),
              SizedBox(height: 16.dp),
            ],
          ),
          PositionedDirectional(
            top: 8.dp,
            end: 8.dp,
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (widget.foldClick != null) widget.foldClick!();
                },
                child: R.img(RoomAssets.chat_room$vote_ic_action_min_png,
                    width: 32.dp, height: 32.dp)),
          ),
          PositionedDirectional(
            start: 20,
            end: 20,
            bottom: 16.dp,
            height: 36.dp,
            child: VoteUserOptionProgress(
              width: width - 20.dp * 2,
              height: 36.dp,
              left: leftDynamic,
              right: rightDynamic,
            ),
          ),
        ],
      ),
    );
  }

  /// 投票PK用户
  Widget _renderContent(VoteOptions leftOption, VoteOptions rightOption,
      VoteDynamic? leftDynamic, VoteDynamic? rightDynamic) {
    return Container(
      width: double.infinity,
      height: 191.dp,
      margin: EdgeInsetsDirectional.only(start: 20.dp, end: 20.dp),
      padding: EdgeInsetsDirectional.only(top: 7.dp),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(0xFFF0F8FF), Color(0xFFFEF4FF)]),
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(12.dp), bottom: Radius.circular(18.dp)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              SizedBox(width: 5.dp),
              Expanded(
                  child: _renderUser(
                      true,
                      leftOption,
                      widget.viewModel.end &&
                          (leftDynamic?.score ?? 0) >
                              (rightDynamic?.score ?? 0))),
              R.img(RoomAssets.chat_room$vote_ic_pk_png,
                  width: 69.dp, height: 107.dp),
              Expanded(
                  child: _renderUser(
                      false,
                      rightOption,
                      widget.viewModel.end &&
                          (rightDynamic?.score ?? 0) >
                              (leftDynamic?.score ?? 0))),
              SizedBox(width: 5.dp),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _renderUser(bool left, VoteOptions item, bool win) {
    List<Color> btnColor = [const Color(0xFF79E2FF), const Color(0xFF60C8FF)];
    // 单选且没有被选中
    if (widget.viewModel.isVote && !item.isVote && !widget.viewModel.isMulti) {
      btnColor = [Colors.black.withOpacity(0.3), Colors.black.withOpacity(0.3)];
    } else if (left && item.isVote) {
      // 左边选项被选中
      btnColor = [const Color(0xFFFF029D), const Color(0xFFFF94F7)];
    }
    return Column(
      children: [
        win
            ? R.img(RoomAssets.chat_room$vote_ic_king_png,
                width: 29.dp, height: 19.dp)
            : SizedBox(height: 19.dp),
        Stack(
          children: [
            CommonAvatar(
                path: item.user.icon, size: 56.dp, shape: BoxShape.circle),
            if (win)
              Container(
                width: 56.dp,
                height: 56.dp,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28.dp),
                  color: Color(left ? 0xFFFF0DA4 : 0xFF3058FF).withOpacity(0.7),
                ),
                child: R.img(RoomAssets.chat_room$vote_ic_win_png,
                    width: 24.dp, height: 20.dp),
              )
          ],
        ),
        SizedBox(height: 3.dp),
        Text(
          cutOutName(item.user.name),
          maxLines: 1,
          style: TextStyle(
              fontSize: 12, color: const Color(0xFF313131).withOpacity(0.8)),
        ),
        SizedBox(height: 7.dp),
        GestureDetector(
          onTap: () {
            if (widget.viewModel.canVote(item)) {
              widget.viewModel.requestVote([item.id]);
            }
          },
          child: Container(
            width: 60.dp,
            height: 30.dp,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.dp),
              gradient: LinearGradient(
                colors: btnColor,
              ),
            ),
            child: Text(item.isVote ? K.room_has_vote : K.vote),
          ),
        )
      ],
    );
  }

  /// 显示最多5个字
  String cutOutName(String name) {
    if (name.length > 6) {
      name = name.substring(0, 5);
      name += '...';
    }
    return name;
  }
}
