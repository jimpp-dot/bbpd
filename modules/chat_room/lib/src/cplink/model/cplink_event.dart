import 'package:chat_room/chat_room.dart';

class PositionChangeData {
  final int uid;
  final int fromIndex;
  final int toIndex;

  PositionChangeData({this.uid = 0, this.fromIndex = 0, this.toIndex = 0});
}

class PositionChangeEvent {
  List<RoomPosition>? positionList;
  final List<PositionChangeData>? data;

  PositionChangeEvent({this.positionList, this.data});
}
