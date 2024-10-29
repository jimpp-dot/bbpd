import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class RoomLoadingAniWidget extends StatefulWidget {
  const RoomLoadingAniWidget({super.key});

  @override
  RoomLoadingAniState createState() {
    return RoomLoadingAniState();
  }
}

class RoomLoadingAniState extends State<RoomLoadingAniWidget>
    with TickerProviderStateMixin<RoomLoadingAniWidget> {
  late AnimationController _animationController;
  late Animation<double> _scaleAni1;
  late Animation<double> _fadeAni1;
  late Animation<double> _scaleAni2;
  late Animation<double> _fadeAni2;
  late Animation<double> _scaleAni3;
  late Animation<double> _fadeAni3;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    _scaleAni1 = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 1.4), weight: 8),
      TweenSequenceItem<double>(tween: Tween(begin: 1.4, end: 0.0), weight: 8),
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 8),
    ]).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.ease),
      ),
    );

    _fadeAni1 = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 1.0), weight: 8),
      TweenSequenceItem<double>(tween: Tween(begin: 1.0, end: 0.0), weight: 8),
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 8),
    ]).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.ease),
      ),
    );

    _scaleAni2 = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 4),
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 1.4), weight: 8),
      TweenSequenceItem<double>(tween: Tween(begin: 1.4, end: 0.0), weight: 8),
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 4),
    ]).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.ease),
      ),
    );

    _fadeAni2 = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 4),
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 1.0), weight: 8),
      TweenSequenceItem<double>(tween: Tween(begin: 1.0, end: 0.0), weight: 8),
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 4),
    ]).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.ease),
      ),
    );

    _scaleAni3 = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 8),
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 1.4), weight: 8),
      TweenSequenceItem<double>(tween: Tween(begin: 1.4, end: 0.0), weight: 8),
    ]).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.ease),
      ),
    );

    _fadeAni3 = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 8),
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 1.0), weight: 8),
      TweenSequenceItem<double>(tween: Tween(begin: 1.0, end: 0.0), weight: 8),
    ]).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.ease),
      ),
    );

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.centerStart,
            children: [
              PositionedDirectional(
                start: 5,
                child: ScaleTransition(
                  scale: _scaleAni1,
                  alignment: Alignment.center,
                  child: FadeTransition(
                    opacity: _fadeAni1,
                    child: R.img(
                      'ic_room_loading_1.webp',
                      width: 40,
                      height: 40,
                      package: ComponentManager.MANAGER_BASE_ROOM,
                    ),
                  ),
                ),
              ),
              PositionedDirectional(
                start: 50,
                child: ScaleTransition(
                  scale: _scaleAni2,
                  alignment: Alignment.center,
                  child: FadeTransition(
                    opacity: _fadeAni2,
                    child: R.img(
                      'ic_room_loading_2.webp',
                      width: 40,
                      height: 40,
                      package: ComponentManager.MANAGER_BASE_ROOM,
                    ),
                  ),
                ),
              ),
              PositionedDirectional(
                start: 95,
                child: ScaleTransition(
                  scale: _scaleAni3,
                  alignment: Alignment.center,
                  child: FadeTransition(
                    opacity: _fadeAni3,
                    child: R.img(
                      'ic_room_loading_3.webp',
                      width: 40,
                      height: 40,
                      package: ComponentManager.MANAGER_BASE_ROOM,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
