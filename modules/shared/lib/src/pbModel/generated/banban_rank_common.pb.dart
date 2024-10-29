///
//  Generated code. Do not modify.
//  source: banban_rank_common.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'banban_rank_common.pbenum.dart';

export 'banban_rank_common.pbenum.dart';

class ResBroadcasterContentRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResBroadcasterContentRank',
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
    ..aOM<BroadcasterContentRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BroadcasterContentRankData.create)
    ..hasRequiredFields = false;

  ResBroadcasterContentRank._() : super();
  factory ResBroadcasterContentRank({
    $core.bool? success,
    $core.String? msg,
    BroadcasterContentRankData? data,
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
  factory ResBroadcasterContentRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResBroadcasterContentRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResBroadcasterContentRank clone() =>
      ResBroadcasterContentRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResBroadcasterContentRank copyWith(
          void Function(ResBroadcasterContentRank) updates) =>
      super.copyWith((message) => updates(message as ResBroadcasterContentRank))
          as ResBroadcasterContentRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResBroadcasterContentRank create() => ResBroadcasterContentRank._();
  ResBroadcasterContentRank createEmptyInstance() => create();
  static $pb.PbList<ResBroadcasterContentRank> createRepeated() =>
      $pb.PbList<ResBroadcasterContentRank>();
  @$core.pragma('dart2js:noInline')
  static ResBroadcasterContentRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResBroadcasterContentRank>(create);
  static ResBroadcasterContentRank? _defaultInstance;

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
  BroadcasterContentRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BroadcasterContentRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BroadcasterContentRankData ensureData() => $_ensure(2);
}

class BroadcasterContentRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcasterContentRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankShowMax',
        $pb.PbFieldType.O3)
    ..pc<CommonRankMember>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'thisWeekMembers',
        $pb.PbFieldType.PM,
        subBuilder: CommonRankMember.create)
    ..pc<CommonRankMember>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastWeekTopN',
        $pb.PbFieldType.PM,
        protoName: 'last_week_topN',
        subBuilder: CommonRankMember.create)
    ..aOM<CommonRankMember>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'me',
        subBuilder: CommonRankMember.create)
    ..hasRequiredFields = false;

  BroadcasterContentRankData._() : super();
  factory BroadcasterContentRankData({
    $core.int? rankShowMax,
    $core.Iterable<CommonRankMember>? thisWeekMembers,
    $core.Iterable<CommonRankMember>? lastWeekTopN,
    CommonRankMember? me,
  }) {
    final _result = create();
    if (rankShowMax != null) {
      _result.rankShowMax = rankShowMax;
    }
    if (thisWeekMembers != null) {
      _result.thisWeekMembers.addAll(thisWeekMembers);
    }
    if (lastWeekTopN != null) {
      _result.lastWeekTopN.addAll(lastWeekTopN);
    }
    if (me != null) {
      _result.me = me;
    }
    return _result;
  }
  factory BroadcasterContentRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcasterContentRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcasterContentRankData clone() =>
      BroadcasterContentRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcasterContentRankData copyWith(
          void Function(BroadcasterContentRankData) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcasterContentRankData))
          as BroadcasterContentRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcasterContentRankData create() => BroadcasterContentRankData._();
  BroadcasterContentRankData createEmptyInstance() => create();
  static $pb.PbList<BroadcasterContentRankData> createRepeated() =>
      $pb.PbList<BroadcasterContentRankData>();
  @$core.pragma('dart2js:noInline')
  static BroadcasterContentRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcasterContentRankData>(create);
  static BroadcasterContentRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rankShowMax => $_getIZ(0);
  @$pb.TagNumber(1)
  set rankShowMax($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRankShowMax() => $_has(0);
  @$pb.TagNumber(1)
  void clearRankShowMax() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<CommonRankMember> get thisWeekMembers => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<CommonRankMember> get lastWeekTopN => $_getList(2);

  @$pb.TagNumber(4)
  CommonRankMember get me => $_getN(3);
  @$pb.TagNumber(4)
  set me(CommonRankMember v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMe() => $_has(3);
  @$pb.TagNumber(4)
  void clearMe() => clearField(4);
  @$pb.TagNumber(4)
  CommonRankMember ensureMe() => $_ensure(3);
}

class ResSingerRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSingerRank',
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
    ..aOM<SingerRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SingerRankData.create)
    ..hasRequiredFields = false;

  ResSingerRank._() : super();
  factory ResSingerRank({
    $core.bool? success,
    $core.String? msg,
    SingerRankData? data,
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
  factory ResSingerRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSingerRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSingerRank clone() => ResSingerRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSingerRank copyWith(void Function(ResSingerRank) updates) =>
      super.copyWith((message) => updates(message as ResSingerRank))
          as ResSingerRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSingerRank create() => ResSingerRank._();
  ResSingerRank createEmptyInstance() => create();
  static $pb.PbList<ResSingerRank> createRepeated() =>
      $pb.PbList<ResSingerRank>();
  @$core.pragma('dart2js:noInline')
  static ResSingerRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSingerRank>(create);
  static ResSingerRank? _defaultInstance;

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
  SingerRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SingerRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SingerRankData ensureData() => $_ensure(2);
}

class SingerRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SingerRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankShowMax',
        $pb.PbFieldType.O3)
    ..pc<SingerRankMember>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'members',
        $pb.PbFieldType.PM,
        subBuilder: SingerRankMember.create)
    ..aOM<SingerRankMember>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'me',
        subBuilder: SingerRankMember.create)
    ..hasRequiredFields = false;

  SingerRankData._() : super();
  factory SingerRankData({
    $core.int? rankShowMax,
    $core.Iterable<SingerRankMember>? members,
    SingerRankMember? me,
  }) {
    final _result = create();
    if (rankShowMax != null) {
      _result.rankShowMax = rankShowMax;
    }
    if (members != null) {
      _result.members.addAll(members);
    }
    if (me != null) {
      _result.me = me;
    }
    return _result;
  }
  factory SingerRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SingerRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SingerRankData clone() => SingerRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SingerRankData copyWith(void Function(SingerRankData) updates) =>
      super.copyWith((message) => updates(message as SingerRankData))
          as SingerRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SingerRankData create() => SingerRankData._();
  SingerRankData createEmptyInstance() => create();
  static $pb.PbList<SingerRankData> createRepeated() =>
      $pb.PbList<SingerRankData>();
  @$core.pragma('dart2js:noInline')
  static SingerRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SingerRankData>(create);
  static SingerRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rankShowMax => $_getIZ(0);
  @$pb.TagNumber(1)
  set rankShowMax($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRankShowMax() => $_has(0);
  @$pb.TagNumber(1)
  void clearRankShowMax() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<SingerRankMember> get members => $_getList(1);

  @$pb.TagNumber(3)
  SingerRankMember get me => $_getN(2);
  @$pb.TagNumber(3)
  set me(SingerRankMember v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMe() => $_has(2);
  @$pb.TagNumber(3)
  void clearMe() => clearField(3);
  @$pb.TagNumber(3)
  SingerRankMember ensureMe() => $_ensure(2);
}

class CommonRankMember extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonRankMember',
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
            : 'rank',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
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
    ..hasRequiredFields = false;

  CommonRankMember._() : super();
  factory CommonRankMember({
    $core.int? uid,
    $core.int? rank,
    $core.int? score,
    $core.String? name,
    $core.String? icon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (score != null) {
      _result.score = score;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory CommonRankMember.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonRankMember.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonRankMember clone() => CommonRankMember()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonRankMember copyWith(void Function(CommonRankMember) updates) =>
      super.copyWith((message) => updates(message as CommonRankMember))
          as CommonRankMember; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonRankMember create() => CommonRankMember._();
  CommonRankMember createEmptyInstance() => create();
  static $pb.PbList<CommonRankMember> createRepeated() =>
      $pb.PbList<CommonRankMember>();
  @$core.pragma('dart2js:noInline')
  static CommonRankMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonRankMember>(create);
  static CommonRankMember? _defaultInstance;

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
  $core.int get rank => $_getIZ(1);
  @$pb.TagNumber(2)
  set rank($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearRank() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get score => $_getIZ(2);
  @$pb.TagNumber(3)
  set score($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => clearField(3);

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
}

class SingerRankMember extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SingerRankMember',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<CommonRankMember>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'base',
        subBuilder: CommonRankMember.create)
    ..e<SingerLevel>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OE,
        defaultOrMaker: SingerLevel.SingerLevelNone,
        valueOf: SingerLevel.valueOf,
        enumValues: SingerLevel.values)
    ..aOM<ViabilityInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'viability',
        subBuilder: ViabilityInfo.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerUrl')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inRid',
        $pb.PbFieldType.OU3,
        protoName: 'inRid')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audioUrl')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audioSeconds',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SingerRankMember._() : super();
  factory SingerRankMember({
    CommonRankMember? base,
    SingerLevel? level,
    ViabilityInfo? viability,
    $core.String? singerUrl,
    $core.int? inRid,
    $core.String? audioUrl,
    $core.int? audioSeconds,
  }) {
    final _result = create();
    if (base != null) {
      _result.base = base;
    }
    if (level != null) {
      _result.level = level;
    }
    if (viability != null) {
      _result.viability = viability;
    }
    if (singerUrl != null) {
      _result.singerUrl = singerUrl;
    }
    if (inRid != null) {
      _result.inRid = inRid;
    }
    if (audioUrl != null) {
      _result.audioUrl = audioUrl;
    }
    if (audioSeconds != null) {
      _result.audioSeconds = audioSeconds;
    }
    return _result;
  }
  factory SingerRankMember.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SingerRankMember.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SingerRankMember clone() => SingerRankMember()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SingerRankMember copyWith(void Function(SingerRankMember) updates) =>
      super.copyWith((message) => updates(message as SingerRankMember))
          as SingerRankMember; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SingerRankMember create() => SingerRankMember._();
  SingerRankMember createEmptyInstance() => create();
  static $pb.PbList<SingerRankMember> createRepeated() =>
      $pb.PbList<SingerRankMember>();
  @$core.pragma('dart2js:noInline')
  static SingerRankMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SingerRankMember>(create);
  static SingerRankMember? _defaultInstance;

  @$pb.TagNumber(1)
  CommonRankMember get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(CommonRankMember v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  CommonRankMember ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  SingerLevel get level => $_getN(1);
  @$pb.TagNumber(2)
  set level(SingerLevel v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => clearField(2);

  @$pb.TagNumber(3)
  ViabilityInfo get viability => $_getN(2);
  @$pb.TagNumber(3)
  set viability(ViabilityInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasViability() => $_has(2);
  @$pb.TagNumber(3)
  void clearViability() => clearField(3);
  @$pb.TagNumber(3)
  ViabilityInfo ensureViability() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get singerUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set singerUrl($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSingerUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearSingerUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get inRid => $_getIZ(4);
  @$pb.TagNumber(5)
  set inRid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasInRid() => $_has(4);
  @$pb.TagNumber(5)
  void clearInRid() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get audioUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set audioUrl($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAudioUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearAudioUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get audioSeconds => $_getIZ(6);
  @$pb.TagNumber(7)
  set audioSeconds($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAudioSeconds() => $_has(6);
  @$pb.TagNumber(7)
  void clearAudioSeconds() => clearField(7);
}

class ViabilityInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ViabilityInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainLevel',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainLevelTitle')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subLevel',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ViabilityInfo._() : super();
  factory ViabilityInfo({
    $core.int? mainLevel,
    $core.String? mainLevelTitle,
    $core.int? subLevel,
  }) {
    final _result = create();
    if (mainLevel != null) {
      _result.mainLevel = mainLevel;
    }
    if (mainLevelTitle != null) {
      _result.mainLevelTitle = mainLevelTitle;
    }
    if (subLevel != null) {
      _result.subLevel = subLevel;
    }
    return _result;
  }
  factory ViabilityInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ViabilityInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ViabilityInfo clone() => ViabilityInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ViabilityInfo copyWith(void Function(ViabilityInfo) updates) =>
      super.copyWith((message) => updates(message as ViabilityInfo))
          as ViabilityInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ViabilityInfo create() => ViabilityInfo._();
  ViabilityInfo createEmptyInstance() => create();
  static $pb.PbList<ViabilityInfo> createRepeated() =>
      $pb.PbList<ViabilityInfo>();
  @$core.pragma('dart2js:noInline')
  static ViabilityInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ViabilityInfo>(create);
  static ViabilityInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get mainLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set mainLevel($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMainLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearMainLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mainLevelTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set mainLevelTitle($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMainLevelTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearMainLevelTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get subLevel => $_getIZ(2);
  @$pb.TagNumber(3)
  set subLevel($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSubLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubLevel() => clearField(3);
}

class ResGloryHourRoomRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGloryHourRoomRank',
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
    ..aOM<GloryHourRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GloryHourRankData.create)
    ..hasRequiredFields = false;

  ResGloryHourRoomRank._() : super();
  factory ResGloryHourRoomRank({
    $core.bool? success,
    $core.String? msg,
    GloryHourRankData? data,
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
  factory ResGloryHourRoomRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGloryHourRoomRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGloryHourRoomRank clone() =>
      ResGloryHourRoomRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGloryHourRoomRank copyWith(void Function(ResGloryHourRoomRank) updates) =>
      super.copyWith((message) => updates(message as ResGloryHourRoomRank))
          as ResGloryHourRoomRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGloryHourRoomRank create() => ResGloryHourRoomRank._();
  ResGloryHourRoomRank createEmptyInstance() => create();
  static $pb.PbList<ResGloryHourRoomRank> createRepeated() =>
      $pb.PbList<ResGloryHourRoomRank>();
  @$core.pragma('dart2js:noInline')
  static ResGloryHourRoomRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGloryHourRoomRank>(create);
  static ResGloryHourRoomRank? _defaultInstance;

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
  GloryHourRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GloryHourRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GloryHourRankData ensureData() => $_ensure(2);
}

enum GloryHourRankData_Data { gloryRoom, gloryStar, notSet }

class GloryHourRankData extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GloryHourRankData_Data>
      _GloryHourRankData_DataByTag = {
    3: GloryHourRankData_Data.gloryRoom,
    4: GloryHourRankData_Data.gloryStar,
    0: GloryHourRankData_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GloryHourRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadline')
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftSeconds')
    ..aOM<GloryHourRoomRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gloryRoom',
        subBuilder: GloryHourRoomRankData.create)
    ..aOM<GloryHourStarRankData>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gloryStar',
        subBuilder: GloryHourStarRankData.create)
    ..hasRequiredFields = false;

  GloryHourRankData._() : super();
  factory GloryHourRankData({
    $fixnum.Int64? deadline,
    $fixnum.Int64? leftSeconds,
    GloryHourRoomRankData? gloryRoom,
    GloryHourStarRankData? gloryStar,
  }) {
    final _result = create();
    if (deadline != null) {
      _result.deadline = deadline;
    }
    if (leftSeconds != null) {
      _result.leftSeconds = leftSeconds;
    }
    if (gloryRoom != null) {
      _result.gloryRoom = gloryRoom;
    }
    if (gloryStar != null) {
      _result.gloryStar = gloryStar;
    }
    return _result;
  }
  factory GloryHourRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GloryHourRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GloryHourRankData clone() => GloryHourRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GloryHourRankData copyWith(void Function(GloryHourRankData) updates) =>
      super.copyWith((message) => updates(message as GloryHourRankData))
          as GloryHourRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GloryHourRankData create() => GloryHourRankData._();
  GloryHourRankData createEmptyInstance() => create();
  static $pb.PbList<GloryHourRankData> createRepeated() =>
      $pb.PbList<GloryHourRankData>();
  @$core.pragma('dart2js:noInline')
  static GloryHourRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GloryHourRankData>(create);
  static GloryHourRankData? _defaultInstance;

  GloryHourRankData_Data whichData() =>
      _GloryHourRankData_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $fixnum.Int64 get deadline => $_getI64(0);
  @$pb.TagNumber(1)
  set deadline($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDeadline() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeadline() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get leftSeconds => $_getI64(1);
  @$pb.TagNumber(2)
  set leftSeconds($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLeftSeconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeftSeconds() => clearField(2);

  @$pb.TagNumber(3)
  GloryHourRoomRankData get gloryRoom => $_getN(2);
  @$pb.TagNumber(3)
  set gloryRoom(GloryHourRoomRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGloryRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearGloryRoom() => clearField(3);
  @$pb.TagNumber(3)
  GloryHourRoomRankData ensureGloryRoom() => $_ensure(2);

  @$pb.TagNumber(4)
  GloryHourStarRankData get gloryStar => $_getN(3);
  @$pb.TagNumber(4)
  set gloryStar(GloryHourStarRankData v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGloryStar() => $_has(3);
  @$pb.TagNumber(4)
  void clearGloryStar() => clearField(4);
  @$pb.TagNumber(4)
  GloryHourStarRankData ensureGloryStar() => $_ensure(3);
}

class GloryHourRoomRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GloryHourRoomRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GloryHourRoomRankGiftTop>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'top1',
        $pb.PbFieldType.PM,
        subBuilder: GloryHourRoomRankGiftTop.create)
    ..pc<GloryHourRoomRankMember>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'members',
        $pb.PbFieldType.PM,
        subBuilder: GloryHourRoomRankMember.create)
    ..hasRequiredFields = false;

  GloryHourRoomRankData._() : super();
  factory GloryHourRoomRankData({
    $core.Iterable<GloryHourRoomRankGiftTop>? top1,
    $core.Iterable<GloryHourRoomRankMember>? members,
  }) {
    final _result = create();
    if (top1 != null) {
      _result.top1.addAll(top1);
    }
    if (members != null) {
      _result.members.addAll(members);
    }
    return _result;
  }
  factory GloryHourRoomRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GloryHourRoomRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GloryHourRoomRankData clone() =>
      GloryHourRoomRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GloryHourRoomRankData copyWith(
          void Function(GloryHourRoomRankData) updates) =>
      super.copyWith((message) => updates(message as GloryHourRoomRankData))
          as GloryHourRoomRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GloryHourRoomRankData create() => GloryHourRoomRankData._();
  GloryHourRoomRankData createEmptyInstance() => create();
  static $pb.PbList<GloryHourRoomRankData> createRepeated() =>
      $pb.PbList<GloryHourRoomRankData>();
  @$core.pragma('dart2js:noInline')
  static GloryHourRoomRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GloryHourRoomRankData>(create);
  static GloryHourRoomRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GloryHourRoomRankGiftTop> get top1 => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<GloryHourRoomRankMember> get members => $_getList(1);
}

class GloryHourRoomRankGiftTop extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GloryHourRoomRankGiftTop',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName')
    ..aOM<GloryHourRankMember>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topRoom',
        subBuilder: GloryHourRankMember.create)
    ..hasRequiredFields = false;

  GloryHourRoomRankGiftTop._() : super();
  factory GloryHourRoomRankGiftTop({
    $core.int? giftId,
    $core.String? giftName,
    GloryHourRankMember? topRoom,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (topRoom != null) {
      _result.topRoom = topRoom;
    }
    return _result;
  }
  factory GloryHourRoomRankGiftTop.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GloryHourRoomRankGiftTop.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GloryHourRoomRankGiftTop clone() =>
      GloryHourRoomRankGiftTop()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GloryHourRoomRankGiftTop copyWith(
          void Function(GloryHourRoomRankGiftTop) updates) =>
      super.copyWith((message) => updates(message as GloryHourRoomRankGiftTop))
          as GloryHourRoomRankGiftTop; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GloryHourRoomRankGiftTop create() => GloryHourRoomRankGiftTop._();
  GloryHourRoomRankGiftTop createEmptyInstance() => create();
  static $pb.PbList<GloryHourRoomRankGiftTop> createRepeated() =>
      $pb.PbList<GloryHourRoomRankGiftTop>();
  @$core.pragma('dart2js:noInline')
  static GloryHourRoomRankGiftTop getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GloryHourRoomRankGiftTop>(create);
  static GloryHourRoomRankGiftTop? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get giftName => $_getSZ(1);
  @$pb.TagNumber(2)
  set giftName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftName() => clearField(2);

  @$pb.TagNumber(3)
  GloryHourRankMember get topRoom => $_getN(2);
  @$pb.TagNumber(3)
  set topRoom(GloryHourRankMember v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTopRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearTopRoom() => clearField(3);
  @$pb.TagNumber(3)
  GloryHourRankMember ensureTopRoom() => $_ensure(2);
}

class GloryHourRoomRankMember extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GloryHourRoomRankMember',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<GloryHourRankMember>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room',
        subBuilder: GloryHourRankMember.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GloryHourRoomRankMember._() : super();
  factory GloryHourRoomRankMember({
    GloryHourRankMember? room,
    $core.int? rank,
    $core.int? score,
  }) {
    final _result = create();
    if (room != null) {
      _result.room = room;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory GloryHourRoomRankMember.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GloryHourRoomRankMember.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GloryHourRoomRankMember clone() =>
      GloryHourRoomRankMember()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GloryHourRoomRankMember copyWith(
          void Function(GloryHourRoomRankMember) updates) =>
      super.copyWith((message) => updates(message as GloryHourRoomRankMember))
          as GloryHourRoomRankMember; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GloryHourRoomRankMember create() => GloryHourRoomRankMember._();
  GloryHourRoomRankMember createEmptyInstance() => create();
  static $pb.PbList<GloryHourRoomRankMember> createRepeated() =>
      $pb.PbList<GloryHourRoomRankMember>();
  @$core.pragma('dart2js:noInline')
  static GloryHourRoomRankMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GloryHourRoomRankMember>(create);
  static GloryHourRoomRankMember? _defaultInstance;

  @$pb.TagNumber(1)
  GloryHourRankMember get room => $_getN(0);
  @$pb.TagNumber(1)
  set room(GloryHourRankMember v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);
  @$pb.TagNumber(1)
  GloryHourRankMember ensureRoom() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get rank => $_getIZ(1);
  @$pb.TagNumber(2)
  set rank($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearRank() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get score => $_getIZ(2);
  @$pb.TagNumber(3)
  set score($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => clearField(3);
}

class GloryHourStarRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GloryHourStarRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GloryHourStarRankMember>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'members',
        $pb.PbFieldType.PM,
        subBuilder: GloryHourStarRankMember.create)
    ..hasRequiredFields = false;

  GloryHourStarRankData._() : super();
  factory GloryHourStarRankData({
    $core.Iterable<GloryHourStarRankMember>? members,
  }) {
    final _result = create();
    if (members != null) {
      _result.members.addAll(members);
    }
    return _result;
  }
  factory GloryHourStarRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GloryHourStarRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GloryHourStarRankData clone() =>
      GloryHourStarRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GloryHourStarRankData copyWith(
          void Function(GloryHourStarRankData) updates) =>
      super.copyWith((message) => updates(message as GloryHourStarRankData))
          as GloryHourStarRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GloryHourStarRankData create() => GloryHourStarRankData._();
  GloryHourStarRankData createEmptyInstance() => create();
  static $pb.PbList<GloryHourStarRankData> createRepeated() =>
      $pb.PbList<GloryHourStarRankData>();
  @$core.pragma('dart2js:noInline')
  static GloryHourStarRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GloryHourStarRankData>(create);
  static GloryHourStarRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GloryHourStarRankMember> get members => $_getList(0);
}

class GloryHourStarRankMember extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GloryHourStarRankMember',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<GloryHourRankMember>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'left',
        subBuilder: GloryHourRankMember.create)
    ..aOM<GloryHourRankMember>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'right',
        subBuilder: GloryHourRankMember.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GloryHourStarRankMember._() : super();
  factory GloryHourStarRankMember({
    GloryHourRankMember? left,
    GloryHourRankMember? right,
    $core.int? rank,
    $core.int? score,
  }) {
    final _result = create();
    if (left != null) {
      _result.left = left;
    }
    if (right != null) {
      _result.right = right;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory GloryHourStarRankMember.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GloryHourStarRankMember.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GloryHourStarRankMember clone() =>
      GloryHourStarRankMember()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GloryHourStarRankMember copyWith(
          void Function(GloryHourStarRankMember) updates) =>
      super.copyWith((message) => updates(message as GloryHourStarRankMember))
          as GloryHourStarRankMember; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GloryHourStarRankMember create() => GloryHourStarRankMember._();
  GloryHourStarRankMember createEmptyInstance() => create();
  static $pb.PbList<GloryHourStarRankMember> createRepeated() =>
      $pb.PbList<GloryHourStarRankMember>();
  @$core.pragma('dart2js:noInline')
  static GloryHourStarRankMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GloryHourStarRankMember>(create);
  static GloryHourStarRankMember? _defaultInstance;

  @$pb.TagNumber(1)
  GloryHourRankMember get left => $_getN(0);
  @$pb.TagNumber(1)
  set left(GloryHourRankMember v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeft() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeft() => clearField(1);
  @$pb.TagNumber(1)
  GloryHourRankMember ensureLeft() => $_ensure(0);

  @$pb.TagNumber(2)
  GloryHourRankMember get right => $_getN(1);
  @$pb.TagNumber(2)
  set right(GloryHourRankMember v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRight() => $_has(1);
  @$pb.TagNumber(2)
  void clearRight() => clearField(2);
  @$pb.TagNumber(2)
  GloryHourRankMember ensureRight() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get rank => $_getIZ(2);
  @$pb.TagNumber(3)
  set rank($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRank() => $_has(2);
  @$pb.TagNumber(3)
  void clearRank() => clearField(3);

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
}

class GloryHourRankMember extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GloryHourRankMember',
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
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online')
    ..hasRequiredFields = false;

  GloryHourRankMember._() : super();
  factory GloryHourRankMember({
    $core.int? id,
    $core.String? name,
    $core.String? icon,
    $core.bool? online,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (online != null) {
      _result.online = online;
    }
    return _result;
  }
  factory GloryHourRankMember.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GloryHourRankMember.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GloryHourRankMember clone() => GloryHourRankMember()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GloryHourRankMember copyWith(void Function(GloryHourRankMember) updates) =>
      super.copyWith((message) => updates(message as GloryHourRankMember))
          as GloryHourRankMember; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GloryHourRankMember create() => GloryHourRankMember._();
  GloryHourRankMember createEmptyInstance() => create();
  static $pb.PbList<GloryHourRankMember> createRepeated() =>
      $pb.PbList<GloryHourRankMember>();
  @$core.pragma('dart2js:noInline')
  static GloryHourRankMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GloryHourRankMember>(create);
  static GloryHourRankMember? _defaultInstance;

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
  $core.bool get online => $_getBF(3);
  @$pb.TagNumber(4)
  set online($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOnline() => $_has(3);
  @$pb.TagNumber(4)
  void clearOnline() => clearField(4);
}

class RoomGloryHourRankEntrance extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomGloryHourRankEntrance',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stage',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countStart',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countEnd',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showAt',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hideAt',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomGloryHourRankEntrance._() : super();
  factory RoomGloryHourRankEntrance({
    $core.bool? show,
    $core.int? stage,
    $core.int? countStart,
    $core.int? countEnd,
    $core.int? showAt,
    $core.int? hideAt,
  }) {
    final _result = create();
    if (show != null) {
      _result.show = show;
    }
    if (stage != null) {
      _result.stage = stage;
    }
    if (countStart != null) {
      _result.countStart = countStart;
    }
    if (countEnd != null) {
      _result.countEnd = countEnd;
    }
    if (showAt != null) {
      _result.showAt = showAt;
    }
    if (hideAt != null) {
      _result.hideAt = hideAt;
    }
    return _result;
  }
  factory RoomGloryHourRankEntrance.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomGloryHourRankEntrance.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomGloryHourRankEntrance clone() =>
      RoomGloryHourRankEntrance()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomGloryHourRankEntrance copyWith(
          void Function(RoomGloryHourRankEntrance) updates) =>
      super.copyWith((message) => updates(message as RoomGloryHourRankEntrance))
          as RoomGloryHourRankEntrance; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomGloryHourRankEntrance create() => RoomGloryHourRankEntrance._();
  RoomGloryHourRankEntrance createEmptyInstance() => create();
  static $pb.PbList<RoomGloryHourRankEntrance> createRepeated() =>
      $pb.PbList<RoomGloryHourRankEntrance>();
  @$core.pragma('dart2js:noInline')
  static RoomGloryHourRankEntrance getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomGloryHourRankEntrance>(create);
  static RoomGloryHourRankEntrance? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get show => $_getBF(0);
  @$pb.TagNumber(1)
  set show($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShow() => $_has(0);
  @$pb.TagNumber(1)
  void clearShow() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get stage => $_getIZ(1);
  @$pb.TagNumber(2)
  set stage($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStage() => $_has(1);
  @$pb.TagNumber(2)
  void clearStage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get countStart => $_getIZ(2);
  @$pb.TagNumber(3)
  set countStart($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCountStart() => $_has(2);
  @$pb.TagNumber(3)
  void clearCountStart() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get countEnd => $_getIZ(3);
  @$pb.TagNumber(4)
  set countEnd($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCountEnd() => $_has(3);
  @$pb.TagNumber(4)
  void clearCountEnd() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get showAt => $_getIZ(4);
  @$pb.TagNumber(5)
  set showAt($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasShowAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearShowAt() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get hideAt => $_getIZ(5);
  @$pb.TagNumber(6)
  set hideAt($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHideAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearHideAt() => clearField(6);
}

class ResGloryHourEntranceRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGloryHourEntranceRefresh',
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
    ..aOM<GloryHourEntranceRefresh>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GloryHourEntranceRefresh.create)
    ..hasRequiredFields = false;

  ResGloryHourEntranceRefresh._() : super();
  factory ResGloryHourEntranceRefresh({
    $core.bool? success,
    $core.String? msg,
    GloryHourEntranceRefresh? data,
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
  factory ResGloryHourEntranceRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGloryHourEntranceRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGloryHourEntranceRefresh clone() =>
      ResGloryHourEntranceRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGloryHourEntranceRefresh copyWith(
          void Function(ResGloryHourEntranceRefresh) updates) =>
      super.copyWith(
              (message) => updates(message as ResGloryHourEntranceRefresh))
          as ResGloryHourEntranceRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGloryHourEntranceRefresh create() =>
      ResGloryHourEntranceRefresh._();
  ResGloryHourEntranceRefresh createEmptyInstance() => create();
  static $pb.PbList<ResGloryHourEntranceRefresh> createRepeated() =>
      $pb.PbList<ResGloryHourEntranceRefresh>();
  @$core.pragma('dart2js:noInline')
  static ResGloryHourEntranceRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGloryHourEntranceRefresh>(create);
  static ResGloryHourEntranceRefresh? _defaultInstance;

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
  GloryHourEntranceRefresh get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GloryHourEntranceRefresh v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GloryHourEntranceRefresh ensureData() => $_ensure(2);
}

class GloryHourEntranceRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GloryHourEntranceRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<RoomHourStarRankTop>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'top',
        subBuilder: RoomHourStarRankTop.create)
    ..hasRequiredFields = false;

  GloryHourEntranceRefresh._() : super();
  factory GloryHourEntranceRefresh({
    RoomHourStarRankTop? top,
  }) {
    final _result = create();
    if (top != null) {
      _result.top = top;
    }
    return _result;
  }
  factory GloryHourEntranceRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GloryHourEntranceRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GloryHourEntranceRefresh clone() =>
      GloryHourEntranceRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GloryHourEntranceRefresh copyWith(
          void Function(GloryHourEntranceRefresh) updates) =>
      super.copyWith((message) => updates(message as GloryHourEntranceRefresh))
          as GloryHourEntranceRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GloryHourEntranceRefresh create() => GloryHourEntranceRefresh._();
  GloryHourEntranceRefresh createEmptyInstance() => create();
  static $pb.PbList<GloryHourEntranceRefresh> createRepeated() =>
      $pb.PbList<GloryHourEntranceRefresh>();
  @$core.pragma('dart2js:noInline')
  static GloryHourEntranceRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GloryHourEntranceRefresh>(create);
  static GloryHourEntranceRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  RoomHourStarRankTop get top => $_getN(0);
  @$pb.TagNumber(1)
  set top(RoomHourStarRankTop v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTop() => $_has(0);
  @$pb.TagNumber(1)
  void clearTop() => clearField(1);
  @$pb.TagNumber(1)
  RoomHourStarRankTop ensureTop() => $_ensure(0);
}

class RoomHourStarRankTop extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomHourStarRankTop',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftIcon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightIcon')
    ..hasRequiredFields = false;

  RoomHourStarRankTop._() : super();
  factory RoomHourStarRankTop({
    $core.int? leftUid,
    $core.int? rightUid,
    $core.String? leftIcon,
    $core.String? rightIcon,
  }) {
    final _result = create();
    if (leftUid != null) {
      _result.leftUid = leftUid;
    }
    if (rightUid != null) {
      _result.rightUid = rightUid;
    }
    if (leftIcon != null) {
      _result.leftIcon = leftIcon;
    }
    if (rightIcon != null) {
      _result.rightIcon = rightIcon;
    }
    return _result;
  }
  factory RoomHourStarRankTop.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomHourStarRankTop.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomHourStarRankTop clone() => RoomHourStarRankTop()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomHourStarRankTop copyWith(void Function(RoomHourStarRankTop) updates) =>
      super.copyWith((message) => updates(message as RoomHourStarRankTop))
          as RoomHourStarRankTop; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomHourStarRankTop create() => RoomHourStarRankTop._();
  RoomHourStarRankTop createEmptyInstance() => create();
  static $pb.PbList<RoomHourStarRankTop> createRepeated() =>
      $pb.PbList<RoomHourStarRankTop>();
  @$core.pragma('dart2js:noInline')
  static RoomHourStarRankTop getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomHourStarRankTop>(create);
  static RoomHourStarRankTop? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get leftUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set leftUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeftUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rightUid => $_getIZ(1);
  @$pb.TagNumber(2)
  set rightUid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRightUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get leftIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set leftIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLeftIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeftIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rightIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set rightIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRightIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearRightIcon() => clearField(4);
}

class RecoverListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RecoverListItem',
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
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'intimacy',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accompanyTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recoverTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RecoverListItem._() : super();
  factory RecoverListItem({
    $core.int? id,
    $core.String? icon,
    $core.String? name,
    $core.int? sex,
    $core.int? uid,
    $core.int? age,
    $core.int? intimacy,
    $core.int? accompanyTime,
    $core.int? recoverTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (age != null) {
      _result.age = age;
    }
    if (intimacy != null) {
      _result.intimacy = intimacy;
    }
    if (accompanyTime != null) {
      _result.accompanyTime = accompanyTime;
    }
    if (recoverTime != null) {
      _result.recoverTime = recoverTime;
    }
    return _result;
  }
  factory RecoverListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RecoverListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RecoverListItem clone() => RecoverListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RecoverListItem copyWith(void Function(RecoverListItem) updates) =>
      super.copyWith((message) => updates(message as RecoverListItem))
          as RecoverListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RecoverListItem create() => RecoverListItem._();
  RecoverListItem createEmptyInstance() => create();
  static $pb.PbList<RecoverListItem> createRepeated() =>
      $pb.PbList<RecoverListItem>();
  @$core.pragma('dart2js:noInline')
  static RecoverListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecoverListItem>(create);
  static RecoverListItem? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.int get sex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get uid => $_getIZ(4);
  @$pb.TagNumber(5)
  set uid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearUid() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get age => $_getIZ(5);
  @$pb.TagNumber(6)
  set age($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAge() => $_has(5);
  @$pb.TagNumber(6)
  void clearAge() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get intimacy => $_getIZ(6);
  @$pb.TagNumber(7)
  set intimacy($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIntimacy() => $_has(6);
  @$pb.TagNumber(7)
  void clearIntimacy() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get accompanyTime => $_getIZ(7);
  @$pb.TagNumber(8)
  set accompanyTime($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAccompanyTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearAccompanyTime() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get recoverTime => $_getIZ(8);
  @$pb.TagNumber(9)
  set recoverTime($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRecoverTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearRecoverTime() => clearField(9);
}

class RecoverListRsp_dataItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RecoverListRsp.dataItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more')
    ..pc<RecoverListItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankList',
        $pb.PbFieldType.PM,
        subBuilder: RecoverListItem.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recoverMoney',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RecoverListRsp_dataItem._() : super();
  factory RecoverListRsp_dataItem({
    $core.bool? more,
    $core.Iterable<RecoverListItem>? rankList,
    $core.int? recoverMoney,
  }) {
    final _result = create();
    if (more != null) {
      _result.more = more;
    }
    if (rankList != null) {
      _result.rankList.addAll(rankList);
    }
    if (recoverMoney != null) {
      _result.recoverMoney = recoverMoney;
    }
    return _result;
  }
  factory RecoverListRsp_dataItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RecoverListRsp_dataItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RecoverListRsp_dataItem clone() =>
      RecoverListRsp_dataItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RecoverListRsp_dataItem copyWith(
          void Function(RecoverListRsp_dataItem) updates) =>
      super.copyWith((message) => updates(message as RecoverListRsp_dataItem))
          as RecoverListRsp_dataItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RecoverListRsp_dataItem create() => RecoverListRsp_dataItem._();
  RecoverListRsp_dataItem createEmptyInstance() => create();
  static $pb.PbList<RecoverListRsp_dataItem> createRepeated() =>
      $pb.PbList<RecoverListRsp_dataItem>();
  @$core.pragma('dart2js:noInline')
  static RecoverListRsp_dataItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecoverListRsp_dataItem>(create);
  static RecoverListRsp_dataItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get more => $_getBF(0);
  @$pb.TagNumber(1)
  set more($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMore() => $_has(0);
  @$pb.TagNumber(1)
  void clearMore() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<RecoverListItem> get rankList => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get recoverMoney => $_getIZ(2);
  @$pb.TagNumber(3)
  set recoverMoney($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRecoverMoney() => $_has(2);
  @$pb.TagNumber(3)
  void clearRecoverMoney() => clearField(3);
}

class RecoverListRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RecoverListRsp',
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
    ..aOM<RecoverListRsp_dataItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RecoverListRsp_dataItem.create)
    ..hasRequiredFields = false;

  RecoverListRsp._() : super();
  factory RecoverListRsp({
    $core.bool? success,
    $core.String? msg,
    RecoverListRsp_dataItem? data,
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
  factory RecoverListRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RecoverListRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RecoverListRsp clone() => RecoverListRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RecoverListRsp copyWith(void Function(RecoverListRsp) updates) =>
      super.copyWith((message) => updates(message as RecoverListRsp))
          as RecoverListRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RecoverListRsp create() => RecoverListRsp._();
  RecoverListRsp createEmptyInstance() => create();
  static $pb.PbList<RecoverListRsp> createRepeated() =>
      $pb.PbList<RecoverListRsp>();
  @$core.pragma('dart2js:noInline')
  static RecoverListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecoverListRsp>(create);
  static RecoverListRsp? _defaultInstance;

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
  RecoverListRsp_dataItem get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RecoverListRsp_dataItem v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RecoverListRsp_dataItem ensureData() => $_ensure(2);
}
