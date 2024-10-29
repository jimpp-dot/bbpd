import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/vote/show/vote_view_controller_mixin.dart';
import 'package:chat_room/src/biz_plugin/vote/show/vote_view_model.dart';
import 'package:chat_room/src/biz_plugin/vote/show/widget/vote_time_count_down_widget.dart';
import 'package:chat_room/src/protobuf/generated/plugin_vote.pb.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 投票-文本选项
class VoteExpandTextWidget extends StatefulWidget {
  final VoteViewModel viewModel;
  final VoidCallback? foldClick; // 最小化

  const VoteExpandTextWidget(
      {super.key, required this.viewModel, this.foldClick});

  @override
  _VoteExpandTextWidgetState createState() => _VoteExpandTextWidgetState();
}

class _VoteExpandTextWidgetState extends State<VoteExpandTextWidget>
    with VoteViewControllerMixin<VoteExpandTextWidget> {
  final List<int> _selectedIds = []; // 选择了哪些选项

  void _onItemClick(int id) {
    // 是否支持多选
    bool supportMulti = widget.viewModel.vote!.base.selectType == 1;
    if (_selectedIds.contains(id)) {
      _selectedIds.remove(id);
    } else {
      if (!supportMulti) {
        _selectedIds.clear();
      }
      _selectedIds.add(id);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    VoteViewModel viewModel = widget.viewModel;
    Vote vote = viewModel.vote!;
    return Container(
      width: Util.width - 16.dp * 2,
      constraints: BoxConstraints(
        maxHeight: 812.dp,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.dp),
        color: Colors.white,
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
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
                    start: 16.dp, end: 16.dp, top: 14.dp, bottom: 8.dp),
                child: Text(
                  titleWithOption(vote),
                  style: const TextStyle(
                      color: Color(0xff313131),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              _renderOptions(),
              SizedBox(height: 12.dp),
              viewModel.isVote
                  ? _renderCompleteBtn(vote)
                  : _renderActionBtn(vote),
              SizedBox(height: 12.dp),
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
    double itemHeight = 76.dp;
    Widget listView = ListView.builder(
      padding: EdgeInsetsDirectional.only(start: 20.dp, end: 20.dp),
      itemCount: list.length,
      itemBuilder: (context, index) {
        VoteOptions item = list[index];
        if (widget.viewModel.isVote) {
          return _renderResultItem(item);
        } else {
          return _selectedIds.contains(item.id)
              ? _renderSelectedItem(item)
              : _renderNormalItem(item);
        }
      },
    );
    return list.length > 5
        ? Flexible(child: listView)
        : SizedBox(
            width: double.infinity,
            height: itemHeight * list.length,
            child: listView,
          );
  }

  /// 未选择的item
  Widget _renderNormalItem(VoteOptions options) {
    return GestureDetector(
      onTap: () {
        _onItemClick(options.id);
      },
      child: Container(
        width: double.infinity,
        height: 68.dp,
        alignment: AlignmentDirectional.center,
        margin: EdgeInsetsDirectional.only(top: 8.dp),
        padding: EdgeInsetsDirectional.only(start: 12.dp, end: 15.dp),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFFF0F8FF), Color(0xFFFEF4FF)]),
          borderRadius: BorderRadius.circular(12.dp),
        ),
        child: Row(
          children: [
            Expanded(
                child: Text('${options.text.title}: ${options.text.content}',
                    style: const TextStyle(
                        color: Color(0xff313131), fontSize: 14))),
            SizedBox(width: 22.dp),
            Container(
              width: 18.dp,
              height: 18.dp,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF5D5F8), width: 1.dp),
                borderRadius: BorderRadius.circular(9.dp),
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 选中的item
  Widget _renderSelectedItem(VoteOptions options) {
    return GestureDetector(
      onTap: () {
        _onItemClick(options.id);
      },
      child: Container(
        width: double.infinity,
        height: 68.dp,
        margin: EdgeInsetsDirectional.only(top: 8.dp),
        alignment: AlignmentDirectional.center,
        padding: EdgeInsetsDirectional.only(start: 11.dp, end: 14.dp),
        decoration: BoxDecoration(
          color: const Color(0xFFAFE3FF).withOpacity(0.3),
          borderRadius: BorderRadius.circular(12.dp),
          border: Border.all(color: const Color(0xFF60C8FF), width: 1.dp),
        ),
        child: Row(
          children: [
            Expanded(
                child: Text('${options.text.title}: ${options.text.content}',
                    style: const TextStyle(
                        color: Color(0xff313131), fontSize: 14))),
            SizedBox(width: 22.dp),
            Container(
              width: 18.dp,
              height: 18.dp,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color(0xFF60C8FF).withOpacity(0.5),
                    width: 1.dp),
                borderRadius: BorderRadius.circular(9.dp),
                color: Colors.white,
              ),
              child: Container(
                width: 12.dp,
                height: 12.dp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.dp),
                  color: const Color(0xFF60C8FF),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 已选结果item
  Widget _renderResultItem(VoteOptions options) {
    VoteDynamic? voteData = widget.viewModel.getVoteData(options.id);
    bool isVote = options.isVote;
    Color color = const Color(0xFf858585);
    if (isVote) {
      color = const Color(0xFF60c8ff);
    }
    return Container(
      width: double.infinity,
      height: 68.dp,
      margin: EdgeInsetsDirectional.only(top: 8.dp),
      padding: EdgeInsetsDirectional.only(start: 12.dp),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        color: isVote
            ? const Color(0xFFAFE3FF).withOpacity(0.3)
            : const Color(0xFFEFF2F8),
        borderRadius: BorderRadius.circular(12.dp),
        border: isVote
            ? Border.all(color: const Color(0xFF60C8FF), width: 1.dp)
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Text('${options.text.title}: ${options.text.content}',
                  style:
                      const TextStyle(color: Color(0xff313131), fontSize: 14))),
          SizedBox(width: 10.dp),
          Container(
            width: 1.dp,
            height: 38.dp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.5.dp),
              color: color.withOpacity(0.3),
            ),
          ),
          Container(
            width: 60.dp,
            height: double.infinity,
            alignment: AlignmentDirectional.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${voteData?.score ?? 0}${K.vote_ticket}',
                    style: TextStyle(
                        color: color,
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 2.dp),
                Text('${voteData?.rate ?? 0}%',
                    style:
                        TextStyle(color: color.withOpacity(0.7), fontSize: 13)),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 已投按钮
  Widget _renderCompleteBtn(Vote vote) {
    String voteTitle = '';
    if (vote.base.options.isNotEmpty) {
      for (VoteOptions item in vote.base.options) {
        if (item.isVote) {
          VoteOptions? option = widget.viewModel.getVoteOption(item.id);
          if (option != null) {
            voteTitle += option.text.title;
          }
        }
      }
    }
    return Container(
      width: 264.dp,
      height: 48.dp,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24.dp),
      ),
      child: Text(K.vote_has_vote_option([voteTitle]),
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
    );
  }

  /// 确认投票按钮
  Widget _renderActionBtn(Vote vote) {
    bool enable = _selectedIds.isNotEmpty == true;
    return GestureDetector(
      onTap: () async {
        if (enable && !widget.viewModel.isVote) {
          await widget.viewModel.requestVote(_selectedIds);
        }
      },
      child: Container(
        width: 264.dp,
        height: 48.dp,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: enable
                  ? R.color.mainBrandGradientColors
                  : R.color.mainBrandGradientColors
                      .map((e) => e.withOpacity(0.5))
                      .toList()),
          borderRadius: BorderRadius.circular(24.dp),
        ),
        child: Text(K.appraiser_voting,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
