///
//  Generated code. Do not modify.
//  source: slp_achieve.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResAchieveWall extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAchieveWall',
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
    ..aOM<AchieveWallData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AchieveWallData.create)
    ..hasRequiredFields = false;

  ResAchieveWall._() : super();
  factory ResAchieveWall({
    $core.bool? success,
    $core.String? msg,
    AchieveWallData? data,
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
  factory ResAchieveWall.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAchieveWall.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAchieveWall clone() => ResAchieveWall()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAchieveWall copyWith(void Function(ResAchieveWall) updates) =>
      super.copyWith((message) => updates(message as ResAchieveWall))
          as ResAchieveWall; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAchieveWall create() => ResAchieveWall._();
  ResAchieveWall createEmptyInstance() => create();
  static $pb.PbList<ResAchieveWall> createRepeated() =>
      $pb.PbList<ResAchieveWall>();
  @$core.pragma('dart2js:noInline')
  static ResAchieveWall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAchieveWall>(create);
  static ResAchieveWall? _defaultInstance;

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
  AchieveWallData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AchieveWallData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AchieveWallData ensureData() => $_ensure(2);
}

class AchieveWallData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AchieveWallData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlockNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalNum',
        $pb.PbFieldType.OU3)
    ..pc<AchieveBadgeTab>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tab',
        $pb.PbFieldType.PM,
        subBuilder: AchieveBadgeTab.create)
    ..pc<UserAchieveBadge>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: UserAchieveBadge.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friendRank',
        $pb.PbFieldType.OU3)
    ..aOM<UserAchieve>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: UserAchieve.create)
    ..pc<AchieveSkin>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skinList',
        $pb.PbFieldType.PM,
        subBuilder: AchieveSkin.create)
    ..hasRequiredFields = false;

  AchieveWallData._() : super();
  factory AchieveWallData({
    $core.int? unlockNum,
    $core.int? totalNum,
    $core.Iterable<AchieveBadgeTab>? tab,
    $core.Iterable<UserAchieveBadge>? list,
    $core.int? friendRank,
    UserAchieve? user,
    $core.Iterable<AchieveSkin>? skinList,
  }) {
    final _result = create();
    if (unlockNum != null) {
      _result.unlockNum = unlockNum;
    }
    if (totalNum != null) {
      _result.totalNum = totalNum;
    }
    if (tab != null) {
      _result.tab.addAll(tab);
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (friendRank != null) {
      _result.friendRank = friendRank;
    }
    if (user != null) {
      _result.user = user;
    }
    if (skinList != null) {
      _result.skinList.addAll(skinList);
    }
    return _result;
  }
  factory AchieveWallData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AchieveWallData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AchieveWallData clone() => AchieveWallData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AchieveWallData copyWith(void Function(AchieveWallData) updates) =>
      super.copyWith((message) => updates(message as AchieveWallData))
          as AchieveWallData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AchieveWallData create() => AchieveWallData._();
  AchieveWallData createEmptyInstance() => create();
  static $pb.PbList<AchieveWallData> createRepeated() =>
      $pb.PbList<AchieveWallData>();
  @$core.pragma('dart2js:noInline')
  static AchieveWallData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AchieveWallData>(create);
  static AchieveWallData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get unlockNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set unlockNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUnlockNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnlockNum() => clearField(1);

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

  @$pb.TagNumber(3)
  $core.List<AchieveBadgeTab> get tab => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<UserAchieveBadge> get list => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get friendRank => $_getIZ(4);
  @$pb.TagNumber(5)
  set friendRank($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFriendRank() => $_has(4);
  @$pb.TagNumber(5)
  void clearFriendRank() => clearField(5);

  @$pb.TagNumber(6)
  UserAchieve get user => $_getN(5);
  @$pb.TagNumber(6)
  set user(UserAchieve v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUser() => $_has(5);
  @$pb.TagNumber(6)
  void clearUser() => clearField(6);
  @$pb.TagNumber(6)
  UserAchieve ensureUser() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.List<AchieveSkin> get skinList => $_getList(6);
}

class UserAchieve extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserAchieve',
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
    ..pc<UserAchieveLevel>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.PM,
        subBuilder: UserAchieveLevel.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'achieveNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skinId',
        $pb.PbFieldType.OU3)
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isWear')
    ..hasRequiredFields = false;

  UserAchieve._() : super();
  factory UserAchieve({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.Iterable<UserAchieveLevel>? level,
    $core.int? achieveNum,
    $core.int? skinId,
    $core.bool? isWear,
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
    if (level != null) {
      _result.level.addAll(level);
    }
    if (achieveNum != null) {
      _result.achieveNum = achieveNum;
    }
    if (skinId != null) {
      _result.skinId = skinId;
    }
    if (isWear != null) {
      _result.isWear = isWear;
    }
    return _result;
  }
  factory UserAchieve.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserAchieve.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserAchieve clone() => UserAchieve()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserAchieve copyWith(void Function(UserAchieve) updates) =>
      super.copyWith((message) => updates(message as UserAchieve))
          as UserAchieve; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserAchieve create() => UserAchieve._();
  UserAchieve createEmptyInstance() => create();
  static $pb.PbList<UserAchieve> createRepeated() => $pb.PbList<UserAchieve>();
  @$core.pragma('dart2js:noInline')
  static UserAchieve getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserAchieve>(create);
  static UserAchieve? _defaultInstance;

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
  $core.List<UserAchieveLevel> get level => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get achieveNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set achieveNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAchieveNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearAchieveNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get skinId => $_getIZ(5);
  @$pb.TagNumber(6)
  set skinId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSkinId() => $_has(5);
  @$pb.TagNumber(6)
  void clearSkinId() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isWear => $_getBF(6);
  @$pb.TagNumber(7)
  set isWear($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIsWear() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsWear() => clearField(7);
}

class AchieveSkin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AchieveSkin',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skinId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'achieveNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AchieveSkin._() : super();
  factory AchieveSkin({
    $core.int? skinId,
    $core.String? name,
    $core.int? achieveNum,
  }) {
    final _result = create();
    if (skinId != null) {
      _result.skinId = skinId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (achieveNum != null) {
      _result.achieveNum = achieveNum;
    }
    return _result;
  }
  factory AchieveSkin.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AchieveSkin.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AchieveSkin clone() => AchieveSkin()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AchieveSkin copyWith(void Function(AchieveSkin) updates) =>
      super.copyWith((message) => updates(message as AchieveSkin))
          as AchieveSkin; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AchieveSkin create() => AchieveSkin._();
  AchieveSkin createEmptyInstance() => create();
  static $pb.PbList<AchieveSkin> createRepeated() => $pb.PbList<AchieveSkin>();
  @$core.pragma('dart2js:noInline')
  static AchieveSkin getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AchieveSkin>(create);
  static AchieveSkin? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get skinId => $_getIZ(0);
  @$pb.TagNumber(1)
  set skinId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSkinId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSkinId() => clearField(1);

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

  @$pb.TagNumber(5)
  $core.int get achieveNum => $_getIZ(2);
  @$pb.TagNumber(5)
  set achieveNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAchieveNum() => $_has(2);
  @$pb.TagNumber(5)
  void clearAchieveNum() => clearField(5);
}

class UserAchieveLevel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserAchieveLevel',
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
            : 'icon')
    ..hasRequiredFields = false;

  UserAchieveLevel._() : super();
  factory UserAchieveLevel({
    $core.int? level,
    $core.int? num,
    $core.String? icon,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (num != null) {
      _result.num = num;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory UserAchieveLevel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserAchieveLevel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserAchieveLevel clone() => UserAchieveLevel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserAchieveLevel copyWith(void Function(UserAchieveLevel) updates) =>
      super.copyWith((message) => updates(message as UserAchieveLevel))
          as UserAchieveLevel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserAchieveLevel create() => UserAchieveLevel._();
  UserAchieveLevel createEmptyInstance() => create();
  static $pb.PbList<UserAchieveLevel> createRepeated() =>
      $pb.PbList<UserAchieveLevel>();
  @$core.pragma('dart2js:noInline')
  static UserAchieveLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserAchieveLevel>(create);
  static UserAchieveLevel? _defaultInstance;

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

class AchieveBadgeTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AchieveBadgeTab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  AchieveBadgeTab._() : super();
  factory AchieveBadgeTab({
    $core.int? category,
    $core.String? name,
  }) {
    final _result = create();
    if (category != null) {
      _result.category = category;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory AchieveBadgeTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AchieveBadgeTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AchieveBadgeTab clone() => AchieveBadgeTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AchieveBadgeTab copyWith(void Function(AchieveBadgeTab) updates) =>
      super.copyWith((message) => updates(message as AchieveBadgeTab))
          as AchieveBadgeTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AchieveBadgeTab create() => AchieveBadgeTab._();
  AchieveBadgeTab createEmptyInstance() => create();
  static $pb.PbList<AchieveBadgeTab> createRepeated() =>
      $pb.PbList<AchieveBadgeTab>();
  @$core.pragma('dart2js:noInline')
  static AchieveBadgeTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AchieveBadgeTab>(create);
  static AchieveBadgeTab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get category => $_getIZ(0);
  @$pb.TagNumber(1)
  set category($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCategory() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategory() => clearField(1);

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

class UserAchieveBadge extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserAchieveBadge',
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
            : 'description')
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'images')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlock',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..pPS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelRules')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'date')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redirect')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlockCount',
        $pb.PbFieldType.OU3)
    ..pPS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelRulesText')
    ..p<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelScores',
        $pb.PbFieldType.PU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progressType',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sort',
        $pb.PbFieldType.OU3)
    ..pPS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelDate')
    ..hasRequiredFields = false;

  UserAchieveBadge._() : super();
  factory UserAchieveBadge({
    $core.int? badgeId,
    $core.String? name,
    $core.String? description,
    $core.Iterable<$core.String>? images,
    $core.int? level,
    $core.int? unlock,
    $core.int? score,
    $core.Iterable<$core.String>? levelRules,
    $core.String? date,
    $core.String? redirect,
    $core.int? unlockCount,
    $core.Iterable<$core.String>? levelRulesText,
    $core.Iterable<$core.int>? levelScores,
    $core.int? progressType,
    $core.int? sort,
    $core.Iterable<$core.String>? levelDate,
  }) {
    final _result = create();
    if (badgeId != null) {
      _result.badgeId = badgeId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (description != null) {
      _result.description = description;
    }
    if (images != null) {
      _result.images.addAll(images);
    }
    if (level != null) {
      _result.level = level;
    }
    if (unlock != null) {
      _result.unlock = unlock;
    }
    if (score != null) {
      _result.score = score;
    }
    if (levelRules != null) {
      _result.levelRules.addAll(levelRules);
    }
    if (date != null) {
      _result.date = date;
    }
    if (redirect != null) {
      _result.redirect = redirect;
    }
    if (unlockCount != null) {
      _result.unlockCount = unlockCount;
    }
    if (levelRulesText != null) {
      _result.levelRulesText.addAll(levelRulesText);
    }
    if (levelScores != null) {
      _result.levelScores.addAll(levelScores);
    }
    if (progressType != null) {
      _result.progressType = progressType;
    }
    if (sort != null) {
      _result.sort = sort;
    }
    if (levelDate != null) {
      _result.levelDate.addAll(levelDate);
    }
    return _result;
  }
  factory UserAchieveBadge.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserAchieveBadge.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserAchieveBadge clone() => UserAchieveBadge()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserAchieveBadge copyWith(void Function(UserAchieveBadge) updates) =>
      super.copyWith((message) => updates(message as UserAchieveBadge))
          as UserAchieveBadge; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserAchieveBadge create() => UserAchieveBadge._();
  UserAchieveBadge createEmptyInstance() => create();
  static $pb.PbList<UserAchieveBadge> createRepeated() =>
      $pb.PbList<UserAchieveBadge>();
  @$core.pragma('dart2js:noInline')
  static UserAchieveBadge getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserAchieveBadge>(create);
  static UserAchieveBadge? _defaultInstance;

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
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get images => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get level => $_getIZ(4);
  @$pb.TagNumber(5)
  set level($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLevel() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get unlock => $_getIZ(5);
  @$pb.TagNumber(6)
  set unlock($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUnlock() => $_has(5);
  @$pb.TagNumber(6)
  void clearUnlock() => clearField(6);

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
  $core.List<$core.String> get levelRules => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get date => $_getSZ(8);
  @$pb.TagNumber(9)
  set date($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearDate() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get redirect => $_getSZ(9);
  @$pb.TagNumber(10)
  set redirect($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRedirect() => $_has(9);
  @$pb.TagNumber(10)
  void clearRedirect() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get unlockCount => $_getIZ(10);
  @$pb.TagNumber(11)
  set unlockCount($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasUnlockCount() => $_has(10);
  @$pb.TagNumber(11)
  void clearUnlockCount() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<$core.String> get levelRulesText => $_getList(11);

  @$pb.TagNumber(13)
  $core.List<$core.int> get levelScores => $_getList(12);

  @$pb.TagNumber(14)
  $core.int get progressType => $_getIZ(13);
  @$pb.TagNumber(14)
  set progressType($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasProgressType() => $_has(13);
  @$pb.TagNumber(14)
  void clearProgressType() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get sort => $_getIZ(14);
  @$pb.TagNumber(15)
  set sort($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasSort() => $_has(14);
  @$pb.TagNumber(15)
  void clearSort() => clearField(15);

  @$pb.TagNumber(16)
  $core.List<$core.String> get levelDate => $_getList(15);
}

class ResAchieveBadgeRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAchieveBadgeRank',
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
    ..aOM<AchieveBadgeRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AchieveBadgeRankData.create)
    ..hasRequiredFields = false;

  ResAchieveBadgeRank._() : super();
  factory ResAchieveBadgeRank({
    $core.bool? success,
    $core.String? msg,
    AchieveBadgeRankData? data,
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
  factory ResAchieveBadgeRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAchieveBadgeRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAchieveBadgeRank clone() => ResAchieveBadgeRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAchieveBadgeRank copyWith(void Function(ResAchieveBadgeRank) updates) =>
      super.copyWith((message) => updates(message as ResAchieveBadgeRank))
          as ResAchieveBadgeRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAchieveBadgeRank create() => ResAchieveBadgeRank._();
  ResAchieveBadgeRank createEmptyInstance() => create();
  static $pb.PbList<ResAchieveBadgeRank> createRepeated() =>
      $pb.PbList<ResAchieveBadgeRank>();
  @$core.pragma('dart2js:noInline')
  static ResAchieveBadgeRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAchieveBadgeRank>(create);
  static ResAchieveBadgeRank? _defaultInstance;

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
  AchieveBadgeRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AchieveBadgeRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AchieveBadgeRankData ensureData() => $_ensure(2);
}

class AchieveBadgeRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AchieveBadgeRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<AchieveBadgeRankItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: AchieveBadgeRankItem.create)
    ..aOM<AchieveBadgeRankItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'my',
        subBuilder: AchieveBadgeRankItem.create)
    ..hasRequiredFields = false;

  AchieveBadgeRankData._() : super();
  factory AchieveBadgeRankData({
    $core.Iterable<AchieveBadgeRankItem>? list,
    AchieveBadgeRankItem? my,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (my != null) {
      _result.my = my;
    }
    return _result;
  }
  factory AchieveBadgeRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AchieveBadgeRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AchieveBadgeRankData clone() =>
      AchieveBadgeRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AchieveBadgeRankData copyWith(void Function(AchieveBadgeRankData) updates) =>
      super.copyWith((message) => updates(message as AchieveBadgeRankData))
          as AchieveBadgeRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AchieveBadgeRankData create() => AchieveBadgeRankData._();
  AchieveBadgeRankData createEmptyInstance() => create();
  static $pb.PbList<AchieveBadgeRankData> createRepeated() =>
      $pb.PbList<AchieveBadgeRankData>();
  @$core.pragma('dart2js:noInline')
  static AchieveBadgeRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AchieveBadgeRankData>(create);
  static AchieveBadgeRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AchieveBadgeRankItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  AchieveBadgeRankItem get my => $_getN(1);
  @$pb.TagNumber(2)
  set my(AchieveBadgeRankItem v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMy() => $_has(1);
  @$pb.TagNumber(2)
  void clearMy() => clearField(2);
  @$pb.TagNumber(2)
  AchieveBadgeRankItem ensureMy() => $_ensure(1);
}

class AchieveBadgeRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AchieveBadgeRankItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
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
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AchieveBadgeRankItem._() : super();
  factory AchieveBadgeRankItem({
    $core.int? rank,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? score,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank = rank;
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
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory AchieveBadgeRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AchieveBadgeRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AchieveBadgeRankItem clone() =>
      AchieveBadgeRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AchieveBadgeRankItem copyWith(void Function(AchieveBadgeRankItem) updates) =>
      super.copyWith((message) => updates(message as AchieveBadgeRankItem))
          as AchieveBadgeRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AchieveBadgeRankItem create() => AchieveBadgeRankItem._();
  AchieveBadgeRankItem createEmptyInstance() => create();
  static $pb.PbList<AchieveBadgeRankItem> createRepeated() =>
      $pb.PbList<AchieveBadgeRankItem>();
  @$core.pragma('dart2js:noInline')
  static AchieveBadgeRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AchieveBadgeRankItem>(create);
  static AchieveBadgeRankItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rank => $_getIZ(0);
  @$pb.TagNumber(1)
  set rank($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearRank() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get uid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uid($core.int v) {
    $_setUnsignedInt32(1, v);
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
  $core.int get score => $_getIZ(4);
  @$pb.TagNumber(5)
  set score($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearScore() => clearField(5);
}

class ResAchieveWearBadge extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAchieveWearBadge',
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

  ResAchieveWearBadge._() : super();
  factory ResAchieveWearBadge({
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
  factory ResAchieveWearBadge.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAchieveWearBadge.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAchieveWearBadge clone() => ResAchieveWearBadge()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAchieveWearBadge copyWith(void Function(ResAchieveWearBadge) updates) =>
      super.copyWith((message) => updates(message as ResAchieveWearBadge))
          as ResAchieveWearBadge; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAchieveWearBadge create() => ResAchieveWearBadge._();
  ResAchieveWearBadge createEmptyInstance() => create();
  static $pb.PbList<ResAchieveWearBadge> createRepeated() =>
      $pb.PbList<ResAchieveWearBadge>();
  @$core.pragma('dart2js:noInline')
  static ResAchieveWearBadge getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAchieveWearBadge>(create);
  static ResAchieveWearBadge? _defaultInstance;

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

class ResAchieveChangeSkin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAchieveChangeSkin',
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

  ResAchieveChangeSkin._() : super();
  factory ResAchieveChangeSkin({
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
  factory ResAchieveChangeSkin.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAchieveChangeSkin.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAchieveChangeSkin clone() =>
      ResAchieveChangeSkin()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAchieveChangeSkin copyWith(void Function(ResAchieveChangeSkin) updates) =>
      super.copyWith((message) => updates(message as ResAchieveChangeSkin))
          as ResAchieveChangeSkin; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAchieveChangeSkin create() => ResAchieveChangeSkin._();
  ResAchieveChangeSkin createEmptyInstance() => create();
  static $pb.PbList<ResAchieveChangeSkin> createRepeated() =>
      $pb.PbList<ResAchieveChangeSkin>();
  @$core.pragma('dart2js:noInline')
  static ResAchieveChangeSkin getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAchieveChangeSkin>(create);
  static ResAchieveChangeSkin? _defaultInstance;

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

class ResGetRedirect extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGetRedirect',
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
    ..aOM<GetRedirectData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GetRedirectData.create)
    ..hasRequiredFields = false;

  ResGetRedirect._() : super();
  factory ResGetRedirect({
    $core.bool? success,
    $core.String? msg,
    GetRedirectData? data,
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
  factory ResGetRedirect.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGetRedirect.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGetRedirect clone() => ResGetRedirect()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGetRedirect copyWith(void Function(ResGetRedirect) updates) =>
      super.copyWith((message) => updates(message as ResGetRedirect))
          as ResGetRedirect; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGetRedirect create() => ResGetRedirect._();
  ResGetRedirect createEmptyInstance() => create();
  static $pb.PbList<ResGetRedirect> createRepeated() =>
      $pb.PbList<ResGetRedirect>();
  @$core.pragma('dart2js:noInline')
  static ResGetRedirect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGetRedirect>(create);
  static ResGetRedirect? _defaultInstance;

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
  GetRedirectData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GetRedirectData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GetRedirectData ensureData() => $_ensure(2);
}

class GetRedirectData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetRedirectData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redirect')
    ..hasRequiredFields = false;

  GetRedirectData._() : super();
  factory GetRedirectData({
    $core.String? redirect,
  }) {
    final _result = create();
    if (redirect != null) {
      _result.redirect = redirect;
    }
    return _result;
  }
  factory GetRedirectData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetRedirectData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetRedirectData clone() => GetRedirectData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetRedirectData copyWith(void Function(GetRedirectData) updates) =>
      super.copyWith((message) => updates(message as GetRedirectData))
          as GetRedirectData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRedirectData create() => GetRedirectData._();
  GetRedirectData createEmptyInstance() => create();
  static $pb.PbList<GetRedirectData> createRepeated() =>
      $pb.PbList<GetRedirectData>();
  @$core.pragma('dart2js:noInline')
  static GetRedirectData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRedirectData>(create);
  static GetRedirectData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get redirect => $_getSZ(0);
  @$pb.TagNumber(1)
  set redirect($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRedirect() => $_has(0);
  @$pb.TagNumber(1)
  void clearRedirect() => clearField(1);
}
