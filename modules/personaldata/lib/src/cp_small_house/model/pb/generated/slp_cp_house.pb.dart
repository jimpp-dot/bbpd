///
//  Generated code. Do not modify.
//  source: slp_cp_house.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResHouseProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHouseProfile',
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
    ..aOM<HouseProfile>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'houseProfile',
        subBuilder: HouseProfile.create)
    ..hasRequiredFields = false;

  ResHouseProfile._() : super();
  factory ResHouseProfile({
    $core.bool? success,
    $core.String? msg,
    HouseProfile? houseProfile,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (houseProfile != null) {
      _result.houseProfile = houseProfile;
    }
    return _result;
  }
  factory ResHouseProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHouseProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHouseProfile clone() => ResHouseProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHouseProfile copyWith(void Function(ResHouseProfile) updates) =>
      super.copyWith((message) => updates(message as ResHouseProfile))
          as ResHouseProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHouseProfile create() => ResHouseProfile._();
  ResHouseProfile createEmptyInstance() => create();
  static $pb.PbList<ResHouseProfile> createRepeated() =>
      $pb.PbList<ResHouseProfile>();
  @$core.pragma('dart2js:noInline')
  static ResHouseProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHouseProfile>(create);
  static ResHouseProfile? _defaultInstance;

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
  HouseProfile get houseProfile => $_getN(2);
  @$pb.TagNumber(3)
  set houseProfile(HouseProfile v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHouseProfile() => $_has(2);
  @$pb.TagNumber(3)
  void clearHouseProfile() => clearField(3);
  @$pb.TagNumber(3)
  HouseProfile ensureHouseProfile() => $_ensure(2);
}

class HouseUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HouseUser',
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
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  HouseUser._() : super();
  factory HouseUser({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory HouseUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HouseUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HouseUser clone() => HouseUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HouseUser copyWith(void Function(HouseUser) updates) =>
      super.copyWith((message) => updates(message as HouseUser))
          as HouseUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HouseUser create() => HouseUser._();
  HouseUser createEmptyInstance() => create();
  static $pb.PbList<HouseUser> createRepeated() => $pb.PbList<HouseUser>();
  @$core.pragma('dart2js:noInline')
  static HouseUser getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HouseUser>(create);
  static HouseUser? _defaultInstance;

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
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class HouseProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HouseProfile',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<HouseUser>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from',
        subBuilder: HouseUser.create)
    ..aOM<HouseUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to',
        subBuilder: HouseUser.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'houseName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'houseLevel',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'houseBg')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'houseId',
        $pb.PbFieldType.OU3)
    ..pc<HouseLevelConfig>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'houseLevelConfig',
        $pb.PbFieldType.PM,
        subBuilder: HouseLevelConfig.create)
    ..hasRequiredFields = false;

  HouseProfile._() : super();
  factory HouseProfile({
    HouseUser? from,
    HouseUser? to,
    $core.String? houseName,
    $core.int? houseLevel,
    $core.String? houseBg,
    $core.int? houseId,
    $core.Iterable<HouseLevelConfig>? houseLevelConfig,
  }) {
    final _result = create();
    if (from != null) {
      _result.from = from;
    }
    if (to != null) {
      _result.to = to;
    }
    if (houseName != null) {
      _result.houseName = houseName;
    }
    if (houseLevel != null) {
      _result.houseLevel = houseLevel;
    }
    if (houseBg != null) {
      _result.houseBg = houseBg;
    }
    if (houseId != null) {
      _result.houseId = houseId;
    }
    if (houseLevelConfig != null) {
      _result.houseLevelConfig.addAll(houseLevelConfig);
    }
    return _result;
  }
  factory HouseProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HouseProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HouseProfile clone() => HouseProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HouseProfile copyWith(void Function(HouseProfile) updates) =>
      super.copyWith((message) => updates(message as HouseProfile))
          as HouseProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HouseProfile create() => HouseProfile._();
  HouseProfile createEmptyInstance() => create();
  static $pb.PbList<HouseProfile> createRepeated() =>
      $pb.PbList<HouseProfile>();
  @$core.pragma('dart2js:noInline')
  static HouseProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HouseProfile>(create);
  static HouseProfile? _defaultInstance;

  @$pb.TagNumber(1)
  HouseUser get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(HouseUser v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);
  @$pb.TagNumber(1)
  HouseUser ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  HouseUser get to => $_getN(1);
  @$pb.TagNumber(2)
  set to(HouseUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);
  @$pb.TagNumber(2)
  HouseUser ensureTo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get houseName => $_getSZ(2);
  @$pb.TagNumber(3)
  set houseName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHouseName() => $_has(2);
  @$pb.TagNumber(3)
  void clearHouseName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get houseLevel => $_getIZ(3);
  @$pb.TagNumber(4)
  set houseLevel($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHouseLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearHouseLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get houseBg => $_getSZ(4);
  @$pb.TagNumber(5)
  set houseBg($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHouseBg() => $_has(4);
  @$pb.TagNumber(5)
  void clearHouseBg() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get houseId => $_getIZ(5);
  @$pb.TagNumber(6)
  set houseId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHouseId() => $_has(5);
  @$pb.TagNumber(6)
  void clearHouseId() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<HouseLevelConfig> get houseLevelConfig => $_getList(6);
}

class ResHouseDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHouseDetail',
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
    ..aOM<HouseDetail>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'houseDetail',
        subBuilder: HouseDetail.create)
    ..hasRequiredFields = false;

  ResHouseDetail._() : super();
  factory ResHouseDetail({
    $core.bool? success,
    $core.String? msg,
    HouseDetail? houseDetail,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (houseDetail != null) {
      _result.houseDetail = houseDetail;
    }
    return _result;
  }
  factory ResHouseDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHouseDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHouseDetail clone() => ResHouseDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHouseDetail copyWith(void Function(ResHouseDetail) updates) =>
      super.copyWith((message) => updates(message as ResHouseDetail))
          as ResHouseDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHouseDetail create() => ResHouseDetail._();
  ResHouseDetail createEmptyInstance() => create();
  static $pb.PbList<ResHouseDetail> createRepeated() =>
      $pb.PbList<ResHouseDetail>();
  @$core.pragma('dart2js:noInline')
  static ResHouseDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHouseDetail>(create);
  static ResHouseDetail? _defaultInstance;

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
  HouseDetail get houseDetail => $_getN(2);
  @$pb.TagNumber(3)
  set houseDetail(HouseDetail v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHouseDetail() => $_has(2);
  @$pb.TagNumber(3)
  void clearHouseDetail() => clearField(3);
  @$pb.TagNumber(3)
  HouseDetail ensureHouseDetail() => $_ensure(2);
}

class HouseDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HouseDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'houseId',
        $pb.PbFieldType.OU3)
    ..aOM<HouseUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from',
        subBuilder: HouseUser.create)
    ..aOM<HouseUser>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to',
        subBuilder: HouseUser.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'exp',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextLevelExp',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'houseLevel',
        $pb.PbFieldType.OU3)
    ..aOM<HouseMission>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'houseMission',
        subBuilder: HouseMission.create)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'houseBg')
    ..pc<HouseLevelConfig>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'houseLevelConfig',
        $pb.PbFieldType.PM,
        subBuilder: HouseLevelConfig.create)
    ..aOB(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasNewInvite')
    ..hasRequiredFields = false;

  HouseDetail._() : super();
  factory HouseDetail({
    $core.int? houseId,
    HouseUser? from,
    HouseUser? to,
    $core.int? exp,
    $core.int? nextLevelExp,
    $core.int? houseLevel,
    HouseMission? houseMission,
    $core.String? houseBg,
    $core.Iterable<HouseLevelConfig>? houseLevelConfig,
    $core.bool? hasNewInvite,
  }) {
    final _result = create();
    if (houseId != null) {
      _result.houseId = houseId;
    }
    if (from != null) {
      _result.from = from;
    }
    if (to != null) {
      _result.to = to;
    }
    if (exp != null) {
      _result.exp = exp;
    }
    if (nextLevelExp != null) {
      _result.nextLevelExp = nextLevelExp;
    }
    if (houseLevel != null) {
      _result.houseLevel = houseLevel;
    }
    if (houseMission != null) {
      _result.houseMission = houseMission;
    }
    if (houseBg != null) {
      _result.houseBg = houseBg;
    }
    if (houseLevelConfig != null) {
      _result.houseLevelConfig.addAll(houseLevelConfig);
    }
    if (hasNewInvite != null) {
      _result.hasNewInvite = hasNewInvite;
    }
    return _result;
  }
  factory HouseDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HouseDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HouseDetail clone() => HouseDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HouseDetail copyWith(void Function(HouseDetail) updates) =>
      super.copyWith((message) => updates(message as HouseDetail))
          as HouseDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HouseDetail create() => HouseDetail._();
  HouseDetail createEmptyInstance() => create();
  static $pb.PbList<HouseDetail> createRepeated() => $pb.PbList<HouseDetail>();
  @$core.pragma('dart2js:noInline')
  static HouseDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HouseDetail>(create);
  static HouseDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get houseId => $_getIZ(0);
  @$pb.TagNumber(1)
  set houseId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHouseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHouseId() => clearField(1);

  @$pb.TagNumber(2)
  HouseUser get from => $_getN(1);
  @$pb.TagNumber(2)
  set from(HouseUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);
  @$pb.TagNumber(2)
  HouseUser ensureFrom() => $_ensure(1);

  @$pb.TagNumber(3)
  HouseUser get to => $_getN(2);
  @$pb.TagNumber(3)
  set to(HouseUser v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => clearField(3);
  @$pb.TagNumber(3)
  HouseUser ensureTo() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get exp => $_getIZ(3);
  @$pb.TagNumber(4)
  set exp($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasExp() => $_has(3);
  @$pb.TagNumber(4)
  void clearExp() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get nextLevelExp => $_getIZ(4);
  @$pb.TagNumber(5)
  set nextLevelExp($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNextLevelExp() => $_has(4);
  @$pb.TagNumber(5)
  void clearNextLevelExp() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get houseLevel => $_getIZ(5);
  @$pb.TagNumber(6)
  set houseLevel($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHouseLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearHouseLevel() => clearField(6);

  @$pb.TagNumber(7)
  HouseMission get houseMission => $_getN(6);
  @$pb.TagNumber(7)
  set houseMission(HouseMission v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasHouseMission() => $_has(6);
  @$pb.TagNumber(7)
  void clearHouseMission() => clearField(7);
  @$pb.TagNumber(7)
  HouseMission ensureHouseMission() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get houseBg => $_getSZ(7);
  @$pb.TagNumber(8)
  set houseBg($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasHouseBg() => $_has(7);
  @$pb.TagNumber(8)
  void clearHouseBg() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<HouseLevelConfig> get houseLevelConfig => $_getList(8);

  @$pb.TagNumber(10)
  $core.bool get hasNewInvite => $_getBF(9);
  @$pb.TagNumber(10)
  set hasNewInvite($core.bool v) {
    $_setBool(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasHasNewInvite() => $_has(9);
  @$pb.TagNumber(10)
  void clearHasNewInvite() => clearField(10);
}

class HouseLevelConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HouseLevelConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlockeLevel',
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
            : 'bg')
    ..hasRequiredFields = false;

  HouseLevelConfig._() : super();
  factory HouseLevelConfig({
    $core.int? unlockeLevel,
    $core.String? name,
    $core.String? bg,
  }) {
    final _result = create();
    if (unlockeLevel != null) {
      _result.unlockeLevel = unlockeLevel;
    }
    if (name != null) {
      _result.name = name;
    }
    if (bg != null) {
      _result.bg = bg;
    }
    return _result;
  }
  factory HouseLevelConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HouseLevelConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HouseLevelConfig clone() => HouseLevelConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HouseLevelConfig copyWith(void Function(HouseLevelConfig) updates) =>
      super.copyWith((message) => updates(message as HouseLevelConfig))
          as HouseLevelConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HouseLevelConfig create() => HouseLevelConfig._();
  HouseLevelConfig createEmptyInstance() => create();
  static $pb.PbList<HouseLevelConfig> createRepeated() =>
      $pb.PbList<HouseLevelConfig>();
  @$core.pragma('dart2js:noInline')
  static HouseLevelConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HouseLevelConfig>(create);
  static HouseLevelConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get unlockeLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set unlockeLevel($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUnlockeLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnlockeLevel() => clearField(1);

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
  $core.String get bg => $_getSZ(2);
  @$pb.TagNumber(3)
  set bg($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBg() => $_has(2);
  @$pb.TagNumber(3)
  void clearBg() => clearField(3);
}

class HouseMissionItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HouseMissionItem',
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
            : 'title')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'addExp',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progress',
        $pb.PbFieldType.OU3)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'limit',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HouseMissionItem._() : super();
  factory HouseMissionItem({
    $core.int? id,
    $core.String? title,
    $core.int? addExp,
    $core.int? progress,
    $core.bool? status,
    $core.String? icon,
    $core.int? limit,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (addExp != null) {
      _result.addExp = addExp;
    }
    if (progress != null) {
      _result.progress = progress;
    }
    if (status != null) {
      _result.status = status;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    return _result;
  }
  factory HouseMissionItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HouseMissionItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HouseMissionItem clone() => HouseMissionItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HouseMissionItem copyWith(void Function(HouseMissionItem) updates) =>
      super.copyWith((message) => updates(message as HouseMissionItem))
          as HouseMissionItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HouseMissionItem create() => HouseMissionItem._();
  HouseMissionItem createEmptyInstance() => create();
  static $pb.PbList<HouseMissionItem> createRepeated() =>
      $pb.PbList<HouseMissionItem>();
  @$core.pragma('dart2js:noInline')
  static HouseMissionItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HouseMissionItem>(create);
  static HouseMissionItem? _defaultInstance;

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
  $core.int get addExp => $_getIZ(2);
  @$pb.TagNumber(3)
  set addExp($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAddExp() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddExp() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get progress => $_getIZ(3);
  @$pb.TagNumber(4)
  set progress($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasProgress() => $_has(3);
  @$pb.TagNumber(4)
  void clearProgress() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get status => $_getBF(4);
  @$pb.TagNumber(5)
  set status($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

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
  $core.int get limit => $_getIZ(6);
  @$pb.TagNumber(7)
  set limit($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLimit() => $_has(6);
  @$pb.TagNumber(7)
  void clearLimit() => clearField(7);
}

class HouseMission extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HouseMission',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<HouseMissionItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cpMissionList',
        $pb.PbFieldType.PM,
        subBuilder: HouseMissionItem.create)
    ..pc<HouseMissionItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dayMissionList',
        $pb.PbFieldType.PM,
        subBuilder: HouseMissionItem.create)
    ..pc<HouseMissionItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekMissionList',
        $pb.PbFieldType.PM,
        subBuilder: HouseMissionItem.create)
    ..hasRequiredFields = false;

  HouseMission._() : super();
  factory HouseMission({
    $core.Iterable<HouseMissionItem>? cpMissionList,
    $core.Iterable<HouseMissionItem>? dayMissionList,
    $core.Iterable<HouseMissionItem>? weekMissionList,
  }) {
    final _result = create();
    if (cpMissionList != null) {
      _result.cpMissionList.addAll(cpMissionList);
    }
    if (dayMissionList != null) {
      _result.dayMissionList.addAll(dayMissionList);
    }
    if (weekMissionList != null) {
      _result.weekMissionList.addAll(weekMissionList);
    }
    return _result;
  }
  factory HouseMission.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HouseMission.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HouseMission clone() => HouseMission()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HouseMission copyWith(void Function(HouseMission) updates) =>
      super.copyWith((message) => updates(message as HouseMission))
          as HouseMission; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HouseMission create() => HouseMission._();
  HouseMission createEmptyInstance() => create();
  static $pb.PbList<HouseMission> createRepeated() =>
      $pb.PbList<HouseMission>();
  @$core.pragma('dart2js:noInline')
  static HouseMission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HouseMission>(create);
  static HouseMission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<HouseMissionItem> get cpMissionList => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<HouseMissionItem> get dayMissionList => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<HouseMissionItem> get weekMissionList => $_getList(2);
}

class ResHouseInvite extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHouseInvite',
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
    ..pc<HouseInviteItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: HouseInviteItem.create)
    ..hasRequiredFields = false;

  ResHouseInvite._() : super();
  factory ResHouseInvite({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<HouseInviteItem>? data,
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
  factory ResHouseInvite.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHouseInvite.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHouseInvite clone() => ResHouseInvite()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHouseInvite copyWith(void Function(ResHouseInvite) updates) =>
      super.copyWith((message) => updates(message as ResHouseInvite))
          as ResHouseInvite; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHouseInvite create() => ResHouseInvite._();
  ResHouseInvite createEmptyInstance() => create();
  static $pb.PbList<ResHouseInvite> createRepeated() =>
      $pb.PbList<ResHouseInvite>();
  @$core.pragma('dart2js:noInline')
  static ResHouseInvite getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHouseInvite>(create);
  static ResHouseInvite? _defaultInstance;

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
  $core.List<HouseInviteItem> get data => $_getList(2);
}

class HouseInviteItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HouseInviteItem',
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
            : 'vipLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HouseInviteItem._() : super();
  factory HouseInviteItem({
    $core.int? id,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? vipLevel,
    $core.int? title,
    $core.int? status,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
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
    if (vipLevel != null) {
      _result.vipLevel = vipLevel;
    }
    if (title != null) {
      _result.title = title;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory HouseInviteItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HouseInviteItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HouseInviteItem clone() => HouseInviteItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HouseInviteItem copyWith(void Function(HouseInviteItem) updates) =>
      super.copyWith((message) => updates(message as HouseInviteItem))
          as HouseInviteItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HouseInviteItem create() => HouseInviteItem._();
  HouseInviteItem createEmptyInstance() => create();
  static $pb.PbList<HouseInviteItem> createRepeated() =>
      $pb.PbList<HouseInviteItem>();
  @$core.pragma('dart2js:noInline')
  static HouseInviteItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HouseInviteItem>(create);
  static HouseInviteItem? _defaultInstance;

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
  $core.int get vipLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set vipLevel($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasVipLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearVipLevel() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get title => $_getIZ(5);
  @$pb.TagNumber(6)
  set title($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get status => $_getIZ(6);
  @$pb.TagNumber(7)
  set status($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);
}
