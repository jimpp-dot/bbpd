import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class UserMicLineWidget extends StatefulWidget {
  final int level;
  final int position;
  final String levelName;
  final String title;
  final double lineWidth;
  final double halfIcon;
  final double pointX;
  final bool upgrade;
  final int category;
  final bool fromRoomSocket;
  final String lineBeforeUrl;
  final String lineUrl;
  final bool hideDefendName;

  const UserMicLineWidget(
    this.level,
    this.position,
    this.levelName,
    this.title,
    this.lineWidth,
    this.halfIcon,
    this.pointX,
    this.upgrade,
    this.category,
    this.fromRoomSocket, {
    Key? key,
    this.lineBeforeUrl = '',
    this.lineUrl = '',
    this.hideDefendName = false,
  }) : super(key: key);

  @override
  _UserMicLineWidgetState createState() => _UserMicLineWidgetState();
}

class _UserMicLineWidgetState extends State<UserMicLineWidget>
    with TickerProviderStateMixin<UserMicLineWidget> {
  double _itemW = 0;
  double _itemH = 0;
  Animation<double>? _animation;
  AnimationController? _controller;

  bool hideAni = false;

  @override
  void initState() {
    super.initState();
    // Log.d('_UserMicLineWidgetState:build fromRoomSocket=${widget.fromRoomSocket}, lineUrl=${widget.lineUrl} lineBeforeUrl=${widget.lineBeforeUrl} ');
    bool needAni = widget.fromRoomSocket &&
        (widget.lineUrl.isEmpty ||
            (widget.lineUrl.isNotEmpty && widget.lineBeforeUrl.isNotEmpty));

    _itemW = 77;
    _itemH = 45.0 + widget.lineWidth / 2.0;

    if (needAni) {
      _initAnimation();
      Future.delayed(const Duration(milliseconds: 3000), () {
        if (mounted) {
          setState(() {
            hideAni = true;
          });
        }
      });
    } else {
      hideAni = true;
    }
  }

  @override
  void dispose() {
    _releaseAnimation();
    super.dispose();
  }

  String get _lineBeforeUrl {
    String lineBeforeUrl = widget.lineBeforeUrl;
    if (lineBeforeUrl.isEmpty) {
      lineBeforeUrl =
          'static/defend_line/ic_defend_line_${widget.position}.webp';
    }
    return Util.getRemoteImgUrl(lineBeforeUrl);
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white;
    if (widget.level == 2) {
      textColor = const Color(0xFF8A3E1B);
    } else if (widget.level == 3) {
      textColor = const Color(0xFF25234B);
    }
    Log.d('_UserMicLineWidgetState:build _itemW=$_itemW, _itemH=$_itemH');
    return PositionedDirectional(
      start: (hideAni && widget.lineUrl.isEmpty)
          ? widget.pointX
          : widget.pointX - (_itemW - widget.lineWidth) / 2.0,
      top: (hideAni && widget.lineUrl.isEmpty)
          ? (widget.halfIcon - (7 / 32 * widget.lineWidth))
          : widget.halfIcon - _itemH + widget.lineWidth / 2.0,
      child: SizedBox(
        width: _itemW,
        height: _itemH,
        child: hideAni
            ? getStaticEffect()
            : Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  PositionedDirectional(
                    bottom: 0,
                    child: RepaintBoundary(
                      child: CachedNetworkImage(
                        imageUrl: _lineBeforeUrl,
                        width: widget.lineWidth,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  if (!widget.hideDefendName)
                    PositionedDirectional(
                      top: 0,
                      child: FadeTransition(
                        opacity: _controller!,
                        child: ScaleTransition(
                          scale: _animation!,
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            width: _itemW,
                            height: _itemH - widget.lineWidth / 2.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(Util.getRemoteImgUrl(
                                    'static/defend_line/ic_defend_tips_${widget.level}.webp')),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Text(
                              widget.levelName + widget.title,
                              style: R.textStyle.medium12
                                  .copyWith(color: textColor, fontSize: 9),
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
      ),
    );
  }

  Widget getStaticEffect() {
    if (widget.lineUrl.isNotEmpty) {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PositionedDirectional(
            bottom: 0,
            child: RepaintBoundary(
              child: CachedNetworkImage(
                imageUrl: widget.lineUrl,
                width: widget.lineWidth,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      );
    }
    if (widget.upgrade == true) {
      IPersonalDataManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_PERSONALDATA);
      return manager.getDefendMicLineWidget(
          widget.level, widget.position, widget.lineWidth, widget.category);
    }

    return const SizedBox.shrink();
  }

  void _releaseAnimation() {
    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }
  }

  void _initAnimation() {
    if (_controller == null) {
      _controller = AnimationController(
          duration: const Duration(milliseconds: 500), vsync: this);
      _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!)
        ..addStatusListener(_animationState);
      _controller!.forward();
    }
  }

  void _animationState(AnimationStatus status) {
    Log.d('_animationState = $status');
    if (status == AnimationStatus.completed) {}
  }
}
