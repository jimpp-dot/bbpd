///
//  Generated code. Do not modify.
//  source: profile.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'exhibit.pb.dart' as $0;
import 'gift_handbook.pb.dart' as $1;

import 'profile.pbenum.dart';

export 'profile.pbenum.dart';

class HomeProfileBase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileBase',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sign')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDatelineDiff')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'job',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blockUnAutherMessage',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vipLevel',
        $pb.PbFieldType.OU3,
        protoName: 'vipLevel')
    ..pPS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'photos')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'markName')
    ..aOB(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icongray')
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topic',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'needVerify',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'needVerifyNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'official',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isNewer',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularityLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'followRelation',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fansNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'distance')
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accompanyNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newNoble',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'authentication',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'authenticationScore',
        $pb.PbFieldType.OU3,
        protoName: 'authenticationScore')
    ..aOS(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'authenticationSign',
        protoName: 'authenticationSign')
    ..a<$core.int>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendCount',
        $pb.PbFieldType.OU3)
    ..aOS(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..a<$core.int>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'virtualMan',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightLevel',
        $pb.PbFieldType.OU3)
    ..aOS(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveLabelHeader')
    ..aOS(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveLabelBubble')
    ..aOS(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveLabelEffect')
    ..a<$core.int>(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveOnly',
        $pb.PbFieldType.OU3)
    ..aOS(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'littleAlarm')
    ..aOS(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jukebox')
    ..aOB(
        46,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'consumeLabel')
    ..aOB(
        47,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rechargeLabel')
    ..a<$core.int>(
        48,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starSinger',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        49,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starVerifyTag',
        $pb.PbFieldType.OU3)
    ..aOS(
        50,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starVerifyDesc')
    ..aOB(
        51,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'kaWhiteIcon')
    ..a<$core.int>(
        52,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'artistWorth',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        53,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'artistSignNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        54,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'artistLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        55,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'agentLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        56,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'haveArtistNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        57,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sevenLoveTag',
        $pb.PbFieldType.OU3)
    ..aOS(
        58,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'agentIcon')
    ..pPS(
        59,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeIcons')
    ..aOS(
        60,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeIconInUse')
    ..pPS(
        61,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tags')
    ..a<$core.int>(
        62,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prettyUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        63,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekStar',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        64,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isThirdNewer',
        $pb.PbFieldType.OU3)
    ..aOS(
        65,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ipLocation')
    ..aOB(
        66,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasGodcard')
    ..a<$core.int>(
        67,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'musicOrderCount',
        $pb.PbFieldType.OU3)
    ..aOB(
        68,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasCpHouse')
    ..a<$core.int>(
        69,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activityLevel',
        $pb.PbFieldType.OU3)
    ..aOS(
        70,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activityLevelTitle')
    ..a<$core.int>(
        71,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activitySubLevel',
        $pb.PbFieldType.OU3)
    ..pc<HomeProfileBadgeItem>(
        72,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badges',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileBadgeItem.create)
    ..a<$core.int>(
        73,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godcardBlock',
        $pb.PbFieldType.OU3)
    ..aOM<HomeProfileAchieveBadge>(
        74,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'achieveWear',
        subBuilder: HomeProfileAchieveBadge.create)
    ..aOB(
        75,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canGameOrder')
    ..aOS(
        76,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'holdHandIcon')
    ..hasRequiredFields = false;

  HomeProfileBase._() : super();
  factory HomeProfileBase({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? age,
    $core.String? birthday,
    $core.String? sign,
    $core.int? onlineStatus,
    $core.int? dateline,
    $core.int? onlineDateline,
    $core.String? onlineDatelineDiff,
    $core.int? job,
    $core.int? sex,
    $core.int? title,
    $core.int? deleted,
    $core.int? blockUnAutherMessage,
    $core.String? position,
    $core.int? role,
    $core.int? vipLevel,
    $core.Iterable<$core.String>? photos,
    $core.String? markName,
    $core.bool? icongray,
    $core.int? topic,
    $core.int? needVerify,
    $core.int? needVerifyNew,
    $core.int? official,
    $core.int? isNewer,
    $core.int? popularityLevel,
    $core.int? followRelation,
    $core.int? fansNum,
    $core.String? distance,
    $core.int? accompanyNum,
    $core.int? newNoble,
    $core.int? authentication,
    $core.int? authenticationScore,
    $core.String? authenticationSign,
    $core.int? defendCount,
    $core.String? frame,
    $core.int? virtualMan,
    $core.int? knightLevel,
    $core.String? liveLabelHeader,
    $core.String? liveLabelBubble,
    $core.String? liveLabelEffect,
    $core.int? liveOnly,
    $core.String? littleAlarm,
    $core.String? jukebox,
    $core.bool? consumeLabel,
    $core.bool? rechargeLabel,
    $core.int? starSinger,
    $core.int? starVerifyTag,
    $core.String? starVerifyDesc,
    $core.bool? kaWhiteIcon,
    $core.int? artistWorth,
    $core.int? artistSignNum,
    $core.int? artistLevel,
    $core.int? agentLevel,
    $core.int? haveArtistNum,
    $core.int? sevenLoveTag,
    $core.String? agentIcon,
    $core.Iterable<$core.String>? badgeIcons,
    $core.String? badgeIconInUse,
    $core.Iterable<$core.String>? tags,
    $core.int? prettyUid,
    $core.int? weekStar,
    $core.int? isThirdNewer,
    $core.String? ipLocation,
    $core.bool? hasGodcard,
    $core.int? musicOrderCount,
    $core.bool? hasCpHouse,
    $core.int? activityLevel,
    $core.String? activityLevelTitle,
    $core.int? activitySubLevel,
    $core.Iterable<HomeProfileBadgeItem>? badges,
    $core.int? godcardBlock,
    HomeProfileAchieveBadge? achieveWear,
    $core.bool? canGameOrder,
    $core.String? holdHandIcon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (age != null) {
      _result.age = age;
    }
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (onlineDatelineDiff != null) {
      _result.onlineDatelineDiff = onlineDatelineDiff;
    }
    if (job != null) {
      _result.job = job;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (title != null) {
      _result.title = title;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (blockUnAutherMessage != null) {
      _result.blockUnAutherMessage = blockUnAutherMessage;
    }
    if (position != null) {
      _result.position = position;
    }
    if (role != null) {
      _result.role = role;
    }
    if (vipLevel != null) {
      _result.vipLevel = vipLevel;
    }
    if (photos != null) {
      _result.photos.addAll(photos);
    }
    if (markName != null) {
      _result.markName = markName;
    }
    if (icongray != null) {
      _result.icongray = icongray;
    }
    if (topic != null) {
      _result.topic = topic;
    }
    if (needVerify != null) {
      _result.needVerify = needVerify;
    }
    if (needVerifyNew != null) {
      _result.needVerifyNew = needVerifyNew;
    }
    if (official != null) {
      _result.official = official;
    }
    if (isNewer != null) {
      _result.isNewer = isNewer;
    }
    if (popularityLevel != null) {
      _result.popularityLevel = popularityLevel;
    }
    if (followRelation != null) {
      _result.followRelation = followRelation;
    }
    if (fansNum != null) {
      _result.fansNum = fansNum;
    }
    if (distance != null) {
      _result.distance = distance;
    }
    if (accompanyNum != null) {
      _result.accompanyNum = accompanyNum;
    }
    if (newNoble != null) {
      _result.newNoble = newNoble;
    }
    if (authentication != null) {
      _result.authentication = authentication;
    }
    if (authenticationScore != null) {
      _result.authenticationScore = authenticationScore;
    }
    if (authenticationSign != null) {
      _result.authenticationSign = authenticationSign;
    }
    if (defendCount != null) {
      _result.defendCount = defendCount;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (virtualMan != null) {
      _result.virtualMan = virtualMan;
    }
    if (knightLevel != null) {
      _result.knightLevel = knightLevel;
    }
    if (liveLabelHeader != null) {
      _result.liveLabelHeader = liveLabelHeader;
    }
    if (liveLabelBubble != null) {
      _result.liveLabelBubble = liveLabelBubble;
    }
    if (liveLabelEffect != null) {
      _result.liveLabelEffect = liveLabelEffect;
    }
    if (liveOnly != null) {
      _result.liveOnly = liveOnly;
    }
    if (littleAlarm != null) {
      _result.littleAlarm = littleAlarm;
    }
    if (jukebox != null) {
      _result.jukebox = jukebox;
    }
    if (consumeLabel != null) {
      _result.consumeLabel = consumeLabel;
    }
    if (rechargeLabel != null) {
      _result.rechargeLabel = rechargeLabel;
    }
    if (starSinger != null) {
      _result.starSinger = starSinger;
    }
    if (starVerifyTag != null) {
      _result.starVerifyTag = starVerifyTag;
    }
    if (starVerifyDesc != null) {
      _result.starVerifyDesc = starVerifyDesc;
    }
    if (kaWhiteIcon != null) {
      _result.kaWhiteIcon = kaWhiteIcon;
    }
    if (artistWorth != null) {
      _result.artistWorth = artistWorth;
    }
    if (artistSignNum != null) {
      _result.artistSignNum = artistSignNum;
    }
    if (artistLevel != null) {
      _result.artistLevel = artistLevel;
    }
    if (agentLevel != null) {
      _result.agentLevel = agentLevel;
    }
    if (haveArtistNum != null) {
      _result.haveArtistNum = haveArtistNum;
    }
    if (sevenLoveTag != null) {
      _result.sevenLoveTag = sevenLoveTag;
    }
    if (agentIcon != null) {
      _result.agentIcon = agentIcon;
    }
    if (badgeIcons != null) {
      _result.badgeIcons.addAll(badgeIcons);
    }
    if (badgeIconInUse != null) {
      _result.badgeIconInUse = badgeIconInUse;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    if (prettyUid != null) {
      _result.prettyUid = prettyUid;
    }
    if (weekStar != null) {
      _result.weekStar = weekStar;
    }
    if (isThirdNewer != null) {
      _result.isThirdNewer = isThirdNewer;
    }
    if (ipLocation != null) {
      _result.ipLocation = ipLocation;
    }
    if (hasGodcard != null) {
      _result.hasGodcard = hasGodcard;
    }
    if (musicOrderCount != null) {
      _result.musicOrderCount = musicOrderCount;
    }
    if (hasCpHouse != null) {
      _result.hasCpHouse = hasCpHouse;
    }
    if (activityLevel != null) {
      _result.activityLevel = activityLevel;
    }
    if (activityLevelTitle != null) {
      _result.activityLevelTitle = activityLevelTitle;
    }
    if (activitySubLevel != null) {
      _result.activitySubLevel = activitySubLevel;
    }
    if (badges != null) {
      _result.badges.addAll(badges);
    }
    if (godcardBlock != null) {
      _result.godcardBlock = godcardBlock;
    }
    if (achieveWear != null) {
      _result.achieveWear = achieveWear;
    }
    if (canGameOrder != null) {
      _result.canGameOrder = canGameOrder;
    }
    if (holdHandIcon != null) {
      _result.holdHandIcon = holdHandIcon;
    }
    return _result;
  }
  factory HomeProfileBase.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileBase.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileBase clone() => HomeProfileBase()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileBase copyWith(void Function(HomeProfileBase) updates) =>
      super.copyWith((message) => updates(message as HomeProfileBase))
          as HomeProfileBase; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileBase create() => HomeProfileBase._();
  HomeProfileBase createEmptyInstance() => create();
  static $pb.PbList<HomeProfileBase> createRepeated() =>
      $pb.PbList<HomeProfileBase>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileBase getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileBase>(create);
  static HomeProfileBase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get age => $_getIZ(3);
  @$pb.TagNumber(4)
  set age($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAge() => $_has(3);
  @$pb.TagNumber(4)
  void clearAge() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get birthday => $_getSZ(4);
  @$pb.TagNumber(5)
  set birthday($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBirthday() => $_has(4);
  @$pb.TagNumber(5)
  void clearBirthday() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get sign => $_getSZ(5);
  @$pb.TagNumber(6)
  set sign($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSign() => $_has(5);
  @$pb.TagNumber(6)
  void clearSign() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get onlineStatus => $_getIZ(6);
  @$pb.TagNumber(7)
  set onlineStatus($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOnlineStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearOnlineStatus() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get dateline => $_getIZ(7);
  @$pb.TagNumber(8)
  set dateline($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDateline() => $_has(7);
  @$pb.TagNumber(8)
  void clearDateline() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get onlineDateline => $_getIZ(8);
  @$pb.TagNumber(9)
  set onlineDateline($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasOnlineDateline() => $_has(8);
  @$pb.TagNumber(9)
  void clearOnlineDateline() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get onlineDatelineDiff => $_getSZ(9);
  @$pb.TagNumber(10)
  set onlineDatelineDiff($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasOnlineDatelineDiff() => $_has(9);
  @$pb.TagNumber(10)
  void clearOnlineDatelineDiff() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get job => $_getIZ(10);
  @$pb.TagNumber(11)
  set job($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasJob() => $_has(10);
  @$pb.TagNumber(11)
  void clearJob() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get sex => $_getIZ(11);
  @$pb.TagNumber(12)
  set sex($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasSex() => $_has(11);
  @$pb.TagNumber(12)
  void clearSex() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get title => $_getIZ(12);
  @$pb.TagNumber(13)
  set title($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasTitle() => $_has(12);
  @$pb.TagNumber(13)
  void clearTitle() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get deleted => $_getIZ(13);
  @$pb.TagNumber(14)
  set deleted($core.int v) {
    $_setSignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasDeleted() => $_has(13);
  @$pb.TagNumber(14)
  void clearDeleted() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get blockUnAutherMessage => $_getIZ(14);
  @$pb.TagNumber(15)
  set blockUnAutherMessage($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasBlockUnAutherMessage() => $_has(14);
  @$pb.TagNumber(15)
  void clearBlockUnAutherMessage() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get position => $_getSZ(15);
  @$pb.TagNumber(16)
  set position($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasPosition() => $_has(15);
  @$pb.TagNumber(16)
  void clearPosition() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get role => $_getIZ(16);
  @$pb.TagNumber(17)
  set role($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasRole() => $_has(16);
  @$pb.TagNumber(17)
  void clearRole() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get vipLevel => $_getIZ(17);
  @$pb.TagNumber(18)
  set vipLevel($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasVipLevel() => $_has(17);
  @$pb.TagNumber(18)
  void clearVipLevel() => clearField(18);

  @$pb.TagNumber(19)
  $core.List<$core.String> get photos => $_getList(18);

  @$pb.TagNumber(20)
  $core.String get markName => $_getSZ(19);
  @$pb.TagNumber(20)
  set markName($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasMarkName() => $_has(19);
  @$pb.TagNumber(20)
  void clearMarkName() => clearField(20);

  @$pb.TagNumber(21)
  $core.bool get icongray => $_getBF(20);
  @$pb.TagNumber(21)
  set icongray($core.bool v) {
    $_setBool(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasIcongray() => $_has(20);
  @$pb.TagNumber(21)
  void clearIcongray() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get topic => $_getIZ(21);
  @$pb.TagNumber(22)
  set topic($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasTopic() => $_has(21);
  @$pb.TagNumber(22)
  void clearTopic() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get needVerify => $_getIZ(22);
  @$pb.TagNumber(23)
  set needVerify($core.int v) {
    $_setUnsignedInt32(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasNeedVerify() => $_has(22);
  @$pb.TagNumber(23)
  void clearNeedVerify() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get needVerifyNew => $_getIZ(23);
  @$pb.TagNumber(24)
  set needVerifyNew($core.int v) {
    $_setUnsignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasNeedVerifyNew() => $_has(23);
  @$pb.TagNumber(24)
  void clearNeedVerifyNew() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get official => $_getIZ(24);
  @$pb.TagNumber(25)
  set official($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasOfficial() => $_has(24);
  @$pb.TagNumber(25)
  void clearOfficial() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get isNewer => $_getIZ(25);
  @$pb.TagNumber(26)
  set isNewer($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasIsNewer() => $_has(25);
  @$pb.TagNumber(26)
  void clearIsNewer() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get popularityLevel => $_getIZ(26);
  @$pb.TagNumber(27)
  set popularityLevel($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasPopularityLevel() => $_has(26);
  @$pb.TagNumber(27)
  void clearPopularityLevel() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get followRelation => $_getIZ(27);
  @$pb.TagNumber(28)
  set followRelation($core.int v) {
    $_setUnsignedInt32(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasFollowRelation() => $_has(27);
  @$pb.TagNumber(28)
  void clearFollowRelation() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get fansNum => $_getIZ(28);
  @$pb.TagNumber(29)
  set fansNum($core.int v) {
    $_setUnsignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasFansNum() => $_has(28);
  @$pb.TagNumber(29)
  void clearFansNum() => clearField(29);

  @$pb.TagNumber(30)
  $core.String get distance => $_getSZ(29);
  @$pb.TagNumber(30)
  set distance($core.String v) {
    $_setString(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasDistance() => $_has(29);
  @$pb.TagNumber(30)
  void clearDistance() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get accompanyNum => $_getIZ(30);
  @$pb.TagNumber(31)
  set accompanyNum($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasAccompanyNum() => $_has(30);
  @$pb.TagNumber(31)
  void clearAccompanyNum() => clearField(31);

  @$pb.TagNumber(32)
  $core.int get newNoble => $_getIZ(31);
  @$pb.TagNumber(32)
  set newNoble($core.int v) {
    $_setUnsignedInt32(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasNewNoble() => $_has(31);
  @$pb.TagNumber(32)
  void clearNewNoble() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get authentication => $_getIZ(32);
  @$pb.TagNumber(33)
  set authentication($core.int v) {
    $_setUnsignedInt32(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasAuthentication() => $_has(32);
  @$pb.TagNumber(33)
  void clearAuthentication() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get authenticationScore => $_getIZ(33);
  @$pb.TagNumber(34)
  set authenticationScore($core.int v) {
    $_setUnsignedInt32(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasAuthenticationScore() => $_has(33);
  @$pb.TagNumber(34)
  void clearAuthenticationScore() => clearField(34);

  @$pb.TagNumber(35)
  $core.String get authenticationSign => $_getSZ(34);
  @$pb.TagNumber(35)
  set authenticationSign($core.String v) {
    $_setString(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasAuthenticationSign() => $_has(34);
  @$pb.TagNumber(35)
  void clearAuthenticationSign() => clearField(35);

  @$pb.TagNumber(36)
  $core.int get defendCount => $_getIZ(35);
  @$pb.TagNumber(36)
  set defendCount($core.int v) {
    $_setUnsignedInt32(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasDefendCount() => $_has(35);
  @$pb.TagNumber(36)
  void clearDefendCount() => clearField(36);

  @$pb.TagNumber(37)
  $core.String get frame => $_getSZ(36);
  @$pb.TagNumber(37)
  set frame($core.String v) {
    $_setString(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasFrame() => $_has(36);
  @$pb.TagNumber(37)
  void clearFrame() => clearField(37);

  @$pb.TagNumber(38)
  $core.int get virtualMan => $_getIZ(37);
  @$pb.TagNumber(38)
  set virtualMan($core.int v) {
    $_setUnsignedInt32(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasVirtualMan() => $_has(37);
  @$pb.TagNumber(38)
  void clearVirtualMan() => clearField(38);

  @$pb.TagNumber(39)
  $core.int get knightLevel => $_getIZ(38);
  @$pb.TagNumber(39)
  set knightLevel($core.int v) {
    $_setUnsignedInt32(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasKnightLevel() => $_has(38);
  @$pb.TagNumber(39)
  void clearKnightLevel() => clearField(39);

  @$pb.TagNumber(40)
  $core.String get liveLabelHeader => $_getSZ(39);
  @$pb.TagNumber(40)
  set liveLabelHeader($core.String v) {
    $_setString(39, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasLiveLabelHeader() => $_has(39);
  @$pb.TagNumber(40)
  void clearLiveLabelHeader() => clearField(40);

  @$pb.TagNumber(41)
  $core.String get liveLabelBubble => $_getSZ(40);
  @$pb.TagNumber(41)
  set liveLabelBubble($core.String v) {
    $_setString(40, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasLiveLabelBubble() => $_has(40);
  @$pb.TagNumber(41)
  void clearLiveLabelBubble() => clearField(41);

  @$pb.TagNumber(42)
  $core.String get liveLabelEffect => $_getSZ(41);
  @$pb.TagNumber(42)
  set liveLabelEffect($core.String v) {
    $_setString(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasLiveLabelEffect() => $_has(41);
  @$pb.TagNumber(42)
  void clearLiveLabelEffect() => clearField(42);

  @$pb.TagNumber(43)
  $core.int get liveOnly => $_getIZ(42);
  @$pb.TagNumber(43)
  set liveOnly($core.int v) {
    $_setUnsignedInt32(42, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasLiveOnly() => $_has(42);
  @$pb.TagNumber(43)
  void clearLiveOnly() => clearField(43);

  @$pb.TagNumber(44)
  $core.String get littleAlarm => $_getSZ(43);
  @$pb.TagNumber(44)
  set littleAlarm($core.String v) {
    $_setString(43, v);
  }

  @$pb.TagNumber(44)
  $core.bool hasLittleAlarm() => $_has(43);
  @$pb.TagNumber(44)
  void clearLittleAlarm() => clearField(44);

  @$pb.TagNumber(45)
  $core.String get jukebox => $_getSZ(44);
  @$pb.TagNumber(45)
  set jukebox($core.String v) {
    $_setString(44, v);
  }

  @$pb.TagNumber(45)
  $core.bool hasJukebox() => $_has(44);
  @$pb.TagNumber(45)
  void clearJukebox() => clearField(45);

  @$pb.TagNumber(46)
  $core.bool get consumeLabel => $_getBF(45);
  @$pb.TagNumber(46)
  set consumeLabel($core.bool v) {
    $_setBool(45, v);
  }

  @$pb.TagNumber(46)
  $core.bool hasConsumeLabel() => $_has(45);
  @$pb.TagNumber(46)
  void clearConsumeLabel() => clearField(46);

  @$pb.TagNumber(47)
  $core.bool get rechargeLabel => $_getBF(46);
  @$pb.TagNumber(47)
  set rechargeLabel($core.bool v) {
    $_setBool(46, v);
  }

  @$pb.TagNumber(47)
  $core.bool hasRechargeLabel() => $_has(46);
  @$pb.TagNumber(47)
  void clearRechargeLabel() => clearField(47);

  @$pb.TagNumber(48)
  $core.int get starSinger => $_getIZ(47);
  @$pb.TagNumber(48)
  set starSinger($core.int v) {
    $_setUnsignedInt32(47, v);
  }

  @$pb.TagNumber(48)
  $core.bool hasStarSinger() => $_has(47);
  @$pb.TagNumber(48)
  void clearStarSinger() => clearField(48);

  @$pb.TagNumber(49)
  $core.int get starVerifyTag => $_getIZ(48);
  @$pb.TagNumber(49)
  set starVerifyTag($core.int v) {
    $_setUnsignedInt32(48, v);
  }

  @$pb.TagNumber(49)
  $core.bool hasStarVerifyTag() => $_has(48);
  @$pb.TagNumber(49)
  void clearStarVerifyTag() => clearField(49);

  @$pb.TagNumber(50)
  $core.String get starVerifyDesc => $_getSZ(49);
  @$pb.TagNumber(50)
  set starVerifyDesc($core.String v) {
    $_setString(49, v);
  }

  @$pb.TagNumber(50)
  $core.bool hasStarVerifyDesc() => $_has(49);
  @$pb.TagNumber(50)
  void clearStarVerifyDesc() => clearField(50);

  @$pb.TagNumber(51)
  $core.bool get kaWhiteIcon => $_getBF(50);
  @$pb.TagNumber(51)
  set kaWhiteIcon($core.bool v) {
    $_setBool(50, v);
  }

  @$pb.TagNumber(51)
  $core.bool hasKaWhiteIcon() => $_has(50);
  @$pb.TagNumber(51)
  void clearKaWhiteIcon() => clearField(51);

  @$pb.TagNumber(52)
  $core.int get artistWorth => $_getIZ(51);
  @$pb.TagNumber(52)
  set artistWorth($core.int v) {
    $_setUnsignedInt32(51, v);
  }

  @$pb.TagNumber(52)
  $core.bool hasArtistWorth() => $_has(51);
  @$pb.TagNumber(52)
  void clearArtistWorth() => clearField(52);

  @$pb.TagNumber(53)
  $core.int get artistSignNum => $_getIZ(52);
  @$pb.TagNumber(53)
  set artistSignNum($core.int v) {
    $_setUnsignedInt32(52, v);
  }

  @$pb.TagNumber(53)
  $core.bool hasArtistSignNum() => $_has(52);
  @$pb.TagNumber(53)
  void clearArtistSignNum() => clearField(53);

  @$pb.TagNumber(54)
  $core.int get artistLevel => $_getIZ(53);
  @$pb.TagNumber(54)
  set artistLevel($core.int v) {
    $_setUnsignedInt32(53, v);
  }

  @$pb.TagNumber(54)
  $core.bool hasArtistLevel() => $_has(53);
  @$pb.TagNumber(54)
  void clearArtistLevel() => clearField(54);

  @$pb.TagNumber(55)
  $core.int get agentLevel => $_getIZ(54);
  @$pb.TagNumber(55)
  set agentLevel($core.int v) {
    $_setUnsignedInt32(54, v);
  }

  @$pb.TagNumber(55)
  $core.bool hasAgentLevel() => $_has(54);
  @$pb.TagNumber(55)
  void clearAgentLevel() => clearField(55);

  @$pb.TagNumber(56)
  $core.int get haveArtistNum => $_getIZ(55);
  @$pb.TagNumber(56)
  set haveArtistNum($core.int v) {
    $_setUnsignedInt32(55, v);
  }

  @$pb.TagNumber(56)
  $core.bool hasHaveArtistNum() => $_has(55);
  @$pb.TagNumber(56)
  void clearHaveArtistNum() => clearField(56);

  @$pb.TagNumber(57)
  $core.int get sevenLoveTag => $_getIZ(56);
  @$pb.TagNumber(57)
  set sevenLoveTag($core.int v) {
    $_setUnsignedInt32(56, v);
  }

  @$pb.TagNumber(57)
  $core.bool hasSevenLoveTag() => $_has(56);
  @$pb.TagNumber(57)
  void clearSevenLoveTag() => clearField(57);

  @$pb.TagNumber(58)
  $core.String get agentIcon => $_getSZ(57);
  @$pb.TagNumber(58)
  set agentIcon($core.String v) {
    $_setString(57, v);
  }

  @$pb.TagNumber(58)
  $core.bool hasAgentIcon() => $_has(57);
  @$pb.TagNumber(58)
  void clearAgentIcon() => clearField(58);

  @$pb.TagNumber(59)
  $core.List<$core.String> get badgeIcons => $_getList(58);

  @$pb.TagNumber(60)
  $core.String get badgeIconInUse => $_getSZ(59);
  @$pb.TagNumber(60)
  set badgeIconInUse($core.String v) {
    $_setString(59, v);
  }

  @$pb.TagNumber(60)
  $core.bool hasBadgeIconInUse() => $_has(59);
  @$pb.TagNumber(60)
  void clearBadgeIconInUse() => clearField(60);

  @$pb.TagNumber(61)
  $core.List<$core.String> get tags => $_getList(60);

  @$pb.TagNumber(62)
  $core.int get prettyUid => $_getIZ(61);
  @$pb.TagNumber(62)
  set prettyUid($core.int v) {
    $_setUnsignedInt32(61, v);
  }

  @$pb.TagNumber(62)
  $core.bool hasPrettyUid() => $_has(61);
  @$pb.TagNumber(62)
  void clearPrettyUid() => clearField(62);

  @$pb.TagNumber(63)
  $core.int get weekStar => $_getIZ(62);
  @$pb.TagNumber(63)
  set weekStar($core.int v) {
    $_setUnsignedInt32(62, v);
  }

  @$pb.TagNumber(63)
  $core.bool hasWeekStar() => $_has(62);
  @$pb.TagNumber(63)
  void clearWeekStar() => clearField(63);

  @$pb.TagNumber(64)
  $core.int get isThirdNewer => $_getIZ(63);
  @$pb.TagNumber(64)
  set isThirdNewer($core.int v) {
    $_setUnsignedInt32(63, v);
  }

  @$pb.TagNumber(64)
  $core.bool hasIsThirdNewer() => $_has(63);
  @$pb.TagNumber(64)
  void clearIsThirdNewer() => clearField(64);

  @$pb.TagNumber(65)
  $core.String get ipLocation => $_getSZ(64);
  @$pb.TagNumber(65)
  set ipLocation($core.String v) {
    $_setString(64, v);
  }

  @$pb.TagNumber(65)
  $core.bool hasIpLocation() => $_has(64);
  @$pb.TagNumber(65)
  void clearIpLocation() => clearField(65);

  @$pb.TagNumber(66)
  $core.bool get hasGodcard => $_getBF(65);
  @$pb.TagNumber(66)
  set hasGodcard($core.bool v) {
    $_setBool(65, v);
  }

  @$pb.TagNumber(66)
  $core.bool hasHasGodcard() => $_has(65);
  @$pb.TagNumber(66)
  void clearHasGodcard() => clearField(66);

  @$pb.TagNumber(67)
  $core.int get musicOrderCount => $_getIZ(66);
  @$pb.TagNumber(67)
  set musicOrderCount($core.int v) {
    $_setUnsignedInt32(66, v);
  }

  @$pb.TagNumber(67)
  $core.bool hasMusicOrderCount() => $_has(66);
  @$pb.TagNumber(67)
  void clearMusicOrderCount() => clearField(67);

  @$pb.TagNumber(68)
  $core.bool get hasCpHouse => $_getBF(67);
  @$pb.TagNumber(68)
  set hasCpHouse($core.bool v) {
    $_setBool(67, v);
  }

  @$pb.TagNumber(68)
  $core.bool hasHasCpHouse() => $_has(67);
  @$pb.TagNumber(68)
  void clearHasCpHouse() => clearField(68);

  @$pb.TagNumber(69)
  $core.int get activityLevel => $_getIZ(68);
  @$pb.TagNumber(69)
  set activityLevel($core.int v) {
    $_setUnsignedInt32(68, v);
  }

  @$pb.TagNumber(69)
  $core.bool hasActivityLevel() => $_has(68);
  @$pb.TagNumber(69)
  void clearActivityLevel() => clearField(69);

  @$pb.TagNumber(70)
  $core.String get activityLevelTitle => $_getSZ(69);
  @$pb.TagNumber(70)
  set activityLevelTitle($core.String v) {
    $_setString(69, v);
  }

  @$pb.TagNumber(70)
  $core.bool hasActivityLevelTitle() => $_has(69);
  @$pb.TagNumber(70)
  void clearActivityLevelTitle() => clearField(70);

  @$pb.TagNumber(71)
  $core.int get activitySubLevel => $_getIZ(70);
  @$pb.TagNumber(71)
  set activitySubLevel($core.int v) {
    $_setUnsignedInt32(70, v);
  }

  @$pb.TagNumber(71)
  $core.bool hasActivitySubLevel() => $_has(70);
  @$pb.TagNumber(71)
  void clearActivitySubLevel() => clearField(71);

  @$pb.TagNumber(72)
  $core.List<HomeProfileBadgeItem> get badges => $_getList(71);

  @$pb.TagNumber(73)
  $core.int get godcardBlock => $_getIZ(72);
  @$pb.TagNumber(73)
  set godcardBlock($core.int v) {
    $_setUnsignedInt32(72, v);
  }

  @$pb.TagNumber(73)
  $core.bool hasGodcardBlock() => $_has(72);
  @$pb.TagNumber(73)
  void clearGodcardBlock() => clearField(73);

  @$pb.TagNumber(74)
  HomeProfileAchieveBadge get achieveWear => $_getN(73);
  @$pb.TagNumber(74)
  set achieveWear(HomeProfileAchieveBadge v) {
    setField(74, v);
  }

  @$pb.TagNumber(74)
  $core.bool hasAchieveWear() => $_has(73);
  @$pb.TagNumber(74)
  void clearAchieveWear() => clearField(74);
  @$pb.TagNumber(74)
  HomeProfileAchieveBadge ensureAchieveWear() => $_ensure(73);

  @$pb.TagNumber(75)
  $core.bool get canGameOrder => $_getBF(74);
  @$pb.TagNumber(75)
  set canGameOrder($core.bool v) {
    $_setBool(74, v);
  }

  @$pb.TagNumber(75)
  $core.bool hasCanGameOrder() => $_has(74);
  @$pb.TagNumber(75)
  void clearCanGameOrder() => clearField(75);

  @$pb.TagNumber(76)
  $core.String get holdHandIcon => $_getSZ(75);
  @$pb.TagNumber(76)
  set holdHandIcon($core.String v) {
    $_setString(75, v);
  }

  @$pb.TagNumber(76)
  $core.bool hasHoldHandIcon() => $_has(75);
  @$pb.TagNumber(76)
  void clearHoldHandIcon() => clearField(76);
}

class HomeProfileViability extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileViability',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainLevel',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subLevel',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  HomeProfileViability._() : super();
  factory HomeProfileViability({
    $core.String? title,
    $core.int? mainLevel,
    $core.int? subLevel,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (mainLevel != null) {
      _result.mainLevel = mainLevel;
    }
    if (subLevel != null) {
      _result.subLevel = subLevel;
    }
    return _result;
  }
  factory HomeProfileViability.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileViability.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileViability clone() =>
      HomeProfileViability()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileViability copyWith(void Function(HomeProfileViability) updates) =>
      super.copyWith((message) => updates(message as HomeProfileViability))
          as HomeProfileViability; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileViability create() => HomeProfileViability._();
  HomeProfileViability createEmptyInstance() => create();
  static $pb.PbList<HomeProfileViability> createRepeated() =>
      $pb.PbList<HomeProfileViability>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileViability getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileViability>(create);
  static HomeProfileViability? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get mainLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set mainLevel($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMainLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearMainLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get subLevel => $_getIZ(2);
  @$pb.TagNumber(3)
  set subLevel($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSubLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubLevel() => clearField(3);
}

class HomeProfileSkillPrice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileSkillPrice',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uint')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cheap',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  HomeProfileSkillPrice._() : super();
  factory HomeProfileSkillPrice({
    $core.String? uint,
    $core.int? price,
    $core.int? cheap,
  }) {
    final _result = create();
    if (uint != null) {
      _result.uint = uint;
    }
    if (price != null) {
      _result.price = price;
    }
    if (cheap != null) {
      _result.cheap = cheap;
    }
    return _result;
  }
  factory HomeProfileSkillPrice.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileSkillPrice.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileSkillPrice clone() =>
      HomeProfileSkillPrice()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileSkillPrice copyWith(
          void Function(HomeProfileSkillPrice) updates) =>
      super.copyWith((message) => updates(message as HomeProfileSkillPrice))
          as HomeProfileSkillPrice; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileSkillPrice create() => HomeProfileSkillPrice._();
  HomeProfileSkillPrice createEmptyInstance() => create();
  static $pb.PbList<HomeProfileSkillPrice> createRepeated() =>
      $pb.PbList<HomeProfileSkillPrice>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileSkillPrice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileSkillPrice>(create);
  static HomeProfileSkillPrice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uint => $_getSZ(0);
  @$pb.TagNumber(1)
  set uint($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUint() => $_has(0);
  @$pb.TagNumber(1)
  void clearUint() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get price => $_getIZ(1);
  @$pb.TagNumber(2)
  set price($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get cheap => $_getIZ(2);
  @$pb.TagNumber(3)
  set cheap($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCheap() => $_has(2);
  @$pb.TagNumber(3)
  void clearCheap() => clearField(3);
}

class HomeProfileSkill extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileSkill',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Level')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isDefault',
        $pb.PbFieldType.O3)
    ..pc<HomeProfileSkillPrice>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileSkillPrice.create)
    ..pPS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userGodTagList')
    ..hasRequiredFields = false;

  HomeProfileSkill._() : super();
  factory HomeProfileSkill({
    $core.int? cid,
    $core.String? name,
    $core.String? icon,
    $core.String? level,
    $core.int? num,
    $core.int? isDefault,
    $core.Iterable<HomeProfileSkillPrice>? price,
    $core.Iterable<$core.String>? userGodTagList,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (level != null) {
      _result.level = level;
    }
    if (num != null) {
      _result.num = num;
    }
    if (isDefault != null) {
      _result.isDefault = isDefault;
    }
    if (price != null) {
      _result.price.addAll(price);
    }
    if (userGodTagList != null) {
      _result.userGodTagList.addAll(userGodTagList);
    }
    return _result;
  }
  factory HomeProfileSkill.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileSkill.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileSkill clone() => HomeProfileSkill()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileSkill copyWith(void Function(HomeProfileSkill) updates) =>
      super.copyWith((message) => updates(message as HomeProfileSkill))
          as HomeProfileSkill; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileSkill create() => HomeProfileSkill._();
  HomeProfileSkill createEmptyInstance() => create();
  static $pb.PbList<HomeProfileSkill> createRepeated() =>
      $pb.PbList<HomeProfileSkill>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileSkill getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileSkill>(create);
  static HomeProfileSkill? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get level => $_getSZ(3);
  @$pb.TagNumber(4)
  set level($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get num => $_getIZ(4);
  @$pb.TagNumber(5)
  set num($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get isDefault => $_getIZ(5);
  @$pb.TagNumber(6)
  set isDefault($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIsDefault() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsDefault() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<HomeProfileSkillPrice> get price => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.String> get userGodTagList => $_getList(7);
}

class HomeProfileGod extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileGod',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godCategory')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'servicePause',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serviceBusy',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'creditGodLevel',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  HomeProfileGod._() : super();
  factory HomeProfileGod({
    $core.int? godNum,
    $core.String? godCategory,
    $core.int? servicePause,
    $core.int? serviceBusy,
    $core.int? creditGodLevel,
  }) {
    final _result = create();
    if (godNum != null) {
      _result.godNum = godNum;
    }
    if (godCategory != null) {
      _result.godCategory = godCategory;
    }
    if (servicePause != null) {
      _result.servicePause = servicePause;
    }
    if (serviceBusy != null) {
      _result.serviceBusy = serviceBusy;
    }
    if (creditGodLevel != null) {
      _result.creditGodLevel = creditGodLevel;
    }
    return _result;
  }
  factory HomeProfileGod.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileGod.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileGod clone() => HomeProfileGod()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileGod copyWith(void Function(HomeProfileGod) updates) =>
      super.copyWith((message) => updates(message as HomeProfileGod))
          as HomeProfileGod; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileGod create() => HomeProfileGod._();
  HomeProfileGod createEmptyInstance() => create();
  static $pb.PbList<HomeProfileGod> createRepeated() =>
      $pb.PbList<HomeProfileGod>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileGod getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileGod>(create);
  static HomeProfileGod? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get godNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set godNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGodNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearGodNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get godCategory => $_getSZ(1);
  @$pb.TagNumber(2)
  set godCategory($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGodCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearGodCategory() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get servicePause => $_getIZ(2);
  @$pb.TagNumber(3)
  set servicePause($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasServicePause() => $_has(2);
  @$pb.TagNumber(3)
  void clearServicePause() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get serviceBusy => $_getIZ(3);
  @$pb.TagNumber(4)
  set serviceBusy($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasServiceBusy() => $_has(3);
  @$pb.TagNumber(4)
  void clearServiceBusy() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get creditGodLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set creditGodLevel($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCreditGodLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreditGodLevel() => clearField(5);
}

class HomeProfileRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileRoom',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.O3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'property')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onmicNum',
        $pb.PbFieldType.O3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'settlementChannel')
    ..hasRequiredFields = false;

  HomeProfileRoom._() : super();
  factory HomeProfileRoom({
    $core.int? rid,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? property,
    $core.int? onmicNum,
    $core.String? role,
    $core.String? label,
    $core.String? settlementChannel,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (property != null) {
      _result.property = property;
    }
    if (onmicNum != null) {
      _result.onmicNum = onmicNum;
    }
    if (role != null) {
      _result.role = role;
    }
    if (label != null) {
      _result.label = label;
    }
    if (settlementChannel != null) {
      _result.settlementChannel = settlementChannel;
    }
    return _result;
  }
  factory HomeProfileRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileRoom clone() => HomeProfileRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileRoom copyWith(void Function(HomeProfileRoom) updates) =>
      super.copyWith((message) => updates(message as HomeProfileRoom))
          as HomeProfileRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileRoom create() => HomeProfileRoom._();
  HomeProfileRoom createEmptyInstance() => create();
  static $pb.PbList<HomeProfileRoom> createRepeated() =>
      $pb.PbList<HomeProfileRoom>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileRoom>(create);
  static HomeProfileRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get uid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uid($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get property => $_getSZ(4);
  @$pb.TagNumber(5)
  set property($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasProperty() => $_has(4);
  @$pb.TagNumber(5)
  void clearProperty() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get onmicNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set onmicNum($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOnmicNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnmicNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get role => $_getSZ(6);
  @$pb.TagNumber(7)
  set role($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRole() => $_has(6);
  @$pb.TagNumber(7)
  void clearRole() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get label => $_getSZ(7);
  @$pb.TagNumber(8)
  set label($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLabel() => $_has(7);
  @$pb.TagNumber(8)
  void clearLabel() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get settlementChannel => $_getSZ(8);
  @$pb.TagNumber(9)
  set settlementChannel($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSettlementChannel() => $_has(8);
  @$pb.TagNumber(9)
  void clearSettlementChannel() => clearField(9);
}

class HomeProfileGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HomeProfileGift._() : super();
  factory HomeProfileGift({
    $core.int? gid,
    $core.int? num,
    $core.String? name,
    $core.int? sum,
  }) {
    final _result = create();
    if (gid != null) {
      _result.gid = gid;
    }
    if (num != null) {
      _result.num = num;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sum != null) {
      _result.sum = sum;
    }
    return _result;
  }
  factory HomeProfileGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileGift clone() => HomeProfileGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileGift copyWith(void Function(HomeProfileGift) updates) =>
      super.copyWith((message) => updates(message as HomeProfileGift))
          as HomeProfileGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileGift create() => HomeProfileGift._();
  HomeProfileGift createEmptyInstance() => create();
  static $pb.PbList<HomeProfileGift> createRepeated() =>
      $pb.PbList<HomeProfileGift>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileGift>(create);
  static HomeProfileGift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gid => $_getIZ(0);
  @$pb.TagNumber(1)
  set gid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGid() => $_has(0);
  @$pb.TagNumber(1)
  void clearGid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get num => $_getIZ(1);
  @$pb.TagNumber(2)
  set num($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get sum => $_getIZ(3);
  @$pb.TagNumber(4)
  set sum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSum() => $_has(3);
  @$pb.TagNumber(4)
  void clearSum() => clearField(4);
}

class HomeProfileTagItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileTagItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  HomeProfileTagItem._() : super();
  factory HomeProfileTagItem({
    $core.int? id,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory HomeProfileTagItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileTagItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileTagItem clone() => HomeProfileTagItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileTagItem copyWith(void Function(HomeProfileTagItem) updates) =>
      super.copyWith((message) => updates(message as HomeProfileTagItem))
          as HomeProfileTagItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileTagItem create() => HomeProfileTagItem._();
  HomeProfileTagItem createEmptyInstance() => create();
  static $pb.PbList<HomeProfileTagItem> createRepeated() =>
      $pb.PbList<HomeProfileTagItem>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileTagItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileTagItem>(create);
  static HomeProfileTagItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class HomeProfileTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<HomeProfileTagItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friendTags',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileTagItem.create)
    ..pc<HomeProfileTagItem>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tags',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileTagItem.create)
    ..hasRequiredFields = false;

  HomeProfileTag._() : super();
  factory HomeProfileTag({
    $core.Iterable<HomeProfileTagItem>? friendTags,
    $core.Iterable<HomeProfileTagItem>? tags,
  }) {
    final _result = create();
    if (friendTags != null) {
      _result.friendTags.addAll(friendTags);
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    return _result;
  }
  factory HomeProfileTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileTag clone() => HomeProfileTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileTag copyWith(void Function(HomeProfileTag) updates) =>
      super.copyWith((message) => updates(message as HomeProfileTag))
          as HomeProfileTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileTag create() => HomeProfileTag._();
  HomeProfileTag createEmptyInstance() => create();
  static $pb.PbList<HomeProfileTag> createRepeated() =>
      $pb.PbList<HomeProfileTag>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileTag>(create);
  static HomeProfileTag? _defaultInstance;

  @$pb.TagNumber(5)
  $core.List<HomeProfileTagItem> get friendTags => $_getList(0);

  @$pb.TagNumber(6)
  $core.List<HomeProfileTagItem> get tags => $_getList(1);
}

class HomeProfileDisciple extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileDisciple',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline',
        $pb.PbFieldType.O3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDatelineDiff')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'togetherDays',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nowExp',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nexExp',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  HomeProfileDisciple._() : super();
  factory HomeProfileDisciple({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.int? onlineStatus,
    $core.int? onlineDateline,
    $core.String? onlineDatelineDiff,
    $core.int? age,
    $core.int? togetherDays,
    $core.int? nowExp,
    $core.int? nexExp,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (onlineDatelineDiff != null) {
      _result.onlineDatelineDiff = onlineDatelineDiff;
    }
    if (age != null) {
      _result.age = age;
    }
    if (togetherDays != null) {
      _result.togetherDays = togetherDays;
    }
    if (nowExp != null) {
      _result.nowExp = nowExp;
    }
    if (nexExp != null) {
      _result.nexExp = nexExp;
    }
    return _result;
  }
  factory HomeProfileDisciple.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileDisciple.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileDisciple clone() => HomeProfileDisciple()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileDisciple copyWith(void Function(HomeProfileDisciple) updates) =>
      super.copyWith((message) => updates(message as HomeProfileDisciple))
          as HomeProfileDisciple; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileDisciple create() => HomeProfileDisciple._();
  HomeProfileDisciple createEmptyInstance() => create();
  static $pb.PbList<HomeProfileDisciple> createRepeated() =>
      $pb.PbList<HomeProfileDisciple>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileDisciple getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileDisciple>(create);
  static HomeProfileDisciple? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get sex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sex($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get onlineStatus => $_getIZ(4);
  @$pb.TagNumber(5)
  set onlineStatus($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOnlineStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get onlineDateline => $_getIZ(5);
  @$pb.TagNumber(6)
  set onlineDateline($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOnlineDateline() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnlineDateline() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get onlineDatelineDiff => $_getSZ(6);
  @$pb.TagNumber(7)
  set onlineDatelineDiff($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOnlineDatelineDiff() => $_has(6);
  @$pb.TagNumber(7)
  void clearOnlineDatelineDiff() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get age => $_getIZ(7);
  @$pb.TagNumber(8)
  set age($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAge() => $_has(7);
  @$pb.TagNumber(8)
  void clearAge() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get togetherDays => $_getIZ(8);
  @$pb.TagNumber(9)
  set togetherDays($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTogetherDays() => $_has(8);
  @$pb.TagNumber(9)
  void clearTogetherDays() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get nowExp => $_getIZ(9);
  @$pb.TagNumber(10)
  set nowExp($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasNowExp() => $_has(9);
  @$pb.TagNumber(10)
  void clearNowExp() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get nexExp => $_getIZ(10);
  @$pb.TagNumber(11)
  set nexExp($core.int v) {
    $_setSignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasNexExp() => $_has(10);
  @$pb.TagNumber(11)
  void clearNexExp() => clearField(11);
}

class HomeProfileMentor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileMentor',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'togetherDays',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'famousMentorLevel',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'notGraduateNum',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalDiscipleNum',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  HomeProfileMentor._() : super();
  factory HomeProfileMentor({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.int? age,
    $core.int? togetherDays,
    $core.int? famousMentorLevel,
    $core.int? notGraduateNum,
    $core.int? totalDiscipleNum,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (age != null) {
      _result.age = age;
    }
    if (togetherDays != null) {
      _result.togetherDays = togetherDays;
    }
    if (famousMentorLevel != null) {
      _result.famousMentorLevel = famousMentorLevel;
    }
    if (notGraduateNum != null) {
      _result.notGraduateNum = notGraduateNum;
    }
    if (totalDiscipleNum != null) {
      _result.totalDiscipleNum = totalDiscipleNum;
    }
    return _result;
  }
  factory HomeProfileMentor.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileMentor.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileMentor clone() => HomeProfileMentor()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileMentor copyWith(void Function(HomeProfileMentor) updates) =>
      super.copyWith((message) => updates(message as HomeProfileMentor))
          as HomeProfileMentor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileMentor create() => HomeProfileMentor._();
  HomeProfileMentor createEmptyInstance() => create();
  static $pb.PbList<HomeProfileMentor> createRepeated() =>
      $pb.PbList<HomeProfileMentor>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileMentor getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileMentor>(create);
  static HomeProfileMentor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get sex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sex($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get age => $_getIZ(4);
  @$pb.TagNumber(5)
  set age($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAge() => $_has(4);
  @$pb.TagNumber(5)
  void clearAge() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get togetherDays => $_getIZ(5);
  @$pb.TagNumber(6)
  set togetherDays($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTogetherDays() => $_has(5);
  @$pb.TagNumber(6)
  void clearTogetherDays() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get famousMentorLevel => $_getIZ(6);
  @$pb.TagNumber(7)
  set famousMentorLevel($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasFamousMentorLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearFamousMentorLevel() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get notGraduateNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set notGraduateNum($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasNotGraduateNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearNotGraduateNum() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get totalDiscipleNum => $_getIZ(8);
  @$pb.TagNumber(9)
  set totalDiscipleNum($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTotalDiscipleNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalDiscipleNum() => clearField(9);
}

class HomeProfileFleet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileFleet',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gid',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'creator',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'in',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  HomeProfileFleet._() : super();
  factory HomeProfileFleet({
    $core.int? gid,
    $core.String? name,
    $core.String? icon,
    $core.int? total,
    $core.int? creator,
    $core.int? in_6,
  }) {
    final _result = create();
    if (gid != null) {
      _result.gid = gid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (total != null) {
      _result.total = total;
    }
    if (creator != null) {
      _result.creator = creator;
    }
    if (in_6 != null) {
      _result.in_6 = in_6;
    }
    return _result;
  }
  factory HomeProfileFleet.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileFleet.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileFleet clone() => HomeProfileFleet()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileFleet copyWith(void Function(HomeProfileFleet) updates) =>
      super.copyWith((message) => updates(message as HomeProfileFleet))
          as HomeProfileFleet; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileFleet create() => HomeProfileFleet._();
  HomeProfileFleet createEmptyInstance() => create();
  static $pb.PbList<HomeProfileFleet> createRepeated() =>
      $pb.PbList<HomeProfileFleet>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileFleet getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileFleet>(create);
  static HomeProfileFleet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gid => $_getIZ(0);
  @$pb.TagNumber(1)
  set gid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGid() => $_has(0);
  @$pb.TagNumber(1)
  void clearGid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get total => $_getIZ(3);
  @$pb.TagNumber(4)
  set total($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTotal() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotal() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get creator => $_getIZ(4);
  @$pb.TagNumber(5)
  set creator($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCreator() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreator() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get in_6 => $_getIZ(5);
  @$pb.TagNumber(6)
  set in_6($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIn_6() => $_has(5);
  @$pb.TagNumber(6)
  void clearIn_6() => clearField(6);
}

class HomeProfileCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileCard',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audio')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hometownCity')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hometownCityCode',
        $pb.PbFieldType.O3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'likedNum',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.O3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'industry')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'education')
    ..hasRequiredFields = false;

  HomeProfileCard._() : super();
  factory HomeProfileCard({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? desc,
    $core.String? audio,
    $core.String? hometownCity,
    $core.int? hometownCityCode,
    $core.String? duration,
    $core.int? age,
    $core.int? likedNum,
    $core.int? height,
    $core.String? industry,
    $core.String? education,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (audio != null) {
      _result.audio = audio;
    }
    if (hometownCity != null) {
      _result.hometownCity = hometownCity;
    }
    if (hometownCityCode != null) {
      _result.hometownCityCode = hometownCityCode;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (age != null) {
      _result.age = age;
    }
    if (likedNum != null) {
      _result.likedNum = likedNum;
    }
    if (height != null) {
      _result.height = height;
    }
    if (industry != null) {
      _result.industry = industry;
    }
    if (education != null) {
      _result.education = education;
    }
    return _result;
  }
  factory HomeProfileCard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileCard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileCard clone() => HomeProfileCard()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileCard copyWith(void Function(HomeProfileCard) updates) =>
      super.copyWith((message) => updates(message as HomeProfileCard))
          as HomeProfileCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileCard create() => HomeProfileCard._();
  HomeProfileCard createEmptyInstance() => create();
  static $pb.PbList<HomeProfileCard> createRepeated() =>
      $pb.PbList<HomeProfileCard>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileCard>(create);
  static HomeProfileCard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get audio => $_getSZ(4);
  @$pb.TagNumber(5)
  set audio($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAudio() => $_has(4);
  @$pb.TagNumber(5)
  void clearAudio() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get hometownCity => $_getSZ(5);
  @$pb.TagNumber(6)
  set hometownCity($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHometownCity() => $_has(5);
  @$pb.TagNumber(6)
  void clearHometownCity() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get hometownCityCode => $_getIZ(6);
  @$pb.TagNumber(7)
  set hometownCityCode($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasHometownCityCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearHometownCityCode() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get duration => $_getSZ(7);
  @$pb.TagNumber(8)
  set duration($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDuration() => $_has(7);
  @$pb.TagNumber(8)
  void clearDuration() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get age => $_getIZ(8);
  @$pb.TagNumber(9)
  set age($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAge() => $_has(8);
  @$pb.TagNumber(9)
  void clearAge() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get likedNum => $_getIZ(9);
  @$pb.TagNumber(10)
  set likedNum($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasLikedNum() => $_has(9);
  @$pb.TagNumber(10)
  void clearLikedNum() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get height => $_getIZ(10);
  @$pb.TagNumber(11)
  set height($core.int v) {
    $_setSignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasHeight() => $_has(10);
  @$pb.TagNumber(11)
  void clearHeight() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get industry => $_getSZ(11);
  @$pb.TagNumber(12)
  set industry($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasIndustry() => $_has(11);
  @$pb.TagNumber(12)
  void clearIndustry() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get education => $_getSZ(12);
  @$pb.TagNumber(13)
  set education($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasEducation() => $_has(12);
  @$pb.TagNumber(13)
  void clearEducation() => clearField(13);
}

class HomeProfileDefend extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileDefend',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendValue',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expire',
        $pb.PbFieldType.O3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'borderIndex',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  HomeProfileDefend._() : super();
  factory HomeProfileDefend({
    $core.int? uid,
    $core.String? title,
    $core.int? defendValue,
    $core.int? position,
    $core.int? expire,
    $core.String? name,
    $core.String? icon,
    $core.int? borderIndex,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (title != null) {
      _result.title = title;
    }
    if (defendValue != null) {
      _result.defendValue = defendValue;
    }
    if (position != null) {
      _result.position = position;
    }
    if (expire != null) {
      _result.expire = expire;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (borderIndex != null) {
      _result.borderIndex = borderIndex;
    }
    return _result;
  }
  factory HomeProfileDefend.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileDefend.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileDefend clone() => HomeProfileDefend()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileDefend copyWith(void Function(HomeProfileDefend) updates) =>
      super.copyWith((message) => updates(message as HomeProfileDefend))
          as HomeProfileDefend; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileDefend create() => HomeProfileDefend._();
  HomeProfileDefend createEmptyInstance() => create();
  static $pb.PbList<HomeProfileDefend> createRepeated() =>
      $pb.PbList<HomeProfileDefend>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileDefend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileDefend>(create);
  static HomeProfileDefend? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get defendValue => $_getIZ(2);
  @$pb.TagNumber(3)
  set defendValue($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDefendValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearDefendValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get position => $_getIZ(3);
  @$pb.TagNumber(4)
  set position($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearPosition() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get expire => $_getIZ(4);
  @$pb.TagNumber(5)
  set expire($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasExpire() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpire() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get icon => $_getSZ(6);
  @$pb.TagNumber(7)
  set icon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get borderIndex => $_getIZ(7);
  @$pb.TagNumber(8)
  set borderIndex($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasBorderIndex() => $_has(7);
  @$pb.TagNumber(8)
  void clearBorderIndex() => clearField(8);
}

class HomeProfileUnion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileUnion',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unId',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createUid',
        $pb.PbFieldType.O3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logo')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userTitle')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleName')
    ..hasRequiredFields = false;

  HomeProfileUnion._() : super();
  factory HomeProfileUnion({
    $core.int? unId,
    $core.String? name,
    $core.int? createUid,
    $core.String? logo,
    $core.String? userTitle,
    $core.String? titleName,
  }) {
    final _result = create();
    if (unId != null) {
      _result.unId = unId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (createUid != null) {
      _result.createUid = createUid;
    }
    if (logo != null) {
      _result.logo = logo;
    }
    if (userTitle != null) {
      _result.userTitle = userTitle;
    }
    if (titleName != null) {
      _result.titleName = titleName;
    }
    return _result;
  }
  factory HomeProfileUnion.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileUnion.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileUnion clone() => HomeProfileUnion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileUnion copyWith(void Function(HomeProfileUnion) updates) =>
      super.copyWith((message) => updates(message as HomeProfileUnion))
          as HomeProfileUnion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileUnion create() => HomeProfileUnion._();
  HomeProfileUnion createEmptyInstance() => create();
  static $pb.PbList<HomeProfileUnion> createRepeated() =>
      $pb.PbList<HomeProfileUnion>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileUnion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileUnion>(create);
  static HomeProfileUnion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get unId => $_getIZ(0);
  @$pb.TagNumber(1)
  set unId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUnId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get createUid => $_getIZ(2);
  @$pb.TagNumber(3)
  set createUid($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCreateUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreateUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get logo => $_getSZ(3);
  @$pb.TagNumber(4)
  set logo($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLogo() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogo() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userTitle => $_getSZ(4);
  @$pb.TagNumber(5)
  set userTitle($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUserTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserTitle() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get titleName => $_getSZ(5);
  @$pb.TagNumber(6)
  set titleName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTitleName() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitleName() => clearField(6);
}

class HomeProfileDecorate_ImageText extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileDecorate.ImageText',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'text')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..hasRequiredFields = false;

  HomeProfileDecorate_ImageText._() : super();
  factory HomeProfileDecorate_ImageText({
    $core.String? text,
    $core.String? image,
  }) {
    final _result = create();
    if (text != null) {
      _result.text = text;
    }
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory HomeProfileDecorate_ImageText.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileDecorate_ImageText.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileDecorate_ImageText clone() =>
      HomeProfileDecorate_ImageText()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileDecorate_ImageText copyWith(
          void Function(HomeProfileDecorate_ImageText) updates) =>
      super.copyWith(
              (message) => updates(message as HomeProfileDecorate_ImageText))
          as HomeProfileDecorate_ImageText; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileDecorate_ImageText create() =>
      HomeProfileDecorate_ImageText._();
  HomeProfileDecorate_ImageText createEmptyInstance() => create();
  static $pb.PbList<HomeProfileDecorate_ImageText> createRepeated() =>
      $pb.PbList<HomeProfileDecorate_ImageText>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileDecorate_ImageText getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileDecorate_ImageText>(create);
  static HomeProfileDecorate_ImageText? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(2)
  set image($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);
}

class HomeProfileDecorate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileDecorate',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapSize',
        $pb.PbFieldType.O3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showType',
        $pb.PbFieldType.OU3)
    ..pc<HomeProfileDecorate_ImageText>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageText',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileDecorate_ImageText.create)
    ..hasRequiredFields = false;

  HomeProfileDecorate._() : super();
  factory HomeProfileDecorate({
    $core.int? giftId,
    $core.int? vapSize,
    $core.String? image,
    $core.int? showType,
    $core.Iterable<HomeProfileDecorate_ImageText>? imageText,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    if (image != null) {
      _result.image = image;
    }
    if (showType != null) {
      _result.showType = showType;
    }
    if (imageText != null) {
      _result.imageText.addAll(imageText);
    }
    return _result;
  }
  factory HomeProfileDecorate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileDecorate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileDecorate clone() => HomeProfileDecorate()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileDecorate copyWith(void Function(HomeProfileDecorate) updates) =>
      super.copyWith((message) => updates(message as HomeProfileDecorate))
          as HomeProfileDecorate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileDecorate create() => HomeProfileDecorate._();
  HomeProfileDecorate createEmptyInstance() => create();
  static $pb.PbList<HomeProfileDecorate> createRepeated() =>
      $pb.PbList<HomeProfileDecorate>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileDecorate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileDecorate>(create);
  static HomeProfileDecorate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get vapSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set vapSize($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVapSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearVapSize() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get image => $_getSZ(2);
  @$pb.TagNumber(3)
  set image($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get showType => $_getIZ(3);
  @$pb.TagNumber(4)
  set showType($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasShowType() => $_has(3);
  @$pb.TagNumber(4)
  void clearShowType() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<HomeProfileDecorate_ImageText> get imageText => $_getList(4);
}

class HomeProfilePartyGroup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfilePartyGroup',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cover')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'memberNum')
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'official')
    ..hasRequiredFields = false;

  HomeProfilePartyGroup._() : super();
  factory HomeProfilePartyGroup({
    $core.int? groupId,
    $core.String? name,
    $core.String? cover,
    $core.String? memberNum,
    $core.bool? official,
  }) {
    final _result = create();
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (memberNum != null) {
      _result.memberNum = memberNum;
    }
    if (official != null) {
      _result.official = official;
    }
    return _result;
  }
  factory HomeProfilePartyGroup.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfilePartyGroup.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfilePartyGroup clone() =>
      HomeProfilePartyGroup()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfilePartyGroup copyWith(
          void Function(HomeProfilePartyGroup) updates) =>
      super.copyWith((message) => updates(message as HomeProfilePartyGroup))
          as HomeProfilePartyGroup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfilePartyGroup create() => HomeProfilePartyGroup._();
  HomeProfilePartyGroup createEmptyInstance() => create();
  static $pb.PbList<HomeProfilePartyGroup> createRepeated() =>
      $pb.PbList<HomeProfilePartyGroup>();
  @$core.pragma('dart2js:noInline')
  static HomeProfilePartyGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfilePartyGroup>(create);
  static HomeProfilePartyGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get groupId => $_getIZ(0);
  @$pb.TagNumber(1)
  set groupId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cover => $_getSZ(2);
  @$pb.TagNumber(3)
  set cover($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCover() => $_has(2);
  @$pb.TagNumber(3)
  void clearCover() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get memberNum => $_getSZ(3);
  @$pb.TagNumber(4)
  set memberNum($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMemberNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemberNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get official => $_getBF(4);
  @$pb.TagNumber(5)
  set official($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOfficial() => $_has(4);
  @$pb.TagNumber(5)
  void clearOfficial() => clearField(5);
}

class HomeProfileBussinessCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileBussinessCard',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'banner')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'header')
    ..hasRequiredFields = false;

  HomeProfileBussinessCard._() : super();
  factory HomeProfileBussinessCard({
    $core.String? banner,
    $core.String? header,
  }) {
    final _result = create();
    if (banner != null) {
      _result.banner = banner;
    }
    if (header != null) {
      _result.header = header;
    }
    return _result;
  }
  factory HomeProfileBussinessCard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileBussinessCard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileBussinessCard clone() =>
      HomeProfileBussinessCard()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileBussinessCard copyWith(
          void Function(HomeProfileBussinessCard) updates) =>
      super.copyWith((message) => updates(message as HomeProfileBussinessCard))
          as HomeProfileBussinessCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileBussinessCard create() => HomeProfileBussinessCard._();
  HomeProfileBussinessCard createEmptyInstance() => create();
  static $pb.PbList<HomeProfileBussinessCard> createRepeated() =>
      $pb.PbList<HomeProfileBussinessCard>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileBussinessCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileBussinessCard>(create);
  static HomeProfileBussinessCard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get banner => $_getSZ(0);
  @$pb.TagNumber(1)
  set banner($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBanner() => $_has(0);
  @$pb.TagNumber(1)
  void clearBanner() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get header => $_getSZ(1);
  @$pb.TagNumber(2)
  set header($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHeader() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeader() => clearField(2);
}

class HomeProfileInterest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileInterest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  HomeProfileInterest._() : super();
  factory HomeProfileInterest({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory HomeProfileInterest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileInterest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileInterest clone() => HomeProfileInterest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileInterest copyWith(void Function(HomeProfileInterest) updates) =>
      super.copyWith((message) => updates(message as HomeProfileInterest))
          as HomeProfileInterest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileInterest create() => HomeProfileInterest._();
  HomeProfileInterest createEmptyInstance() => create();
  static $pb.PbList<HomeProfileInterest> createRepeated() =>
      $pb.PbList<HomeProfileInterest>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileInterest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileInterest>(create);
  static HomeProfileInterest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class HomeProfileGlist extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileGlist',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  HomeProfileGlist._() : super();
  factory HomeProfileGlist({
    $core.String? id,
    $core.String? name,
    $core.String? price,
    $core.String? icon,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (price != null) {
      _result.price = price;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory HomeProfileGlist.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileGlist.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileGlist clone() => HomeProfileGlist()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileGlist copyWith(void Function(HomeProfileGlist) updates) =>
      super.copyWith((message) => updates(message as HomeProfileGlist))
          as HomeProfileGlist; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileGlist create() => HomeProfileGlist._();
  HomeProfileGlist createEmptyInstance() => create();
  static $pb.PbList<HomeProfileGlist> createRepeated() =>
      $pb.PbList<HomeProfileGlist>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileGlist getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileGlist>(create);
  static HomeProfileGlist? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get price => $_getSZ(2);
  @$pb.TagNumber(3)
  set price($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);
}

class HomeProfileAccompany extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileAccompany',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  HomeProfileAccompany._() : super();
  factory HomeProfileAccompany({
    $core.int? uid,
    $core.String? icon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory HomeProfileAccompany.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileAccompany.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileAccompany clone() =>
      HomeProfileAccompany()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileAccompany copyWith(void Function(HomeProfileAccompany) updates) =>
      super.copyWith((message) => updates(message as HomeProfileAccompany))
          as HomeProfileAccompany; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileAccompany create() => HomeProfileAccompany._();
  HomeProfileAccompany createEmptyInstance() => create();
  static $pb.PbList<HomeProfileAccompany> createRepeated() =>
      $pb.PbList<HomeProfileAccompany>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileAccompany getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileAccompany>(create);
  static HomeProfileAccompany? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => clearField(2);
}

class HomeProfileJutitle extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileJutitle',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pic')
    ..hasRequiredFields = false;

  HomeProfileJutitle._() : super();
  factory HomeProfileJutitle({
    $core.String? tid,
    $core.String? name,
    $core.String? pic,
  }) {
    final _result = create();
    if (tid != null) {
      _result.tid = tid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (pic != null) {
      _result.pic = pic;
    }
    return _result;
  }
  factory HomeProfileJutitle.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileJutitle.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileJutitle clone() => HomeProfileJutitle()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileJutitle copyWith(void Function(HomeProfileJutitle) updates) =>
      super.copyWith((message) => updates(message as HomeProfileJutitle))
          as HomeProfileJutitle; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileJutitle create() => HomeProfileJutitle._();
  HomeProfileJutitle createEmptyInstance() => create();
  static $pb.PbList<HomeProfileJutitle> createRepeated() =>
      $pb.PbList<HomeProfileJutitle>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileJutitle getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileJutitle>(create);
  static HomeProfileJutitle? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tid => $_getSZ(0);
  @$pb.TagNumber(1)
  set tid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTid() => $_has(0);
  @$pb.TagNumber(1)
  void clearTid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get pic => $_getSZ(2);
  @$pb.TagNumber(3)
  set pic($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPic() => $_has(2);
  @$pb.TagNumber(3)
  void clearPic() => clearField(3);
}

class HomeProfileRookieTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileRookieTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sevenNew',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payLevel',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  HomeProfileRookieTag._() : super();
  factory HomeProfileRookieTag({
    $core.int? sevenNew,
    $core.int? payLevel,
  }) {
    final _result = create();
    if (sevenNew != null) {
      _result.sevenNew = sevenNew;
    }
    if (payLevel != null) {
      _result.payLevel = payLevel;
    }
    return _result;
  }
  factory HomeProfileRookieTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileRookieTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileRookieTag clone() =>
      HomeProfileRookieTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileRookieTag copyWith(void Function(HomeProfileRookieTag) updates) =>
      super.copyWith((message) => updates(message as HomeProfileRookieTag))
          as HomeProfileRookieTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileRookieTag create() => HomeProfileRookieTag._();
  HomeProfileRookieTag createEmptyInstance() => create();
  static $pb.PbList<HomeProfileRookieTag> createRepeated() =>
      $pb.PbList<HomeProfileRookieTag>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileRookieTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileRookieTag>(create);
  static HomeProfileRookieTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sevenNew => $_getIZ(0);
  @$pb.TagNumber(1)
  set sevenNew($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSevenNew() => $_has(0);
  @$pb.TagNumber(1)
  void clearSevenNew() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get payLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set payLevel($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPayLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayLevel() => clearField(2);
}

class HomeProfileMark extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileMark',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'text')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  HomeProfileMark._() : super();
  factory HomeProfileMark({
    $core.String? text,
    $core.String? icon,
  }) {
    final _result = create();
    if (text != null) {
      _result.text = text;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory HomeProfileMark.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileMark.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileMark clone() => HomeProfileMark()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileMark copyWith(void Function(HomeProfileMark) updates) =>
      super.copyWith((message) => updates(message as HomeProfileMark))
          as HomeProfileMark; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileMark create() => HomeProfileMark._();
  HomeProfileMark createEmptyInstance() => create();
  static $pb.PbList<HomeProfileMark> createRepeated() =>
      $pb.PbList<HomeProfileMark>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileMark getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileMark>(create);
  static HomeProfileMark? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => clearField(2);
}

class HomeProfileGame extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileGame',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameId',
        protoName: 'gameId')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameZone',
        protoName: 'gameZone')
    ..hasRequiredFields = false;

  HomeProfileGame._() : super();
  factory HomeProfileGame({
    $core.String? type,
    $core.String? gameId,
    $core.String? gameZone,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (gameId != null) {
      _result.gameId = gameId;
    }
    if (gameZone != null) {
      _result.gameZone = gameZone;
    }
    return _result;
  }
  factory HomeProfileGame.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileGame.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileGame clone() => HomeProfileGame()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileGame copyWith(void Function(HomeProfileGame) updates) =>
      super.copyWith((message) => updates(message as HomeProfileGame))
          as HomeProfileGame; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileGame create() => HomeProfileGame._();
  HomeProfileGame createEmptyInstance() => create();
  static $pb.PbList<HomeProfileGame> createRepeated() =>
      $pb.PbList<HomeProfileGame>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileGame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileGame>(create);
  static HomeProfileGame? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get gameId => $_getSZ(1);
  @$pb.TagNumber(2)
  set gameId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGameId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGameId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get gameZone => $_getSZ(2);
  @$pb.TagNumber(3)
  set gameZone($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGameZone() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameZone() => clearField(3);
}

class HomeProfileAccompanyInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileAccompanyInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'degree',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'staySecs',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HomeProfileAccompanyInfo._() : super();
  factory HomeProfileAccompanyInfo({
    $core.int? degree,
    $core.int? staySecs,
  }) {
    final _result = create();
    if (degree != null) {
      _result.degree = degree;
    }
    if (staySecs != null) {
      _result.staySecs = staySecs;
    }
    return _result;
  }
  factory HomeProfileAccompanyInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileAccompanyInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileAccompanyInfo clone() =>
      HomeProfileAccompanyInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileAccompanyInfo copyWith(
          void Function(HomeProfileAccompanyInfo) updates) =>
      super.copyWith((message) => updates(message as HomeProfileAccompanyInfo))
          as HomeProfileAccompanyInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileAccompanyInfo create() => HomeProfileAccompanyInfo._();
  HomeProfileAccompanyInfo createEmptyInstance() => create();
  static $pb.PbList<HomeProfileAccompanyInfo> createRepeated() =>
      $pb.PbList<HomeProfileAccompanyInfo>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileAccompanyInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileAccompanyInfo>(create);
  static HomeProfileAccompanyInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get degree => $_getIZ(0);
  @$pb.TagNumber(1)
  set degree($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDegree() => $_has(0);
  @$pb.TagNumber(1)
  void clearDegree() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get staySecs => $_getIZ(1);
  @$pb.TagNumber(2)
  set staySecs($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStaySecs() => $_has(1);
  @$pb.TagNumber(2)
  void clearStaySecs() => clearField(2);
}

class HomeProfileMarrySingleInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileMarrySingleInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cName',
        protoName: 'cName')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'img')
    ..hasRequiredFields = false;

  HomeProfileMarrySingleInfo._() : super();
  factory HomeProfileMarrySingleInfo({
    $core.String? mid,
    $core.String? cid,
    $core.String? cName,
    $core.String? img,
  }) {
    final _result = create();
    if (mid != null) {
      _result.mid = mid;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (cName != null) {
      _result.cName = cName;
    }
    if (img != null) {
      _result.img = img;
    }
    return _result;
  }
  factory HomeProfileMarrySingleInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileMarrySingleInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileMarrySingleInfo clone() =>
      HomeProfileMarrySingleInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileMarrySingleInfo copyWith(
          void Function(HomeProfileMarrySingleInfo) updates) =>
      super.copyWith(
              (message) => updates(message as HomeProfileMarrySingleInfo))
          as HomeProfileMarrySingleInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileMarrySingleInfo create() => HomeProfileMarrySingleInfo._();
  HomeProfileMarrySingleInfo createEmptyInstance() => create();
  static $pb.PbList<HomeProfileMarrySingleInfo> createRepeated() =>
      $pb.PbList<HomeProfileMarrySingleInfo>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileMarrySingleInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileMarrySingleInfo>(create);
  static HomeProfileMarrySingleInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mid => $_getSZ(0);
  @$pb.TagNumber(1)
  set mid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMid() => $_has(0);
  @$pb.TagNumber(1)
  void clearMid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cid => $_getSZ(1);
  @$pb.TagNumber(2)
  set cid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cName => $_getSZ(2);
  @$pb.TagNumber(3)
  set cName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get img => $_getSZ(3);
  @$pb.TagNumber(4)
  set img($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasImg() => $_has(3);
  @$pb.TagNumber(4)
  void clearImg() => clearField(4);
}

class HomeProfileMarryRelationInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileMarryRelationInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'img')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'degree',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HomeProfileMarryRelationInfo._() : super();
  factory HomeProfileMarryRelationInfo({
    $core.String? mid,
    $core.String? cid,
    $core.String? img,
    $core.int? degree,
  }) {
    final _result = create();
    if (mid != null) {
      _result.mid = mid;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (img != null) {
      _result.img = img;
    }
    if (degree != null) {
      _result.degree = degree;
    }
    return _result;
  }
  factory HomeProfileMarryRelationInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileMarryRelationInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileMarryRelationInfo clone() =>
      HomeProfileMarryRelationInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileMarryRelationInfo copyWith(
          void Function(HomeProfileMarryRelationInfo) updates) =>
      super.copyWith(
              (message) => updates(message as HomeProfileMarryRelationInfo))
          as HomeProfileMarryRelationInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileMarryRelationInfo create() =>
      HomeProfileMarryRelationInfo._();
  HomeProfileMarryRelationInfo createEmptyInstance() => create();
  static $pb.PbList<HomeProfileMarryRelationInfo> createRepeated() =>
      $pb.PbList<HomeProfileMarryRelationInfo>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileMarryRelationInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileMarryRelationInfo>(create);
  static HomeProfileMarryRelationInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mid => $_getSZ(0);
  @$pb.TagNumber(1)
  set mid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMid() => $_has(0);
  @$pb.TagNumber(1)
  void clearMid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cid => $_getSZ(1);
  @$pb.TagNumber(2)
  set cid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get img => $_getSZ(2);
  @$pb.TagNumber(3)
  set img($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImg() => $_has(2);
  @$pb.TagNumber(3)
  void clearImg() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get degree => $_getIZ(3);
  @$pb.TagNumber(4)
  set degree($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDegree() => $_has(3);
  @$pb.TagNumber(4)
  void clearDegree() => clearField(4);
}

class HomeProfileMarryInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileMarryInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<HomeProfileMarrySingleInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'single',
        subBuilder: HomeProfileMarrySingleInfo.create)
    ..aOM<HomeProfileMarryRelationInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relation',
        subBuilder: HomeProfileMarryRelationInfo.create)
    ..hasRequiredFields = false;

  HomeProfileMarryInfo._() : super();
  factory HomeProfileMarryInfo({
    HomeProfileMarrySingleInfo? single,
    HomeProfileMarryRelationInfo? relation,
  }) {
    final _result = create();
    if (single != null) {
      _result.single = single;
    }
    if (relation != null) {
      _result.relation = relation;
    }
    return _result;
  }
  factory HomeProfileMarryInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileMarryInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileMarryInfo clone() =>
      HomeProfileMarryInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileMarryInfo copyWith(void Function(HomeProfileMarryInfo) updates) =>
      super.copyWith((message) => updates(message as HomeProfileMarryInfo))
          as HomeProfileMarryInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileMarryInfo create() => HomeProfileMarryInfo._();
  HomeProfileMarryInfo createEmptyInstance() => create();
  static $pb.PbList<HomeProfileMarryInfo> createRepeated() =>
      $pb.PbList<HomeProfileMarryInfo>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileMarryInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileMarryInfo>(create);
  static HomeProfileMarryInfo? _defaultInstance;

  @$pb.TagNumber(1)
  HomeProfileMarrySingleInfo get single => $_getN(0);
  @$pb.TagNumber(1)
  set single(HomeProfileMarrySingleInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSingle() => $_has(0);
  @$pb.TagNumber(1)
  void clearSingle() => clearField(1);
  @$pb.TagNumber(1)
  HomeProfileMarrySingleInfo ensureSingle() => $_ensure(0);

  @$pb.TagNumber(2)
  HomeProfileMarryRelationInfo get relation => $_getN(1);
  @$pb.TagNumber(2)
  set relation(HomeProfileMarryRelationInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRelation() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelation() => clearField(2);
  @$pb.TagNumber(2)
  HomeProfileMarryRelationInfo ensureRelation() => $_ensure(1);
}

class HomeProfileMentorAreaInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileMentorAreaInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'famousMentorLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'notGraduateNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'discipleMaxNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HomeProfileMentorAreaInfo._() : super();
  factory HomeProfileMentorAreaInfo({
    $core.int? famousMentorLevel,
    $core.int? notGraduateNum,
    $core.int? discipleMaxNum,
  }) {
    final _result = create();
    if (famousMentorLevel != null) {
      _result.famousMentorLevel = famousMentorLevel;
    }
    if (notGraduateNum != null) {
      _result.notGraduateNum = notGraduateNum;
    }
    if (discipleMaxNum != null) {
      _result.discipleMaxNum = discipleMaxNum;
    }
    return _result;
  }
  factory HomeProfileMentorAreaInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileMentorAreaInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileMentorAreaInfo clone() =>
      HomeProfileMentorAreaInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileMentorAreaInfo copyWith(
          void Function(HomeProfileMentorAreaInfo) updates) =>
      super.copyWith((message) => updates(message as HomeProfileMentorAreaInfo))
          as HomeProfileMentorAreaInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileMentorAreaInfo create() => HomeProfileMentorAreaInfo._();
  HomeProfileMentorAreaInfo createEmptyInstance() => create();
  static $pb.PbList<HomeProfileMentorAreaInfo> createRepeated() =>
      $pb.PbList<HomeProfileMentorAreaInfo>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileMentorAreaInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileMentorAreaInfo>(create);
  static HomeProfileMentorAreaInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get famousMentorLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set famousMentorLevel($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFamousMentorLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearFamousMentorLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get notGraduateNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set notGraduateNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNotGraduateNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearNotGraduateNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get discipleMaxNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set discipleMaxNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDiscipleMaxNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearDiscipleMaxNum() => clearField(3);
}

class HomeProfileGameHistory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileGameHistory',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'populace',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'under',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'thumbsUp',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wolfWin',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goodWin',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'juCount',
        $pb.PbFieldType.OU3)
    ..a<$core.double>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'winRate',
        $pb.PbFieldType.OF)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'round',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'champion',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HomeProfileGameHistory._() : super();
  factory HomeProfileGameHistory({
    $core.int? populace,
    $core.int? under,
    $core.int? total,
    $core.int? score,
    $core.int? thumbsUp,
    $core.int? wolfWin,
    $core.int? goodWin,
    $core.int? level,
    $core.int? juCount,
    $core.double? winRate,
    $core.int? round,
    $core.int? champion,
  }) {
    final _result = create();
    if (populace != null) {
      _result.populace = populace;
    }
    if (under != null) {
      _result.under = under;
    }
    if (total != null) {
      _result.total = total;
    }
    if (score != null) {
      _result.score = score;
    }
    if (thumbsUp != null) {
      _result.thumbsUp = thumbsUp;
    }
    if (wolfWin != null) {
      _result.wolfWin = wolfWin;
    }
    if (goodWin != null) {
      _result.goodWin = goodWin;
    }
    if (level != null) {
      _result.level = level;
    }
    if (juCount != null) {
      _result.juCount = juCount;
    }
    if (winRate != null) {
      _result.winRate = winRate;
    }
    if (round != null) {
      _result.round = round;
    }
    if (champion != null) {
      _result.champion = champion;
    }
    return _result;
  }
  factory HomeProfileGameHistory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileGameHistory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileGameHistory clone() =>
      HomeProfileGameHistory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileGameHistory copyWith(
          void Function(HomeProfileGameHistory) updates) =>
      super.copyWith((message) => updates(message as HomeProfileGameHistory))
          as HomeProfileGameHistory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileGameHistory create() => HomeProfileGameHistory._();
  HomeProfileGameHistory createEmptyInstance() => create();
  static $pb.PbList<HomeProfileGameHistory> createRepeated() =>
      $pb.PbList<HomeProfileGameHistory>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileGameHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileGameHistory>(create);
  static HomeProfileGameHistory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get populace => $_getIZ(0);
  @$pb.TagNumber(1)
  set populace($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPopulace() => $_has(0);
  @$pb.TagNumber(1)
  void clearPopulace() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get under => $_getIZ(1);
  @$pb.TagNumber(2)
  set under($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUnder() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnder() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get total => $_getIZ(2);
  @$pb.TagNumber(3)
  set total($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotal() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get score => $_getIZ(3);
  @$pb.TagNumber(4)
  set score($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get thumbsUp => $_getIZ(4);
  @$pb.TagNumber(5)
  set thumbsUp($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasThumbsUp() => $_has(4);
  @$pb.TagNumber(5)
  void clearThumbsUp() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get wolfWin => $_getIZ(5);
  @$pb.TagNumber(6)
  set wolfWin($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWolfWin() => $_has(5);
  @$pb.TagNumber(6)
  void clearWolfWin() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get goodWin => $_getIZ(6);
  @$pb.TagNumber(7)
  set goodWin($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGoodWin() => $_has(6);
  @$pb.TagNumber(7)
  void clearGoodWin() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get level => $_getIZ(7);
  @$pb.TagNumber(8)
  set level($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLevel() => $_has(7);
  @$pb.TagNumber(8)
  void clearLevel() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get juCount => $_getIZ(8);
  @$pb.TagNumber(9)
  set juCount($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasJuCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearJuCount() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get winRate => $_getN(9);
  @$pb.TagNumber(10)
  set winRate($core.double v) {
    $_setFloat(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasWinRate() => $_has(9);
  @$pb.TagNumber(10)
  void clearWinRate() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get round => $_getIZ(10);
  @$pb.TagNumber(11)
  set round($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasRound() => $_has(10);
  @$pb.TagNumber(11)
  void clearRound() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get champion => $_getIZ(11);
  @$pb.TagNumber(12)
  set champion($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasChampion() => $_has(11);
  @$pb.TagNumber(12)
  void clearChampion() => clearField(12);
}

class HomeProfileKolGiftShow extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileKolGiftShow',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftType')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.double>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  HomeProfileKolGiftShow._() : super();
  factory HomeProfileKolGiftShow({
    $core.int? id,
    $core.String? giftType,
    $core.String? name,
    $core.double? price,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (giftType != null) {
      _result.giftType = giftType;
    }
    if (name != null) {
      _result.name = name;
    }
    if (price != null) {
      _result.price = price;
    }
    return _result;
  }
  factory HomeProfileKolGiftShow.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileKolGiftShow.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileKolGiftShow clone() =>
      HomeProfileKolGiftShow()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileKolGiftShow copyWith(
          void Function(HomeProfileKolGiftShow) updates) =>
      super.copyWith((message) => updates(message as HomeProfileKolGiftShow))
          as HomeProfileKolGiftShow; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileKolGiftShow create() => HomeProfileKolGiftShow._();
  HomeProfileKolGiftShow createEmptyInstance() => create();
  static $pb.PbList<HomeProfileKolGiftShow> createRepeated() =>
      $pb.PbList<HomeProfileKolGiftShow>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileKolGiftShow getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileKolGiftShow>(create);
  static HomeProfileKolGiftShow? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get giftType => $_getSZ(1);
  @$pb.TagNumber(2)
  set giftType($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftType() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get price => $_getN(3);
  @$pb.TagNumber(4)
  set price($core.double v) {
    $_setDouble(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => clearField(4);
}

class HomeProfileKolRight extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileKolRight',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..hasRequiredFields = false;

  HomeProfileKolRight._() : super();
  factory HomeProfileKolRight({
    $core.String? name,
    $core.String? image,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory HomeProfileKolRight.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileKolRight.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileKolRight clone() => HomeProfileKolRight()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileKolRight copyWith(void Function(HomeProfileKolRight) updates) =>
      super.copyWith((message) => updates(message as HomeProfileKolRight))
          as HomeProfileKolRight; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileKolRight create() => HomeProfileKolRight._();
  HomeProfileKolRight createEmptyInstance() => create();
  static $pb.PbList<HomeProfileKolRight> createRepeated() =>
      $pb.PbList<HomeProfileKolRight>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileKolRight getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileKolRight>(create);
  static HomeProfileKolRight? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(2)
  set image($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);
}

class HomeProfileKolInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileKolInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'kfgId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'memberNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isJoin',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'joinTitle')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'joinNote')
    ..aOM<HomeProfileKolGiftShow>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        subBuilder: HomeProfileKolGiftShow.create)
    ..pc<HomeProfileKolRight>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rights',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileKolRight.create)
    ..hasRequiredFields = false;

  HomeProfileKolInfo._() : super();
  factory HomeProfileKolInfo({
    $core.int? kfgId,
    $core.int? groupUid,
    $core.String? groupName,
    $core.int? memberNum,
    $core.int? isJoin,
    $core.String? icon,
    $core.String? joinTitle,
    $core.String? joinNote,
    HomeProfileKolGiftShow? gift,
    $core.Iterable<HomeProfileKolRight>? rights,
  }) {
    final _result = create();
    if (kfgId != null) {
      _result.kfgId = kfgId;
    }
    if (groupUid != null) {
      _result.groupUid = groupUid;
    }
    if (groupName != null) {
      _result.groupName = groupName;
    }
    if (memberNum != null) {
      _result.memberNum = memberNum;
    }
    if (isJoin != null) {
      _result.isJoin = isJoin;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (joinTitle != null) {
      _result.joinTitle = joinTitle;
    }
    if (joinNote != null) {
      _result.joinNote = joinNote;
    }
    if (gift != null) {
      _result.gift = gift;
    }
    if (rights != null) {
      _result.rights.addAll(rights);
    }
    return _result;
  }
  factory HomeProfileKolInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileKolInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileKolInfo clone() => HomeProfileKolInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileKolInfo copyWith(void Function(HomeProfileKolInfo) updates) =>
      super.copyWith((message) => updates(message as HomeProfileKolInfo))
          as HomeProfileKolInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileKolInfo create() => HomeProfileKolInfo._();
  HomeProfileKolInfo createEmptyInstance() => create();
  static $pb.PbList<HomeProfileKolInfo> createRepeated() =>
      $pb.PbList<HomeProfileKolInfo>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileKolInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileKolInfo>(create);
  static HomeProfileKolInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get kfgId => $_getIZ(0);
  @$pb.TagNumber(1)
  set kfgId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKfgId() => $_has(0);
  @$pb.TagNumber(1)
  void clearKfgId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get groupUid => $_getIZ(1);
  @$pb.TagNumber(2)
  set groupUid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGroupUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get groupName => $_getSZ(2);
  @$pb.TagNumber(3)
  set groupName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGroupName() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get memberNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set memberNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMemberNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemberNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get isJoin => $_getIZ(4);
  @$pb.TagNumber(5)
  set isJoin($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsJoin() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsJoin() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get icon => $_getSZ(5);
  @$pb.TagNumber(6)
  set icon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get joinTitle => $_getSZ(6);
  @$pb.TagNumber(7)
  set joinTitle($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasJoinTitle() => $_has(6);
  @$pb.TagNumber(7)
  void clearJoinTitle() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get joinNote => $_getSZ(7);
  @$pb.TagNumber(8)
  set joinNote($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasJoinNote() => $_has(7);
  @$pb.TagNumber(8)
  void clearJoinNote() => clearField(8);

  @$pb.TagNumber(9)
  HomeProfileKolGiftShow get gift => $_getN(8);
  @$pb.TagNumber(9)
  set gift(HomeProfileKolGiftShow v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGift() => $_has(8);
  @$pb.TagNumber(9)
  void clearGift() => clearField(9);
  @$pb.TagNumber(9)
  HomeProfileKolGiftShow ensureGift() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.List<HomeProfileKolRight> get rights => $_getList(9);
}

class HomeProfileKnightGroup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileKnightGroup',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'masterUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'masterRid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'memberNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HomeProfileKnightGroup._() : super();
  factory HomeProfileKnightGroup({
    $core.bool? show,
    $core.int? masterUid,
    $core.int? masterRid,
    $core.int? memberNum,
  }) {
    final _result = create();
    if (show != null) {
      _result.show = show;
    }
    if (masterUid != null) {
      _result.masterUid = masterUid;
    }
    if (masterRid != null) {
      _result.masterRid = masterRid;
    }
    if (memberNum != null) {
      _result.memberNum = memberNum;
    }
    return _result;
  }
  factory HomeProfileKnightGroup.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileKnightGroup.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileKnightGroup clone() =>
      HomeProfileKnightGroup()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileKnightGroup copyWith(
          void Function(HomeProfileKnightGroup) updates) =>
      super.copyWith((message) => updates(message as HomeProfileKnightGroup))
          as HomeProfileKnightGroup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileKnightGroup create() => HomeProfileKnightGroup._();
  HomeProfileKnightGroup createEmptyInstance() => create();
  static $pb.PbList<HomeProfileKnightGroup> createRepeated() =>
      $pb.PbList<HomeProfileKnightGroup>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileKnightGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileKnightGroup>(create);
  static HomeProfileKnightGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get show => $_getBF(0);
  @$pb.TagNumber(1)
  set show($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShow() => $_has(0);
  @$pb.TagNumber(1)
  void clearShow() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get masterUid => $_getIZ(1);
  @$pb.TagNumber(2)
  set masterUid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMasterUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearMasterUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get masterRid => $_getIZ(2);
  @$pb.TagNumber(3)
  set masterRid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMasterRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearMasterRid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get memberNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set memberNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMemberNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemberNum() => clearField(4);
}

class HomeProfileUserGiftWall extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileUserGiftWall',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelIcon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goldNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'silverNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'copperNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelIconBorder')
    ..hasRequiredFields = false;

  HomeProfileUserGiftWall._() : super();
  factory HomeProfileUserGiftWall({
    $core.int? level,
    $core.String? levelIcon,
    $core.String? levelName,
    $core.int? giftNum,
    $core.int? goldNum,
    $core.int? silverNum,
    $core.int? copperNum,
    $core.String? levelIconBorder,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (levelIcon != null) {
      _result.levelIcon = levelIcon;
    }
    if (levelName != null) {
      _result.levelName = levelName;
    }
    if (giftNum != null) {
      _result.giftNum = giftNum;
    }
    if (goldNum != null) {
      _result.goldNum = goldNum;
    }
    if (silverNum != null) {
      _result.silverNum = silverNum;
    }
    if (copperNum != null) {
      _result.copperNum = copperNum;
    }
    if (levelIconBorder != null) {
      _result.levelIconBorder = levelIconBorder;
    }
    return _result;
  }
  factory HomeProfileUserGiftWall.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileUserGiftWall.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileUserGiftWall clone() =>
      HomeProfileUserGiftWall()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileUserGiftWall copyWith(
          void Function(HomeProfileUserGiftWall) updates) =>
      super.copyWith((message) => updates(message as HomeProfileUserGiftWall))
          as HomeProfileUserGiftWall; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileUserGiftWall create() => HomeProfileUserGiftWall._();
  HomeProfileUserGiftWall createEmptyInstance() => create();
  static $pb.PbList<HomeProfileUserGiftWall> createRepeated() =>
      $pb.PbList<HomeProfileUserGiftWall>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileUserGiftWall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileUserGiftWall>(create);
  static HomeProfileUserGiftWall? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get levelIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set levelIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLevelIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevelIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get levelName => $_getSZ(2);
  @$pb.TagNumber(3)
  set levelName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLevelName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevelName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get giftNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set giftNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get goldNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set goldNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGoldNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearGoldNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get silverNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set silverNum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSilverNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearSilverNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get copperNum => $_getIZ(6);
  @$pb.TagNumber(7)
  set copperNum($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCopperNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearCopperNum() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get levelIconBorder => $_getSZ(7);
  @$pb.TagNumber(8)
  set levelIconBorder($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLevelIconBorder() => $_has(7);
  @$pb.TagNumber(8)
  void clearLevelIconBorder() => clearField(8);
}

class HomeProfileAchieveBadge extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileAchieveBadge',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skinId',
        $pb.PbFieldType.OU3)
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isWear')
    ..hasRequiredFields = false;

  HomeProfileAchieveBadge._() : super();
  factory HomeProfileAchieveBadge({
    $core.int? badgeId,
    $core.String? name,
    $core.String? image,
    $core.int? level,
    $core.int? skinId,
    $core.bool? isWear,
  }) {
    final _result = create();
    if (badgeId != null) {
      _result.badgeId = badgeId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    if (level != null) {
      _result.level = level;
    }
    if (skinId != null) {
      _result.skinId = skinId;
    }
    if (isWear != null) {
      _result.isWear = isWear;
    }
    return _result;
  }
  factory HomeProfileAchieveBadge.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileAchieveBadge.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileAchieveBadge clone() =>
      HomeProfileAchieveBadge()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileAchieveBadge copyWith(
          void Function(HomeProfileAchieveBadge) updates) =>
      super.copyWith((message) => updates(message as HomeProfileAchieveBadge))
          as HomeProfileAchieveBadge; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileAchieveBadge create() => HomeProfileAchieveBadge._();
  HomeProfileAchieveBadge createEmptyInstance() => create();
  static $pb.PbList<HomeProfileAchieveBadge> createRepeated() =>
      $pb.PbList<HomeProfileAchieveBadge>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileAchieveBadge getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileAchieveBadge>(create);
  static HomeProfileAchieveBadge? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get badgeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set badgeId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBadgeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBadgeId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get image => $_getSZ(2);
  @$pb.TagNumber(3)
  set image($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get level => $_getIZ(3);
  @$pb.TagNumber(4)
  set level($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get skinId => $_getIZ(4);
  @$pb.TagNumber(5)
  set skinId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSkinId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSkinId() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isWear => $_getBF(5);
  @$pb.TagNumber(6)
  set isWear($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIsWear() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsWear() => clearField(6);
}

class HomeProfileSinger extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileSinger',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'clubId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logo')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userTitle',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleName')
    ..hasRequiredFields = false;

  HomeProfileSinger._() : super();
  factory HomeProfileSinger({
    $core.int? clubId,
    $core.String? name,
    $core.int? createUid,
    $core.String? logo,
    $core.int? userTitle,
    $core.String? titleName,
  }) {
    final _result = create();
    if (clubId != null) {
      _result.clubId = clubId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (createUid != null) {
      _result.createUid = createUid;
    }
    if (logo != null) {
      _result.logo = logo;
    }
    if (userTitle != null) {
      _result.userTitle = userTitle;
    }
    if (titleName != null) {
      _result.titleName = titleName;
    }
    return _result;
  }
  factory HomeProfileSinger.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileSinger.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileSinger clone() => HomeProfileSinger()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileSinger copyWith(void Function(HomeProfileSinger) updates) =>
      super.copyWith((message) => updates(message as HomeProfileSinger))
          as HomeProfileSinger; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileSinger create() => HomeProfileSinger._();
  HomeProfileSinger createEmptyInstance() => create();
  static $pb.PbList<HomeProfileSinger> createRepeated() =>
      $pb.PbList<HomeProfileSinger>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileSinger getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileSinger>(create);
  static HomeProfileSinger? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get clubId => $_getIZ(0);
  @$pb.TagNumber(1)
  set clubId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasClubId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClubId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get createUid => $_getIZ(2);
  @$pb.TagNumber(3)
  set createUid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCreateUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreateUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get logo => $_getSZ(3);
  @$pb.TagNumber(4)
  set logo($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLogo() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogo() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get userTitle => $_getIZ(4);
  @$pb.TagNumber(5)
  set userTitle($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUserTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserTitle() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get titleName => $_getSZ(5);
  @$pb.TagNumber(6)
  set titleName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTitleName() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitleName() => clearField(6);
}

class HomeProfileImprint extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileImprint',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<HomeProfileImprintOur>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'our',
        subBuilder: HomeProfileImprintOur.create)
    ..pc<HomeProfileImprintUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'users',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileImprintUser.create)
    ..hasRequiredFields = false;

  HomeProfileImprint._() : super();
  factory HomeProfileImprint({
    HomeProfileImprintOur? our,
    $core.Iterable<HomeProfileImprintUser>? users,
  }) {
    final _result = create();
    if (our != null) {
      _result.our = our;
    }
    if (users != null) {
      _result.users.addAll(users);
    }
    return _result;
  }
  factory HomeProfileImprint.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileImprint.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileImprint clone() => HomeProfileImprint()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileImprint copyWith(void Function(HomeProfileImprint) updates) =>
      super.copyWith((message) => updates(message as HomeProfileImprint))
          as HomeProfileImprint; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileImprint create() => HomeProfileImprint._();
  HomeProfileImprint createEmptyInstance() => create();
  static $pb.PbList<HomeProfileImprint> createRepeated() =>
      $pb.PbList<HomeProfileImprint>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileImprint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileImprint>(create);
  static HomeProfileImprint? _defaultInstance;

  @$pb.TagNumber(1)
  HomeProfileImprintOur get our => $_getN(0);
  @$pb.TagNumber(1)
  set our(HomeProfileImprintOur v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOur() => $_has(0);
  @$pb.TagNumber(1)
  void clearOur() => clearField(1);
  @$pb.TagNumber(1)
  HomeProfileImprintOur ensureOur() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<HomeProfileImprintUser> get users => $_getList(1);
}

class HomeProfileImprintOur extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileImprintOur',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightenNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HomeProfileImprintOur._() : super();
  factory HomeProfileImprintOur({
    $core.int? lightenNum,
    $core.int? totalNum,
  }) {
    final _result = create();
    if (lightenNum != null) {
      _result.lightenNum = lightenNum;
    }
    if (totalNum != null) {
      _result.totalNum = totalNum;
    }
    return _result;
  }
  factory HomeProfileImprintOur.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileImprintOur.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileImprintOur clone() =>
      HomeProfileImprintOur()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileImprintOur copyWith(
          void Function(HomeProfileImprintOur) updates) =>
      super.copyWith((message) => updates(message as HomeProfileImprintOur))
          as HomeProfileImprintOur; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileImprintOur create() => HomeProfileImprintOur._();
  HomeProfileImprintOur createEmptyInstance() => create();
  static $pb.PbList<HomeProfileImprintOur> createRepeated() =>
      $pb.PbList<HomeProfileImprintOur>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileImprintOur getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileImprintOur>(create);
  static HomeProfileImprintOur? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lightenNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set lightenNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLightenNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearLightenNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTotalNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalNum() => clearField(2);
}

class HomeProfileImprintUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileImprintUser',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightenNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HomeProfileImprintUser._() : super();
  factory HomeProfileImprintUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? lightenNum,
    $core.int? totalNum,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (lightenNum != null) {
      _result.lightenNum = lightenNum;
    }
    if (totalNum != null) {
      _result.totalNum = totalNum;
    }
    return _result;
  }
  factory HomeProfileImprintUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileImprintUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileImprintUser clone() =>
      HomeProfileImprintUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileImprintUser copyWith(
          void Function(HomeProfileImprintUser) updates) =>
      super.copyWith((message) => updates(message as HomeProfileImprintUser))
          as HomeProfileImprintUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileImprintUser create() => HomeProfileImprintUser._();
  HomeProfileImprintUser createEmptyInstance() => create();
  static $pb.PbList<HomeProfileImprintUser> createRepeated() =>
      $pb.PbList<HomeProfileImprintUser>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileImprintUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileImprintUser>(create);
  static HomeProfileImprintUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get lightenNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set lightenNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLightenNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearLightenNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get totalNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTotalNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalNum() => clearField(5);
}

class HomeProfileCardDecorate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileCardDecorate',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapSize',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  HomeProfileCardDecorate._() : super();
  factory HomeProfileCardDecorate({
    $core.String? image,
    $core.int? giftId,
    $core.int? vapSize,
  }) {
    final _result = create();
    if (image != null) {
      _result.image = image;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    return _result;
  }
  factory HomeProfileCardDecorate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileCardDecorate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileCardDecorate clone() =>
      HomeProfileCardDecorate()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileCardDecorate copyWith(
          void Function(HomeProfileCardDecorate) updates) =>
      super.copyWith((message) => updates(message as HomeProfileCardDecorate))
          as HomeProfileCardDecorate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileCardDecorate create() => HomeProfileCardDecorate._();
  HomeProfileCardDecorate createEmptyInstance() => create();
  static $pb.PbList<HomeProfileCardDecorate> createRepeated() =>
      $pb.PbList<HomeProfileCardDecorate>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileCardDecorate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileCardDecorate>(create);
  static HomeProfileCardDecorate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get image => $_getSZ(0);
  @$pb.TagNumber(1)
  set image($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get giftId => $_getIZ(1);
  @$pb.TagNumber(2)
  set giftId($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get vapSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set vapSize($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVapSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearVapSize() => clearField(3);
}

class HomeProfileVoiceTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileVoiceTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  HomeProfileVoiceTag._() : super();
  factory HomeProfileVoiceTag({
    $core.int? tagId,
    $core.String? name,
    $core.String? icon,
  }) {
    final _result = create();
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory HomeProfileVoiceTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileVoiceTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileVoiceTag clone() => HomeProfileVoiceTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileVoiceTag copyWith(void Function(HomeProfileVoiceTag) updates) =>
      super.copyWith((message) => updates(message as HomeProfileVoiceTag))
          as HomeProfileVoiceTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileVoiceTag create() => HomeProfileVoiceTag._();
  HomeProfileVoiceTag createEmptyInstance() => create();
  static $pb.PbList<HomeProfileVoiceTag> createRepeated() =>
      $pb.PbList<HomeProfileVoiceTag>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileVoiceTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileVoiceTag>(create);
  static HomeProfileVoiceTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);
}

class HomeProfileData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<HomeProfileBase>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'base',
        subBuilder: HomeProfileBase.create)
    ..aOM<HomeProfileGod>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'god',
        subBuilder: HomeProfileGod.create)
    ..aOM<HomeProfileRoom>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room',
        subBuilder: HomeProfileRoom.create)
    ..pc<HomeProfileGift>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileGift.create)
    ..aOM<HomeProfileTag>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag',
        subBuilder: HomeProfileTag.create)
    ..pc<HomeProfileDisciple>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'discipleList',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileDisciple.create)
    ..aOM<HomeProfileMentor>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mentorInfo',
        subBuilder: HomeProfileMentor.create)
    ..aOM<HomeProfileFleet>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fleet',
        subBuilder: HomeProfileFleet.create)
    ..aOM<HomeProfileCard>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'card',
        subBuilder: HomeProfileCard.create)
    ..pc<HomeProfileDefend>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendList',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileDefend.create)
    ..aOM<HomeProfileUnion>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'union',
        subBuilder: HomeProfileUnion.create)
    ..aOM<HomeProfileDecorate>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'decorate',
        subBuilder: HomeProfileDecorate.create)
    ..pc<HomeProfilePartyGroup>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partyGroup',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfilePartyGroup.create)
    ..aOM<HomeProfileBussinessCard>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'businessCard',
        subBuilder: HomeProfileBussinessCard.create)
    ..pc<HomeProfileInterest>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'interest',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileInterest.create)
    ..pc<HomeProfileGlist>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'glist',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileGlist.create)
    ..aOM<HomeProfileAccompany>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accompanyFirst',
        protoName: 'accompanyFirst',
        subBuilder: HomeProfileAccompany.create)
    ..pc<HomeProfileJutitle>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'juTitles',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileJutitle.create)
    ..aOM<HomeProfileRookieTag>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rookieTag',
        subBuilder: HomeProfileRookieTag.create)
    ..pc<HomeProfileSkill>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skill',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileSkill.create)
    ..pc<HomeProfileMark>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mark',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileMark.create)
    ..aOM<HomeProfileGame>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game',
        subBuilder: HomeProfileGame.create)
    ..aOM<HomeProfileAccompanyInfo>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accompany',
        subBuilder: HomeProfileAccompanyInfo.create)
    ..aOM<HomeProfileMarryInfo>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'marry',
        subBuilder: HomeProfileMarryInfo.create)
    ..aOM<HomeProfileMentorAreaInfo>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mentorArea',
        subBuilder: HomeProfileMentorAreaInfo.create)
    ..aOM<HomeProfileGameHistory>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameHistory',
        subBuilder: HomeProfileGameHistory.create)
    ..aOM<HomeProfileKolInfo>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'kfgShow',
        subBuilder: HomeProfileKolInfo.create)
    ..aOM<HomeProfileKnightGroup>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightGroup',
        subBuilder: HomeProfileKnightGroup.create)
    ..aOM<HomeProfileUserGiftWall>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftWall',
        subBuilder: HomeProfileUserGiftWall.create)
    ..aOM<HomeProfileLiveTagInfo>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveTagInfo',
        subBuilder: HomeProfileLiveTagInfo.create)
    ..pc<HomeProfileAchieveBadge>(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'achieveBadge',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileAchieveBadge.create)
    ..pc<HomeProfileSinger>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerClub',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileSinger.create)
    ..aOM<UserMysteryInfo>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mysteryInfo',
        subBuilder: UserMysteryInfo.create)
    ..aOM<HomeProfileCardDecorate>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cardDecorate',
        subBuilder: HomeProfileCardDecorate.create)
    ..pc<$0.ExhibitCommodityItem>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'exhibitData',
        $pb.PbFieldType.PM,
        subBuilder: $0.ExhibitCommodityItem.create)
    ..aOM<HomeProfileGeneralSettings>(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'generalSettings',
        subBuilder: HomeProfileGeneralSettings.create)
    ..pc<HomeProfileVoiceTag>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'voiceTag',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileVoiceTag.create)
    ..aOM<HomeProfileBirthdayInfo>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday',
        subBuilder: HomeProfileBirthdayInfo.create)
    ..pc<giftInfo>(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'interactGiftInfos',
        $pb.PbFieldType.PM,
        protoName: 'interactGiftInfos',
        subBuilder: giftInfo.create)
    ..aOM<RoomCrossPkQualifyingSummary>(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cpkSummary',
        protoName: 'cpkSummary',
        subBuilder: RoomCrossPkQualifyingSummary.create)
    ..aOM<$1.GiftBookBriefInfo>(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'briefInfo',
        subBuilder: $1.GiftBookBriefInfo.create)
    ..aOB(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isCloseGiftWall')
    ..a<$core.int>(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'exhibitionDisplay',
        $pb.PbFieldType.OU3)
    ..aOM<StarshipEntry>(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starshipDetail',
        subBuilder: StarshipEntry.create)
    ..hasRequiredFields = false;

  HomeProfileData._() : super();
  factory HomeProfileData({
    HomeProfileBase? base,
    HomeProfileGod? god,
    HomeProfileRoom? room,
    $core.Iterable<HomeProfileGift>? gift,
    HomeProfileTag? tag,
    $core.Iterable<HomeProfileDisciple>? discipleList,
    HomeProfileMentor? mentorInfo,
    HomeProfileFleet? fleet,
    HomeProfileCard? card,
    $core.Iterable<HomeProfileDefend>? defendList,
    HomeProfileUnion? union,
    HomeProfileDecorate? decorate,
    $core.Iterable<HomeProfilePartyGroup>? partyGroup,
    HomeProfileBussinessCard? businessCard,
    $core.Iterable<HomeProfileInterest>? interest,
    $core.Iterable<HomeProfileGlist>? glist,
    HomeProfileAccompany? accompanyFirst,
    $core.Iterable<HomeProfileJutitle>? juTitles,
    HomeProfileRookieTag? rookieTag,
    $core.Iterable<HomeProfileSkill>? skill,
    $core.Iterable<HomeProfileMark>? mark,
    HomeProfileGame? game,
    HomeProfileAccompanyInfo? accompany,
    HomeProfileMarryInfo? marry,
    HomeProfileMentorAreaInfo? mentorArea,
    HomeProfileGameHistory? gameHistory,
    HomeProfileKolInfo? kfgShow,
    HomeProfileKnightGroup? knightGroup,
    HomeProfileUserGiftWall? giftWall,
    HomeProfileLiveTagInfo? liveTagInfo,
    $core.Iterable<HomeProfileAchieveBadge>? achieveBadge,
    $core.Iterable<HomeProfileSinger>? singerClub,
    UserMysteryInfo? mysteryInfo,
    HomeProfileCardDecorate? cardDecorate,
    $core.Iterable<$0.ExhibitCommodityItem>? exhibitData,
    HomeProfileGeneralSettings? generalSettings,
    $core.Iterable<HomeProfileVoiceTag>? voiceTag,
    HomeProfileBirthdayInfo? birthday,
    $core.Iterable<giftInfo>? interactGiftInfos,
    RoomCrossPkQualifyingSummary? cpkSummary,
    $1.GiftBookBriefInfo? briefInfo,
    $core.bool? isCloseGiftWall,
    $core.int? exhibitionDisplay,
    StarshipEntry? starshipDetail,
  }) {
    final _result = create();
    if (base != null) {
      _result.base = base;
    }
    if (god != null) {
      _result.god = god;
    }
    if (room != null) {
      _result.room = room;
    }
    if (gift != null) {
      _result.gift.addAll(gift);
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (discipleList != null) {
      _result.discipleList.addAll(discipleList);
    }
    if (mentorInfo != null) {
      _result.mentorInfo = mentorInfo;
    }
    if (fleet != null) {
      _result.fleet = fleet;
    }
    if (card != null) {
      _result.card = card;
    }
    if (defendList != null) {
      _result.defendList.addAll(defendList);
    }
    if (union != null) {
      _result.union = union;
    }
    if (decorate != null) {
      _result.decorate = decorate;
    }
    if (partyGroup != null) {
      _result.partyGroup.addAll(partyGroup);
    }
    if (businessCard != null) {
      _result.businessCard = businessCard;
    }
    if (interest != null) {
      _result.interest.addAll(interest);
    }
    if (glist != null) {
      _result.glist.addAll(glist);
    }
    if (accompanyFirst != null) {
      _result.accompanyFirst = accompanyFirst;
    }
    if (juTitles != null) {
      _result.juTitles.addAll(juTitles);
    }
    if (rookieTag != null) {
      _result.rookieTag = rookieTag;
    }
    if (skill != null) {
      _result.skill.addAll(skill);
    }
    if (mark != null) {
      _result.mark.addAll(mark);
    }
    if (game != null) {
      _result.game = game;
    }
    if (accompany != null) {
      _result.accompany = accompany;
    }
    if (marry != null) {
      _result.marry = marry;
    }
    if (mentorArea != null) {
      _result.mentorArea = mentorArea;
    }
    if (gameHistory != null) {
      _result.gameHistory = gameHistory;
    }
    if (kfgShow != null) {
      _result.kfgShow = kfgShow;
    }
    if (knightGroup != null) {
      _result.knightGroup = knightGroup;
    }
    if (giftWall != null) {
      _result.giftWall = giftWall;
    }
    if (liveTagInfo != null) {
      _result.liveTagInfo = liveTagInfo;
    }
    if (achieveBadge != null) {
      _result.achieveBadge.addAll(achieveBadge);
    }
    if (singerClub != null) {
      _result.singerClub.addAll(singerClub);
    }
    if (mysteryInfo != null) {
      _result.mysteryInfo = mysteryInfo;
    }
    if (cardDecorate != null) {
      _result.cardDecorate = cardDecorate;
    }
    if (exhibitData != null) {
      _result.exhibitData.addAll(exhibitData);
    }
    if (generalSettings != null) {
      _result.generalSettings = generalSettings;
    }
    if (voiceTag != null) {
      _result.voiceTag.addAll(voiceTag);
    }
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (interactGiftInfos != null) {
      _result.interactGiftInfos.addAll(interactGiftInfos);
    }
    if (cpkSummary != null) {
      _result.cpkSummary = cpkSummary;
    }
    if (briefInfo != null) {
      _result.briefInfo = briefInfo;
    }
    if (isCloseGiftWall != null) {
      _result.isCloseGiftWall = isCloseGiftWall;
    }
    if (exhibitionDisplay != null) {
      _result.exhibitionDisplay = exhibitionDisplay;
    }
    if (starshipDetail != null) {
      _result.starshipDetail = starshipDetail;
    }
    return _result;
  }
  factory HomeProfileData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileData clone() => HomeProfileData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileData copyWith(void Function(HomeProfileData) updates) =>
      super.copyWith((message) => updates(message as HomeProfileData))
          as HomeProfileData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileData create() => HomeProfileData._();
  HomeProfileData createEmptyInstance() => create();
  static $pb.PbList<HomeProfileData> createRepeated() =>
      $pb.PbList<HomeProfileData>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileData>(create);
  static HomeProfileData? _defaultInstance;

  @$pb.TagNumber(1)
  HomeProfileBase get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(HomeProfileBase v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  HomeProfileBase ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  HomeProfileGod get god => $_getN(1);
  @$pb.TagNumber(2)
  set god(HomeProfileGod v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGod() => $_has(1);
  @$pb.TagNumber(2)
  void clearGod() => clearField(2);
  @$pb.TagNumber(2)
  HomeProfileGod ensureGod() => $_ensure(1);

  @$pb.TagNumber(3)
  HomeProfileRoom get room => $_getN(2);
  @$pb.TagNumber(3)
  set room(HomeProfileRoom v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoom() => clearField(3);
  @$pb.TagNumber(3)
  HomeProfileRoom ensureRoom() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<HomeProfileGift> get gift => $_getList(3);

  @$pb.TagNumber(5)
  HomeProfileTag get tag => $_getN(4);
  @$pb.TagNumber(5)
  set tag(HomeProfileTag v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTag() => $_has(4);
  @$pb.TagNumber(5)
  void clearTag() => clearField(5);
  @$pb.TagNumber(5)
  HomeProfileTag ensureTag() => $_ensure(4);

  @$pb.TagNumber(7)
  $core.List<HomeProfileDisciple> get discipleList => $_getList(5);

  @$pb.TagNumber(8)
  HomeProfileMentor get mentorInfo => $_getN(6);
  @$pb.TagNumber(8)
  set mentorInfo(HomeProfileMentor v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMentorInfo() => $_has(6);
  @$pb.TagNumber(8)
  void clearMentorInfo() => clearField(8);
  @$pb.TagNumber(8)
  HomeProfileMentor ensureMentorInfo() => $_ensure(6);

  @$pb.TagNumber(9)
  HomeProfileFleet get fleet => $_getN(7);
  @$pb.TagNumber(9)
  set fleet(HomeProfileFleet v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasFleet() => $_has(7);
  @$pb.TagNumber(9)
  void clearFleet() => clearField(9);
  @$pb.TagNumber(9)
  HomeProfileFleet ensureFleet() => $_ensure(7);

  @$pb.TagNumber(10)
  HomeProfileCard get card => $_getN(8);
  @$pb.TagNumber(10)
  set card(HomeProfileCard v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCard() => $_has(8);
  @$pb.TagNumber(10)
  void clearCard() => clearField(10);
  @$pb.TagNumber(10)
  HomeProfileCard ensureCard() => $_ensure(8);

  @$pb.TagNumber(11)
  $core.List<HomeProfileDefend> get defendList => $_getList(9);

  @$pb.TagNumber(12)
  HomeProfileUnion get union => $_getN(10);
  @$pb.TagNumber(12)
  set union(HomeProfileUnion v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasUnion() => $_has(10);
  @$pb.TagNumber(12)
  void clearUnion() => clearField(12);
  @$pb.TagNumber(12)
  HomeProfileUnion ensureUnion() => $_ensure(10);

  @$pb.TagNumber(13)
  HomeProfileDecorate get decorate => $_getN(11);
  @$pb.TagNumber(13)
  set decorate(HomeProfileDecorate v) {
    setField(13, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasDecorate() => $_has(11);
  @$pb.TagNumber(13)
  void clearDecorate() => clearField(13);
  @$pb.TagNumber(13)
  HomeProfileDecorate ensureDecorate() => $_ensure(11);

  @$pb.TagNumber(14)
  $core.List<HomeProfilePartyGroup> get partyGroup => $_getList(12);

  @$pb.TagNumber(15)
  HomeProfileBussinessCard get businessCard => $_getN(13);
  @$pb.TagNumber(15)
  set businessCard(HomeProfileBussinessCard v) {
    setField(15, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasBusinessCard() => $_has(13);
  @$pb.TagNumber(15)
  void clearBusinessCard() => clearField(15);
  @$pb.TagNumber(15)
  HomeProfileBussinessCard ensureBusinessCard() => $_ensure(13);

  @$pb.TagNumber(16)
  $core.List<HomeProfileInterest> get interest => $_getList(14);

  @$pb.TagNumber(17)
  $core.List<HomeProfileGlist> get glist => $_getList(15);

  @$pb.TagNumber(18)
  HomeProfileAccompany get accompanyFirst => $_getN(16);
  @$pb.TagNumber(18)
  set accompanyFirst(HomeProfileAccompany v) {
    setField(18, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasAccompanyFirst() => $_has(16);
  @$pb.TagNumber(18)
  void clearAccompanyFirst() => clearField(18);
  @$pb.TagNumber(18)
  HomeProfileAccompany ensureAccompanyFirst() => $_ensure(16);

  @$pb.TagNumber(19)
  $core.List<HomeProfileJutitle> get juTitles => $_getList(17);

  @$pb.TagNumber(20)
  HomeProfileRookieTag get rookieTag => $_getN(18);
  @$pb.TagNumber(20)
  set rookieTag(HomeProfileRookieTag v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasRookieTag() => $_has(18);
  @$pb.TagNumber(20)
  void clearRookieTag() => clearField(20);
  @$pb.TagNumber(20)
  HomeProfileRookieTag ensureRookieTag() => $_ensure(18);

  @$pb.TagNumber(21)
  $core.List<HomeProfileSkill> get skill => $_getList(19);

  @$pb.TagNumber(22)
  $core.List<HomeProfileMark> get mark => $_getList(20);

  @$pb.TagNumber(23)
  HomeProfileGame get game => $_getN(21);
  @$pb.TagNumber(23)
  set game(HomeProfileGame v) {
    setField(23, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasGame() => $_has(21);
  @$pb.TagNumber(23)
  void clearGame() => clearField(23);
  @$pb.TagNumber(23)
  HomeProfileGame ensureGame() => $_ensure(21);

  @$pb.TagNumber(24)
  HomeProfileAccompanyInfo get accompany => $_getN(22);
  @$pb.TagNumber(24)
  set accompany(HomeProfileAccompanyInfo v) {
    setField(24, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasAccompany() => $_has(22);
  @$pb.TagNumber(24)
  void clearAccompany() => clearField(24);
  @$pb.TagNumber(24)
  HomeProfileAccompanyInfo ensureAccompany() => $_ensure(22);

  @$pb.TagNumber(25)
  HomeProfileMarryInfo get marry => $_getN(23);
  @$pb.TagNumber(25)
  set marry(HomeProfileMarryInfo v) {
    setField(25, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasMarry() => $_has(23);
  @$pb.TagNumber(25)
  void clearMarry() => clearField(25);
  @$pb.TagNumber(25)
  HomeProfileMarryInfo ensureMarry() => $_ensure(23);

  @$pb.TagNumber(26)
  HomeProfileMentorAreaInfo get mentorArea => $_getN(24);
  @$pb.TagNumber(26)
  set mentorArea(HomeProfileMentorAreaInfo v) {
    setField(26, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasMentorArea() => $_has(24);
  @$pb.TagNumber(26)
  void clearMentorArea() => clearField(26);
  @$pb.TagNumber(26)
  HomeProfileMentorAreaInfo ensureMentorArea() => $_ensure(24);

  @$pb.TagNumber(27)
  HomeProfileGameHistory get gameHistory => $_getN(25);
  @$pb.TagNumber(27)
  set gameHistory(HomeProfileGameHistory v) {
    setField(27, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasGameHistory() => $_has(25);
  @$pb.TagNumber(27)
  void clearGameHistory() => clearField(27);
  @$pb.TagNumber(27)
  HomeProfileGameHistory ensureGameHistory() => $_ensure(25);

  @$pb.TagNumber(28)
  HomeProfileKolInfo get kfgShow => $_getN(26);
  @$pb.TagNumber(28)
  set kfgShow(HomeProfileKolInfo v) {
    setField(28, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasKfgShow() => $_has(26);
  @$pb.TagNumber(28)
  void clearKfgShow() => clearField(28);
  @$pb.TagNumber(28)
  HomeProfileKolInfo ensureKfgShow() => $_ensure(26);

  @$pb.TagNumber(29)
  HomeProfileKnightGroup get knightGroup => $_getN(27);
  @$pb.TagNumber(29)
  set knightGroup(HomeProfileKnightGroup v) {
    setField(29, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasKnightGroup() => $_has(27);
  @$pb.TagNumber(29)
  void clearKnightGroup() => clearField(29);
  @$pb.TagNumber(29)
  HomeProfileKnightGroup ensureKnightGroup() => $_ensure(27);

  @$pb.TagNumber(30)
  HomeProfileUserGiftWall get giftWall => $_getN(28);
  @$pb.TagNumber(30)
  set giftWall(HomeProfileUserGiftWall v) {
    setField(30, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasGiftWall() => $_has(28);
  @$pb.TagNumber(30)
  void clearGiftWall() => clearField(30);
  @$pb.TagNumber(30)
  HomeProfileUserGiftWall ensureGiftWall() => $_ensure(28);

  @$pb.TagNumber(31)
  HomeProfileLiveTagInfo get liveTagInfo => $_getN(29);
  @$pb.TagNumber(31)
  set liveTagInfo(HomeProfileLiveTagInfo v) {
    setField(31, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasLiveTagInfo() => $_has(29);
  @$pb.TagNumber(31)
  void clearLiveTagInfo() => clearField(31);
  @$pb.TagNumber(31)
  HomeProfileLiveTagInfo ensureLiveTagInfo() => $_ensure(29);

  @$pb.TagNumber(32)
  $core.List<HomeProfileAchieveBadge> get achieveBadge => $_getList(30);

  @$pb.TagNumber(33)
  $core.List<HomeProfileSinger> get singerClub => $_getList(31);

  @$pb.TagNumber(34)
  UserMysteryInfo get mysteryInfo => $_getN(32);
  @$pb.TagNumber(34)
  set mysteryInfo(UserMysteryInfo v) {
    setField(34, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasMysteryInfo() => $_has(32);
  @$pb.TagNumber(34)
  void clearMysteryInfo() => clearField(34);
  @$pb.TagNumber(34)
  UserMysteryInfo ensureMysteryInfo() => $_ensure(32);

  @$pb.TagNumber(35)
  HomeProfileCardDecorate get cardDecorate => $_getN(33);
  @$pb.TagNumber(35)
  set cardDecorate(HomeProfileCardDecorate v) {
    setField(35, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasCardDecorate() => $_has(33);
  @$pb.TagNumber(35)
  void clearCardDecorate() => clearField(35);
  @$pb.TagNumber(35)
  HomeProfileCardDecorate ensureCardDecorate() => $_ensure(33);

  @$pb.TagNumber(36)
  $core.List<$0.ExhibitCommodityItem> get exhibitData => $_getList(34);

  @$pb.TagNumber(37)
  HomeProfileGeneralSettings get generalSettings => $_getN(35);
  @$pb.TagNumber(37)
  set generalSettings(HomeProfileGeneralSettings v) {
    setField(37, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasGeneralSettings() => $_has(35);
  @$pb.TagNumber(37)
  void clearGeneralSettings() => clearField(37);
  @$pb.TagNumber(37)
  HomeProfileGeneralSettings ensureGeneralSettings() => $_ensure(35);

  @$pb.TagNumber(38)
  $core.List<HomeProfileVoiceTag> get voiceTag => $_getList(36);

  @$pb.TagNumber(39)
  HomeProfileBirthdayInfo get birthday => $_getN(37);
  @$pb.TagNumber(39)
  set birthday(HomeProfileBirthdayInfo v) {
    setField(39, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasBirthday() => $_has(37);
  @$pb.TagNumber(39)
  void clearBirthday() => clearField(39);
  @$pb.TagNumber(39)
  HomeProfileBirthdayInfo ensureBirthday() => $_ensure(37);

  @$pb.TagNumber(40)
  $core.List<giftInfo> get interactGiftInfos => $_getList(38);

  @$pb.TagNumber(41)
  RoomCrossPkQualifyingSummary get cpkSummary => $_getN(39);
  @$pb.TagNumber(41)
  set cpkSummary(RoomCrossPkQualifyingSummary v) {
    setField(41, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasCpkSummary() => $_has(39);
  @$pb.TagNumber(41)
  void clearCpkSummary() => clearField(41);
  @$pb.TagNumber(41)
  RoomCrossPkQualifyingSummary ensureCpkSummary() => $_ensure(39);

  @$pb.TagNumber(42)
  $1.GiftBookBriefInfo get briefInfo => $_getN(40);
  @$pb.TagNumber(42)
  set briefInfo($1.GiftBookBriefInfo v) {
    setField(42, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasBriefInfo() => $_has(40);
  @$pb.TagNumber(42)
  void clearBriefInfo() => clearField(42);
  @$pb.TagNumber(42)
  $1.GiftBookBriefInfo ensureBriefInfo() => $_ensure(40);

  @$pb.TagNumber(43)
  $core.bool get isCloseGiftWall => $_getBF(41);
  @$pb.TagNumber(43)
  set isCloseGiftWall($core.bool v) {
    $_setBool(41, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasIsCloseGiftWall() => $_has(41);
  @$pb.TagNumber(43)
  void clearIsCloseGiftWall() => clearField(43);

  @$pb.TagNumber(44)
  $core.int get exhibitionDisplay => $_getIZ(42);
  @$pb.TagNumber(44)
  set exhibitionDisplay($core.int v) {
    $_setUnsignedInt32(42, v);
  }

  @$pb.TagNumber(44)
  $core.bool hasExhibitionDisplay() => $_has(42);
  @$pb.TagNumber(44)
  void clearExhibitionDisplay() => clearField(44);

  @$pb.TagNumber(45)
  StarshipEntry get starshipDetail => $_getN(43);
  @$pb.TagNumber(45)
  set starshipDetail(StarshipEntry v) {
    setField(45, v);
  }

  @$pb.TagNumber(45)
  $core.bool hasStarshipDetail() => $_has(43);
  @$pb.TagNumber(45)
  void clearStarshipDetail() => clearField(45);
  @$pb.TagNumber(45)
  StarshipEntry ensureStarshipDetail() => $_ensure(43);
}

class StarshipEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StarshipEntry',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'descTxt')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'memberNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lvIcon')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  StarshipEntry._() : super();
  factory StarshipEntry({
    $core.String? icon,
    $core.String? name,
    $core.String? descTxt,
    $core.int? memberNum,
    $core.String? lvIcon,
    $core.int? rank,
    $core.int? score,
    $core.int? id,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (descTxt != null) {
      _result.descTxt = descTxt;
    }
    if (memberNum != null) {
      _result.memberNum = memberNum;
    }
    if (lvIcon != null) {
      _result.lvIcon = lvIcon;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (score != null) {
      _result.score = score;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory StarshipEntry.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StarshipEntry.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StarshipEntry clone() => StarshipEntry()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StarshipEntry copyWith(void Function(StarshipEntry) updates) =>
      super.copyWith((message) => updates(message as StarshipEntry))
          as StarshipEntry; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StarshipEntry create() => StarshipEntry._();
  StarshipEntry createEmptyInstance() => create();
  static $pb.PbList<StarshipEntry> createRepeated() =>
      $pb.PbList<StarshipEntry>();
  @$core.pragma('dart2js:noInline')
  static StarshipEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StarshipEntry>(create);
  static StarshipEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get descTxt => $_getSZ(2);
  @$pb.TagNumber(3)
  set descTxt($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDescTxt() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescTxt() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get memberNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set memberNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMemberNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemberNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get lvIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set lvIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLvIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearLvIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get rank => $_getIZ(5);
  @$pb.TagNumber(6)
  set rank($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRank() => $_has(5);
  @$pb.TagNumber(6)
  void clearRank() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get score => $_getIZ(6);
  @$pb.TagNumber(7)
  set score($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasScore() => $_has(6);
  @$pb.TagNumber(7)
  void clearScore() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get id => $_getIZ(7);
  @$pb.TagNumber(8)
  set id($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasId() => $_has(7);
  @$pb.TagNumber(8)
  void clearId() => clearField(8);
}

class giftInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'giftInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOM<HomeProfileInteractCombineGift>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'combineGift',
        subBuilder: HomeProfileInteractCombineGift.create)
    ..hasRequiredFields = false;

  giftInfo._() : super();
  factory giftInfo({
    $core.int? id,
    $core.String? name,
    $core.String? type,
    $core.int? price,
    $core.String? desc,
    $core.String? icon,
    HomeProfileInteractCombineGift? combineGift,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    if (price != null) {
      _result.price = price;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (combineGift != null) {
      _result.combineGift = combineGift;
    }
    return _result;
  }
  factory giftInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory giftInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  giftInfo clone() => giftInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  giftInfo copyWith(void Function(giftInfo) updates) =>
      super.copyWith((message) => updates(message as giftInfo))
          as giftInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static giftInfo create() => giftInfo._();
  giftInfo createEmptyInstance() => create();
  static $pb.PbList<giftInfo> createRepeated() => $pb.PbList<giftInfo>();
  @$core.pragma('dart2js:noInline')
  static giftInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<giftInfo>(create);
  static giftInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get price => $_getIZ(3);
  @$pb.TagNumber(4)
  set price($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get desc => $_getSZ(4);
  @$pb.TagNumber(5)
  set desc($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDesc() => $_has(4);
  @$pb.TagNumber(5)
  void clearDesc() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get icon => $_getSZ(5);
  @$pb.TagNumber(6)
  set icon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearIcon() => clearField(6);

  @$pb.TagNumber(7)
  HomeProfileInteractCombineGift get combineGift => $_getN(6);
  @$pb.TagNumber(7)
  set combineGift(HomeProfileInteractCombineGift v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCombineGift() => $_has(6);
  @$pb.TagNumber(7)
  void clearCombineGift() => clearField(7);
  @$pb.TagNumber(7)
  HomeProfileInteractCombineGift ensureCombineGift() => $_ensure(6);
}

class HomeProfileInteractCombineGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileInteractCombineGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'combineId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'combineName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'combineDesc')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'combineType',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftA',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftAName')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftB',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftBName')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'combineMoney',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HomeProfileInteractCombineGift._() : super();
  factory HomeProfileInteractCombineGift({
    $core.int? combineId,
    $core.String? combineName,
    $core.String? combineDesc,
    $core.int? combineType,
    $core.int? giftA,
    $core.String? giftAName,
    $core.int? giftB,
    $core.String? giftBName,
    $core.int? combineMoney,
  }) {
    final _result = create();
    if (combineId != null) {
      _result.combineId = combineId;
    }
    if (combineName != null) {
      _result.combineName = combineName;
    }
    if (combineDesc != null) {
      _result.combineDesc = combineDesc;
    }
    if (combineType != null) {
      _result.combineType = combineType;
    }
    if (giftA != null) {
      _result.giftA = giftA;
    }
    if (giftAName != null) {
      _result.giftAName = giftAName;
    }
    if (giftB != null) {
      _result.giftB = giftB;
    }
    if (giftBName != null) {
      _result.giftBName = giftBName;
    }
    if (combineMoney != null) {
      _result.combineMoney = combineMoney;
    }
    return _result;
  }
  factory HomeProfileInteractCombineGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileInteractCombineGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileInteractCombineGift clone() =>
      HomeProfileInteractCombineGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileInteractCombineGift copyWith(
          void Function(HomeProfileInteractCombineGift) updates) =>
      super.copyWith(
              (message) => updates(message as HomeProfileInteractCombineGift))
          as HomeProfileInteractCombineGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileInteractCombineGift create() =>
      HomeProfileInteractCombineGift._();
  HomeProfileInteractCombineGift createEmptyInstance() => create();
  static $pb.PbList<HomeProfileInteractCombineGift> createRepeated() =>
      $pb.PbList<HomeProfileInteractCombineGift>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileInteractCombineGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileInteractCombineGift>(create);
  static HomeProfileInteractCombineGift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get combineId => $_getIZ(0);
  @$pb.TagNumber(1)
  set combineId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCombineId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCombineId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get combineName => $_getSZ(1);
  @$pb.TagNumber(2)
  set combineName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCombineName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCombineName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get combineDesc => $_getSZ(2);
  @$pb.TagNumber(3)
  set combineDesc($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCombineDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearCombineDesc() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get combineType => $_getIZ(3);
  @$pb.TagNumber(4)
  set combineType($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCombineType() => $_has(3);
  @$pb.TagNumber(4)
  void clearCombineType() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get giftA => $_getIZ(4);
  @$pb.TagNumber(5)
  set giftA($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftA() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftA() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get giftAName => $_getSZ(5);
  @$pb.TagNumber(6)
  set giftAName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGiftAName() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftAName() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get giftB => $_getIZ(6);
  @$pb.TagNumber(7)
  set giftB($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGiftB() => $_has(6);
  @$pb.TagNumber(7)
  void clearGiftB() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get giftBName => $_getSZ(7);
  @$pb.TagNumber(8)
  set giftBName($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGiftBName() => $_has(7);
  @$pb.TagNumber(8)
  void clearGiftBName() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get combineMoney => $_getIZ(8);
  @$pb.TagNumber(9)
  set combineMoney($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasCombineMoney() => $_has(8);
  @$pb.TagNumber(9)
  void clearCombineMoney() => clearField(9);
}

class ResHomeProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomeProfile',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOM<HomeProfileData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HomeProfileData.create)
    ..hasRequiredFields = false;

  ResHomeProfile._() : super();
  factory ResHomeProfile({
    $core.bool? success,
    $core.String? msg,
    HomeProfileData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ResHomeProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomeProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomeProfile clone() => ResHomeProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomeProfile copyWith(void Function(ResHomeProfile) updates) =>
      super.copyWith((message) => updates(message as ResHomeProfile))
          as ResHomeProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomeProfile create() => ResHomeProfile._();
  ResHomeProfile createEmptyInstance() => create();
  static $pb.PbList<ResHomeProfile> createRepeated() =>
      $pb.PbList<ResHomeProfile>();
  @$core.pragma('dart2js:noInline')
  static ResHomeProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomeProfile>(create);
  static ResHomeProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  HomeProfileData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HomeProfileData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HomeProfileData ensureData() => $_ensure(2);
}

class HomeProfileSyncBase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileSyncBase',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDatelineDiff')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'followRelation',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fansNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accompanyNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendCount',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isBirthday',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HomeProfileSyncBase._() : super();
  factory HomeProfileSyncBase({
    $core.int? uid,
    $core.int? onlineStatus,
    $core.int? onlineDateline,
    $core.String? onlineDatelineDiff,
    $core.int? title,
    $core.int? followRelation,
    $core.int? fansNum,
    $core.int? accompanyNum,
    $core.int? defendCount,
    $core.int? knightLevel,
    $core.int? isBirthday,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (onlineDatelineDiff != null) {
      _result.onlineDatelineDiff = onlineDatelineDiff;
    }
    if (title != null) {
      _result.title = title;
    }
    if (followRelation != null) {
      _result.followRelation = followRelation;
    }
    if (fansNum != null) {
      _result.fansNum = fansNum;
    }
    if (accompanyNum != null) {
      _result.accompanyNum = accompanyNum;
    }
    if (defendCount != null) {
      _result.defendCount = defendCount;
    }
    if (knightLevel != null) {
      _result.knightLevel = knightLevel;
    }
    if (isBirthday != null) {
      _result.isBirthday = isBirthday;
    }
    return _result;
  }
  factory HomeProfileSyncBase.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileSyncBase.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileSyncBase clone() => HomeProfileSyncBase()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileSyncBase copyWith(void Function(HomeProfileSyncBase) updates) =>
      super.copyWith((message) => updates(message as HomeProfileSyncBase))
          as HomeProfileSyncBase; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileSyncBase create() => HomeProfileSyncBase._();
  HomeProfileSyncBase createEmptyInstance() => create();
  static $pb.PbList<HomeProfileSyncBase> createRepeated() =>
      $pb.PbList<HomeProfileSyncBase>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileSyncBase getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileSyncBase>(create);
  static HomeProfileSyncBase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get onlineStatus => $_getIZ(1);
  @$pb.TagNumber(2)
  set onlineStatus($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOnlineStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearOnlineStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get onlineDateline => $_getIZ(2);
  @$pb.TagNumber(3)
  set onlineDateline($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOnlineDateline() => $_has(2);
  @$pb.TagNumber(3)
  void clearOnlineDateline() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get onlineDatelineDiff => $_getSZ(3);
  @$pb.TagNumber(4)
  set onlineDatelineDiff($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOnlineDatelineDiff() => $_has(3);
  @$pb.TagNumber(4)
  void clearOnlineDatelineDiff() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get title => $_getIZ(4);
  @$pb.TagNumber(5)
  set title($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get followRelation => $_getIZ(5);
  @$pb.TagNumber(6)
  set followRelation($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFollowRelation() => $_has(5);
  @$pb.TagNumber(6)
  void clearFollowRelation() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get fansNum => $_getIZ(6);
  @$pb.TagNumber(7)
  set fansNum($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasFansNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearFansNum() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get accompanyNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set accompanyNum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAccompanyNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearAccompanyNum() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get defendCount => $_getIZ(8);
  @$pb.TagNumber(9)
  set defendCount($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasDefendCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearDefendCount() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get knightLevel => $_getIZ(9);
  @$pb.TagNumber(10)
  set knightLevel($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasKnightLevel() => $_has(9);
  @$pb.TagNumber(10)
  void clearKnightLevel() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get isBirthday => $_getIZ(10);
  @$pb.TagNumber(11)
  set isBirthday($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasIsBirthday() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsBirthday() => clearField(11);
}

class HomeProfileSyncData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileSyncData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<HomeProfileSyncBase>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'base',
        subBuilder: HomeProfileSyncBase.create)
    ..aOM<HomeProfileRoom>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room',
        subBuilder: HomeProfileRoom.create)
    ..aOM<HomeProfileFleet>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fleet',
        subBuilder: HomeProfileFleet.create)
    ..aOM<HomeProfileKolInfo>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'kfgShow',
        subBuilder: HomeProfileKolInfo.create)
    ..pc<HomeProfileMark>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mark',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileMark.create)
    ..aOM<HomeProfileUserGiftWall>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftWall',
        subBuilder: HomeProfileUserGiftWall.create)
    ..aOM<HomeProfileLiveTagInfo>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveTagInfo',
        subBuilder: HomeProfileLiveTagInfo.create)
    ..aOM<HomeProfileImprint>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imprint',
        subBuilder: HomeProfileImprint.create)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagIcon')
    ..aOM<RoomCrossPkQualifyingSummary>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cpkSummary',
        protoName: 'cpkSummary',
        subBuilder: RoomCrossPkQualifyingSummary.create)
    ..aOM<$1.GiftBookBriefInfo>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'briefInfo',
        subBuilder: $1.GiftBookBriefInfo.create)
    ..pc<MountSerialProfile>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mountSerialData',
        $pb.PbFieldType.PM,
        subBuilder: MountSerialProfile.create)
    ..hasRequiredFields = false;

  HomeProfileSyncData._() : super();
  factory HomeProfileSyncData({
    HomeProfileSyncBase? base,
    HomeProfileRoom? room,
    HomeProfileFleet? fleet,
    HomeProfileKolInfo? kfgShow,
    $core.Iterable<HomeProfileMark>? mark,
    HomeProfileUserGiftWall? giftWall,
    HomeProfileLiveTagInfo? liveTagInfo,
    HomeProfileImprint? imprint,
    $core.String? tagIcon,
    RoomCrossPkQualifyingSummary? cpkSummary,
    $1.GiftBookBriefInfo? briefInfo,
    $core.Iterable<MountSerialProfile>? mountSerialData,
  }) {
    final _result = create();
    if (base != null) {
      _result.base = base;
    }
    if (room != null) {
      _result.room = room;
    }
    if (fleet != null) {
      _result.fleet = fleet;
    }
    if (kfgShow != null) {
      _result.kfgShow = kfgShow;
    }
    if (mark != null) {
      _result.mark.addAll(mark);
    }
    if (giftWall != null) {
      _result.giftWall = giftWall;
    }
    if (liveTagInfo != null) {
      _result.liveTagInfo = liveTagInfo;
    }
    if (imprint != null) {
      _result.imprint = imprint;
    }
    if (tagIcon != null) {
      _result.tagIcon = tagIcon;
    }
    if (cpkSummary != null) {
      _result.cpkSummary = cpkSummary;
    }
    if (briefInfo != null) {
      _result.briefInfo = briefInfo;
    }
    if (mountSerialData != null) {
      _result.mountSerialData.addAll(mountSerialData);
    }
    return _result;
  }
  factory HomeProfileSyncData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileSyncData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileSyncData clone() => HomeProfileSyncData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileSyncData copyWith(void Function(HomeProfileSyncData) updates) =>
      super.copyWith((message) => updates(message as HomeProfileSyncData))
          as HomeProfileSyncData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileSyncData create() => HomeProfileSyncData._();
  HomeProfileSyncData createEmptyInstance() => create();
  static $pb.PbList<HomeProfileSyncData> createRepeated() =>
      $pb.PbList<HomeProfileSyncData>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileSyncData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileSyncData>(create);
  static HomeProfileSyncData? _defaultInstance;

  @$pb.TagNumber(1)
  HomeProfileSyncBase get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(HomeProfileSyncBase v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  HomeProfileSyncBase ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  HomeProfileRoom get room => $_getN(1);
  @$pb.TagNumber(2)
  set room(HomeProfileRoom v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => clearField(2);
  @$pb.TagNumber(2)
  HomeProfileRoom ensureRoom() => $_ensure(1);

  @$pb.TagNumber(3)
  HomeProfileFleet get fleet => $_getN(2);
  @$pb.TagNumber(3)
  set fleet(HomeProfileFleet v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFleet() => $_has(2);
  @$pb.TagNumber(3)
  void clearFleet() => clearField(3);
  @$pb.TagNumber(3)
  HomeProfileFleet ensureFleet() => $_ensure(2);

  @$pb.TagNumber(4)
  HomeProfileKolInfo get kfgShow => $_getN(3);
  @$pb.TagNumber(4)
  set kfgShow(HomeProfileKolInfo v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasKfgShow() => $_has(3);
  @$pb.TagNumber(4)
  void clearKfgShow() => clearField(4);
  @$pb.TagNumber(4)
  HomeProfileKolInfo ensureKfgShow() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<HomeProfileMark> get mark => $_getList(4);

  @$pb.TagNumber(6)
  HomeProfileUserGiftWall get giftWall => $_getN(5);
  @$pb.TagNumber(6)
  set giftWall(HomeProfileUserGiftWall v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGiftWall() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftWall() => clearField(6);
  @$pb.TagNumber(6)
  HomeProfileUserGiftWall ensureGiftWall() => $_ensure(5);

  @$pb.TagNumber(7)
  HomeProfileLiveTagInfo get liveTagInfo => $_getN(6);
  @$pb.TagNumber(7)
  set liveTagInfo(HomeProfileLiveTagInfo v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLiveTagInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearLiveTagInfo() => clearField(7);
  @$pb.TagNumber(7)
  HomeProfileLiveTagInfo ensureLiveTagInfo() => $_ensure(6);

  @$pb.TagNumber(8)
  HomeProfileImprint get imprint => $_getN(7);
  @$pb.TagNumber(8)
  set imprint(HomeProfileImprint v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasImprint() => $_has(7);
  @$pb.TagNumber(8)
  void clearImprint() => clearField(8);
  @$pb.TagNumber(8)
  HomeProfileImprint ensureImprint() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get tagIcon => $_getSZ(8);
  @$pb.TagNumber(9)
  set tagIcon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTagIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearTagIcon() => clearField(9);

  @$pb.TagNumber(10)
  RoomCrossPkQualifyingSummary get cpkSummary => $_getN(9);
  @$pb.TagNumber(10)
  set cpkSummary(RoomCrossPkQualifyingSummary v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCpkSummary() => $_has(9);
  @$pb.TagNumber(10)
  void clearCpkSummary() => clearField(10);
  @$pb.TagNumber(10)
  RoomCrossPkQualifyingSummary ensureCpkSummary() => $_ensure(9);

  @$pb.TagNumber(11)
  $1.GiftBookBriefInfo get briefInfo => $_getN(10);
  @$pb.TagNumber(11)
  set briefInfo($1.GiftBookBriefInfo v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasBriefInfo() => $_has(10);
  @$pb.TagNumber(11)
  void clearBriefInfo() => clearField(11);
  @$pb.TagNumber(11)
  $1.GiftBookBriefInfo ensureBriefInfo() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.List<MountSerialProfile> get mountSerialData => $_getList(11);
}

class MountSerialProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MountSerialProfile',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serialId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inUse')
    ..pc<MountSerialProfileItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: MountSerialProfileItem.create)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  MountSerialProfile._() : super();
  factory MountSerialProfile({
    $core.int? serialId,
    $core.String? title,
    $core.bool? inUse,
    $core.Iterable<MountSerialProfileItem>? items,
    $core.String? icon,
  }) {
    final _result = create();
    if (serialId != null) {
      _result.serialId = serialId;
    }
    if (title != null) {
      _result.title = title;
    }
    if (inUse != null) {
      _result.inUse = inUse;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory MountSerialProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MountSerialProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MountSerialProfile clone() => MountSerialProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MountSerialProfile copyWith(void Function(MountSerialProfile) updates) =>
      super.copyWith((message) => updates(message as MountSerialProfile))
          as MountSerialProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MountSerialProfile create() => MountSerialProfile._();
  MountSerialProfile createEmptyInstance() => create();
  static $pb.PbList<MountSerialProfile> createRepeated() =>
      $pb.PbList<MountSerialProfile>();
  @$core.pragma('dart2js:noInline')
  static MountSerialProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MountSerialProfile>(create);
  static MountSerialProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get serialId => $_getIZ(0);
  @$pb.TagNumber(1)
  set serialId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSerialId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSerialId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get inUse => $_getBF(2);
  @$pb.TagNumber(3)
  set inUse($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasInUse() => $_has(2);
  @$pb.TagNumber(3)
  void clearInUse() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<MountSerialProfileItem> get items => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);
}

class MountSerialProfileItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MountSerialProfileItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlock')
    ..hasRequiredFields = false;

  MountSerialProfileItem._() : super();
  factory MountSerialProfileItem({
    $core.String? name,
    $core.String? icon,
    $core.bool? unlock,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (unlock != null) {
      _result.unlock = unlock;
    }
    return _result;
  }
  factory MountSerialProfileItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MountSerialProfileItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MountSerialProfileItem clone() =>
      MountSerialProfileItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MountSerialProfileItem copyWith(
          void Function(MountSerialProfileItem) updates) =>
      super.copyWith((message) => updates(message as MountSerialProfileItem))
          as MountSerialProfileItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MountSerialProfileItem create() => MountSerialProfileItem._();
  MountSerialProfileItem createEmptyInstance() => create();
  static $pb.PbList<MountSerialProfileItem> createRepeated() =>
      $pb.PbList<MountSerialProfileItem>();
  @$core.pragma('dart2js:noInline')
  static MountSerialProfileItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MountSerialProfileItem>(create);
  static MountSerialProfileItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get unlock => $_getBF(2);
  @$pb.TagNumber(3)
  set unlock($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUnlock() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnlock() => clearField(3);
}

class ResHomeSyncProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomeSyncProfile',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOM<HomeProfileSyncData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HomeProfileSyncData.create)
    ..hasRequiredFields = false;

  ResHomeSyncProfile._() : super();
  factory ResHomeSyncProfile({
    $core.bool? success,
    $core.String? msg,
    HomeProfileSyncData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ResHomeSyncProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomeSyncProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomeSyncProfile clone() => ResHomeSyncProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomeSyncProfile copyWith(void Function(ResHomeSyncProfile) updates) =>
      super.copyWith((message) => updates(message as ResHomeSyncProfile))
          as ResHomeSyncProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomeSyncProfile create() => ResHomeSyncProfile._();
  ResHomeSyncProfile createEmptyInstance() => create();
  static $pb.PbList<ResHomeSyncProfile> createRepeated() =>
      $pb.PbList<ResHomeSyncProfile>();
  @$core.pragma('dart2js:noInline')
  static ResHomeSyncProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomeSyncProfile>(create);
  static ResHomeSyncProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  HomeProfileSyncData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HomeProfileSyncData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HomeProfileSyncData ensureData() => $_ensure(2);
}

class LiveLabelItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LiveLabelItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'header')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubble')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effect')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveOnly',
        $pb.PbFieldType.OU3,
        protoName: 'liveOnly')
    ..hasRequiredFields = false;

  LiveLabelItem._() : super();
  factory LiveLabelItem({
    $core.String? header,
    $core.String? bubble,
    $core.String? effect,
    $core.int? liveOnly,
  }) {
    final _result = create();
    if (header != null) {
      _result.header = header;
    }
    if (bubble != null) {
      _result.bubble = bubble;
    }
    if (effect != null) {
      _result.effect = effect;
    }
    if (liveOnly != null) {
      _result.liveOnly = liveOnly;
    }
    return _result;
  }
  factory LiveLabelItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LiveLabelItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LiveLabelItem clone() => LiveLabelItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LiveLabelItem copyWith(void Function(LiveLabelItem) updates) =>
      super.copyWith((message) => updates(message as LiveLabelItem))
          as LiveLabelItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LiveLabelItem create() => LiveLabelItem._();
  LiveLabelItem createEmptyInstance() => create();
  static $pb.PbList<LiveLabelItem> createRepeated() =>
      $pb.PbList<LiveLabelItem>();
  @$core.pragma('dart2js:noInline')
  static LiveLabelItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LiveLabelItem>(create);
  static LiveLabelItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get header => $_getSZ(0);
  @$pb.TagNumber(1)
  set header($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bubble => $_getSZ(1);
  @$pb.TagNumber(2)
  set bubble($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBubble() => $_has(1);
  @$pb.TagNumber(2)
  void clearBubble() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get effect => $_getSZ(2);
  @$pb.TagNumber(3)
  set effect($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEffect() => $_has(2);
  @$pb.TagNumber(3)
  void clearEffect() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get liveOnly => $_getIZ(3);
  @$pb.TagNumber(4)
  set liveOnly($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLiveOnly() => $_has(3);
  @$pb.TagNumber(4)
  void clearLiveOnly() => clearField(4);
}

class HomeProfileLiveTagInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileLiveTagInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'text')
    ..hasRequiredFields = false;

  HomeProfileLiveTagInfo._() : super();
  factory HomeProfileLiveTagInfo({
    $core.int? id,
    $core.String? text,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (text != null) {
      _result.text = text;
    }
    return _result;
  }
  factory HomeProfileLiveTagInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileLiveTagInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileLiveTagInfo clone() =>
      HomeProfileLiveTagInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileLiveTagInfo copyWith(
          void Function(HomeProfileLiveTagInfo) updates) =>
      super.copyWith((message) => updates(message as HomeProfileLiveTagInfo))
          as HomeProfileLiveTagInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileLiveTagInfo create() => HomeProfileLiveTagInfo._();
  HomeProfileLiveTagInfo createEmptyInstance() => create();
  static $pb.PbList<HomeProfileLiveTagInfo> createRepeated() =>
      $pb.PbList<HomeProfileLiveTagInfo>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileLiveTagInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileLiveTagInfo>(create);
  static HomeProfileLiveTagInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);
}

class HomeProfileBadgesResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileBadgesResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..pc<HomeProfileBadgeItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badges',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileBadgeItem.create)
    ..hasRequiredFields = false;

  HomeProfileBadgesResp._() : super();
  factory HomeProfileBadgesResp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<HomeProfileBadgeItem>? badges,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (badges != null) {
      _result.badges.addAll(badges);
    }
    return _result;
  }
  factory HomeProfileBadgesResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileBadgesResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileBadgesResp clone() =>
      HomeProfileBadgesResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileBadgesResp copyWith(
          void Function(HomeProfileBadgesResp) updates) =>
      super.copyWith((message) => updates(message as HomeProfileBadgesResp))
          as HomeProfileBadgesResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileBadgesResp create() => HomeProfileBadgesResp._();
  HomeProfileBadgesResp createEmptyInstance() => create();
  static $pb.PbList<HomeProfileBadgesResp> createRepeated() =>
      $pb.PbList<HomeProfileBadgesResp>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileBadgesResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileBadgesResp>(create);
  static HomeProfileBadgesResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<HomeProfileBadgeItem> get badges => $_getList(2);
}

class HomeProfileBadgeItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileBadgeItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeId',
        $pb.PbFieldType.OU3)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isWear')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'additionName')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awakeGift')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeType',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wearTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftBadgeType',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HomeProfileBadgeItem._() : super();
  factory HomeProfileBadgeItem({
    $core.int? badgeId,
    $core.bool? isWear,
    $core.String? icon,
    $core.String? desc,
    $core.String? additionName,
    $core.bool? awakeGift,
    $core.int? badgeType,
    $core.int? wearTime,
    $core.int? giftBadgeType,
  }) {
    final _result = create();
    if (badgeId != null) {
      _result.badgeId = badgeId;
    }
    if (isWear != null) {
      _result.isWear = isWear;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (additionName != null) {
      _result.additionName = additionName;
    }
    if (awakeGift != null) {
      _result.awakeGift = awakeGift;
    }
    if (badgeType != null) {
      _result.badgeType = badgeType;
    }
    if (wearTime != null) {
      _result.wearTime = wearTime;
    }
    if (giftBadgeType != null) {
      _result.giftBadgeType = giftBadgeType;
    }
    return _result;
  }
  factory HomeProfileBadgeItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileBadgeItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileBadgeItem clone() =>
      HomeProfileBadgeItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileBadgeItem copyWith(void Function(HomeProfileBadgeItem) updates) =>
      super.copyWith((message) => updates(message as HomeProfileBadgeItem))
          as HomeProfileBadgeItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileBadgeItem create() => HomeProfileBadgeItem._();
  HomeProfileBadgeItem createEmptyInstance() => create();
  static $pb.PbList<HomeProfileBadgeItem> createRepeated() =>
      $pb.PbList<HomeProfileBadgeItem>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileBadgeItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileBadgeItem>(create);
  static HomeProfileBadgeItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get badgeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set badgeId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBadgeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBadgeId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isWear => $_getBF(1);
  @$pb.TagNumber(2)
  set isWear($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsWear() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsWear() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get additionName => $_getSZ(4);
  @$pb.TagNumber(5)
  set additionName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAdditionName() => $_has(4);
  @$pb.TagNumber(5)
  void clearAdditionName() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get awakeGift => $_getBF(5);
  @$pb.TagNumber(6)
  set awakeGift($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAwakeGift() => $_has(5);
  @$pb.TagNumber(6)
  void clearAwakeGift() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get badgeType => $_getIZ(6);
  @$pb.TagNumber(7)
  set badgeType($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBadgeType() => $_has(6);
  @$pb.TagNumber(7)
  void clearBadgeType() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get wearTime => $_getIZ(7);
  @$pb.TagNumber(8)
  set wearTime($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasWearTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearWearTime() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get giftBadgeType => $_getIZ(8);
  @$pb.TagNumber(9)
  set giftBadgeType($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGiftBadgeType() => $_has(8);
  @$pb.TagNumber(9)
  void clearGiftBadgeType() => clearField(9);
}

class HomeProfileWearBadgeReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileWearBadgeReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HomeProfileWearBadgeReq._() : super();
  factory HomeProfileWearBadgeReq({
    $core.int? badgeId,
  }) {
    final _result = create();
    if (badgeId != null) {
      _result.badgeId = badgeId;
    }
    return _result;
  }
  factory HomeProfileWearBadgeReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileWearBadgeReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileWearBadgeReq clone() =>
      HomeProfileWearBadgeReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileWearBadgeReq copyWith(
          void Function(HomeProfileWearBadgeReq) updates) =>
      super.copyWith((message) => updates(message as HomeProfileWearBadgeReq))
          as HomeProfileWearBadgeReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileWearBadgeReq create() => HomeProfileWearBadgeReq._();
  HomeProfileWearBadgeReq createEmptyInstance() => create();
  static $pb.PbList<HomeProfileWearBadgeReq> createRepeated() =>
      $pb.PbList<HomeProfileWearBadgeReq>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileWearBadgeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileWearBadgeReq>(create);
  static HomeProfileWearBadgeReq? _defaultInstance;

  @$pb.TagNumber(2)
  $core.int get badgeId => $_getIZ(0);
  @$pb.TagNumber(2)
  set badgeId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBadgeId() => $_has(0);
  @$pb.TagNumber(2)
  void clearBadgeId() => clearField(2);
}

class HomeProfileWearBadgeResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileWearBadgeResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..hasRequiredFields = false;

  HomeProfileWearBadgeResp._() : super();
  factory HomeProfileWearBadgeResp({
    $core.bool? success,
    $core.String? msg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory HomeProfileWearBadgeResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileWearBadgeResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileWearBadgeResp clone() =>
      HomeProfileWearBadgeResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileWearBadgeResp copyWith(
          void Function(HomeProfileWearBadgeResp) updates) =>
      super.copyWith((message) => updates(message as HomeProfileWearBadgeResp))
          as HomeProfileWearBadgeResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileWearBadgeResp create() => HomeProfileWearBadgeResp._();
  HomeProfileWearBadgeResp createEmptyInstance() => create();
  static $pb.PbList<HomeProfileWearBadgeResp> createRepeated() =>
      $pb.PbList<HomeProfileWearBadgeResp>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileWearBadgeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileWearBadgeResp>(create);
  static HomeProfileWearBadgeResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);
}

class HomeProfileBannerResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileBannerResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOM<HomeProfileBannerData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HomeProfileBannerData.create)
    ..hasRequiredFields = false;

  HomeProfileBannerResp._() : super();
  factory HomeProfileBannerResp({
    $core.bool? success,
    $core.String? msg,
    HomeProfileBannerData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory HomeProfileBannerResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileBannerResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileBannerResp clone() =>
      HomeProfileBannerResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileBannerResp copyWith(
          void Function(HomeProfileBannerResp) updates) =>
      super.copyWith((message) => updates(message as HomeProfileBannerResp))
          as HomeProfileBannerResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileBannerResp create() => HomeProfileBannerResp._();
  HomeProfileBannerResp createEmptyInstance() => create();
  static $pb.PbList<HomeProfileBannerResp> createRepeated() =>
      $pb.PbList<HomeProfileBannerResp>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileBannerResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileBannerResp>(create);
  static HomeProfileBannerResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  HomeProfileBannerData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HomeProfileBannerData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HomeProfileBannerData ensureData() => $_ensure(2);
}

class HomeProfileBannerData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileBannerData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'firstBannerId')
    ..hasRequiredFields = false;

  HomeProfileBannerData._() : super();
  factory HomeProfileBannerData({
    $core.String? title,
    $core.bool? display,
    $core.String? firstBannerId,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (display != null) {
      _result.display = display;
    }
    if (firstBannerId != null) {
      _result.firstBannerId = firstBannerId;
    }
    return _result;
  }
  factory HomeProfileBannerData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileBannerData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileBannerData clone() =>
      HomeProfileBannerData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileBannerData copyWith(
          void Function(HomeProfileBannerData) updates) =>
      super.copyWith((message) => updates(message as HomeProfileBannerData))
          as HomeProfileBannerData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileBannerData create() => HomeProfileBannerData._();
  HomeProfileBannerData createEmptyInstance() => create();
  static $pb.PbList<HomeProfileBannerData> createRepeated() =>
      $pb.PbList<HomeProfileBannerData>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileBannerData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileBannerData>(create);
  static HomeProfileBannerData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get display => $_getBF(1);
  @$pb.TagNumber(2)
  set display($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDisplay() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplay() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get firstBannerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set firstBannerId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFirstBannerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstBannerId() => clearField(3);
}

class ResHomeProfileGame extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomeProfileGame',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..pc<HomeProfileGameItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileGameItem.create)
    ..hasRequiredFields = false;

  ResHomeProfileGame._() : super();
  factory ResHomeProfileGame({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<HomeProfileGameItem>? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory ResHomeProfileGame.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomeProfileGame.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomeProfileGame clone() => ResHomeProfileGame()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomeProfileGame copyWith(void Function(ResHomeProfileGame) updates) =>
      super.copyWith((message) => updates(message as ResHomeProfileGame))
          as ResHomeProfileGame; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomeProfileGame create() => ResHomeProfileGame._();
  ResHomeProfileGame createEmptyInstance() => create();
  static $pb.PbList<ResHomeProfileGame> createRepeated() =>
      $pb.PbList<ResHomeProfileGame>();
  @$core.pragma('dart2js:noInline')
  static ResHomeProfileGame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomeProfileGame>(create);
  static ResHomeProfileGame? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<HomeProfileGameItem> get data => $_getList(2);
}

class HomeProfileGameItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileGameItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'key')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'updateTime',
        $pb.PbFieldType.O3)
    ..pc<HomeProfileGamePlayInfo>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playInfo',
        $pb.PbFieldType.PM,
        subBuilder: HomeProfileGamePlayInfo.create)
    ..hasRequiredFields = false;

  HomeProfileGameItem._() : super();
  factory HomeProfileGameItem({
    $core.String? key,
    $core.String? name,
    $core.String? icon,
    $core.int? total,
    $core.int? updateTime,
    $core.Iterable<HomeProfileGamePlayInfo>? playInfo,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (total != null) {
      _result.total = total;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    if (playInfo != null) {
      _result.playInfo.addAll(playInfo);
    }
    return _result;
  }
  factory HomeProfileGameItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileGameItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileGameItem clone() => HomeProfileGameItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileGameItem copyWith(void Function(HomeProfileGameItem) updates) =>
      super.copyWith((message) => updates(message as HomeProfileGameItem))
          as HomeProfileGameItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileGameItem create() => HomeProfileGameItem._();
  HomeProfileGameItem createEmptyInstance() => create();
  static $pb.PbList<HomeProfileGameItem> createRepeated() =>
      $pb.PbList<HomeProfileGameItem>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileGameItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileGameItem>(create);
  static HomeProfileGameItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get total => $_getIZ(3);
  @$pb.TagNumber(4)
  set total($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTotal() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotal() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get updateTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set updateTime($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUpdateTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdateTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<HomeProfileGamePlayInfo> get playInfo => $_getList(5);
}

class HomeProfileGamePlayInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileGamePlayInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'key')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  HomeProfileGamePlayInfo._() : super();
  factory HomeProfileGamePlayInfo({
    $core.String? key,
    $core.String? name,
    $core.String? value,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (name != null) {
      _result.name = name;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory HomeProfileGamePlayInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileGamePlayInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileGamePlayInfo clone() =>
      HomeProfileGamePlayInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileGamePlayInfo copyWith(
          void Function(HomeProfileGamePlayInfo) updates) =>
      super.copyWith((message) => updates(message as HomeProfileGamePlayInfo))
          as HomeProfileGamePlayInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileGamePlayInfo create() => HomeProfileGamePlayInfo._();
  HomeProfileGamePlayInfo createEmptyInstance() => create();
  static $pb.PbList<HomeProfileGamePlayInfo> createRepeated() =>
      $pb.PbList<HomeProfileGamePlayInfo>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileGamePlayInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileGamePlayInfo>(create);
  static HomeProfileGamePlayInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get value => $_getSZ(2);
  @$pb.TagNumber(3)
  set value($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
}

class UserMysteryInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserMysteryInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isMystery',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'txt')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'headerBanner')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'headerEffect')
    ..hasRequiredFields = false;

  UserMysteryInfo._() : super();
  factory UserMysteryInfo({
    $core.int? isMystery,
    $core.String? txt,
    $core.String? headerBanner,
    $core.String? headerEffect,
  }) {
    final _result = create();
    if (isMystery != null) {
      _result.isMystery = isMystery;
    }
    if (txt != null) {
      _result.txt = txt;
    }
    if (headerBanner != null) {
      _result.headerBanner = headerBanner;
    }
    if (headerEffect != null) {
      _result.headerEffect = headerEffect;
    }
    return _result;
  }
  factory UserMysteryInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserMysteryInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserMysteryInfo clone() => UserMysteryInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserMysteryInfo copyWith(void Function(UserMysteryInfo) updates) =>
      super.copyWith((message) => updates(message as UserMysteryInfo))
          as UserMysteryInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserMysteryInfo create() => UserMysteryInfo._();
  UserMysteryInfo createEmptyInstance() => create();
  static $pb.PbList<UserMysteryInfo> createRepeated() =>
      $pb.PbList<UserMysteryInfo>();
  @$core.pragma('dart2js:noInline')
  static UserMysteryInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserMysteryInfo>(create);
  static UserMysteryInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get isMystery => $_getIZ(0);
  @$pb.TagNumber(1)
  set isMystery($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIsMystery() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsMystery() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get txt => $_getSZ(1);
  @$pb.TagNumber(2)
  set txt($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTxt() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxt() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get headerBanner => $_getSZ(2);
  @$pb.TagNumber(3)
  set headerBanner($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHeaderBanner() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeaderBanner() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get headerEffect => $_getSZ(3);
  @$pb.TagNumber(4)
  set headerEffect($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHeaderEffect() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeaderEffect() => clearField(4);
}

class HomeProfileGeneralSettings extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileGeneralSettings',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showGlory',
        $pb.PbFieldType.OU3,
        protoName: 'showGlory')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showPkSkill',
        $pb.PbFieldType.OU3,
        protoName: 'showPkSkill')
    ..hasRequiredFields = false;

  HomeProfileGeneralSettings._() : super();
  factory HomeProfileGeneralSettings({
    $core.int? showGlory,
    $core.int? showPkSkill,
  }) {
    final _result = create();
    if (showGlory != null) {
      _result.showGlory = showGlory;
    }
    if (showPkSkill != null) {
      _result.showPkSkill = showPkSkill;
    }
    return _result;
  }
  factory HomeProfileGeneralSettings.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileGeneralSettings.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileGeneralSettings clone() =>
      HomeProfileGeneralSettings()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileGeneralSettings copyWith(
          void Function(HomeProfileGeneralSettings) updates) =>
      super.copyWith(
              (message) => updates(message as HomeProfileGeneralSettings))
          as HomeProfileGeneralSettings; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileGeneralSettings create() => HomeProfileGeneralSettings._();
  HomeProfileGeneralSettings createEmptyInstance() => create();
  static $pb.PbList<HomeProfileGeneralSettings> createRepeated() =>
      $pb.PbList<HomeProfileGeneralSettings>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileGeneralSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileGeneralSettings>(create);
  static HomeProfileGeneralSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get showGlory => $_getIZ(0);
  @$pb.TagNumber(1)
  set showGlory($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShowGlory() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowGlory() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get showPkSkill => $_getIZ(1);
  @$pb.TagNumber(2)
  set showPkSkill($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShowPkSkill() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowPkSkill() => clearField(2);
}

class RoomCrossPkQualifyingSummary extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkQualifyingSummary',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numWin',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numDraw',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numFail',
        $pb.PbFieldType.OU3)
    ..aOM<RoomCrossPkSegmentItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'curSegment',
        protoName: 'curSegment',
        subBuilder: RoomCrossPkSegmentItem.create)
    ..hasRequiredFields = false;

  RoomCrossPkQualifyingSummary._() : super();
  factory RoomCrossPkQualifyingSummary({
    $core.int? uid,
    $core.int? numWin,
    $core.int? numDraw,
    $core.int? numFail,
    RoomCrossPkSegmentItem? curSegment,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (numWin != null) {
      _result.numWin = numWin;
    }
    if (numDraw != null) {
      _result.numDraw = numDraw;
    }
    if (numFail != null) {
      _result.numFail = numFail;
    }
    if (curSegment != null) {
      _result.curSegment = curSegment;
    }
    return _result;
  }
  factory RoomCrossPkQualifyingSummary.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkQualifyingSummary.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkQualifyingSummary clone() =>
      RoomCrossPkQualifyingSummary()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkQualifyingSummary copyWith(
          void Function(RoomCrossPkQualifyingSummary) updates) =>
      super.copyWith(
              (message) => updates(message as RoomCrossPkQualifyingSummary))
          as RoomCrossPkQualifyingSummary; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkQualifyingSummary create() =>
      RoomCrossPkQualifyingSummary._();
  RoomCrossPkQualifyingSummary createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkQualifyingSummary> createRepeated() =>
      $pb.PbList<RoomCrossPkQualifyingSummary>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkQualifyingSummary getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkQualifyingSummary>(create);
  static RoomCrossPkQualifyingSummary? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get numWin => $_getIZ(1);
  @$pb.TagNumber(2)
  set numWin($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNumWin() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumWin() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get numDraw => $_getIZ(2);
  @$pb.TagNumber(3)
  set numDraw($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNumDraw() => $_has(2);
  @$pb.TagNumber(3)
  void clearNumDraw() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get numFail => $_getIZ(3);
  @$pb.TagNumber(4)
  set numFail($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNumFail() => $_has(3);
  @$pb.TagNumber(4)
  void clearNumFail() => clearField(4);

  @$pb.TagNumber(5)
  RoomCrossPkSegmentItem get curSegment => $_getN(4);
  @$pb.TagNumber(5)
  set curSegment(RoomCrossPkSegmentItem v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCurSegment() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurSegment() => clearField(5);
  @$pb.TagNumber(5)
  RoomCrossPkSegmentItem ensureCurSegment() => $_ensure(4);
}

class RoomCrossPkSegmentItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkSegmentItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'segment',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'segmentUrl')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'segmentName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subSegment',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalStart',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCrossPkSegmentItem._() : super();
  factory RoomCrossPkSegmentItem({
    $core.int? segment,
    $core.String? segmentUrl,
    $core.String? segmentName,
    $core.int? subSegment,
    $core.int? star,
    $core.int? totalStart,
  }) {
    final _result = create();
    if (segment != null) {
      _result.segment = segment;
    }
    if (segmentUrl != null) {
      _result.segmentUrl = segmentUrl;
    }
    if (segmentName != null) {
      _result.segmentName = segmentName;
    }
    if (subSegment != null) {
      _result.subSegment = subSegment;
    }
    if (star != null) {
      _result.star = star;
    }
    if (totalStart != null) {
      _result.totalStart = totalStart;
    }
    return _result;
  }
  factory RoomCrossPkSegmentItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkSegmentItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkSegmentItem clone() =>
      RoomCrossPkSegmentItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkSegmentItem copyWith(
          void Function(RoomCrossPkSegmentItem) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkSegmentItem))
          as RoomCrossPkSegmentItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSegmentItem create() => RoomCrossPkSegmentItem._();
  RoomCrossPkSegmentItem createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkSegmentItem> createRepeated() =>
      $pb.PbList<RoomCrossPkSegmentItem>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSegmentItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkSegmentItem>(create);
  static RoomCrossPkSegmentItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get segment => $_getIZ(0);
  @$pb.TagNumber(1)
  set segment($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSegment() => $_has(0);
  @$pb.TagNumber(1)
  void clearSegment() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get segmentUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set segmentUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSegmentUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearSegmentUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get segmentName => $_getSZ(2);
  @$pb.TagNumber(3)
  set segmentName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSegmentName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSegmentName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get subSegment => $_getIZ(3);
  @$pb.TagNumber(4)
  set subSegment($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSubSegment() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubSegment() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get star => $_getIZ(4);
  @$pb.TagNumber(5)
  set star($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStar() => $_has(4);
  @$pb.TagNumber(5)
  void clearStar() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get totalStart => $_getIZ(5);
  @$pb.TagNumber(6)
  set totalStart($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTotalStart() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalStart() => clearField(6);
}

class ApiRoomCrossPkExploitsListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiRoomCrossPkExploitsListResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOM<RoomCrossPkExploitsListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomCrossPkExploitsListData.create)
    ..hasRequiredFields = false;

  ApiRoomCrossPkExploitsListResponse._() : super();
  factory ApiRoomCrossPkExploitsListResponse({
    $core.bool? success,
    $core.String? message,
    RoomCrossPkExploitsListData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiRoomCrossPkExploitsListResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiRoomCrossPkExploitsListResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiRoomCrossPkExploitsListResponse clone() =>
      ApiRoomCrossPkExploitsListResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiRoomCrossPkExploitsListResponse copyWith(
          void Function(ApiRoomCrossPkExploitsListResponse) updates) =>
      super.copyWith((message) =>
              updates(message as ApiRoomCrossPkExploitsListResponse))
          as ApiRoomCrossPkExploitsListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiRoomCrossPkExploitsListResponse create() =>
      ApiRoomCrossPkExploitsListResponse._();
  ApiRoomCrossPkExploitsListResponse createEmptyInstance() => create();
  static $pb.PbList<ApiRoomCrossPkExploitsListResponse> createRepeated() =>
      $pb.PbList<ApiRoomCrossPkExploitsListResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiRoomCrossPkExploitsListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiRoomCrossPkExploitsListResponse>(
          create);
  static ApiRoomCrossPkExploitsListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  RoomCrossPkExploitsListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomCrossPkExploitsListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomCrossPkExploitsListData ensureData() => $_ensure(2);
}

class RoomCrossPkExploitsListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkExploitsListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<RoomCrossPkQualifyingSummary>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'summary',
        subBuilder: RoomCrossPkQualifyingSummary.create)
    ..pc<RoomCrossPkQualifyingRecordItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RoomCrossPkQualifyingRecordItem.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCrossPkExploitsListData._() : super();
  factory RoomCrossPkExploitsListData({
    RoomCrossPkQualifyingSummary? summary,
    $core.Iterable<RoomCrossPkQualifyingRecordItem>? list,
    $core.int? more,
  }) {
    final _result = create();
    if (summary != null) {
      _result.summary = summary;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (more != null) {
      _result.more = more;
    }
    return _result;
  }
  factory RoomCrossPkExploitsListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkExploitsListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkExploitsListData clone() =>
      RoomCrossPkExploitsListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkExploitsListData copyWith(
          void Function(RoomCrossPkExploitsListData) updates) =>
      super.copyWith(
              (message) => updates(message as RoomCrossPkExploitsListData))
          as RoomCrossPkExploitsListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkExploitsListData create() =>
      RoomCrossPkExploitsListData._();
  RoomCrossPkExploitsListData createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkExploitsListData> createRepeated() =>
      $pb.PbList<RoomCrossPkExploitsListData>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkExploitsListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkExploitsListData>(create);
  static RoomCrossPkExploitsListData? _defaultInstance;

  @$pb.TagNumber(1)
  RoomCrossPkQualifyingSummary get summary => $_getN(0);
  @$pb.TagNumber(1)
  set summary(RoomCrossPkQualifyingSummary v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSummary() => $_has(0);
  @$pb.TagNumber(1)
  void clearSummary() => clearField(1);
  @$pb.TagNumber(1)
  RoomCrossPkQualifyingSummary ensureSummary() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<RoomCrossPkQualifyingRecordItem> get list => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get more => $_getIZ(2);
  @$pb.TagNumber(3)
  set more($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMore() => $_has(2);
  @$pb.TagNumber(3)
  void clearMore() => clearField(3);
}

class RoomCrossPkQualifyingRecordItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkQualifyingRecordItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<RoomCrossPkQualifyingRecordRoleInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'master',
        subBuilder: RoomCrossPkQualifyingRecordRoleInfo.create)
    ..aOM<RoomCrossPkQualifyingRecordRoleInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'red',
        subBuilder: RoomCrossPkQualifyingRecordRoleInfo.create)
    ..aOM<RoomCrossPkQualifyingRecordRoleInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blue',
        subBuilder: RoomCrossPkQualifyingRecordRoleInfo.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkDuration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkAt',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkMode',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCrossPkQualifyingRecordItem._() : super();
  factory RoomCrossPkQualifyingRecordItem({
    RoomCrossPkQualifyingRecordRoleInfo? master,
    RoomCrossPkQualifyingRecordRoleInfo? red,
    RoomCrossPkQualifyingRecordRoleInfo? blue,
    $core.int? pkDuration,
    $core.int? pkAt,
    $core.int? pkMode,
    $core.int? pkId,
  }) {
    final _result = create();
    if (master != null) {
      _result.master = master;
    }
    if (red != null) {
      _result.red = red;
    }
    if (blue != null) {
      _result.blue = blue;
    }
    if (pkDuration != null) {
      _result.pkDuration = pkDuration;
    }
    if (pkAt != null) {
      _result.pkAt = pkAt;
    }
    if (pkMode != null) {
      _result.pkMode = pkMode;
    }
    if (pkId != null) {
      _result.pkId = pkId;
    }
    return _result;
  }
  factory RoomCrossPkQualifyingRecordItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkQualifyingRecordItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkQualifyingRecordItem clone() =>
      RoomCrossPkQualifyingRecordItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkQualifyingRecordItem copyWith(
          void Function(RoomCrossPkQualifyingRecordItem) updates) =>
      super.copyWith(
              (message) => updates(message as RoomCrossPkQualifyingRecordItem))
          as RoomCrossPkQualifyingRecordItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkQualifyingRecordItem create() =>
      RoomCrossPkQualifyingRecordItem._();
  RoomCrossPkQualifyingRecordItem createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkQualifyingRecordItem> createRepeated() =>
      $pb.PbList<RoomCrossPkQualifyingRecordItem>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkQualifyingRecordItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkQualifyingRecordItem>(
          create);
  static RoomCrossPkQualifyingRecordItem? _defaultInstance;

  @$pb.TagNumber(1)
  RoomCrossPkQualifyingRecordRoleInfo get master => $_getN(0);
  @$pb.TagNumber(1)
  set master(RoomCrossPkQualifyingRecordRoleInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMaster() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaster() => clearField(1);
  @$pb.TagNumber(1)
  RoomCrossPkQualifyingRecordRoleInfo ensureMaster() => $_ensure(0);

  @$pb.TagNumber(2)
  RoomCrossPkQualifyingRecordRoleInfo get red => $_getN(1);
  @$pb.TagNumber(2)
  set red(RoomCrossPkQualifyingRecordRoleInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRed() => $_has(1);
  @$pb.TagNumber(2)
  void clearRed() => clearField(2);
  @$pb.TagNumber(2)
  RoomCrossPkQualifyingRecordRoleInfo ensureRed() => $_ensure(1);

  @$pb.TagNumber(3)
  RoomCrossPkQualifyingRecordRoleInfo get blue => $_getN(2);
  @$pb.TagNumber(3)
  set blue(RoomCrossPkQualifyingRecordRoleInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBlue() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlue() => clearField(3);
  @$pb.TagNumber(3)
  RoomCrossPkQualifyingRecordRoleInfo ensureBlue() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get pkDuration => $_getIZ(3);
  @$pb.TagNumber(4)
  set pkDuration($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPkDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearPkDuration() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get pkAt => $_getIZ(4);
  @$pb.TagNumber(5)
  set pkAt($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPkAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearPkAt() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get pkMode => $_getIZ(5);
  @$pb.TagNumber(6)
  set pkMode($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPkMode() => $_has(5);
  @$pb.TagNumber(6)
  void clearPkMode() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get pkId => $_getIZ(6);
  @$pb.TagNumber(7)
  set pkId($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPkId() => $_has(6);
  @$pb.TagNumber(7)
  void clearPkId() => clearField(7);
}

class RoomCrossPkQualifyingRecordUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkQualifyingRecordUserInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  RoomCrossPkQualifyingRecordUserInfo._() : super();
  factory RoomCrossPkQualifyingRecordUserInfo({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory RoomCrossPkQualifyingRecordUserInfo.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkQualifyingRecordUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkQualifyingRecordUserInfo clone() =>
      RoomCrossPkQualifyingRecordUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkQualifyingRecordUserInfo copyWith(
          void Function(RoomCrossPkQualifyingRecordUserInfo) updates) =>
      super.copyWith((message) =>
              updates(message as RoomCrossPkQualifyingRecordUserInfo))
          as RoomCrossPkQualifyingRecordUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkQualifyingRecordUserInfo create() =>
      RoomCrossPkQualifyingRecordUserInfo._();
  RoomCrossPkQualifyingRecordUserInfo createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkQualifyingRecordUserInfo> createRepeated() =>
      $pb.PbList<RoomCrossPkQualifyingRecordUserInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkQualifyingRecordUserInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomCrossPkQualifyingRecordUserInfo>(create);
  static RoomCrossPkQualifyingRecordUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);
}

class RoomCrossPkQualifyingRecordRoleInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkQualifyingRecordRoleInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<RoomCrossPkQualifyingRecordUserInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: RoomCrossPkQualifyingRecordUserInfo.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..e<RoomCrossPkWinState>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'win',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomCrossPkWinState.CROSSPK_UNKNOWN,
        valueOf: RoomCrossPkWinState.valueOf,
        enumValues: RoomCrossPkWinState.values)
    ..hasRequiredFields = false;

  RoomCrossPkQualifyingRecordRoleInfo._() : super();
  factory RoomCrossPkQualifyingRecordRoleInfo({
    RoomCrossPkQualifyingRecordUserInfo? user,
    $core.int? rid,
    $core.int? score,
    RoomCrossPkWinState? win,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (score != null) {
      _result.score = score;
    }
    if (win != null) {
      _result.win = win;
    }
    return _result;
  }
  factory RoomCrossPkQualifyingRecordRoleInfo.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkQualifyingRecordRoleInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkQualifyingRecordRoleInfo clone() =>
      RoomCrossPkQualifyingRecordRoleInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkQualifyingRecordRoleInfo copyWith(
          void Function(RoomCrossPkQualifyingRecordRoleInfo) updates) =>
      super.copyWith((message) =>
              updates(message as RoomCrossPkQualifyingRecordRoleInfo))
          as RoomCrossPkQualifyingRecordRoleInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkQualifyingRecordRoleInfo create() =>
      RoomCrossPkQualifyingRecordRoleInfo._();
  RoomCrossPkQualifyingRecordRoleInfo createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkQualifyingRecordRoleInfo> createRepeated() =>
      $pb.PbList<RoomCrossPkQualifyingRecordRoleInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkQualifyingRecordRoleInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomCrossPkQualifyingRecordRoleInfo>(create);
  static RoomCrossPkQualifyingRecordRoleInfo? _defaultInstance;

  @$pb.TagNumber(1)
  RoomCrossPkQualifyingRecordUserInfo get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(RoomCrossPkQualifyingRecordUserInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  RoomCrossPkQualifyingRecordUserInfo ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get rid => $_getIZ(1);
  @$pb.TagNumber(2)
  set rid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get score => $_getIZ(2);
  @$pb.TagNumber(3)
  set score($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => clearField(3);

  @$pb.TagNumber(4)
  RoomCrossPkWinState get win => $_getN(3);
  @$pb.TagNumber(4)
  set win(RoomCrossPkWinState v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWin() => $_has(3);
  @$pb.TagNumber(4)
  void clearWin() => clearField(4);
}

class HomeProfileBirthdayInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeProfileBirthdayInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isBirthday',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankTopName')
    ..hasRequiredFields = false;

  HomeProfileBirthdayInfo._() : super();
  factory HomeProfileBirthdayInfo({
    $core.int? isBirthday,
    $core.String? rankTopName,
  }) {
    final _result = create();
    if (isBirthday != null) {
      _result.isBirthday = isBirthday;
    }
    if (rankTopName != null) {
      _result.rankTopName = rankTopName;
    }
    return _result;
  }
  factory HomeProfileBirthdayInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeProfileBirthdayInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeProfileBirthdayInfo clone() =>
      HomeProfileBirthdayInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeProfileBirthdayInfo copyWith(
          void Function(HomeProfileBirthdayInfo) updates) =>
      super.copyWith((message) => updates(message as HomeProfileBirthdayInfo))
          as HomeProfileBirthdayInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeProfileBirthdayInfo create() => HomeProfileBirthdayInfo._();
  HomeProfileBirthdayInfo createEmptyInstance() => create();
  static $pb.PbList<HomeProfileBirthdayInfo> createRepeated() =>
      $pb.PbList<HomeProfileBirthdayInfo>();
  @$core.pragma('dart2js:noInline')
  static HomeProfileBirthdayInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeProfileBirthdayInfo>(create);
  static HomeProfileBirthdayInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get isBirthday => $_getIZ(0);
  @$pb.TagNumber(1)
  set isBirthday($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIsBirthday() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsBirthday() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get rankTopName => $_getSZ(1);
  @$pb.TagNumber(2)
  set rankTopName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRankTopName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRankTopName() => clearField(2);
}
