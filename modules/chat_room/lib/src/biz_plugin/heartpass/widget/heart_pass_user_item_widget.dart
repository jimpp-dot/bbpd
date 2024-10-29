import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/protobuf/generated/plugin_lucky.pb.dart';

/// 关卡的用户UI
class HeartPassUserItemWidget extends StatefulWidget {
  final ResLuckyBaseUser user;
  final bool isBoss;
  final Offset position;
  final Size containerSize;
  final int index;
  final ValueChanged<int> onTap;

  const HeartPassUserItemWidget(
      {super.key,
      required this.user,
      required this.isBoss,
      required this.containerSize,
      required this.position,
      required this.index,
      required this.onTap});

  @override
  _HeartPassUserItemWidgetState createState() =>
      _HeartPassUserItemWidgetState();
}

class _HeartPassUserItemWidgetState extends State<HeartPassUserItemWidget>
    with TickerProviderStateMixin {
  late AnimationController _bossAnimationController; // boss呼吸动画
  late AnimationController _moveAnimationController; // 关卡移动动画
  late Offset _currentPosition; // icon当前位置
  Offset? _newPosition; // icon变化后的位置

  @override
  void initState() {
    _currentPosition = widget.position;
    _initAnimate();
    _controlBossAnimate(true);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HeartPassUserItemWidget oldWidget) {
    if (widget.position != _currentPosition) {
      _newPosition = widget.position;
      _moveAnimationController.reset();
      _moveAnimationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _bossAnimationController.dispose();
    _moveAnimationController.dispose();
    super.dispose();
  }

  void _initAnimate() {
    _bossAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          _bossAnimationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          Future.delayed(const Duration(milliseconds: 300)).whenComplete(() {
            if (!mounted) return;
            _bossAnimationController.forward();
          });
        }
      });
    _moveAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          _currentPosition = widget.position;
          setState(() {});
        }
      });
  }

  /// 老板闯关动画
  void _controlBossAnimate(bool start) {
    if (!widget.isBoss) return;
    if (start) {
      // 开始动画
      if (!_bossAnimationController.isAnimating) {
        _bossAnimationController.forward();
      }
    } else {
      // 结束动画
      if (_bossAnimationController.isAnimating) {
        _bossAnimationController.stop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Offset start = _currentPosition;
    Offset end = _newPosition ?? _currentPosition;
    return PositionedTransition(
        rect: RelativeRectTween(
          begin: RelativeRect.fromSize(
              Rect.fromLTWH(start.dx, start.dy, 29.dp, 32.dp),
              widget.containerSize),
          end: RelativeRect.fromSize(
              Rect.fromLTWH(end.dx, end.dy, 29.dp, 32.dp),
              widget.containerSize),
        ).animate(_moveAnimationController),
        child: GestureDetector(
          onTap: () {
            widget.onTap(widget.index);
          },
          child: widget.isBoss
              ? _renderBoss(widget.user)
              : _renderLevelUser(widget.user),
        ));
  }

  /// 关卡用户
  Widget _renderLevelUser(ResLuckyBaseUser user) {
    return Container(
      width: 29.dp,
      height: 32.dp,
      padding: EdgeInsetsDirectional.only(
          bottom: 4.dp, start: 2.dp, end: 2.dp, top: 2.dp),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image:
                AssetImage(RoomAssets.chat_room$heartpass_ic_mic_header_webp),
            fit: BoxFit.fill),
      ),
      child: CommonAvatar(path: user.icon, size: 25.dp, shape: BoxShape.circle),
    );
  }

  /// 老板
  Widget _renderBoss(ResLuckyBaseUser user) {
    return RepaintBoundary(
      child: Transform.scale(
        scale: 1.2,
        child: Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                width: 29.dp,
                height: 32.dp,
              ),
              PositionedTransition(
                rect: RelativeRectTween(
                        begin: RelativeRect.fromSize(
                            Rect.fromLTWH(0.dp, 0.dp, 29.dp, 32.dp),
                            Size(29.dp, 32.dp)),
                        end: RelativeRect.fromSize(
                            Rect.fromLTWH(0.dp, -4.dp, 29.dp, 32.dp),
                            Size(29.dp, 32.dp)))
                    .animate(_bossAnimationController),
                child: Container(
                  width: 29.dp,
                  height: 32.dp,
                  padding: EdgeInsetsDirectional.only(
                      bottom: 4.dp, start: 2.dp, end: 2.dp, top: 2.dp),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            RoomAssets.chat_room$heartpass_ic_mic_header_webp),
                        fit: BoxFit.fill),
                  ),
                  child: CommonAvatar(
                      path: user.icon, size: 25.dp, shape: BoxShape.circle),
                ),
              ),
              PositionedTransition(
                rect: RelativeRectTween(
                        begin: RelativeRect.fromSize(
                            Rect.fromLTWH(-18.dp, 0.dp, 33.dp, 32.dp),
                            Size(29.dp, 32.dp)),
                        end: RelativeRect.fromSize(
                            Rect.fromLTWH(-18.dp, -8.dp, 33.dp, 32.dp),
                            Size(32.dp, 32.dp)))
                    .animate(_bossAnimationController),
                child: R.img(RoomAssets.chat_room$heartpass_ic_sword_webp,
                    width: 33.dp, height: 33.dp, fit: BoxFit.fill),
              ),
              PositionedTransition(
                rect: RelativeRectTween(
                        begin: RelativeRect.fromSize(
                            Rect.fromLTWH(21.dp, 11.dp, 18.dp, 18.dp),
                            Size(29.dp, 32.dp)),
                        end: RelativeRect.fromSize(
                            Rect.fromLTWH(21.dp, 3.dp, 18.dp, 18.dp),
                            Size(29.dp, 32.dp)))
                    .animate(_bossAnimationController),
                child: R.img(RoomAssets.chat_room$heartpass_ic_shield_webp,
                    width: 18.dp, height: 18.dp, fit: BoxFit.fill),
              ),
            ]),
      ),
    );
  }
}
