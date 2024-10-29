import 'dart:math';

import 'package:flutter/material.dart';

import '../shared.dart';

typedef OnLikedTap = Future<bool> Function(bool liked);

class LikeAnimationWidget extends StatefulWidget {
  final int uid;
  final OnLikedTap onChanged;
  final bool canTap;

  const LikeAnimationWidget(this.uid, this.onChanged,
      {super.key, this.canTap = true});

  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<LikeAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  bool isAnim = false;

  bool isLiking = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    controller.addListener(() {
      if (mounted) setState(() {});
    });
//    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
//      parent: controller,
//      curve: _BounceInCurve(),
//    ));
//
//    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
//      parent: controller,
//      curve: _BounceInCurve(),
//    ));

    scaleAnimation = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInQuint,
    ));

    opacityAnimation = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInQuint,
    ));

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Log.d('AnimationStatus completed');
        isAnim = false;
//        controller.reset();
//        setState(() {});
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        Log.d('AnimationStatus dismissed');
        isAnim = false;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _offsetAnim() {
    if (isAnim) {
      Log.d('_offsetAnim return');
      return;
    }

//    setState(() {
//      isAnim = true;
//    });
    controller.forward();
  }

  void _onTap(bool liked) async {
    if (!widget.canTap || isLiking) {
      return;
    }

    isLiking = true;

    bool suc = await widget.onChanged(!liked);

    if (suc) {
      _offsetAnim();
    }

    isLiking = false;
  }

  @override
  Widget build(BuildContext context) {
    ChatMatchItem friendCard =
        objectCache.get('$Friend_Card_Cache_Key${widget.uid}');
    bool liked = friendCard.liked;
    int likedNum = friendCard.liked_num;

    return InkWell(
      onTap: () {
        _onTap(liked);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(width: 6),
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                ScaleTransition(
                  scale: scaleAnimation,
                  child: FadeTransition(
                    opacity: opacityAnimation,
                    child: R.img(
                      liked
                          ? 'moment/ic_rush_like.webp'
                          : 'moment/ic_rush_like_default.webp',
                      width: 20,
                      height: 20,
                      color: liked ? null : R.color.thirdTextColor,
                      package: ComponentManager.MANAGER_BASE_CORE,
                    ),
                  ),
                ),
//                if (isAnim)
//                  ScaleTransition(
//                    scale: scaleAnimation,
//                    child: FadeTransition(
//                      opacity: opacityAnimation,
//                      child: R.img(
//                        liked ? 'moment/ic_rush_like.svg' : 'moment/ic_rush_like_default.svg',
//                        width: 20,
//                        height: 20,
//                        package: ComponentManager.MANAGER_BASE,
//                      ),
//                    ),
//                  )
//                else
//                  R.img(
//                    liked ? 'moment/ic_rush_like.svg' : 'moment/ic_rush_like_default.svg',
//                    width: 20,
//                    height: 20,
//                    package: ComponentManager.MANAGER_BASE,
//                  ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '$likedNum',
            style: TextStyle(
                color:
                    liked ? R.color.thirdBrightColor : R.color.thirdTextColor,
                fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _BounceInCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    double factor = 0.4;

    return pow(2, -10 * t) * sin((t - factor / 4) * (2 * pi) / factor) + 1;
  }
}
