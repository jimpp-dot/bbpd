import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class SkillTabItem {
  int cid = 0;
  String tabName = '';
  String tabIcon = '';
  String type = '';
  String filter = '';
  bool isDefault = false;
  String matchKey = '';
  GlobalKey? globalKey;
  List<TabItem> subTabs = [];
  int pid = 0;

  SkillTabItem(
      {this.cid = 0,
      this.tabName = '',
      this.tabIcon = '',
      this.subTabs = const []});

  SkillTabItem.fromJson(Map json) {
    cid = Util.parseInt(json['cid']);
    tabName = Util.parseStr(json['name']) ?? '';
    type = Util.parseStr(json['type']) ?? '';
    filter = Util.parseStr(json['filter']) ?? '';
    isDefault = Util.parseInt(json['default']) == 1;
    matchKey = '${type}_$filter';
    String iconUrl = Util.parseStr(json['icon']) ?? '';
    if (iconUrl.startsWith('http')) {
      tabIcon = iconUrl;
    } else {
      tabIcon = System.imageDomain + iconUrl;
    }

    List? tabList = json['tabs'];
    subTabs = [];
    tabList?.forEach((element) {
      TabItem tabItem = TabItem.fromJson(element);
      subTabs.add(tabItem);
    });
  }

  SkillTabItem.convert(ListTabHeadItem item) {
    pid = item.cid;
    tabName = item.name ?? '';
    tabIcon = item.icon ?? '';
    subTabs = item.tabs ?? [];
    filter = '';
    type = '';
    matchKey = '${type}_$filter';
    isDefault = false;
  }
}
