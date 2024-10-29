import 'dart:ui';

import 'package:chat_room/chat_room.dart' hide MessageContent;
import 'package:chat_room/src/base/admin/room_admin_screen.dart' as admin;
import 'package:chat_room/src/base/background_music/music_search_screen.dart';
import 'package:chat_room/src/base/page/initOperate.dart';
import 'package:chat_room/src/base/page/inputGameIdScreen.dart';
import 'package:chat_room/src/base/page/roomIncomeScreen.dart';
import 'package:chat_room/src/base/page/wifi_screen.dart';
import 'package:chat_room/src/fans/fans_star_challenge.dart';
import 'package:chat_room/src/vindicate/vindicate_activity_main.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'base/background_music/room_background_music_screen.dart';
import 'base/page/roomModifyScreen.dart';

class RoomNavUtil {
  static Future openInitOperateDisplay(BuildContext context, {String? refer, bool fromWolfHomePage = false}) async {
    await InitOperate.display(context, refer: refer, fromWolfHomePage: fromWolfHomePage);
  }

  static Future openRoomModifyScreen(BuildContext context, {required int rid, bool showRoom = false, bool fullScreenDialog = false}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RoomModifyScreen(rid: rid, showRoomAfterModify: showRoom),
        settings: const RouteSettings(name: '/roomModify'),
        fullscreenDialog: fullScreenDialog,
      ),
    );
  }

  static Future openRoomIncomeScreen(BuildContext context, {required int rid}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RoomIncomeScreen(rid: rid),
        settings: const RouteSettings(name: '/roomIncome'),
      ),
    );
  }

  static Future openRoomMusicScreen(BuildContext context, {required ChatRoomData room}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RoomBackgroundMusicScreen(key: MusicController.keyMusicScreen, room: room),
        settings: const RouteSettings(name: '/RoomBackgroundMusicScreen'),
      ),
    );
  }

  static Future openMusicSearchScreen(BuildContext context, ChatRoomData room, {int searchType = 0, bool showUpload = true}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MusicSearchScreen(room: room, searchType: searchType, showUpload: showUpload),
        settings: const RouteSettings(name: '/MusicSearchScreen'),
      ),
    );
  }

  static Future openWifiScreen(BuildContext context, {required ChatRoomData room}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WifiScreen(room: room),
        settings: const RouteSettings(name: '/WifiScreen'),
      ),
    );
  }

  static Future openRoomAdminScreen(
    BuildContext context, {
    required int rid,
    Purview purview = Purview.Normal,
    types,
    int? pos,
    bool fullScreenDialog = false,
    required int uid,
    String? defaultTab,
    int? newLabel,
  }) {
    RoomTypes types0 = RoomTypes.values.firstWhereOrNull((RoomTypes val) => val == types) ?? RoomTypes.Normal;
    Purview purview0 = Purview.values.firstWhereOrNull((Purview val) => val == purview) ?? Purview.Normal;

    int pos0 = -1;
    if (pos != null) {
      pos0 = pos;
    }

    Widget child = admin.RoomAdminScreen(
      rid: rid,
      purview: purview0,
      types: types0,
      pos: pos0,
      uid: uid,
      defaultTab: defaultTab,
      // newLabel: newLabel,
    );

    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      enableDrag: false,
      routeSettings: const RouteSettings(name: '/roomAdmin'),
      builder: (context) => SizedBox(
        height: 0.8 * Util.height,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
            child: child,
          ),
        ),
      ),
    );

    // return Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) => admin.RoomAdminScreen(
    //     rid: rid,
    //     purview: purview0,
    //     types: types0,
    //     pos: pos0,
    //     uid: uid,
    //     defaultTab: defaultTab,
    //     // newLabel: newLabel,
    //   ),
    //   settings: const RouteSettings(name: '/roomAdmin'),
    //   fullscreenDialog: fullScreenDialog,
    // ));
  }

  static Widget getRoomAdminScreen(
    BuildContext context, {
    required int rid,
    purview,
    types,
    int? pos,
  }) {
    Purview purview0 = Purview.Normal;
    RoomTypes types0 = RoomTypes.Normal;
    try {
      purview0 = Purview.values.firstWhere((Purview val) {
        return val == purview;
      });
    } catch (e) {}
    try {
      types0 = RoomTypes.values.firstWhere((RoomTypes val) {
        return val == types;
      });
    } catch (e) {}

    int pos0 = -1;
    if (pos != null) {
      pos0 = pos;
    }

    return admin.RoomAdminScreen(
      rid: rid,
      purview: purview0,
      types: types0,
      pos: pos0,
    );
  }

  static Future openInputGameIdScreen(BuildContext context, String gameType) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => InputGameIdScreen(
        uid: '${Session.uid}',
        gameType: gameType,
      ),
      settings: const RouteSettings(name: '/inputGameId'),
    ));
  }

  static Future<dynamic> showImage(BuildContext context, dynamic uid, PageRefer refer) {
    IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
    return personalDataManager.openImageScreen(context, Util.parseInt(uid), refer: refer);
  }

  /// 以弹层的方式调起个人资料  菜单只有 关注/邀约/打赏/看资料
  ///
  static goToImageScreenDialog(
    BuildContext context,
    RoomPosition? roomPosition,
    ChatRoomData room, {
    int? userId,
    Widget? topWidget,
  }) async {
    int uid;
    bool isOffline = false;
    if (roomPosition == null && userId != null) {
      uid = userId;
    } else {
      uid = roomPosition!.uid;
      if (room.config?.game == Games.Under) {
        uid = roomPosition.uid > 0 ? roomPosition.uid : (roomPosition.underData?.gameUnderOrigin ?? 0);
        isOffline = roomPosition.uid <= 0 && (roomPosition.underData?.gameUnderOrigin ?? 0) > 0;
      } else if (room.config?.game == Games.Guess) {
        IDrawGuessManager drawGuessManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
        int originUid = drawGuessManager.getOriginUid(roomPosition.positionExpendData);
        uid = roomPosition.uid > 0 ? roomPosition.uid : originUid;
        isOffline = roomPosition.uid <= 0 && originUid > 0;
      } else if (room.config?.game == Games.Wolf) {
        IWereWolfManager wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
        int originUid = wereWolfManager.getOriginUid(roomPosition.positionExpendData);
        uid = roomPosition.uid > 0 ? roomPosition.uid : originUid;
        isOffline = roomPosition.uid <= 0 && originUid > 0;
      }
    }

    Widget profileWidget = RoomUserProfile.getImageFloatScreen(
      context,
      uid: uid,
      chatRoomData: room,
      from: 0,
      isOffline: isOffline,
      background: R.colors.dialogBgColor,
    );

    await displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      backgroundColor: Colors.transparent,
      maxHeightRatio: 1.0,
      builder: (context) {
        return topWidget == null
            ? profileWidget
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  topWidget,
                  profileWidget,
                ],
              );
      },
    );
  }

  /// 打开超级粉丝团
  static openStarChallengeScreen(BuildContext context, {required ChatRoomData roomData}) {
    FiveStartChallengeScreen.show(context, roomData: roomData);
  }

  static Future openPersonalRoomDisplayDirect(BuildContext context, int puzzleId, {Map<String, String>? postData}) async {
    await InitOperate.openPersonalRoomDisplayDirect(context, puzzleId: puzzleId, postData: postData);
  }

  /// 弹出表白活动底部弹窗
  static Future openVindicateActivityBottomSheetPage(BuildContext context, dynamic room, {int? uid, int from = 0}) {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      maxHeightRatio: 1.0,
      builder: (context) {
        return VindicateActivityMain(room: room, uid: uid, from: from);
      },
    );
  }
}
