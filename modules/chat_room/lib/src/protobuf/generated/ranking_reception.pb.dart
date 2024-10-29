///
//  Generated code. Do not modify.
//  source: ranking_reception.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RespRankBestReceptionWeekly extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespRankBestReceptionWeekly',
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
    ..aOM<RankBestReceptionWeeklyData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RankBestReceptionWeeklyData.create)
    ..hasRequiredFields = false;

  RespRankBestReceptionWeekly._() : super();
  factory RespRankBestReceptionWeekly({
    $core.bool? success,
    $core.String? msg,
    RankBestReceptionWeeklyData? data,
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
  factory RespRankBestReceptionWeekly.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespRankBestReceptionWeekly.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespRankBestReceptionWeekly clone() =>
      RespRankBestReceptionWeekly()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespRankBestReceptionWeekly copyWith(
          void Function(RespRankBestReceptionWeekly) updates) =>
      super.copyWith(
              (message) => updates(message as RespRankBestReceptionWeekly))
          as RespRankBestReceptionWeekly; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespRankBestReceptionWeekly create() =>
      RespRankBestReceptionWeekly._();
  RespRankBestReceptionWeekly createEmptyInstance() => create();
  static $pb.PbList<RespRankBestReceptionWeekly> createRepeated() =>
      $pb.PbList<RespRankBestReceptionWeekly>();
  @$core.pragma('dart2js:noInline')
  static RespRankBestReceptionWeekly getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespRankBestReceptionWeekly>(create);
  static RespRankBestReceptionWeekly? _defaultInstance;

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
  RankBestReceptionWeeklyData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RankBestReceptionWeeklyData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RankBestReceptionWeeklyData ensureData() => $_ensure(2);
}

class RankBestReceptionWeeklyData_Reception extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RankBestReceptionWeeklyData.Reception',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sign')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..pPS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tags')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lvImg')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RankBestReceptionWeeklyData_Reception._() : super();
  factory RankBestReceptionWeeklyData_Reception({
    $core.int? rank,
    $core.String? name,
    $core.String? icon,
    $core.String? sign,
    $core.int? score,
    $core.Iterable<$core.String>? tags,
    $core.String? lvImg,
    $core.int? uid,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank = rank;
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
    if (score != null) {
      _result.score = score;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    if (lvImg != null) {
      _result.lvImg = lvImg;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory RankBestReceptionWeeklyData_Reception.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RankBestReceptionWeeklyData_Reception.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RankBestReceptionWeeklyData_Reception clone() =>
      RankBestReceptionWeeklyData_Reception()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RankBestReceptionWeeklyData_Reception copyWith(
          void Function(RankBestReceptionWeeklyData_Reception) updates) =>
      super.copyWith((message) =>
              updates(message as RankBestReceptionWeeklyData_Reception))
          as RankBestReceptionWeeklyData_Reception; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RankBestReceptionWeeklyData_Reception create() =>
      RankBestReceptionWeeklyData_Reception._();
  RankBestReceptionWeeklyData_Reception createEmptyInstance() => create();
  static $pb.PbList<RankBestReceptionWeeklyData_Reception> createRepeated() =>
      $pb.PbList<RankBestReceptionWeeklyData_Reception>();
  @$core.pragma('dart2js:noInline')
  static RankBestReceptionWeeklyData_Reception getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RankBestReceptionWeeklyData_Reception>(create);
  static RankBestReceptionWeeklyData_Reception? _defaultInstance;

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
  $core.String get sign => $_getSZ(3);
  @$pb.TagNumber(4)
  set sign($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearSign() => clearField(4);

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

  @$pb.TagNumber(6)
  $core.List<$core.String> get tags => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get lvImg => $_getSZ(6);
  @$pb.TagNumber(7)
  set lvImg($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLvImg() => $_has(6);
  @$pb.TagNumber(7)
  void clearLvImg() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get uid => $_getIZ(7);
  @$pb.TagNumber(8)
  set uid($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUid() => $_has(7);
  @$pb.TagNumber(8)
  void clearUid() => clearField(8);
}

class RankBestReceptionWeeklyData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RankBestReceptionWeeklyData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rule')
    ..pc<RankBestReceptionWeeklyData_Reception>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RankBestReceptionWeeklyData_Reception.create)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore',
        protoName: 'hasMore')
    ..hasRequiredFields = false;

  RankBestReceptionWeeklyData._() : super();
  factory RankBestReceptionWeeklyData({
    $core.String? rule,
    $core.Iterable<RankBestReceptionWeeklyData_Reception>? list,
    $core.bool? hasMore,
  }) {
    final _result = create();
    if (rule != null) {
      _result.rule = rule;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    return _result;
  }
  factory RankBestReceptionWeeklyData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RankBestReceptionWeeklyData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RankBestReceptionWeeklyData clone() =>
      RankBestReceptionWeeklyData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RankBestReceptionWeeklyData copyWith(
          void Function(RankBestReceptionWeeklyData) updates) =>
      super.copyWith(
              (message) => updates(message as RankBestReceptionWeeklyData))
          as RankBestReceptionWeeklyData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RankBestReceptionWeeklyData create() =>
      RankBestReceptionWeeklyData._();
  RankBestReceptionWeeklyData createEmptyInstance() => create();
  static $pb.PbList<RankBestReceptionWeeklyData> createRepeated() =>
      $pb.PbList<RankBestReceptionWeeklyData>();
  @$core.pragma('dart2js:noInline')
  static RankBestReceptionWeeklyData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RankBestReceptionWeeklyData>(create);
  static RankBestReceptionWeeklyData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rule => $_getSZ(0);
  @$pb.TagNumber(1)
  set rule($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRule() => $_has(0);
  @$pb.TagNumber(1)
  void clearRule() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<RankBestReceptionWeeklyData_Reception> get list => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get hasMore => $_getBF(2);
  @$pb.TagNumber(3)
  set hasMore($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHasMore() => $_has(2);
  @$pb.TagNumber(3)
  void clearHasMore() => clearField(3);
}
