///
//  Generated code. Do not modify.
//  source: room_charm.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RespRoomCharm extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespRoomCharm',
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
            : 'message')
    ..aOM<RespRoomCharmData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RespRoomCharmData.create)
    ..hasRequiredFields = false;

  RespRoomCharm._() : super();
  factory RespRoomCharm({
    $core.bool? success,
    $core.String? message,
    RespRoomCharmData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory RespRoomCharm.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespRoomCharm.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespRoomCharm clone() => RespRoomCharm()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespRoomCharm copyWith(void Function(RespRoomCharm) updates) =>
      super.copyWith((message) => updates(message as RespRoomCharm))
          as RespRoomCharm; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespRoomCharm create() => RespRoomCharm._();
  RespRoomCharm createEmptyInstance() => create();
  static $pb.PbList<RespRoomCharm> createRepeated() =>
      $pb.PbList<RespRoomCharm>();
  @$core.pragma('dart2js:noInline')
  static RespRoomCharm getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespRoomCharm>(create);
  static RespRoomCharm? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  RespRoomCharmData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RespRoomCharmData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RespRoomCharmData ensureData() => $_ensure(2);
}

class RespRoomCharmData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespRoomCharmData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'haveRoomCharm',
        $pb.PbFieldType.O3)
    ..pc<RankTypeList>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankTypeList',
        $pb.PbFieldType.PM,
        subBuilder: RankTypeList.create)
    ..pc<GapList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gapList',
        $pb.PbFieldType.PM,
        subBuilder: GapList.create)
    ..pc<TopInfo>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topList',
        $pb.PbFieldType.PM,
        subBuilder: TopInfo.create)
    ..aOM<Rule>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rule',
        subBuilder: Rule.create)
    ..hasRequiredFields = false;

  RespRoomCharmData._() : super();
  factory RespRoomCharmData({
    $core.int? haveRoomCharm,
    $core.Iterable<RankTypeList>? rankTypeList,
    $core.Iterable<GapList>? gapList,
    $core.Iterable<TopInfo>? topList,
    Rule? rule,
  }) {
    final _result = create();
    if (haveRoomCharm != null) {
      _result.haveRoomCharm = haveRoomCharm;
    }
    if (rankTypeList != null) {
      _result.rankTypeList.addAll(rankTypeList);
    }
    if (gapList != null) {
      _result.gapList.addAll(gapList);
    }
    if (topList != null) {
      _result.topList.addAll(topList);
    }
    if (rule != null) {
      _result.rule = rule;
    }
    return _result;
  }
  factory RespRoomCharmData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespRoomCharmData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespRoomCharmData clone() => RespRoomCharmData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespRoomCharmData copyWith(void Function(RespRoomCharmData) updates) =>
      super.copyWith((message) => updates(message as RespRoomCharmData))
          as RespRoomCharmData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespRoomCharmData create() => RespRoomCharmData._();
  RespRoomCharmData createEmptyInstance() => create();
  static $pb.PbList<RespRoomCharmData> createRepeated() =>
      $pb.PbList<RespRoomCharmData>();
  @$core.pragma('dart2js:noInline')
  static RespRoomCharmData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespRoomCharmData>(create);
  static RespRoomCharmData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get haveRoomCharm => $_getIZ(0);
  @$pb.TagNumber(1)
  set haveRoomCharm($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHaveRoomCharm() => $_has(0);
  @$pb.TagNumber(1)
  void clearHaveRoomCharm() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<RankTypeList> get rankTypeList => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<GapList> get gapList => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<TopInfo> get topList => $_getList(3);

  @$pb.TagNumber(5)
  Rule get rule => $_getN(4);
  @$pb.TagNumber(5)
  set rule(Rule v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRule() => $_has(4);
  @$pb.TagNumber(5)
  void clearRule() => clearField(5);
  @$pb.TagNumber(5)
  Rule ensureRule() => $_ensure(4);
}

class RankTypeList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RankTypeList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeMame',
        protoName: 'typeMame')
    ..hasRequiredFields = false;

  RankTypeList._() : super();
  factory RankTypeList({
    $core.String? title,
    $core.String? typeMame,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (typeMame != null) {
      _result.typeMame = typeMame;
    }
    return _result;
  }
  factory RankTypeList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RankTypeList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RankTypeList clone() => RankTypeList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RankTypeList copyWith(void Function(RankTypeList) updates) =>
      super.copyWith((message) => updates(message as RankTypeList))
          as RankTypeList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RankTypeList create() => RankTypeList._();
  RankTypeList createEmptyInstance() => create();
  static $pb.PbList<RankTypeList> createRepeated() =>
      $pb.PbList<RankTypeList>();
  @$core.pragma('dart2js:noInline')
  static RankTypeList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RankTypeList>(create);
  static RankTypeList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get typeMame => $_getSZ(1);
  @$pb.TagNumber(2)
  set typeMame($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTypeMame() => $_has(1);
  @$pb.TagNumber(2)
  void clearTypeMame() => clearField(2);
}

class TopInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TopInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomCharm',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomCreator',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomName')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userName')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankChangeType')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankChange',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentRid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'beforeDiff',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stayHour',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  TopInfo._() : super();
  factory TopInfo({
    $core.int? rid,
    $core.int? rank,
    $core.int? roomCharm,
    $core.int? roomCreator,
    $core.String? roomName,
    $core.int? uid,
    $core.String? userName,
    $core.String? userIcon,
    $core.String? rankChangeType,
    $core.int? rankChange,
    $core.int? currentRid,
    $core.int? beforeDiff,
    $core.int? stayHour,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (roomCharm != null) {
      _result.roomCharm = roomCharm;
    }
    if (roomCreator != null) {
      _result.roomCreator = roomCreator;
    }
    if (roomName != null) {
      _result.roomName = roomName;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    if (rankChangeType != null) {
      _result.rankChangeType = rankChangeType;
    }
    if (rankChange != null) {
      _result.rankChange = rankChange;
    }
    if (currentRid != null) {
      _result.currentRid = currentRid;
    }
    if (beforeDiff != null) {
      _result.beforeDiff = beforeDiff;
    }
    if (stayHour != null) {
      _result.stayHour = stayHour;
    }
    return _result;
  }
  factory TopInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TopInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TopInfo clone() => TopInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TopInfo copyWith(void Function(TopInfo) updates) =>
      super.copyWith((message) => updates(message as TopInfo))
          as TopInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopInfo create() => TopInfo._();
  TopInfo createEmptyInstance() => create();
  static $pb.PbList<TopInfo> createRepeated() => $pb.PbList<TopInfo>();
  @$core.pragma('dart2js:noInline')
  static TopInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopInfo>(create);
  static TopInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rank => $_getIZ(1);
  @$pb.TagNumber(2)
  set rank($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearRank() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get roomCharm => $_getIZ(2);
  @$pb.TagNumber(3)
  set roomCharm($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRoomCharm() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomCharm() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get roomCreator => $_getIZ(3);
  @$pb.TagNumber(4)
  set roomCreator($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRoomCreator() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomCreator() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get roomName => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRoomName() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomName() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get uid => $_getIZ(5);
  @$pb.TagNumber(6)
  set uid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUid() => $_has(5);
  @$pb.TagNumber(6)
  void clearUid() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get userName => $_getSZ(6);
  @$pb.TagNumber(7)
  set userName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUserName() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get userIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set userIcon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUserIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearUserIcon() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get rankChangeType => $_getSZ(8);
  @$pb.TagNumber(9)
  set rankChangeType($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRankChangeType() => $_has(8);
  @$pb.TagNumber(9)
  void clearRankChangeType() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get rankChange => $_getIZ(9);
  @$pb.TagNumber(10)
  set rankChange($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRankChange() => $_has(9);
  @$pb.TagNumber(10)
  void clearRankChange() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get currentRid => $_getIZ(10);
  @$pb.TagNumber(11)
  set currentRid($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasCurrentRid() => $_has(10);
  @$pb.TagNumber(11)
  void clearCurrentRid() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get beforeDiff => $_getIZ(11);
  @$pb.TagNumber(12)
  set beforeDiff($core.int v) {
    $_setSignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasBeforeDiff() => $_has(11);
  @$pb.TagNumber(12)
  void clearBeforeDiff() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get stayHour => $_getIZ(12);
  @$pb.TagNumber(13)
  set stayHour($core.int v) {
    $_setSignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasStayHour() => $_has(12);
  @$pb.TagNumber(13)
  void clearStayHour() => clearField(13);
}

class GapList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GapList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeMame',
        protoName: 'typeMame')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        $pb.PbFieldType.O3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'des')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showIcon')
    ..hasRequiredFields = false;

  GapList._() : super();
  factory GapList({
    $core.String? typeMame,
    $core.int? time,
    $core.String? des,
    $core.bool? showIcon,
  }) {
    final _result = create();
    if (typeMame != null) {
      _result.typeMame = typeMame;
    }
    if (time != null) {
      _result.time = time;
    }
    if (des != null) {
      _result.des = des;
    }
    if (showIcon != null) {
      _result.showIcon = showIcon;
    }
    return _result;
  }
  factory GapList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GapList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GapList clone() => GapList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GapList copyWith(void Function(GapList) updates) =>
      super.copyWith((message) => updates(message as GapList))
          as GapList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GapList create() => GapList._();
  GapList createEmptyInstance() => create();
  static $pb.PbList<GapList> createRepeated() => $pb.PbList<GapList>();
  @$core.pragma('dart2js:noInline')
  static GapList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GapList>(create);
  static GapList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get typeMame => $_getSZ(0);
  @$pb.TagNumber(1)
  set typeMame($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTypeMame() => $_has(0);
  @$pb.TagNumber(1)
  void clearTypeMame() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get time => $_getIZ(1);
  @$pb.TagNumber(2)
  set time($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get des => $_getSZ(2);
  @$pb.TagNumber(3)
  set des($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDes() => $_has(2);
  @$pb.TagNumber(3)
  void clearDes() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get showIcon => $_getBF(3);
  @$pb.TagNumber(4)
  set showIcon($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasShowIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearShowIcon() => clearField(4);
}

class Rule extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Rule',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pPS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hour')
    ..pPS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'day')
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'week')
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knight')
    ..pPS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pk')
    ..hasRequiredFields = false;

  Rule._() : super();
  factory Rule({
    $core.Iterable<$core.String>? hour,
    $core.Iterable<$core.String>? day,
    $core.Iterable<$core.String>? week,
    $core.Iterable<$core.String>? knight,
    $core.Iterable<$core.String>? pk,
  }) {
    final _result = create();
    if (hour != null) {
      _result.hour.addAll(hour);
    }
    if (day != null) {
      _result.day.addAll(day);
    }
    if (week != null) {
      _result.week.addAll(week);
    }
    if (knight != null) {
      _result.knight.addAll(knight);
    }
    if (pk != null) {
      _result.pk.addAll(pk);
    }
    return _result;
  }
  factory Rule.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Rule.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Rule clone() => Rule()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Rule copyWith(void Function(Rule) updates) =>
      super.copyWith((message) => updates(message as Rule))
          as Rule; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Rule create() => Rule._();
  Rule createEmptyInstance() => create();
  static $pb.PbList<Rule> createRepeated() => $pb.PbList<Rule>();
  @$core.pragma('dart2js:noInline')
  static Rule getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Rule>(create);
  static Rule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get hour => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get day => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.String> get week => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.String> get knight => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.String> get pk => $_getList(4);
}
