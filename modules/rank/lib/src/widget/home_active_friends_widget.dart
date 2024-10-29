import 'package:rank/k.dart';
import 'package:shared/shared.dart';

class HomeActiveFriendItemData {
  String icon;
  String name;
  int uid;
  int rid;
  bool online;
  String dateLineDiff;
  bool exposured;
  String ticketMark = '';

  HomeActiveFriendItemData.fromPb(RecentListItem item)
      : icon = item.icon,
        name = item.name,
        uid = item.uid,
        rid = item.rid,
        online = (1 == item.onlineStatus),
        dateLineDiff = item.onlineDatelineDiff,
        exposured = false;

  HomeActiveFriendItemData.fromJson(Map data)
      : icon = Util.parseStr(data['icon']) ?? '',
        name = Util.parseStr(data['name']) ?? '',
        uid = Util.parseInt(data['uid']),
        rid = Util.parseInt(data['rid']),
        online = 1 == Util.parseInt(data['online_status']),
        dateLineDiff = Util.parseStr(data['online_dateline_diff']) ?? '',
        exposured = false,
        ticketMark = Util.parseStr(data['ticket_mark']) ?? '';

  String get getStatus {
    if (online == true) {
      return K.rank_online_now;
    }

    return dateLineDiff;
  }
}
