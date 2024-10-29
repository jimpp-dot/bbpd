// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wedding_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeddingInvitationResp _$WeddingInvitationRespFromJson(
    Map<String, dynamic> json) {
  return WeddingInvitationResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : WeddingInvitationData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

WeddingInvitationData _$WeddingInvitationDataFromJson(
    Map<String, dynamic> json) {
  return WeddingInvitationData(
    Util.parseInt(json['wid']),
    json['groom'] == null
        ? null
        : UserItem.fromJson(json['groom'] as Map<String, dynamic>),
    json['bride'] == null
        ? null
        : UserItem.fromJson(json['bride'] as Map<String, dynamic>),
    Util.parseStr(json['card_content']) ?? '',
    Util.parseStr(json['card_bg_pic']) ?? '',
    Util.parseInt(json['card_num']),
    json['wedding_host'] == null
        ? null
        : HostInfo.fromJson(json['wedding_host'] as Map<String, dynamic>),
    json['wedding_accompany'] == null
        ? null
        : AccompanyInfo.fromJson(
            json['wedding_accompany'] as Map<String, dynamic>),
    json['wedding_guest'] == null
        ? null
        : GuestInfo.fromJson(json['wedding_guest'] as Map<String, dynamic>),
    Util.parseInt(json['wedding_time']),
    Util.parseBool(json['only_inviter']),
    Util.parseInt(json['card_type_id']),
    Util.parseStr(json['card_style_pic']) ?? '',
    Util.parseInt(json['wedding_stage']),
    Util.parseInt(json['rid']),
    Util.parseInt(json['time_before_wedding']),
    Util.parseBool(json['can_share_wedding']),
  );
}

UserItem _$UserItemFromJson(Map<String, dynamic> json) {
  return UserItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['image']) ?? '',
  );
}

HostInfo _$HostInfoFromJson(Map<String, dynamic> json) {
  return HostInfo(
    Util.parseInt(json['max_num']),
    Util.parseList(json['list'],
            (e) => UserItem.fromJson(e as Map<String, dynamic>)) ??
        [],
  );
}

AccompanyInfo _$AccompanyInfoFromJson(Map<String, dynamic> json) {
  return AccompanyInfo(
    Util.parseInt(json['max_num']),
    Util.parseList(json['list'],
            (e) => UserItem.fromJson(e as Map<String, dynamic>)) ??
        [],
  );
}

GuestInfo _$GuestInfoFromJson(Map<String, dynamic> json) {
  return GuestInfo(
    Util.parseList(json['list'],
            (e) => UserItem.fromJson(e as Map<String, dynamic>)) ??
        [],
  );
}

InviteFriendsResp _$InviteFriendsRespFromJson(Map<String, dynamic> json) {
  return InviteFriendsResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : FriendsList.fromJson(json['data'] as Map<String, dynamic>),
  );
}

FriendsList _$FriendsListFromJson(Map<String, dynamic> json) {
  return FriendsList(
    Util.parseList(json['list'],
            (e) => FriendItem.fromJson(e as Map<String, dynamic>)) ??
        [],
  );
}

FriendItem _$FriendItemFromJson(Map<String, dynamic> json) {
  return FriendItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['type']),
  );
}

WeddingAlbumResp _$WeddingAlbumRespFromJson(Map<String, dynamic> json) {
  return WeddingAlbumResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : WeddingAlbumData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

WeddingAlbumData _$WeddingAlbumDataFromJson(Map<String, dynamic> json) {
  return WeddingAlbumData(
    json['certificate'] == null
        ? null
        : Certificate.fromJson(json['certificate'] as Map<String, dynamic>),
    Util.parseList(json['essence'],
            (e) => WeddingImage.fromJson(e as Map<String, dynamic>)) ??
        [],
    Util.parseInt(json['essence_capacity']),
  );
}

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return Certificate(
    Util.parseInt(json['groom_uid']),
    Util.parseStr(json['groom_name']) ?? '',
    Util.parseStr(json['groom_image']) ?? '',
    Util.parseInt(json['bride_uid']),
    Util.parseStr(json['bride_name']) ?? '',
    Util.parseStr(json['bride_image']) ?? '',
    Util.parseInt(json['wedding_time']),
    Util.parseStr(json['wedding_bg_pic']) ?? '',
  );
}

WeddingImage _$WeddingImageFromJson(Map<String, dynamic> json) {
  return WeddingImage(
    Util.parseInt(json['id']),
    Util.parseStr(json['image']),
    Util.parseStr(json['type']),
    Util.parseInt(json['state']),
  );
}

SendCardResp _$SendCardRespFromJson(Map<String, dynamic> json) {
  return SendCardResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : SendCardData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

SendCardData _$SendCardDataFromJson(Map<String, dynamic> json) {
  return SendCardData(
    Util.parseInt(json['pay_money']),
    Util.parseStr(json['msg']) ?? '',
    Util.parseInt(json['card_type_id']),
    Util.parseInt(json['buy_num']),
  );
}
