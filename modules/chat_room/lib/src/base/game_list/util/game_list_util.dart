import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/game_list/model/pb/generated/common_gameplaylist.pb.dart';
import 'package:flutter/material.dart';

import '../game_list_page.dart';

class GameListUtil {
  static Future openGameList(BuildContext context, ChatRoomData room) async {
    if (!room.isCreator && !room.isReception) {
      Tracker.instance.track(TrackEvent.play_guide_entrance, properties: {
        'uid': Session.uid,
        'rid': room.rid,
        'room_factory_type': room.config?.originalRFT,
      });
    }
    await displayModalBottomSheet(
        context: context,
        isBarrierDismissible: true,
        maxHeightRatio: 1.0,
        defineBarrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return GameListPage(room: room);
        });
  }

  static Future<bool?> openGameDetail(
      BuildContext context, ChatRoomData room, GamePlayItem item) async {
    if (!room.isCreator && !room.isReception) {
      Tracker.instance.track(TrackEvent.play_guide_list, properties: {
        'uid': Session.uid,
        'rid': room.rid,
        'room_factory_type': room.config?.originalRFT,
      });
    }
    bool? result = await displayModalBottomSheet(
      context: context,
      isBarrierDismissible: true,
      maxHeightRatio: 1.0,
      defineBarrierColor: Colors.transparent,
      builder: (BuildContext context) => GameDetailPage(room: room, item: item),
    );
    return result;
  }

  static GameListLabelStatus parseShowStatus(Map dataMap) {
    GameListLabelStatus gameListLabelStatus = GameListLabelStatus.Disable;
    if (dataMap['game_play_list'] != null && dataMap['game_play_list'] is Map) {
      int show = Util.parseInt(dataMap['game_play_list']['show'], -1);
      if (show == 0) {
        gameListLabelStatus = GameListLabelStatus.OnlyAdmin;
      } else if (show == 1) {
        gameListLabelStatus = GameListLabelStatus.All;
      } else {
        gameListLabelStatus = GameListLabelStatus.Disable;
      }
    } else {
      gameListLabelStatus = GameListLabelStatus.Disable;
    }
    return gameListLabelStatus;
  }

  static bool showRoomGameListLabel(ChatRoomData room) {
    if (room.gameListLabelStatus == GameListLabelStatus.Disable) {
      return false;
    }

    if (room.gameListLabelStatus == GameListLabelStatus.All) {
      return true;
    }

    if (room.gameListLabelStatus == GameListLabelStatus.OnlyAdmin) {
      return room.isCreator || room.isReception;
    }
    return false;
  }
}
