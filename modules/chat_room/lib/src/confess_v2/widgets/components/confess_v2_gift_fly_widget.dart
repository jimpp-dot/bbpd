import 'package:shared/shared.dart';
import 'package:chat_room/src/confess_v2/confess_v2_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfessV2GiftFlyData {
  final int giftId;

  /// 礼物所在位置
  final GlobalKey giftKey;

  /// 礼物飞到用户头像上的位置
  final GlobalKey flyToUserKey;

  const ConfessV2GiftFlyData({
    Key? key,
    required this.giftId,
    required this.giftKey,
    required this.flyToUserKey,
  });
}

/// 礼物飞到用户头像上的动画
class ConfessV2GiftFlyWidget extends StatefulWidget {
  const ConfessV2GiftFlyWidget({super.key});

  @override
  ConfessV2GiftFlyWidgetState createState() => ConfessV2GiftFlyWidgetState();
}

class ConfessV2GiftFlyWidgetState extends State<ConfessV2GiftFlyWidget>
    with TickerProviderStateMixin {
  final List<ConfessV2GiftFlyData> _giftFlyDataList = [];

  late AnimationController _animationController;

  late Animation<double> _fadeOutAnimation;

  late Animation<Offset> _positionAnimation;

  late Animation<Size> _sizeAnimation;

  /// 当前正在执行动画的数据
  ConfessV2GiftFlyData? _data;

  @override
  void dispose() {
    _animationController.removeListener(_animationListener);
    _animationController.removeStatusListener(_animationStatusListener);
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    _animationController.addListener(_animationListener);

    _animationController.addStatusListener(_animationStatusListener);
  }

  addGiftFlyData(ConfessV2GiftFlyData data) {
    _giftFlyDataList.add(data);

    if (!_animationController.isAnimating) {
      _startAnimation();
    }
  }

  _animationListener() {
    setState(() {});
  }

  _animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      /// 动画执行完成,查看队列中是否还有待执行动画的
      _giftFlyDataList.removeAt(0);
      _data = null;

      if (_giftFlyDataList.isNotEmpty) {
        _startAnimation();
      }
    }
  }

  _startAnimation() {
    setState(() {
      _data = _giftFlyDataList.first;
      _setupAnimation();
      _animationController.reset();
      _animationController.forward();
    });
  }

  /// 执行动画前先进行配置
  _setupAnimation() {
    final startRect = _getGiftFlyStartRect();
    final endRect = _getGiftFlyToUserRect();

    _positionAnimation = TweenSequence<Offset>([
      /// 移动到用户头像位置
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset(startRect.left, startRect.top),
          end: Offset(endRect.left, endRect.top),
        ),
        weight: 100,
      ),
    ]).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeInOut)));

    _sizeAnimation = TweenSequence<Size>([
      TweenSequenceItem(
        tween: Tween<Size>(
          begin: startRect.size,
          end: endRect.size,
        ),
        weight: 100,
      ),
    ]).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeInOut)));

    _fadeOutAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.8, 1.0)));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (_data != null)
          PositionedDirectional(
            start: _positionAnimation.value.dx,
            top: _positionAnimation.value.dy,
            child: _giftFlyWidget,
          ),
      ],
    );
  }

  /// 礼物的起始位置和大小
  Rect _getGiftFlyStartRect() {
    final renderBox = _getRenderBox(_data?.giftKey);
    if (renderBox != null) {
      final offset = renderBox.localToGlobal(Offset.zero);
      return Rect.fromLTWH(
          offset.dx,
          offset.dy - (Util.height - ConfessV2Util.widgetHeight),
          renderBox.size.width,
          renderBox.size.height);
    }
    return Rect.zero;
  }

  /// 礼物飞到用户头像位置
  Rect _getGiftFlyToUserRect() {
    final renderBox = _getRenderBox(_data?.flyToUserKey);
    if (renderBox != null) {
      final offset = renderBox.localToGlobal(Offset.zero);
      final rect = Rect.fromLTWH(
          offset.dx,
          offset.dy - (Util.height - ConfessV2Util.widgetHeight),
          renderBox.size.width,
          renderBox.size.height);
      return rect;
    }

    return Rect.zero;
  }

  RenderBox? _getRenderBox(GlobalKey? key) {
    if (key == null) return null;

    final renderObj = key.currentContext?.findRenderObject();
    if (renderObj != null && renderObj is RenderBox) {
      final renderBox = renderObj;
      return renderBox;
    }
    return null;
  }

  Widget get _giftFlyWidget {
    return FadeTransition(
      opacity: _fadeOutAnimation,
      child: SizedBox(
        width: _sizeAnimation.value.width,
        height: _sizeAnimation.value.height,
        child: CachedNetworkImage(
          imageUrl: Util.parseIcon(ConfessV2Util.giftUrl(_data!.giftId)),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
