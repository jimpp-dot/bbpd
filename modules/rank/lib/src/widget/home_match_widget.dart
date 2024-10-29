import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class HomeMatchItemData {
  String title;
  String icon;
  String type;
  int playingNum;
  String partyIcon;
  List<Color> bgColors;
  String matchIcon;
  int matchIconWidth = 0;
  int matchIconHeight = 0;

  HomeMatchItemData.fromPb(PartyItem item)
      : title = item.display,
        icon = item.homeIcon,
        type = item.partyType,
        playingNum = item.playingNum,
        partyIcon = item.tagIcon,
        matchIcon = item.indexIcon,
        matchIconWidth = item.indexIconWidth,
        matchIconHeight = item.indexIconHeight,
        bgColors = Util.parseColors(item.typeBg);

  HomeMatchItemData.fromJson(Map data)
      : title = data['display'],
        icon = data['home_icon'],
        type = data['party_type'],
        playingNum = Util.parseInt(data['playing_num']),
        partyIcon = data['tag_icon'] ?? '',
        matchIcon = data['index_icon'] ?? '',
        bgColors = Util.parseColors(data['type_bg']);
}
