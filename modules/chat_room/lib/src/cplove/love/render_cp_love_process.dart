import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/canvasLine.dart';

class RenderCpLoveProcess extends StatelessWidget {
  final ChatRoomData room;

  const RenderCpLoveProcess({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _renderCpLoveProcess(context);
  }

  Widget _renderProcessLine(bool isDash, [double? width]) {
    if (width == null) {
      return Expanded(
        child: SizedBox(
          height: 1.0,
          child: CustomPaint(
            painter: CanvasLine(isDash),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: 1.0,
        width: width,
        child: CustomPaint(
          painter: CanvasLine(isDash),
        ),
      );
    }
  }

  Widget _renderProcessButton(String label, int key, int current) {
    bool selected = key == current;
    int backgroundColor = selected ? 0xFFFFFFFF : 0xFF592B85;
    int textColor = selected ? 0xFF8140B6 : 0xFFC499F0;
    return Container(
      height: 20.0,
      padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12.0),
      decoration: BoxDecoration(
          color: Color(backgroundColor),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: key < current
              ? Border.all(
                  color: const Color(0xFFC499F0),
                  width: 1.0,
                )
              : null),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 12.0, color: Color(textColor)),
        ),
      ),
    );
  }

  Widget _renderCpLoveProcess(BuildContext context) {
    int current = -1;
    switch (room.config?.cpState) {
      case CpLoveState.Wait:
        current = -1;
        break;

      case CpLoveState.Reward:
        current = 0;
        break;

      case CpLoveState.Switch:
        current = 1;
        break;

      case CpLoveState.Result:
        current = 2;
        break;

      default:
        current = -1;
        break;
    }
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        bottom: 20.0,
      ),
      child: SizedBox(
        height: 20.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _renderProcessLine(false),
            _renderProcessButton(K.room_cplove_reward, 0, current),
            _renderProcessLine(current <= 0 ? true : false, 30.0),
            _renderProcessButton(K.room_cplove_switch, 1, current),
            _renderProcessLine(current <= 1 ? true : false, 30.0),
            _renderProcessButton(K.room_cplove_result, 2, current),
            _renderProcessLine(true),
          ],
        ),
      ),
    );
  }
}
