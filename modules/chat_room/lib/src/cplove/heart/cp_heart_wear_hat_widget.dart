import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import 'cp_heart_hat_avatar.dart';
import 'cp_heart_util.dart';

/// 心动速配房，戴帽子飘屏消息
class CpHeartWearHatWidget extends StatefulWidget {
  final ChatRoomData room;

  const CpHeartWearHatWidget({Key? key, required this.room}) : super(key: key);

  @override
  _CpHeartWearHatWidgetState createState() => _CpHeartWearHatWidgetState();
}

class _CpHeartWearHatWidgetState extends State<CpHeartWearHatWidget> {
  bool _showing = false;

  static const double _BOX_WIDTH = 148.0;

  ValueAnimation? _translateX;
  ValueAnimation _opacity = Animated.value(1.0);
  Sequence? _sequence;

  static const int _DURATION = 1500;

  static const String _LOG_TAG = 'CpHeartWearHatWidget';

  bool _translateXEnd = false;

  int _lastWomenHatPos = -1;
  int _lastWomenLevel = 0;

  int _lastManHatPos = -1;
  int _lastManLevel = 0;

  final List<RoomPosition> _listData = [];

  RoomPosition? _currentPos;

  @override
  void initState() {
    super.initState();
    widget.room
        .addListener(RoomConstant.EVENT_REFRESH_MIC_LIST, _onMicListChange);
    widget.room.addListener(RoomConstant.EVENT_CP_HEART_NEW_TURN, _onNewTurn);
    _initData();
  }

  void _initData() {
    RoomPosition womanPos = _findMaxPkg(_womenList, _lastWomenHatPos);
    RoomPosition manPos = _findMaxPkg(_manList, _lastManHatPos);

    _lastWomenHatPos = womanPos.position;
    _lastWomenLevel = _getLevel(womanPos.package);

    _lastManHatPos = manPos.position;
    _lastManLevel = _getLevel(manPos.package);

    _log();
  }

  List<RoomPosition> get _womenList => [
        widget.room.positions[1],
        widget.room.positions[2],
        widget.room.positions[5],
        widget.room.positions[6]
      ];

  List<RoomPosition> get _manList => [
        widget.room.positions[3],
        widget.room.positions[4],
        widget.room.positions[7],
        widget.room.positions[8]
      ];

  void _log() {
    Log.d(
        tag: _LOG_TAG,
        '_lastWomenHatPos = $_lastWomenHatPos, _lastWomenLevel = $_lastWomenLevel, _lastManHatPos = $_lastManHatPos,  _lastManLevel = $_lastManLevel');
  }

  void _onNewTurn(String type, dynamic data) {
    Log.d(tag: _LOG_TAG, '_onNewTurn clear_pwc..........last.......data');
    _lastWomenHatPos = -1;
    _lastWomenLevel = 0;
    _lastManHatPos = -1;
    _lastManLevel = 0;
  }

  void _onMicListChange(String type, dynamic data) {
    Log.d(tag: _LOG_TAG, 'type = $type data = $data');
    RoomPosition womanPos = _findMaxPkg(_womenList, _lastWomenHatPos);
    RoomPosition manPos = _findMaxPkg(_manList, _lastManHatPos);

    _tryShow(womanPos);
    _tryShow(manPos);
  }

  void _tryShow(RoomPosition pos) {
    if (pos.uid <= 0) {
      return;
    }

    int currentLevel = _getLevel(pos.package);
    if (currentLevel == 0) {
      return;
    }

    bool woman = _isWoman(pos.position);
    int lastPos = woman ? _lastWomenHatPos : _lastManHatPos;
    int lastLevel = woman ? _lastWomenLevel : _lastManLevel;

    bool show = false;
    if (pos.position != lastPos) {
      show = true;
    } else {
      show = currentLevel != lastLevel;
    }

    _log();

    if (pos.uid > 0 && show) {
      if (_showing) {
        _listData.add(pos);
      } else {
        _currentPos = pos;
        if (woman) {
          _lastWomenHatPos = _currentPos!.position;
          _lastWomenLevel = _getLevel(_currentPos!.package);
        } else {
          _lastManHatPos = _currentPos!.position;
          _lastManLevel = _getLevel(_currentPos!.package);
        }
        _showHatChange();
      }
    }
  }

  void _showHatChange() {
    _showing = true;
    double end = -(Util.width - _BOX_WIDTH) + 18.0;
    if (!mounted) return;
    setState(() {
      _translateX = Animated.value(_BOX_WIDTH);
    });

    startAni(end, true);
  }

  @override
  void dispose() {
    widget.room
        .removeListener(RoomConstant.EVENT_REFRESH_MIC_LIST, _onMicListChange);
    widget.room
        .removeListener(RoomConstant.EVENT_CP_HEART_NEW_TURN, _onNewTurn);

    if (_sequence != null) {
      _sequence!.stop();
      _sequence = null;
    }
    super.dispose();
  }

  void startAni(double end, bool needTranslateX) {
    _opacity = Animated.value(1.0);
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      if (!mounted || _translateX == null) return;
      _sequence = Animated.sequence([
        if (needTranslateX)
          Animated.spring(_translateX!,
              toValue: end, speed: 1.0, bounciness: 3.0, onUpdate: (bool end) {
            if (end == true) {
              _translateXEnd = true;
            }
          }),
        Animated.delay(const Duration(milliseconds: _DURATION)),
        Animated.spring(_opacity,
            toValue: 0.0, speed: 1.0, bounciness: 1.0, overshootClamping: true),
      ], (bool complete) {
        if (!mounted) return;
        if (complete) {
          _onComplete();
        } else {
          setState(() {});
        }
      }).start();
    });
  }

  void _onComplete() {
    _showing = false;
    _sequence = null;
    if (_listData.contains(_currentPos)) {
      _listData.remove(_currentPos);
    }

    if (_listData.isNotEmpty) {
      RoomPosition roomPosition = _listData.first;
      _tryShow(roomPosition);
    } else {
      _currentPos = null;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_currentPos == null) {
      return const SizedBox.shrink();
    }

    bool male = !_isWoman(_currentPos!.position);

    List<Color> colors = male
        ? [const Color(0xFF6C8DFF), const Color(0xFF3E6AFF)]
        : [const Color(0xFFFF6CE1), const Color(0xFFE8499F)];

    String text = male ? K.room_most_god_man : K.room_most_god_women;

    return Opacity(
      opacity: _opacity.value,
      child: Container(
        width: 148,
        height: 48,
        padding: const EdgeInsetsDirectional.only(start: 2),
        transform: Matrix4.translationValues(
            _translateX == null ? Util.width : _translateX!.value, 0.0, 0.0),
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(colors: colors),
        ),
        child: Row(
          children: [
            _buildAvatar(),
            const SizedBox(
              width: 4,
              height: 48,
            ),
            Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      _currentPos!.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    int level = CpHeartUtil.getHatLevel(_currentPos!.package, true);
    return CpHeartHatAvatar(
      icon: _currentPos!.icon,
      level: level,
      man: !_isWoman(_currentPos!.position),
      size: 44.0,
      headUrl: _currentPos!.gameZone,

      /// 复用字段，服务端下发帽子图片资源
    );
  }

  bool _isWoman(int position) {
    return CpHeartUtil.isWoman(position);
  }

  RoomPosition _findMaxPkg(List<RoomPosition> list, int initPos) {
    int index = list.indexWhere((element) => element.position == initPos);
    if (index < 0) {
      index = 0;
    }

    int maxPkg = list[index].package;
    for (int i = 0; i < list.length; i++) {
      if (list[i].package > maxPkg) {
        maxPkg = list[i].package;
        index = i;
      }
    }
    return list[index];
  }

  int _getLevel(int package) {
    if (package >= 10 * 100 && package < 100 * 100) {
      return 1;
    } else if (package >= 100 * 100 && package < 520 * 100) {
      return 2;
    } else if (package >= 520 * 100) {
      return 3;
    } else {
      return 0;
    }
  }
}
