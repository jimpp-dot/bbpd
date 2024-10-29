///
//  Generated code. Do not modify.
//  source: banban_rank_strategy.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResHomeRankStrategy extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomeRankStrategy',
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
    ..pc<HomeRankStrategy>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: HomeRankStrategy.create)
    ..hasRequiredFields = false;

  ResHomeRankStrategy._() : super();
  factory ResHomeRankStrategy({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<HomeRankStrategy>? data,
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
  factory ResHomeRankStrategy.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomeRankStrategy.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomeRankStrategy clone() => ResHomeRankStrategy()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomeRankStrategy copyWith(void Function(ResHomeRankStrategy) updates) =>
      super.copyWith((message) => updates(message as ResHomeRankStrategy))
          as ResHomeRankStrategy; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomeRankStrategy create() => ResHomeRankStrategy._();
  ResHomeRankStrategy createEmptyInstance() => create();
  static $pb.PbList<ResHomeRankStrategy> createRepeated() =>
      $pb.PbList<ResHomeRankStrategy>();
  @$core.pragma('dart2js:noInline')
  static ResHomeRankStrategy getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomeRankStrategy>(create);
  static ResHomeRankStrategy? _defaultInstance;

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
  $core.List<HomeRankStrategy> get data => $_getList(2);
}

class HomeRankStrategy extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeRankStrategy',
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
            : 'key')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hideRank')
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hideScore')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hideList')
    ..hasRequiredFields = false;

  HomeRankStrategy._() : super();
  factory HomeRankStrategy({
    $core.int? id,
    $core.String? key,
    $core.String? name,
    $core.bool? hideRank,
    $core.bool? hideScore,
    $core.bool? hideList,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (key != null) {
      _result.key = key;
    }
    if (name != null) {
      _result.name = name;
    }
    if (hideRank != null) {
      _result.hideRank = hideRank;
    }
    if (hideScore != null) {
      _result.hideScore = hideScore;
    }
    if (hideList != null) {
      _result.hideList = hideList;
    }
    return _result;
  }
  factory HomeRankStrategy.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeRankStrategy.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeRankStrategy clone() => HomeRankStrategy()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeRankStrategy copyWith(void Function(HomeRankStrategy) updates) =>
      super.copyWith((message) => updates(message as HomeRankStrategy))
          as HomeRankStrategy; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeRankStrategy create() => HomeRankStrategy._();
  HomeRankStrategy createEmptyInstance() => create();
  static $pb.PbList<HomeRankStrategy> createRepeated() =>
      $pb.PbList<HomeRankStrategy>();
  @$core.pragma('dart2js:noInline')
  static HomeRankStrategy getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeRankStrategy>(create);
  static HomeRankStrategy? _defaultInstance;

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
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);

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
  $core.bool get hideRank => $_getBF(3);
  @$pb.TagNumber(4)
  set hideRank($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHideRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearHideRank() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get hideScore => $_getBF(4);
  @$pb.TagNumber(5)
  set hideScore($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHideScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearHideScore() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get hideList => $_getBF(5);
  @$pb.TagNumber(6)
  set hideList($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHideList() => $_has(5);
  @$pb.TagNumber(6)
  void clearHideList() => clearField(6);
}
