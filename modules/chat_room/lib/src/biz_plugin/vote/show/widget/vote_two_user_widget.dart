import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/vote/show/vote_view_model.dart';
import 'package:chat_room/src/biz_plugin/vote/show/widget/vote_user_option_progress_widget.dart';
import 'package:chat_room/src/protobuf/generated/plugin_vote.pb.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:provider/provider.dart' hide Selector;

/// 用户投票-两个用户PK
class VoteTwoUserWidget extends StatelessWidget {
  final VoteViewModel viewModel;
  final VoidCallback? foldClick;

  const VoteTwoUserWidget({super.key, required this.viewModel, this.foldClick});

  @override
  Widget build(BuildContext context) {
    List<VoteOptions> optionList = viewModel.vote!.base.options;
    VoteOptions leftOption = optionList[0];
    VoteOptions rightOption = optionList[1];
    VoteDynamic? leftDynamic = viewModel.getVoteData(leftOption.id);
    VoteDynamic? rightDynamic = viewModel.getVoteData(rightOption.id);
    return GestureDetector(
      onTap: () {
        if (foldClick != null) foldClick!();
      },
      child: Container(
        width: Util.width,
        height: 83.dp,
        margin: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
        child: Stack(
          alignment: AlignmentDirectional.center,
          clipBehavior: Clip.none,
          children: [
            PositionedDirectional(
              start: 0,
              end: 0,
              bottom: 0,
              child: VoteUserOptionProgress(
                left: leftDynamic,
                right: rightDynamic,
                width: Util.width - 16.dp * 2,
                height: 56.dp,
                radius: 16.dp,
                showText: false,
              ),
            ),
            PositionedDirectional(
                start: 15.dp,
                top: 0,
                child: _renderUser(
                    leftOption,
                    leftDynamic,
                    true,
                    viewModel.end &&
                        (leftDynamic?.score ?? 0) >
                            (rightDynamic?.score ?? 0))),
            PositionedDirectional(
                end: 15.dp,
                top: 0,
                child: _renderUser(
                    rightOption,
                    rightDynamic,
                    false,
                    viewModel.end &&
                        (leftDynamic?.score ?? 0) <
                            (rightDynamic?.score ?? 0))),
            PositionedDirectional(top: 14.dp, child: _TimerWidget()),
          ],
        ),
      ),
    );
  }

  Widget _renderUser(
      VoteOptions item, VoteDynamic? voteDynamic, bool left, bool win) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            Stack(
              children: [
                GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      if (viewModel.canVote(item)) {
                        await viewModel.requestVote([item.id]);
                      }
                    },
                    child: CommonAvatar(
                        path: item.user.icon,
                        size: 52.dp,
                        shape: BoxShape.circle)),
                if (win)
                  Container(
                    width: 52.dp,
                    height: 52.dp,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.dp),
                      color: Color(left ? 0xFFFF0DA4 : 0xFF3058FF)
                          .withOpacity(0.7),
                    ),
                    child: R.img(RoomAssets.chat_room$vote_ic_win_png,
                        width: 24.dp, height: 20.dp),
                  ),
              ],
            ),
            // 单选&已经投票&改选项为投票，则不显示投票按钮
            if (viewModel.canVote(item) || item.isVote)
              PositionedDirectional(
                top: 36.dp,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    if (viewModel.canVote(item)) {
                      await viewModel.requestVote([item.id]);
                    }
                  },
                  child: Container(
                    width: 46.dp,
                    height: 27.dp,
                    alignment: AlignmentDirectional.center,
                    padding: EdgeInsetsDirectional.only(bottom: 5.dp),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(item.isVote
                              ? RoomAssets.chat_room$vote_btn_gray_png
                              : RoomAssets.chat_room$vote_btn_black_png),
                          fit: BoxFit.fill),
                    ),
                    child: Text(
                      item.isVote ? K.room_has_vote : K.vote,
                      style: TextStyle(
                          color: item.isVote
                              ? (left
                                  ? const Color(0xFFFF44C6)
                                  : const Color(0xFF587AFF))
                              : Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            if (win)
              PositionedDirectional(
                top: -19.dp,
                child: R.img(RoomAssets.chat_room$vote_ic_king_png,
                    width: 29.dp, height: 19.dp),
              ),
          ],
        ),
        SizedBox(height: 8.dp),
        Text(
          '${voteDynamic?.score ?? 0}${K.vote_ticket}',
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

/// 倒计时widget
class _TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<_TimerWidget> {
  @override
  Widget build(BuildContext context) {
    int remainTime =
        context.select((VoteViewModel value) => value.remainTime) ?? 0;
    String desc;
    if (remainTime <= 0) {
      desc = K.room_has_end;
    } else {
      String time = Util.formatTimeToMinute(remainTime);
      desc = time;
    }
    return Container(
      width: 56.dp,
      height: 25.dp,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(13.dp),
      ),
      child: Text(
        desc,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}
