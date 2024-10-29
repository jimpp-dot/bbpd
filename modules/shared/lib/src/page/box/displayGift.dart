import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class GiftConfig {
  final int id;
  int num;
  final String type;
  final String name;
  final bool withEnd;
  final int size;
  final GlobalKey<DisplayGiftState> key;
  final String image;

  GiftConfig.fromJson(Map res)
      : id = Util.parseInt(res['giftId']),
        num = Util.parseInt(res['giftNum']),
        type = res['giftType'] ?? '',
        name = res['giftName'] ?? '',
        withEnd = Util.parseInt(res['giftWithEnd']) > 0,
        size = Util.parseInt(res['giftSize']),
        key = GlobalKey<DisplayGiftState>(),
        image = res['image'] ?? '';
}

enum DisplayItemGiftStatus { Wait, In, Out }

class DisplayGift extends StatefulWidget {
  final GiftConfig config;
  final ValueChanged<GiftConfig>? onComplete;
  final ValueChanged<GiftConfig>? onStart;

  const DisplayGift(
      {Key? key, required this.config, this.onComplete, this.onStart})
      : super(key: key);

  @override
  DisplayGiftState createState() => DisplayGiftState();
}

class DisplayGiftState extends State<DisplayGift>
    with TickerProviderStateMixin<DisplayGift> {
  bool _loading = true;

  final double _width = 60.0;
  final double _height = 60.0;
  late AnimationController _inController; //从发送者出来的动画控制器
  late Animation<double> _inScale;
  late Animation<double> _inOpacity;
  DisplayItemGiftStatus _status = DisplayItemGiftStatus.Wait;

  Timer? _timer;

  @override
  void initState() {
    Log.d('init~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`');
    super.initState();

    //初始化进场动画
    _initIn();
  }

  _initIn() {
    _inController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _inController.addStatusListener(_onInStatus);

    _inScale = Tween(
      begin: 1.0,
      end: 3.0,
    ).animate(
      CurvedAnimation(
        parent: _inController,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );

    _inOpacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _inController,
        curve: const Interval(
          0.2,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

//		this.widget.onStart(this.widget.config);
    _status = DisplayItemGiftStatus.In;
    _inController.reset();
    _inController.forward(from: 0.0);
    setState(() {
      _loading = false;
    });
  }

  void _onInStatus(AnimationStatus status) {
    Log.d('_onInStatus~~~~~~~~~~~~~~~~~~$status');
    if (status == AnimationStatus.completed) {
      if (!mounted) return;

      clearTimerOut();
      _timer = Timer(const Duration(milliseconds: 1000), _handleHide);
    }
  }

  void clearTimerOut() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  void _handleHide() {
    setState(() {
      _status = DisplayItemGiftStatus.Out;
    });
    widget.onComplete?.call(widget.config);
  }

  @override
  void dispose() {
    _inController.removeStatusListener(_onInStatus);
    _inController.dispose();

    clearTimerOut();
    super.dispose();
  }

  Widget _buildIn(BuildContext context, Widget? child) {
    Log.d('_buildIn~~~~~~~~~~~~~~~~~~~~~~~${_inScale.value}');

    return Container(
      width: Util.width,
      height: Util.height,
      alignment: Alignment.center,
      child: FadeTransition(
        opacity: _inOpacity,
        child: SizedBox(
          width: _width * _inScale.value,
          height: _height * _inScale.value,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: System.imageDomain + widget.config.image,
                fadeInDuration: const Duration(microseconds: 0),
                width: _width * _inScale.value,
                height: _height * _inScale.value,
              ),
              if (widget.config.num > 1) _renderGiftNum(widget.config.num),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderGiftNum(int giftNum) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: Text(
        'x$giftNum',
        style: TextStyle(
          color: const Color(0xFFFFF1B4),
          fontSize: 20 * _inScale.value,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          shadows: [
            Shadow(
              color: const Color(0xFFFF718C),
              offset: Offset(0.5 * _inScale.value, 0.5 * _inScale.value),
            ),
            Shadow(
              color: const Color(0xFFFF718C),
              offset: Offset(0.5 * _inScale.value, -0.5 * _inScale.value),
            ),
            Shadow(
              color: const Color(0xFFFF718C),
              offset: Offset(-0.5 * _inScale.value, 0.5 * _inScale.value),
            ),
            Shadow(
              color: const Color(0xFFFF718C),
              offset: Offset(-0.5 * _inScale.value, -0.5 * _inScale.value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderNormal(BuildContext context) {
    if (_status == DisplayItemGiftStatus.In) {
      Log.d('renderNormal~~~~~~~~~~~~~~~~~~~~~~~');
      return SizedBox(
        width: Util.width,
        height: Util.height,
        child: AnimatedBuilder(animation: _inController, builder: _buildIn),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _renderBody() {
    if (_loading == true) {
      return const SizedBox.shrink();
    }
    return _renderNormal(context);
  }

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      start: 0.0,
      end: 0.0,
      top: 0.0,
      bottom: 0.0,
      child: IgnorePointer(
        child: _renderBody(),
      ),
    );
  }
}
