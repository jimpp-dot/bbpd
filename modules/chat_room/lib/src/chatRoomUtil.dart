import 'package:chat_room/k.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/src/live/live_pk_config_v3.dart';
import 'package:chat_room/src/live/model/live_repository_v3.dart';
import 'package:chat_room/src/mic_link/label/label_edit_panel.dart';
import 'package:chat_room/src/protobuf/generated/rpc_room_frame.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart' as PH;
import 'package:chat_room/src/accompany/widget/accompany_invite_widget.dart';
import 'package:chat_room/src/biz_plugin/juke_music/widget/juke_my_music_widget.dart';
import 'package:chat_room/src/chat_room_screen.dart';

import '../chat_room.dart';
import 'base/art_center_can_not_join_mic_dialog.dart';
import 'base/atmosphere/atmosphere_manager.dart';
import 'base/channel_relay_user.dart';
import 'base/model/voice_connect_info.dart';
import 'base/room_music_control.dart';
import 'base/widget/defendBuyPanel.dart';
import 'kickroom_roommute/providers/room_general_setting_repository.dart';
import 'kickroom_roommute/views/pk_skills_confirm_dialog.dart';
import 'live/live_config_v3.dart';
import 'mic_link/model/mic_link_repo.dart';
import 'pia_drama/edit/edit_drama_page.dart';
import 'pia_drama/edit/edit_drama_reception_fee.dart';
import 'roomNavUtil.dart';
import 'under/model/underData.dart';
import 'under/model/underRepository.dart';
import 'package:synchronized/synchronized.dart';
import 'package:commonrtc_api/commonrtc_api.dart';

class ChatRoomUtil {
  /// 根据Position查找对应的RoomPosition
  static RoomPosition? getPositionByPosition(int? position) {
    if (position == null || position < 0) return null;
    ChatRoomData? room = ChatRoomData.getInstance();
    if (room == null) return null;

    if (room.positions.isNotEmpty) {
      for (RoomPosition item in room.positions) {
        if (item.position == position) {
          return item;
        }
      }
    }
    return null;
  }

  /// 根据UID查找对应的RoomPosition
  static RoomPosition? getPositionByUid(int? uid) {
    if (uid == null || uid <= 0) return null;
    ChatRoomData? room = ChatRoomData.getInstance();
    if (room == null) return null;

    if (room.positions.isNotEmpty) {
      for (RoomPosition position in room.positions) {
        if (position.uid == uid) {
          return position;
        }
      }
    }
    return null;
  }

  ///指定用户是否在麦位上
  static bool isUidOnPosition(int uid) {
    return ChatRoomData.getInstance()?.positions != null &&
        ChatRoomData.getInstance()!.positions.indexWhere((position) {
              return position.uid == uid;
            }) >=
            0;
  }

  ///自己是否在麦位上
  static bool _isSelfOnPosition() {
    return ChatRoomData.getInstance()?.positions != null &&
        ChatRoomData.getInstance()!.positions.indexWhere((position) {
              return position.uid == Session.uid;
            }) >=
            0;
  }

  /// 自己是否在1号麦
  static bool isOnFirstPosition(int? uid) {
    return uid != null &&
        uid > 0 &&
        ChatRoomData.getInstance()?.positions != null &&
        ChatRoomData.getInstance()!.positions.isNotEmpty &&
        ChatRoomData.getInstance()!.positions[0].uid == uid;
  }

  ///麦位上是否有空位
  static bool _hasAvailablePosition() {
    return ChatRoomData.getInstance()?.positions != null &&
        ChatRoomData.getInstance()!.positions.indexWhere((position) {
              return position.uid == 0; //uid为0表示该坑位未被占用
            }) >=
            0;
  }

  /// 是否为房主或接待
  static bool isCreateOrReception() {
    return isRoomCreator(ChatRoomData.getInstance()!) || isOnFirstPosition(Session.uid);
  }

  /// 通用上麦流程，不具体房型
  static void joinMic(ChatRoomData room) async {
    bool isGranted = await room.checkAudioAuthorization();
    if (!isGranted) {
      return;
    }

    /// 自由上麦
    if (room.config?.mode == RoomMode.Auto) {
      RoomRepository.joinMic(room.rid, -1, needCertify: true);
    } else {
      ChatRoomUtil.showWaitList(room);
    }
  }

  ///显示抱人上麦list弹框
  static _showWaitList({required ChatRoomData room}) {
    MicUpWaitList.show(
      context: System.context,
      builder: (BuildContext context) {
        return MicUpWaitList(
          room: room,
          isBoss: false,
          isAuction: room.config?.types == RoomTypes.Auction,
        );
      },
    );
  }

  static showWaitList(ChatRoomData room) {
    _showWaitList(room: room);
  }

  ///是否自动上麦/发起征兆/显示抱人等
  static void doAfterAgoraJoined() {
    Future.delayed(Duration.zero, () async {
      ChatRoomData? room = ChatRoomData.getInstance();
      RoomConfig? roomConfig = room?.config;

      if (room == null || roomConfig == null) return;

      bool isJubenRoom = roomConfig.property == RoomProperty.Game && roomConfig.type == 'juben'; //是否剧本房
      bool autoMic = room.autoMic;
      if (!isJubenRoom) {
        if (room.realRid == room.matchRid || autoMic) {
          room.matchRid = -1; //自动上麦和自动征召已经执行过一次，以后就不再执行

          bool hasEmptyPosition = _hasAvailablePosition(); //麦上是否有空位
          bool isSelfOnPosition = _isSelfOnPosition(); //自己是否在麦上
          Log.d('_doAfterAgoraJoined $hasEmptyPosition $isSelfOnPosition ${room.autoJoin} ');

          //匹配到房间后，有空麦位且自己不在麦上，为独立上麦，则用户上麦；
          bool autoJoin = ((room.autoJoin ?? 0) > 0 || autoMic);
          if (autoJoin && !isSelfOnPosition && hasEmptyPosition) {
            if (roomConfig.mode == RoomMode.Auto || roomConfig.uid == Session.uid) {
              // 自由上麦或者房主本人
              await RoomRepository.joinMic(room.realRid, -1, uid: Session.uid, toastSuccess: false, needCertify: false);
              //新创建的房间，发起征召
              if (room.autoMatch != null && room.autoMatch! > 0) {
                String? typeLabel;
                String? publishDeal;
                if (roomConfig.game == Games.Wolf) {
                  IWereWolfManager? wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
                  typeLabel = wereWolfManager?.getTypeLabel();
                  publishDeal = wereWolfManager?.getPublishDeal();
                  RoomRepository.startMatch(context: System.context, rid: '${room.realRid}', type: typeLabel, publishDeal: publishDeal);
                } else {
                  RoomRepository.startMatch(context: System.context, rid: '${room.realRid}');
                }
              }
            } else {
              bool flag = await RoomRepository.roomRepositoryQueue(context: System.context, rid: room.realRid);
              if (flag) {
                _showWaitList(room: room);
              }
            }
          }
        }
      }
    });
  }

  ///检查并获取卧底词
  static void checkAndReloadUnderWord() async {
    if (ChatRoomData.exists() && ChatRoomData.getInstance()!.isMic && ChatRoomData.getInstance()!.config?.game == Games.Under) {
      int aid = ChatRoomData.getInstance()!.positionForCurrentUser?.underData?.gameUnderId ?? 0;
      if (aid <= 0 || ChatRoomData.getInstance()!.config?.underData?.gameUnderState == GameUnderState.Wait) {
        ChatRoomData.getInstance()!.gameUnderWord = null;
      } else if ((ChatRoomData.getInstance()!.gameUnderWord == null || ChatRoomData.getInstance()!.gameUnderWord!.isEmpty)) {
        UnderRepository.loadGameUnderWord(ChatRoomData.getInstance()!, aid);
      }
    }
  }

  ///发送本地消息
  static void sendLocalMessage(String? msgContent) {
    String? description = msgContent;
    Map extra = {'type': 'local'};
    if (description == null || description.isEmpty) return;
    MessageContent message = MessageContent.from(
      description,
      extra,
      null,
      null,
    );
    ChatRoomData.getInstance()?.emit(RoomConstant.Event_Message, message);
  }

  ///获取完整icon路径
  static String getIconCachePath(String icon) {
    CachedImageManager cacheManager = CachedImageManager.instance();
    String url = "${System.imageDomain}$icon!head150";
    File imageFile = cacheManager.getFileByUrl(url);
    if (imageFile.existsSync()) {
      return imageFile.path;
    }

    return '';
  }

  ///获取当前用户的麦位对象
  static RoomPosition? getPositionByServer() {
    ChatRoomData? room = ChatRoomData.getInstance();
    if (room == null) {
      return null;
    }
    int uid = Session.uid;
    for (int i = 0; i < room.positions.length; i++) {
      if (room.positions[i].uid > 0 && room.positions[i].uid == uid) {
        return room.positions[i];
      }
    }

    return null;
  }

  ///是否游戏开始
  static bool get isGameStarted {
    RoomConfig? config = ChatRoomData.getInstance()?.config;

    if (config == null) return false;

    if (config.game == Games.Under && config.underData != null) {
      return config.underData?.gameUnderState != GameUnderState.Wait && config.underData?.gameUnderState != GameUnderState.End;
    } else if (config.game == Games.Guess) {
      IDrawGuessManager drawGuessManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
      return drawGuessManager.isGaming();
    } else if (config.game == Games.Wolf) {
      IWereWolfManager wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
      return wereWolfManager.isGaming();
    }
    return false;
  }

  ///是否游戏管理
  static bool get isGameAdmin {
    if (ChatRoomData.getInstance()?.config?.game == Games.None && !ChatRoomData.getInstance()!.isGuessQueue) {
      return false;
    }

    RoomPosition? position = getPositionByServer();

    if (position == null) return false;

    return position.position == 0 || (position.underData != null && position.underData!.isAdmin);
  }

  ///是否封禁
  static bool get isForbidden {
    RoomPosition? position = getPositionByServer();
    return position != null && position.forbidden;
  }

  //当前用户是否在麦上，服务器里
  static bool get isMic {
    int uid = Session.uid;
    if (uid == 0 || !ChatRoomData.exists()) return false;

    if (ChatRoomData.getInstance()!.isEightOwner(Session.uid) && ClientRole.Broadcaster == ChatRoomData.getInstance()!.role) {
      return true;
    }

    return ChatRoomData.getInstance()!.positions.any((RoomPosition pos) {
      return pos.uid == uid;
    });
  }

  //当前用户是否为蒙面互动中的蒙面GS
  static bool isMysteryGs(int uid) {
    if (!ChatRoomData.exists()) return false;

    /// 1-6麦
    for (int i = 1; i < ChatRoomData.getInstance()!.positions.length - 1; i++) {
      if (uid == ChatRoomData.getInstance()!.positions[i].uid) {
        return true;
      }
    }
    return false;
  }

  static List<int> covertList(List? res) {
    List<int> data = [];
    if (res == null || res.isEmpty) {
      return data;
    }
    for (int i = 0; i < res.length; i++) {
      data.add(Util.parseInt(res[i]));
    }
    return data;
  }

  static List<String> covertListString(List res) {
    List<String> data = [];
    for (int i = 0; i < res.length; i++) {
      data.add(res[i].toString());
    }
    return data;
  }

  static Map<int, List<int>>? convertListMap(dynamic listMap) {
    Map tempMap = {};
    if (listMap is List) {
      tempMap[0] = listMap[0];
    } else if (listMap is Map) {
      tempMap = listMap;
    } else {
      return null;
    }

    if (tempMap.isEmpty) return null;

    Map<int, List<int>> result = {};
    tempMap.forEach((key, value) {
      result[Util.parseInt(key)] = covertList(value);
    });

    return result;
  }

  ///检查麦克风权限及对应弹框
  static Future<bool> checkAudioAuthorization() async {
    PH.PermissionStatus microphonePermission = await PermissionUtil.checkAndRequestPermissions(Constant.context, PH.Permission.microphone);
    if (microphonePermission == PH.PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  static bool isMan(position) {
    return (position == 1 || position == 2 || position == 5 || position == 6) ? false : true;
  }

  static bool get isEightPosition {
    return ChatRoomData.getInstance() != null &&
        ChatRoomData.getInstance()!.positions.length == 8 &&
        ChatRoomData.getInstance()!.config != null &&
        ChatRoomData.getInstance()!.config!.game == Games.None &&
        ChatRoomData.getInstance()!.config!.types != RoomTypes.CpLink &&
        ChatRoomData.getInstance()!.config!.types != RoomTypes.TheOne &&
        ChatRoomData.getInstance()!.isGuessQueue == false &&
        ChatRoomData.getInstance()!.isHeartRace == false &&
        ChatRoomData.getInstance()!.isMyHouseRoom == false;
  }

  /// 服务端8麦房：brother（大哥房）business-normal8 (标准8麦) cplink-v2/cplink (连连看) under/business-under (谁是卧底)
  /// 客户端老8麦房：麦位是8个 Games.none 不是CpLink(心动连连看) 不是TheOne(非诚勿扰) 不是GuessQueue(画猜接龙) 不是HeartRace(心跳竞速) 不是brother(大哥房)
  /// （服务端8麦房 和 客户端老8麦房 差集）= business-normal8
  /// 新8麦房，根据factoryType = RoomFactoryType.BusinessNormal8 来判断，不根据positions.length == 8判断
  static bool get isNormalEightPosition {
    return ChatRoomData.getInstance() != null &&
        ChatRoomData.getInstance()!.config != null &&
        (ChatRoomData.getInstance()!.config!.factoryType == RoomFactoryType.BusinessNormal8);
  }

  static bool get isFivePosition {
    return ChatRoomData.getInstance() != null && ChatRoomData.getInstance()!.isFivePosition;
  }

  static bool isEightOwner(uid) {
    return isEightPosition && ChatRoomData.getInstance()?.config != null && uid == ChatRoomData.getInstance()?.config?.uid;
  }

  /// 兼容老版本，返回最后一个老板位
  static int get bossPosition {
    List<RoomPosition> result = getBossChairPositions();
    if (Util.isCollectionEmpty(result)) {
      return -1;
    }
    return result.last.position;
  }

  /// 自己是否在老板位上
  static bool get isBoss {
    for (RoomPosition position in ChatRoomData.getInstance()!.positions) {
      if (Session.uid == position.uid && isBossChair(position)) {
        return true;
      }
    }
    return false;
  }

  /// 所有老板位
  static List<RoomPosition> getBossChairPositions() {
    List<RoomPosition> result = [];
    for (RoomPosition position in ChatRoomData.getInstance()!.positions) {
      if (isBossChair(position)) {
        result.add(position);
      }
    }
    return result;
  }

  /// 老板位 上是否有人
  static bool bossChairHasUser() {
    List<RoomPosition> result = [];
    for (var e in ChatRoomData.getInstance()!.positions) {
      if (isBossChair(e)) {
        result.add(e);
      }
    }
    for (RoomPosition position in result) {
      if (position.uid > 0) {
        return true;
      }
    }
    return false;
  }

  /// 该麦位是否是老板位
  static bool isBossChair(RoomPosition? roomPosition) {
    return roomPosition != null && roomPosition.isBoss;
  }

  /// 麦位是否老板位
  static bool isBossChairByPosition(int? position) {
    if (ChatRoomData.getInstance() == null) {
      return false;
    }
    if (position == null || position < 0 || position >= ChatRoomData.getInstance()!.positions.length) {
      return false;
    }
    return isBossChair(ChatRoomData.getInstance()!.positions[position]);
  }

  /// 麦位 是否 接待位
  static bool isReceptionChair(int position) {
    return (ChatRoomData.getInstance()!.config!.reception && position == 0);
  }

  ///根据uid找到PositionOffset，礼物需要使用对应坐标做动画
  static PositionOffset getPointByUid(int uid) {
    ChatRoomData roomData = ChatRoomData.getInstance()!;

    UserIconStyle defaultStyle = UserIconStyle.Normal;
    Size defaultSize = IconStyles[defaultStyle]!;

    try {
      if (roomData.createor?.uid == uid && (isEightPosition || isFivePosition)) {
        final RenderBox? box = roomData.createorKey.currentContext?.findRenderObject() as RenderBox?;
        Offset? offset = box?.localToGlobal(const Offset(0.0, 0.0));
        if (offset == null || offset.dx < 0 || offset.dx > Util.width) {
          // 屏幕外的，从右上角飞出
          return PositionOffset(Offset(Util.width - 70.0, 50.0), defaultStyle, defaultSize, false);
        } else {
          return PositionOffset(offset, UserIconStyle.Big, box!.size);
        }
      }

      RoomPosition? config = roomData.positions.firstWhereOrNull((RoomPosition pos) => pos.uid == uid);
      if (config == null) {
        if (roomData.dmPosition != null && roomData.dmPosition?.uid == uid) {
          config = roomData.dmPosition;
        }
      }

      if (config == null) {
        //不在坑位上时，默认从右上角飞出
        return PositionOffset(Offset(Util.width - 70.0, 50.0), defaultStyle, defaultSize, false);
      }
      UserIconStyle style = (isEightPosition || isFivePosition) ? UserIconStyle.Normal : UserIconStyle.Big;
      if (config.position == 0) {
        if (roomData.isSenderRoom) {
          style = UserIconStyle.Middle;
        }
      }
      final RenderBox? box = config.key?.currentContext?.findRenderObject() as RenderBox?;
      Offset? offset = box?.localToGlobal(const Offset(0.0, 0.0));
      if (offset == null || offset.dx < 0 || offset.dx > Util.width) {
        // 屏幕外的，从右上角飞出
        return PositionOffset(Offset(Util.width - 70.0, 50.0), defaultStyle, defaultSize, false);
      } else {
        return PositionOffset(box!.localToGlobal(const Offset(0.0, 0.0)), style, box.size);
      }
    } catch (e) {
      Log.d(e.toString());
    }

    return PositionOffset(Offset(Util.width - 70.0, 50.0), defaultStyle, defaultSize, false);
  }

  ///退出房间前的检查，true 退出，false 不退出
  static Future<bool> checkToDispose(BuildContext context) async {
    bool? canDispose = true;
    if (ChatRoomData.exists()) {
      bool isGaming = false;
      Games? game = ChatRoomData.getInstance()?.config?.game;
      RoomPosition? curPosition = ChatRoomData.getInstance()?.positionForCurrentUser;

      if (game == Games.Under) {
        //卧底游戏
        GameUnderState? state = ChatRoomData.getInstance()?.config?.underData?.gameUnderState;
        if (state != GameUnderState.Wait &&
            state != GameUnderState.End &&
            curPosition?.underData != null &&
            curPosition?.underData?.gameUnderRole == GameUnderRole.None) {
          isGaming = true;
        }
      } else if (game == Games.Guess) {
        //你画我猜游戏
        IDrawGuessManager drawGuessManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
        isGaming = drawGuessManager.isGaming();
      } else if (game == Games.Wolf) {
        //狼人杀游戏
        IWereWolfManager wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
        isGaming = wereWolfManager.checkToDispose(curPosition?.positionExpendData);
      }

      {
        if (isGaming && ChatRoomData.getInstance()!.isMic) {
          //游戏过程中且是麦上玩家
          canDispose = await showDialog(
              context: context,
              builder: (BuildContext context) {
                if (Constant.creditExitRoom && (game == Games.Guess || game == Games.Wolf || game == Games.Under)) {
                  // 针对信用分逻辑，弹窗
                  return ConfirmDialog(
                    title: K.room_quit_title,
                    content: K.room_quit_body_with_credit,
                    negativeButton: NegativeButton(
                      text: K.room_quit_btn_exit,
                      onPressed: () {
                        RoomRepository.xhrAutoError("games/credit/quitRoom", {'rid': ChatRoomData.getInstance()!.realRid.toString()});
                        Navigator.of(context).pop(true);
                      },
                    ),
                    positiveButton: PositiveButton(
                      text: K.room_quit_btn_continue,
                      onPressed: () {
                        Navigator.of(context).pop(false);

                        if (ChatRoomData.getInstance() != null) {
                          IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
                          roomManager.openChatRoomScreenShow(System.context, ChatRoomData.getInstance()!.realRid,
                              from: ChatRoomScreen.lastFrom, refer: ChatRoomData.getInstance()!.refer);
                          eventCenter.emit(EventConstant.EventTopLiveClick);
                        }
                      },
                    ),
                  );
                }

                return ConfirmDialog(
                  content: K.change_room_content,
                  negativeButton: NegativeButton(
                    text: K.cancel,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  positiveButton: PositiveButton(
                    text: K.sure,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                );
              });
        }
      }
    }
    return canDispose == true;
  }

  ///进房前检查弹窗
  ///返回值：true 进入， false 不进入
  static Future<bool> checkToEnter(BuildContext context,
      {int? rid,
      String? type,
      VoidCallback? onNegative,
      VoidCallback? onPositive,
      bool withOpenCheck = false,
      bool checkVideoGuide = false,
      int recommendUid = 0}) async {
    bool canEnter = true;
    canEnter = (await RoomRepository.roomPreCheckNew(
            context: context, rid: rid ?? 0, type: type, checkVideoGuide: checkVideoGuide, recommendUid: recommendUid)) ??
        false;
    if (withOpenCheck) {
      if (ChatRoomScreen.openingRid > 0 && ChatRoomScreen.openingRid != rid) {
        return false;
      }
    }

    return canEnter;
  }

  static Future<bool> preCheck(BuildContext context, int rid, {bool checkVideoGuide = false, int recommendUid = 0}) async {
    ChatRoomScreen.openingRid = rid;

    bool canEnter = true; //是否直接进入房间
    try {
      //如果要新进的房间跟当前房间不一致，显示退出房间提示dialog
      if (ChatRoomData.getInstance()?.realRid != null &&
          ChatRoomData.getInstance()!.realRid > 0 &&
          ChatRoomData.getInstance()?.realRid != rid) {
        canEnter = await ChatRoomUtil.checkToDispose(context);
      }
      Log.d('Change room with check dispose: $canEnter, rid: $rid, disposeId: ${ChatRoomData.getInstance()?.realRid}');

      //不退出房间，返回
      if (!canEnter) return false;

      IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
      if (roomManager.withEnterPreCheck) {
        canEnter = await ChatRoomUtil.checkToEnter(context, rid: rid, onNegative: () {
          Future.delayed(
              const Duration(
                seconds: 1,
              ), () {
            String url = Util.getHelpUrlWithQStr('k25');
            BaseWebviewScreen.show(System.context, url: url, title: K.room_game_rules);
          });
        }, withOpenCheck: true, checkVideoGuide: checkVideoGuide, recommendUid: recommendUid);
      }
    } catch (e) {}
    Log.d('Change room with check canEnter: $canEnter, rid: $rid');
    return canEnter;
  }

  ///踢出房间，游戏房显示踢人理由，非游戏房显示踢出时间
  ///[isGame] 是否为游戏房
  static Future<void> kickOut(BuildContext context,
      {ChatRoomData? room, int? rid, RoomPosition? position, int? uid, bool isGame = false, int vrid = 0}) async {
    room ??= ChatRoomData.getInstance();

    List<SheetItem> res;
    if (room != null) isGame = room.config != null && room.config!.game != Games.None;

    String reasonKey = '';

    AppConfig.sync(type: [AppConfig.kickout]);

    Map kickOutReason;
    String? kickOutConfig = AppConfig.getConfig(AppConfig.kickout);
    if (kickOutConfig.isNotEmpty) {
      kickOutReason = jsonDecode(kickOutConfig);
    } else {
      kickOutReason = {
        'making_trouble': R.array('room_kick_out_reasons')[0],
        'child': R.array('room_kick_out_reasons')[1],
        'attacking': R.array('room_kick_out_reasons')[2],
        'wasting_time': R.array('room_kick_out_reasons')[3],
        'others': R.array('room_kick_out_reasons')[4]
      };
    }

    if (isGame) {
      res = [for (MapEntry reason in kickOutReason.entries) SheetItem(reason.value, "time", reason.key)];
    } else {
      res = [for (MapEntry reason in kickOutReason.entries) SheetItem(reason.value, "violation", reason.key)];
      SheetCallback? result = await displayModalBottomSheet(
          context: context,
          builder: (context) {
            return RadioBottomSheet(title: K.room_kick_out_reason, data: res);
          });
      if (result == null || result.reason == SheetCloseReason.Active) {
        return;
      }
      reasonKey = result.value?.extra.toString() ?? '';

      res = [
        SheetItem(K.room_ten_mins, "time", 600),
        SheetItem(K.one_hour, "time", 3600),
        SheetItem(K.one_day, "time", 86400),
        SheetItem(K.one_week, "time", 86400 * 7),
        SheetItem(K.one_month, "time", 86400 * 30),
      ];
    }

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (context) {
          return RadioBottomSheet(title: isGame ? K.room_kick_out_reason : null, data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    if (isGame) {
      reasonKey = result.value?.extra.toString() ?? '';
    }

    if (ChatRoomUtil.isLayaGame(room?.config)) {
      try {
        await room!
            .kickOut(RPCReqKickOut(
              toUid: position != null ? position.uid : uid,
              time: !isGame ? result.value?.extra : 0,
              position: position != null ? position.position : -1,
            ))
            .timeout(const Duration(seconds: 3));
      } catch (e) {
        Log.e(e);
      }
    } else {
      await RoomRepository.xhrAutoError('room/kickout?version=2', {
        'rid': '${room != null ? room.realRid : rid}',
        'uid': '${position != null ? position.uid : uid}',
        'position': '${position != null ? position.position : -1}',
        'desc': reasonKey,
        'time': !isGame ? (result.value?.extra.toString() ?? '') : '',
        'vrid': vrid.toString()
      });
    }
  }

  /// 判断是否为音乐房
  static bool isMusicRoom(RoomConfig? config) {
    return config?.type == 'listensong';
  }

  /// 是否房主
  static bool isRoomCreator(ChatRoomData room) {
    return Session.uid == room.createor?.uid;
  }

  /// 是否婚礼房
  static bool isWedding(RoomConfig? config) {
    return config?.types == RoomTypes.Wedding;
  }

  /// 是否抢唱房
  static bool isGrabMic(RoomConfig? config) {
    return config?.factoryType == RoomFactoryType.Grabmic;
  }

  /// 是否是laya游戏
  static bool isLayaGame(RoomConfig? config) {
    return config?.type == 'laya';
  }

  /// 是否是laya狼人杀游戏
  static bool isLayaWolf(RoomConfig? config) {
    return config?.type == 'laya' && config?.originalRFT == 'laya-wolf';
  }

  static bool isLive(RoomConfig? config) {
    return config?.types == RoomTypes.Live;
  }

  /// 普通1+1陪伴房
  static bool isAccompany(RoomConfig? config) {
    return config?.factoryType == RoomFactoryType.Accompany;
  }

  /// 你说我猜房
  static bool isSpeakGuess(RoomConfig? config) {
    return config?.factoryType == RoomFactoryType.SpeakGuess;
  }

  /// 是否直播才艺厅
  static bool isLiveTalent(RoomConfig? config) {
    return config?.factoryType == RoomFactoryType.BusinessContent && config?.property == RoomProperty.Business;
  }

  /// 是否麦序房（新版才艺厅）
  static bool isArtCenter(RoomConfig? config) {
    return config?.factoryType == RoomFactoryType.BusinessArtcenter && config?.property == RoomProperty.Business;
  }

  /// 点唱厅判断
  static bool isJukeMusicRoom(RoomConfig? config) {
    return config?.factoryType == RoomFactoryType.BusinessMusic;
  }

  /// 庆典房
  static bool isCelebration(RoomConfig? config) {
    return config?.factoryType == RoomFactoryType.BusinessCelebration;
  }

  /// 情侣PK
  static bool isDebatePK(RoomConfig? config) {
    return config?.factoryType == RoomFactoryType.debate;
  }

  /// 大哥房（my_house_room）
  static bool isMyHouse(RoomConfig? config) {
    return config?.factoryType == RoomFactoryType.brother;
  }

  /// ktv合唱房
  static bool isKtvChorus(RoomConfig? config) => config?.type == 'ktv-chorus';

  static List<KtvOffMic> parseOffMicList(List? offMics) {
    List<KtvOffMic> offMicList = [];
    offMics?.forEach((element) {
      KtvOffMic offMic = KtvOffMic.fromJson(element);
      offMicList.add(offMic);
    });
    return offMicList;
  }

  ///守护续费
  static Future<void> continueDefend(BuildContext context, ChatRoomData room, int type) async {
    if (type <= 0) return;

    String url = "room/defend/";
    Map<String, String> post = {
      'rid': '${room.rid}',
      'uid': '${room.positions[0].uid}',
    };
    Map? res = await RoomRepository.xhrAutoError(url, post, toastSuccess: false);
    if (res?['success'] == true) {
      displayModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return DefendBuyPanel(
              room: room,
              to: Util.parseInt(res!['data']['to']),
              toName: res['data']['name'].toString(),
              type: min(type, 3),
              config: res['data']['defend'],
            );
          });
      return;
    }
  }

  static Future<void> handleIconTap(BuildContext context, ChatRoomData room, RoomPosition position, String? key, [dynamic extra]) async {
    switch (key) {
      case 'follow':
        try {
          NormalNull response = await BaseRequestManager.onFollow(
            position.uid.toString(),
            refer: 'room',
            settlementChannel: room.config?.settlementChannel ?? '',
            typeLabel: room.config?.typeName ?? '',
            roomFactoryType: room.config?.originalRFT ?? '',
          );
          if (response.success) {
            Toast.showCenter(context, K.followed);
          } else {
            if (response.msg.isNotEmpty) {
              Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
            }
          }
        } catch (e) {
          Toast.showCenter(context, e.toString());
        }
        break;

      case 'mic-join':
        //自己上麦
        bool isGranted = await room.checkAudioAuthorization();
        if (!isGranted) {
          return;
        }

        /// 麦序房转入其他房间时，不能上麦
        if (room.isArtCenterInsertOtherRoom) {
          ArtCenterCanNotJoinMicDialog.show(context: context, toRid: room.config?.rid ?? 0);
          return;
        }

        if (room.isEightOwner(position.uid) && Session.uid == position.uid) {
          room.setRole(ClientRole.Broadcaster);
          return;
        }
        Map? data = await RoomRepository.joinMic(
          room.rid,
          position.position,
          uid: 0,
          toastError: true,
          toastSuccess: false,
          needCertify: true,
          type: room.needVerify,
          newType: room.needVerifyNew,
        );
        _joinDefend(context, room, data);
        break;

      case 'mic-leavel':
        if (room.isEightOwner(position.uid)) {
          room.setRole(ClientRole.Audience);
        } else {
          RoomRepository.leavelMic(room.rid, position.uid);
          if (position.uid == Session.uid) {
            if (room.createor?.uid == position.uid) {
              RoomAtmosphereManager.apiCloseAtmosphere(room.rid);
            }
            RoomMusicControl.closeMusic();
          }
        }
        break;

      case 'mic-disabled':
        RoomRepository.opMic(room.rid, position.position, 'lockMic');
        break;

      case 'mic-enable':
        RoomRepository.opMic(room.rid, position.position, 'unlockMic');
        break;

      case 'mic-forbidden':
        RoomRepository.opMic(room.rid, position.position, 'forbiddenMic');
        break;

      case 'mic-unforbidden':
        RoomRepository.opMic(room.rid, position.position, 'unforbiddenMic');
        break;

      case 'package-clear':
        RoomRepository.opMic(room.rid, position.position, 'package-clear');
        break;

      case 'counter':
        int duration = extra;
        RoomRepository.opMic(room.rid, position.position, 'timer', duration: duration);
        break;

      case 'counter-stop':
        RoomRepository.opMic(room.rid, position.position, 'timer', duration: 0);
        break;

      case 'profile':
        RoomNavUtil.goToImageScreenDialog(context, position, room);
        break;
      case 'mic-join-other':
        RoomNavUtil.openRoomAdminScreen(context,
            rid: room.rid, purview: room.purview, types: room.config?.types, pos: position.position, uid: room.createor?.uid ?? 0);
        break;

      case 'kickout':
        ChatRoomUtil.kickOut(context, room: room, position: position);
        break;
      case 'admin.cancel':
      case 'admin.set.super':
      case 'admin.set':
        int adminValue = 0;
        if (key == 'admin.set.super') {
          adminValue = 1;
        }
        RoomRepository.xhrAutoError("room/setAdmin", {
          'rid': room.rid.toString(),
          'uid': position.uid.toString(),
          'admin': adminValue.toString(),
          'op': key == 'admin.cancel' ? 'remove' : 'add'
        });
        break;

      case 'gift':
        IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        giftManager.showRoomGiftPanel(context, room: room, uid: position.uid);
        break;

      case 'wantDefend':
        int pos = position.position;
        if (pos <= 0) return;
        String url = "room/defend/";
        Map<String, String> post = {
          'rid': room.rid.toString(),
          'uid': room.positions[0].uid.toString(),
        };
        Map? res = await RoomRepository.xhrAutoError(url, post, toastSuccess: false);
        if (res?['success'] == true) {
          displayDefendTypes(context, Util.parseInt(res!['data']['to']), res['data']['name'].toString(), res['data']['defend'], room);
          return;
        }
        break;

      case 'continueDefend':
        //守护续费
        int pos = position.position;
        if (pos <= 0) return;

        ChatRoomUtil.continueDefend(context, room, min(pos, 3));
        break;

      case 'underVote':
        //卧底房投票给某一麦位
        UnderRepository.votePosition(room, position);
        break;

      case 'copyGameId':
        dynamic gameId = extra;
        if (gameId != null && gameId is String && gameId.isNotEmpty) Clipboard.setData(ClipboardData(text: gameId));
        break;
      case 'set-game-admin':
        UnderRepository.setGameAdmin(room.rid, position.position);
        break;
      case 'accompany-invite-friend':
        AccompanyInviteWidget.launch(context, room.rid, AccompanyInviteType.Friend);
        break;
      case 'accompany-invite-nearby-online-user':
        AccompanyInviteWidget.launch(context, room.rid, AccompanyInviteType.Nearby);
        break;
      case 'juke-music-edit':
        JukeMyMusicWidget.open(context, room.rid);
        break;
      case 'room_edit_drama':

        /// 编辑自己的单人pia戏剧本，接待还可以编辑房间内的多人本
        EditDramaPage.show(context, rid: room.rid, isReception: isCreateOrReception());
        break;
      case 'room_edit_drama_fee':

        /// 编辑房间内剧本的接待费
        EditDramaReceptionFee.show(context, rid: room.rid);
        break;
      case 'room_edit_mic_label':
        LabelEditPanel.show(context, room);
        break;
      case 'room_mic_link_disconnect':
        if (position.uid > 0) {
          MicLinkRepo.disconnectLink(room.rid, position.uid);
        }
        break;
      case 'room_user_mute':
        PkSkillsConfirmDialog.show(
          context,
          mainTitle: K.room_mute_title,
          subTitle: K.room_mute_desc(['10']),
          cancelButtonText: K.cancel,
          confirmButtonText: K.sure,
          confirmCallback: () async {
            Navigator.of(context).pop();
            // 用户禁言
            NormalNull resp = await RoomGeneralSettingRepository.roomUserMute(uid: position.uid, rid: room.rid);
            if (resp.success) {
              Fluttertoast.showCenter(msg: K.room_operate_success);
            } else if (Util.validStr(resp.msg)) {
              Fluttertoast.showCenter(msg: resp.msg);
            }
          },
        );
        break;
    }
  }

  static _joinDefend(BuildContext context, ChatRoomData? room, Map? res) {
    if (res == null) return;

    if (res['success'] == true) return;

    if ((room?.config != null && room?.config?.types != RoomTypes.RadioDefend) ||
        res['msg'] != 'error.defend' ||
        res['defend'] == null ||
        res['defend'] is! List) {
      return;
    }

    displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return DefendBuyPanel(
            room: room,
            to: Util.parseInt(res['to']),
            toName: res['name'].toString(),
            type: Util.parseInt(res['type']),
            config: res['defend'],
          );
        });
  }

  ///使用者请自行保证没有两个widget使用同一个key
  static getGlobalKey(int uid) {
    GlobalKey? globalKey;
    if (ChatRoomData.getInstance() != null) {
      int index = ChatRoomData.getInstance()!.positions.indexWhere((element) {
        return element.uid == uid;
      });
      if (index > -1) {
        globalKey = ChatRoomData.getInstance()!.positions[index].key;
      }
    }
    return globalKey;
  }

  /// 如果支持PK房间（直播+电台），并且是房主，在连麦阶段，则连麦V3版本
  static Future<void> startLivePKV3(ChatRoomData? room) async {
    if (room?.canPk != true) {
      return;
    }
    //然后如果符合条件则连麦
    LivePKConfigV3? pkConfig = room?.config?.liveDataV3?.pkConfigV3;
    if (pkConfig == null) {
      return;
    }
    LivePKState? status = pkConfig.pkBase?.state;
    if (status == null || status == LivePKState.Wait || status == LivePKState.Match || status == LivePKState.End) {
      //非pk连麦阶段
      await stopChannelMediaRelay(room!);
      return;
    }
    ChannelRelayUser? main = pkConfig.pkBase!.main != null ? ChannelRelayUser.fromLivePKUserOnMicItem(pkConfig.pkBase!.main!) : null;
    ChannelRelayUser? compete =
        pkConfig.pkBase!.compete != null ? ChannelRelayUser.fromLivePKUserOnMicItem(pkConfig.pkBase!.compete!) : null;
    startChannelMediaRelay(main, compete, room!);
  }

  static final _relayLock = Lock();

  /// 支持同时PK跨房+跨麦序房
  static int pkRelayDestRid = 0;

  /// 通用房间PK，跨房目标rid
  static int talentRelayDestRid = 0;

  /// 麦序房跨房，跨房目标rid（麦序房rid）
  static Future<void> startChannelMediaRelay(ChannelRelayUser? main, ChannelRelayUser? compete, ChatRoomData? room,
      {bool forTalent = false}) async {
    _relayLock.synchronized(() async {
      if (main != null && main.rid > 0 && compete != null && compete.rid > 0) {
        if (Session.uid != main.uid && Session.uid != compete.uid) {
          /// 参与PK的用户，才需要进行rtc连麦
          return;
        }

        if (!(room?.rtcController.initialized ?? false)) {
          /// rtc未完成初始化
          return;
        }

        int srcRid = room!.realRid;
        int srcUid = 0;
        if (srcRid == main.rid || srcRid == compete.rid) {
          int destRid;
          if (main.rid == srcRid) {
            destRid = compete.rid;
          } else {
            destRid = main.rid;
          }
          int destUid = Session.uid;

          ChannelMediaRelayConfiguration? config = room.rtcController.getMediaRelayConfiguration();
          List<ChannelMediaInfo> destInfo = config?.destInfos ?? [];
          int destSize = destInfo.length;
          int lastRid = forTalent == true ? talentRelayDestRid : pkRelayDestRid;
          bool hasRelay = destRid == lastRid;
          bool needUpdate = false;

          Log.d('startChannelMediaRelay destSize: $destSize, hasRelay: $hasRelay');
          if (!hasRelay && lastRid > 0 && destSize > 0) {
            /// 单一的跨房类型（PK(约战)  麦序房）暂时只支持一个目标频道
            /// 同是PK跨房 或者 同是麦序房跨房，但是目标rid变化了，需要将老的目标rid移出。
            destInfo.removeWhere((element) => element.channelName == '$lastRid');
          }

          /// 1.当前没有任何跨频道，destSize == 0
          ///   1.1.之前跨房过（hasRelay == true）,代表之前的跨房失败了，先尝试stop再重新跨房
          ///   1.2.之前位跨房（hasRelay == false）,直接跨频道
          /// 2.当前已经有其他目标rid，updateChannelMediaRelay，增加一路跨频道
          /// 3.当前要跨的目标rid已经在destInfo, do nothing
          if (destSize == 0) {
            if (hasRelay == true) {
              /// 如果当前没有跨房连麦成功到_destRid,先尝试关闭
              await room.rtcController.engine?.stopChannelMediaRelay();

              /// 等待回调完成
              await Future.delayed(const Duration(milliseconds: 1500));
            }
            needUpdate = false;
          } else {
            bool hasInDest = destInfo.any((element) => element.channelName == '$destRid');
            if (hasInDest) {
              /// do nothing
              return;
            }

            /// 已经有跨频道，但这次需要跨房的目标rid不在list中，需要updateChannelMediaRelay增加一路
            needUpdate = true;
          }

          if (forTalent == true) {
            talentRelayDestRid = destRid;
          } else {
            pkRelayDestRid = destRid;
          }

          Map<String, String>? tokenMap = await LiveRepositoryV3.getPkToken(srcRid, srcUid, destRid, destUid);
          if (tokenMap != null) {
            if ((tokenMap.containsKey('token1') && tokenMap['token1'] != null && tokenMap['token1']!.isNotEmpty) &&
                (tokenMap.containsKey('token2') && tokenMap['token2'] != null && tokenMap['token2']!.isNotEmpty)) {
              String srcToken = tokenMap['token1']!;
              String destToken = tokenMap['token2']!;

              Log.d("startChannelMediaRelay srcToken=$srcToken srcChannelName=$srcRid srcUid=$srcUid");
              Log.d("startChannelMediaRelay destToken=$destToken destChannelName=$destRid destUid=$destUid");

              ChannelMediaInfo srcInfo;
              if (config?.srcInfo != null) {
                srcInfo = config!.srcInfo;
              } else {
                srcInfo = ChannelMediaInfo(srcUid, channelName: '$srcRid', token: srcToken);
              }

              destInfo.add(ChannelMediaInfo(destUid, channelName: '$destRid', token: destToken));

              var mediaConfig = ChannelMediaRelayConfiguration(srcInfo, destInfo);
              if (needUpdate) {
                await room.rtcController.engine?.updateChannelMediaRelay(mediaConfig);
                Log.d('updateChannelMediaRelay instead startChannelMediaRelay');
              } else {
                await room.rtcController.engine?.startChannelMediaRelay(mediaConfig);
                Log.d('startChannelMediaRelay');
              }
            }
          }
        }
      }
    });
  }

  /// 如果之前进行过跨房连麦，则尝试关闭直播连麦
  static Future<void> stopChannelMediaRelay(ChatRoomData? room, {bool forTalent = false}) async {
    if (room != null) {
      if (room.rtcController.initialized) {
        int destRid = forTalent == true ? talentRelayDestRid : pkRelayDestRid;
        Log.d('stopChannelMediaRelay, destRid: $destRid');
        if (destRid == 0) {
          /// do nothing
          return;
        }
        ChannelMediaRelayConfiguration? config = room.rtcController.getMediaRelayConfiguration();
        List<ChannelMediaInfo> destInfo = config?.destInfos ?? [];
        Log.d('stopChannelMediaRelay, destInfo: ${destInfo.length}');
        if (destInfo.isEmpty) {
          /// do nothing
          return;
        } else {
          bool hasDestRid = destInfo.any((element) => element.channelName == '$destRid');
          if (!hasDestRid) {
            /// do nothing
            return;
          }
          destInfo.removeWhere((element) => element.channelName == '$destRid');

          if (destInfo.isEmpty) {
            /// 当前只跨一个频道，stop
            await room.rtcController.engine?.stopChannelMediaRelay();
            Log.d("stopChannelMediaRelay");
          } else {
            /// 还有其他跨频道，update
            ChannelMediaInfo srcInfo = config!.srcInfo;
            var mediaConfig = ChannelMediaRelayConfiguration(
              srcInfo,
              destInfo,
            );
            await room.rtcController.engine?.updateChannelMediaRelay(mediaConfig);
            Log.d('updateChannelMediaRelay instead stopChannelMediaRelay');
          }
        }

        if (forTalent == true) {
          talentRelayDestRid = 0;
        } else {
          pkRelayDestRid = 0;
        }
      }
    }
  }

  static final _subChannelLock = Lock();
  static int subChannelId = 0;

  /// 麦序房：加入子频道（转入的主播所在房间）
  static Future<void> joinSubChannel(int destRid, ChatRoomData? room) async {
    _subChannelLock.synchronized(() async {
      Log.d('joinSubChannel, destRid: $destRid, subChannelId: $subChannelId');
      if (room == null || !room.rtcController.initialized) {
        Log.d('joinSubChannel, rtc has not initialized, do nothing');
        return;
      }

      if (subChannelId == destRid) {
        Log.d('joinSubChannel, same destRid, do nothing');
        return;
      }

      /// 获取加入子频道的token
      DataRsp<VoiceConnectInfo> rsp = await RoomApi.startVoiceConnect(Session.uid, destRid);
      if (rsp.success != true || rsp.data == null) {
        Log.d('joinSubChannel, getToken error');
        return;
      }

      subChannelId = destRid;
      await room.rtcController.createRtcChannel('$destRid');
      ChannelMediaOptions mediaOptions = ChannelMediaOptions(autoSubscribeAudio: true);

      await room.rtcController.multiChannelJoinChannel(rsp.data?.token ?? '', '', Session.uid, mediaOptions);
      await room.rtcController.multiChannelSetClientRole(ClientRole.Audience);

      return;
    });
  }

  /// 退出子频道
  static Future<void> stopSubChannel(ChatRoomData? room) async {
    Log.d('stopSubChannel, subChannelId: $subChannelId');
    if (subChannelId == 0) {
      Log.d('stopSubChannel, subChannelId == 0, do nothing');
      return;
    }
    subChannelId = 0;
    if (room == null || !room.rtcController.initialized) {
      Log.d('stopSubChannel, rtc has not initialized, do nothing');
      return;
    }
    if (room.rtcController.isMultiChannelExist == false) {
      Log.d('stopSubChannel, isMultiChannelExist == false, do nothing');
      return;
    }

    await room.rtcController.multiChannelLeaveChannel();
    await room.rtcController.multiChannelDestroy();
    return;
  }

  /// 点击设置关闭房间
  static Future<bool> showCloseDialog(BuildContext context, ChatRoomData room) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: K.warn,
            content: room.config?.property == RoomProperty.Business ? K.room_notice_close_room : K.room_notice_sure_to_close_room,
          );
        });
  }

  // 耳返开关
  static const String EarMonitoringEnableKey = 'ear_monitoring_enable';

  static bool earMonitoringEnable() {
    return Config.getInt(EarMonitoringEnableKey, 0) == 1;
  }

  static Future<bool> canEarMonitoring() async {
    AudioOutputRouting? audioType = await ChatRoomData.getInstance()?.rtcController.getAudioRouteType();
    if (audioType == AudioOutputRouting.Headset || AudioOutputRouting.HeadsetBluetooth == audioType) {
      return true;
    }
    return false;
  }

  // 改变耳返设置（开/关）
  static Future<bool> changeEarMonitoringEnable() async {
    if (ChatRoomData.getInstance()?.rtcController.rtcType == RtcBizConfig.rtcTypeZego) {
      bool res = await canEarMonitoring();
      if (!res) {
        Fluttertoast.showToast(msg: K.please_put_on_your_headphones_and_continue_to_turn_them_on);
        return false;
      }
    }

    bool enable = !earMonitoringEnable();
    await ChatRoomData.getInstance()?.rtcController.engine?.enableInEarMonitoring(enable);
    if (enable) {
      setInEarMonitoringVolume(73);
      Fluttertoast.showToast(msg: K.room_in_ear_monitoring_change_toast);
    }
    Config.set(EarMonitoringEnableKey, enable ? '1' : '0');
    return true;
  }

  // 设置耳返为当前config状态
  static Future<void> setEarMonitoringToConfig() async {
    await ChatRoomData.getInstance()?.rtcController.engine?.enableInEarMonitoring(earMonitoringEnable());
    if (earMonitoringEnable()) {
      await setInEarMonitoringVolume(73);
    }
  }

  // 设置耳返音量
  static Future<void> setInEarMonitoringVolume(int volume) async {
    await ChatRoomData.getInstance()?.rtcController.engine?.setInEarMonitoringVolume(volume);
  }

  /// 是否是海龟汤房, type为puzzle,且扩展的puzzle_info存在
  static bool isPuzzleRoom(RoomConfig? config) {
    return config?.type == 'puzzle' && config?.configExpendData != null;
  }

  /// 能否展示点唱标签
  static bool isCanShowJukeboxLabel(String? label) {
    /// Log.d('isCanShowJukeboxLabel, label: $label, joinBroker: ${Session.joinBroker}, isMic: $isMic, isJukebox: ${ChatRoomData.getInstance()?.isJukebox}');
    return (label?.isNotEmpty == true) && Session.joinBroker && isMic && (ChatRoomData.getInstance()?.isJukebox ?? false);
  }

  static bool isCanShowLiveFansLabel(ChatRoomData? room) {
    if (room == null || room.config == null) {
      return false;
    }
    bool isLive = room.config?.types == RoomTypes.Live;
    LiveConfigV3? liveDataV3 = room.config?.liveDataV3;
    return (isLive && liveDataV3 != null && liveDataV3.fansLabel.isNotEmpty);
  }

  static bool isCanShowRadioFansLabel(ChatRoomData room) {
    bool isBusinessRadio = room.isBusinessRadio;
    RoomPosition? position = room.positions.isNotEmpty ? room.positions.first : null;
    return isBusinessRadio && position != null && position.uid > 0;
  }

  static bool isCanShowFansLabel(ChatRoomData? room) {
    if (room == null || room.config == null) {
      return false;
    }
    return isCanShowLiveFansLabel(room) || isCanShowRadioFansLabel(room);
  }

  /// 征召气泡弹框显示
  static bool showRecruitBubbleTips() {
    ChatRoomData? room = ChatRoomData.getInstance();

    if (room?.config == null) return false;

    return room?.config?.game != Games.Wolf && !Config.getBool(BBConfigKey.hasShowNoticeStartRecruitToday(), false);
  }

  static bool isGuessQueueStarted(ChatRoomData room) {
    return room.isGuessQueue && ((room.config?.guessQueueRoomConfigData?.state ?? 0) > 0);
  }

  /// 展示征召按钮
  static bool showRecruitView({dynamic state}) {
    return false;

    ChatRoomData? room = ChatRoomData.getInstance();
    if (room == null) return false;

    if (!room.isMic || !room.showMatch || (!room.hasLoadMatchTime)) return false;

    bool hasEmptyPosition = room.positions.indexWhere((position) {
          return position.uid == 0;
        }) >=
        0;
    if (!hasEmptyPosition) return false;

    Purview purview = room.purview;
    List<String> purviewStrs = purview.toString().toLowerCase().split('.');
    bool showMatchForCurrentRole =
        purviewStrs.isNotEmpty && room.showMatchRoles.contains(purviewStrs.elementAt(purviewStrs.length - 1).toLowerCase());

    if (showMatchForCurrentRole || (room.showMatchRoles.contains('gameadmin') && room.isGameAdmin)) {
      if (ChatRoomUtil.isGuessQueueStarted(room)) return false;

      return room.config?.game == Games.None || !room.isGameStarted;
    }
    return false;
  }

  static String getPositionName(ChatRoomData room, RoomPosition item) {
    String name = K.room_empty_mic_prefix;
    bool isMan = (item.position == 1 || item.position == 2 || item.position == 5 || item.position == 6) ? false : true;

    if ((room.config?.reception ?? false) && item.position == 0) {
      //接待
      if (item.uid == 0) {
        name = K.room_reception;
      } else {
        name = item.name;
      }
    } else if (isBossChair(item)) {
      if (item.uid == 0) {
        name = K.room_boss;
      } else {
        name = item.name;
      }
    } else {
      name = item.name;
      if (room.config?.types == RoomTypes.CpLove && item.uid <= 0) {
        if (isMan) {
          name = K.room_feman_god_position;
        } else {
          name = K.room_man_god_position;
        }
      } else if (room.isGuessQueue && item.uid <= 0) {
        name = item.name;
        if (Util.isStringEmpty(name)) {
          name = K.room_empty_mic_prefix;
        }
      } else if (item.uid <= 0) {
        name = K.room_empty_mic_prefix;
      }
    }

    if (item.uid <= 0 && room.config != null && room.config?.mode != RoomMode.Lock && item.lock == true) {
      name = K.room_mic_locked;
    }
    return name;
  }

  /// 是房主或者管理
  static bool isCreatorOrAdmin(ChatRoomData? room) {
    if (room == null) {
      return false;
    }
    return room.isCreator || room.admins.contains(Session.uid);
  }

  ///有接待优先判断接待 没有判断房主
  static bool isReceptionOnMic({ChatRoomData? room}) {
    room ??= ChatRoomData.getInstance();
    if (room?.config != null && room?.config?.property != RoomProperty.Business) {
      return false;
    }
    if (room?.positions == null || room!.positions.isEmpty) return false;

    RoomPosition position = room.positions.first;
    return position.uid > 0;
  }

  static String roomIcon({ChatRoomData? room}) {
    room ??= ChatRoomData.getInstance();
    if (isReceptionOnMic(room: room)) {
      RoomPosition position = room!.positions.first;
      return position.icon;
    }
    return room?.createor?.icon ?? '';
  }

  /// 是否 房主位
  static bool isCreatorSeat(ChatRoomData room, RoomPosition pos) {
    if (room.config!.showOwnerSeat && pos.isCreator) {
      return true;
    }

    return false;
  }

  /// 除接待位外所有麦位无人
  static bool noOneExceptReception(ChatRoomData room) {
    if (Util.validList(room.positions)) {
      for (int i = 0; i < room.positions.length; i++) {
        if (i == 0 && room.config?.reception == true) {
          continue;
        }
        if (room.positions[i].uid > 0) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  /// 排麦申请中
  static bool inMicQueue(ChatRoomData room) {
    return room.wait.contains(Session.uid) || room.waitForBoss.contains(Session.uid) || room.waitForAuction.contains(Session.uid);
  }
}
