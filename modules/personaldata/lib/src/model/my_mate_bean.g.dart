// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_mate_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlessListResponse _$BlessListResponseFromJson(Map<String, dynamic> json) {
  return BlessListResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    items: Util.parseList(json['data'],
            (e) => BlessItem.fromJson(e as Map<String, dynamic>)) ??
        [],
    hasMore: Util.parseBool(json['more']),
  );
}

Map<String, dynamic> _$BlessListResponseToJson(BlessListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.items,
      'more': instance.hasMore,
    };

BlessItem _$BlessItemFromJson(Map<String, dynamic> json) {
  return BlessItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['u_name']) ?? '',
    Util.parseStr(json['u_icon']) ?? '',
    Util.parseInt(json['create_time']),
    Util.parseStr(json['gift_icon']) ?? '',
    Util.parseStr(json['gift_name']) ?? '',
    Util.parseInt(json['gift_num']),
  );
}

Map<String, dynamic> _$BlessItemToJson(BlessItem instance) => <String, dynamic>{
      'uid': instance.uid,
      'u_name': instance.name,
      'u_icon': instance.icon,
      'create_time': instance.time,
      'gift_icon': instance.giftIcon,
      'gift_name': instance.giftName,
      'gift_num': instance.giftCount,
    };

MessageListResponse _$MessageListResponseFromJson(Map<String, dynamic> json) {
  return MessageListResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    items: Util.parseList(json['data'],
            (e) => MessageItem.fromJson(e as Map<String, dynamic>)) ??
        [],
  );
}

Map<String, dynamic> _$MessageListResponseToJson(
        MessageListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.items,
    };

MessageItem _$MessageItemFromJson(Map<String, dynamic> json) {
  return MessageItem(
    Util.parseInt(json['id']),
    Util.parseInt(json['mid']),
    Util.parseInt(json['uid']),
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['message']) ?? '',
    Util.parseInt(json['create_time']),
  );
}

Map<String, dynamic> _$MessageItemToJson(MessageItem instance) =>
    <String, dynamic>{
      'id': instance.msgId,
      'mid': instance.mid,
      'uid': instance.uid,
      'icon': instance.icon,
      'name': instance.name,
      'message': instance.message,
      'create_time': instance.time,
    };

RelationItem _$RelationItemFromJson(Map<String, dynamic> json) {
  return RelationItem(
    Util.parseStr(json['img_bg']) ?? '',
    Util.parseInt(json['has_wedding']),
  );
}

Map<String, dynamic> _$RelationItemToJson(RelationItem instance) =>
    <String, dynamic>{
      'img_bg': instance.bgImg,
      'has_wedding': instance.hasWedding,
    };

MyMateResponse _$MyMateResponseFromJson(Map<String, dynamic> json) {
  return MyMateResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    items: Util.parseList(json['commodity_list'],
            (e) => RingItem.fromJson(e as Map<String, dynamic>)) ??
        [],
    loveIndex: Util.parseInt(json['degree']),
    blessIndex: Util.parseInt(json['wish']),
    loveDays: Util.parseInt(json['relation_day']),
    currentRing: json['commodity'] == null
        ? null
        : RingItem.fromJson(json['commodity'] as Map<String, dynamic>),
    user1: json['profile'] == null
        ? null
        : ProfileItem.fromJson(json['profile'] as Map<String, dynamic>),
    user2: json['t_profile'] == null
        ? null
        : ProfileItem.fromJson(json['t_profile'] as Map<String, dynamic>),
    relationItem: json['relation'] == null
        ? null
        : RelationItem.fromJson(json['relation'] as Map<String, dynamic>),
    code: Util.parseInt(json['code']),
    isBlock: Util.parseBool(json['is_block']),
    weddingStatus: Util.parseInt(json['wedding_status']),
    wid: Util.parseInt(json['wedding_id']),
    canHoldWedding: Util.parseBool(json['can_hold_wedding']),
  );
}

Map<String, dynamic> _$MyMateResponseToJson(MyMateResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'commodity_list': instance.items,
      'commodity': instance.currentRing,
      'degree': instance.loveIndex,
      'wish': instance.blessIndex,
      'relation_day': instance.loveDays,
      'profile': instance.user1,
      't_profile': instance.user2,
      'relation': instance.relationItem,
      'code': instance.code,
      'is_block': instance.isBlock,
      'wedding_status': instance.weddingStatus,
      'wedding_id': instance.wid,
      'can_hold_wedding': instance.canHoldWedding,
    };

MarryProposeResponse _$MarryProposeResponseFromJson(Map<String, dynamic> json) {
  return MarryProposeResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    items: Util.parseList(json['list'],
            (e) => ProposeItem.fromJson(e as Map<String, dynamic>)) ??
        [],
    loveLetterId: Util.parseInt(json['newest_letter_id']),
  );
}

Map<String, dynamic> _$MarryProposeResponseToJson(
        MarryProposeResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'list': instance.items,
      'newest_letter_id': instance.loveLetterId,
    };

ProfileItem _$ProfileItemFromJson(Map<String, dynamic> json) {
  return ProfileItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['sex']),
  );
}

Map<String, dynamic> _$ProfileItemToJson(ProfileItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
      'sex': instance.sex,
    };

ProposeItem _$ProposeItemFromJson(Map<String, dynamic> json) {
  return ProposeItem(
    Util.parseInt(json['tuid']),
    Util.parseInt(json['degree']),
    Util.parseBool(json['can_propose']),
    json['t_profile'] == null
        ? null
        : ProfileItem.fromJson(json['t_profile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProposeItemToJson(ProposeItem instance) =>
    <String, dynamic>{
      'tuid': instance.uid,
      'degree': instance.intimacy,
      'can_propose': instance.canPropose,
      't_profile': instance.proposeProfile,
    };

MarryOurRingsResponse _$MarryOurRingsResponseFromJson(
    Map<String, dynamic> json) {
  return MarryOurRingsResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
  )..items = Util.parseList(json['commodity_list'],
          (e) => RingItem.fromJson(e as Map<String, dynamic>)) ??
      [];
}

Map<String, dynamic> _$MarryOurRingsResponseToJson(
        MarryOurRingsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'commodity_list': instance.items,
    };

MarryRingsResponse _$MarryRingsResponseFromJson(Map<String, dynamic> json) {
  return MarryRingsResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    profileItem: json['profile'] == null
        ? null
        : ProfileItem.fromJson(json['profile'] as Map<String, dynamic>),
    tProfileItem: json['t_profile'] == null
        ? null
        : ProfileItem.fromJson(json['t_profile'] as Map<String, dynamic>),
    currentRing: json['commodity'] == null
        ? null
        : RingItem.fromJson(json['commodity'] as Map<String, dynamic>),
  )..items = Util.parseList(json['commodity_list'],
          (e) => RingItem.fromJson(e as Map<String, dynamic>)) ??
      [];
}

Map<String, dynamic> _$MarryRingsResponseToJson(MarryRingsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'commodity_list': instance.items,
      'profile': instance.profileItem,
      't_profile': instance.tProfileItem,
      'commodity': instance.currentRing,
    };

ProposeRingsResponse _$ProposeRingsResponseFromJson(Map<String, dynamic> json) {
  return ProposeRingsResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    items: Util.parseList(json['commodity_list'],
            (e) => RingItem.fromJson(e as Map<String, dynamic>)) ??
        [],
  );
}

Map<String, dynamic> _$ProposeRingsResponseToJson(
        ProposeRingsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'commodity_list': instance.items,
    };

RingItem _$RingItemFromJson(Map<String, dynamic> json) {
  return RingItem(
    Util.parseInt(json['cid']),
    Util.parseStr(json['image']) ?? '',
    Util.parseInt(json['price']),
    Util.parseStr(json['type']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['exist_ring_box']),
    Util.parseStr(json['money_type']) ?? '',
    Util.parseStr(json['image_bg']) ?? '',
  )..ownCount = Util.parseInt(json['num']);
}

Map<String, dynamic> _$RingItemToJson(RingItem instance) => <String, dynamic>{
      'cid': instance.cid,
      'type': instance.type,
      'name': instance.name,
      'image': instance.icon,
      'price': instance.price,
      'num': instance.ownCount,
      'exist_ring_box': instance.existInBox,
      'money_type': instance.moneyType,
      'image_bg': instance.imageBG,
    };

LeaveMessageResponse _$LeaveMessageResponseFromJson(Map<String, dynamic> json) {
  return LeaveMessageResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    item: json['data'] == null
        ? null
        : MessageItem.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LeaveMessageResponseToJson(
        LeaveMessageResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.item,
    };

SendRingResponse _$SendRingResponseFromJson(Map<String, dynamic> json) {
  return SendRingResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    proposeId: Util.parseInt(json['propose_id']),
    toUid: Util.parseInt(json['to_uid']),
  );
}

Map<String, dynamic> _$SendRingResponseToJson(SendRingResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'propose_id': instance.proposeId,
      'to_uid': instance.toUid,
    };

PermissionResponse _$PermissionResponseFromJson(Map<String, dynamic> json) {
  return PermissionResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    limitMsg: Util.parseInt(json['limit_msg']),
  );
}

Map<String, dynamic> _$PermissionResponseToJson(PermissionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'limit_msg': instance.limitMsg,
    };
