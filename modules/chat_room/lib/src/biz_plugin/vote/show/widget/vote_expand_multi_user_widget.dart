import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/vote/show/vote_view_controller_mixin.dart';
import 'package:chat_room/src/biz_plugin/vote/show/vote_view_model.dart';
import 'package:chat_room/src/biz_plugin/vote/show/widget/vote_time_count_down_widget.dart';
import 'package:chat_room/src/protobuf/generated/plugin_vote.pb.dart';
import 'package:flutter/material.dart';

/// 投票-多人PK
class VoteExpandMultiUserWidget extends StatefulWidget {
  final VoteViewModel viewModel;
  final VoidCallback? foldClick; // 最小化

  const VoteExpandMultiUserWidget(
      {super.key, required this.viewModel, this.foldClick});

  @override
  _VoteExpandMultiUserWidgetState createState() =>
      _VoteExpandMultiUserWidgetState();
}

class _VoteExpandMultiUserWidgetState extends State<VoteExpandMultiUserWidget>
    with VoteViewControllerMixin<VoteExpandMultiUserWidget> {
  final _itemHeight = 75.dp;

  @override
  Widget build(BuildContext context) {
    VoteViewModel viewModel = widget.viewModel;
    Vote vote = viewModel.vote!;
    return Container(
      width: Util.width - 16.dp * 2,
      constraints: BoxConstraints(
        maxHeight: Util.height * 2 / 3,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.dp),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          renderPkWidget(),
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
                    start: 20.dp, end: 20.dp, top: 14.dp),
                child: Text(
                  titleWithOption(vote),
                  style: const TextStyle(
                      color: Color(0xff313131),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 12.dp),
              _renderOptions(),
              SizedBox(height: 18.dp),
            ],
          ),
          PositionedDirectional(
            top: 8.dp,
            end: 8.dp,
            child: GestureDetector(
                onTap: () {
                  if (widget.foldClick != null) widget.foldClick!();
                },
                child: R.img(RoomAssets.chat_room$vote_ic_action_min_png,
                    width: 32.dp, height: 32.dp)),
          ),
        ],
      ),
    );
  }

  Widget _renderOptions() {
    List<VoteOptions> list = widget.viewModel.vote!.base.options;
    Widget listView = Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.only(start: 20.dp, end: 20.dp),
      padding: EdgeInsetsDirectional.only(top: 4.dp, bottom: 4.dp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(12.dp), bottom: Radius.circular(18.dp)),
        gradient: const LinearGradient(
          colors: [Color(0xFFF0F8FF), Color(0xFFFEF4FF)],
        ),
      ),
      child: ListView.builder(
        padding: EdgeInsetsDirectional.only(start: 12.dp, end: 12.dp),
        itemCount: list.length,
        itemBuilder: (context, index) {
          VoteOptions item = list[index];
          return _renderItem(item, index == list.length - 1);
        },
      ),
    );
    return list.length > 5
        ? Flexible(child: listView)
        : SizedBox(
            width: double.infinity,
            height: _itemHeight * list.length + 4.dp,
            child: listView,
          );
  }

  /// 单个选项
  Widget _renderItem(VoteOptions item, bool isLast) {
    OptionUser user = item.user;
    VoteDynamic? voteDynamic = widget.viewModel.getVoteData(item.id);
    return Container(
      width: double.infinity,
      height: _itemHeight,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(
                    color: Colors.black.withOpacity(0.08), width: 1.dp)),
      ),
      child: Row(
        children: [
          CommonAvatar(path: user.icon, shape: BoxShape.circle, size: 48.dp),
          SizedBox(width: 6.dp),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      const TextStyle(color: Color(0xFF313131), fontSize: 14)),
              SizedBox(height: 4.dp),
              LayoutBuilder(builder: (context, constraints) {
                double width = constraints.maxWidth;
                return SizedBox(
                  width: width,
                  height: 20.dp,
                  child: Stack(
                    children: [
                      Container(
                        width: width,
                        height: 20.dp,
                        decoration: BoxDecoration(
                          color: const Color(0xFFC4D4F8),
                          borderRadius: BorderRadius.circular(12.dp),
                        ),
                      ),
                      PositionedDirectional(
                        top: 0,
                        bottom: 0,
                        start: 0,
                        width: width * min((voteDynamic?.rate ?? 0) / 100, 1),
                        child: Container(
                          width: width,
                          height: 20.dp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.dp),
                            gradient: const LinearGradient(
                                colors: [Color(0xFF00DFFF), Color(0xFF008EFF)]),
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        end: 10.dp,
                        top: 0,
                        bottom: 0,
                        child: Text(
                          '${widget.viewModel.getVoteData(item.id)?.score ?? 0}${K.vote_ticket}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                );
              })
            ],
          )),
          SizedBox(width: 14.dp),
          _renderBtn(item),
        ],
      ),
    );
  }

  Widget _renderBtn(VoteOptions item) {
    bool isItemVote = item.isVote;
    List<Color> colorList;
    if (widget.viewModel.isVote && !widget.viewModel.isMulti && !item.isVote) {
      colorList = [
        Colors.black.withOpacity(0.3),
        Colors.black.withOpacity(0.3)
      ];
    } else {
      colorList = [const Color(0xFF79E2FF), const Color(0xFF60C8FF)];
    }
    return GestureDetector(
      onTap: () async {
        if (widget.viewModel.canVote(item)) {
          await widget.viewModel.requestVote([item.id]);
        }
      },
      child: Container(
        width: 54.dp,
        height: 27.dp,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.dp),
          gradient: LinearGradient(colors: colorList),
        ),
        child: Text(
          isItemVote ? K.room_has_vote : K.vote,
          style: const TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
