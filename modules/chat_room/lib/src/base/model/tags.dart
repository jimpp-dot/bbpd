import 'package:shared/shared.dart';

final List<SheetItem> _data = [
  SheetItem(R.array('room_tags')[0], 'bill', 0xFF2dadff),
  SheetItem(R.array('room_tags')[1], 'music', 0xFFff218f),
  SheetItem(R.array('room_tags')[2], 'small-game', 0xFF612bfb),
  SheetItem(R.array('room_tags')[3], 'black', 0xFFfc3f48),
  SheetItem(R.array('room_tags')[4], 'chook', 0xFFff218f),
  SheetItem(R.array('room_tags')[5], 'radio', 0xFFff699a),
  SheetItem(R.array('room_tags')[6], 'friend', 0xFFff699a),
  SheetItem(R.array('room_tags')[7], 'mic-online', 0xFFff699a),
  SheetItem(R.array('room_tags')[8], 'game', 0xFF612bfb),
  SheetItem(R.array('room_tags')[9], 'question', 0xFF5ecf63),
];

final List<SheetItem> _dataUser = [
  SheetItem(R.string('room_game_friends'), '1'),
  SheetItem(R.string('room_game_mics'), '8'),
];

class Tags {
  static List<SheetItem> get data {
    return _data;
  }

  static List<SheetItem> get dataUser {
    return _dataUser;
  }

  static SheetItem? getValue(String key) {
    try {
      return _data.firstWhere((SheetItem item) {
        return item.key == key;
      });
    } catch (e) {
      return null;
    }
  }
}
