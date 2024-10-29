import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';

/// ktv氛围工具
class KtvAtmosphereWidget extends StatefulWidget {
  final ChatRoomData room;

  const KtvAtmosphereWidget({super.key, required this.room});

  @override
  _KtvAtmosphereWidgetState createState() => _KtvAtmosphereWidgetState();
}

class _KtvAtmosphereWidgetState extends State<KtvAtmosphereWidget>
    with TickerProviderStateMixin {
  final List<String> _btnTitles = [
    K.room_ktv_atmosphere_like,
    K.room_ktv_atmosphere_heart,
    K.room_ktv_atmosphere_love,
    K.room_ktv_atmosphere_call
  ];
  final List<String> _btnImgs = [
    'ktv/ktv_atmosphere_like.webp',
    'ktv/ktv_atmosphere_heart.webp',
    'ktv/ktv_atmosphere_love.webp',
    'ktv/ktv_atmosphere_call.webp'
  ];
  bool _expand = false;
  final List<bool> _canTaps = [];
  final List<int> _tapTimes = [];

  Timer? _timer;

  int get _tapInterval =>
      Util.parseInt(widget.room.config?.ktvInfo?.propUseTime, 0) > 0
          ? Util.parseInt(widget.room.config?.ktvInfo?.propUseTime, 0)
          : 300;

  late AnimationController _controller; //右侧按钮动画
  late Animation _animation;

  late AnimationController _toolController; //氛围按钮动画
  late Animation _toolAnimation;

  bool _showKTVAtmosphere = false;

  @override
  void initState() {
    super.initState();

    for (var _ in _btnTitles) {
      _canTaps.add(true);
      _tapTimes.add(_tapInterval);
    }

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        if (mounted) setState(() {});
      });
    _animation = Tween<double>(begin: 0.5, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _controller.forward();

    _toolController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100))
      ..addListener(() {
        if (mounted) setState(() {});
      });
    _toolAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _toolController, curve: Curves.linear));

    _refreshKTVAtmosphere();
  }

  /// KTV氛围工具
  void _refreshKTVAtmosphere() {
    Future.delayed(
        Duration(
            seconds:
                Util.parseInt(widget.room.config?.ktvInfo?.propShowTime, 0) > 0
                    ? Util.parseInt(
                        widget.room.config?.ktvInfo?.propShowTime, 0)
                    : 60), () {
      if (mounted) {
        setState(() {
          _showKTVAtmosphere = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _timer?.cancel();
    _controller.dispose();
    _toolController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_showKTVAtmosphere == false) return const SizedBox.shrink();

    double toolWidth = Util.width - 12.0 - 44.0;

    return Stack(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            IgnorePointer(
              child: SizedBox(
                height: 44,
                width: toolWidth,
              ),
            ),
            PositionedDirectional(
              start: toolWidth * _toolAnimation.value,
              child: _renderTools(),
            ),
          ],
        ),
        PositionedDirectional(
          top: 6.0,
          end: 0.0,
          child: _renderExpandIcon(),
        ),
      ],
    );
  }

  Widget _renderTools() {
    return Container(
      height: 44,
      color: const Color(0XFF110326),
      alignment: AlignmentDirectional.center,
      child: Row(
        children: _btnTitles
            .asMap()
            .map((index, value) => MapEntry(
                index,
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (_canTaps[index] == false) return;

                    _onTap(index);
                  },
                  child: Stack(
                    children: [
                      Container(
                          width: (Util.width -
                                  12.0 * (_btnTitles.length + 2) -
                                  32.0) /
                              _btnTitles.length,
                          height: 32.0,
                          alignment: AlignmentDirectional.center,
                          margin: const EdgeInsetsDirectional.only(end: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: Colors.white.withOpacity(0.12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              R.img(_btnImgs[index],
                                  width: 30,
                                  height: 30,
                                  package: ComponentManager.MANAGER_BASE_ROOM),
                              Text(
                                _btnTitles[index],
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                      if (_canTaps[index] == false)
                        PositionedDirectional(
                          start: 0,
                          top: 0,
                          bottom: 0,
                          end: 0,
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            margin: const EdgeInsetsDirectional.only(end: 12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.0),
                              color: Colors.black.withOpacity(0.4),
                            ),
                            child: Text(
                              _buildTapTime(index),
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                    ],
                  ),
                )))
            .values
            .toList(),
      ),
    );
  }

  String _buildTapTime(int index) {
    String time = '';
    int mins = (_tapTimes[index] / 60).floor();
    int seconds = _tapTimes[index] % 60;

    if (mins >= 10) {
      time += '$mins:';
    } else {
      time += '0$mins:';
    }

    if (seconds >= 10) {
      time += '$seconds';
    } else {
      time += '0$seconds';
    }

    return time;
  }

  Widget _renderExpandIcon() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (mounted) {
          setState(() {
            _expand = !_expand;

            if (_expand == false) {
              _controller.reset();
              _controller.forward();

              _toolController.reverse();
            } else {
              _toolController.forward();
            }
          });
        }
      },
      child: _expand
          ? Row(
              children: [
                Container(
                  width: 32.0,
                  height: 32.0,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white.withOpacity(0.12),
                  ),
                  child: R.img('ktv/ktv_atmosphere_close.webp',
                      width: 20,
                      height: 20,
                      package: ComponentManager.MANAGER_BASE_ROOM),
                ),
                const SizedBox(
                  width: 12.0,
                ),
              ],
            )
          : Container(
              width: 44.0 * _animation.value,
              height: 32.0,
              padding: const EdgeInsetsDirectional.only(
                  start: 6.0, top: 6.0, bottom: 6.0),
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(16.0),
                    bottomStart: Radius.circular(16.0)),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.12),
                    Colors.white.withOpacity(0.0)
                  ],
                ),
              ),
              child: R.img('ktv/ktv_atmosphere_expand.webp',
                  width: 20,
                  height: 20,
                  package: ComponentManager.MANAGER_BASE_ROOM),
            ),
    );
  }

  _onTap(int index) async {
    XhrResponse response = await Xhr.getJson(
        '${System.domain}ktvchorus/useProp?rid=${widget.room.rid}&prop_id=${index + 1}',
        throwOnError: false);

    BaseResponse res = BaseResponse.parse(response);

    if (res.success == true) {
      _canTaps[index] = false;

      _refreshTimer();
    } else if (res.msg != null) {
      Fluttertoast.showCenter(msg: res.msg);
    }
  }

  _refreshTimer() {
    _timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      _canTaps.asMap().forEach((key, value) {
        if (value == false) {
          if (_tapTimes[key] > 0) {
            _tapTimes[key]--;
          } else {
            _canTaps[key] = true;
            _tapTimes[key] = _tapInterval;
          }

          if (mounted) {
            setState(() {});
          }
        }
      });

      if (!_canTaps.contains(false)) {
        _timer?.cancel();
        _timer = null;
      }
    });
  }
}
