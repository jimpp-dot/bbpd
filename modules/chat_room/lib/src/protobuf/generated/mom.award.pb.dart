///
//  Generated code. Do not modify.
//  source: mom.award.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MomAward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MomAward',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'mom.award'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomLevel')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardStage')
    ..pc<AwardItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardList',
        $pb.PbFieldType.PM,
        subBuilder: AwardItem.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bossName')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bossIcon')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guessNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MomAward._() : super();
  factory MomAward({
    $core.String? roomLevel,
    $core.String? awardStage,
    $core.Iterable<AwardItem>? awardList,
    $core.String? bossName,
    $core.String? bossIcon,
    $core.int? guessNum,
  }) {
    final _result = create();
    if (roomLevel != null) {
      _result.roomLevel = roomLevel;
    }
    if (awardStage != null) {
      _result.awardStage = awardStage;
    }
    if (awardList != null) {
      _result.awardList.addAll(awardList);
    }
    if (bossName != null) {
      _result.bossName = bossName;
    }
    if (bossIcon != null) {
      _result.bossIcon = bossIcon;
    }
    if (guessNum != null) {
      _result.guessNum = guessNum;
    }
    return _result;
  }
  factory MomAward.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MomAward.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MomAward clone() => MomAward()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MomAward copyWith(void Function(MomAward) updates) =>
      super.copyWith((message) => updates(message as MomAward))
          as MomAward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MomAward create() => MomAward._();
  MomAward createEmptyInstance() => create();
  static $pb.PbList<MomAward> createRepeated() => $pb.PbList<MomAward>();
  @$core.pragma('dart2js:noInline')
  static MomAward getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MomAward>(create);
  static MomAward? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomLevel => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomLevel($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoomLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get awardStage => $_getSZ(1);
  @$pb.TagNumber(2)
  set awardStage($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAwardStage() => $_has(1);
  @$pb.TagNumber(2)
  void clearAwardStage() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<AwardItem> get awardList => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get bossName => $_getSZ(3);
  @$pb.TagNumber(4)
  set bossName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBossName() => $_has(3);
  @$pb.TagNumber(4)
  void clearBossName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get bossIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set bossIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBossIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearBossIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get guessNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set guessNum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGuessNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearGuessNum() => clearField(6);
}

class AwardItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwardItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'mom.award'),
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AwardItem._() : super();
  factory AwardItem({
    $core.String? icon,
    $core.String? name,
    $core.int? num,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (num != null) {
      _result.num = num;
    }
    return _result;
  }
  factory AwardItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwardItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwardItem clone() => AwardItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwardItem copyWith(void Function(AwardItem) updates) =>
      super.copyWith((message) => updates(message as AwardItem))
          as AwardItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwardItem create() => AwardItem._();
  AwardItem createEmptyInstance() => create();
  static $pb.PbList<AwardItem> createRepeated() => $pb.PbList<AwardItem>();
  @$core.pragma('dart2js:noInline')
  static AwardItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AwardItem>(create);
  static AwardItem? _defaultInstance;

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
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => clearField(3);
}
