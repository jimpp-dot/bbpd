///
//  Generated code. Do not modify.
//  source: mom.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MomRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MomRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'mom.refresh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..pc<ShuffleMicList>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'shuffleMicList',
        $pb.PbFieldType.PM,
        subBuilder: ShuffleMicList.create)
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

  MomRefresh._() : super();
  factory MomRefresh({
    $core.String? state,
    $core.Iterable<ShuffleMicList>? shuffleMicList,
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
  factory MomRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MomRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MomRefresh clone() => MomRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MomRefresh copyWith(void Function(MomRefresh) updates) =>
      super.copyWith((message) => updates(message as MomRefresh))
          as MomRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MomRefresh create() => MomRefresh._();
  MomRefresh createEmptyInstance() => create();
  static $pb.PbList<MomRefresh> createRepeated() => $pb.PbList<MomRefresh>();
  @$core.pragma('dart2js:noInline')
  static MomRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MomRefresh>(create);
  static MomRefresh? _defaultInstance;

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
  $core.List<ShuffleMicList> get shuffleMicList => $_getList(1);

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

class ShuffleMicList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShuffleMicList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'mom.refresh'),
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

  ShuffleMicList._() : super();
  factory ShuffleMicList({
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
  factory ShuffleMicList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShuffleMicList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShuffleMicList clone() => ShuffleMicList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShuffleMicList copyWith(void Function(ShuffleMicList) updates) =>
      super.copyWith((message) => updates(message as ShuffleMicList))
          as ShuffleMicList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShuffleMicList create() => ShuffleMicList._();
  ShuffleMicList createEmptyInstance() => create();
  static $pb.PbList<ShuffleMicList> createRepeated() =>
      $pb.PbList<ShuffleMicList>();
  @$core.pragma('dart2js:noInline')
  static ShuffleMicList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShuffleMicList>(create);
  static ShuffleMicList? _defaultInstance;

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
