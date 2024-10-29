import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';

/// 麦位冠名动效
///
class MicAwardNameAnim extends StatefulWidget {
  final String name;
  final int level;
  final VoidCallback onAnimFinished;

  const MicAwardNameAnim(
      {super.key,
      required this.name,
      this.level = 0,
      required this.onAnimFinished});

  @override
  _MicAwardNameAnimState createState() => _MicAwardNameAnimState();
}

class _MicAwardNameAnimState extends State<MicAwardNameAnim>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _opController;
  late AnimationController _opController1;
  late AnimationController _outTransController;
  late AnimationController _inTransController;

  late Animation _transitionAniOut;
  late Animation _transitionAniIn;
  late Animation<double> _outOpacityAni;
  late Animation<double> _inOpacityAni;

  late Animation<double> _animation1;

  final int fpsTime = 50;

  bool _showBigArrow = false;
  bool _showSmallArrow = false;
  bool _showRingBg = false;

  @override
  void initState() {
    super.initState();

    /// 0-3f   Scale 1.25-1
    _scaleController = AnimationController(
        vsync: this, duration: Duration(milliseconds: fpsTime * 3));

    /// 0-5f   Opacity  0-100
    _opController = AnimationController(
        vsync: this, duration: Duration(milliseconds: fpsTime * 5));
    _opController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (!mounted) return;
        _outTransController.forward();
        Future.delayed(Duration(milliseconds: fpsTime * 3)).then((value) {
          if (mounted) {
            _inTransController.forward();
          }
        });
      }
    });

    /// 外部箭头动效
    /// 5-10f 左右两边的三角 Position 移动7/3
    /// Opacity 0-100
    _outTransController = AnimationController(
        vsync: this, duration: Duration(milliseconds: fpsTime * 5));
    _transitionAniOut =
        Tween<double>(begin: 0.0, end: 7 / 3).animate(_outTransController)
          ..addListener(() {
            if (_showBigArrow == false) {
              _showBigArrow = true;
            }
            if (mounted) setState(() {});
          });
    _outOpacityAni =
        Tween<double>(begin: 0.0, end: 1.0).animate(_outTransController)
          ..addListener(() {
            if (mounted) setState(() {});
          });

    /// 内部箭头动效
    /// 8-15f 内部三角 P 移动5/3
    /// Opacity 0-100
    _inTransController = AnimationController(
        vsync: this, duration: Duration(milliseconds: fpsTime * 5));
    _transitionAniIn =
        Tween<double>(begin: 0.0, end: 5 / 3).animate(_inTransController)
          ..addListener(() {
            if (_showSmallArrow == false) {
              _showSmallArrow = true;
            }
            if (mounted) setState(() {});
          });

    _inOpacityAni =
        Tween<double>(begin: 0.0, end: 1.0).animate(_inTransController)
          ..addListener(() {
            if (mounted) setState(() {});
          });

    /// 整体透明度
    _opController1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: fpsTime * 5));
    _animation1 = Tween<double>(begin: 1, end: 0).animate(_opController1)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (!mounted) return;
          widget.onAnimFinished();
        }
      });

    Future.delayed(Duration(milliseconds: fpsTime * 30)).then((value) {
      if (mounted) _opController1.forward();
    });

    /// 光圈
    Future.delayed(Duration(milliseconds: fpsTime * 15)).then((value) {
      _showRingBg = true;
      if (mounted) setState(() {});
    });

    _scaleController.forward();
    _opController.forward();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _opController.dispose();
    _outTransController.dispose();
    _inTransController.dispose();
    _opController1.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      double ratio = width / 92;
      return FadeTransition(
        opacity: _animation1,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            FadeTransition(
              opacity:
                  Tween<double>(begin: 0.0, end: 1.0).animate(_opController),
              child: ScaleTransition(
                scale: Tween(begin: 1.25, end: 1.0).animate(_scaleController),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Positioned.fill(
                      child: R.img(
                        widget.level > 0
                            ? RoomAssets.naming_bg_award_title_1_webp
                            : RoomAssets.naming_bg_award_title_webp,
                        package: RoomAssets.package,
                        width: 92 * ratio,
                        height: 92 * ratio,
                      ),
                    ),
                    PositionedDirectional(
                      top: ratio * 29,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 69 * ratio),
                        child: Text(
                          widget.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12 * ratio,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (widget.level > 0)
              Transform.scale(
                scale: 1.6,
                child: MultiframeImage.network(
                  Util.getRemoteImgUrl('static/room/330_123.webp'),
                  'room',
                  loop: false,
                ),
              )
            else
              Positioned.fill(
                child: MultiframeImage.network(
                  Util.getRemoteImgUrl('static/room/naming_bg_anim.webp'),
                  'room',
                  loop: false,
                ),
              ),
            if (_showBigArrow) ...[
              PositionedDirectional(
                start: 7 / 3 - _transitionAniOut.value,
                child: FadeTransition(
                  opacity: _outOpacityAni,
                  child: R.img(
                    RoomAssets.naming_arrow_big_left_webp,
                    width: 13,
                    height: 40,
                    package: RoomAssets.package,
                  ),
                ),
              ),
              PositionedDirectional(
                end: 7 / 3 - _transitionAniOut.value,
                child: FadeTransition(
                  opacity: _outOpacityAni,
                  child: R.img(
                    RoomAssets.naming_arrow_big_right_webp,
                    width: 13,
                    height: 40,
                    package: RoomAssets.package,
                  ),
                ),
              ),
            ],
            if (_showSmallArrow) ...[
              PositionedDirectional(
                start: 5 + 5 / 3 - _transitionAniIn.value,
                child: FadeTransition(
                  opacity: _inOpacityAni,
                  child: R.img(
                    RoomAssets.naming_arrow_small_left_webp,
                    width: 8,
                    height: 26,
                    package: RoomAssets.package,
                  ),
                ),
              ),
              PositionedDirectional(
                end: 5 + 5 / 3 - _transitionAniIn.value,
                child: FadeTransition(
                  opacity: _inOpacityAni,
                  child: R.img(
                    RoomAssets.naming_arrow_small_right_webp,
                    width: 8,
                    height: 26,
                    package: RoomAssets.package,
                  ),
                ),
              ),
            ],
          ],
        ),
      );
    });
  }
}
