///
//  Generated code. Do not modify.
//  source: common_ktv.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ResKtvThisWeekRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResKtvThisWeekRank',
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
    ..pc<KtvThisWeekRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: KtvThisWeekRankData.create)
    ..aOM<KtvThisWeekRankData>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'my',
        subBuilder: KtvThisWeekRankData.create)
    ..hasRequiredFields = false;

  ResKtvThisWeekRank._() : super();
  factory ResKtvThisWeekRank({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<KtvThisWeekRankData>? data,
    KtvThisWeekRankData? my,
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
    if (my != null) {
      _result.my = my;
    }
    return _result;
  }
  factory ResKtvThisWeekRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResKtvThisWeekRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResKtvThisWeekRank clone() => ResKtvThisWeekRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResKtvThisWeekRank copyWith(void Function(ResKtvThisWeekRank) updates) =>
      super.copyWith((message) => updates(message as ResKtvThisWeekRank))
          as ResKtvThisWeekRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResKtvThisWeekRank create() => ResKtvThisWeekRank._();
  ResKtvThisWeekRank createEmptyInstance() => create();
  static $pb.PbList<ResKtvThisWeekRank> createRepeated() =>
      $pb.PbList<ResKtvThisWeekRank>();
  @$core.pragma('dart2js:noInline')
  static ResKtvThisWeekRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResKtvThisWeekRank>(create);
  static ResKtvThisWeekRank? _defaultInstance;

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
  $core.List<KtvThisWeekRankData> get data => $_getList(2);

  @$pb.TagNumber(4)
  KtvThisWeekRankData get my => $_getN(3);
  @$pb.TagNumber(4)
  set my(KtvThisWeekRankData v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMy() => $_has(3);
  @$pb.TagNumber(4)
  void clearMy() => clearField(4);
  @$pb.TagNumber(4)
  KtvThisWeekRankData ensureMy() => $_ensure(3);
}

class KtvThisWeekRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvThisWeekRankData',
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
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diffScore',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  KtvThisWeekRankData._() : super();
  factory KtvThisWeekRankData({
    $core.int? rank,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? score,
    $core.String? desc,
    $core.int? diffScore,
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
    if (desc != null) {
      _result.desc = desc;
    }
    if (diffScore != null) {
      _result.diffScore = diffScore;
    }
    return _result;
  }
  factory KtvThisWeekRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvThisWeekRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvThisWeekRankData clone() => KtvThisWeekRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvThisWeekRankData copyWith(void Function(KtvThisWeekRankData) updates) =>
      super.copyWith((message) => updates(message as KtvThisWeekRankData))
          as KtvThisWeekRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvThisWeekRankData create() => KtvThisWeekRankData._();
  KtvThisWeekRankData createEmptyInstance() => create();
  static $pb.PbList<KtvThisWeekRankData> createRepeated() =>
      $pb.PbList<KtvThisWeekRankData>();
  @$core.pragma('dart2js:noInline')
  static KtvThisWeekRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvThisWeekRankData>(create);
  static KtvThisWeekRankData? _defaultInstance;

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

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get diffScore => $_getIZ(6);
  @$pb.TagNumber(7)
  set diffScore($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDiffScore() => $_has(6);
  @$pb.TagNumber(7)
  void clearDiffScore() => clearField(7);
}

class ResKtvHotSongRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResKtvHotSongRank',
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
    ..pc<KtvHotSongRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: KtvHotSongRankData.create)
    ..hasRequiredFields = false;

  ResKtvHotSongRank._() : super();
  factory ResKtvHotSongRank({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<KtvHotSongRankData>? data,
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
  factory ResKtvHotSongRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResKtvHotSongRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResKtvHotSongRank clone() => ResKtvHotSongRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResKtvHotSongRank copyWith(void Function(ResKtvHotSongRank) updates) =>
      super.copyWith((message) => updates(message as ResKtvHotSongRank))
          as ResKtvHotSongRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResKtvHotSongRank create() => ResKtvHotSongRank._();
  ResKtvHotSongRank createEmptyInstance() => create();
  static $pb.PbList<ResKtvHotSongRank> createRepeated() =>
      $pb.PbList<ResKtvHotSongRank>();
  @$core.pragma('dart2js:noInline')
  static ResKtvHotSongRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResKtvHotSongRank>(create);
  static ResKtvHotSongRank? _defaultInstance;

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
  $core.List<KtvHotSongRankData> get data => $_getList(2);
}

class KtvHotSongRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvHotSongRankData',
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
            : 'songId',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..pPS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singers')
    ..hasRequiredFields = false;

  KtvHotSongRankData._() : super();
  factory KtvHotSongRankData({
    $core.int? rank,
    $core.int? songId,
    $core.String? name,
    $core.int? score,
    $core.Iterable<$core.String>? singers,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank = rank;
    }
    if (songId != null) {
      _result.songId = songId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (score != null) {
      _result.score = score;
    }
    if (singers != null) {
      _result.singers.addAll(singers);
    }
    return _result;
  }
  factory KtvHotSongRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvHotSongRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvHotSongRankData clone() => KtvHotSongRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvHotSongRankData copyWith(void Function(KtvHotSongRankData) updates) =>
      super.copyWith((message) => updates(message as KtvHotSongRankData))
          as KtvHotSongRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvHotSongRankData create() => KtvHotSongRankData._();
  KtvHotSongRankData createEmptyInstance() => create();
  static $pb.PbList<KtvHotSongRankData> createRepeated() =>
      $pb.PbList<KtvHotSongRankData>();
  @$core.pragma('dart2js:noInline')
  static KtvHotSongRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvHotSongRankData>(create);
  static KtvHotSongRankData? _defaultInstance;

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
  $core.int get songId => $_getIZ(1);
  @$pb.TagNumber(2)
  set songId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSongId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSongId() => clearField(2);

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
  $core.int get score => $_getIZ(3);
  @$pb.TagNumber(4)
  set score($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get singers => $_getList(4);
}

class ResKtvSingleSongRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResKtvSingleSongRank',
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
    ..pc<KtvSingleSongRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: KtvSingleSongRankData.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songName')
    ..hasRequiredFields = false;

  ResKtvSingleSongRank._() : super();
  factory ResKtvSingleSongRank({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<KtvSingleSongRankData>? data,
    $core.String? songName,
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
    if (songName != null) {
      _result.songName = songName;
    }
    return _result;
  }
  factory ResKtvSingleSongRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResKtvSingleSongRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResKtvSingleSongRank clone() =>
      ResKtvSingleSongRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResKtvSingleSongRank copyWith(void Function(ResKtvSingleSongRank) updates) =>
      super.copyWith((message) => updates(message as ResKtvSingleSongRank))
          as ResKtvSingleSongRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResKtvSingleSongRank create() => ResKtvSingleSongRank._();
  ResKtvSingleSongRank createEmptyInstance() => create();
  static $pb.PbList<ResKtvSingleSongRank> createRepeated() =>
      $pb.PbList<ResKtvSingleSongRank>();
  @$core.pragma('dart2js:noInline')
  static ResKtvSingleSongRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResKtvSingleSongRank>(create);
  static ResKtvSingleSongRank? _defaultInstance;

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
  $core.List<KtvSingleSongRankData> get data => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get songName => $_getSZ(3);
  @$pb.TagNumber(4)
  set songName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSongName() => $_has(3);
  @$pb.TagNumber(4)
  void clearSongName() => clearField(4);
}

class KtvSingleSongRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvSingleSongRankData',
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
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerName')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerIcon')
    ..hasRequiredFields = false;

  KtvSingleSongRankData._() : super();
  factory KtvSingleSongRankData({
    $core.int? rank,
    $core.int? score,
    $core.int? singerUid,
    $core.String? singerName,
    $core.String? singerIcon,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank = rank;
    }
    if (score != null) {
      _result.score = score;
    }
    if (singerUid != null) {
      _result.singerUid = singerUid;
    }
    if (singerName != null) {
      _result.singerName = singerName;
    }
    if (singerIcon != null) {
      _result.singerIcon = singerIcon;
    }
    return _result;
  }
  factory KtvSingleSongRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvSingleSongRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvSingleSongRankData clone() =>
      KtvSingleSongRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvSingleSongRankData copyWith(
          void Function(KtvSingleSongRankData) updates) =>
      super.copyWith((message) => updates(message as KtvSingleSongRankData))
          as KtvSingleSongRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvSingleSongRankData create() => KtvSingleSongRankData._();
  KtvSingleSongRankData createEmptyInstance() => create();
  static $pb.PbList<KtvSingleSongRankData> createRepeated() =>
      $pb.PbList<KtvSingleSongRankData>();
  @$core.pragma('dart2js:noInline')
  static KtvSingleSongRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvSingleSongRankData>(create);
  static KtvSingleSongRankData? _defaultInstance;

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
  $core.int get score => $_getIZ(1);
  @$pb.TagNumber(2)
  set score($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get singerUid => $_getIZ(2);
  @$pb.TagNumber(3)
  set singerUid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSingerUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearSingerUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get singerName => $_getSZ(3);
  @$pb.TagNumber(4)
  set singerName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSingerName() => $_has(3);
  @$pb.TagNumber(4)
  void clearSingerName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get singerIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set singerIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSingerIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearSingerIcon() => clearField(5);
}

class ResMusicTapList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMusicTapList',
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
    ..aOM<MusicTabData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: MusicTabData.create)
    ..hasRequiredFields = false;

  ResMusicTapList._() : super();
  factory ResMusicTapList({
    $core.bool? success,
    $core.String? msg,
    MusicTabData? data,
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
  factory ResMusicTapList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMusicTapList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMusicTapList clone() => ResMusicTapList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMusicTapList copyWith(void Function(ResMusicTapList) updates) =>
      super.copyWith((message) => updates(message as ResMusicTapList))
          as ResMusicTapList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMusicTapList create() => ResMusicTapList._();
  ResMusicTapList createEmptyInstance() => create();
  static $pb.PbList<ResMusicTapList> createRepeated() =>
      $pb.PbList<ResMusicTapList>();
  @$core.pragma('dart2js:noInline')
  static ResMusicTapList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMusicTapList>(create);
  static ResMusicTapList? _defaultInstance;

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
  MusicTabData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(MusicTabData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  MusicTabData ensureData() => $_ensure(2);
}

class ResMusicSearch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMusicSearch',
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
    ..aOM<SearchMusics>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SearchMusics.create)
    ..hasRequiredFields = false;

  ResMusicSearch._() : super();
  factory ResMusicSearch({
    $core.bool? success,
    $core.String? msg,
    SearchMusics? data,
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
  factory ResMusicSearch.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMusicSearch.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMusicSearch clone() => ResMusicSearch()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMusicSearch copyWith(void Function(ResMusicSearch) updates) =>
      super.copyWith((message) => updates(message as ResMusicSearch))
          as ResMusicSearch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMusicSearch create() => ResMusicSearch._();
  ResMusicSearch createEmptyInstance() => create();
  static $pb.PbList<ResMusicSearch> createRepeated() =>
      $pb.PbList<ResMusicSearch>();
  @$core.pragma('dart2js:noInline')
  static ResMusicSearch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMusicSearch>(create);
  static ResMusicSearch? _defaultInstance;

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
  SearchMusics get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SearchMusics v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SearchMusics ensureData() => $_ensure(2);
}

class MusicTabData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MusicTabData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<MusicInfoSet>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'info',
        $pb.PbFieldType.PM,
        subBuilder: MusicInfoSet.create)
    ..aOM<MusicBaseInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'base',
        subBuilder: MusicBaseInfo.create)
    ..hasRequiredFields = false;

  MusicTabData._() : super();
  factory MusicTabData({
    $core.Iterable<MusicInfoSet>? info,
    MusicBaseInfo? base,
  }) {
    final _result = create();
    if (info != null) {
      _result.info.addAll(info);
    }
    if (base != null) {
      _result.base = base;
    }
    return _result;
  }
  factory MusicTabData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MusicTabData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MusicTabData clone() => MusicTabData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MusicTabData copyWith(void Function(MusicTabData) updates) =>
      super.copyWith((message) => updates(message as MusicTabData))
          as MusicTabData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MusicTabData create() => MusicTabData._();
  MusicTabData createEmptyInstance() => create();
  static $pb.PbList<MusicTabData> createRepeated() =>
      $pb.PbList<MusicTabData>();
  @$core.pragma('dart2js:noInline')
  static MusicTabData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MusicTabData>(create);
  static MusicTabData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MusicInfoSet> get info => $_getList(0);

  @$pb.TagNumber(2)
  MusicBaseInfo get base => $_getN(1);
  @$pb.TagNumber(2)
  set base(MusicBaseInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBase() => $_has(1);
  @$pb.TagNumber(2)
  void clearBase() => clearField(2);
  @$pb.TagNumber(2)
  MusicBaseInfo ensureBase() => $_ensure(1);
}

class MusicBaseInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MusicBaseInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'musicNum')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playlistId',
        protoName: 'playlistId')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platform')
    ..hasRequiredFields = false;

  MusicBaseInfo._() : super();
  factory MusicBaseInfo({
    $core.String? description,
    $fixnum.Int64? musicNum,
    $core.String? playlistId,
    $core.String? title,
    $core.String? platform,
  }) {
    final _result = create();
    if (description != null) {
      _result.description = description;
    }
    if (musicNum != null) {
      _result.musicNum = musicNum;
    }
    if (playlistId != null) {
      _result.playlistId = playlistId;
    }
    if (title != null) {
      _result.title = title;
    }
    if (platform != null) {
      _result.platform = platform;
    }
    return _result;
  }
  factory MusicBaseInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MusicBaseInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MusicBaseInfo clone() => MusicBaseInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MusicBaseInfo copyWith(void Function(MusicBaseInfo) updates) =>
      super.copyWith((message) => updates(message as MusicBaseInfo))
          as MusicBaseInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MusicBaseInfo create() => MusicBaseInfo._();
  MusicBaseInfo createEmptyInstance() => create();
  static $pb.PbList<MusicBaseInfo> createRepeated() =>
      $pb.PbList<MusicBaseInfo>();
  @$core.pragma('dart2js:noInline')
  static MusicBaseInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MusicBaseInfo>(create);
  static MusicBaseInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get description => $_getSZ(0);
  @$pb.TagNumber(1)
  set description($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearDescription() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get musicNum => $_getI64(1);
  @$pb.TagNumber(2)
  set musicNum($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMusicNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearMusicNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get playlistId => $_getSZ(2);
  @$pb.TagNumber(3)
  set playlistId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPlaylistId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlaylistId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get platform => $_getSZ(4);
  @$pb.TagNumber(5)
  set platform($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPlatform() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlatform() => clearField(5);
}

class SearchMusics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SearchMusics',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<MusicInfoSet>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'info',
        $pb.PbFieldType.PM,
        subBuilder: MusicInfoSet.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platform')
    ..hasRequiredFields = false;

  SearchMusics._() : super();
  factory SearchMusics({
    $core.Iterable<MusicInfoSet>? info,
    $core.String? platform,
  }) {
    final _result = create();
    if (info != null) {
      _result.info.addAll(info);
    }
    if (platform != null) {
      _result.platform = platform;
    }
    return _result;
  }
  factory SearchMusics.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SearchMusics.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SearchMusics clone() => SearchMusics()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SearchMusics copyWith(void Function(SearchMusics) updates) =>
      super.copyWith((message) => updates(message as SearchMusics))
          as SearchMusics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchMusics create() => SearchMusics._();
  SearchMusics createEmptyInstance() => create();
  static $pb.PbList<SearchMusics> createRepeated() =>
      $pb.PbList<SearchMusics>();
  @$core.pragma('dart2js:noInline')
  static SearchMusics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchMusics>(create);
  static SearchMusics? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MusicInfoSet> get info => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get platform => $_getSZ(1);
  @$pb.TagNumber(2)
  set platform($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPlatform() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlatform() => clearField(2);
}

class MusicInfoSet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MusicInfoSet',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'musicId')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerSet')
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'choosed')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songCover')
    ..hasRequiredFields = false;

  MusicInfoSet._() : super();
  factory MusicInfoSet({
    $core.int? duration,
    $core.String? musicId,
    $core.String? name,
    $core.Iterable<$core.String>? singerSet,
    $core.bool? choosed,
    $core.String? songCover,
  }) {
    final _result = create();
    if (duration != null) {
      _result.duration = duration;
    }
    if (musicId != null) {
      _result.musicId = musicId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (singerSet != null) {
      _result.singerSet.addAll(singerSet);
    }
    if (choosed != null) {
      _result.choosed = choosed;
    }
    if (songCover != null) {
      _result.songCover = songCover;
    }
    return _result;
  }
  factory MusicInfoSet.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MusicInfoSet.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MusicInfoSet clone() => MusicInfoSet()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MusicInfoSet copyWith(void Function(MusicInfoSet) updates) =>
      super.copyWith((message) => updates(message as MusicInfoSet))
          as MusicInfoSet; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MusicInfoSet create() => MusicInfoSet._();
  MusicInfoSet createEmptyInstance() => create();
  static $pb.PbList<MusicInfoSet> createRepeated() =>
      $pb.PbList<MusicInfoSet>();
  @$core.pragma('dart2js:noInline')
  static MusicInfoSet getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MusicInfoSet>(create);
  static MusicInfoSet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get duration => $_getIZ(0);
  @$pb.TagNumber(1)
  set duration($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDuration() => $_has(0);
  @$pb.TagNumber(1)
  void clearDuration() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get musicId => $_getSZ(1);
  @$pb.TagNumber(2)
  set musicId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMusicId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMusicId() => clearField(2);

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
  $core.List<$core.String> get singerSet => $_getList(3);

  @$pb.TagNumber(5)
  $core.bool get choosed => $_getBF(4);
  @$pb.TagNumber(5)
  set choosed($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasChoosed() => $_has(4);
  @$pb.TagNumber(5)
  void clearChoosed() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get songCover => $_getSZ(5);
  @$pb.TagNumber(6)
  set songCover($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSongCover() => $_has(5);
  @$pb.TagNumber(6)
  void clearSongCover() => clearField(6);
}

class ResMusicToken extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMusicToken',
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
    ..aOM<MusicTokenData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: MusicTokenData.create)
    ..hasRequiredFields = false;

  ResMusicToken._() : super();
  factory ResMusicToken({
    $core.bool? success,
    $core.String? msg,
    MusicTokenData? data,
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
  factory ResMusicToken.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMusicToken.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMusicToken clone() => ResMusicToken()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMusicToken copyWith(void Function(ResMusicToken) updates) =>
      super.copyWith((message) => updates(message as ResMusicToken))
          as ResMusicToken; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMusicToken create() => ResMusicToken._();
  ResMusicToken createEmptyInstance() => create();
  static $pb.PbList<ResMusicToken> createRepeated() =>
      $pb.PbList<ResMusicToken>();
  @$core.pragma('dart2js:noInline')
  static ResMusicToken getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMusicToken>(create);
  static ResMusicToken? _defaultInstance;

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
  MusicTokenData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(MusicTokenData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  MusicTokenData ensureData() => $_ensure(2);
}

class MusicTokenData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MusicTokenData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'token')
    ..hasRequiredFields = false;

  MusicTokenData._() : super();
  factory MusicTokenData({
    $core.String? token,
  }) {
    final _result = create();
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory MusicTokenData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MusicTokenData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MusicTokenData clone() => MusicTokenData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MusicTokenData copyWith(void Function(MusicTokenData) updates) =>
      super.copyWith((message) => updates(message as MusicTokenData))
          as MusicTokenData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MusicTokenData create() => MusicTokenData._();
  MusicTokenData createEmptyInstance() => create();
  static $pb.PbList<MusicTokenData> createRepeated() =>
      $pb.PbList<MusicTokenData>();
  @$core.pragma('dart2js:noInline')
  static MusicTokenData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MusicTokenData>(create);
  static MusicTokenData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);
}

class ResBgMConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResBgMConfig',
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
    ..aOM<BgMConfig>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BgMConfig.create)
    ..hasRequiredFields = false;

  ResBgMConfig._() : super();
  factory ResBgMConfig({
    $core.bool? success,
    $core.String? msg,
    BgMConfig? data,
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
  factory ResBgMConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResBgMConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResBgMConfig clone() => ResBgMConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResBgMConfig copyWith(void Function(ResBgMConfig) updates) =>
      super.copyWith((message) => updates(message as ResBgMConfig))
          as ResBgMConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResBgMConfig create() => ResBgMConfig._();
  ResBgMConfig createEmptyInstance() => create();
  static $pb.PbList<ResBgMConfig> createRepeated() =>
      $pb.PbList<ResBgMConfig>();
  @$core.pragma('dart2js:noInline')
  static ResBgMConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResBgMConfig>(create);
  static ResBgMConfig? _defaultInstance;

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
  BgMConfig get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BgMConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BgMConfig ensureData() => $_ensure(2);
}

class BgMConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BgMConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'allowUpload')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showZegoMusic')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showKugouMusic')
    ..hasRequiredFields = false;

  BgMConfig._() : super();
  factory BgMConfig({
    $core.bool? allowUpload,
    $core.bool? showZegoMusic,
    $core.bool? showKugouMusic,
  }) {
    final _result = create();
    if (allowUpload != null) {
      _result.allowUpload = allowUpload;
    }
    if (showZegoMusic != null) {
      _result.showZegoMusic = showZegoMusic;
    }
    if (showKugouMusic != null) {
      _result.showKugouMusic = showKugouMusic;
    }
    return _result;
  }
  factory BgMConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BgMConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BgMConfig clone() => BgMConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BgMConfig copyWith(void Function(BgMConfig) updates) =>
      super.copyWith((message) => updates(message as BgMConfig))
          as BgMConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BgMConfig create() => BgMConfig._();
  BgMConfig createEmptyInstance() => create();
  static $pb.PbList<BgMConfig> createRepeated() => $pb.PbList<BgMConfig>();
  @$core.pragma('dart2js:noInline')
  static BgMConfig getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BgMConfig>(create);
  static BgMConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get allowUpload => $_getBF(0);
  @$pb.TagNumber(1)
  set allowUpload($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAllowUpload() => $_has(0);
  @$pb.TagNumber(1)
  void clearAllowUpload() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get showZegoMusic => $_getBF(1);
  @$pb.TagNumber(2)
  set showZegoMusic($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShowZegoMusic() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowZegoMusic() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get showKugouMusic => $_getBF(2);
  @$pb.TagNumber(3)
  set showKugouMusic($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShowKugouMusic() => $_has(2);
  @$pb.TagNumber(3)
  void clearShowKugouMusic() => clearField(3);
}
