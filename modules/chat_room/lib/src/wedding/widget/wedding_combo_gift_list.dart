import 'dart:math';

import 'package:flutter/material.dart';
import 'package:chat_room/src/wedding/mode/wedding_combo_data.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/wedding/mode/wedding_combo_manager.dart';

import '../../../chat_room.dart';
import 'wedding_combo_gift_item.dart';
import 'package:provider/provider.dart';

class WeddingComboGiftList extends StatefulWidget {
  const WeddingComboGiftList({super.key, this.config});

  final WeddingComboConfig? config;

  @override
  _WeddingComboGiftListState createState() => _WeddingComboGiftListState();
}

class _WeddingComboGiftListState extends State<WeddingComboGiftList> {
  final WeddingComboManager _comboManager = WeddingComboManager();

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(
        RoomConstant.Event_Wedding_Combo_Gift, _onWeddingComboGift);
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        RoomConstant.Event_Wedding_Combo_Gift, _onWeddingComboGift);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant WeddingComboGiftList oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  _onWeddingComboGift(String type, dynamic data) {
    if (data is WeddingComboGift) {
      _comboManager.addGifts(data.giftList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  ChangeNotifierProvider<WeddingComboManager> _buildBody() {
    return ChangeNotifierProvider.value(
      value: _comboManager,
      builder: (context, child) {
        return TimerWidget(
          period:
              Duration(milliseconds: widget.config?.effectIntervalTime ?? 300),
          stop: const Duration(days: 3), // 给个很长的时间
          onTick: () {
            _comboManager.updateGiftAnimate();
          },
          builder: (context) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsetsDirectional.only(start: 17.5.dp, end: 17.5.dp),
              child: RepaintBoundary(
                child: Stack(
                  children: [
                    _buildNormalGift(),
                    _buildMiddleGift(),
                    _buildBigGift(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildNormalGift() {
    List<Widget> children = [];
    const count = 10;
    for (var i = 0; i < count; ++i) {
      final isAlignmentEnd = i >= 5;
      final start = isAlignmentEnd ? 0.0 : 34.0.dp * i;
      final end = !isAlignmentEnd ? 0.0 : 34.0.dp * (count - 1.0 - i);
      // 分成10个动画通道
      final container = Positioned.fill(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsetsDirectional.only(start: start, end: end),
          child: WeddingComboChannelView(
              config: widget.config,
              alignment: AlignmentDirectional(isAlignmentEnd ? 1.0 : -1.0, 1.3),
              type: 'small',
              position: i),
        ),
      );
      children.add(container);
    }
    return Positioned.fill(
      child: Stack(
        children: children,
      ),
    );
  }

  Widget _buildMiddleGift() {
    List<Widget> children = [];
    const count = 5;
    for (var i = 0; i < count; ++i) {
      final isAlignmentEnd = i >= 2;
      final start = isAlignmentEnd ? 0.0 : 68.0.dp * i;
      final end = !isAlignmentEnd ? 0.0 : 68.0.dp * (count - 1.0 - i);
      // 分成10个动画通道
      final container = Positioned.fill(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsetsDirectional.only(start: start, end: end),
          child: WeddingComboChannelView(
            config: widget.config,
            alignment: AlignmentDirectional(isAlignmentEnd ? 1.0 : -1.0, 1.3),
            type: 'medium',
            position: i,
          ),
        ),
      );
      children.add(container);
    }
    return Positioned.fill(
      child: Stack(
        children: children,
      ),
    );
  }

  Widget _buildBigGift() {
    List<Widget> children = [
      Positioned.fill(
        child: Container(
          alignment: AlignmentDirectional.bottomCenter,
          child: WeddingComboChannelView(
            config: widget.config,
            alignment: const AlignmentDirectional(0, 1.3),
            type: 'big',
            position: 0,
          ),
        ),
      )
    ];

    return Positioned.fill(
      child: Stack(
        children: children,
      ),
    );
  }
}

/// 通道内的动画
class WeddingComboChannelView extends StatefulWidget {
  const WeddingComboChannelView(
      {super.key,
      this.alignment,
      required this.type,
      required this.position,
      this.config});

  final AlignmentDirectional? alignment;
  final String type;
  final int position;
  final WeddingComboConfig? config;

  @override
  _WeddingComboChannelViewState createState() =>
      _WeddingComboChannelViewState();
}

class _WeddingComboChannelViewState extends State<WeddingComboChannelView> {
  /// 进入动画队列 待播放的动画
  final List<WeddingComboGiftItem> _waitingGifts = [];

  /// 正在播放的动画
  final List<WeddingComboGiftItem> _animatingGifts = [];

  /// 做后一次动画的时间
  int _lastAnimateStart = 0;

  int get _timeOffset =>
      DateTime.now().millisecondsSinceEpoch - _lastAnimateStart;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant WeddingComboChannelView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  _addAnimation(WeddingComboGiftItem animateGift) {
    int index = _waitingGifts.indexOf(animateGift);
    if (index == -1) {
      _waitingGifts.add(animateGift);
      if (_animatingGifts.isEmpty || _timeOffset > 1500)
        _updateAnimationGifts();
    }
  }

  _updateAnimationGifts() {
    if (_waitingGifts.isNotEmpty) {
      final e = _waitingGifts.removeAt(0);
      _animatingGifts.add(e);
      _lastAnimateStart = DateTime.now().millisecondsSinceEpoch;
      _nextAnimation();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (mounted) setState(() {});
      });
    }
  }

  _onAnimationComplete(WeddingComboGiftItem giftItem) {
    final result = _animatingGifts.remove(giftItem);
    assert(result);
    if (mounted) setState(() {});
  }

  _nextAnimation() {
    int timeOffset = _timeOffset;
    Future.delayed(Duration(milliseconds: max(0, 1500 - timeOffset)))
        .then((value) {
      _updateAnimationGifts();
    });
  }

  bool _shouldAddGift(WeddingComboGiftItem? giftItem) {
    return giftItem != null &&
        giftItem.type == widget.type &&
        giftItem.position == widget.position &&
        !_animatingGifts.contains(giftItem) &&
        !_waitingGifts.contains(giftItem);
  }

  @override
  Widget build(BuildContext context) {
    return Selector<WeddingComboManager, WeddingComboGiftItem?>(
      selector: (context, model) => model.animateGift,
      shouldRebuild: (pre, next) => pre != next && _shouldAddGift(next),
      builder: (context, animateGift, child) {
        if (_shouldAddGift(animateGift)) _addAnimation(animateGift!);

        List<Widget> children = [];
        if (_animatingGifts.isNotEmpty) {
          children = _animatingGifts
              .map(
                (e) => Positioned.fill(
                  key: ValueKey(e.id),
                  child: WeddingComboGiftView(
                    // key: e.key,
                    animationDuration: widget.config?.effectDuration,
                    giftItem: e,
                    onComplete: _onAnimationComplete,
                    alignment: widget.alignment,
                  ),
                ),
              )
              .toList();
        }
        return Stack(
          children: children,
        );
      },
    );
  }
}
