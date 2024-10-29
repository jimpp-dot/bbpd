///
//  Generated code. Do not modify.
//  source: slp_glory.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GloryCenterCate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GloryCenterCate',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GloryCenterCateItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cateList',
        $pb.PbFieldType.PM,
        subBuilder: GloryCenterCateItem.create)
    ..aOM<GloryCenterUserData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: GloryCenterUserData.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalMicTag',
        $pb.PbFieldType.OU3)
    ..aOM<GloryCenterPlatformBadge>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platformBadges',
        protoName: 'platformBadges',
        subBuilder: GloryCenterPlatformBadge.create)
    ..pc<GloryCenterWearableBadge>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effectList',
        $pb.PbFieldType.PM,
        subBuilder: GloryCenterWearableBadge.create)
    ..pPS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micTagList')
    ..pPS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'achieveBadgeList')
    ..hasRequiredFields = false;

  GloryCenterCate._() : super();
  factory GloryCenterCate({
    $core.Iterable<GloryCenterCateItem>? cateList,
    GloryCenterUserData? user,
    $core.int? totalMicTag,
    GloryCenterPlatformBadge? platformBadges,
    $core.Iterable<GloryCenterWearableBadge>? effectList,
    $core.Iterable<$core.String>? micTagList,
    $core.Iterable<$core.String>? achieveBadgeList,
  }) {
    final _result = create();
    if (cateList != null) {
      _result.cateList.addAll(cateList);
    }
    if (user != null) {
      _result.user = user;
    }
    if (totalMicTag != null) {
      _result.totalMicTag = totalMicTag;
    }
    if (platformBadges != null) {
      _result.platformBadges = platformBadges;
    }
    if (effectList != null) {
      _result.effectList.addAll(effectList);
    }
    if (micTagList != null) {
      _result.micTagList.addAll(micTagList);
    }
    if (achieveBadgeList != null) {
      _result.achieveBadgeList.addAll(achieveBadgeList);
    }
    return _result;
  }
  factory GloryCenterCate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GloryCenterCate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GloryCenterCate clone() => GloryCenterCate()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GloryCenterCate copyWith(void Function(GloryCenterCate) updates) =>
      super.copyWith((message) => updates(message as GloryCenterCate))
          as GloryCenterCate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GloryCenterCate create() => GloryCenterCate._();
  GloryCenterCate createEmptyInstance() => create();
  static $pb.PbList<GloryCenterCate> createRepeated() =>
      $pb.PbList<GloryCenterCate>();
  @$core.pragma('dart2js:noInline')
  static GloryCenterCate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GloryCenterCate>(create);
  static GloryCenterCate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GloryCenterCateItem> get cateList => $_getList(0);

  @$pb.TagNumber(2)
  GloryCenterUserData get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(GloryCenterUserData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  GloryCenterUserData ensureUser() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get totalMicTag => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalMicTag($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTotalMicTag() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalMicTag() => clearField(3);

  @$pb.TagNumber(4)
  GloryCenterPlatformBadge get platformBadges => $_getN(3);
  @$pb.TagNumber(4)
  set platformBadges(GloryCenterPlatformBadge v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPlatformBadges() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlatformBadges() => clearField(4);
  @$pb.TagNumber(4)
  GloryCenterPlatformBadge ensurePlatformBadges() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<GloryCenterWearableBadge> get effectList => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get micTagList => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.String> get achieveBadgeList => $_getList(6);
}

class GloryCenterCateItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GloryCenterCateItem',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showAll')
    ..hasRequiredFields = false;

  GloryCenterCateItem._() : super();
  factory GloryCenterCateItem({
    $core.String? name,
    $core.int? id,
    $core.bool? showAll,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (id != null) {
      _result.id = id;
    }
    if (showAll != null) {
      _result.showAll = showAll;
    }
    return _result;
  }
  factory GloryCenterCateItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GloryCenterCateItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GloryCenterCateItem clone() => GloryCenterCateItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GloryCenterCateItem copyWith(void Function(GloryCenterCateItem) updates) =>
      super.copyWith((message) => updates(message as GloryCenterCateItem))
          as GloryCenterCateItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GloryCenterCateItem create() => GloryCenterCateItem._();
  GloryCenterCateItem createEmptyInstance() => create();
  static $pb.PbList<GloryCenterCateItem> createRepeated() =>
      $pb.PbList<GloryCenterCateItem>();
  @$core.pragma('dart2js:noInline')
  static GloryCenterCateItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GloryCenterCateItem>(create);
  static GloryCenterCateItem? _defaultInstance;

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
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get showAll => $_getBF(2);
  @$pb.TagNumber(3)
  set showAll($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShowAll() => $_has(2);
  @$pb.TagNumber(3)
  void clearShowAll() => clearField(3);
}

class GloryCenterUserData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GloryCenterUserData',
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
            : 'userName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showGlory',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GloryCenterUserData._() : super();
  factory GloryCenterUserData({
    $core.int? uid,
    $core.String? userName,
    $core.String? userIcon,
    $core.int? showGlory,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    if (showGlory != null) {
      _result.showGlory = showGlory;
    }
    return _result;
  }
  factory GloryCenterUserData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GloryCenterUserData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GloryCenterUserData clone() => GloryCenterUserData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GloryCenterUserData copyWith(void Function(GloryCenterUserData) updates) =>
      super.copyWith((message) => updates(message as GloryCenterUserData))
          as GloryCenterUserData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GloryCenterUserData create() => GloryCenterUserData._();
  GloryCenterUserData createEmptyInstance() => create();
  static $pb.PbList<GloryCenterUserData> createRepeated() =>
      $pb.PbList<GloryCenterUserData>();
  @$core.pragma('dart2js:noInline')
  static GloryCenterUserData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GloryCenterUserData>(create);
  static GloryCenterUserData? _defaultInstance;

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
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set userIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUserIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get showGlory => $_getIZ(3);
  @$pb.TagNumber(4)
  set showGlory($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasShowGlory() => $_has(3);
  @$pb.TagNumber(4)
  void clearShowGlory() => clearField(4);
}

class GloryCenterPlatformBadge extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GloryCenterPlatformBadge',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vipLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularityLevel',
        $pb.PbFieldType.OU3)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'kaWhiteIcon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'littleAlarm')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starSinger',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starVerifyTag',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sevenLoveTag',
        $pb.PbFieldType.OU3)
    ..aOM<GloryCenterActivity>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activity',
        subBuilder: GloryCenterActivity.create)
    ..pPS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tags')
    ..hasRequiredFields = false;

  GloryCenterPlatformBadge._() : super();
  factory GloryCenterPlatformBadge({
    $core.int? title,
    $core.int? vipLevel,
    $core.int? popularityLevel,
    $core.bool? kaWhiteIcon,
    $core.String? littleAlarm,
    $core.int? starSinger,
    $core.int? starVerifyTag,
    $core.int? sevenLoveTag,
    GloryCenterActivity? activity,
    $core.Iterable<$core.String>? tags,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (vipLevel != null) {
      _result.vipLevel = vipLevel;
    }
    if (popularityLevel != null) {
      _result.popularityLevel = popularityLevel;
    }
    if (kaWhiteIcon != null) {
      _result.kaWhiteIcon = kaWhiteIcon;
    }
    if (littleAlarm != null) {
      _result.littleAlarm = littleAlarm;
    }
    if (starSinger != null) {
      _result.starSinger = starSinger;
    }
    if (starVerifyTag != null) {
      _result.starVerifyTag = starVerifyTag;
    }
    if (sevenLoveTag != null) {
      _result.sevenLoveTag = sevenLoveTag;
    }
    if (activity != null) {
      _result.activity = activity;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    return _result;
  }
  factory GloryCenterPlatformBadge.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GloryCenterPlatformBadge.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GloryCenterPlatformBadge clone() =>
      GloryCenterPlatformBadge()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GloryCenterPlatformBadge copyWith(
          void Function(GloryCenterPlatformBadge) updates) =>
      super.copyWith((message) => updates(message as GloryCenterPlatformBadge))
          as GloryCenterPlatformBadge; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GloryCenterPlatformBadge create() => GloryCenterPlatformBadge._();
  GloryCenterPlatformBadge createEmptyInstance() => create();
  static $pb.PbList<GloryCenterPlatformBadge> createRepeated() =>
      $pb.PbList<GloryCenterPlatformBadge>();
  @$core.pragma('dart2js:noInline')
  static GloryCenterPlatformBadge getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GloryCenterPlatformBadge>(create);
  static GloryCenterPlatformBadge? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get title => $_getIZ(0);
  @$pb.TagNumber(1)
  set title($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get vipLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set vipLevel($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVipLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearVipLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get popularityLevel => $_getIZ(2);
  @$pb.TagNumber(3)
  set popularityLevel($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPopularityLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearPopularityLevel() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get kaWhiteIcon => $_getBF(3);
  @$pb.TagNumber(4)
  set kaWhiteIcon($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasKaWhiteIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearKaWhiteIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get littleAlarm => $_getSZ(4);
  @$pb.TagNumber(5)
  set littleAlarm($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLittleAlarm() => $_has(4);
  @$pb.TagNumber(5)
  void clearLittleAlarm() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get starSinger => $_getIZ(5);
  @$pb.TagNumber(6)
  set starSinger($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStarSinger() => $_has(5);
  @$pb.TagNumber(6)
  void clearStarSinger() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get starVerifyTag => $_getIZ(6);
  @$pb.TagNumber(7)
  set starVerifyTag($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasStarVerifyTag() => $_has(6);
  @$pb.TagNumber(7)
  void clearStarVerifyTag() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get sevenLoveTag => $_getIZ(7);
  @$pb.TagNumber(8)
  set sevenLoveTag($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSevenLoveTag() => $_has(7);
  @$pb.TagNumber(8)
  void clearSevenLoveTag() => clearField(8);

  @$pb.TagNumber(9)
  GloryCenterActivity get activity => $_getN(8);
  @$pb.TagNumber(9)
  set activity(GloryCenterActivity v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasActivity() => $_has(8);
  @$pb.TagNumber(9)
  void clearActivity() => clearField(9);
  @$pb.TagNumber(9)
  GloryCenterActivity ensureActivity() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.List<$core.String> get tags => $_getList(9);
}

class GloryCenterActivity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GloryCenterActivity',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activityLevel',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activityLevelTitle')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activitySubLevel',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GloryCenterActivity._() : super();
  factory GloryCenterActivity({
    $core.int? activityLevel,
    $core.String? activityLevelTitle,
    $core.int? activitySubLevel,
  }) {
    final _result = create();
    if (activityLevel != null) {
      _result.activityLevel = activityLevel;
    }
    if (activityLevelTitle != null) {
      _result.activityLevelTitle = activityLevelTitle;
    }
    if (activitySubLevel != null) {
      _result.activitySubLevel = activitySubLevel;
    }
    return _result;
  }
  factory GloryCenterActivity.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GloryCenterActivity.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GloryCenterActivity clone() => GloryCenterActivity()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GloryCenterActivity copyWith(void Function(GloryCenterActivity) updates) =>
      super.copyWith((message) => updates(message as GloryCenterActivity))
          as GloryCenterActivity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GloryCenterActivity create() => GloryCenterActivity._();
  GloryCenterActivity createEmptyInstance() => create();
  static $pb.PbList<GloryCenterActivity> createRepeated() =>
      $pb.PbList<GloryCenterActivity>();
  @$core.pragma('dart2js:noInline')
  static GloryCenterActivity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GloryCenterActivity>(create);
  static GloryCenterActivity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get activityLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set activityLevel($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasActivityLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get activityLevelTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set activityLevelTitle($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasActivityLevelTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearActivityLevelTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get activitySubLevel => $_getIZ(2);
  @$pb.TagNumber(3)
  set activitySubLevel($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasActivitySubLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearActivitySubLevel() => clearField(3);
}

class ResGloryList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGloryList',
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
    ..pc<GloryCenterWearableBadge>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: GloryCenterWearableBadge.create)
    ..hasRequiredFields = false;

  ResGloryList._() : super();
  factory ResGloryList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GloryCenterWearableBadge>? data,
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
  factory ResGloryList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGloryList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGloryList clone() => ResGloryList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGloryList copyWith(void Function(ResGloryList) updates) =>
      super.copyWith((message) => updates(message as ResGloryList))
          as ResGloryList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGloryList create() => ResGloryList._();
  ResGloryList createEmptyInstance() => create();
  static $pb.PbList<ResGloryList> createRepeated() =>
      $pb.PbList<ResGloryList>();
  @$core.pragma('dart2js:noInline')
  static ResGloryList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGloryList>(create);
  static ResGloryList? _defaultInstance;

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
  $core.List<GloryCenterWearableBadge> get data => $_getList(2);
}

class GloryCenterWearableBadge extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GloryCenterWearableBadge',
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
            : 'title')
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
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effective')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isWear')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'allocateTime')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expireTime')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'additionName')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftBadgeType',
        $pb.PbFieldType.OU3)
    ..aOB(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awakeGift')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wearConditionText')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeType',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wearTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GloryCenterWearableBadge._() : super();
  factory GloryCenterWearableBadge({
    $core.int? badgeId,
    $core.String? title,
    $core.String? icon,
    $core.String? desc,
    $core.bool? effective,
    $core.bool? isWear,
    $core.String? allocateTime,
    $core.String? expireTime,
    $core.String? additionName,
    $core.int? giftBadgeType,
    $core.bool? awakeGift,
    $core.String? wearConditionText,
    $core.int? badgeType,
    $core.int? wearTime,
  }) {
    final _result = create();
    if (badgeId != null) {
      _result.badgeId = badgeId;
    }
    if (title != null) {
      _result.title = title;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (effective != null) {
      _result.effective = effective;
    }
    if (isWear != null) {
      _result.isWear = isWear;
    }
    if (allocateTime != null) {
      _result.allocateTime = allocateTime;
    }
    if (expireTime != null) {
      _result.expireTime = expireTime;
    }
    if (additionName != null) {
      _result.additionName = additionName;
    }
    if (giftBadgeType != null) {
      _result.giftBadgeType = giftBadgeType;
    }
    if (awakeGift != null) {
      _result.awakeGift = awakeGift;
    }
    if (wearConditionText != null) {
      _result.wearConditionText = wearConditionText;
    }
    if (badgeType != null) {
      _result.badgeType = badgeType;
    }
    if (wearTime != null) {
      _result.wearTime = wearTime;
    }
    return _result;
  }
  factory GloryCenterWearableBadge.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GloryCenterWearableBadge.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GloryCenterWearableBadge clone() =>
      GloryCenterWearableBadge()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GloryCenterWearableBadge copyWith(
          void Function(GloryCenterWearableBadge) updates) =>
      super.copyWith((message) => updates(message as GloryCenterWearableBadge))
          as GloryCenterWearableBadge; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GloryCenterWearableBadge create() => GloryCenterWearableBadge._();
  GloryCenterWearableBadge createEmptyInstance() => create();
  static $pb.PbList<GloryCenterWearableBadge> createRepeated() =>
      $pb.PbList<GloryCenterWearableBadge>();
  @$core.pragma('dart2js:noInline')
  static GloryCenterWearableBadge getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GloryCenterWearableBadge>(create);
  static GloryCenterWearableBadge? _defaultInstance;

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
  $core.bool get effective => $_getBF(4);
  @$pb.TagNumber(5)
  set effective($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasEffective() => $_has(4);
  @$pb.TagNumber(5)
  void clearEffective() => clearField(5);

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

  @$pb.TagNumber(7)
  $core.String get allocateTime => $_getSZ(6);
  @$pb.TagNumber(7)
  set allocateTime($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAllocateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearAllocateTime() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get expireTime => $_getSZ(7);
  @$pb.TagNumber(8)
  set expireTime($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasExpireTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearExpireTime() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get additionName => $_getSZ(8);
  @$pb.TagNumber(9)
  set additionName($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAdditionName() => $_has(8);
  @$pb.TagNumber(9)
  void clearAdditionName() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get giftBadgeType => $_getIZ(9);
  @$pb.TagNumber(10)
  set giftBadgeType($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasGiftBadgeType() => $_has(9);
  @$pb.TagNumber(10)
  void clearGiftBadgeType() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get awakeGift => $_getBF(10);
  @$pb.TagNumber(11)
  set awakeGift($core.bool v) {
    $_setBool(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasAwakeGift() => $_has(10);
  @$pb.TagNumber(11)
  void clearAwakeGift() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get wearConditionText => $_getSZ(11);
  @$pb.TagNumber(12)
  set wearConditionText($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasWearConditionText() => $_has(11);
  @$pb.TagNumber(12)
  void clearWearConditionText() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get badgeType => $_getIZ(12);
  @$pb.TagNumber(13)
  set badgeType($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasBadgeType() => $_has(12);
  @$pb.TagNumber(13)
  void clearBadgeType() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get wearTime => $_getIZ(13);
  @$pb.TagNumber(14)
  set wearTime($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasWearTime() => $_has(13);
  @$pb.TagNumber(14)
  void clearWearTime() => clearField(14);
}

class ResGloryCenterCate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGloryCenterCate',
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
    ..aOM<GloryCenterCate>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GloryCenterCate.create)
    ..hasRequiredFields = false;

  ResGloryCenterCate._() : super();
  factory ResGloryCenterCate({
    $core.bool? success,
    $core.String? msg,
    GloryCenterCate? data,
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
  factory ResGloryCenterCate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGloryCenterCate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGloryCenterCate clone() => ResGloryCenterCate()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGloryCenterCate copyWith(void Function(ResGloryCenterCate) updates) =>
      super.copyWith((message) => updates(message as ResGloryCenterCate))
          as ResGloryCenterCate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGloryCenterCate create() => ResGloryCenterCate._();
  ResGloryCenterCate createEmptyInstance() => create();
  static $pb.PbList<ResGloryCenterCate> createRepeated() =>
      $pb.PbList<ResGloryCenterCate>();
  @$core.pragma('dart2js:noInline')
  static ResGloryCenterCate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGloryCenterCate>(create);
  static ResGloryCenterCate? _defaultInstance;

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
  GloryCenterCate get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GloryCenterCate v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GloryCenterCate ensureData() => $_ensure(2);
}
