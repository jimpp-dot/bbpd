import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 房间消息按钮红点
class RoomMessageRedPoint extends StatefulWidget {
  final double width;
  final double height;

  const RoomMessageRedPoint(
      {super.key, required this.width, required this.height});

  @override
  _RoomMessageRedPointState createState() => _RoomMessageRedPointState();
}

class _RoomMessageRedPointState extends State<RoomMessageRedPoint> {
  int _num = 0;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: _BottomRedPoint(
        show: _num > 0,
        width: widget.width,
        height: widget.height,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    eventCenter
        .addListeners([Im.EventUnreadChanged, Im.EventConnChanged], _onChanged);
    _load();
  }

  @override
  void dispose() {
    eventCenter.removeListeners(
        [Im.EventUnreadChanged, Im.EventConnChanged], _onChanged);
    super.dispose();
  }

  void _load() async {
    int count = await Im.getTotalUnreadCount();
    if (mounted) {
      setState(() {
        _num = count;
      });
    }
  }

  void _onChanged(String type, dynamic data) {
    if (type == Im.EventUnreadChanged) {
      Map res = data;
      int left = res['left'];
      if (left == 0) _load();
    } else if (type == Im.EventConnChanged) {
      Log.d("------------> EventConnChanged $data");
      _load();
    }
  }
}

class _BottomRedPoint extends StatelessWidget {
  final bool? show;
  final double width;
  final double height;

  const _BottomRedPoint({this.show, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    if (show != true) {
      return const SizedBox.shrink();
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.transparent,
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: R.color.thirdBrightColor,
        ),
      ),
    );
  }
}
