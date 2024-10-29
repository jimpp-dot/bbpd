import 'package:shared/shared.dart';

class GameCardItem {
  bool certified = false;
  int id = 0;
  int cid = 0;
  int pcid = 0;
  String name = '';
  String icon = '';
  int levelId = 0;
  String levelTitle = '';

  GameCardItem.fromJson(Map json) {
    certified = Util.parseInt(json['certified']) == 1;
    id = Util.parseInt(json['id']);
    cid = Util.parseInt(json['cid']);
    pcid = Util.parseInt(json['pcid']);
    name = Util.parseStr(json['name']) ?? '';
    icon = Util.parseStr(json['icon']) ?? '';
    var level = json['level'];
    if (level is Map) {
      levelId = Util.parseInt(level['id']);
      levelTitle = Util.parseStr(level['title']) ?? '';
    }
  }
}

class GameCardUser {
  final int uid;
  final bool online;
  final String icon;
  final String displayName;
  final bool inRoom;

  GameCardUser(this.uid, this.online, this.icon, this.displayName, this.inRoom);
}
