import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'wedding_bean.g.dart';

@JsonSerializable(createToJson: false)
class WeddingInvitationResp extends BaseResponse {
  WeddingInvitationData? data;

  WeddingInvitationResp({bool success = false, String msg = '', this.data})
      : super(success: success, msg: msg);

  factory WeddingInvitationResp.fromJson(Map<String, dynamic> json) =>
      _$WeddingInvitationRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class WeddingInvitationData {
  int wid;

  /// 新郎
  UserItem? groom;

  /// 新娘
  UserItem? bride;

  @JsonKey(name: 'card_content')
  String cardContent;

  @JsonKey(name: 'card_bg_pic')
  String cardBgPic;

  @JsonKey(name: 'card_num')
  int cardNum;

  @JsonKey(name: 'wedding_host')
  HostInfo? hostInfo;

  @JsonKey(name: 'wedding_accompany')
  AccompanyInfo? accompanyInfo;

  @JsonKey(name: 'wedding_guest')
  GuestInfo? guestInfo;

  @JsonKey(name: 'wedding_time')
  int weddingTime;

  @JsonKey(name: 'only_inviter')
  bool onlyInvited;

  @JsonKey(name: 'card_type_id')
  int cardTypeId;

  @JsonKey(name: 'card_style_pic')
  String cardStylePic;

  @JsonKey(name: 'can_share_wedding', fromJson: Util.parseBool)
  bool canShareWedding;

  @JsonKey(name: 'wedding_stage')
  int state; // 婚礼阶段状态，0：未预约 1：未开始，2：进行中，3：已结束

  int rid; // 婚礼进行中，才有room_id

  @JsonKey(name: 'time_before_wedding')
  int starTimeGap; // 距离婚礼开始时间（单位秒）

  static const STATE_NOT_APPOINT = 0; // 未预约

  static const STATE_NOT_START = 1; //未开始

  static const STATE_DOING = 2; // 进行中

  static const STATE_OVER = 3; // 已结束

  WeddingInvitationData(
      this.wid,
      this.groom,
      this.bride,
      this.cardContent,
      this.cardBgPic,
      this.cardNum,
      this.hostInfo,
      this.accompanyInfo,
      this.guestInfo,
      this.weddingTime,
      this.onlyInvited,
      this.cardTypeId,
      this.cardStylePic,
      this.state,
      this.rid,
      this.starTimeGap,
      this.canShareWedding); // 已结束
  factory WeddingInvitationData.fromJson(Map<String, dynamic> json) =>
      _$WeddingInvitationDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserItem {
  int uid;
  String image;

  UserItem(this.uid, this.image);

  factory UserItem.fromJson(Map<String, dynamic> json) =>
      _$UserItemFromJson(json);
}

/// 主持人
@JsonSerializable(createToJson: false)
class HostInfo {
  @JsonKey(name: 'max_num')
  int maxCount;

  List<UserItem> list;

  HostInfo(this.maxCount, this.list);

  factory HostInfo.fromJson(Map<String, dynamic> json) =>
      _$HostInfoFromJson(json);
}

/// 伴郎伴娘
@JsonSerializable(createToJson: false)
class AccompanyInfo {
  @JsonKey(name: 'max_num')
  int maxCount;

  List<UserItem> list;

  AccompanyInfo(this.maxCount, this.list);

  factory AccompanyInfo.fromJson(Map<String, dynamic> json) =>
      _$AccompanyInfoFromJson(json);
}

/// 嘉宾信息
@JsonSerializable(createToJson: false)
class GuestInfo {
  List<UserItem> list;

  GuestInfo(this.list);

  factory GuestInfo.fromJson(Map<String, dynamic> json) =>
      _$GuestInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class InviteFriendsResp extends BaseResponse {
  FriendsList? data;

  InviteFriendsResp({bool success = false, String msg = '', this.data})
      : super(success: success, msg: msg);

  factory InviteFriendsResp.fromJson(Map<String, dynamic> json) =>
      _$InviteFriendsRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class FriendsList {
  List<FriendItem> list;

  FriendsList(this.list);

  factory FriendsList.fromJson(Map<String, dynamic> json) =>
      _$FriendsListFromJson(json);
}

@JsonSerializable(createToJson: false)
class FriendItem {
  int uid;
  String icon;
  String name;
  int type; //已被邀请的身份，类型，0：未邀请，10：司仪，20：伴郎，21：伴娘，30：嘉宾

  static const ROLE_NONE = 0; // 未邀请
  static const ROLE_HOST = 10; // 主持人
  static const ROLE_ACCOMPANY_HE = 20; // 伴郎
  static const ROLE_ACCOMPANY_SHE = 21; // 伴娘
  static const ROLE_GUEST = 30; // 嘉宾

  FriendItem(this.uid, this.icon, this.name, this.type);

  factory FriendItem.fromJson(Map<String, dynamic> json) =>
      _$FriendItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class WeddingAlbumResp extends BaseResponse {
  WeddingAlbumData? data;

  WeddingAlbumResp({bool success = false, String msg = '', this.data})
      : super(success: success, msg: msg);

  factory WeddingAlbumResp.fromJson(Map<String, dynamic> json) =>
      _$WeddingAlbumRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class WeddingAlbumData {
  Certificate? certificate;

  @JsonKey(name: 'essence')
  List<WeddingImage> photos;

  @JsonKey(name: 'essence_capacity')
  int albumCapacity;

  WeddingAlbumData(this.certificate, this.photos, this.albumCapacity);

  factory WeddingAlbumData.fromJson(Map<String, dynamic> json) =>
      _$WeddingAlbumDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class Certificate {
  @JsonKey(name: 'groom_uid')
  int groomUid;

  @JsonKey(name: 'groom_name')
  String groomName;

  @JsonKey(name: 'groom_image')
  String groomIcon;

  @JsonKey(name: 'bride_uid')
  int brideUid;

  @JsonKey(name: 'bride_name')
  String brideName;

  @JsonKey(name: 'bride_image')
  String brideIcon;

  @JsonKey(name: 'wedding_time')
  int weddingTime;

  @JsonKey(name: 'wedding_bg_pic')
  String weddingBgPic;

  Certificate(this.groomUid, this.groomName, this.groomIcon, this.brideUid,
      this.brideName, this.brideIcon, this.weddingTime, this.weddingBgPic);

  factory Certificate.fromJson(Map<String, dynamic> json) =>
      _$CertificateFromJson(json);
}

@JsonSerializable(createToJson: false)
class WeddingImage {
  int? id;
  @JsonKey(name: 'image')
  String? url;
  String? type;
  int? state; //状态，10：审核中，20：审核未通过，30：审核通过

  static const STATE_CHECKING = 10;
  static const STATE_NOT = 20;

  static const TYPE_ADD = 'ADD_ICON';

  WeddingImage(this.id, this.url, this.type, this.state);

  WeddingImage.type(this.type);

  factory WeddingImage.fromJson(Map<String, dynamic> json) =>
      _$WeddingImageFromJson(json);
}

@JsonSerializable(createToJson: false)
class SendCardResp extends BaseResponse {
  SendCardData? data;

  SendCardResp({bool success = false, String msg = '', this.data})
      : super(success: success, msg: msg);

  factory SendCardResp.fromJson(Map<String, dynamic> json) =>
      _$SendCardRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class SendCardData {
  @JsonKey(name: 'pay_money')
  int payMoney;

  String msg;

  @JsonKey(name: 'card_type_id')
  int cardTypeId;

  @JsonKey(name: 'buy_num')
  int num;

  SendCardData(this.payMoney, this.msg, this.cardTypeId, this.num);

  factory SendCardData.fromJson(Map<String, dynamic> json) =>
      _$SendCardDataFromJson(json);
}
