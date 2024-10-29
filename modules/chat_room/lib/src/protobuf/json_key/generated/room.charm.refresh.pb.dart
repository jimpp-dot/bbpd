///
//  Generated code. Do not modify.
//  source: room.charm.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomCharmRefresh_GapList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCharmRefresh.GapList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.charm.refresh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'des')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_icon')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..hasRequiredFields = false;

  RoomCharmRefresh_GapList._() : super();
  factory RoomCharmRefresh_GapList({
    $core.String? des,
    $core.bool? showIcon,
    $core.int? time,
    $core.String? type,
  }) {
    final _result = create();
    if (des != null) {
      _result.des = des;
    }
    if (showIcon != null) {
      _result.showIcon = showIcon;
    }
    if (time != null) {
      _result.time = time;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory RoomCharmRefresh_GapList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCharmRefresh_GapList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCharmRefresh_GapList clone() =>
      RoomCharmRefresh_GapList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCharmRefresh_GapList copyWith(
          void Function(RoomCharmRefresh_GapList) updates) =>
      super.copyWith((message) => updates(message as RoomCharmRefresh_GapList))
          as RoomCharmRefresh_GapList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCharmRefresh_GapList create() => RoomCharmRefresh_GapList._();
  RoomCharmRefresh_GapList createEmptyInstance() => create();
  static $pb.PbList<RoomCharmRefresh_GapList> createRepeated() =>
      $pb.PbList<RoomCharmRefresh_GapList>();
  @$core.pragma('dart2js:noInline')
  static RoomCharmRefresh_GapList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCharmRefresh_GapList>(create);
  static RoomCharmRefresh_GapList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get des => $_getSZ(0);
  @$pb.TagNumber(1)
  set des($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDes() => $_has(0);
  @$pb.TagNumber(1)
  void clearDes() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get showIcon => $_getBF(1);
  @$pb.TagNumber(2)
  set showIcon($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShowIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get time => $_getIZ(2);
  @$pb.TagNumber(3)
  set time($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);
}

class RoomCharmRefresh_RankTypeList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCharmRefresh.RankTypeList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.charm.refresh'),
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
            : 'type')
    ..hasRequiredFields = false;

  RoomCharmRefresh_RankTypeList._() : super();
  factory RoomCharmRefresh_RankTypeList({
    $core.String? title,
    $core.String? type,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory RoomCharmRefresh_RankTypeList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCharmRefresh_RankTypeList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCharmRefresh_RankTypeList clone() =>
      RoomCharmRefresh_RankTypeList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCharmRefresh_RankTypeList copyWith(
          void Function(RoomCharmRefresh_RankTypeList) updates) =>
      super.copyWith(
              (message) => updates(message as RoomCharmRefresh_RankTypeList))
          as RoomCharmRefresh_RankTypeList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCharmRefresh_RankTypeList create() =>
      RoomCharmRefresh_RankTypeList._();
  RoomCharmRefresh_RankTypeList createEmptyInstance() => create();
  static $pb.PbList<RoomCharmRefresh_RankTypeList> createRepeated() =>
      $pb.PbList<RoomCharmRefresh_RankTypeList>();
  @$core.pragma('dart2js:noInline')
  static RoomCharmRefresh_RankTypeList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCharmRefresh_RankTypeList>(create);
  static RoomCharmRefresh_RankTypeList? _defaultInstance;

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
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);
}

class RoomCharmRefresh_TopInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCharmRefresh.TopInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.charm.refresh'),
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
            : 'room_charm',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_creator',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_name')
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
            : 'user_name')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user_icon')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank_change_type')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank_change',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current_rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'before_diff',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stay_hour',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomCharmRefresh_TopInfo._() : super();
  factory RoomCharmRefresh_TopInfo({
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
  factory RoomCharmRefresh_TopInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCharmRefresh_TopInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCharmRefresh_TopInfo clone() =>
      RoomCharmRefresh_TopInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCharmRefresh_TopInfo copyWith(
          void Function(RoomCharmRefresh_TopInfo) updates) =>
      super.copyWith((message) => updates(message as RoomCharmRefresh_TopInfo))
          as RoomCharmRefresh_TopInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCharmRefresh_TopInfo create() => RoomCharmRefresh_TopInfo._();
  RoomCharmRefresh_TopInfo createEmptyInstance() => create();
  static $pb.PbList<RoomCharmRefresh_TopInfo> createRepeated() =>
      $pb.PbList<RoomCharmRefresh_TopInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomCharmRefresh_TopInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCharmRefresh_TopInfo>(create);
  static RoomCharmRefresh_TopInfo? _defaultInstance;

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

class RoomCharmRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCharmRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.charm.refresh'),
      createEmptyInstance: create)
    ..pc<RoomCharmRefresh_GapList>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gap_list',
        $pb.PbFieldType.PM,
        subBuilder: RoomCharmRefresh_GapList.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'have_room_charm',
        $pb.PbFieldType.OU3)
    ..pc<RoomCharmRefresh_RankTypeList>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank_type_list',
        $pb.PbFieldType.PM,
        subBuilder: RoomCharmRefresh_RankTypeList.create)
    ..aOM<RoomCharmRefresh_TopInfo>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'top_list',
        subBuilder: RoomCharmRefresh_TopInfo.create)
    ..hasRequiredFields = false;

  RoomCharmRefresh._() : super();
  factory RoomCharmRefresh({
    $core.Iterable<RoomCharmRefresh_GapList>? gapList,
    $core.int? haveRoomCharm,
    $core.Iterable<RoomCharmRefresh_RankTypeList>? rankTypeList,
    RoomCharmRefresh_TopInfo? topList,
  }) {
    final _result = create();
    if (gapList != null) {
      _result.gapList.addAll(gapList);
    }
    if (haveRoomCharm != null) {
      _result.haveRoomCharm = haveRoomCharm;
    }
    if (rankTypeList != null) {
      _result.rankTypeList.addAll(rankTypeList);
    }
    if (topList != null) {
      _result.topList = topList;
    }
    return _result;
  }
  factory RoomCharmRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCharmRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCharmRefresh clone() => RoomCharmRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCharmRefresh copyWith(void Function(RoomCharmRefresh) updates) =>
      super.copyWith((message) => updates(message as RoomCharmRefresh))
          as RoomCharmRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCharmRefresh create() => RoomCharmRefresh._();
  RoomCharmRefresh createEmptyInstance() => create();
  static $pb.PbList<RoomCharmRefresh> createRepeated() =>
      $pb.PbList<RoomCharmRefresh>();
  @$core.pragma('dart2js:noInline')
  static RoomCharmRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCharmRefresh>(create);
  static RoomCharmRefresh? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<RoomCharmRefresh_GapList> get gapList => $_getList(0);

  @$pb.TagNumber(3)
  $core.int get haveRoomCharm => $_getIZ(1);
  @$pb.TagNumber(3)
  set haveRoomCharm($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHaveRoomCharm() => $_has(1);
  @$pb.TagNumber(3)
  void clearHaveRoomCharm() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<RoomCharmRefresh_RankTypeList> get rankTypeList => $_getList(2);

  @$pb.TagNumber(5)
  RoomCharmRefresh_TopInfo get topList => $_getN(3);
  @$pb.TagNumber(5)
  set topList(RoomCharmRefresh_TopInfo v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTopList() => $_has(3);
  @$pb.TagNumber(5)
  void clearTopList() => clearField(5);
  @$pb.TagNumber(5)
  RoomCharmRefresh_TopInfo ensureTopList() => $_ensure(3);
}
