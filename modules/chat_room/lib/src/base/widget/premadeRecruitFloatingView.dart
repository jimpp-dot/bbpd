import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class PremadeRecruitFloatingView extends StatefulWidget {
  final int matchStatus; //当前征召状态，控制页面显示
  final int? rid; //默认点击事件需要
  final String? typeLabel; //默认点击事件需要
  final String? adminRole; //默认点击事件需要
  final VoidCallback? onTap; //点击事件回调
  final VoidCallback? onRecruit; //点击征召回调，用来处理埋点
  final int color1; //颜色1
  final int color2; //颜色2
  final String? title; // 冲鸭征召需要：游戏title

  const PremadeRecruitFloatingView(
    this.matchStatus, {
    super.key,
    this.rid,
    this.typeLabel,
    this.adminRole,
    this.onTap,
    this.onRecruit,
    this.color1 = 0xffef4747,
    this.color2 = 0xffdf4286,
    this.title,
  });

  @override
  _PremadeRecruitFloatingViewState createState() =>
      _PremadeRecruitFloatingViewState();
}

class _PremadeRecruitFloatingViewState extends State<PremadeRecruitFloatingView>
    with SingleTickerProviderStateMixin {
  bool _expanded = true;
  late AnimationController _controller;
  Animation<double>? _sizeTween;
  late GlobalKey _globalKey;
  double _contentWidth = 0;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();

    _globalKey = GlobalKey();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  void _startExpandAnimation(bool isExpanding) {
    final CurvedAnimation curve = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1, curve: Curves.easeOut));
    double begin, end;
    if (isExpanding) {
      begin = 0;
      end = _contentWidth;
    } else {
      begin = _contentWidth;
      end = 0;
    }

    _sizeTween = Tween<double>(begin: begin, end: end).animate(curve)
      ..addListener(() {
        _refresh();
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _isAnimating = false;
        }
      });
    _controller.reset();
    _controller.forward();
    _isAnimating = true;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.matchStatus == 1
        ? Shimmer(
            period: const Duration(milliseconds: 2000),
            gradient: LinearGradient(
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.1),
                  Colors.transparent,
                ],
                stops: const [
                  0.0,
                  0.45,
                  0.5,
                  0.5,
                  1.0
                ]),
            child: _buildContent(context),
          )
        : _buildContent(context);
  }

  Container _buildContent(BuildContext context) {
    int color1 = widget.color1;
    int color2 = widget.color2;
    return Container(
//      width: 172,
      height: 36,
      decoration: BoxDecoration(
//        color: R.color.accentColor,
        borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(100), bottomStart: Radius.circular(100)),
        gradient: LinearGradient(
          colors: [Color(color1), Color(color2)],
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
        ),
      ),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (_isAnimating) {
                return;
              }

              _expanded = !_expanded;
              double width = _globalKey.currentContext?.size?.width ?? 0;
              if (width > 0) {
                _contentWidth = width;
              }
//                Log.d('_PremadeRecruitFloatingViewState.build _expanded = $_expanded, _contentWidth = $_contentWidth, width = $width');
              _startExpandAnimation(_expanded);
              _refresh();
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: RotatedBox(
                quarterTurns: _expanded ? 0 : 2,
                child: R.img(
                  'ic_retract.svg',
                  width: 24,
                  height: 24,
                  fit: BoxFit.fill,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: _getMaxContentWidth(),
            ),
            child: GestureDetector(
              onTap: () async {
                if (widget.onTap != null) {
                  widget.onTap!();
                }
              },
              child: Offstage(
                offstage: !(_expanded || _isAnimating),
                child: Padding(
                  key: _globalKey,
                  padding: const EdgeInsetsDirectional.only(end: 6),
                  child: Text(
                    _getRecruitDesc(),
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ),
          ),
          Container(width: 2),
        ],
      ),
    );
  }

  String _getRecruitDesc() {
    return widget.matchStatus == 0 ? K.room_call_for : K.room_call_for_stop;
  }

  double _getMaxContentWidth() {
    if (_expanded) {
      if (_isAnimating) {
        return _sizeTween?.value ?? 0;
      }
      return 300;
    } else {
      if (_isAnimating) {
        return _sizeTween?.value ?? 0;
      }
      return 0;
    }
  }

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }
}
