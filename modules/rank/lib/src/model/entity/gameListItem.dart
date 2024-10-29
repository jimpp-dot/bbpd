import 'package:shared/shared.dart';

class GameListItem {
  final String icon;
  final String name;
  final String nick;
  final int role;
  final int online;
  final int inRoom;
  final int uid;
  final int cCid;
  final String cName;
  final int cPrice;
  final int cNum;
  final int sex;
  final int title;
  final String type;
  final String sign;
  final String city;
  final String position;
  final String online_dateline_diff;
  final bool isInterests;
  int pid;
  bool exposured;
  final int cprice;
  final String room_tag;
  final String priceUnit;
  final String level;
  final String audio;

  String get nickName => nick.isNotEmpty ? nick : name;

  String get onlineStatus =>
      online > 0 ? R.string('current_user') : online_dateline_diff;

  GameListItem.fromJson(Map data)
      : icon = Util.parseStr(data['icon']) ?? '',
        type = Util.parseStr(data['type']) ?? '',
        nick = Util.parseStr(data['_nick']) ?? '',
        sign = Util.parseStr(data['sign']) ?? '',
        isInterests = Util.parseInt(data['_isinterest']) > 0,
        online_dateline_diff = Util.parseStr(data['online_diff']) ?? '',
        city = Util.parseStr(data['city']) ?? '',
        position = Util.parseStr(data['city']) ?? '',
        name = Util.parseStr(data['name']) ?? '',
        cName = Util.parseStr(data['_name']) ?? '',
        role = Util.parseInt((data['role'] ?? '0')),
        sex = Util.parseInt((data['sex'] ?? '0')),
        inRoom = Util.parseInt(data['in_room']),
        uid = Util.parseInt(data['uid']),
        cCid = Util.parseInt(data['_cid']),
        cPrice = Util.parseInt(data['_price']),
        cNum = Util.parseInt(data['_num']),
        title = Util.parseInt(data['title']),
        online = Util.parseInt(data['online']),
        pid = Util.parseInt(data['_id']),
        room_tag = Util.parseStr(data['room_tag']) ?? '',
        exposured = false,
        priceUnit = Util.parseStr(data['price_unit']) ?? '',
        //邀约价格单位
        level = Util.parseStr(data['level']) ?? '',
        //段位
        audio = Util.parseStr(data['_audio']) ?? '',
        cprice = Util.parseInt(data['_price']);
}
