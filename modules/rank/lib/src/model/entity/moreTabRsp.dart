import 'package:shared/shared.dart';

class MoreTabRsp {
  bool success = false;
  List<MoreTabGroupData> groups = [];

  MoreTabRsp.fromJson(Map res) {
    success = Util.parseBool(res['success']);
    if (res['data'] is Map) {
      Map data = res['data'];

      Map hotMap = data['hot'];
      MoreTabGroupData hotGroup = MoreTabGroupData.fromJson(hotMap);

      Map partyMap = data['party'];
      MoreTabGroupData partyGroup = MoreTabGroupData.fromJson(partyMap);

      Map gamesMap = data['games'];
      MoreTabGroupData gamesGroup = MoreTabGroupData.fromJson(gamesMap);

      Map funsMap = data['funs'];
      MoreTabGroupData funsGroup = MoreTabGroupData.fromJson(funsMap);

      groups.add(hotGroup);
      groups.add(partyGroup);
      groups.add(gamesGroup);
      if (!Util.isVerify) {
        groups.add(funsGroup);
      }
    }
  }
}

class MoreTabGroupData {
  String title;
  List<MoreTabItem> items = [];

  MoreTabGroupData.fromJson(Map json)
      : title = Util.parseStr(json['title']) ?? '',
        items = Util.parseList(json['sub'], (e) => MoreTabItem.fromJson(e));
}

class MoreTabItem {
  String tab = '';
  String type = '';
  String filter = '';
  int cid = 0;
  int index = 0;
  String skillType = '';
  String matchKey = '';

  MoreTabItem.fromJson(Map json) {
    tab = Util.parseStr(json['tab']) ?? '';
    type = Util.parseStr(json['type']) ?? '';
    var filterValue = json['filter'];
    if (filterValue is String) {
      filter = filterValue;
      matchKey = '${type}_$filter';
    } else {
      cid = Util.parseInt(filterValue);
      matchKey = '${type}_$cid';
    }
    index = Util.parseInt(json['index']);
    skillType = Util.parseStr(json['skill_type']) ?? '';
  }
}
