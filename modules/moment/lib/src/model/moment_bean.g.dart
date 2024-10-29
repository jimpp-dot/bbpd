// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MomentPage _$MomentPageFromJson(Map<String, dynamic> json) {
  return MomentPage(
    Util.parseInt(json['total']),
    Util.parseInt(json['next']),
    Util.parseList(
        json['topics'], (e) => Moment.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$MomentPageToJson(MomentPage instance) =>
    <String, dynamic>{
      'total': instance.total,
      'next': instance.next,
      'topics': instance.topics,
    };

Moment _$MomentFromJson(Map<String, dynamic> json) {
  return Moment(
    topicId: Util.parseInt(json['topic_id']),
    uid: Util.parseInt(json['uid']),
    name: Util.parseStr(json['name']),
    titleNew: Util.parseInt(json['title_new']),
    badgeList:
        Util.parseList(json['badge_list'], (e) => Util.parseStr(e) ?? ''),
    markName: Util.parseStr(json['mkname']),
    type: _$enumDecodeNullable(_$MomentTypeEnumMap, json['atype'],
        unknownValue: MomentType.text),
    icon: Util.parseIcon(json['icon']),
    content: Util.parseStr(json['content']),
    time: Util.parseInt(json['time']),
    likeNum: Util.parseInt(json['like_num']),
    cmtNum: Util.parseInt(json['cmt_num']),
    userType: _$enumDecodeNullable(_$UserTypeEnumMap, json['ttype'],
        unknownValue: UserType.user),
    hasLike: Util.parseInt(json['has_like']),
    likes: Util.parseList(
        json['likes'], (e) => LikeBean.fromJson(e as Map<String, dynamic>)),
    comments: Util.parseList(
        json['comments'], (e) => Comment.fromJson(e as Map<String, dynamic>)),
    hotComment: json['optimal_cmt'] == null
        ? null
        : Comment.fromJson(json['optimal_cmt'] as Map<String, dynamic>),
    images: Util.parseList(json['attach'], (e) => Util.parseStr(e) ?? ''),
    expanded: Util.parseBool(json['expanded']),
    authority: _$enumDecodeNullable(_$AuthorityEnumMap, json['authority'],
        unknownValue: Authority.public),
    cover: Util.parseStr(json['cover']),
    duration: Util.parseInt(json['duration']),
    location: Util.parseStr(json['location']),
    latitude: Util.parseStr(json['latitude']),
    longitude: Util.parseStr(json['longitude']),
    tagType: _$enumDecodeNullable(_$TagTypeEnumMap, json['tagtype'],
        unknownValue: TagType.unknown),
    tagsTp: (json['tagstp'] as List?)
        ?.map((e) => NormalTag.fromJson(e as Map<String, dynamic>))
        .toList(),
    card: json['card'] == null
        ? null
        : Card.fromJson(json['card'] as Map<String, dynamic>),
    tagsCase: json['tagscase'] == null
        ? null
        : TagsCase.fromJson(json['tagscase'] as Map<String, dynamic>),
    tagsBroadcast: json['tags_broadcast'] == null
        ? null
        : BroadcastTag.fromJson(json['tags_broadcast'] as Map<String, dynamic>),
    tagsWedding: json['tagswedding'] == null
        ? null
        : WeddingTag.fromJson(json['tagswedding'] as Map<String, dynamic>),
    workInfo: json['work_info'] == null
        ? null
        : WorkInfo.fromJson(json['work_info'] as Map<String, dynamic>),
    sex: Util.parseInt(json['sex']),
    age: Util.parseInt(json['age']),
    isFollow: Util.parseInt(json['isfollow']),
    isExposure: Util.parseBool(json['is_exposure']) ?? false,
    bgp: Util.parseStr(json['bgp']),
    rid: Util.parseInt(json['rid']),
    playTip: Util.parseStr(json['playtip']),
    exposure: Util.parseInt(json['exposure']),
    recommend: Util.parseInt(json['recommend']),
    topic_heat: Util.parseDouble(json['topic_heat']),
    sort_score: Util.parseDouble(json['sort_score']),
    ctr: Util.parseDouble(json['ctr']),
    decay_ratio: Util.parseDouble(json['decay_ratio']),
    index: Util.parseInt(json['index']),
    official: Util.parseInt(json['official']),
    inRoom: Util.parseInt(json['in_room']),
    isOnline: Util.parseInt(json['is_online']),
    headFrame: Util.parseStr(json['head_frame']),
    atUsers: (json['atuids'] as List?)
        ?.map((e) => MomentNoticePeople.fromJson(e as Map<String, dynamic>))
        .toList(),
    starVerifyTag: Util.parseBool(json['star_verify_tag']),
    isTop: Util.parseBool(json['is_top_v2']),
    appraiserTag: json['tagsapra'] == null
        ? null
        : AppraiserTag.fromJson(json['tagsapra'] as Map<String, dynamic>),
    tagsGoodVoice: json['tagsvoice'] == null
        ? null
        : GoodVoiceTag.fromJson(json['tagsvoice'] as Map<String, dynamic>),
    status: Util.parseStr(json['status']),
    isInAudit: Util.parseStr(json['status']) == 'pending',
  )..playIcon = Util.parseStr(json['ricon']);
}

Map<String, dynamic> _$MomentToJson(Moment instance) => <String, dynamic>{
      'topic_id': instance.topicId,
      'uid': instance.uid,
      'name': instance.name,
      'title_new': instance.titleNew,
      'mkname': instance.markName,
      'icon': instance.icon,
      'content': instance.content,
      'ttype': _$UserTypeEnumMap[instance.userType],
      'atype': _$MomentTypeEnumMap[instance.type],
      'attach': instance.images,
      'has_like': instance.hasLike,
      'like_num': instance.likeNum,
      'cmt_num': instance.cmtNum,
      'authority': _$AuthorityEnumMap[instance.authority],
      'time': instance.time,
      'likes': instance.likes,
      'comments': instance.comments,
      'hot_comment': instance.hotComment,
      'cover': instance.cover,
      'duration': instance.duration,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'tagtype': _$TagTypeEnumMap[instance.tagType],
      'tagstp': instance.tagsTp,
      'bgp': instance.bgp,
      'card': instance.card,
      'tagscase': instance.tagsCase,
      'tagsapra': instance.appraiserTag,
      'tags_broadcast': instance.tagsBroadcast,
      'tagswedding': instance.tagsWedding,
      'tagsvoice': instance.tagsGoodVoice,
      'work_info': instance.workInfo,
      'sex': instance.sex,
      'age': instance.age,
      'isfollow': instance.isFollow,
      'expanded': instance.expanded,
      'is_exposure': instance.isExposure,
      'rid': instance.rid,
      'in_room': instance.inRoom,
      'playtip': instance.playTip,
      'official': instance.official,
      'ricon': instance.playIcon,
      'is_online': instance.isOnline,
      'head_frame': instance.headFrame,
      'atuids': instance.atUsers,
      'star_verify_tag': instance.starVerifyTag,
      'is_top_v2': instance.isTop,
      'exposure': instance.exposure,
      'recommend': instance.recommend,
      'topic_heat': instance.topic_heat,
      'sort_score': instance.sort_score,
      'ctr': instance.ctr,
      'decay_ratio': instance.decay_ratio,
      'index': instance.index,
      'status': instance.status,
      'isInAudit': instance.isInAudit,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  required T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value =
      enumValues.entries.firstWhereOrNull((e) => e.value == source)?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  required T unknownValue,
}) {
  if (source == null) {
    return unknownValue;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$MomentTypeEnumMap = {
  MomentType.normal: 'normal',
  MomentType.text: 'text',
  MomentType.picture: 'picture',
  MomentType.video: 'video',
  MomentType.audio: 'audio',
  MomentType.work: 'work',
};

const _$UserTypeEnumMap = {
  UserType.user: 'user',
  UserType.official: 'offical',
  UserType.other: 'other',
};

const _$AuthorityEnumMap = {
  Authority.public: 'public',
  Authority.friend: 'friend',
  Authority.private: 'private',
};

const _$TagTypeEnumMap = {
  TagType.topic: 'topic',
  TagType.play: 'play',
  TagType.wedding: 'wedding',
  TagType.broadcast: 'broadcast',
  TagType.born: 'born',
  TagType.thevoice: 'thevoice',
  TagType.unknown: 'unknown',
};

WorkInfo _$WorkInfoFromJson(Map<String, dynamic> json) {
  return WorkInfo(
    Util.parseStr(json['singer_name']),
    Util.parseStr(json['song_name']),
    Util.parseStr(json['song_cover']),
    Util.parseStr(json['gift_num']),
    Util.parseStr(json['play_num']),
    Util.parseStr(json['singer_icon']),
    Util.parseInt(json['song_duration']),
    Util.parseStr(json['work_type']),
    Util.parseInt(json['song_id']),
  );
}

Map<String, dynamic> _$WorkInfoToJson(WorkInfo instance) => <String, dynamic>{
      'singer_name': instance.singerName,
      'song_name': instance.songName,
      'song_cover': instance.songCover,
      'gift_num': instance.giftNum,
      'play_num': instance.playNum,
      'singer_icon': instance.singerIcon,
      'song_duration': instance.songDuration,
      'work_type': instance.workType,
      'song_id': instance.songId,
    };
