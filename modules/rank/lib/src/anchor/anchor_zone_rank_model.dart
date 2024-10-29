import 'package:shared/shared.dart';

/// 主播专题排行榜数据Model

class AnchorZoneRankItemModel {
  /// 用户uid
  int uid = 0;

  /// 排行
  int rank = 0;

  /// 用户名
  String name;

  /// 用户icon
  String icon;

  /// 展示的数目
  int showNum = 0;
  int age = 0;
  int sex = 0;
  int vipLevel = 0;
  int popularityLevel = 0;

  AnchorZoneRankItemModel.fromJson(Map<String, dynamic> json)
      : uid = Util.parseInt(json['uid'], 0),
        rank = Util.parseInt(json['rank'], 0),
        name = Util.parseStr(json['name']) ?? '',
        icon = Util.parseStr(json['icon']) ?? '',
        showNum = Util.parseInt(json['show_num'], 0),
        age = Util.parseInt(json['age'], 0),
        sex = Util.parseInt(json['sex'], 0),
        vipLevel = Util.parseInt(json['vip_level'], 0),
        popularityLevel = Util.parseInt(json['popularity_level'], 0);
}

/// 排行榜某一页数据
class AnchorZoneRankPageModel {
  /// 当前请求页数
  int page = 0;

  /// 是否有下一页
  int more = 0;
  List<AnchorZoneRankItemModel> list;

  bool get hasMore => more == 1;

  AnchorZoneRankPageModel.fromJson(Map<String, dynamic> json)
      : page = Util.parseInt(json['page'], 0),
        more = Util.parseInt(json['more'], 0),
        list = Util.parseList(json['list'],
            (e) => AnchorZoneRankItemModel.fromJson(e as Map<String, dynamic>));
}

class AnchorZoneRankTab {
  int type = 0;
  String name;

  AnchorZoneRankTab.fromJson(Map<String, dynamic> json)
      : type = Util.parseInt(json['type'], 0),
        name = Util.parseStr(json['name']) ?? '';
}

class AnchorZoneRankModel {
  int defaultTabIndex = 0;
  String rankListTitle;
  String explain;
  List<AnchorZoneRankTab> tabList;
  AnchorZoneRankPageModel? defaultRank;

  /// 默认定位Tab的type
  int get defaultTabType {
    if (tabList.isEmpty) {
      return 0;
    }
    if (defaultTabIndex < 0 || defaultTabIndex >= tabList.length) return 0;
    return tabList[defaultTabIndex].type;
  }

  int get initTabIndex {
    if (defaultTabIndex < 0 || defaultTabIndex >= tabList.length) return 0;
    return defaultTabIndex;
  }

  int get tabCount => tabList.length;

  bool get hasTab => tabCount > 0;

  AnchorZoneRankModel.fromJson(Map<String, dynamic> json)
      : defaultTabIndex = Util.parseInt(json['default_tab_index'], 0),
        rankListTitle = Util.parseStr(json['rank_list_title']) ?? '',
        explain = Util.parseStr(json['explain_url']) ?? '',
        tabList = Util.parseList(json['tab_list'],
            (e) => AnchorZoneRankTab.fromJson(e as Map<String, dynamic>)),
        defaultRank = json['default_data'] is Map
            ? AnchorZoneRankPageModel.fromJson(json['default_data'])
            : null;
}
