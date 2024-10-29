import 'dart:async';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/model/fans_group_model.dart';
import 'package:chat_room/k.dart';

import '../../assets.dart';

/// 加入粉丝团UI
class JoinFanGroupWidget extends StatefulWidget {
  final FansGroupInfo group;
  final String refer;

  const JoinFanGroupWidget(
      {super.key, required this.group, required this.refer});

  @override
  State<JoinFanGroupWidget> createState() => _JoinFanGroupWidgetState();
}

class _JoinFanGroupWidgetState extends State<JoinFanGroupWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  /// tips是否展示过
  bool _isTipsShowed = false;

  Timer? _timer;

  Timer? _dismissTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _showTip();
  }

  void _showTip() {
    if (widget.group.isJoined || _isTipsShowed) return;
    _timer = Timer(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      _controller.forward();
      _hideTip();
    });
  }

  void _hideTip() {
    _timer = Timer(const Duration(milliseconds: 4000), () {
      if (!mounted) return;
      _controller.reverse();
      _isTipsShowed = true;
    });
  }

  void _dismissTip() {
    if (!mounted) return;
    _controller.reverse();
    _cancelDismissTimer();
    _dismissTimer = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      widget.group.join = 1;
    });
  }

  void _cancelShowTip() {
    _timer?.cancel();
    _timer = null;
  }

  void _cancelDismissTimer() {
    _dismissTimer?.cancel();
    _dismissTimer = null;
  }

  @override
  void dispose() {
    _cancelShowTip();
    _cancelDismissTimer();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.add(R.img(RoomAssets.chat_room$ic_join_fans_group_webp,
        width: 60, height: 60));
    if (!widget.group.isJoined)
      widgets
          .add(_buildTips(widget.group.joinTitle ?? '', widget.group.joinNote));
    return GestureDetector(
      onTap: () async {
        if (widget.group.isJoined) {
          _locationHomeFansGroup();
          return;
        }
        IGroupManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_GROUP);
        bool? result = await manager.displayJoinGroupBottomSheet(
            context, widget.group.groupId ?? 0, widget.refer);
        if (result == true) {
          _dismissTip();
        }
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: widgets,
      ),
    );
  }

  void _locationHomeFansGroup() async {
    Navigator.popUntil(System.context, ModalRoute.withName('/'));
    eventCenter.emit('HomePage.JumpToHomePage', '');
    eventCenter.emit('HomePage.JumpToHomeTabKol', 'tabKol');
  }

  Widget _buildTips(String title, String? joinNote) {
    return PositionedDirectional(
      end: 44,
      bottom: -6,
      child: ScaleTransition(
          scale: _controller,
          alignment: Alignment.centerRight,
          child: _tips(title, joinNote)),
    );
  }

  Widget _tips(String title, String? joinNote) {
    double width = 150.0;
    double height = 54.0;
    double arrowWidth = 6.0;
    double arrowHeight = 14.0;

    return IgnorePointer(
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            PositionedDirectional(
              end: 0,
              top: (height - arrowHeight) / 2,
              child: R.img(
                RoomAssets.chat_room$fans_ic_recruit_bubble_arrow_right_svg,
                color: const Color(0xFFA25FFF),
                width: arrowWidth,
                height: 14,
              ),
            ),
            PositionedDirectional(
              end: arrowWidth - 1,
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 8),
                width: width - (arrowWidth - 1),
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      colors: [Color(0xFF616CFF), Color(0xFFA25FFF)]),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        K.room_join_anchor_fans_group([title]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 13),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Flexible(
                      child: Text(
                        joinNote ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6), fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
