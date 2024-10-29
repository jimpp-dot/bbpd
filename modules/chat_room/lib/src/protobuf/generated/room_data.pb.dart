///
//  Generated code. Do not modify.
//  source: room_data.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class RoomData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomData',
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
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..pc<TabInfo>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentStatistics',
        $pb.PbFieldType.PM,
        protoName: 'currentStatistics',
        subBuilder: TabInfo.create)
    ..pc<TabInfo>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'todayStatistics',
        $pb.PbFieldType.PM,
        protoName: 'todayStatistics',
        subBuilder: TabInfo.create)
    ..pc<TabInfo>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastSevenDaysStatistics',
        $pb.PbFieldType.PM,
        protoName: 'lastSevenDaysStatistics',
        subBuilder: TabInfo.create)
    ..a<$fixnum.Int64>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'phaseStart',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'phaseEnd',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stateDesc',
        protoName: 'stateDesc')
    ..pc<RankTab>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankTab',
        $pb.PbFieldType.PM,
        protoName: 'rankTab',
        subBuilder: RankTab.create)
    ..hasRequiredFields = false;

  RoomData._() : super();
  factory RoomData({
    $core.int? rid,
    $core.int? uid,
    $core.int? state,
    $core.Iterable<TabInfo>? currentStatistics,
    $core.Iterable<TabInfo>? todayStatistics,
    $core.Iterable<TabInfo>? lastSevenDaysStatistics,
    $fixnum.Int64? phaseStart,
    $fixnum.Int64? phaseEnd,
    $core.String? stateDesc,
    $core.Iterable<RankTab>? rankTab,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (state != null) {
      _result.state = state;
    }
    if (currentStatistics != null) {
      _result.currentStatistics.addAll(currentStatistics);
    }
    if (todayStatistics != null) {
      _result.todayStatistics.addAll(todayStatistics);
    }
    if (lastSevenDaysStatistics != null) {
      _result.lastSevenDaysStatistics.addAll(lastSevenDaysStatistics);
    }
    if (phaseStart != null) {
      _result.phaseStart = phaseStart;
    }
    if (phaseEnd != null) {
      _result.phaseEnd = phaseEnd;
    }
    if (stateDesc != null) {
      _result.stateDesc = stateDesc;
    }
    if (rankTab != null) {
      _result.rankTab.addAll(rankTab);
    }
    return _result;
  }
  factory RoomData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomData clone() => RoomData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomData copyWith(void Function(RoomData) updates) =>
      super.copyWith((message) => updates(message as RoomData))
          as RoomData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomData create() => RoomData._();
  RoomData createEmptyInstance() => create();
  static $pb.PbList<RoomData> createRepeated() => $pb.PbList<RoomData>();
  @$core.pragma('dart2js:noInline')
  static RoomData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomData>(create);
  static RoomData? _defaultInstance;

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
  $core.int get state => $_getIZ(2);
  @$pb.TagNumber(3)
  set state($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<TabInfo> get currentStatistics => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<TabInfo> get todayStatistics => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<TabInfo> get lastSevenDaysStatistics => $_getList(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get phaseStart => $_getI64(6);
  @$pb.TagNumber(7)
  set phaseStart($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPhaseStart() => $_has(6);
  @$pb.TagNumber(7)
  void clearPhaseStart() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get phaseEnd => $_getI64(7);
  @$pb.TagNumber(8)
  set phaseEnd($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPhaseEnd() => $_has(7);
  @$pb.TagNumber(8)
  void clearPhaseEnd() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get stateDesc => $_getSZ(8);
  @$pb.TagNumber(9)
  set stateDesc($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasStateDesc() => $_has(8);
  @$pb.TagNumber(9)
  void clearStateDesc() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<RankTab> get rankTab => $_getList(9);
}

class RankTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RankTab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<RankItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RankItem.create)
    ..aOM<RankItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'myInfo',
        protoName: 'myInfo',
        subBuilder: RankItem.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Title',
        protoName: 'Title')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isRoom',
        protoName: 'isRoom')
    ..hasRequiredFields = false;

  RankTab._() : super();
  factory RankTab({
    $core.Iterable<RankItem>? list,
    RankItem? myInfo,
    $core.String? title,
    $core.bool? isRoom,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (myInfo != null) {
      _result.myInfo = myInfo;
    }
    if (title != null) {
      _result.title = title;
    }
    if (isRoom != null) {
      _result.isRoom = isRoom;
    }
    return _result;
  }
  factory RankTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RankTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RankTab clone() => RankTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RankTab copyWith(void Function(RankTab) updates) =>
      super.copyWith((message) => updates(message as RankTab))
          as RankTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RankTab create() => RankTab._();
  RankTab createEmptyInstance() => create();
  static $pb.PbList<RankTab> createRepeated() => $pb.PbList<RankTab>();
  @$core.pragma('dart2js:noInline')
  static RankTab getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RankTab>(create);
  static RankTab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RankItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  RankItem get myInfo => $_getN(1);
  @$pb.TagNumber(2)
  set myInfo(RankItem v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMyInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearMyInfo() => clearField(2);
  @$pb.TagNumber(2)
  RankItem ensureMyInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isRoom => $_getBF(3);
  @$pb.TagNumber(4)
  set isRoom($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsRoom() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsRoom() => clearField(4);
}

class RoomDataList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomDataList',
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
    ..pc<PackageItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'packageList',
        $pb.PbFieldType.PM,
        protoName: 'packageList',
        subBuilder: PackageItem.create)
    ..pc<PackageItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receiveList',
        $pb.PbFieldType.PM,
        protoName: 'receiveList',
        subBuilder: PackageItem.create)
    ..pc<PackageItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newPayList',
        $pb.PbFieldType.PM,
        protoName: 'newPayList',
        subBuilder: PackageItem.create)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more')
    ..hasRequiredFields = false;

  RoomDataList._() : super();
  factory RoomDataList({
    $core.int? rid,
    $core.Iterable<PackageItem>? packageList,
    $core.Iterable<PackageItem>? receiveList,
    $core.Iterable<PackageItem>? newPayList,
    $core.bool? more,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (packageList != null) {
      _result.packageList.addAll(packageList);
    }
    if (receiveList != null) {
      _result.receiveList.addAll(receiveList);
    }
    if (newPayList != null) {
      _result.newPayList.addAll(newPayList);
    }
    if (more != null) {
      _result.more = more;
    }
    return _result;
  }
  factory RoomDataList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomDataList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomDataList clone() => RoomDataList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomDataList copyWith(void Function(RoomDataList) updates) =>
      super.copyWith((message) => updates(message as RoomDataList))
          as RoomDataList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomDataList create() => RoomDataList._();
  RoomDataList createEmptyInstance() => create();
  static $pb.PbList<RoomDataList> createRepeated() =>
      $pb.PbList<RoomDataList>();
  @$core.pragma('dart2js:noInline')
  static RoomDataList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomDataList>(create);
  static RoomDataList? _defaultInstance;

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
  $core.List<PackageItem> get packageList => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<PackageItem> get receiveList => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<PackageItem> get newPayList => $_getList(3);

  @$pb.TagNumber(5)
  $core.bool get more => $_getBF(4);
  @$pb.TagNumber(5)
  set more($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMore() => $_has(4);
  @$pb.TagNumber(5)
  void clearMore() => clearField(5);
}

class RoomDataPhaseDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomDataPhaseDetail',
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
    ..pc<TabInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentStatistics',
        $pb.PbFieldType.PM,
        protoName: 'currentStatistics',
        subBuilder: TabInfo.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'enterRoomFromSystem',
        $pb.PbFieldType.OU3,
        protoName: 'enterRoomFromSystem')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'enterRoomFromFriendPlaying',
        $pb.PbFieldType.OU3,
        protoName: 'enterRoomFromFriendPlaying')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'enterRoomFromOthers',
        $pb.PbFieldType.OU3,
        protoName: 'enterRoomFromOthers')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'enterRoomMale',
        $pb.PbFieldType.OU3,
        protoName: 'enterRoomMale')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'enterRoomFeMale',
        $pb.PbFieldType.OU3,
        protoName: 'enterRoomFeMale')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'enterRoomMengXin',
        $pb.PbFieldType.OU3,
        protoName: 'enterRoomMengXin')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'enterRoomNotMengXin',
        $pb.PbFieldType.OU3,
        protoName: 'enterRoomNotMengXin')
    ..pc<ReceptionInfo>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receptionList',
        $pb.PbFieldType.PM,
        protoName: 'receptionList',
        subBuilder: ReceptionInfo.create)
    ..hasRequiredFields = false;

  RoomDataPhaseDetail._() : super();
  factory RoomDataPhaseDetail({
    $core.int? rid,
    $core.Iterable<TabInfo>? currentStatistics,
    $core.int? enterRoomFromSystem,
    $core.int? enterRoomFromFriendPlaying,
    $core.int? enterRoomFromOthers,
    $core.int? enterRoomMale,
    $core.int? enterRoomFeMale,
    $core.int? enterRoomMengXin,
    $core.int? enterRoomNotMengXin,
    $core.Iterable<ReceptionInfo>? receptionList,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (currentStatistics != null) {
      _result.currentStatistics.addAll(currentStatistics);
    }
    if (enterRoomFromSystem != null) {
      _result.enterRoomFromSystem = enterRoomFromSystem;
    }
    if (enterRoomFromFriendPlaying != null) {
      _result.enterRoomFromFriendPlaying = enterRoomFromFriendPlaying;
    }
    if (enterRoomFromOthers != null) {
      _result.enterRoomFromOthers = enterRoomFromOthers;
    }
    if (enterRoomMale != null) {
      _result.enterRoomMale = enterRoomMale;
    }
    if (enterRoomFeMale != null) {
      _result.enterRoomFeMale = enterRoomFeMale;
    }
    if (enterRoomMengXin != null) {
      _result.enterRoomMengXin = enterRoomMengXin;
    }
    if (enterRoomNotMengXin != null) {
      _result.enterRoomNotMengXin = enterRoomNotMengXin;
    }
    if (receptionList != null) {
      _result.receptionList.addAll(receptionList);
    }
    return _result;
  }
  factory RoomDataPhaseDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomDataPhaseDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomDataPhaseDetail clone() => RoomDataPhaseDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomDataPhaseDetail copyWith(void Function(RoomDataPhaseDetail) updates) =>
      super.copyWith((message) => updates(message as RoomDataPhaseDetail))
          as RoomDataPhaseDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomDataPhaseDetail create() => RoomDataPhaseDetail._();
  RoomDataPhaseDetail createEmptyInstance() => create();
  static $pb.PbList<RoomDataPhaseDetail> createRepeated() =>
      $pb.PbList<RoomDataPhaseDetail>();
  @$core.pragma('dart2js:noInline')
  static RoomDataPhaseDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomDataPhaseDetail>(create);
  static RoomDataPhaseDetail? _defaultInstance;

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
  $core.List<TabInfo> get currentStatistics => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get enterRoomFromSystem => $_getIZ(2);
  @$pb.TagNumber(3)
  set enterRoomFromSystem($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEnterRoomFromSystem() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnterRoomFromSystem() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get enterRoomFromFriendPlaying => $_getIZ(3);
  @$pb.TagNumber(4)
  set enterRoomFromFriendPlaying($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEnterRoomFromFriendPlaying() => $_has(3);
  @$pb.TagNumber(4)
  void clearEnterRoomFromFriendPlaying() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get enterRoomFromOthers => $_getIZ(4);
  @$pb.TagNumber(5)
  set enterRoomFromOthers($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasEnterRoomFromOthers() => $_has(4);
  @$pb.TagNumber(5)
  void clearEnterRoomFromOthers() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get enterRoomMale => $_getIZ(5);
  @$pb.TagNumber(6)
  set enterRoomMale($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasEnterRoomMale() => $_has(5);
  @$pb.TagNumber(6)
  void clearEnterRoomMale() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get enterRoomFeMale => $_getIZ(6);
  @$pb.TagNumber(7)
  set enterRoomFeMale($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasEnterRoomFeMale() => $_has(6);
  @$pb.TagNumber(7)
  void clearEnterRoomFeMale() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get enterRoomMengXin => $_getIZ(7);
  @$pb.TagNumber(8)
  set enterRoomMengXin($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasEnterRoomMengXin() => $_has(7);
  @$pb.TagNumber(8)
  void clearEnterRoomMengXin() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get enterRoomNotMengXin => $_getIZ(8);
  @$pb.TagNumber(9)
  set enterRoomNotMengXin($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasEnterRoomNotMengXin() => $_has(8);
  @$pb.TagNumber(9)
  void clearEnterRoomNotMengXin() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<ReceptionInfo> get receptionList => $_getList(9);
}

class RoomDataTransferList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomDataTransferList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PackageItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receptionTransferList',
        $pb.PbFieldType.PM,
        protoName: 'receptionTransferList',
        subBuilder: PackageItem.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more')
    ..hasRequiredFields = false;

  RoomDataTransferList._() : super();
  factory RoomDataTransferList({
    $core.Iterable<PackageItem>? receptionTransferList,
    $core.bool? more,
  }) {
    final _result = create();
    if (receptionTransferList != null) {
      _result.receptionTransferList.addAll(receptionTransferList);
    }
    if (more != null) {
      _result.more = more;
    }
    return _result;
  }
  factory RoomDataTransferList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomDataTransferList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomDataTransferList clone() =>
      RoomDataTransferList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomDataTransferList copyWith(void Function(RoomDataTransferList) updates) =>
      super.copyWith((message) => updates(message as RoomDataTransferList))
          as RoomDataTransferList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomDataTransferList create() => RoomDataTransferList._();
  RoomDataTransferList createEmptyInstance() => create();
  static $pb.PbList<RoomDataTransferList> createRepeated() =>
      $pb.PbList<RoomDataTransferList>();
  @$core.pragma('dart2js:noInline')
  static RoomDataTransferList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomDataTransferList>(create);
  static RoomDataTransferList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PackageItem> get receptionTransferList => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get more => $_getBF(1);
  @$pb.TagNumber(2)
  set more($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearMore() => clearField(2);
}

class RoomDataPhaseList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomDataPhaseList',
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
    ..pc<PhaseInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'phaseList',
        $pb.PbFieldType.PM,
        protoName: 'phaseList',
        subBuilder: PhaseInfo.create)
    ..hasRequiredFields = false;

  RoomDataPhaseList._() : super();
  factory RoomDataPhaseList({
    $core.int? rid,
    $core.Iterable<PhaseInfo>? phaseList,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (phaseList != null) {
      _result.phaseList.addAll(phaseList);
    }
    return _result;
  }
  factory RoomDataPhaseList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomDataPhaseList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomDataPhaseList clone() => RoomDataPhaseList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomDataPhaseList copyWith(void Function(RoomDataPhaseList) updates) =>
      super.copyWith((message) => updates(message as RoomDataPhaseList))
          as RoomDataPhaseList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomDataPhaseList create() => RoomDataPhaseList._();
  RoomDataPhaseList createEmptyInstance() => create();
  static $pb.PbList<RoomDataPhaseList> createRepeated() =>
      $pb.PbList<RoomDataPhaseList>();
  @$core.pragma('dart2js:noInline')
  static RoomDataPhaseList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomDataPhaseList>(create);
  static RoomDataPhaseList? _defaultInstance;

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
  $core.List<PhaseInfo> get phaseList => $_getList(1);
}

class RoomDataPackageDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomDataPackageDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<RoomDataPackageDetailItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'packageList',
        $pb.PbFieldType.PM,
        protoName: 'packageList',
        subBuilder: RoomDataPackageDetailItem.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more')
    ..hasRequiredFields = false;

  RoomDataPackageDetail._() : super();
  factory RoomDataPackageDetail({
    $core.Iterable<RoomDataPackageDetailItem>? packageList,
    $core.bool? more,
  }) {
    final _result = create();
    if (packageList != null) {
      _result.packageList.addAll(packageList);
    }
    if (more != null) {
      _result.more = more;
    }
    return _result;
  }
  factory RoomDataPackageDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomDataPackageDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomDataPackageDetail clone() =>
      RoomDataPackageDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomDataPackageDetail copyWith(
          void Function(RoomDataPackageDetail) updates) =>
      super.copyWith((message) => updates(message as RoomDataPackageDetail))
          as RoomDataPackageDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomDataPackageDetail create() => RoomDataPackageDetail._();
  RoomDataPackageDetail createEmptyInstance() => create();
  static $pb.PbList<RoomDataPackageDetail> createRepeated() =>
      $pb.PbList<RoomDataPackageDetail>();
  @$core.pragma('dart2js:noInline')
  static RoomDataPackageDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomDataPackageDetail>(create);
  static RoomDataPackageDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomDataPackageDetailItem> get packageList => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get more => $_getBF(1);
  @$pb.TagNumber(2)
  set more($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearMore() => clearField(2);
}

class RoomDataPackageDetailItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomDataPackageDetailItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sender',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateTime',
        $pb.PbFieldType.OU3,
        protoName: 'dateTime')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'senderName',
        protoName: 'senderName')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toName',
        protoName: 'toName')
    ..hasRequiredFields = false;

  RoomDataPackageDetailItem._() : super();
  factory RoomDataPackageDetailItem({
    $core.int? sender,
    $core.int? to,
    $core.int? money,
    $core.int? dateTime,
    $core.String? senderName,
    $core.String? toName,
  }) {
    final _result = create();
    if (sender != null) {
      _result.sender = sender;
    }
    if (to != null) {
      _result.to = to;
    }
    if (money != null) {
      _result.money = money;
    }
    if (dateTime != null) {
      _result.dateTime = dateTime;
    }
    if (senderName != null) {
      _result.senderName = senderName;
    }
    if (toName != null) {
      _result.toName = toName;
    }
    return _result;
  }
  factory RoomDataPackageDetailItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomDataPackageDetailItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomDataPackageDetailItem clone() =>
      RoomDataPackageDetailItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomDataPackageDetailItem copyWith(
          void Function(RoomDataPackageDetailItem) updates) =>
      super.copyWith((message) => updates(message as RoomDataPackageDetailItem))
          as RoomDataPackageDetailItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomDataPackageDetailItem create() => RoomDataPackageDetailItem._();
  RoomDataPackageDetailItem createEmptyInstance() => create();
  static $pb.PbList<RoomDataPackageDetailItem> createRepeated() =>
      $pb.PbList<RoomDataPackageDetailItem>();
  @$core.pragma('dart2js:noInline')
  static RoomDataPackageDetailItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomDataPackageDetailItem>(create);
  static RoomDataPackageDetailItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sender => $_getIZ(0);
  @$pb.TagNumber(1)
  set sender($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get to => $_getIZ(1);
  @$pb.TagNumber(2)
  set to($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get money => $_getIZ(2);
  @$pb.TagNumber(3)
  set money($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMoney() => $_has(2);
  @$pb.TagNumber(3)
  void clearMoney() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get dateTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set dateTime($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDateTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearDateTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get senderName => $_getSZ(4);
  @$pb.TagNumber(5)
  set senderName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSenderName() => $_has(4);
  @$pb.TagNumber(5)
  void clearSenderName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get toName => $_getSZ(5);
  @$pb.TagNumber(6)
  set toName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasToName() => $_has(5);
  @$pb.TagNumber(6)
  void clearToName() => clearField(6);
}

class TabInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TabInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'intdex',
        $pb.PbFieldType.OU3)
    ..pc<LastSevenDaysDataInfo>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sevenDaysInfo',
        $pb.PbFieldType.PM,
        protoName: 'sevenDaysInfo',
        subBuilder: LastSevenDaysDataInfo.create)
    ..hasRequiredFields = false;

  TabInfo._() : super();
  factory TabInfo({
    $core.int? num,
    $core.String? name,
    $core.bool? show,
    $core.int? intdex,
    $core.Iterable<LastSevenDaysDataInfo>? sevenDaysInfo,
  }) {
    final _result = create();
    if (num != null) {
      _result.num = num;
    }
    if (name != null) {
      _result.name = name;
    }
    if (show != null) {
      _result.show = show;
    }
    if (intdex != null) {
      _result.intdex = intdex;
    }
    if (sevenDaysInfo != null) {
      _result.sevenDaysInfo.addAll(sevenDaysInfo);
    }
    return _result;
  }
  factory TabInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TabInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TabInfo clone() => TabInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TabInfo copyWith(void Function(TabInfo) updates) =>
      super.copyWith((message) => updates(message as TabInfo))
          as TabInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TabInfo create() => TabInfo._();
  TabInfo createEmptyInstance() => create();
  static $pb.PbList<TabInfo> createRepeated() => $pb.PbList<TabInfo>();
  @$core.pragma('dart2js:noInline')
  static TabInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TabInfo>(create);
  static TabInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get num => $_getIZ(0);
  @$pb.TagNumber(1)
  set num($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearNum() => clearField(1);

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
  $core.bool get show => $_getBF(2);
  @$pb.TagNumber(3)
  set show($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShow() => $_has(2);
  @$pb.TagNumber(3)
  void clearShow() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get intdex => $_getIZ(3);
  @$pb.TagNumber(4)
  set intdex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIntdex() => $_has(3);
  @$pb.TagNumber(4)
  void clearIntdex() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<LastSevenDaysDataInfo> get sevenDaysInfo => $_getList(4);
}

class RankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RankItem',
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
            : 'tag')
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
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.double>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OF)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diff')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receptionName',
        protoName: 'receptionName')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.double>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankScore',
        $pb.PbFieldType.OF,
        protoName: 'rankScore')
    ..hasRequiredFields = false;

  RankItem._() : super();
  factory RankItem({
    $core.int? rank,
    $core.String? tag,
    $core.String? name,
    $core.String? icon,
    $core.int? uid,
    $core.double? num,
    $core.String? diff,
    $core.String? receptionName,
    $core.int? rid,
    $core.double? rankScore,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank = rank;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (num != null) {
      _result.num = num;
    }
    if (diff != null) {
      _result.diff = diff;
    }
    if (receptionName != null) {
      _result.receptionName = receptionName;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (rankScore != null) {
      _result.rankScore = rankScore;
    }
    return _result;
  }
  factory RankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RankItem clone() => RankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RankItem copyWith(void Function(RankItem) updates) =>
      super.copyWith((message) => updates(message as RankItem))
          as RankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RankItem create() => RankItem._();
  RankItem createEmptyInstance() => create();
  static $pb.PbList<RankItem> createRepeated() => $pb.PbList<RankItem>();
  @$core.pragma('dart2js:noInline')
  static RankItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RankItem>(create);
  static RankItem? _defaultInstance;

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
  $core.String get tag => $_getSZ(1);
  @$pb.TagNumber(2)
  set tag($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTag() => $_has(1);
  @$pb.TagNumber(2)
  void clearTag() => clearField(2);

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
  $core.double get num => $_getN(5);
  @$pb.TagNumber(6)
  set num($core.double v) {
    $_setFloat(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get diff => $_getSZ(6);
  @$pb.TagNumber(7)
  set diff($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDiff() => $_has(6);
  @$pb.TagNumber(7)
  void clearDiff() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get receptionName => $_getSZ(7);
  @$pb.TagNumber(8)
  set receptionName($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasReceptionName() => $_has(7);
  @$pb.TagNumber(8)
  void clearReceptionName() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get rid => $_getIZ(8);
  @$pb.TagNumber(9)
  set rid($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRid() => $_has(8);
  @$pb.TagNumber(9)
  void clearRid() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get rankScore => $_getN(9);
  @$pb.TagNumber(10)
  set rankScore($core.double v) {
    $_setFloat(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRankScore() => $_has(9);
  @$pb.TagNumber(10)
  void clearRankScore() => clearField(10);
}

class PackageItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PackageItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sender',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'senderName',
        protoName: 'senderName')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toName',
        protoName: 'toName')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'senderIcon',
        protoName: 'senderIcon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toIcon',
        protoName: 'toIcon')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag')
    ..hasRequiredFields = false;

  PackageItem._() : super();
  factory PackageItem({
    $core.int? sender,
    $core.int? to,
    $core.String? senderName,
    $core.String? toName,
    $core.String? senderIcon,
    $core.String? toIcon,
    $core.int? money,
    $core.int? rank,
    $core.String? tag,
  }) {
    final _result = create();
    if (sender != null) {
      _result.sender = sender;
    }
    if (to != null) {
      _result.to = to;
    }
    if (senderName != null) {
      _result.senderName = senderName;
    }
    if (toName != null) {
      _result.toName = toName;
    }
    if (senderIcon != null) {
      _result.senderIcon = senderIcon;
    }
    if (toIcon != null) {
      _result.toIcon = toIcon;
    }
    if (money != null) {
      _result.money = money;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    return _result;
  }
  factory PackageItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PackageItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PackageItem clone() => PackageItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PackageItem copyWith(void Function(PackageItem) updates) =>
      super.copyWith((message) => updates(message as PackageItem))
          as PackageItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PackageItem create() => PackageItem._();
  PackageItem createEmptyInstance() => create();
  static $pb.PbList<PackageItem> createRepeated() => $pb.PbList<PackageItem>();
  @$core.pragma('dart2js:noInline')
  static PackageItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PackageItem>(create);
  static PackageItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sender => $_getIZ(0);
  @$pb.TagNumber(1)
  set sender($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get to => $_getIZ(1);
  @$pb.TagNumber(2)
  set to($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get senderName => $_getSZ(2);
  @$pb.TagNumber(3)
  set senderName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSenderName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSenderName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get toName => $_getSZ(3);
  @$pb.TagNumber(4)
  set toName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasToName() => $_has(3);
  @$pb.TagNumber(4)
  void clearToName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get senderIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set senderIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSenderIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearSenderIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get toIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set toIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasToIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearToIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get money => $_getIZ(6);
  @$pb.TagNumber(7)
  set money($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMoney() => $_has(6);
  @$pb.TagNumber(7)
  void clearMoney() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get rank => $_getIZ(7);
  @$pb.TagNumber(8)
  set rank($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRank() => $_has(7);
  @$pb.TagNumber(8)
  void clearRank() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get tag => $_getSZ(8);
  @$pb.TagNumber(9)
  set tag($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTag() => $_has(8);
  @$pb.TagNumber(9)
  void clearTag() => clearField(9);
}

class ReceptionInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReceptionInfo',
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
    ..pc<TabInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentStatistics',
        $pb.PbFieldType.PM,
        protoName: 'currentStatistics',
        subBuilder: TabInfo.create)
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
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ReceptionInfo._() : super();
  factory ReceptionInfo({
    $core.int? rank,
    $core.Iterable<TabInfo>? currentStatistics,
    $core.String? name,
    $core.String? icon,
    $core.int? uid,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank = rank;
    }
    if (currentStatistics != null) {
      _result.currentStatistics.addAll(currentStatistics);
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory ReceptionInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReceptionInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReceptionInfo clone() => ReceptionInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReceptionInfo copyWith(void Function(ReceptionInfo) updates) =>
      super.copyWith((message) => updates(message as ReceptionInfo))
          as ReceptionInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReceptionInfo create() => ReceptionInfo._();
  ReceptionInfo createEmptyInstance() => create();
  static $pb.PbList<ReceptionInfo> createRepeated() =>
      $pb.PbList<ReceptionInfo>();
  @$core.pragma('dart2js:noInline')
  static ReceptionInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReceptionInfo>(create);
  static ReceptionInfo? _defaultInstance;

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
  $core.List<TabInfo> get currentStatistics => $_getList(1);

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
  $core.int get uid => $_getIZ(4);
  @$pb.TagNumber(5)
  set uid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearUid() => clearField(5);
}

class LastSevenDaysDataInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LastSevenDaysDataInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateTime',
        $pb.PbFieldType.OU3,
        protoName: 'dateTime')
    ..hasRequiredFields = false;

  LastSevenDaysDataInfo._() : super();
  factory LastSevenDaysDataInfo({
    $core.int? num,
    $core.int? dateTime,
  }) {
    final _result = create();
    if (num != null) {
      _result.num = num;
    }
    if (dateTime != null) {
      _result.dateTime = dateTime;
    }
    return _result;
  }
  factory LastSevenDaysDataInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LastSevenDaysDataInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LastSevenDaysDataInfo clone() =>
      LastSevenDaysDataInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LastSevenDaysDataInfo copyWith(
          void Function(LastSevenDaysDataInfo) updates) =>
      super.copyWith((message) => updates(message as LastSevenDaysDataInfo))
          as LastSevenDaysDataInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LastSevenDaysDataInfo create() => LastSevenDaysDataInfo._();
  LastSevenDaysDataInfo createEmptyInstance() => create();
  static $pb.PbList<LastSevenDaysDataInfo> createRepeated() =>
      $pb.PbList<LastSevenDaysDataInfo>();
  @$core.pragma('dart2js:noInline')
  static LastSevenDaysDataInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LastSevenDaysDataInfo>(create);
  static LastSevenDaysDataInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get num => $_getIZ(0);
  @$pb.TagNumber(1)
  set num($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get dateTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set dateTime($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDateTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearDateTime() => clearField(2);
}

class PhaseInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PhaseInfo',
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
            : 'phaseStart',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'phaseEnd',
        $pb.PbFieldType.OU3)
    ..pc<TabInfo>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentStatistics',
        $pb.PbFieldType.PM,
        protoName: 'currentStatistics',
        subBuilder: TabInfo.create)
    ..hasRequiredFields = false;

  PhaseInfo._() : super();
  factory PhaseInfo({
    $core.int? rank,
    $core.int? phaseStart,
    $core.int? phaseEnd,
    $core.Iterable<TabInfo>? currentStatistics,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank = rank;
    }
    if (phaseStart != null) {
      _result.phaseStart = phaseStart;
    }
    if (phaseEnd != null) {
      _result.phaseEnd = phaseEnd;
    }
    if (currentStatistics != null) {
      _result.currentStatistics.addAll(currentStatistics);
    }
    return _result;
  }
  factory PhaseInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PhaseInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PhaseInfo clone() => PhaseInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PhaseInfo copyWith(void Function(PhaseInfo) updates) =>
      super.copyWith((message) => updates(message as PhaseInfo))
          as PhaseInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PhaseInfo create() => PhaseInfo._();
  PhaseInfo createEmptyInstance() => create();
  static $pb.PbList<PhaseInfo> createRepeated() => $pb.PbList<PhaseInfo>();
  @$core.pragma('dart2js:noInline')
  static PhaseInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PhaseInfo>(create);
  static PhaseInfo? _defaultInstance;

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
  $core.int get phaseStart => $_getIZ(1);
  @$pb.TagNumber(2)
  set phaseStart($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPhaseStart() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhaseStart() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get phaseEnd => $_getIZ(2);
  @$pb.TagNumber(3)
  set phaseEnd($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPhaseEnd() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhaseEnd() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<TabInfo> get currentStatistics => $_getList(3);
}

class ResRoomData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomData',
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
    ..aOM<RoomData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomData.create)
    ..hasRequiredFields = false;

  ResRoomData._() : super();
  factory ResRoomData({
    $core.bool? success,
    $core.String? msg,
    RoomData? data,
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
  factory ResRoomData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomData clone() => ResRoomData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomData copyWith(void Function(ResRoomData) updates) =>
      super.copyWith((message) => updates(message as ResRoomData))
          as ResRoomData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomData create() => ResRoomData._();
  ResRoomData createEmptyInstance() => create();
  static $pb.PbList<ResRoomData> createRepeated() => $pb.PbList<ResRoomData>();
  @$core.pragma('dart2js:noInline')
  static ResRoomData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomData>(create);
  static ResRoomData? _defaultInstance;

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
  RoomData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomData ensureData() => $_ensure(2);
}

class ResRoomDataList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomDataList',
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
    ..aOM<RoomDataList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomDataList.create)
    ..hasRequiredFields = false;

  ResRoomDataList._() : super();
  factory ResRoomDataList({
    $core.bool? success,
    $core.String? msg,
    RoomDataList? data,
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
  factory ResRoomDataList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomDataList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomDataList clone() => ResRoomDataList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomDataList copyWith(void Function(ResRoomDataList) updates) =>
      super.copyWith((message) => updates(message as ResRoomDataList))
          as ResRoomDataList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomDataList create() => ResRoomDataList._();
  ResRoomDataList createEmptyInstance() => create();
  static $pb.PbList<ResRoomDataList> createRepeated() =>
      $pb.PbList<ResRoomDataList>();
  @$core.pragma('dart2js:noInline')
  static ResRoomDataList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomDataList>(create);
  static ResRoomDataList? _defaultInstance;

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
  RoomDataList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomDataList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomDataList ensureData() => $_ensure(2);
}

class ResRoomPhaseDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPhaseDetail',
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
    ..aOM<RoomDataPhaseDetail>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomDataPhaseDetail.create)
    ..hasRequiredFields = false;

  ResRoomPhaseDetail._() : super();
  factory ResRoomPhaseDetail({
    $core.bool? success,
    $core.String? msg,
    RoomDataPhaseDetail? data,
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
  factory ResRoomPhaseDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPhaseDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPhaseDetail clone() => ResRoomPhaseDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPhaseDetail copyWith(void Function(ResRoomPhaseDetail) updates) =>
      super.copyWith((message) => updates(message as ResRoomPhaseDetail))
          as ResRoomPhaseDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPhaseDetail create() => ResRoomPhaseDetail._();
  ResRoomPhaseDetail createEmptyInstance() => create();
  static $pb.PbList<ResRoomPhaseDetail> createRepeated() =>
      $pb.PbList<ResRoomPhaseDetail>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPhaseDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPhaseDetail>(create);
  static ResRoomPhaseDetail? _defaultInstance;

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
  RoomDataPhaseDetail get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomDataPhaseDetail v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomDataPhaseDetail ensureData() => $_ensure(2);
}

class ResRoomPhaseList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPhaseList',
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
    ..aOM<RoomDataPhaseList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomDataPhaseList.create)
    ..hasRequiredFields = false;

  ResRoomPhaseList._() : super();
  factory ResRoomPhaseList({
    $core.bool? success,
    $core.String? msg,
    RoomDataPhaseList? data,
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
  factory ResRoomPhaseList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPhaseList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPhaseList clone() => ResRoomPhaseList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPhaseList copyWith(void Function(ResRoomPhaseList) updates) =>
      super.copyWith((message) => updates(message as ResRoomPhaseList))
          as ResRoomPhaseList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPhaseList create() => ResRoomPhaseList._();
  ResRoomPhaseList createEmptyInstance() => create();
  static $pb.PbList<ResRoomPhaseList> createRepeated() =>
      $pb.PbList<ResRoomPhaseList>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPhaseList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPhaseList>(create);
  static ResRoomPhaseList? _defaultInstance;

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
  RoomDataPhaseList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomDataPhaseList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomDataPhaseList ensureData() => $_ensure(2);
}

class ResRoomPackageDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPackageDetail',
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
    ..aOM<RoomDataPackageDetail>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomDataPackageDetail.create)
    ..hasRequiredFields = false;

  ResRoomPackageDetail._() : super();
  factory ResRoomPackageDetail({
    $core.bool? success,
    $core.String? msg,
    RoomDataPackageDetail? data,
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
  factory ResRoomPackageDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPackageDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPackageDetail clone() =>
      ResRoomPackageDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPackageDetail copyWith(void Function(ResRoomPackageDetail) updates) =>
      super.copyWith((message) => updates(message as ResRoomPackageDetail))
          as ResRoomPackageDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPackageDetail create() => ResRoomPackageDetail._();
  ResRoomPackageDetail createEmptyInstance() => create();
  static $pb.PbList<ResRoomPackageDetail> createRepeated() =>
      $pb.PbList<ResRoomPackageDetail>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPackageDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPackageDetail>(create);
  static ResRoomPackageDetail? _defaultInstance;

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
  RoomDataPackageDetail get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomDataPackageDetail v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomDataPackageDetail ensureData() => $_ensure(2);
}

class ResRoomDataReceptionTransferList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomDataReceptionTransferList',
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
    ..aOM<RoomDataTransferList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomDataTransferList.create)
    ..hasRequiredFields = false;

  ResRoomDataReceptionTransferList._() : super();
  factory ResRoomDataReceptionTransferList({
    $core.bool? success,
    $core.String? msg,
    RoomDataTransferList? data,
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
  factory ResRoomDataReceptionTransferList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomDataReceptionTransferList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomDataReceptionTransferList clone() =>
      ResRoomDataReceptionTransferList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomDataReceptionTransferList copyWith(
          void Function(ResRoomDataReceptionTransferList) updates) =>
      super.copyWith(
              (message) => updates(message as ResRoomDataReceptionTransferList))
          as ResRoomDataReceptionTransferList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomDataReceptionTransferList create() =>
      ResRoomDataReceptionTransferList._();
  ResRoomDataReceptionTransferList createEmptyInstance() => create();
  static $pb.PbList<ResRoomDataReceptionTransferList> createRepeated() =>
      $pb.PbList<ResRoomDataReceptionTransferList>();
  @$core.pragma('dart2js:noInline')
  static ResRoomDataReceptionTransferList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomDataReceptionTransferList>(
          create);
  static ResRoomDataReceptionTransferList? _defaultInstance;

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
  RoomDataTransferList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomDataTransferList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomDataTransferList ensureData() => $_ensure(2);
}

class ResRoomDataDesc extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomDataDesc',
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
            : 'data')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..hasRequiredFields = false;

  ResRoomDataDesc._() : super();
  factory ResRoomDataDesc({
    $core.bool? success,
    $core.String? data,
    $core.String? msg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (data != null) {
      _result.data = data;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory ResRoomDataDesc.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomDataDesc.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomDataDesc clone() => ResRoomDataDesc()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomDataDesc copyWith(void Function(ResRoomDataDesc) updates) =>
      super.copyWith((message) => updates(message as ResRoomDataDesc))
          as ResRoomDataDesc; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomDataDesc create() => ResRoomDataDesc._();
  ResRoomDataDesc createEmptyInstance() => create();
  static $pb.PbList<ResRoomDataDesc> createRepeated() =>
      $pb.PbList<ResRoomDataDesc>();
  @$core.pragma('dart2js:noInline')
  static ResRoomDataDesc getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomDataDesc>(create);
  static ResRoomDataDesc? _defaultInstance;

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
  $core.String get data => $_getSZ(1);
  @$pb.TagNumber(2)
  set data($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);
}

class ResMateRoomDesc extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMateRoomDesc',
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
    ..aOM<MateRoomDescData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: MateRoomDescData.create)
    ..hasRequiredFields = false;

  ResMateRoomDesc._() : super();
  factory ResMateRoomDesc({
    $core.bool? success,
    $core.String? msg,
    MateRoomDescData? data,
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
  factory ResMateRoomDesc.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMateRoomDesc.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMateRoomDesc clone() => ResMateRoomDesc()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMateRoomDesc copyWith(void Function(ResMateRoomDesc) updates) =>
      super.copyWith((message) => updates(message as ResMateRoomDesc))
          as ResMateRoomDesc; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMateRoomDesc create() => ResMateRoomDesc._();
  ResMateRoomDesc createEmptyInstance() => create();
  static $pb.PbList<ResMateRoomDesc> createRepeated() =>
      $pb.PbList<ResMateRoomDesc>();
  @$core.pragma('dart2js:noInline')
  static ResMateRoomDesc getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMateRoomDesc>(create);
  static ResMateRoomDesc? _defaultInstance;

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
  MateRoomDescData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(MateRoomDescData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  MateRoomDescData ensureData() => $_ensure(2);
}

class MateRoomDescData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateRoomDescData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomDesc')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomIcon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isPretty')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerName')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerSign')
    ..aOB(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'like')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerIcon')
    ..aOM<RoomHonor>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'honorData',
        protoName: 'honorData',
        subBuilder: RoomHonor.create)
    ..hasRequiredFields = false;

  MateRoomDescData._() : super();
  factory MateRoomDescData({
    $core.String? roomDesc,
    $core.String? roomIcon,
    $core.String? roomName,
    $core.int? rid,
    $core.bool? isPretty,
    $core.String? label,
    $core.int? ownerUid,
    $core.String? ownerName,
    $core.String? ownerSign,
    $core.bool? like,
    $core.String? ownerIcon,
    RoomHonor? honorData,
  }) {
    final _result = create();
    if (roomDesc != null) {
      _result.roomDesc = roomDesc;
    }
    if (roomIcon != null) {
      _result.roomIcon = roomIcon;
    }
    if (roomName != null) {
      _result.roomName = roomName;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (isPretty != null) {
      _result.isPretty = isPretty;
    }
    if (label != null) {
      _result.label = label;
    }
    if (ownerUid != null) {
      _result.ownerUid = ownerUid;
    }
    if (ownerName != null) {
      _result.ownerName = ownerName;
    }
    if (ownerSign != null) {
      _result.ownerSign = ownerSign;
    }
    if (like != null) {
      _result.like = like;
    }
    if (ownerIcon != null) {
      _result.ownerIcon = ownerIcon;
    }
    if (honorData != null) {
      _result.honorData = honorData;
    }
    return _result;
  }
  factory MateRoomDescData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateRoomDescData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateRoomDescData clone() => MateRoomDescData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateRoomDescData copyWith(void Function(MateRoomDescData) updates) =>
      super.copyWith((message) => updates(message as MateRoomDescData))
          as MateRoomDescData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateRoomDescData create() => MateRoomDescData._();
  MateRoomDescData createEmptyInstance() => create();
  static $pb.PbList<MateRoomDescData> createRepeated() =>
      $pb.PbList<MateRoomDescData>();
  @$core.pragma('dart2js:noInline')
  static MateRoomDescData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateRoomDescData>(create);
  static MateRoomDescData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomDesc => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomDesc($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoomDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomDesc() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoomIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomName => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRoomName() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get rid => $_getIZ(3);
  @$pb.TagNumber(4)
  set rid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRid() => $_has(3);
  @$pb.TagNumber(4)
  void clearRid() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isPretty => $_getBF(4);
  @$pb.TagNumber(5)
  set isPretty($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsPretty() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsPretty() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get label => $_getSZ(5);
  @$pb.TagNumber(6)
  set label($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLabel() => $_has(5);
  @$pb.TagNumber(6)
  void clearLabel() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get ownerUid => $_getIZ(6);
  @$pb.TagNumber(7)
  set ownerUid($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOwnerUid() => $_has(6);
  @$pb.TagNumber(7)
  void clearOwnerUid() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get ownerName => $_getSZ(7);
  @$pb.TagNumber(8)
  set ownerName($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasOwnerName() => $_has(7);
  @$pb.TagNumber(8)
  void clearOwnerName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get ownerSign => $_getSZ(8);
  @$pb.TagNumber(9)
  set ownerSign($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasOwnerSign() => $_has(8);
  @$pb.TagNumber(9)
  void clearOwnerSign() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get like => $_getBF(9);
  @$pb.TagNumber(10)
  set like($core.bool v) {
    $_setBool(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasLike() => $_has(9);
  @$pb.TagNumber(10)
  void clearLike() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get ownerIcon => $_getSZ(10);
  @$pb.TagNumber(11)
  set ownerIcon($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasOwnerIcon() => $_has(10);
  @$pb.TagNumber(11)
  void clearOwnerIcon() => clearField(11);

  @$pb.TagNumber(12)
  RoomHonor get honorData => $_getN(11);
  @$pb.TagNumber(12)
  set honorData(RoomHonor v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasHonorData() => $_has(11);
  @$pb.TagNumber(12)
  void clearHonorData() => clearField(12);
  @$pb.TagNumber(12)
  RoomHonor ensureHonorData() => $_ensure(11);
}

class RoomHonor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomHonor',
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
    ..pc<RoomHonorProgress>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progress',
        $pb.PbFieldType.PM,
        subBuilder: RoomHonorProgress.create)
    ..pPS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextDiff',
        $pb.PbFieldType.OU3,
        protoName: 'nextDiff')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextLevelName',
        protoName: 'nextLevelName')
    ..pPS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pageBg',
        protoName: 'pageBg')
    ..hasRequiredFields = false;

  RoomHonor._() : super();
  factory RoomHonor({
    $core.int? rid,
    $core.String? icon,
    $core.String? name,
    $core.Iterable<RoomHonorProgress>? progress,
    $core.Iterable<$core.String>? bg,
    $core.int? current,
    $core.int? total,
    $core.int? nextDiff,
    $core.String? nextLevelName,
    $core.Iterable<$core.String>? pageBg,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (progress != null) {
      _result.progress.addAll(progress);
    }
    if (bg != null) {
      _result.bg.addAll(bg);
    }
    if (current != null) {
      _result.current = current;
    }
    if (total != null) {
      _result.total = total;
    }
    if (nextDiff != null) {
      _result.nextDiff = nextDiff;
    }
    if (nextLevelName != null) {
      _result.nextLevelName = nextLevelName;
    }
    if (pageBg != null) {
      _result.pageBg.addAll(pageBg);
    }
    return _result;
  }
  factory RoomHonor.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomHonor.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomHonor clone() => RoomHonor()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomHonor copyWith(void Function(RoomHonor) updates) =>
      super.copyWith((message) => updates(message as RoomHonor))
          as RoomHonor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomHonor create() => RoomHonor._();
  RoomHonor createEmptyInstance() => create();
  static $pb.PbList<RoomHonor> createRepeated() => $pb.PbList<RoomHonor>();
  @$core.pragma('dart2js:noInline')
  static RoomHonor getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomHonor>(create);
  static RoomHonor? _defaultInstance;

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
  $core.List<RoomHonorProgress> get progress => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.String> get bg => $_getList(4);

  @$pb.TagNumber(6)
  $core.int get current => $_getIZ(5);
  @$pb.TagNumber(6)
  set current($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCurrent() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurrent() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get total => $_getIZ(6);
  @$pb.TagNumber(7)
  set total($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTotal() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotal() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get nextDiff => $_getIZ(7);
  @$pb.TagNumber(8)
  set nextDiff($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasNextDiff() => $_has(7);
  @$pb.TagNumber(8)
  void clearNextDiff() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get nextLevelName => $_getSZ(8);
  @$pb.TagNumber(9)
  set nextLevelName($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasNextLevelName() => $_has(8);
  @$pb.TagNumber(9)
  void clearNextLevelName() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get pageBg => $_getList(9);
}

class RoomHonorProgress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomHonorProgress',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tips')
    ..hasRequiredFields = false;

  RoomHonorProgress._() : super();
  factory RoomHonorProgress({
    $core.String? name,
    $core.int? current,
    $core.int? total,
    $core.String? tips,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (current != null) {
      _result.current = current;
    }
    if (total != null) {
      _result.total = total;
    }
    if (tips != null) {
      _result.tips = tips;
    }
    return _result;
  }
  factory RoomHonorProgress.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomHonorProgress.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomHonorProgress clone() => RoomHonorProgress()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomHonorProgress copyWith(void Function(RoomHonorProgress) updates) =>
      super.copyWith((message) => updates(message as RoomHonorProgress))
          as RoomHonorProgress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomHonorProgress create() => RoomHonorProgress._();
  RoomHonorProgress createEmptyInstance() => create();
  static $pb.PbList<RoomHonorProgress> createRepeated() =>
      $pb.PbList<RoomHonorProgress>();
  @$core.pragma('dart2js:noInline')
  static RoomHonorProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomHonorProgress>(create);
  static RoomHonorProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get current => $_getIZ(1);
  @$pb.TagNumber(2)
  set current($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCurrent() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrent() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get total => $_getIZ(2);
  @$pb.TagNumber(3)
  set total($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotal() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get tips => $_getSZ(3);
  @$pb.TagNumber(4)
  set tips($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTips() => $_has(3);
  @$pb.TagNumber(4)
  void clearTips() => clearField(4);
}

class ResRoomHonorDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomHonorDetail',
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
    ..aOM<RoomHonorDetail>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomHonorDetail.create)
    ..hasRequiredFields = false;

  ResRoomHonorDetail._() : super();
  factory ResRoomHonorDetail({
    $core.bool? success,
    $core.String? msg,
    RoomHonorDetail? data,
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
  factory ResRoomHonorDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomHonorDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomHonorDetail clone() => ResRoomHonorDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomHonorDetail copyWith(void Function(ResRoomHonorDetail) updates) =>
      super.copyWith((message) => updates(message as ResRoomHonorDetail))
          as ResRoomHonorDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomHonorDetail create() => ResRoomHonorDetail._();
  ResRoomHonorDetail createEmptyInstance() => create();
  static $pb.PbList<ResRoomHonorDetail> createRepeated() =>
      $pb.PbList<ResRoomHonorDetail>();
  @$core.pragma('dart2js:noInline')
  static ResRoomHonorDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomHonorDetail>(create);
  static ResRoomHonorDetail? _defaultInstance;

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
  RoomHonorDetail get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomHonorDetail v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomHonorDetail ensureData() => $_ensure(2);
}

class RoomHonorDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomHonorDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<RoomHonor>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'base',
        subBuilder: RoomHonor.create)
    ..pc<RoomHonorTab>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabs',
        $pb.PbFieldType.PM,
        subBuilder: RoomHonorTab.create)
    ..hasRequiredFields = false;

  RoomHonorDetail._() : super();
  factory RoomHonorDetail({
    RoomHonor? base,
    $core.Iterable<RoomHonorTab>? tabs,
  }) {
    final _result = create();
    if (base != null) {
      _result.base = base;
    }
    if (tabs != null) {
      _result.tabs.addAll(tabs);
    }
    return _result;
  }
  factory RoomHonorDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomHonorDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomHonorDetail clone() => RoomHonorDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomHonorDetail copyWith(void Function(RoomHonorDetail) updates) =>
      super.copyWith((message) => updates(message as RoomHonorDetail))
          as RoomHonorDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomHonorDetail create() => RoomHonorDetail._();
  RoomHonorDetail createEmptyInstance() => create();
  static $pb.PbList<RoomHonorDetail> createRepeated() =>
      $pb.PbList<RoomHonorDetail>();
  @$core.pragma('dart2js:noInline')
  static RoomHonorDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomHonorDetail>(create);
  static RoomHonorDetail? _defaultInstance;

  @$pb.TagNumber(1)
  RoomHonor get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(RoomHonor v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  RoomHonor ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<RoomHonorTab> get tabs => $_getList(1);
}

class RoomHonorTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomHonorTab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'idx',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..pc<RoomHonorItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RoomHonorItem.create)
    ..hasRequiredFields = false;

  RoomHonorTab._() : super();
  factory RoomHonorTab({
    $core.int? idx,
    $core.String? name,
    $core.Iterable<RoomHonorItem>? list,
  }) {
    final _result = create();
    if (idx != null) {
      _result.idx = idx;
    }
    if (name != null) {
      _result.name = name;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory RoomHonorTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomHonorTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomHonorTab clone() => RoomHonorTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomHonorTab copyWith(void Function(RoomHonorTab) updates) =>
      super.copyWith((message) => updates(message as RoomHonorTab))
          as RoomHonorTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomHonorTab create() => RoomHonorTab._();
  RoomHonorTab createEmptyInstance() => create();
  static $pb.PbList<RoomHonorTab> createRepeated() =>
      $pb.PbList<RoomHonorTab>();
  @$core.pragma('dart2js:noInline')
  static RoomHonorTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomHonorTab>(create);
  static RoomHonorTab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idx => $_getIZ(0);
  @$pb.TagNumber(1)
  set idx($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIdx() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdx() => clearField(1);

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
  $core.List<RoomHonorItem> get list => $_getList(2);
}

class RoomHonorItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomHonorItem',
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
            : 'schema')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOM<RoomHonorProgress>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progress',
        subBuilder: RoomHonorProgress.create)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stay',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelName',
        protoName: 'levelName')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelColor',
        protoName: 'levelColor')
    ..hasRequiredFields = false;

  RoomHonorItem._() : super();
  factory RoomHonorItem({
    $core.int? id,
    $core.String? name,
    $core.int? score,
    $core.String? schema,
    $core.int? status,
    $core.String? icon,
    RoomHonorProgress? progress,
    $core.int? stay,
    $core.String? desc,
    $core.String? levelName,
    $core.String? levelColor,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (score != null) {
      _result.score = score;
    }
    if (schema != null) {
      _result.schema = schema;
    }
    if (status != null) {
      _result.status = status;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (progress != null) {
      _result.progress = progress;
    }
    if (stay != null) {
      _result.stay = stay;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (levelName != null) {
      _result.levelName = levelName;
    }
    if (levelColor != null) {
      _result.levelColor = levelColor;
    }
    return _result;
  }
  factory RoomHonorItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomHonorItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomHonorItem clone() => RoomHonorItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomHonorItem copyWith(void Function(RoomHonorItem) updates) =>
      super.copyWith((message) => updates(message as RoomHonorItem))
          as RoomHonorItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomHonorItem create() => RoomHonorItem._();
  RoomHonorItem createEmptyInstance() => create();
  static $pb.PbList<RoomHonorItem> createRepeated() =>
      $pb.PbList<RoomHonorItem>();
  @$core.pragma('dart2js:noInline')
  static RoomHonorItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomHonorItem>(create);
  static RoomHonorItem? _defaultInstance;

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
  $core.String get schema => $_getSZ(3);
  @$pb.TagNumber(4)
  set schema($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSchema() => $_has(3);
  @$pb.TagNumber(4)
  void clearSchema() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get status => $_getIZ(4);
  @$pb.TagNumber(5)
  set status($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get icon => $_getSZ(5);
  @$pb.TagNumber(6)
  set icon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearIcon() => clearField(6);

  @$pb.TagNumber(7)
  RoomHonorProgress get progress => $_getN(6);
  @$pb.TagNumber(7)
  set progress(RoomHonorProgress v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasProgress() => $_has(6);
  @$pb.TagNumber(7)
  void clearProgress() => clearField(7);
  @$pb.TagNumber(7)
  RoomHonorProgress ensureProgress() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get stay => $_getIZ(7);
  @$pb.TagNumber(8)
  set stay($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStay() => $_has(7);
  @$pb.TagNumber(8)
  void clearStay() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get desc => $_getSZ(8);
  @$pb.TagNumber(9)
  set desc($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasDesc() => $_has(8);
  @$pb.TagNumber(9)
  void clearDesc() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get levelName => $_getSZ(9);
  @$pb.TagNumber(10)
  set levelName($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasLevelName() => $_has(9);
  @$pb.TagNumber(10)
  void clearLevelName() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get levelColor => $_getSZ(10);
  @$pb.TagNumber(11)
  set levelColor($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasLevelColor() => $_has(10);
  @$pb.TagNumber(11)
  void clearLevelColor() => clearField(11);
}
