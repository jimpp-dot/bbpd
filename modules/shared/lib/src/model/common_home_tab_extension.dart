import 'package:flutter/cupertino.dart';
import 'package:shared/shared.dart';
import 'package:shared/K.dart';
import 'package:shared/src/pbModel/generated/banban_home.pb.dart';

class CommonHomeTab {
  Tab homeTab;
  List<CommonSubTab> subRoomTabs;
  GlobalKey? globalKey;

  CommonHomeTab(
      {required this.homeTab, required this.subRoomTabs, this.globalKey});

  String get title => homeTab.tab;

  bool get isDefault => homeTab.default_4 == 1;

  String get matchKey => '${homeTab.type}_${homeTab.filter}';

  int get tabId => homeTab.tabId;

  String get bannerChannel => homeTab.bannerChannel;

  String get type => homeTab.type;

  String get filter => homeTab.filter;

  /// style=3 由 vertical 字段控制，这么做是为了兼容老版本
  int get style => homeTab.vertical ? 3 : homeTab.style;

  List<Rank> get ranker => homeTab.ranker;
}

class CommonSubTab {
  SubTab subTab;
  GlobalKey? globalKey;

  CommonSubTab({required this.subTab, this.globalKey});

  String get title => subTab.tab;

  bool get isDefault => subTab.default_4 == 1;

  String get matchKey => '${subTab.type}_${subTab.filter}';

  String get type => subTab.type;

  String get filter => subTab.filter;

  String get icon => subTab.icon;

  List<GameItem> get gameCategory {
    if (subTab.gameList.isNotEmpty) {
      List<GameItem> list = [];
      list.addAll(subTab.gameList);
      list.add(GameItem(name: K.base_common_more, icon: '', cid: 0));
      return list;
    }

    return subTab.gameList;
  }
}

extension FriendTypeNameAction on FriendTypeName {
  RoomTagType toRoomTag() {
    return RoomTagType(
      label: label,
      show: show,
      tagIcon: tagIcon,
      tagColor: Util.parseColor(tagColor),
      bgColors: Util.parseColors(bg),
    );
  }
}

extension RoomListItemAction on RoomListItem {
  HomeRoomUiStyle get roomUiStyle {
    HomeRoomUiStyle roomUiStyle = HomeRoomUiStyle.RoomUiStyleAnchor;
    if (patternStyle == 1 &&
        (paier == 1 || !Util.isCollectionEmpty(micIcons))) {
      roomUiStyle = HomeRoomUiStyle.RoomUiStyleNormal;
    } else if (patternStyle == 4) {
      roomUiStyle = HomeRoomUiStyle.RoomUiStyleGameRecruit;
    }
    return roomUiStyle;
  }

  PartyRoomGridItem changeToPartGridItem() {
    return PartyRoomGridItem(
      rid,
      uid,
      name,
      icon,
      liveCoverIcon,
      liveTagIcon,
      hot,
      true,
      '',
      null,
      uname,
      typeName.label,
      property,
      operationBg: operationBg,
      operationLabel: operationLabel,
      hourRank: hourRank,
      fixFrameUrl1: fixFrameUrl1,
      fixFrameUrl2: fixFrameUrl2,
      fixTagUrl1: fixTagUrl1,
      fixTagUrl2: fixTagUrl2,
      prettyRid: prettyRid,
    );
  }

  bool get hasReason => Util.validStr(reasonForUser);
}
