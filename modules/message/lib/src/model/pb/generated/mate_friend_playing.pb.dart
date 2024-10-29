///
//  Generated code. Do not modify.
//  source: mate_friend_playing.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class MatePlayingListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MatePlayingListResp',
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
    ..aOM<MatePlayingListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: MatePlayingListData.create)
    ..hasRequiredFields = false;

  MatePlayingListResp._() : super();
  factory MatePlayingListResp({
    $core.bool? success,
    $core.String? msg,
    MatePlayingListData? data,
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
  factory MatePlayingListResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MatePlayingListResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MatePlayingListResp clone() => MatePlayingListResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MatePlayingListResp copyWith(void Function(MatePlayingListResp) updates) =>
      super.copyWith((message) => updates(message as MatePlayingListResp))
          as MatePlayingListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MatePlayingListResp create() => MatePlayingListResp._();
  MatePlayingListResp createEmptyInstance() => create();
  static $pb.PbList<MatePlayingListResp> createRepeated() =>
      $pb.PbList<MatePlayingListResp>();
  @$core.pragma('dart2js:noInline')
  static MatePlayingListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MatePlayingListResp>(create);
  static MatePlayingListResp? _defaultInstance;

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
  MatePlayingListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(MatePlayingListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  MatePlayingListData ensureData() => $_ensure(2);
}

class MatePlayingListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MatePlayingListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<MateOptionRcmdPlayingData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: MateOptionRcmdPlayingData.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MatePlayingListData._() : super();
  factory MatePlayingListData({
    $core.Iterable<MateOptionRcmdPlayingData>? list,
    $core.bool? more,
    $core.int? total,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (more != null) {
      _result.more = more;
    }
    if (total != null) {
      _result.total = total;
    }
    return _result;
  }
  factory MatePlayingListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MatePlayingListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MatePlayingListData clone() => MatePlayingListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MatePlayingListData copyWith(void Function(MatePlayingListData) updates) =>
      super.copyWith((message) => updates(message as MatePlayingListData))
          as MatePlayingListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MatePlayingListData create() => MatePlayingListData._();
  MatePlayingListData createEmptyInstance() => create();
  static $pb.PbList<MatePlayingListData> createRepeated() =>
      $pb.PbList<MatePlayingListData>();
  @$core.pragma('dart2js:noInline')
  static MatePlayingListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MatePlayingListData>(create);
  static MatePlayingListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MateOptionRcmdPlayingData> get list => $_getList(0);

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
}

class MateOptionRcmdPlayingData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateOptionRcmdPlayingData',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inRoom',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.O3)
    ..aOM<MatePlayingRoomMiniIcon>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'miniIcon',
        subBuilder: MatePlayingRoomMiniIcon.create)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aInt64(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomOnlineNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomRole')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomName')
    ..hasRequiredFields = false;

  MateOptionRcmdPlayingData._() : super();
  factory MateOptionRcmdPlayingData({
    $core.int? uid,
    $core.String? name,
    $core.int? inRoom,
    $core.String? icon,
    $core.int? onlineStatus,
    MatePlayingRoomMiniIcon? miniIcon,
    $core.int? age,
    $core.int? sex,
    $core.String? type,
    $fixnum.Int64? dateline,
    $core.int? roomOnlineNum,
    $core.String? roomRole,
    $core.String? roomName,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (inRoom != null) {
      _result.inRoom = inRoom;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (miniIcon != null) {
      _result.miniIcon = miniIcon;
    }
    if (age != null) {
      _result.age = age;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (type != null) {
      _result.type = type;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (roomOnlineNum != null) {
      _result.roomOnlineNum = roomOnlineNum;
    }
    if (roomRole != null) {
      _result.roomRole = roomRole;
    }
    if (roomName != null) {
      _result.roomName = roomName;
    }
    return _result;
  }
  factory MateOptionRcmdPlayingData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateOptionRcmdPlayingData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateOptionRcmdPlayingData clone() =>
      MateOptionRcmdPlayingData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateOptionRcmdPlayingData copyWith(
          void Function(MateOptionRcmdPlayingData) updates) =>
      super.copyWith((message) => updates(message as MateOptionRcmdPlayingData))
          as MateOptionRcmdPlayingData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateOptionRcmdPlayingData create() => MateOptionRcmdPlayingData._();
  MateOptionRcmdPlayingData createEmptyInstance() => create();
  static $pb.PbList<MateOptionRcmdPlayingData> createRepeated() =>
      $pb.PbList<MateOptionRcmdPlayingData>();
  @$core.pragma('dart2js:noInline')
  static MateOptionRcmdPlayingData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateOptionRcmdPlayingData>(create);
  static MateOptionRcmdPlayingData? _defaultInstance;

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
  $core.int get inRoom => $_getIZ(2);
  @$pb.TagNumber(3)
  set inRoom($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasInRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearInRoom() => clearField(3);

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
  $core.int get onlineStatus => $_getIZ(4);
  @$pb.TagNumber(5)
  set onlineStatus($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOnlineStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineStatus() => clearField(5);

  @$pb.TagNumber(6)
  MatePlayingRoomMiniIcon get miniIcon => $_getN(5);
  @$pb.TagNumber(6)
  set miniIcon(MatePlayingRoomMiniIcon v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMiniIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearMiniIcon() => clearField(6);
  @$pb.TagNumber(6)
  MatePlayingRoomMiniIcon ensureMiniIcon() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get age => $_getIZ(6);
  @$pb.TagNumber(7)
  set age($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAge() => $_has(6);
  @$pb.TagNumber(7)
  void clearAge() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get sex => $_getIZ(7);
  @$pb.TagNumber(8)
  set sex($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSex() => $_has(7);
  @$pb.TagNumber(8)
  void clearSex() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get type => $_getSZ(8);
  @$pb.TagNumber(9)
  set type($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasType() => $_has(8);
  @$pb.TagNumber(9)
  void clearType() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get dateline => $_getI64(9);
  @$pb.TagNumber(10)
  set dateline($fixnum.Int64 v) {
    $_setInt64(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDateline() => $_has(9);
  @$pb.TagNumber(10)
  void clearDateline() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get roomOnlineNum => $_getIZ(10);
  @$pb.TagNumber(11)
  set roomOnlineNum($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasRoomOnlineNum() => $_has(10);
  @$pb.TagNumber(11)
  void clearRoomOnlineNum() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get roomRole => $_getSZ(11);
  @$pb.TagNumber(12)
  set roomRole($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasRoomRole() => $_has(11);
  @$pb.TagNumber(12)
  void clearRoomRole() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get roomName => $_getSZ(12);
  @$pb.TagNumber(13)
  set roomName($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasRoomName() => $_has(12);
  @$pb.TagNumber(13)
  void clearRoomName() => clearField(13);
}

class MatePlayingRoomMiniIcon extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MatePlayingRoomMiniIcon',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pPS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'borders')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boardTitle')
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boardBg')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boardIcon')
    ..hasRequiredFields = false;

  MatePlayingRoomMiniIcon._() : super();
  factory MatePlayingRoomMiniIcon({
    $core.Iterable<$core.String>? borders,
    $core.String? boardTitle,
    $core.Iterable<$core.String>? boardBg,
    $core.String? boardIcon,
  }) {
    final _result = create();
    if (borders != null) {
      _result.borders.addAll(borders);
    }
    if (boardTitle != null) {
      _result.boardTitle = boardTitle;
    }
    if (boardBg != null) {
      _result.boardBg.addAll(boardBg);
    }
    if (boardIcon != null) {
      _result.boardIcon = boardIcon;
    }
    return _result;
  }
  factory MatePlayingRoomMiniIcon.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MatePlayingRoomMiniIcon.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MatePlayingRoomMiniIcon clone() =>
      MatePlayingRoomMiniIcon()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MatePlayingRoomMiniIcon copyWith(
          void Function(MatePlayingRoomMiniIcon) updates) =>
      super.copyWith((message) => updates(message as MatePlayingRoomMiniIcon))
          as MatePlayingRoomMiniIcon; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MatePlayingRoomMiniIcon create() => MatePlayingRoomMiniIcon._();
  MatePlayingRoomMiniIcon createEmptyInstance() => create();
  static $pb.PbList<MatePlayingRoomMiniIcon> createRepeated() =>
      $pb.PbList<MatePlayingRoomMiniIcon>();
  @$core.pragma('dart2js:noInline')
  static MatePlayingRoomMiniIcon getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MatePlayingRoomMiniIcon>(create);
  static MatePlayingRoomMiniIcon? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get borders => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get boardTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set boardTitle($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBoardTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoardTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get boardBg => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get boardIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set boardIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBoardIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoardIcon() => clearField(4);
}
