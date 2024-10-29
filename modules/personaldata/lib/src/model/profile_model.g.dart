// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) {
  return ProfileResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : ProfileBean.fromJson(json['data'] as Map<String, dynamic>),
  );
}

ProfileBean _$ProfileBeanFromJson(Map<String, dynamic> json) {
  return ProfileBean(
    uid: Util.parseInt(json['uid']),
    name: Util.parseStr(json['name']),
    icon: Util.parseStr(json['icon']),
    age: Util.parseInt(json['age']),
    birthday: Util.parseStr(json['birthday']),
    sign: Util.parseStr(json['sign']),
    city: Util.parseStr(json['city']),
    onlineStatus: Util.parseInt(json['online_status']),
    onlineDateline: Util.parseInt(json['online_dateline']),
    onlineDatelineDiff: Util.parseStr(json['online_dateline_diff']),
    job: Util.parseInt(json['job']),
    sex: Util.parseInt(json['sex']),
    title: Util.parseInt(json['title']),
    titleNew: Util.parseInt(json['title_new']),
    star: Util.parseInt(json['star']),
    godNum: Util.parseInt(json['god_num']),
    godCategory: Util.parseStr(json['god_category']),
    deleted: Util.parseInt(json['deleted']),
    blockUnAutherMessage: Util.parseInt(json['block_un_auther_message']),
    position: Util.parseStr(json['position']),
    servicePause: Util.parseInt(json['service_pause']),
    serviceBusy: Util.parseInt(json['service_busy']),
    creditGodLevel: Util.parseInt(json['credit_god_level']),
    creditUserLevel: Util.parseInt(json['credit_user_level']),
    tag: Util.parseInt(json['tag']),
    friendState: Util.parseInt(json['friend_state']),
    hasVideo: Util.parseInt(json['has_video']),
    role: Util.parseInt(json['role']),
    vipLevel: Util.parseInt(json['vipLevel']),
    follow: Util.parseInt(json['follow']),
    gameSuccess: Util.parseInt(json['game_success']),
    gameComplete: Util.parseInt(json['game_complete']),
    authentication: Util.parseInt(json['authentication']),
    authenticationScore: json['authenticationScore'],
    authenticationSign: Util.parseStr(json['authenticationSign']),
    defendList: Util.parseList(json['defend_list'],
            (e) => DefendRelationModel.fromJson(e as Map<String, dynamic>)) ??
        [],
    markName: Util.parseStr(json['mark_name']),
    photos: Util.parseList(json['photos'], (e) => Util.parseStr(e) ?? ''),
    videos: Util.parseList(json['videos'], (e) => e as Map<String, dynamic>),
    games: Util.parseList(json['games'],
            (e) => GameBean.fromJson(e as Map<String, dynamic>)) ??
        [],
    gifts: Util.parseList(json['gifts'],
            (e) => GiftBean.fromJson(e as Map<String, dynamic>)) ??
        [],
    interest: Util.parseList(json['interest'],
            (e) => InterestBean.fromJson(e as Map<String, dynamic>)) ??
        [],
    skill: Util.parseList(json['skill'],
            (e) => SkillBean.fromJson(e as Map<String, dynamic>)) ??
        [],
    room: json['room'] == null
        ? null
        : RoomBean.fromJson(json['room'] as Map<String, dynamic>),
    fleet: json['fleet'] == null
        ? null
        : FleetBean.fromJson(json['fleet'] as Map<String, dynamic>),
    self: json['self'] == null
        ? null
        : SelfBean.fromJson(json['self'] as Map<String, dynamic>),
    latitude: Util.parseDouble(json['latitude']),
    longitude: Util.parseDouble(json['longitude']),
    cardInfo: json['card'] == null
        ? null
        : ChatMatchItem.fromJson(json['card'] as Map<String, dynamic>),
    topic: Util.parseInt(json['topic']),
    needVerify: Util.parseInt(json['need_verify']),
    needVerifyNew: Util.parseInt(json['need_verify_new']),
    official: Util.parseInt(json['official']),
    isNew: Util.parseInt(json['is_newer']),
    accompany: (json['accompany'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, Util.parseInt(e)),
    ),
    popularityLevel: Util.parseInt(json['popularity_level']),
    decorate: json['decorate'] == null
        ? null
        : DecorateBean.fromJson(json['decorate'] as Map<String, dynamic>),
    followRelation: Util.parseInt(json['follow_relation']),
    mark: json['mark'] as List,
    accompanyFirst: json['accompanyFirst'] as Map<String, dynamic>,
    tags: Util.parseList(json['tags'],
            (e) => PersonalTagModel.fromJson(e as Map<String, dynamic>)) ??
        [],
    friendTags: Util.parseList(json['friend_tags'],
            (e) => PersonalTagModel.fromJson(e as Map<String, dynamic>)) ??
        [],
    dateline: Util.parseInt(json['dateline']),
    union: json['union_info'] == null
        ? null
        : UnionBean.fromJson(json['union_info'] as Map<String, dynamic>),
    marry: json['marry'] as Map<String, dynamic>,
    gameHistory: json['game_history'],
    game: json['game'] as Map<String, dynamic>,
    icongray: Util.parseBool(json['icongray']),
    glist: json['glist'] as List,
    fansNum: Util.parseInt(json['fans_num']),
    distance: Util.parseStr(json['distance']),
    groupInfoList: json['party_group'] == null
        ? null
        : GroupInfoList.fromJson(json['party_group'] as Map<String, dynamic>),
    accompanyNum: Util.parseInt(json['accompany_num']),
    businessCard: json['business_card'] == null
        ? null
        : BusinessCard.fromJson(json['business_card'] as Map<String, dynamic>),
    businessCardNew: json['business_card_new'] == null
        ? null
        : BusinessCard.fromJson(
            json['business_card_new'] as Map<String, dynamic>),
    defendCount: Util.parseInt(json['defend_count']),
    roleTitles: Util.parseList(json['ju_titles'],
            (e) => TitleRoleItemBean.fromJson(e as Map<String, dynamic>)) ??
        [],
    rookieTag: json['rookie_tag'] == null
        ? null
        : RookieTag.fromJson(json['rookie_tag'] as Map<String, dynamic>),
    isNewNoble: Util.parseBool(json['new_noble']),
    fansGroupInfo: json['kfg_show'] == null
        ? null
        : FansGroupInfo.fromJson(json['kfg_show'] as Map<String, dynamic>),
    frame: Util.parseStr(json['frame']),
    circleNum: Util.parseInt(json['circle_count']),
    followNum: Util.parseInt(json['follow_num']),
    visitor: json['visitor'] == null
        ? null
        : Visitor.fromJson(json['visitor'] as Map<String, dynamic>),
    fansIncre: Util.parseInt(json['fans_incre']),
    author: Util.parseInt(json['author']),
    starVerifyTag: Util.parseInt(json['star_verify_tag']),
  );
}

Visitor _$VisitorFromJson(Map<String, dynamic> json) {
  return Visitor(
    visitorNew: Util.parseInt(json['new']),
    visitorTotal: Util.parseInt(json['total']),
    visitorTime: Util.parseInt(json['time']),
  );
}

Map<String, dynamic> _$VisitorToJson(Visitor instance) => <String, dynamic>{
      'new': instance.visitorNew,
      'total': instance.visitorTotal,
      'time': instance.visitorTime,
    };

BusinessCard _$BusinessCardFromJson(Map<String, dynamic> json) {
  return BusinessCard(
    banner: Util.parseStr(json['banner']) ?? '',
    header: Util.parseStr(json['header']) ?? '',
  );
}

Map<String, dynamic> _$BusinessCardToJson(BusinessCard instance) =>
    <String, dynamic>{
      'banner': instance.banner,
      'header': instance.header,
    };

RookieTag _$RookieTagFromJson(Map<String, dynamic> json) {
  return RookieTag(
    sevenNew: Util.parseInt(json['seven_new']),
    payLevel: Util.parseInt(json['pay_level']),
  );
}

Map<String, dynamic> _$RookieTagToJson(RookieTag instance) => <String, dynamic>{
      'seven_new': instance.sevenNew,
      'pay_level': instance.payLevel,
    };

GameBean _$GameBeanFromJson(Map<String, dynamic> json) {
  return GameBean(
    id: Util.parseStr(json['id']),
    name: Util.parseStr(json['name']),
    icon: Util.parseStr(json['icon']),
    num: Util.parseInt(json['num']),
    gameId: Util.parseStr(json['game_id']),
  );
}

Map<String, dynamic> _$GameBeanToJson(GameBean instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'game_id': instance.gameId,
      'num': instance.num,
    };

GiftBean _$GiftBeanFromJson(Map<String, dynamic> json) {
  return GiftBean(
    Util.parseInt(json['gid']),
    Util.parseInt(json['num']),
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['sum']),
  );
}

Map<String, dynamic> _$GiftBeanToJson(GiftBean instance) => <String, dynamic>{
      'gid': instance.gid,
      'num': instance.num,
      'name': instance.name,
      'sum': instance.sum,
    };

InterestBean _$InterestBeanFromJson(Map<String, dynamic> json) {
  return InterestBean(
    name: Util.parseStr(json['name']),
  );
}

Map<String, dynamic> _$InterestBeanToJson(InterestBean instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

SkillBean _$SkillBeanFromJson(Map<String, dynamic> json) {
  return SkillBean(
    cid: Util.parseInt(json['cid']),
    rid: Util.parseStr(json['rid']),
    name: Util.parseStr(json['name']),
    icon: Util.parseStr(json['icon']),
    dateline: Util.parseInt(json['dateline']),
    num: Util.parseInt(json['num']),
    isDefault: Util.parseInt(json['is_default']),
    types: Util.parseList(json['_types'], (e) => Util.parseStr(e) ?? ''),
    level: Util.parseStr(json['_level']),
    price: Util.parseList(
        json['_price'], (e) => PriceBean.fromJson(e as Map<String, dynamic>)),
    godTags: Util.parseList(
        json['user_god_tag_list'], (e) => Util.parseStr(e) ?? ''),
  );
}

Map<String, dynamic> _$SkillBeanToJson(SkillBean instance) => <String, dynamic>{
      'cid': instance.cid,
      'rid': instance.rid,
      'name': instance.name,
      'icon': instance.icon,
      'dateline': instance.dateline,
      'num': instance.num,
      'is_default': instance.isDefault,
      '_types': instance.types,
      '_level': instance.level,
      '_price': instance.price,
      'user_god_tag_list': instance.godTags,
    };

PriceBean _$PriceBeanFromJson(Map<String, dynamic> json) {
  return PriceBean(
    Util.parseStr(json['uint']) ?? '',
    Util.parseInt(json['price']),
    Util.parseInt(json['cheap']),
  );
}

Map<String, dynamic> _$PriceBeanToJson(PriceBean instance) => <String, dynamic>{
      'uint': instance.unit,
      'price': instance.price,
      'cheap': instance.cheap,
    };

FleetBean _$FleetBeanFromJson(Map<String, dynamic> json) {
  return FleetBean(
    gid: Util.parseInt(json['gid']),
    name: Util.parseStr(json['name']),
    icon: Util.parseStr(json['icon']),
    total: Util.parseInt(json['total']),
    inNum: Util.parseInt(json['in']),
    creatorId: Util.parseInt(json['creator']),
  );
}

Map<String, dynamic> _$FleetBeanToJson(FleetBean instance) => <String, dynamic>{
      'gid': instance.gid,
      'name': instance.name,
      'icon': instance.icon,
      'total': instance.total,
      'creator': instance.creatorId,
      'in': instance.inNum,
    };

UnionBean _$UnionBeanFromJson(Map<String, dynamic> json) {
  return UnionBean(
    unionId: Util.parseInt(json['un_id']),
    name: Util.parseStr(json['name']),
    icon: Util.parseStr(json['logo']),
    creatorId: Util.parseInt(json['create_uid']),
    userTitle: Util.parseStr(json['user_title']),
    titleName: Util.parseStr(json['title_name']),
  );
}

Map<String, dynamic> _$UnionBeanToJson(UnionBean instance) => <String, dynamic>{
      'un_id': instance.unionId,
      'name': instance.name,
      'logo': instance.icon,
      'create_uid': instance.creatorId,
      'user_title': instance.userTitle,
      'title_name': instance.titleName,
    };

SelfBean _$SelfBeanFromJson(Map<String, dynamic> json) {
  return SelfBean(
    video: Util.parseBool(json['video']),
    payNum: Util.parseInt(json['pay_num']),
  );
}

Map<String, dynamic> _$SelfBeanToJson(SelfBean instance) => <String, dynamic>{
      'video': instance.video,
      'pay_num': instance.payNum,
    };

RoomBean _$RoomBeanFromJson(Map<String, dynamic> json) {
  return RoomBean(
    rid: Util.parseStr(json['rid']),
    prefix: Util.parseStr(json['prefix']),
    uid: Util.parseInt(json['uid']),
    name: Util.parseStr(json['name']),
    type: Util.parseStr(json['type']),
    weight: Util.parseStr(json['weight']),
    types: Util.parseStr(json['types']),
    onlineNum: Util.parseInt(json['online_num']),
    icon: Util.parseStr(json['icon']),
    version: Util.parseInt(json['version']),
    dateline: Util.parseStr(json['dateline']),
    password: Util.parseInt(json['password']),
    bossUid: Util.parseStr(json['boss_uid']),
    uname: Util.parseStr(json['uname']),
    utitle: Util.parseStr(json['utitle']),
    payRoomMoney: Util.parseStr(json['pay_room_money']),
    deleted: Util.parseInt(json['deleted']),
    vip: Util.parseInt(json['vip']),
    typeName: json['typeName'] == null
        ? null
        : TypeNameBean.fromJson(json['typeName'] as Map<String, dynamic>),
    guestEnable: Util.parseInt(json['guestEnable']),
    tag: Util.parseStr(json['tag']),
    real: Util.parseInt(json['real']),
    property: Util.parseStr(json['property']),
    onMicNum: Util.parseInt(json['onmic_num']),
    role: Util.parseStr(json['role']) ?? '',
  );
}

Map<String, dynamic> _$RoomBeanToJson(RoomBean instance) => <String, dynamic>{
      'rid': instance.rid,
      'prefix': instance.prefix,
      'uid': instance.uid,
      'name': instance.name,
      'type': instance.type,
      'weight': instance.weight,
      'types': instance.types,
      'online_num': instance.onlineNum,
      'icon': instance.icon,
      'version': instance.version,
      'dateline': instance.dateline,
      'password': instance.password,
      'boss_uid': instance.bossUid,
      'uname': instance.uname,
      'utitle': instance.utitle,
      'pay_room_money': instance.payRoomMoney,
      'deleted': instance.deleted,
      'vip': instance.vip,
      'typeName': instance.typeName,
      'guestEnable': instance.guestEnable,
      'tag': instance.tag,
      'real': instance.real,
      'property': instance.property,
      'onmic_num': instance.onMicNum,
      'role': instance.role,
    };

TypeNameBean _$TypeNameBeanFromJson(Map<String, dynamic> json) {
  return TypeNameBean(
    label: Util.parseStr(json['label']),
    val: Util.parseStr(json['val']),
    color: Util.parseStr(json['color']),
    show: Util.parseStr(json['show']),
  );
}

Map<String, dynamic> _$TypeNameBeanToJson(TypeNameBean instance) =>
    <String, dynamic>{
      'label': instance.label,
      'val': instance.val,
      'color': instance.color,
      'show': instance.show,
    };

DecorateBean _$DecorateBeanFromJson(Map<String, dynamic> json) {
  return DecorateBean(
    Util.parseInt(json['gift_id']),
    Util.parseInt(json['vap_size']),
  );
}

Map<String, dynamic> _$DecorateBeanToJson(DecorateBean instance) =>
    <String, dynamic>{
      'gift_id': instance.giftId,
      'vap_size': instance.vapSize,
    };

ProfileUnionInfo _$ProfileUnionInfoFromJson(Map<String, dynamic> json) {
  return ProfileUnionInfo(
    Util.parseInt(json['level']),
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['role']) ?? '',
  );
}

GroupInfoList _$GroupInfoListFromJson(Map<String, dynamic> json) {
  return GroupInfoList(
    Util.parseInt(json['total']),
    Util.parseList(json['list'],
            (e) => GroupInfoItem.fromJson(e as Map<String, dynamic>)) ??
        [],
  );
}

GroupInfoItem _$GroupInfoItemFromJson(Map<String, dynamic> json) {
  return GroupInfoItem(
    Util.parseInt(json['group_id']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['cover']) ?? '',
    Util.parseStr(json['member_num']) ?? '',
    Util.parseBool(json['in']),
    Util.parseBool(json['official']),
  );
}
