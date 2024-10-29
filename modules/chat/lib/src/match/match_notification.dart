import 'package:shared/shared.dart';
import 'package:chat/k.dart';
import 'package:chat/src/repo/chat_repo.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';

/// @Author wangyang
/// @Description 在线匹配通知
/// @Date 2022/7/11
class MatchNotification {
  static OverlayEntry? _overlayEntry;
  static show(Map? data) {
    if (data == null) {
      Log.d('MatchNotification showing, data is null');
      return;
    }

    ///正在展示时，直接忽略
    if (_overlayEntry != null) {
      Log.d('MatchNotification showing, ignore');
      return;
    }
    var overlayState = Overlay.of(System.context);

    Tracker.instance.track(TrackEvent.match_notification_exposure, properties: {
      'to_uid': data['match_uid'],
    });
    _overlayEntry = OverlayEntry(builder: (context) {
      return MatchNotificationWidget(data: data);
    });
    overlayState.insert(_overlayEntry!);
  }

  static void dispose() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
}

class MatchNotificationWidget extends StatefulWidget {
  final Map data;

  const MatchNotificationWidget({super.key, required this.data});
  @override
  State<StatefulWidget> createState() {
    return MatchNotificationWidgetState();
  }
}

class MatchNotificationWidgetState extends State<MatchNotificationWidget>
    with TickerProviderStateMixin {
  late AnimationController _animInController;
  late AnimationController _animOutController;
  late Animation _animInAnimation;
  late Animation _animOutAnimation;
  late AnimationController _step1AnimController;
  late Animation _step1Animation;
  late AnimationController _step2AnimController;
  late Animation _step2Animation;
  final double _contentHeight = 232;
  double _topOffset = 0;
  int _step = 1;
  late Offset _waveCenter;
  final double _waveAnimBeginValue = 30;
  final double _waveAnimEndValue = 150;
  final List<AnimationController> _waveControllerList = [];
  final List<Animation> _waveAnimationList = [];
  bool _waveAnimating = false;
  bool _gotoChatAfterDismiss = false;

  @override
  void initState() {
    super.initState();
    _initAnimIn();
    _initAnimOut();
    _initStep1Anim();
    _initStep2Anim();
    _initWaveAnim();
    _animInController.forward();
    _vibrate();
  }

  @override
  void dispose() {
    for (var element in _waveControllerList) {
      element.dispose();
    }
    _animInController.dispose();
    _animOutController.dispose();
    _step1AnimController.dispose();
    _step2AnimController.dispose();
    super.dispose();
  }

  _computeTopOffset() {
    if (_animInController.isAnimating) {
      return -_contentHeight +
          (_topOffset + _contentHeight) * _animInAnimation.value;
    } else if (_animOutController.isAnimating) {
      return _topOffset -
          (_topOffset + _contentHeight) * _animOutAnimation.value;
    }
    return _topOffset;
  }

  _initAnimIn() {
    _topOffset = Util.statusHeight + 24.0;
    _animInController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animInAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animInController, curve: Curves.elasticInOut));
    _animInController.addListener(_refreshUi);
    _animInController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _step1AnimController.forward();
        _startWaveAnim();

        ///一段时间后自动切换到下一个页面
        Future.delayed(const Duration(milliseconds: 4000), () {
          if (mounted) {
            _step = 2;
            _step1AnimController.stop();
            _stopWaveAnim();
            _step2AnimController.forward();
          }
        });
      }
    });
  }

  _initAnimOut() {
    _animOutController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animOutAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animOutController, curve: Curves.easeOut));
    _animOutController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        MatchNotification.dispose();
        if (_gotoChatAfterDismiss) {
          _openChatScreen();
        }
      }
    });
    _animOutController.addListener(_refreshUi);
  }

  _initStep1Anim() {
    _step1AnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _step1Animation = Tween(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: _step1AnimController, curve: Curves.easeOut));
    _step1AnimController.addListener(_refreshUi);
    _step1AnimController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _step1AnimController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _step1AnimController.forward();
        _startWaveAnim();
      }
    });
  }

  _initStep2Anim() {
    _step2AnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _step2Animation = TweenSequence([
      //这是一个动画序列，weight表示权重
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: 1.1)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 70),
      TweenSequenceItem(
          tween: Tween(begin: 1.1, end: 0.96)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 15),
      TweenSequenceItem(
          tween: Tween(begin: 0.96, end: 1.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 15),
    ]).animate(_step2AnimController);
    _step2AnimController.addListener(_refreshUi);
  }

  _initWaveAnim() {
    double waveCenterX = (Util.width - 24) / 2;
    double waveCenterY = 30 + 72.0 / 2;

    _waveCenter = Offset(waveCenterX, waveCenterY);
    for (int i = 0; i < 2; i++) {
      var controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 700),
      );
      _waveControllerList.add(controller);
      var animation = Tween(
        begin: _waveAnimBeginValue,
        end: _waveAnimEndValue,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
      _waveAnimationList.add(animation);
    }
  }

  _startWaveAnim() {
    _stopWaveAnim();
    int count = 0;
    int interval = 200;
    for (var controller in _waveControllerList) {
      Future.delayed(Duration(milliseconds: count++ * interval), () {
        // 执行动画
        if (mounted) {
          controller.reset();
          controller.forward();
        }
      });
    }
    _waveAnimating = true;
  }

  _stopWaveAnim() {
    for (var controller in _waveControllerList) {
      controller.stop();
    }
    _waveAnimating = false;
  }

  _getWaveWidgetList() {
    List<Widget> waveWidgetList = [];
    for (var animation in _waveAnimationList) {
      waveWidgetList.add(_getWaveWidget(
          animation.value, _waveAnimBeginValue, _waveAnimEndValue));
    }
    return waveWidgetList;
  }

  _getWaveWidget(double value, double beginValue, double endValue) {
    double borderWidth =
        3.0 * (1 - (value - beginValue) / (endValue - beginValue));
    double start = _waveCenter.dx - value / 2;
    double top = _waveCenter.dy - value / 2;
    return PositionedDirectional(
        start: start,
        top: top,
        child: Container(
          width: value,
          height: value,
          decoration:
              borderWidth == 0 //borderWidth为0时，flutter默认渲染时还是有border，这里特殊处理下
                  ? null
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(value / 2),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.4),
                          width: borderWidth)),
        ));
  }

  _refreshUi() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _computeTopOffset(),
      child: Container(
        width: Util.width - 24,
        height: _contentHeight,
        margin: const EdgeInsetsDirectional.only(
          start: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
            colors: [Color(0xFF73A2FF), Color(0xFF00DECC)],
          ),
        ),
        child: Stack(
          children: [
            R.img(Assets.chat$chat_match_notification_left_top_icon_webp,
                width: 147,
                height: 126,
                package: ComponentManager.MANAGER_CHAT),
            PositionedDirectional(
              end: 0,
              bottom: 0,
              child: RotatedBox(
                quarterTurns: 2,
                child: R.img(
                    Assets.chat$chat_match_notification_left_top_icon_webp,
                    width: 147,
                    height: 126,
                    package: ComponentManager.MANAGER_CHAT),
              ),
            ),
            Positioned.fill(
              child: Container(
                margin: const EdgeInsetsDirectional.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0x29FFFFFF), width: 2),
                ),
              ),
            ),
            if (_waveAnimating) ..._getWaveWidgetList(),
            Positioned.fill(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  if (_step == 1) ...[
                    Transform.scale(
                      scale: _step1Animation.value,
                      child: Container(
                        width: 72,
                        height: 72,
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            R.img(Assets.chat$chat_match_notification_love_webp,
                                width: 72.6,
                                height: 64,
                                package: ComponentManager.MANAGER_CHAT),
                            Text(
                              '${widget.data['match_score']}%',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: 'Anton',
                                  fontWeight: FontWeight.w400,
                                  package: ComponentManager.MANAGER_GIFT),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  if (_step == 2) ...[
                    Transform.scale(
                      scale: _step2Animation.value,
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(36)),
                        ),
                        padding: const EdgeInsetsDirectional.all(2),
                        child: Stack(
                          children: [
                            CommonAvatar(
                              size: 68,
                              path: widget.data['match_icon'],
                              shape: BoxShape.circle,
                            ),
                            PositionedDirectional(
                              bottom: 3,
                              end: 0,
                              child: R.img(
                                  Util.parseInt(widget.data['sex']) == 1
                                      ? Assets
                                          .chat$ic_chat_notification_male_png
                                      : Assets
                                          .chat$ic_chat_notification_female_png,
                                  width: 24,
                                  height: 24,
                                  package: ComponentManager.MANAGER_CHAT),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 22,
                    padding:
                        const EdgeInsetsDirectional.only(start: 20, end: 20),
                    alignment: Alignment.center,
                    child: Text(
                      _step == 1
                          ? K.chat_match_notification_text
                          : '${widget.data['message']}',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsetsDirectional.only(
                          start: 100, end: 100, top: 13, bottom: 13),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        K.chat_match_notification_start,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF47BAE9),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    onTap: () {
                      _gotoChatAfterDismiss = true;
                      _dismiss();
                      _reportUserAction(1);
                    },
                  ),
                ],
              ),
            ),
            PositionedDirectional(
                end: 16,
                top: 16,
                child: GestureDetector(
                  onTap: () {
                    _dismiss();
                    _reportUserAction(0);
                  },
                  child: R.img(Assets.chat$chat_close_icon_svg,
                      width: 20,
                      height: 20,
                      color: Colors.white.withOpacity(0.6),
                      package: ComponentManager.MANAGER_CHAT),
                ))
          ],
        ),
      ),
    );
  }

  _openChatScreen() {
    IChatManager chatManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    chatManager.openUserChatScreen(
      context,
      type: 'private',
      targetId: widget.data['match_uid'],
      title: widget.data['match_name'],
      refer: FollowChannel.HI_CHAT_MATCH,
      hiMatchScore: widget.data['match_score'],
    );
  }

  // 操作类型 0: 点击关闭 1: 去聊天
  _reportUserAction(int action) {
    ChatRepo.reportMatchNotificationAction(action);
    Tracker.instance.track(TrackEvent.match_notification_click, properties: {
      'button': action == 0 ? 'close' : 'go_chat',
    });
  }

  ///消息展示时出现震动效果
  _vibrate() async {
    bool? hasVibrator = await Vibration.hasVibrator();
    Log.d('MatchNotification hasVibrator=$hasVibrator');
    if (hasVibrator == true) {
      bool? hasCustomVibrationsSupport =
          await Vibration.hasCustomVibrationsSupport();
      Log.d(
          'MatchNotification hasCustomVibrationsSupport=$hasCustomVibrationsSupport');
      if (hasCustomVibrationsSupport == true) {
        Vibration.vibrate(duration: 1500, repeat: 2);
      } else {
        Vibration.vibrate(repeat: 2);
      }
    }
  }

  _dismiss() {
    if (_animInController.isCompleted) {
      _animOutController.forward();
    }
  }
}
