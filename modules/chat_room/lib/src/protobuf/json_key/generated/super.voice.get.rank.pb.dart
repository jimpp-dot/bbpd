///
//  Generated code. Do not modify.
//  source: super.voice.get.rank.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SuperVoiceGetRank_Rank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuperVoiceGetRank.Rank',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'super.voice.get.rank'),
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
            : 'sort_score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SuperVoiceGetRank_Rank._() : super();
  factory SuperVoiceGetRank_Rank({
    $core.String? icon,
    $core.String? name,
    $core.int? sortScore,
    $core.int? uid,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sortScore != null) {
      _result.sortScore = sortScore;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory SuperVoiceGetRank_Rank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuperVoiceGetRank_Rank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuperVoiceGetRank_Rank clone() =>
      SuperVoiceGetRank_Rank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuperVoiceGetRank_Rank copyWith(
          void Function(SuperVoiceGetRank_Rank) updates) =>
      super.copyWith((message) => updates(message as SuperVoiceGetRank_Rank))
          as SuperVoiceGetRank_Rank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuperVoiceGetRank_Rank create() => SuperVoiceGetRank_Rank._();
  SuperVoiceGetRank_Rank createEmptyInstance() => create();
  static $pb.PbList<SuperVoiceGetRank_Rank> createRepeated() =>
      $pb.PbList<SuperVoiceGetRank_Rank>();
  @$core.pragma('dart2js:noInline')
  static SuperVoiceGetRank_Rank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuperVoiceGetRank_Rank>(create);
  static SuperVoiceGetRank_Rank? _defaultInstance;

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
  $core.int get sortScore => $_getIZ(2);
  @$pb.TagNumber(3)
  set sortScore($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSortScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearSortScore() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get uid => $_getIZ(3);
  @$pb.TagNumber(4)
  set uid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => clearField(4);
}

class SuperVoiceGetRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuperVoiceGetRank',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'super.voice.get.rank'),
      createEmptyInstance: create)
    ..pc<SuperVoiceGetRank_Rank>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.PM,
        subBuilder: SuperVoiceGetRank_Rank.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version')
    ..hasRequiredFields = false;

  SuperVoiceGetRank._() : super();
  factory SuperVoiceGetRank({
    $core.Iterable<SuperVoiceGetRank_Rank>? rank,
    $core.String? rid,
    $core.String? version,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank.addAll(rank);
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (version != null) {
      _result.version = version;
    }
    return _result;
  }
  factory SuperVoiceGetRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuperVoiceGetRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuperVoiceGetRank clone() => SuperVoiceGetRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuperVoiceGetRank copyWith(void Function(SuperVoiceGetRank) updates) =>
      super.copyWith((message) => updates(message as SuperVoiceGetRank))
          as SuperVoiceGetRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuperVoiceGetRank create() => SuperVoiceGetRank._();
  SuperVoiceGetRank createEmptyInstance() => create();
  static $pb.PbList<SuperVoiceGetRank> createRepeated() =>
      $pb.PbList<SuperVoiceGetRank>();
  @$core.pragma('dart2js:noInline')
  static SuperVoiceGetRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuperVoiceGetRank>(create);
  static SuperVoiceGetRank? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SuperVoiceGetRank_Rank> get rank => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get rid => $_getSZ(1);
  @$pb.TagNumber(2)
  set rid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get version => $_getSZ(2);
  @$pb.TagNumber(3)
  set version($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);
}
