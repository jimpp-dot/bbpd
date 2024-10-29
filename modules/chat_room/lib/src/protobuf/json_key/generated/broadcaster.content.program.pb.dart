///
//  Generated code. Do not modify.
//  source: broadcaster.content.program.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BroadcasterContentProgram_CurrentAnchor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcasterContentProgram.CurrentAnchor',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'broadcaster.content.program'),
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

  BroadcasterContentProgram_CurrentAnchor._() : super();
  factory BroadcasterContentProgram_CurrentAnchor({
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
  factory BroadcasterContentProgram_CurrentAnchor.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcasterContentProgram_CurrentAnchor.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcasterContentProgram_CurrentAnchor clone() =>
      BroadcasterContentProgram_CurrentAnchor()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcasterContentProgram_CurrentAnchor copyWith(
          void Function(BroadcasterContentProgram_CurrentAnchor) updates) =>
      super.copyWith((message) =>
              updates(message as BroadcasterContentProgram_CurrentAnchor))
          as BroadcasterContentProgram_CurrentAnchor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcasterContentProgram_CurrentAnchor create() =>
      BroadcasterContentProgram_CurrentAnchor._();
  BroadcasterContentProgram_CurrentAnchor createEmptyInstance() => create();
  static $pb.PbList<BroadcasterContentProgram_CurrentAnchor> createRepeated() =>
      $pb.PbList<BroadcasterContentProgram_CurrentAnchor>();
  @$core.pragma('dart2js:noInline')
  static BroadcasterContentProgram_CurrentAnchor getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          BroadcasterContentProgram_CurrentAnchor>(create);
  static BroadcasterContentProgram_CurrentAnchor? _defaultInstance;

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

class BroadcasterContentProgram extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcasterContentProgram',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'broadcaster.content.program'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'program_id',
        $pb.PbFieldType.OU3)
    ..aOM<BroadcasterContentProgram_CurrentAnchor>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current_anchor',
        subBuilder: BroadcasterContentProgram_CurrentAnchor.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'banner_text')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank_desc')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star_num',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BroadcasterContentProgram._() : super();
  factory BroadcasterContentProgram({
    $core.String? state,
    $core.int? programId,
    BroadcasterContentProgram_CurrentAnchor? currentAnchor,
    $core.String? bannerText,
    $core.String? rankDesc,
    $core.int? starNum,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (programId != null) {
      _result.programId = programId;
    }
    if (currentAnchor != null) {
      _result.currentAnchor = currentAnchor;
    }
    if (bannerText != null) {
      _result.bannerText = bannerText;
    }
    if (rankDesc != null) {
      _result.rankDesc = rankDesc;
    }
    if (starNum != null) {
      _result.starNum = starNum;
    }
    return _result;
  }
  factory BroadcasterContentProgram.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcasterContentProgram.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcasterContentProgram clone() =>
      BroadcasterContentProgram()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcasterContentProgram copyWith(
          void Function(BroadcasterContentProgram) updates) =>
      super.copyWith((message) => updates(message as BroadcasterContentProgram))
          as BroadcasterContentProgram; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcasterContentProgram create() => BroadcasterContentProgram._();
  BroadcasterContentProgram createEmptyInstance() => create();
  static $pb.PbList<BroadcasterContentProgram> createRepeated() =>
      $pb.PbList<BroadcasterContentProgram>();
  @$core.pragma('dart2js:noInline')
  static BroadcasterContentProgram getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcasterContentProgram>(create);
  static BroadcasterContentProgram? _defaultInstance;

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
  $core.int get programId => $_getIZ(1);
  @$pb.TagNumber(2)
  set programId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasProgramId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProgramId() => clearField(2);

  @$pb.TagNumber(3)
  BroadcasterContentProgram_CurrentAnchor get currentAnchor => $_getN(2);
  @$pb.TagNumber(3)
  set currentAnchor(BroadcasterContentProgram_CurrentAnchor v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCurrentAnchor() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentAnchor() => clearField(3);
  @$pb.TagNumber(3)
  BroadcasterContentProgram_CurrentAnchor ensureCurrentAnchor() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get bannerText => $_getSZ(3);
  @$pb.TagNumber(4)
  set bannerText($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBannerText() => $_has(3);
  @$pb.TagNumber(4)
  void clearBannerText() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get rankDesc => $_getSZ(4);
  @$pb.TagNumber(5)
  set rankDesc($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRankDesc() => $_has(4);
  @$pb.TagNumber(5)
  void clearRankDesc() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get starNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set starNum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStarNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearStarNum() => clearField(6);
}
