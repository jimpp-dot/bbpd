import 'package:shared/shared.dart';

extension RoomItemAction on RoomItem {
  HomeRoomUiStyle get roomUiStyle {
    if (patternStyle == 3) {
      return HomeRoomUiStyle.RoomUiStyleGame;
    } else if (patternStyle == 1 && !Util.isCollectionEmpty(micIcons)) {
      return HomeRoomUiStyle.RoomUiStyleNormal;
    }
    return HomeRoomUiStyle.RoomUiStyleAnchor;
  }
}
