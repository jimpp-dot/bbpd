import 'package:chat_room/k.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'welcome_item_info.dart';

/// 入场飘屏
/// 显示条件满足任何一个：1. 有座驾 2. 爵位为国王或者皇帝
class LargeWelcome extends StatefulWidget {
  final Welcome data;
  final ValueChanged<Welcome> onComplete;

  const LargeWelcome({super.key, required this.data, required this.onComplete});

  @override
  _State createState() => _State();
}

class _State extends State<LargeWelcome> with SingleTickerProviderStateMixin<LargeWelcome> {
  late AnimationController _controller;
  late Animation _scale;
  late Animation<double> _opacity;
  late Animation<double> _hotOpacity;
  late Animation _ty;

  bool _imageLoading = false;
  String? _effectLocalPath; // 入场动效本地路径

  double _topDistance = 0; // 距顶部距离

  @override
  void initState() {
    super.initState();
    _init();
    // 如果有入场横幅动效，先下载动效图片再显示
    if (widget.data.effect != null) {
      _imageLoading = true;
      DownloadManager.downloadImage(Util.getRemoteImgUrl(widget.data.effect!.image)).then((String? value) {
        _effectLocalPath = value;
      }).whenComplete(() {
        if (!mounted) return;
        _imageLoading = false;
        WidgetsBinding.instance.addPostFrameCallback(_onLayout);
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback(_onLayout);
    }
  }

  _onLayout(Duration timeStamp) {
    if (!mounted) return;
    final RenderBox box = context.findRenderObject() as RenderBox;
    _topDistance = box.localToGlobal(Offset.zero).dy;
    _controller.forward();
  }

  _init() {
    _controller = AnimationController(duration: const Duration(milliseconds: 750), vsync: this);
    _controller.addStatusListener(_onStatusChanged);
    _controller.addListener(_onValueChanged);
    _opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.linear),
      ),
    );
    _scale = Tween(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.decelerate),
      ),
    );
    _ty = Tween(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.decelerate),
      ),
    );
    _hotOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.linear),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_onValueChanged);
    _controller.removeStatusListener(_onStatusChanged);
    _controller.dispose();
    super.dispose();
  }

  _onStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      JsTimer.setTimeout(() {
        widget.onComplete(widget.data);
      }, 1000 * 5);
    }
  }

  _onValueChanged() {
    setState(() {});
  }

  Widget _renderTitle() {
    double tx = (1 - _scale.value) * 140 / 2;
    double ty = (1 - _scale.value) * 140 / 2;
    if (widget.data.hotNum > 0) {
      return Stack(
        children: <Widget>[
          Container(
            transform: Matrix4.identity()
              ..translate(tx, ty)
              ..scale(_scale.value, _scale.value),
            child: NobilityUtil.titleBigImage(widget.data.titleNew, 140, 140),
          ),
          PositionedDirectional(
            end: 0.0,
            top: 5.0,
            child: Container(
              transform: Matrix4.identity()..translate(0.0, _ty.value),
              child: FadeTransition(
                opacity: _hotOpacity,
                child: Row(
                  children: <Widget>[
                    R.img("large_welcome_hot.png", width: 27.0, fit: BoxFit.cover, package: ComponentManager.MANAGER_BASE_ROOM),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 3.0),
                      child: Text(
                        "${widget.data.hotNum}",
                        style: const TextStyle(color: Color(0xFFff6609), fontSize: 16.0, fontWeight: FontWeight.normal),
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
    } else {
      int currentNobility = NobilityUtil.currentIntNobility(oldNobility: widget.data.title, newNobility: widget.data.titleNew);
      return Container(
        transform: Matrix4.identity()
          ..translate(tx, ty)
          ..scale(_scale.value, _scale.value),
        child: currentNobility >= NobilityUtil.getInt(NobilityType.King)
            ? NobilityUtil.titleBigImage(widget.data.titleNew, 140, 140)
            : const SizedBox.shrink(),
      );
    }
  }

  String getRankStr() {
    String topType = '';
    int topValue = -1;
    if (widget.data.topWeek > 0 && widget.data.topWeek <= 3) {
      topType = K.room_rank_week;
      topValue = widget.data.topWeek;
    } else if (widget.data.topMonth > 0 && widget.data.topMonth <= 3) {
      topType = K.room_rank_month;
      topValue = widget.data.topMonth;
    } else if (widget.data.top > 0 && widget.data.top <= 3) {
      topType = K.room_rank_total;
      topValue = widget.data.top;
    } else {}

    if (topValue == 1) {
      return K.room_rank_1([topType]);
    } else if (topValue == 2) {
      return K.room_rank_2([topType]);
    } else if (topValue == 3) {
      return K.room_rank_3([topType]);
    } else {
      return '';
    }
  }

  Widget _renderKnight() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(top: 360 * Util.height / 812 + 16, bottom: 10),
          padding: const EdgeInsetsDirectional.only(start: 15, end: 15, top: 4),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                R.imagePath('bg_knight_welcome_${widget.data.knightLevel}.png', package: ComponentManager.MANAGER_BASE_ROOM),
              ),
            ),
          ),
          width: 180,
          height: 28,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  widget.data.knightTargetName ?? '',
                  maxLines: 1,
                  style: R.textStyle.medium12.copyWith(fontSize: 11, color: const Color(0xFFFFFFFF)),
                ),
              ),
              Text(
                K.room_of + (widget.data.knightName ?? ''),
                style: R.textStyle.medium12.copyWith(fontSize: 11, color: const Color(0xFFFFFFFF)),
              )
            ],
          ),
        ),
        PositionedDirectional(
          top: 360 * Util.height / 812,
          width: 66,
          height: 31,
          child: R.img('ic_knight_welcome_${widget.data.knightLevel}.png', package: ComponentManager.MANAGER_BASE_ROOM),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      start: 0.0,
      top: -_topDistance,
      end: 0.0,
      bottom: 0.0,
      child: IgnorePointer(
        child: _imageLoading ? const SizedBox.shrink() : _renderContent(),
      ),
    );
  }

  Widget _renderContent() {
    bool showKnight = false;
    if (widget.data.knightLevel > 0) {
      showKnight = true;
    }
    return FadeTransition(
      opacity: _opacity,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          fit: StackFit.expand,
          children: <Widget>[
            if (!showKnight)
              PositionedDirectional(
                start: 0.0,
                end: 0.0,
                child: CachedNetworkImage(
                  imageUrl: Util.getImgUrl('large_welcome_bg.png', package: ComponentManager.MANAGER_BASE_ROOM),
                  width: MediaQuery.of(context).size.width,
                  cachedWidth: MediaQuery.of(context).size.width.px,
                  fit: BoxFit.fitWidth,
                ),
              ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: showKnight ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: <Widget>[
                showKnight
                    ? _renderKnight()
                    : Container(
                        width: 140,
                        height: 140,
                        alignment: Alignment.center,
                        child: _renderTitle(),
                      ),
                WelcomeItemInfo(welcome: widget.data, effectLocalPath: _effectLocalPath),
              ],
            )
          ],
        ),
      ),
    );
  }
}
