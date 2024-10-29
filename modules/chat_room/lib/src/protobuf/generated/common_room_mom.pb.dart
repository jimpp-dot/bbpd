///
//  Generated code. Do not modify.
//  source: common_room_mom.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResMomConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMomConfig',
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
    ..aOM<MomConfig>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'config',
        subBuilder: MomConfig.create)
    ..hasRequiredFields = false;

  ResMomConfig._() : super();
  factory ResMomConfig({
    $core.bool? success,
    $core.String? msg,
    MomConfig? config,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (config != null) {
      _result.config = config;
    }
    return _result;
  }
  factory ResMomConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMomConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMomConfig clone() => ResMomConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMomConfig copyWith(void Function(ResMomConfig) updates) =>
      super.copyWith((message) => updates(message as ResMomConfig))
          as ResMomConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMomConfig create() => ResMomConfig._();
  ResMomConfig createEmptyInstance() => create();
  static $pb.PbList<ResMomConfig> createRepeated() =>
      $pb.PbList<ResMomConfig>();
  @$core.pragma('dart2js:noInline')
  static ResMomConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMomConfig>(create);
  static ResMomConfig? _defaultInstance;

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
  MomConfig get config => $_getN(2);
  @$pb.TagNumber(3)
  set config(MomConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasConfig() => $_has(2);
  @$pb.TagNumber(3)
  void clearConfig() => clearField(3);
  @$pb.TagNumber(3)
  MomConfig ensureConfig() => $_ensure(2);
}

class MomConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MomConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..pc<ShuffleMicItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'shuffleMicList',
        $pb.PbFieldType.PM,
        subBuilder: ShuffleMicItem.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomLevel')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardStage')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadline',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'upgradeAwardTips')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bossName')
    ..hasRequiredFields = false;

  MomConfig._() : super();
  factory MomConfig({
    $core.String? state,
    $core.Iterable<ShuffleMicItem>? shuffleMicList,
    $core.String? roomLevel,
    $core.String? awardStage,
    $core.int? deadline,
    $core.String? upgradeAwardTips,
    $core.String? bossName,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (shuffleMicList != null) {
      _result.shuffleMicList.addAll(shuffleMicList);
    }
    if (roomLevel != null) {
      _result.roomLevel = roomLevel;
    }
    if (awardStage != null) {
      _result.awardStage = awardStage;
    }
    if (deadline != null) {
      _result.deadline = deadline;
    }
    if (upgradeAwardTips != null) {
      _result.upgradeAwardTips = upgradeAwardTips;
    }
    if (bossName != null) {
      _result.bossName = bossName;
    }
    return _result;
  }
  factory MomConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MomConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MomConfig clone() => MomConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MomConfig copyWith(void Function(MomConfig) updates) =>
      super.copyWith((message) => updates(message as MomConfig))
          as MomConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MomConfig create() => MomConfig._();
  MomConfig createEmptyInstance() => create();
  static $pb.PbList<MomConfig> createRepeated() => $pb.PbList<MomConfig>();
  @$core.pragma('dart2js:noInline')
  static MomConfig getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MomConfig>(create);
  static MomConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get state => $_getSZ(0);
  @$pb.TagNumber(1)
  set state($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ShuffleMicItem> get shuffleMicList => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get roomLevel => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomLevel($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRoomLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomLevel() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get awardStage => $_getSZ(3);
  @$pb.TagNumber(4)
  set awardStage($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAwardStage() => $_has(3);
  @$pb.TagNumber(4)
  void clearAwardStage() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get deadline => $_getIZ(4);
  @$pb.TagNumber(5)
  set deadline($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDeadline() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeadline() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get upgradeAwardTips => $_getSZ(5);
  @$pb.TagNumber(6)
  set upgradeAwardTips($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUpgradeAwardTips() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpgradeAwardTips() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get bossName => $_getSZ(6);
  @$pb.TagNumber(7)
  set bossName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBossName() => $_has(6);
  @$pb.TagNumber(7)
  void clearBossName() => clearField(7);
}

class ShuffleMicItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShuffleMicItem',
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
            : 'package',
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
            : 'position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guessUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guessName')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guessIcon')
    ..hasRequiredFields = false;

  ShuffleMicItem._() : super();
  factory ShuffleMicItem({
    $core.int? uid,
    $core.int? package,
    $core.String? name,
    $core.String? icon,
    $core.int? position,
    $core.int? guessUid,
    $core.String? guessName,
    $core.String? guessIcon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (package != null) {
      _result.package = package;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (position != null) {
      _result.position = position;
    }
    if (guessUid != null) {
      _result.guessUid = guessUid;
    }
    if (guessName != null) {
      _result.guessName = guessName;
    }
    if (guessIcon != null) {
      _result.guessIcon = guessIcon;
    }
    return _result;
  }
  factory ShuffleMicItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShuffleMicItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShuffleMicItem clone() => ShuffleMicItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShuffleMicItem copyWith(void Function(ShuffleMicItem) updates) =>
      super.copyWith((message) => updates(message as ShuffleMicItem))
          as ShuffleMicItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShuffleMicItem create() => ShuffleMicItem._();
  ShuffleMicItem createEmptyInstance() => create();
  static $pb.PbList<ShuffleMicItem> createRepeated() =>
      $pb.PbList<ShuffleMicItem>();
  @$core.pragma('dart2js:noInline')
  static ShuffleMicItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShuffleMicItem>(create);
  static ShuffleMicItem? _defaultInstance;

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
  $core.int get package => $_getIZ(1);
  @$pb.TagNumber(2)
  set package($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPackage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPackage() => clearField(2);

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
  $core.int get position => $_getIZ(4);
  @$pb.TagNumber(5)
  set position($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPosition() => $_has(4);
  @$pb.TagNumber(5)
  void clearPosition() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get guessUid => $_getIZ(5);
  @$pb.TagNumber(6)
  set guessUid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGuessUid() => $_has(5);
  @$pb.TagNumber(6)
  void clearGuessUid() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get guessName => $_getSZ(6);
  @$pb.TagNumber(7)
  set guessName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGuessName() => $_has(6);
  @$pb.TagNumber(7)
  void clearGuessName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get guessIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set guessIcon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGuessIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearGuessIcon() => clearField(8);
}

class ResMomGsList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMomGsList',
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
    ..pc<GsItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gsList',
        $pb.PbFieldType.PM,
        subBuilder: GsItem.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guessUid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ResMomGsList._() : super();
  factory ResMomGsList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GsItem>? gsList,
    $core.int? guessUid,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (gsList != null) {
      _result.gsList.addAll(gsList);
    }
    if (guessUid != null) {
      _result.guessUid = guessUid;
    }
    return _result;
  }
  factory ResMomGsList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMomGsList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMomGsList clone() => ResMomGsList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMomGsList copyWith(void Function(ResMomGsList) updates) =>
      super.copyWith((message) => updates(message as ResMomGsList))
          as ResMomGsList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMomGsList create() => ResMomGsList._();
  ResMomGsList createEmptyInstance() => create();
  static $pb.PbList<ResMomGsList> createRepeated() =>
      $pb.PbList<ResMomGsList>();
  @$core.pragma('dart2js:noInline')
  static ResMomGsList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMomGsList>(create);
  static ResMomGsList? _defaultInstance;

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
  $core.List<GsItem> get gsList => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get guessUid => $_getIZ(3);
  @$pb.TagNumber(4)
  set guessUid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGuessUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearGuessUid() => clearField(4);
}

class GsItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsItem',
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
            : 'sex',
        $pb.PbFieldType.OU3)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isFollow')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sign')
    ..pPS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icons')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GsItem._() : super();
  factory GsItem({
    $core.int? uid,
    $core.int? sex,
    $core.bool? isFollow,
    $core.String? name,
    $core.String? icon,
    $core.String? sign,
    $core.Iterable<$core.String>? icons,
    $core.int? age,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (isFollow != null) {
      _result.isFollow = isFollow;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    if (icons != null) {
      _result.icons.addAll(icons);
    }
    if (age != null) {
      _result.age = age;
    }
    return _result;
  }
  factory GsItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsItem clone() => GsItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsItem copyWith(void Function(GsItem) updates) =>
      super.copyWith((message) => updates(message as GsItem))
          as GsItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsItem create() => GsItem._();
  GsItem createEmptyInstance() => create();
  static $pb.PbList<GsItem> createRepeated() => $pb.PbList<GsItem>();
  @$core.pragma('dart2js:noInline')
  static GsItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GsItem>(create);
  static GsItem? _defaultInstance;

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
  $core.int get sex => $_getIZ(1);
  @$pb.TagNumber(2)
  set sex($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSex() => $_has(1);
  @$pb.TagNumber(2)
  void clearSex() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isFollow => $_getBF(2);
  @$pb.TagNumber(3)
  set isFollow($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsFollow() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsFollow() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

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
  $core.List<$core.String> get icons => $_getList(6);

  @$pb.TagNumber(8)
  $core.int get age => $_getIZ(7);
  @$pb.TagNumber(8)
  set age($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAge() => $_has(7);
  @$pb.TagNumber(8)
  void clearAge() => clearField(8);
}
