import 'dart:math';

import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/accompany/model/accompany_model.dart';
import 'package:chat_room/src/accompany/model/accompany_pay_model.dart';
import 'package:chat_room/src/base/model/room_rtc_extra.dart';
import 'package:chat_room/src/base/util/room_tag_data_util.dart';
import 'package:chat_room/src/base/widget/room_background_info.dart';
import 'package:chat_room/src/biz_plugin/gpk/model/gpk_model.dart';
import 'package:chat_room/src/cplink/model/cpSceneModel.dart';
import 'package:chat_room/src/cplink/model/cplink_model.dart';
import 'package:chat_room/src/ktv/model/song_sheet_beans.dart';
import 'package:chat_room/src/ktv/model/sound_type.dart';
import 'package:chat_room/src/live/live_config_v3.dart';
import 'package:chat_room/src/protobuf/json_key/generated/system.screen.message.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart' hide MessageContent, MessageType;

import '../under/model/underData.dart';

/// 房间麦位角色
/// 麦位角色 - 0：普通；1：接待；2：老板；3：房主； 4：linkMic；5：嘉宾
/// 嘉宾位和老板位都属于老板位，只是显示名称不一样
enum RoomPositionRole {
  normal,
  reception, // 接待位
  boss, // 老板位
  creator, // 房主位
  linkMic,
  guest, // 嘉宾位
}

RoomPositionRole _parsePositionRole(int positionRole) {
  for (RoomPositionRole role in RoomPositionRole.values) {
    if (role.index == positionRole) {
      return role;
    }
  }
  return RoomPositionRole.normal;
}

class RoomConfig {
  static CpLoveState getCpLoveState(RoomFactoryType types, String state) {
    if (types != RoomFactoryType.BusinessHeart && types != RoomFactoryType.BusinessExpand) return CpLoveState.None;
    try {
      String current = '${'CpLoveState'.toLowerCase()}.${state.replaceAll('-', '').toLowerCase()}';
      return CpLoveState.values.firstWhere((CpLoveState type) {
        return type.toString().toLowerCase() == current;
      });
    } catch (e) {
      Log.d('getCpLoveState not found: $types');
    }
    return CpLoveState.Wait;
  }

  static RoomTypes getTypes(String types, int auction) {
    if (auction == 1) {
      // 拍卖厅是其他的商业厅在一定时间段改为拍卖厅，不改变types。
      return RoomTypes.Auction;
    }
    try {
      String current = '${'RoomTypes'.toLowerCase()}.${types.replaceAll('-', '').toLowerCase()}';
      return RoomTypes.values.firstWhere((RoomTypes type) {
        return type.toString().toLowerCase() == current;
      });
    } catch (e) {
      Log.d('getTypes not found: $types');
    }
    return RoomTypes.Auto;
  }

  static RoomFactoryType getFactoryType(String type) {
    try {
      String current = '${'RoomFactoryType'.toLowerCase()}.${type.replaceAll('-', '').toLowerCase()}';
      return RoomFactoryType.values.firstWhere((RoomFactoryType type) {
        return type.toString().toLowerCase() == current;
      });
    } catch (e) {
      Log.d('getFactoryType not found: $type');
    }
    return RoomFactoryType.Normal;
  }

  static RoomModuleType getModuleType(String type) {
    try {
      String current = '${'RoomModuleType'.toLowerCase()}.${type.replaceAll('-', '').toLowerCase()}';
      return RoomModuleType.values.firstWhere((RoomModuleType type) {
        return type.toString().toLowerCase() == current;
      });
    } catch (e) {
      Log.d('getModuleType not found: $type');
    }
    return RoomModuleType.normal;
  }

  static RoomProperty getProperty(String property) {
    try {
      String current = '${'RoomProperty'.toLowerCase()}.${property.replaceAll('-', '').toLowerCase()}';
      return RoomProperty.values.firstWhere((RoomProperty type) {
        return type.toString().toLowerCase() == current;
      });
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    return RoomProperty.Business;
  }

  static Games getGame(String? game) {
    if (game == null || game.isEmpty) return Games.None;
    try {
      String current = '${'Games'.toLowerCase()}.${game.replaceAll('-', '').toLowerCase()}';
      return Games.values.firstWhere((Games type) {
        return type.toString().toLowerCase() == current;
      });
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    return Games.None;
  }

  /// 解析房间背景
  static RoomBackGroundInfo _parseRoomBackground(Map<dynamic, dynamic> data) {
    String? backgroundMP4 = Util.parseStr(data['mp4']);
    String? backgroundUrl = Util.parseStr(data['url']);
    String? decorate = Util.parseStr(data['pretend']);

    if (backgroundMP4 != null && backgroundMP4.isNotEmpty) {
      return RoomBackGroundInfo(type: RoomBackGroundType.mp4, url: Util.getRemoteImgUrl(backgroundMP4), decorate: decorate);
    }

    if (backgroundUrl == null || backgroundUrl.isEmpty) {
      backgroundUrl = '${System.imageDomain}static/background/room_background_normal.jpg?v=2';
    }
    return RoomBackGroundInfo(type: RoomBackGroundType.jpg, url: Util.getRemoteImgUrl(backgroundUrl), decorate: decorate);
  }

  final int rid;
  final int uid;
  final String name;
  final String icon;
  final String type;
  final String typeName;
  final List<Color> typeColors;
  final int hasLock;
  final int state; //0 公开 1 私人  2 好友可见 3 粉丝可见
  final RoomProperty property;
  final RoomTypes types;
  final RoomModuleType moduleType;
  final RoomFactoryType factoryType;
  final String originFactory;
  final String subtitle; //副标题

  /// 服务端下发的原始factoryType,用于通用标签factoryType匹配
  final String originalRFT; //数数上报使用 不用做功能判断
  final bool description;
  final String descriptionText;
  final bool displayMessage;
  final bool displayRank;
  final bool displayChat; // 底部按钮是否展现私聊入口
  int roomHot = 0;

  /// 全新的房间热度，不再用onlineNum和real进行拼接
  final int unityViewerNum; // 游戏房围观的人数(不包含麦上用户)
  final int version;

  /// 是否开启接待位
  final bool reception;
  final int _paier;

  int get paier => _paier; // 返回老板位个数

  /// 房间背景：包含氛围背景&房间背景
  // final String backgroundUrl;
  // final String backgroundMP4;
  final String? cplinkBackground;
  final RoomBackGroundInfo backgroundInfo;
  final bool hideBackgroundSet;
  final int counter;
  final int package; // 麦上打赏统计状态
  final int oTotal;
  final int oNum;
  final int oDuration;
  final RoomMode mode;

  /// [true] 显示房主位
  /// [false] 关闭房主位
  final bool nine;

  final CpLoveState? cpState;
  final int cid; //技能ID

  final Games? game;
  final UnderConfigData? underData;
  Object? configExpendData; //config扩展数据

  final LiveConfigV3? liveDataV3; // 直播间

  final KtvInfo? ktvInfo; //K歌房
  final int level; //房间等级
  final String? roomTaskType; //房间任务类型
  final String? receptionName; //房间接待/主播人

  bool receptionTaskEnable; //是否开启接待任务

  final int haveRoomCharm; // 是否显示房间排行榜

  final GPKRoomPkData? gpkRoomPkData; //分组PK数据
  final int inflexion; // 变声选项：0:重置（无变声）1:如花，2:香肠嘴，3:熊二，4:猪八戒

  /// 房主进房是否自动上麦
  final bool autoMic;

  final String? settlementChannel;
  final int virtualOnlineNum; // 模拟厅在线人数 非模拟厅没有此字段
  final String? knightKingIcon; //守护骑士之星icon
  final bool hasKingRank; //守护骑士排行是否有成员
  final String? knightKingName;

  final String? liveChallenge; // 直播间星级挑战(五星挑战)

  final bool closeHit;
  final bool crazySummerOpen; // 夏日活动是否开启

  GuessQueueRoomConfigData? guessQueueRoomConfigData;

  final List<GamesTrickItem>? gamesTrick;

  final UserBean? cpNamingUser; // 心动速配冠名位用户信息

  /// 是否显示大头位(生日房)
  final bool showExtraMic;

  /// 祝福语(生日房)
  final String? blessWords;

  /// laya游戏房资源url
  final String? layaUrl;

  /// rtcSDK:
  ///  1.[rtcTypeAgora]
  ///  2.[rtcTypeZego]
  int rtcType;

  /// 其他房间的外部流
  RoomRtcExtra? rtcExtra;

  /// 防沉迷
  bool antiAuction = false;

  /// 是否可以进行房间滑动
  bool canScroll = false;

  /// 歌友会id
  final int singerClubId;

  bool get isSceneType {
    return type == 'scene' && types == RoomTypes.Auto;
  }

  /// 是否是laya游戏斗地主
  bool get isLandlord {
    return originalRFT == 'landlord';
  }

  /// 是否私密房
  bool get isPrivateRoom => state == 1;

  /// 展示房主位
  bool get showOwnerSeat => nine == false;

  /// 房间背景
  RoomBackGroundInfo get roomBackground {
    if (ChatRoomData.getInstance()?.isKtvRoom == true &&
        ktvInfo?.currentSong?.isIdle() == false &&
        ktvInfo?.song?.songMV?.isNotEmpty == true) {
      // ktv房间开始演唱时，并且有mv背景时优先播放mv
      return RoomBackGroundInfo(type: RoomBackGroundType.mp4, url: Util.getRemoteImgUrl(ktvInfo!.song!.songMV), needSilent: true);
    }

    if (isSceneType && configExpendData != null && configExpendData is CpSceneModel) {
      CpSceneModel model = configExpendData as CpSceneModel;
      if (model.sceneImage.isNotEmpty) {
        Log.d('RoomBackGroundInfo url = ${System.imageDomain + model.sceneImage}');
        return RoomBackGroundInfo(type: RoomBackGroundType.jpg, url: System.imageDomain + model.sceneImage);
      }
    }
    Log.d('RoomBackGroundInfo url = ${backgroundInfo.url}');
    return backgroundInfo;
  }

  /// 活动搞怪头像框
  String? getGamesTrickPunishImg(int? uid) {
    String? img;
    if (uid != null && uid > 0) {
      if (gamesTrick != null && gamesTrick!.isNotEmpty) {
        int index = gamesTrick!.indexWhere((element) {
          return element.uid == uid;
        });
        if (index >= 0) {
          GamesTrickItem gamesTrickItem = gamesTrick![index];
          img = gamesTrickItem.header;
        }
      }
    }
    return img;
  }

  //如果是游戏房,按不同的游戏,解析成不同的格式
  static Object? getConfigExpendData(Map? data) {
    if (data != null) {
      Games game = getGame(data.containsKey('game') ? data['game'] : '');
      //你画我猜config扩展数据
      if (Games.Guess == game) {
        IDrawGuessManager? drawGuessManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
        if (drawGuessManager != null) {
          return drawGuessManager.getGuessConfigData(data);
        } else {
          Fluttertoast.showToast(msg: '你画我猜模块未引入，请检查！');
        }
      }

      //狼人config扩展数据
      if (Games.Wolf == game) {
        IWereWolfManager? wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
        if (wereWolfManager != null) {
          return wereWolfManager.getWolfConfigData(data);
        } else {
          Fluttertoast.showToast(msg: '狼人模块未引入，请检查！');
        }
      }

      if (data.containsKey('cplink_info')) {
        return CpLinkConfigData.fromJson(data['cplink_info']);
      }

      if (data.containsKey('cp_scene_info')) {
        return CpSceneModel.fromJson(data['cp_scene_info']);
      }

      // 1+1陪伴房
      if (data.containsKey('accompany')) {
        return AccompanyData.fromJson(data['accompany']);
      }

      // 付费陪伴房
      if (data.containsKey('payvoice')) {
        return AccompanyPayData.fromJson(data['payvoice']);
      }
    }
    return null;
  }

  RoomConfig.fromJson(Map data)
      : uid = Util.parseInt(data['uid']),
        rid = data.containsKey('rid') ? Util.parseInt(data['rid']) : Util.parseInt(data['uid']),
        name = data['name'] ?? '',
        icon = data['icon'] ?? '',
        type = data['type'] ?? '',
        typeName = data['type_label'] ?? '',
        typeColors = Util.parseColors(data['type_bg']),
        hasLock = Util.parseInt(data['has_lock']),
        state = Util.parseInt(data['state']),
        property = getProperty(data['property'].toString()),
        types = getTypes(data['types'].toString(), Util.parseInt(data['auction'])),
        factoryType = getFactoryType(data['room_factory_type'].toString()),
        originFactory = (data['room_factory_type'] ?? '').toString(),
        originalRFT = data['room_factory_type'] ?? '',
        moduleType = getModuleType(data['room_module_type']?.toString() ?? ''),
        game = getGame(data.containsKey('game') ? data['game'] : ''),
        cpState = getCpLoveState(
            getFactoryType(data['room_factory_type'].toString()), data.containsKey('cp_state') ? data['cp_state'].toString() : ''),
        description = Util.parseInt(data['description']) > 0,
        descriptionText = data['description_text'] ?? '',
        //backgroundUrl = data['background_url'],
        cplinkBackground = Util.parseStr(data['room_background_new_cplink']),
        //backgroundMP4 = data.containsKey('background_mp4') ? data['background_mp4'] : '',
        oDuration = Util.parseInt(data['o_duration']),
        roomHot = Util.parseInt(data['hot']),
        unityViewerNum = Util.parseInt(data['unity_viewer_num']),
        version = Util.parseInt(data['version']),
        counter = Util.parseInt(data['counter']),
        oTotal = Util.parseInt(data['o_total']),
        oNum = Util.parseInt(data['o_num']),
        displayMessage = Util.parseInt(data['display_message']) > 0,
        displayChat = Util.parseInt(data['display_chat']) > 0,
        displayRank = Util.parseInt(data['display_rank']) > 0,
        reception = Util.parseInt(data['reception']) > 0,
        _paier = Util.parseInt(data['paier']),
        package = Util.parseInt(data['package']),
        nine = Util.parseInt(data['nine']) > 0,
        mode = (data['mode'] ?? '').toString() == 'lock' ? RoomMode.Lock : RoomMode.Auto,
        cid = Util.parseInt(data['cid']),
        underData = UnderConfigData.fromJson(data),
        configExpendData = getConfigExpendData(data),
        liveDataV3 = LiveConfigV3.fromJson(data['live'], data['live_pk_v3']),
        ktvInfo = KtvInfo.fromJson(data['ktv_info']),
        level = Util.parseInt(data['level'], 0),
        roomTaskType = Util.parseStr(data['room_task_type']),
        receptionName = Util.parseStr(data['reception_name']),
        receptionTaskEnable = Util.parseBool(data['have_task']),
        gpkRoomPkData = data.containsKey('room_group_pk') ? GPKRoomPkData.fromJson(data["room_group_pk"]) : null,
        haveRoomCharm = Util.parseInt(data['have_room_charm']),
        inflexion = Util.parseInt(data['inflexion']),
        autoMic = Util.parseBool(data['auto_mic']),
        settlementChannel = data['settlement_channel'] ?? '',
        virtualOnlineNum = Util.parseInt(data['virtual_online_num']),
        rtcType = Util.parseInt(data['rtc_type'], 0),
        rtcExtra = (data['rtc_extra'] != null && data['rtc_extra'] is Map) ? RoomRtcExtra.fromJson(data['rtc_extra']) : null,
        knightKingIcon = Util.parseStr(data['knight_king_icon']),
        knightKingName = Util.parseStr(data['knight_king_name']),
        hasKingRank = Util.parseBool(data['has_king_rank']),
        closeHit = Util.parseBool(data['close_hit']),
        crazySummerOpen = Util.parseBool(data['crazy_summer_open']),
        liveChallenge = Util.parseStr(data['live_challenge']),
        guessQueueRoomConfigData = (data['guess_queue_data'] is Map)
            ? GuessQueueRoomConfigData.fromJson(Map<String, dynamic>.from(data['guess_queue_data']))
            : null,
        gamesTrick = Util.parseList(data['games_trick'], (e) => GamesTrickItem.fromJson(e as Map<String, dynamic>)),
        cpNamingUser = data.containsKey('cp_naming_info') ? UserBean.fromJson(data['cp_naming_info']) : null,
        antiAuction = Util.parseBool(data['anti_auction']),
        showExtraMic = Util.parseBool(data['extra_mic']),
        blessWords = Util.parseStr(data['bless_words']),
        layaUrl = Util.parseStr(data['laya'] is Map ? data['laya']['url'] : null),
        singerClubId = Util.parseInt(data['singer_club_id']),
        hideBackgroundSet = Util.isStringEmpty(Util.parseStr(data['background'])),
        backgroundInfo = _parseRoomBackground(data['background_extra'] ?? {}),
        subtitle = Util.parseStr(data['subtitle']) ?? '';
}

/// 虚拟麦位Pos
const int roomPositionVirtual = -101;

//麦上
class RoomPosition {
  GlobalKey? key;
  final int uid;
  final int position;
  final bool lock;
  final bool forbidden;
  final int counter;
  int package; //麦上打赏统计
  final String name;
  final int creditScore; //默认100分
  final String icon;
  final int role;
  String? _frame; //头像框
  final String? gameZone;
  final String? gameId;
  final bool cpDisplay;
  final int cpTarget;
  final Sex? sex;
  final int age;
  final int titleNew;
  int micStatus; //麦克风状态：1开麦/0闭麦
  final int vrid; // 车队id
  final int gameOnline; // 游戏玩家在线状态 1在线/0离线

  final Object? positionExpendData; //扩展的游戏数据
  final UnderPositionData? underData;
  final String? ring; // 用户麦上光圈
  final int inflexion; // 变声选项：0:重置（无变声）1:如花，2:香肠嘴，3:熊二，4:猪八戒
  final int knightLevel;
  final int liveOnly;
  final String? liveLabel; //粉丝牌名
  final bool guessQueueIsFinish; // 画猜接龙 是否画完或者猜完
  final int guessQueueLineId; // 画猜接龙 画的线的id
  final bool guessQueueWordChoosed; //是否选择过词
  final RoomPositionRole positionRole; // 麦位角色 - 0：普通；1：接待；2：老板；3：房主
  final String? positionLabel; // 麦位标签- 主播、接待、老板、普通
  final int positionState; // 麦位状态 - 二进制开关 1：离开
  final String? throneImg; // 麦上宝座图片
  final List<Color>? colorfulName; // 炫彩昵称
  final int godTag; // 特殊标签
  final int closeListen; //麦位用户能否听到声音，0能，1不能

  RadioDefendValue roomDefend = RadioDefendValue();

  /// 老板位 or 嘉宾位
  bool get isBoss => positionRole == RoomPositionRole.boss || positionRole == RoomPositionRole.guest;

  bool get isNormal => positionRole == RoomPositionRole.normal;

  bool get isReception => positionRole == RoomPositionRole.reception;

  bool get isCreator => positionRole == RoomPositionRole.creator;

  bool get isLinkMic => positionRole == RoomPositionRole.linkMic;

  resetKey() {
    key = GlobalKey();
  }

  /// 婚礼房用角色框替换用户对话框
  void setFrame(String frame) {
    _frame = frame;
  }

  /// 获取头像框地址
  String getFrameImg() {
    if (Session.lowDeviceSpecialEffect == 1) return '';
    return Util.getFullFramePath(_frame);
  }

  int get originId {
    int? uid = underData?.gameUnderOrigin;
    if (uid != null && uid > 0) {
      return uid;
    }

    if (positionExpendData != null) {
      IDrawGuessManager? drawGuessManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
      if (drawGuessManager != null) {
        uid = drawGuessManager.getOriginUid(positionExpendData);
        if (uid > 0) {
          return uid;
        }
      }

      IWereWolfManager? wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
      if (wereWolfManager != null) {
        uid = wereWolfManager.getOriginUid(positionExpendData);
        if (uid > 0) {
          return uid;
        }
      }
    }

    return 0;
  }

  int get uidOrOrigin {
    if (uid > 0) return uid;
    return originId;
  }

  bool get positionLeave {
    return (positionState == 1);
  }

  RoomPosition({
    this.key,
    required this.uid,
    this.position = 0,
    this.lock = false,
    this.forbidden = false,
    this.counter = 0,
    this.package = 0,
    this.creditScore = 100,
    this.name = '',
    this.icon = '',
    String frame = '',
    this.role = 0,
    this.gameId,
    this.gameZone,
    this.cpDisplay = false,
    this.cpTarget = 0,
    this.positionExpendData,
    this.underData,
    this.sex,
    this.age = 0,
    this.titleNew = 0,
    this.micStatus = 0,
    this.vrid = 0,
    this.ring,
    this.inflexion = 0,
    this.knightLevel = 0,
    this.liveOnly = 0,
    this.liveLabel,
    this.guessQueueIsFinish = false,
    this.guessQueueLineId = 0,
    this.guessQueueWordChoosed = false,
    this.gameOnline = 0,
    this.positionRole = RoomPositionRole.normal,
    this.positionState = 0,
    this.throneImg,
    this.positionLabel,
    this.colorfulName,
    this.godTag = 0,
    this.closeListen = 0,
  }) : _frame = frame;

  static String? parseFrame(Map data) {
    String? frameStr = Util.parseStr(data['frame_new']);
    if (frameStr != null && frameStr.isNotEmpty) {
      return frameStr;
    } else {
      frameStr = Util.parseStr(data['frame']);
      if (frameStr != null && frameStr.isNotEmpty) {
        return '$frameStr.png';
      } else {
        return null;
      }
    }
  }

  //获取头像框完整地址
  static String fullFramePath(String? frame) {
    if (frame == null || frame.isEmpty) {
      return '';
    }
    if (!frame.endsWith('.webp')) {
      frame = '$frame.png';
    }

    String frameImage = '${System.imageDomain}static/effect/$frame';
    return frameImage;
  }

  //获取聊天气泡完整地址
  static String fullChatMessageBackPath(String? path) {
    if (path == null) {
      return '';
    }
    return '${System.imageDomain}$path';
  }

  static Sex? parseSex(dynamic sexValue) {
    int value = Util.parseInt(sexValue);
    if (value == 1) {
      return Sex.Male;
    } else if (value == 2) {
      return Sex.Female;
    } else {
      return null;
    }
  }

  int get sexValue {
    if (sex != null) {
      if (sex == Sex.Male) {
        return 1;
      } else if (sex == Sex.Female) {
        return 2;
      }
    }
    return 0;
  }

  /// 麦位是否是神秘人
  bool get isMystery => role == 255;

  static Object? getPositionExpendData(Games? game, Map data, {RoomFactoryType? factoryType}) {
    //你画我猜position扩展数据
    if (game == Games.Guess || factoryType == RoomFactoryType.GuessQueue) {
      IDrawGuessManager? drawGuessManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
      if (drawGuessManager != null) {
        return drawGuessManager.getGuessPositionData(data);
      }
    }

    //狼人position扩展数据
    if (game == Games.Wolf) {
      IWereWolfManager? wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
      if (wereWolfManager != null) {
        return wereWolfManager.getWolfPositionData(data);
      }
    }
    return null;
  }

  RoomPosition.fromJson(Games? game, Map data, this.key, {RoomFactoryType? factoryType})
      : name = Util.notNullStr(data['name']),
        icon = Util.notNullStr(data['icon']),
        _frame = parseFrame(data),
        role = Util.parseInt(data['role']),
        uid = Util.parseInt(data['uid']),
        creditScore = Util.parseInt(data['credit_score']),
        position = Util.parseInt(data['position']),
        counter = Util.parseInt(data['counter']),
        package = Util.parseInt(data['package']),
        lock = Util.parseInt(data['lock']) > 0,
        forbidden = Util.parseInt(data['forbidden']) > 0,
        gameId = Util.parseStr(data['gameId']),
        gameZone = Util.parseStr(data['gameZone']),
        cpDisplay = Util.parseInt(data['cp_display'], 0) > 0,
        cpTarget = Util.parseInt(data['cp_target'], 0),
        sex = parseSex(data['sex']),
        positionExpendData = getPositionExpendData(game, data, factoryType: factoryType),
        underData = UnderPositionData.fromJson(data),
        age = Util.parseInt(data['age']),
        titleNew = Util.parseInt(data['title_new'], 0),
        micStatus = Util.parseInt(data['mic_status'], 0),
        vrid = Util.parseInt(data['vr_id']),
        gameOnline = Util.parseInt(data['game_online'], 1),
        ring = Util.parseStr(data['ring']),
        inflexion = Util.parseInt(data['inflexion']),
        knightLevel = Util.parseInt(data['knight_level']),
        liveOnly = Util.parseInt(data['live_only']),
        liveLabel = Util.parseStr(data['live_label']) ?? '',
        guessQueueIsFinish = Util.parseBool(data['guess_queue_is_finish']),
        guessQueueLineId = Util.parseInt(data['guess_queue_line_id']),
        guessQueueWordChoosed = Util.parseBool(data['guess_queue_word_choosed']),
        positionRole = _parsePositionRole(Util.parseInt(data['position_role'])),
        positionState = Util.parseInt(data['position_state']),
        positionLabel = Util.parseStr(data['position_label']),
        throneImg = Util.parseStr(data['throne_img']),
        colorfulName = Util.parseColorJson(data['color_name']),
        godTag = Util.parseInt(data['god_tag']),
        closeListen = Util.parseInt(data['close_listen']);

  RoomPosition.fromCreator(RoomCreator data, {this.position = -1})
      : name = data.name,
        uid = data.uid,
        icon = data.icon,
        role = data.role,
        sex = data.sex,
        lock = false,
        forbidden = false,
        creditScore = 100,
        counter = 0,
        package = data.package,
        _frame = '',
        gameId = data.gameId,
        gameZone = data.gameZone,
        cpDisplay = false,
        cpTarget = 0,
        positionExpendData = null,
        underData = null,
        age = data.age,
        titleNew = data.titleNew,
        micStatus = 1,
        vrid = 0,
        gameOnline = 1,
        ring = '',
        inflexion = 0,
        knightLevel = 0,
        liveOnly = 0,
        liveLabel = '',
        key = ChatRoomData.getInstance()?.createorKey,
        guessQueueIsFinish = false,
        guessQueueLineId = 0,
        guessQueueWordChoosed = false,
        positionRole = RoomPositionRole.normal,
        positionLabel = '',
        positionState = 0,
        throneImg = '',
        colorfulName = [],
        godTag = 0,
        closeListen = 0;
}

class RoomCreator {
  final int uid;
  final String name;
  final String icon;
  final int role;
  final String? gameId;
  final String? gameZone;
  final Sex? sex;
  final int age;
  final int titleNew;
  final int package;

  RoomCreator.fromJson(Map data)
      : name = data['name'] ?? '',
        icon = data['icon'] ?? '',
        role = Util.parseInt(data['role']),
        uid = Util.parseInt(data['uid']),
        gameId = Util.parseStr(data['gameId']),
        gameZone = Util.parseStr(data['gameZone']),
        sex = RoomPosition.parseSex(data['sex']),
        age = Util.parseInt(data['age']),
        titleNew = Util.parseInt(data['title_new'], 0),
        package = Util.parseInt(data['package'], 0);
}

//Message类型有user 头像对应字段为portraitUri Package类型没有user 自己在extra拼凑user头像对应字段为icon 图片消息GiftMedia有user user头像对应字段为icon
class MessageUser {
  final String name;
  final String icon;
  final int uid;
  final String? toName;
  final int popularityLevel;
  final String frame; //头像框
  final String background; //聊天背景
  final String messageColor; //消息字体颜色
  final int sex;
  final List<Color> colorfulName;

  MessageUser.fromJson(Map data)
      : uid = Util.parseInt(data['id']),
        name = Util.parseStr(data['name']) ?? '',
        icon = Util.parseStr(data['icon']) ?? data['portraitUri'].toString(),
        frame = Util.parseStr(data['frame']) ?? '',
        background = Util.parseStr(data['background_new']) ?? '',
        popularityLevel = Util.parseInt(data['popularity_level']),
        toName = Util.parseStr(data['to']) ?? '',
        messageColor = Util.parseStr(data['bubble_front_color']) ?? '',
        sex = Util.parseInt(data['sex']),
        colorfulName = Util.parseColorJson(data['color_name']);

  String get headFrame {
    return RoomPosition.fullFramePath(frame);
  }

  @override
  String toString() {
    return 'MessageUser{name: $name, icon: $icon, uid: $uid, toName: $toName, popularityLevel: $popularityLevel, frame: $frame, background: $background, messageColor: $messageColor, sex: $sex, colorfulName= $colorfulName}';
  }
}

class MessageContent {
  final MessageType type;
  final String? message;
  final int messageId;
  final Map? extra;
  final MessageUser? user;
  final Map? mounts;
  final List? list;
  Object? expData;
  List<CommonTagData> commonTags = [];

  Map<String, dynamic> localRamCache = {};

  String? get op => extra != null ? extra!['op'] : null;

  Map? get data => extra != null ? extra!['data'] : null;

  static MessageType getTypes(Map? data) {
    if (data != null && data.containsKey('type')) {
      String current = '${'MessageType'.toLowerCase()}.${data['type'].toString().toLowerCase()}';
      try {
        if (data['type'].toString().toLowerCase() == 'local') {
          if (data['sub_type'] == 'image') return MessageType.GiftMedia;
          if (data['sub_type'] == 'room_package') return MessageType.RedPackage;
          if (data['sub_type'] == 'Package') return MessageType.Package;
        } else if (data['type'] == 'vehicle_team') {
          return MessageType.VehicleTeam;
        } else if (data['type'] == 'vehicle_fee_team') {
          return MessageType.VehicleFeeTeam;
        } else if (data['type'] == 'deco_present') {
          return MessageType.SendDecorate;
        } else if (data['type'] == 'PluginDiceShow') {
          return MessageType.DiceShow;
        }
        return MessageType.values.firstWhere((MessageType type) {
          return type.toString().toLowerCase() == current;
        });
      } catch (e) {
        Log.d("getTypes error ");
        Log.d(data);
        Log.d(e);
        return MessageType.Unknown;
      }
    }
    return MessageType.Message;
  }

  static String getTextTypes(MessageType type) {
    if (type == MessageType.Local) {
      return "local";
    } else if (type == MessageType.GiftMedia) {
      return "image";
    } else if (type == MessageType.RedPackage) {
      return "room_package";
    } else if (type == MessageType.Package) {
      return "Package";
    } else if (type == MessageType.VehicleTeam) {
      return "vehicle_team";
    } else if (type == MessageType.VehicleFeeTeam) {
      return "vehicle_fee_team";
    } else if (type == MessageType.SendDecorate) {
      return "deco_present";
    } else if (type == MessageType.DiceShow) {
      return "PluginDiceShow";
    } else if (type == MessageType.Message) {
      return "text";
    } else {
      return type.toString().toLowerCase();
    }
  }

  MessageContent._(this.type, this.message, this.messageId, this.extra, this.user, this.mounts, this.list);

  MessageContent copyWith({
    MessageType? type,
    String? message,
    int? messageId,
    Map? extra,
    MessageUser? user,
    Map? mounts,
    List? list,
  }) {
    return MessageContent._(
      type ?? this.type,
      message ?? this.message,
      messageId ?? this.messageId,
      extra ?? this.extra,
      user ?? this.user,
      mounts ?? this.mounts,
      list ?? this.list,
    );
  }

  MessageContent.from(String? message, Map? extra, Map? user, int? messageId, {Map? mounts, List? list, MessageType? type})
      : messageId = (messageId == null || messageId == 0) ? DateTime.now().microsecondsSinceEpoch : messageId,
        message = message,
        extra = extra,
        mounts = mounts,
        list = list,
        user = user == null
            ? MessageUser.fromJson({
                'name': Util.parseStr(extra?['from']) ?? '',
                'id': Util.parseInt(extra?['uid']),
                'portraitUri': Util.parseStr(extra?['icon']) ?? '',
                'to': Util.parseStr(extra?['to']) ?? '',
                'frame': Util.parseStr(extra?['frame']) ?? '',
                'background_new': extra?['background_new'],
                'popularity_level': extra?['popularity_level'],
                'bubble_front_color': extra?['bubble_front_color'],
                'sex': extra?['sex'],
              })
            : MessageUser.fromJson(user),
        type = type ?? getTypes(extra);

  Future<void> checkCommonTagData() async {
    List<String>? roomTags;

    /// 房间通用标签List
    if (extra != null && extra!['room_tags'] != null) {
      roomTags = Util.parseList(extra!['room_tags'], (e) => Util.parseStr(e) ?? '');
    }

    if (roomTags != null && roomTags.isNotEmpty) {
      for (int i = 0; i < roomTags.length; i++) {
        String tagString = roomTags[i];
        if (!Util.validStr(tagString)) {
          continue;
        }
        List<String> data = tagString.split(',');
        if (data.isEmpty) {
          continue;
        }

        int tagId = Util.parseInt(data[0], 0);
        if (tagId == 0) {
          continue;
        }
        String label = data.length > 1 ? data[1] : '';
        CommonTagData? tagData = await RoomTagDataUtil.getCommonTagData(tagId, label);
        if (tagData != null) {
          commonTags.add(tagData);
        }
      }
    }
  }

  bool hasFansLabel() {
    return extra?['fans_label'] != null && extra?['fans_label']['label'] != null && extra!['fans_label']['label'].toString().isNotEmpty;
  }

  ///  直播房鼓掌/小连击礼物-连击消息
  bool isComboGiftHitMessage() {
    return type == MessageType.Package && extra != null && extra!['sub_type'] == 'hit' && extra!['gift'] != null;
  }

  bool isComboGift() {
    return isComboGiftHitMessage() || type == MessageType.Hit;
  }

  ///小礼物连击过程中不需要播放礼物动画 连击结束播放  大礼物相反
  bool needShowAnimation() {
    bool showAnimation = Util.parseBool(extra?['show_animation']);
    if (isComboGift() || type == MessageType.Package) {
      return showAnimation;
    }
    return false;
  }

  ///连击结束消息
  bool isComboEndMessage() {
    return type == MessageType.Package &&
        extra != null &&
        extra!['sub_type'] == 'Package' &&
        extra!['type'] == 'Local' &&
        extra!['gift'] != null;
  }

  @override
  String toString() {
    return 'MessageContent{type: $type, message: $message, messageId: $messageId, extra: $extra, user: $user, mounts: $mounts, list: $list, expData: $expData}';
  }
}

const IconStyles = {
  UserIconStyle.Normal: Size(60.0, 60.0),
  UserIconStyle.Middle: Size(66.0, 66.0),
  UserIconStyle.Big: Size(66.0, 66.0),
  UserIconStyle.Small: Size(44.0, 44.0),
  UserIconStyle.Wolf: Size(48.0, 48.0),
  UserIconStyle.Live: Size(44.0, 44.0),
  UserIconStyle.Captain: Size(50, 50),
  UserIconStyle.VehicleMember: Size(40, 40),
  UserIconStyle.OffMic: Size(32, 32),
  UserIconStyle.TourGroup: Size(32, 32),
  UserIconStyle.GroupPK: Size(48, 48),
  UserIconStyle.PubHomeDJ: Size(90, 90),
  UserIconStyle.GuessQueue: Size(52, 52),
  UserIconStyle.Encounter: Size(80, 80),
};

class IconSize {
  static const double normal = 60.0;
  static const double middle = 66.0;
  static const double big = 66.0;
  static const double small = 44.0;
  static const double wolf = 48.0;
  static const double live = 44.0;
  static const double captain = 50;
  static const double vehicleMember = 44;
  static const double offMic = 32;
  static const double tourGroup = 32;
  static const double groupPK = 48;
  static const double moviePrivate = 56;
  static const double moviePublic = 32;
  static const double pubHomeDJ = 90;
  static const double guessQueue = 52;
  static const double encounter = 80;
  static const double micLink = 86;
}

class GiftHeaderInfo {
  int uid;
  String icon;

  GiftHeaderInfo.fromJson(Map json)
      : uid = Util.parseInt(json['uid']),
        icon = json['icon'] ?? '';
}

class GiftHeader {
  GiftHeaderInfo? from;
  GiftHeaderInfo? to;
  int start;
  int end;

  GiftHeader.fromJson(Map json)
      : from = GiftHeaderInfo.fromJson(json['from']),
        to = GiftHeaderInfo.fromJson(json['to']),
        start = Util.parseInt(json['start']),
        end = Util.parseInt(json['end']);
}

/// 烟花礼物资源
class GiftFireworks {
  final String url;
  final int size;
  final String type;
  final int width;
  final int height;
  final int num;

  GiftFireworks(this.url, this.size, this.type, this.width, this.height, this.num);

  static GiftFireworks fromJson(Map json) {
    return GiftFireworks(Util.parseStr(json['url']) ?? '', Util.parseInt(json['size']), Util.parseStr(json['type']) ?? '',
        Util.parseInt(json['width']), Util.parseInt(json['height']), Util.parseInt(json['num']));
  }

  static List<GiftFireworks>? parse(dynamic json) {
    Log.d('GiftFireworks parse json=$json');
    try {
      if (json == null) return null;
      return Util.parseList(
        json,
        (e) {
          return GiftFireworks.fromJson(e);
        },
      );
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    return null;
  }
}

class DisplayGiftConfig {
  final GlobalKey? key;
  final String uuid;
  final int giftId;
  final int count;
  final int uid;
  final int size;
  final bool withEnd;
  final DisplayGiftType? type;
  final List<int>? uids;
  final Map? giftNumMap; // 赠送箱子给多人时，每个礼物开出的数量不一致，{toUid: giftNum}
  final int dateline;
  final double displayNormalGiftRatio;
  final int worthy;
  final int vapSize;
  final GiftHeader? header;
  final bool magic; //魔法礼物
  final int magicSize;
  final bool isMountGift; //是否是坐骑礼物
  final bool showStartEnd;
  final List<String>? vapImgs; // vap融合图片列表
  final List<String>? vapTexts; // vap融合文字列表
  final String? effectUrl; // 兼容非礼物，直接显示动画特效URL
  final int diyColor; // 自定义礼物颜色
  final int diySignDirection; //自定义礼物文字方向 1横 2竖
  final int unityAndroidSize; // 安卓礼物资源大小
  final int unityIosSize; // ios礼物资源大小
  final int unityRocketVersion; // 火箭版本控制，当前版本只能播放小于等于当前支持的火箭版本礼物
  final double riveValue;

  final List<GiftFireworks>? fireworksList; // 烟花礼物资源

  /// Rive礼物播放的状态值，比如：石头剪刀布，用【1-3】表示不同的结果
  final String? voiceUrl;
  final bool isHandbook; // 礼物图鉴礼物
  final int starLevel; // 礼物图鉴礼物等级
  final bool isUseAwake; // 礼物图鉴礼物是否觉醒
  final bool isCanAwake; // 礼物图鉴礼物是否可觉醒
  final String giftName; // 礼物名称

  final ScreenMessage_ScreenMessageRoomBirthdayGift? birthdayGift; //生日礼物对话框数据

  final List<Offset>? graffitiGiftPoints; // 涂鸦礼物点位

  static String testVoice() {
    List<String> data = [
      'https://xs-image-proxy.yinjietd.com/voice/202205/22050423291539.mp3',
      'https://xs-image-proxy.yinjietd.com/voice/202205/22050423294143.mp3',
      'https://xs-image-proxy.yinjietd.com/voice/202203/22032911380546.mp3',
      'https://xs-image-proxy.yinjietd.com/voice/202203/22032911252046.mp3',
      'https://xs-image-proxy.yinjietd.com/voice/202203/22032911272741.m4a',
      'https://xs-image-proxy.yinjietd.com/voice/202203/22032911301459.mp3',
      'https://xs-image-proxy.yinjietd.com/voice/202203/22032911241746.m4a',
    ];

    int index = Random().nextInt(data.length);
    return data[index];
  }

  DisplayGiftConfig({
    this.key,
    this.uuid = '',
    this.uid = 0,
    this.uids,
    this.giftId = 0,
    this.type,
    this.size = 0,
    this.withEnd = false,
    this.count = 1,
    this.giftNumMap,
    this.dateline = 0,
    this.displayNormalGiftRatio = 0.5,
    this.worthy = 0,
    this.vapSize = 0,
    this.header,
    this.magic = false,
    this.magicSize = 0,
    this.isMountGift = false,
    this.showStartEnd = false,
    this.vapImgs,
    this.vapTexts,
    this.effectUrl,
    this.diyColor = -1,
    this.unityAndroidSize = 0,
    this.unityIosSize = 0,
    this.diySignDirection = 2,
    this.unityRocketVersion = 0,
    this.riveValue = 0,
    this.voiceUrl,
    this.isHandbook = false,
    this.starLevel = 1,
    this.isUseAwake = false,
    this.isCanAwake = false,
    this.giftName = "",
    this.birthdayGift,
    this.fireworksList,
    this.graffitiGiftPoints,
  });

  bool get isWebp => type == DisplayGiftType.Webp;

  bool get isVap => type == DisplayGiftType.Vap;

  bool get isRive => type == DisplayGiftType.Rive;

  bool get withHeader => isVap && header != null;

  bool get showAnimation => (!isMountGift && showStartEnd);

  bool get isLottie => false; //lottie动画

  bool get isFireworks => fireworksList != null && fireworksList!.isNotEmpty; // 烟花礼物

  bool get isBirthdayGiftAnim => birthdayGift?.to.isNotEmpty == true; // 生日礼物动效

  bool get isGraffitiGiftAnim => graffitiGiftPoints?.isNotEmpty ?? false;

  int get giftSize {
    int giftSize;
    if (isVap) {
      giftSize = vapSize;
    } else {
      giftSize = size;
    }
    return giftSize;
  }

  @override
  String toString() {
    return 'uuid=$uuid, giftId=$giftId, effectUrl=$effectUrl, type=${type?.name}';
  }
}

typedef GiftPlayCompleteCallback = Function(DisplayGiftConfig config);
typedef GiftGetPositionByUid = PositionOffset Function(int uid);

class PositionOffset {
  final Offset offset;
  final UserIconStyle style;
  final Size? size;
  final bool inPosition;

  const PositionOffset(this.offset, [this.style = UserIconStyle.Normal, this.size, this.inPosition = true]);
}

int getVipColor(int vip, [bool isChatRoom = true]) {
  return Utility.getVipColor(vip, isChatRoom);
}

int getLevelColor(int level, [bool isChatRoom = true]) {
  // 活跃等级按照vip等级颜色显示
  return Utility.getVipColor(level, isChatRoom);
}

typedef IconTapCallback = Function(RoomPosition position, String op, [dynamic extra]);

/// 房间ktv 信息
class KtvInfo {
  int propShowTime = 0; // 进房多久展示氛围工具
  int propUseTime = 0; // 氛围工具可点击时间间隔
  int listCount = 0; // 已点歌曲数量

  KtvCurrentSong? currentSong;
  List<KtvOffMic> offMicList = [];
  List<int> songList = [];
  KtvChorusUser? chorus;
  Song? song;

  /// zego酷狗音速达音乐需要初始化pid
  String? pid;

  /// zego酷狗音速达 需要初始化appKey
  String? appKey;

  KtvInfo.fromJson(Map? json) {
    if (json == null) {
      return;
    }

    propShowTime = Util.parseInt(json['prop_show_time']);
    propUseTime = Util.parseInt(json['prop_use_time']);
    listCount = Util.parseInt(json['list_count']);
    currentSong = KtvCurrentSong.fromJson(json['current_song']);
    if (json['chorus_user'] != null && json['chorus_user'] is Map) {
      chorus = KtvChorusUser.fromJson(json['chorus_user']);
    }
    if (json['song_detail'] != null && json['song_detail'] is Map) {
      song = Song.fromJson(json['song_detail']);
    }

    pid = Util.parseStr(json['pid']);
    appKey = Util.parseStr(json['appkey']);

    List offMics = json['offMicList'] ?? [];
    for (var element in offMics) {
      KtvOffMic offMic = KtvOffMic.fromJson(element);
      offMicList.add(offMic);
    }

    List songs = json['song_list'] ?? [];
    for (var element in songs) {
      int id = Util.parseInt(element);
      songList.add(id);
    }
    Log.d('KtvInfo.fromJson currentSong = $currentSong');
  }
}

/// ktv 麦下用户
class KtvOffMic {
  final int uid;
  final String name;
  final String icon;
  final String frame;

  KtvOffMic.fromJson(Map json)
      : uid = Util.parseInt(json['uid']),
        name = json['name'] ?? '',
        icon = json['icon'] ?? '',
        frame = json['frame'] ?? '';
}

/// ktv 合唱用户信息
class KtvChorusUser {
  final int uid;
  final String name;
  final String icon;
  final int weekMusicalNotes;
  final String rtcStreamID;

  KtvChorusUser.fromJson(Map json)
      : uid = Util.parseInt(json['uid']),
        name = json['name'] ?? '',
        icon = json['icon'] ?? '',
        weekMusicalNotes = Util.parseInt(json['week_musical_notes']),
        rtcStreamID = json['rtc_stream_id'] ?? '';
}

/// 当前正在演唱的音乐
class KtvCurrentSong {
  final int uid;
  final String name;
  final int sid;
  final String sname;
  final String uploaderName;
  final KtvSingStatus status;
  final int startTime;
  final List<int> songs;
  final String icon;
  final String brc;
  final String singerName;
  final int brcProgress;
  final SoundType soundType;
  final int playTime;
  final int countDown;
  final String platform;
  final int platformSongId;
  final int platformRankId;
  final bool needReport;

  /// 歌手演唱这首歌本周内收到的打赏
  final int weekMusicalNotes;

  /// 合唱模式，主唱麦克风StreamID（Zego合唱方案需要）
  final String rtcStreamID;

  /// 主唱是否开始合唱开关
  final int chorusSwitch;

  /// AME需要字符串型musicId
  final String musicId;

  KtvCurrentSong.fromJson(Map json)
      : uid = Util.parseInt(json['uid']),
        name = json['name'] ?? '',
        sid = Util.parseInt(json['sid']),
        sname = json['sname'] ?? '',
        uploaderName = json['uploader_name'] ?? '',
        status = _getStatus(json['status']),
        startTime = Util.parseInt(json['start_time']),
        songs = Util.parseList(json['song_list'], (e) => Util.parseInt(e)),
        icon = json['icon'] ?? '',
        brc = Song.parseSongUrl(json['brc'] ?? ''),
        singerName = json['singer_name'] ?? '',
        brcProgress = Util.parseInt(json['brc_progress']),
        soundType = Util.parseInt(json['back_track']) == 0 ? SoundType.voice : SoundType.accompany,
        playTime = Util.parseInt(json['play_time']),
        countDown = Util.parseInt(json['count_down']),
        platform = json['platform'] ?? '',
        platformSongId = Util.parseInt(json['platform_song_id']),
        platformRankId = Util.parseInt(json['platform_rank_id']),
        needReport = Util.parseBool(json['need_report']),
        rtcStreamID = json['rtc_stream_id'] ?? '',
        weekMusicalNotes = Util.parseInt(json['week_musical_notes']),
        chorusSwitch = Util.parseInt(json['chorus_switch']),
        musicId = Util.parseStr(json['music_id']) ?? '';

  static KtvSingStatus _getStatus(String? statusStr) {
    KtvSingStatus status = KtvSingStatus.wait;
    switch (statusStr) {
      case 'wait':
        status = KtvSingStatus.wait;
        break;
      case 'start':
        status = KtvSingStatus.start;
        break;
      case 'sing':
        status = KtvSingStatus.sing;
        break;
      case 'pause':
        status = KtvSingStatus.pause;
        break;
      default:
        break;
    }
    return status;
  }

  bool isCountDown() {
    return status == KtvSingStatus.start && countDown > 0;
  }

  bool isIdle() {
    return status == KtvSingStatus.wait;
  }

  @override
  String toString() {
    return 'status=$status, sid=$sid, sname=$sname, brcProgress=$brcProgress, uid=$uid, name=$name, soundType=$soundType, icon=$icon， music_id=$musicId';
  }

  int get pid {
    if (platform == SongPlatform.KUGOU) {
      return platformSongId;
    }
    return sid;
  }
}

enum KtvSingStatus {
  wait,
  start,
  sing,
  pause,
}

///活动搞怪头像框，惩罚的头像部分
class GamesTrickItem {
  final int uid;
  final String header;

  GamesTrickItem.fromJson(Map json)
      : uid = Util.parseInt(json['uid']),
        header = '${json['header']}';
}

/// 电台首位升级贡献值
class RadioDefendValue {
  int uid;
  double score;
  int level;
  double nextLevelScore;
  bool showNext;

  RadioDefendValue({this.uid = 0, this.score = 0, this.level = 1, this.nextLevelScore = 0, this.showNext = false});

  void fromJson(Map json) {
    uid = Util.parseInt(json['uid']);
    score = Util.parseDouble(json["score"]);
    level = Util.parseInt(json["level"]);
    nextLevelScore = Util.parseDouble(json["next_level_score"]);
    showNext = Util.parseBool(json["show_next"]);
  }

  @override
  String toString() {
    return 'RadioDefendValue{uid: $uid, score: $score, level: $level, nextLevelScore: $nextLevelScore, showNext: $showNext}';
  }
}
