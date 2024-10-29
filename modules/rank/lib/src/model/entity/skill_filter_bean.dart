import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';

class SkillFilterItem {
  String name;
  String filter;

  SkillFilterItem.fromJson(Map json)
      : name = Util.parseStr(json['name']) ?? '',
        filter = Util.parseStr(json['filter']) ?? '';
}

class SkillFilterBean {
  List<SkillFilterItem> rank = [];
  List<SkillFilterItem> rankSelect = [];
  List<SkillFilterItem> sex = [];
  List<SkillFilterItem> sexSelect = [];
  List<SkillFilterItem> level = [];
  List<SkillFilterItem> levelSelect = [];
  List<SkillFilterItem> filter = []; // 高级筛选
  List<SkillFilterItem> filterSelect = [];
  String showingFilter = '';

  List<SkillFilterItem>? getFiltersByName(String name) {
    switch (name) {
      case 'rank':
        return rank;
      case 'sex':
        return sex;
      case 'level':
        return level;
      case 'filter':
        return filter;
    }
    return null;
  }

  List<SkillFilterItem>? getSelectFilterByName(String name) {
    switch (name) {
      case 'rank':
        return rankSelect;
      case 'sex':
        return sexSelect;
      case 'level':
        return levelSelect;
      case 'filter':
        return filterSelect;
    }
    return null;
  }

  List<SkillFilterItem>? getShowingFilters() {
    return getFiltersByName(showingFilter);
  }

  String? getTitle(String name) {
    switch (name) {
      case 'rank':
        if (rankSelect.isEmpty) return null;
        return rankSelect[0].name;
      case 'sex':
        if (sexSelect.isEmpty) return null;
        return sexSelect[0].name;
      case 'level':
        if (levelSelect.isEmpty) return null;
        return levelSelect[0].name;
      case 'filter':
        return K.rank_advanced_filter;
    }
    return null;
  }

  Color getFilterColor(String name) {
    if (name == 'filter') {
      return (filterSelect.isEmpty)
          ? R.color.secondTextColor
          : R.color.mainBrandColor;
    } else {
      List<SkillFilterItem>? select = getSelectFilterByName(name);
      List<SkillFilterItem>? values = getFiltersByName(name);
      return select?[0].name == values?[0].name
          ? R.color.secondTextColor
          : R.color.mainBrandColor;
    }
  }

  bool isFilterValueSelect(String value) {
    List<SkillFilterItem>? select = getSelectFilterByName(showingFilter);
    if (select == null || select.isEmpty) {
      return false;
    }

    return select.any((SkillFilterItem item) => item.filter == value);
  }

  void addSingleSelectValue(SkillFilterItem value) {
    List<SkillFilterItem>? select = getSelectFilterByName(showingFilter);
    if (select == null) {
      return;
    }
    select.clear();
    select.add(value);
  }

  void removeSingleSelectValue(SkillFilterItem value) {
    List<SkillFilterItem>? select = getSelectFilterByName(showingFilter);
    if (select == null) {
      return;
    }
    select.removeWhere(
        (SkillFilterItem element) => element.filter == value.filter);
    List<SkillFilterItem>? filters = getFiltersByName(showingFilter);
    if (filters == null) {
      return;
    }
    select.add(filters[0]);
  }

  bool isShowMultiSelectMenu() {
    return showingFilter == 'filter';
  }

  SkillFilterBean.fromJson(Map json) {
    rank = <SkillFilterItem>[];
    sex = <SkillFilterItem>[];
    level = <SkillFilterItem>[];
    filter = <SkillFilterItem>[];

    rankSelect = <SkillFilterItem>[];
    if (json['rank'] is List) {
      List rankData = json['rank'];

      if (rankData.isNotEmpty) {
        for (var data in rankData) {
          SkillFilterItem item = SkillFilterItem.fromJson(data);
          rank.add(item);
        }

        rankSelect.add(rank[0]);
      }
    }

    sexSelect = <SkillFilterItem>[];
    if (json['sex'] is List) {
      List sexData = json['sex'];
      if (sexData.isNotEmpty) {
        for (var data in sexData) {
          SkillFilterItem item = SkillFilterItem.fromJson(data);
          sex.add(item);
        }

        sexSelect.add(sex[0]);
      }
    }

    levelSelect = <SkillFilterItem>[];
    if (json['level'] is List) {
      List levelData = json['level'];
      if (levelData.isNotEmpty) {
        for (var data in levelData) {
          SkillFilterItem item = SkillFilterItem.fromJson(data);
          level.add(item);
        }
        levelSelect.add(level[0]);
      }
    }

    filterSelect = <SkillFilterItem>[];
    if (json['filter'] is List) {
      List filterData = json['filter'];
      if (filterData.isNotEmpty) {
        for (var data in filterData) {
          SkillFilterItem item = SkillFilterItem.fromJson(data);
          filter.add(item);
        }
      }
    }
  }
}
