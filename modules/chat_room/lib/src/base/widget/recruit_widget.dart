import 'dart:math';

import 'package:shared/shared.dart';
import 'package:shared/widget/gradient_circular_progress_indicator.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/widget/bounce_scale_animation_widget.dart';
import 'package:flutter/material.dart';

const double leftTopRecruitHeight = 24.0;

/// 新征召按钮
class RecruitWidget extends StatefulWidget {
  final int matchStatus; //当前征召状态，控制页面显示 0 未开启 1 征召中 2 暂停
  final int rid; //默认点击事件需要
  final String? typeLabel; //默认点击事件需要
  final String? adminRole; //默认点击事件需要
  final Games? game; //
  final VoidCallback? onTap; //点击事件回调
  final VoidCallback? onRecruit; //点击征召回调，用来处理埋点
  final int recruitTotalSeconds; //征召总时间
  final int recruitLeftSeconds; //剩余可征召时间
  final String? publishDeal;
  final EdgeInsetsGeometry? margin;

  const RecruitWidget(
    this.matchStatus, {
    super.key,
    required this.rid,
    this.typeLabel,
    this.adminRole,
    this.onTap,
    this.game,
    this.onRecruit,
    this.recruitTotalSeconds = 180,
    this.recruitLeftSeconds = 0,
    this.publishDeal = '',
    this.margin,
  });

  @override
  _RecruitWidgetState createState() => _RecruitWidgetState();
}

class _RecruitWidgetState extends State<RecruitWidget>
    with TickerProviderStateMixin {
  late double _progressValue;

  //从左到右扫光
  late AnimationController _sweepController;
  late Animation _sweepAnimation;

  //进度条
  AnimationController? _progressController;
  Animation? _progressAnimation;

  //闪电缩放
  late AnimationController _lightController;
  late Animation _lightAnimation;

  late int _matchStatus;
  bool _showBubbleTip = false;

  //征召按钮显示文本
  String get recruitText {
    String recruitTxt = '';

    if (_matchStatus == 0) {
      recruitTxt = K.room_start_recruit;
    } else if (_matchStatus == 1) {
      recruitTxt = K.room_in_recruit;
    } else if (_matchStatus == 2) {
      recruitTxt = K.room_continue_recruit;
    }

    return recruitTxt;
  }

  @override
  void initState() {
    super.initState();

    _matchStatus = widget.matchStatus;
    _progressValue = widget.recruitLeftSeconds == 0
        ? 0.0
        : (widget.recruitTotalSeconds - widget.recruitLeftSeconds) /
            widget.recruitTotalSeconds;

    _initAnimation();

    /// 气泡样式提醒征召弹框
    if (ChatRoomUtil.showRecruitBubbleTips()) {
      Config.setBool(BBConfigKey.hasShowNoticeStartRecruitToday(), true);
      _showBubbleTip = true;
      _refresh();

      Future.delayed(const Duration(seconds: 5), () {
        _showBubbleTip = false;
        _refresh();
      });
    }
  }

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _sweepController.dispose();
    _progressController?.dispose();
    _lightController.dispose();

    super.dispose();
  }

  //开启征召
  _startMatch() async {
    bool success = await RoomRepository.startMatch(
      context: context,
      rid: widget.rid.toString(),
      type: widget.typeLabel ?? '',
      admin_role: widget.adminRole ?? '',
      publishDeal: widget.publishDeal ?? '',
    );

    if (success) {
      _matchStatus = 1;

      _sweepController.repeat();
      _lightController.forward();
      _progressController?.forward();
    }
  }

  //暂停征召 status 1 暂停 2 继续
  _pauseMatch(int status) async {
    bool success = await RoomRepository.pauseMatch(
      rid: widget.rid.toString(),
      status: status,
    );

    if (success) {
      _matchStatus = status == 1 ? 2 : 1;
      _refreshMatchStatus();
    }
  }

  void _refreshProgress() {
    if (_progressController != null) {
      _progressController!.dispose();
      _progressController = null;
    }

    int seconds = (_progressValue * widget.recruitTotalSeconds).floor();

    _progressController = AnimationController(
        duration: Duration(seconds: widget.recruitTotalSeconds - seconds),
        vsync: this)
      ..addListener(() {
        setState(() {
          _progressValue = _progressAnimation?.value ?? 0;
        });
      });

    _progressAnimation = Tween<double>(begin: _progressValue, end: 1.0).animate(
        CurvedAnimation(parent: _progressController!, curve: Curves.linear));
  }

  void _refreshMatchStatus() {
    if (_matchStatus == 0) {
      //征召未开始或已结束
      _progressValue = 0.0;
      _sweepController.reset();
      _lightController.reset();
      _refreshProgress();
    } else if (_matchStatus == 1) {
      //征召中
      _sweepController.repeat();
      _lightController.forward();
      _progressController?.forward();
    } else if (_matchStatus == 2) {
      //征召暂停
      _sweepController.reset();
      _lightController.reset();
      _progressController?.stop();
    }
  }

  //房间退出重进时 会用上一次的房间单例数据先绘制 room/config拉取数据之后调用setstate RecruitWidget中动画也会setstate 为了进度条显示正确 不使用widget.recruitLeftSeconds刷新
  //hasLoadMatchTime控制 在每次进房后room/config拉取之前不显示 RecruitWidget
  @override
  Widget build(BuildContext context) {
    //房间websocket match status刷新 房间内麦上的管理 桌游一号麦 超级管理 刷新页面
    if (_matchStatus != widget.matchStatus) {
      _matchStatus = widget.matchStatus;
      _refreshMatchStatus();
    }

    double width = 76.0;
    double circleBorderWidth = 2.0;

    return Container(
      alignment: AlignmentDirectional.topStart,
      margin: widget.margin ?? const EdgeInsetsDirectional.only(start: 13),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _onRecruitTap();
            },
            child: SizedBox(
              width: width,
              height: leftTopRecruitHeight,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Container(
                        width: width,
                        height: leftTopRecruitHeight,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(leftTopRecruitHeight / 2),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF72CAFF).withOpacity(0.4),
                              const Color(0xFF631DDE).withOpacity(0.4)
                            ],
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            PositionedDirectional(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    recruitText,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  R.img('ic_recruit_next_arrow.webp',
                                      width: 16,
                                      height: 16,
                                      package:
                                          ComponentManager.MANAGER_BASE_ROOM),
                                ],
                              ),
                            ),
                            PositionedDirectional(
                              start: width * _sweepAnimation.value,
                              child: Container(
                                width: _sweepAnimation.value == 0 ? 0 : 12,
                                height: leftTopRecruitHeight,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0x0091FDEC),
                                      Color(0x6691FDEC)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  PositionedDirectional(
                    child: Container(
                      width: leftTopRecruitHeight,
                      height: leftTopRecruitHeight,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(leftTopRecruitHeight / 2),
                        border: Border.all(
                          width: circleBorderWidth,
                          color: const Color(0x66000000),
                        ),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.center,
                        children: [
                          R.img('recruit_circle_bg.webp',
                              width:
                                  leftTopRecruitHeight - 2 * circleBorderWidth,
                              height:
                                  leftTopRecruitHeight - 2 * circleBorderWidth,
                              package: ComponentManager.MANAGER_BASE_ROOM),
                          OverflowBox(
                            maxWidth:
                                (leftTopRecruitHeight - 2 * circleBorderWidth) *
                                    1.2,
                            maxHeight:
                                (leftTopRecruitHeight - 2 * circleBorderWidth) *
                                    1.2,
                            child: R.img('recruit_lightning.webp',
                                width: (leftTopRecruitHeight -
                                        2 * circleBorderWidth) *
                                    _lightAnimation.value,
                                height: (leftTopRecruitHeight -
                                        2 * circleBorderWidth) *
                                    _lightAnimation.value,
                                package: ComponentManager.MANAGER_BASE_ROOM),
                          ),
                          OverflowBox(
                            maxWidth: leftTopRecruitHeight,
                            maxHeight: leftTopRecruitHeight,
                            child: GradientCircularProgressIndicator(
                              rotate: 1.5 * pi,
                              strokeCapRound: true,
                              stokeWidth: circleBorderWidth,
                              radius: leftTopRecruitHeight / 2,
                              backgroundColor: Colors.transparent,
                              colors: const [
                                Color(0xFF91FDEC),
                                Color(0xFF58C4FA),
                                Color(0xFF91FDEC)
                              ],
                              value: _progressValue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_showBubbleTip)
            PositionedDirectional(
              top: leftTopRecruitHeight + 5.0,
              child: BounceScaleAnimationWidget(
                child: _buildBubbleTip(),
              ),
            ),
        ],
      ),
    );
  }

  /// 气泡样式提醒征召弹框
  Widget _buildBubbleTip() {
    double width = 137.0;
    double height = 56.0;
    double arrowHeight = 6.0;

    return IgnorePointer(
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            PositionedDirectional(
              start: 12,
              child: R.img('ic_recruit_bubble_arrow.svg',
                  color: const Color(0xFF8947FF),
                  width: 14,
                  height: 6,
                  package: ComponentManager.MANAGER_BASE_ROOM),
            ),
            PositionedDirectional(
              start: -3,
              top: arrowHeight - 1,
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 8, top: 10),
                width: width,
                height: height - (arrowHeight - 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8947FF), Color(0xFF72CAFF)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      K.room_come_room_recruit,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 13),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      K.room_match_friends_recruit,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6), fontSize: 11),
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

  void _initAnimation() {
    _sweepController = AnimationController(
        duration: const Duration(milliseconds: 1300), vsync: this)
      ..addListener(() {
        setState(() {});
      });
    _sweepAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _sweepController, curve: Curves.ease));

    _lightController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _lightController.reverse();
        }
        if (status == AnimationStatus.dismissed && _matchStatus == 1) {
          _lightController.forward();
        }
      });
    _lightAnimation = Tween<double>(begin: 1.0, end: 1.2)
        .animate(CurvedAnimation(parent: _lightController, curve: Curves.ease));

    _refreshProgress();

    if (_matchStatus == 1) {
      //征召中
      _refreshMatchStatus();
    }
  }

  _onRecruitTap() async {
    if (widget.onTap != null) {
      widget.onTap!();
      return;
    }

    if (_matchStatus == 0 || _matchStatus == 2) {
      if (widget.onRecruit != null) {
        widget.onRecruit!();
      }

      if (_matchStatus == 0) {
        //发起征召
        _startMatch();
      } else {
        //继续征召
        _pauseMatch(2);
      }
    } else {
      //暂停征召
      _pauseMatch(1);
    }
  }
}
