import 'package:chat_room/chat_room.dart';

extension ChatRoomDataTypeExt on ChatRoomData {
  // 判断是否为K歌房
  bool get isKtvRoom => config?.type == 'ktv';

  // 判断是否为K歌合唱房
  bool get isKtvChorusRoom => false;

  bool get isJuben => RoomProperty.Game == config?.property && 'juben' == config?.type;

  // 判断是否为听歌房
  bool get isMusicRoom => ChatRoomUtil.isMusicRoom(config);

  // 判断是否为直播房
  bool get isLiveRoom => config?.types == RoomTypes.Live;

  bool get isCpLink => config?.types == RoomTypes.CpLink;

  bool get isBusinessAuction => config?.types == RoomTypes.Auction;

  bool get isBusinessRadio => config?.factoryType == RoomFactoryType.BusinessRadio;

  bool get isGuessQueue => config?.factoryType == RoomFactoryType.GuessQueue;

  bool get isBusiness => config?.property == RoomProperty.Business;

  bool get isPrivate => config?.property == RoomProperty.Vip;

  /// 是否可以PK,目前支持房间类型：直播/电台
  bool get canPk => config?.types == RoomTypes.Live || config?.factoryType == RoomFactoryType.BusinessRadio;

  /// 心动速配
  bool get isBusinessHeart => config?.factoryType == RoomFactoryType.BusinessHeart;

  /// 扩列
  bool get isBusinessExpand => config?.factoryType == RoomFactoryType.BusinessExpand;

  bool get isBusinessCpLove => isBusinessHeart || isBusinessExpand;

  /// 生日房
  bool get isBusinessBirthday => config?.factoryType == RoomFactoryType.BusinessBirthday;

  /// 五麦商业房
  bool get isBusinessNormal5 => config?.factoryType == RoomFactoryType.BusinessNormal5;

  /// 心跳竞速
  bool get isHeartRace => config?.factoryType == RoomFactoryType.BusinessHeartrace;

  /// 派单厅
  bool get isSenderRoom => config?.factoryType == RoomFactoryType.BusinessBill;

  /// 心动连连看V2  ps: 为了兼容 此新房间 isCpLink 也是 true；
  bool get isCpLinkV2 => config?.factoryType == RoomFactoryType.CpLinkV2;

  /// 商业房婚礼
  bool get isBusinessWedding => config?.factoryType == RoomFactoryType.BusinessWedding;

  /// 大哥房
  bool get isMyHouseRoom => config?.factoryType == RoomFactoryType.brother;

  /// 麦位连线
  bool get isMicLink => config?.factoryType == RoomFactoryType.businessConnectorBar;

  /// 约会吧
  bool get isDating => config?.factoryType == RoomFactoryType.dating;

  /// 点唱厅
  bool get isBusinessMusic => config?.factoryType == RoomFactoryType.BusinessMusic;
}
