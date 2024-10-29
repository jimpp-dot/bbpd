import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/model/liveListRsp.dart';
import 'package:rank/src/model/entity/skill_tab_item.dart';

import '../../../k.dart';

class HomeTab {
  String title = '';
  String type = '';
  String filter = '';
  bool isDefault = false;
  GlobalKey? globalKey;
  String matchKey = '';
  List<HomeTab> subRoomTabs = [];
  List<SkillTabItem> subSkillTabs = [];
  List<RankerItem> ranker = [];
  List<GameCategoryItem> gameCategory = [];
  int tabId = 0;
  int style = 0; // 房间样式，0：默认样式（长条垂直list），1：新样式（大海报gridview）

  HomeTab(
      {required this.title,
      required this.type,
      required this.filter,
      required this.isDefault,
      this.globalKey,
      required this.tabId});

  HomeTab.fromJson(Map json) {
    title = Util.parseStr(json['tab']) ?? '';
    type = Util.parseStr(json['type']) ?? '';
    filter = Util.parseStr(json['filter']) ?? '';
    isDefault = Util.parseInt(json['default']) == 1;
    tabId = Util.parseInt(json['tab_id']);
    matchKey = '${type}_$filter';
    style = Util.parseInt(json['style'], 0);
    if ((type == 'room' || type == 'tabRoom') && json['sub'] is List) {
      List? subTabList = json['sub'];
      subRoomTabs = [];
      subTabList?.forEach((tabMap) {
        HomeTab subTab = HomeTab.fromJson(tabMap);
        subRoomTabs.add(subTab);
      });
    }

    if ((type == 'room' || type == 'tabRoom') && json['game_list'] is List) {
      List? gameList = json['game_list'];
      gameCategory = [];
      gameList?.forEach((gameMap) {
        GameCategoryItem item = GameCategoryItem.fromJson(gameMap);
        gameCategory.add(item);
      });
      if (gameCategory.isNotEmpty) {
        // 增加一个更多Icon
        gameCategory.add(GameCategoryItem(K.rank_more, '', -1));
      }
    }

    if (type == 'skill' && json['sub'] is List) {
      List? subTabList = json['sub'];
      subSkillTabs = [];
      subTabList?.forEach((tabMap) {
        SkillTabItem subTab = SkillTabItem.fromJson(tabMap);
        subSkillTabs.add(subTab);
      });
    }

    if ((type == 'room' || type == 'tabRoom') && json['ranker'] is List) {
      List? rankerList = json['ranker'];
      ranker = [];
      rankerList?.forEach((element) {
        RankerItem rankerItem = RankerItem.fromJson(element);
        ranker.add(rankerItem);
      });
    }
  }
}

class GameCategoryItem {
  String name;
  String icon;
  int cid;

  GameCategoryItem.fromJson(Map json)
      : name = Util.parseStr(json['name']) ?? '',
        icon = Util.parseStr(json['icon']) ?? '',
        cid = Util.parseInt(json['cid']);

  GameCategoryItem(this.name, this.icon, this.cid);
}
