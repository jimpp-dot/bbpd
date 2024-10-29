import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../chat_room.dart';

/// 房间热度增加动效
///
class HotAnimWidget extends StatefulWidget {
  final ChatRoomData room;

  const HotAnimWidget({Key? key, required this.room}) : super(key: key);

  @override
  _HotAnimWidgetState createState() => _HotAnimWidgetState();
}

class _HotAnimWidgetState extends State<HotAnimWidget> {
  final List<HotConfig> _data = [];

  @override
  void initState() {
    super.initState();
    widget.room.addListener(RoomConstant.Event_Hot_Num_Add, _handMsg);
  }

  @override
  void dispose() {
    _data.clear();
    widget.room.removeListener(RoomConstant.Event_Hot_Num_Add, _handMsg);
    super.dispose();
  }

  void _handMsg(String name, Object? data) {
    if (data == null || data is! Map || !mounted) return;
    Log.d('TreasureWidget._handMsg, name: $name, data: $data');

    Map json = data;
    int hot = Util.parseInt(json['hot']);
    if (hot <= 0) return;

    _data.add(HotConfig(GlobalKey(), hot.toString()));
    refresh();
  }

  List<Widget> _buildHotAnim() {
    return _data
        .map((e) => HotAnim(config: e, key: e.key, onFinished: _onFinished))
        .toList();
  }

  _onFinished(HotConfig config) {
    if (_data.contains(config)) {
      _data.remove(config);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 36.0),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          ..._buildHotAnim(),
        ],
      ),
    );
  }
}

class HotAnim extends StatefulWidget {
  final HotConfig config;
  final OnHotAnimFinished? onFinished;

  const HotAnim({Key? key, required this.config, this.onFinished})
      : super(key: key);

  @override
  _HotAnimState createState() => _HotAnimState();
}

typedef OnHotAnimFinished = void Function(HotConfig config);

class _HotAnimState extends State<HotAnim> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> animation;
  late Animation<double> _opacity;

  bool _inAnimate = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.forward) {
          _inAnimate = true;
        } else if (status == AnimationStatus.reverse) {
          _inAnimate = false;
        } else if (status == AnimationStatus.completed) {
          _inAnimate = false;
          widget.onFinished?.call(widget.config);
        }
      });
    animation =
        Tween(begin: const Offset(0, -0.6), end: const Offset(0, -1.2)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.67, curve: Curves.easeInOut),
      ),
    );

    _opacity = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 1.0), weight: 3),
      TweenSequenceItem<double>(tween: ConstantTween(1.0), weight: 6),
      TweenSequenceItem<double>(tween: Tween(begin: 1, end: 0), weight: 6),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: animation,
        child: _buildAnimWidget(),
      ),
    );
  }

  Widget _buildAnimWidget() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img(
              'ic_hot.svg',
              width: 16,
              height: 16,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
            const SizedBox(width: 2),
            NumText(
              '+${widget.config.num}',
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFFF9E94),
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ],
    );
  }
}

class HotConfig {
  final GlobalKey key;
  final String num;

  HotConfig(this.key, this.num);
}
