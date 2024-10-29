import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/vote/show/vote_view_controller_mixin.dart';
import 'package:chat_room/src/biz_plugin/vote/show/vote_view_model.dart';
import 'package:chat_room/src/biz_plugin/vote/show/widget/vote_time_count_down_widget.dart';
import 'package:chat_room/src/protobuf/generated/plugin_vote.pb.dart';
import 'package:flutter/material.dart';

/// 投票-多个用户最小化
class VoteMultiUerWidget extends StatefulWidget {
  final VoteViewModel viewModel;
  final VoidCallback? foldClick;

  const VoteMultiUerWidget(
      {super.key, required this.viewModel, this.foldClick});

  @override
  _VoteMultiUerWidgetState createState() => _VoteMultiUerWidgetState();
}

class _VoteMultiUerWidgetState extends State<VoteMultiUerWidget>
    with VoteViewControllerMixin<VoteMultiUerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.foldClick != null) widget.foldClick!();
      },
      child: Container(
        width: Util.width - 16.dp * 2,
        height: 114.dp,
        margin: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.dp),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                VoteTimeCountDownWidget(
                  width: 92.dp,
                  height: 20.dp,
                  fontSize: 12,
                ),
                SizedBox(height: 12.dp),
                _renderContent(),
              ],
            ),
            renderPkWidget(),
          ],
        ),
      ),
    );
  }

  Widget _renderContent() {
    Vote vote = widget.viewModel.vote!;
    int optionLen = vote.base.options.length;
    Widget content;
    if (optionLen <= 5) {
      content = Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: vote.base.options.map((e) => _renderItem(e, false)).toList(),
      );
    } else {
      content = Expanded(
        child: ListView.builder(
            padding: EdgeInsetsDirectional.only(start: 8.dp, end: 8.dp),
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: vote.base.options.length,
            itemBuilder: (content, index) {
              return _renderItem(vote.base.options[index], true);
            }),
      );
    }
    return content;
  }

  Widget _renderItem(VoteOptions item, bool showSeparated) {
    VoteDynamic? voteDynamic = widget.viewModel.getVoteData(item.id);
    Widget child = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                if (widget.viewModel.canVote(item)) {
                  await widget.viewModel.requestVote([item.id]);
                }
              },
              child: CommonAvatar(
                  path: item.user.icon, size: 40.dp, shape: BoxShape.circle),
            ),
            if (widget.viewModel.canVote(item) || item.isVote)
              PositionedDirectional(
                top: 28.dp,
                start: 0,
                end: 0,
                height: 19.dp,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    if (widget.viewModel.canVote(item)) {
                      await widget.viewModel.requestVote([item.id]);
                    }
                  },
                  child: Container(
                    width: 40.dp,
                    height: 19.dp,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.dp),
                      gradient: const LinearGradient(
                          colors: [Color(0xFF79E2FF), Color(0xFF60C8FF)]),
                    ),
                    child: Text(
                      item.isVote ? K.room_has_vote : K.vote,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 10.dp),
        Text(
          '${voteDynamic?.score ?? 0}${K.vote_ticket}',
          style: TextStyle(
              color: const Color(0xFF313131).withOpacity(0.4),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
    return showSeparated
        ? Padding(
            padding: EdgeInsetsDirectional.only(start: 10.dp, end: 10.dp),
            child: child,
          )
        : child;
  }
}
