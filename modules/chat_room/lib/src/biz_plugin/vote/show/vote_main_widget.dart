import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/biz_plugin/vote/create/vote_create_view_model.dart';
import 'package:chat_room/src/biz_plugin/vote/show/vote_view_controller_mixin.dart';
import 'package:chat_room/src/biz_plugin/vote/show/vote_view_model.dart';
import 'package:chat_room/src/biz_plugin/vote/show/widget/vote_expand_multi_user_widget.dart';
import 'package:chat_room/src/biz_plugin/vote/show/widget/vote_expand_text_widget.dart';
import 'package:chat_room/src/biz_plugin/vote/show/widget/vote_expand_two_user_widget.dart';
import 'package:chat_room/src/biz_plugin/vote/show/widget/vote_multi_user_widget.dart';
import 'package:chat_room/src/biz_plugin/vote/show/widget/vote_time_count_down_widget.dart';
import 'package:chat_room/src/biz_plugin/vote/show/widget/vote_two_user_widget.dart';
import 'package:chat_room/src/chatRoomData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' hide Selector;

/// 房间投票显示widget
class VoteMainWidget extends StatefulWidget {
  final GlobalKey keyMessageList; // 公屏widget key
  final ChatRoomData room;

  const VoteMainWidget(
      {super.key, required this.keyMessageList, required this.room});

  @override
  _VoteMainWidgetState createState() => _VoteMainWidgetState();
}

class _VoteMainWidgetState extends State<VoteMainWidget>
    with VoteViewControllerMixin<VoteMainWidget> {
  late VoteViewModel _voteViewModel;
  double _topPosition = 0; // 最小化widget屏幕绝对Y坐标
  bool expand = true; // 最大化

  @override
  void initState() {
    super.initState();
    _voteViewModel = VoteViewModel(null)..init(widget.room);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      final renderObject =
          widget.keyMessageList.currentContext?.findRenderObject();
      if (renderObject is RenderBox) {
        Offset offset = renderObject.localToGlobal(Offset.zero);
        _topPosition = offset.dy;
      }
    });
  }

  @override
  void didUpdateWidget(covariant VoteMainWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _voteViewModel.tryFirstLoadData();
  }

  /// 最小化最大化切换
  void _switch() {
    if (!mounted) return;
    if (_voteViewModel.end && expand) {
      setState(() {
        _voteViewModel.vote = null;
      });
    } else {
      setState(() {
        expand = !expand;
      });
    }
  }

  @override
  void onTimeout(String type, dynamic data) async {
    super.onTimeout(type, data);
    if (!expand) {
      await Future.delayed(const Duration(seconds: 5), () {
        if (mounted && !expand && _voteViewModel.end) {
          setState(() {
            _voteViewModel.vote = null;
            expand = true;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VoteViewModel>(
      create: (context) => _voteViewModel,
      builder: (context, child) {
        VoteViewModel viewModel = context.watch<VoteViewModel>();
        if (_topPosition == 0) return const SizedBox.shrink();
        if (viewModel.vote == null) return const SizedBox.shrink();
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: expand ? _renderExpand() : _renderDefault(),
        );
      },
    );
  }

  /// 显示投票最小化UI
  Widget _renderDefault() {
    Widget child;
    if (convertRuleType(_voteViewModel.vote!.base.type) ==
        VoteOptionType.text) {
      child = _renderTextOption();
    } else if (convertRuleType(_voteViewModel.vote!.base.type) ==
        VoteOptionType.user) {
      if (_voteViewModel.vote!.base.options.length == 2) {
        child = VoteTwoUserWidget(
          viewModel: _voteViewModel,
          foldClick: () {
            _switch();
          },
        );
      } else {
        child =
            VoteMultiUerWidget(viewModel: _voteViewModel, foldClick: _switch);
      }
    } else {
      child = const SizedBox();
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        PositionedDirectional(
            top: _topPosition + 10.dp, start: 0, end: 0, child: child),
        PositionedDirectional(
          top: _topPosition - 18.dp,
          end: 16.dp,
          height: 24.dp,
          child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                // _showDetailDialog();
                _switch();
              },
              child: R.img(RoomAssets.chat_room$vote_ic_action_max_png,
                  width: 24.dp, height: 24.dp)),
        ),
      ],
    );
  }

  /// 显示投票详细信息
  Widget _renderExpand() {
    VoteOptionType type = convertRuleType(_voteViewModel.vote!.base.type);
    Widget child;
    if (type == VoteOptionType.text) {
      child =
          VoteExpandTextWidget(viewModel: _voteViewModel, foldClick: _switch);
    } else if (type == VoteOptionType.user) {
      if (_voteViewModel.vote!.base.options.length == 2) {
        child = VoteExpandTwoUserWidget(
            viewModel: _voteViewModel, foldClick: _switch);
      } else {
        child = VoteExpandMultiUserWidget(
            viewModel: _voteViewModel, foldClick: _switch);
      }
    } else {
      child = const SizedBox.shrink();
    }
    return Center(
        child: Padding(
            padding: EdgeInsetsDirectional.only(bottom: 30.dp), child: child));
  }

  /// 文字选项UI
  Widget _renderTextOption() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _switch();
      },
      child: Container(
        width: Util.width,
        height: 96.dp,
        margin: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.dp),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            renderPkWidget(),
            Column(
              children: [
                VoteTimeCountDownWidget(
                  width: 92.dp,
                  height: 20.dp,
                  fontSize: 12,
                ),
                SizedBox(height: 6.dp),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 20.dp, end: 20.dp),
                  child: Text(
                    titleWithOption(_voteViewModel.vote),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        height: 1.8, color: Color(0xFF313131), fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
