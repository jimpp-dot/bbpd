import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'model/match_bean.dart';

class FlipHeader extends StatefulWidget {
  FlipHeader({Key? key, this.index = 0, this.item, this.selected = true})
      : super(key: key);
  final int index;
  RecommendUserItem? item;
  bool selected;

  @override
  FlipHeaderState createState() => FlipHeaderState();
}

class FlipHeaderState extends State<FlipHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<num> animation;
  bool isEleBack = false;
  RecommendUserItem? _currentItem;
  RecommendUserItem? _nextItem;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..addListener(() {
        if (controller.isCompleted) {
          _currentItem = _nextItem;
          widget.item = _currentItem;
          setState(() {});
          controller.reset();
        }
      });
    animation = Tween(begin: 0, end: 180.0).animate(controller);
    _currentItem = widget.item;
  }

  bool canChangeImage() {
    //动画中
    return !controller.isAnimating;
  }

  changeHeaderImage(RecommendUserItem item) {
    if (mounted) {
      setState(() {
        if (_currentItem == null) {
          _currentItem = item;
          widget.item = _currentItem;
        } else {
          _nextItem = item;
          controller.forward();
        }
      });
    }
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentItem == null || _currentItem?.noData == true) {
      return Container();
    }
    return animateBuild();
  }

  Widget animateBuild() {
    return AnimatedBuilder(
      animation: animation,
      child: _buildHeader(),
      builder: (BuildContext? context, Widget? child) {
        return Transform(
          transform: Matrix4.rotationY(math.pi * animation.value / 180),
          alignment: FractionalOffset.center,
          child: animation.value < 90 ? child : _buildHeader(isBg: true),
        );
      },
    );
  }

  Widget _buildHeader({bool isBg = false}) {
    RecommendUserItem? showItem = isBg ? _nextItem : _currentItem;
    return GestureDetector(
      onTap: _onTapHeader,
      child: Transform(
        transform: Matrix4.rotationY(isBg ? math.pi : 0),
        alignment: FractionalOffset.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color(0xFFFFFFFF).withOpacity(0.2),
                    width: 4.0),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Stack(
                alignment: AlignmentDirectional.center,
                clipBehavior: Clip.none,
                children: [
                  CommonAvatar(
                    path: showItem?.icon ?? '',
                    size: 80,
                    shape: BoxShape.circle,
                    onTap: () {
                      IPersonalDataManager? personalDataManager =
                          ComponentManager.instance.getManager(
                              ComponentManager.MANAGER_PERSONALDATA);
                      personalDataManager?.openImageScreen(
                          context, Util.parseInt(_currentItem?.uid),
                          fromMatch: true, refer: const PageRefer('match'));
                    },
                  ),
                  if ((showItem?.isOnline ?? false) &&
                      !(showItem?.isPlaying ?? false))
                    PositionedDirectional(
                      end: 0,
                      bottom: 9,
                      child: Container(
                        height: 12,
                        width: 12,
                        alignment: AlignmentDirectional.center,
                        decoration: const ShapeDecoration(
                            color: Color(0xFF2EFECE),
                            shape: CircleBorder(
                                side:
                                    BorderSide(color: Colors.white, width: 2))),
                      ),
                    ),
                  if (showItem?.isPlaying ?? false)
                    PositionedDirectional(
                        bottom: -2, child: _buildDes(showItem))
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                widget.selected = !widget.selected;
                if (mounted) {
                  setState(() {});
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  R.img(
                    widget.selected
                        ? 'match/match_selected.webp'
                        : 'match/match_unselected.webp',
                    width: 12,
                    height: 12,
                    fit: BoxFit.contain,
                    package: ComponentManager.MANAGER_PERSONALDATA,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 100),
                    child: Text(
                      _currentItem?.name ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            if (_currentItem?.distanceStr != null) _buildPosition(),
          ],
        ),
      ),
    );
  }

  _buildPosition() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        R.img(
          'match/match_user_position.webp',
          width: 12,
          height: 12,
          fit: BoxFit.contain,
          package: ComponentManager.MANAGER_PERSONALDATA,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          _currentItem?.distanceStr ?? '',
          style: const TextStyle(fontSize: 10, color: Color(0xFF816BFF)),
        ),
      ],
    );
  }

  _buildDes(RecommendUserItem? item) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
      height: 18,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(9)),
        border: Border.all(width: 2, color: Colors.white.withOpacity(0.7)),
        gradient: _getGradientColor(item),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (item?.roomIcon != null)
            CommonAvatar(
              path: item!.roomIcon,
              size: 10,
            ),
          Text(
            item?.roomTagStr ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 8,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  _getGradientColor(RecommendUserItem? item) {
    if (item?.isGame == 1) {
      return const LinearGradient(
        begin: AlignmentDirectional.centerStart,
        end: AlignmentDirectional.centerEnd,
        colors: [
          Color(0xFFE470FF),
          Color(0xFF81DAFF),
        ],
      );
    } else {
      return const LinearGradient(
        begin: AlignmentDirectional.centerStart,
        end: AlignmentDirectional.centerEnd,
        colors: [
          Color(0xFFFE62A5),
          Color(0xFFFFC96A),
        ],
      );
    }
  }

  _onTapHeader() {}
}
