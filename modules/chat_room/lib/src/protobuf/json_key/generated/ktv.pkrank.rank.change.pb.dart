///
//  Generated code. Do not modify.
//  source: ktv.pkrank.rank.change.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class KtvPkRankRankChange_List extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvPkRankRankChange.List',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'ktv.pkrank.rank.change'),
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
            : 'rank',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  KtvPkRankRankChange_List._() : super();
  factory KtvPkRankRankChange_List({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? rank,
    $core.int? score,
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
    if (rank != null) {
      _result.rank = rank;
    }
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory KtvPkRankRankChange_List.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvPkRankRankChange_List.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvPkRankRankChange_List clone() =>
      KtvPkRankRankChange_List()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvPkRankRankChange_List copyWith(
          void Function(KtvPkRankRankChange_List) updates) =>
      super.copyWith((message) => updates(message as KtvPkRankRankChange_List))
          as KtvPkRankRankChange_List; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvPkRankRankChange_List create() => KtvPkRankRankChange_List._();
  KtvPkRankRankChange_List createEmptyInstance() => create();
  static $pb.PbList<KtvPkRankRankChange_List> createRepeated() =>
      $pb.PbList<KtvPkRankRankChange_List>();
  @$core.pragma('dart2js:noInline')
  static KtvPkRankRankChange_List getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvPkRankRankChange_List>(create);
  static KtvPkRankRankChange_List? _defaultInstance;

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
  $core.int get rank => $_getIZ(3);
  @$pb.TagNumber(4)
  set rank($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearRank() => clearField(4);

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

class KtvPkRankRankChange extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvPkRankRankChange',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'ktv.pkrank.rank.change'),
      createEmptyInstance: create)
    ..pc<KtvPkRankRankChange_List>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: KtvPkRankRankChange_List.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'anim_img')
    ..hasRequiredFields = false;

  KtvPkRankRankChange._() : super();
  factory KtvPkRankRankChange({
    $core.Iterable<KtvPkRankRankChange_List>? list,
    $core.String? animImg,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (animImg != null) {
      _result.animImg = animImg;
    }
    return _result;
  }
  factory KtvPkRankRankChange.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvPkRankRankChange.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvPkRankRankChange clone() => KtvPkRankRankChange()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvPkRankRankChange copyWith(void Function(KtvPkRankRankChange) updates) =>
      super.copyWith((message) => updates(message as KtvPkRankRankChange))
          as KtvPkRankRankChange; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvPkRankRankChange create() => KtvPkRankRankChange._();
  KtvPkRankRankChange createEmptyInstance() => create();
  static $pb.PbList<KtvPkRankRankChange> createRepeated() =>
      $pb.PbList<KtvPkRankRankChange>();
  @$core.pragma('dart2js:noInline')
  static KtvPkRankRankChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvPkRankRankChange>(create);
  static KtvPkRankRankChange? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<KtvPkRankRankChange_List> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get animImg => $_getSZ(1);
  @$pb.TagNumber(2)
  set animImg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAnimImg() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnimImg() => clearField(2);
}
