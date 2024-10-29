///
//  Generated code. Do not modify.
//  source: room_avatar_ktv.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'room_avatar_ktv.pbenum.dart';

export 'room_avatar_ktv.pbenum.dart';

class AvatarKtvConfigDataRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AvatarKtvConfigDataRoom',
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
    ..e<AvatarKtvStage>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomState',
        $pb.PbFieldType.OE,
        defaultOrMaker: AvatarKtvStage.SY_ROOM_KTV_STAGE_INIT,
        valueOf: AvatarKtvStage.valueOf,
        enumValues: AvatarKtvStage.values)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stateExpire',
        $pb.PbFieldType.O3)
    ..aOM<AvatarKtvConfig>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'syKtvConfig',
        subBuilder: AvatarKtvConfig.create)
    ..hasRequiredFields = false;

  AvatarKtvConfigDataRoom._() : super();
  factory AvatarKtvConfigDataRoom({
    $core.int? rid,
    AvatarKtvStage? roomState,
    $core.int? stateExpire,
    AvatarKtvConfig? syKtvConfig,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (roomState != null) {
      _result.roomState = roomState;
    }
    if (stateExpire != null) {
      _result.stateExpire = stateExpire;
    }
    if (syKtvConfig != null) {
      _result.syKtvConfig = syKtvConfig;
    }
    return _result;
  }
  factory AvatarKtvConfigDataRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AvatarKtvConfigDataRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AvatarKtvConfigDataRoom clone() =>
      AvatarKtvConfigDataRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AvatarKtvConfigDataRoom copyWith(
          void Function(AvatarKtvConfigDataRoom) updates) =>
      super.copyWith((message) => updates(message as AvatarKtvConfigDataRoom))
          as AvatarKtvConfigDataRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AvatarKtvConfigDataRoom create() => AvatarKtvConfigDataRoom._();
  AvatarKtvConfigDataRoom createEmptyInstance() => create();
  static $pb.PbList<AvatarKtvConfigDataRoom> createRepeated() =>
      $pb.PbList<AvatarKtvConfigDataRoom>();
  @$core.pragma('dart2js:noInline')
  static AvatarKtvConfigDataRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvatarKtvConfigDataRoom>(create);
  static AvatarKtvConfigDataRoom? _defaultInstance;

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
  AvatarKtvStage get roomState => $_getN(1);
  @$pb.TagNumber(2)
  set roomState(AvatarKtvStage v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoomState() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomState() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get stateExpire => $_getIZ(2);
  @$pb.TagNumber(3)
  set stateExpire($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStateExpire() => $_has(2);
  @$pb.TagNumber(3)
  void clearStateExpire() => clearField(3);

  @$pb.TagNumber(4)
  AvatarKtvConfig get syKtvConfig => $_getN(3);
  @$pb.TagNumber(4)
  set syKtvConfig(AvatarKtvConfig v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSyKtvConfig() => $_has(3);
  @$pb.TagNumber(4)
  void clearSyKtvConfig() => clearField(4);
  @$pb.TagNumber(4)
  AvatarKtvConfig ensureSyKtvConfig() => $_ensure(3);
}

class AvatarKtvConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AvatarKtvConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chooseSongLimit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chooseSong',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'willSongListNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AvatarKtvConfig._() : super();
  factory AvatarKtvConfig({
    $core.int? chooseSongLimit,
    $core.int? chooseSong,
    $core.int? willSongListNum,
  }) {
    final _result = create();
    if (chooseSongLimit != null) {
      _result.chooseSongLimit = chooseSongLimit;
    }
    if (chooseSong != null) {
      _result.chooseSong = chooseSong;
    }
    if (willSongListNum != null) {
      _result.willSongListNum = willSongListNum;
    }
    return _result;
  }
  factory AvatarKtvConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AvatarKtvConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AvatarKtvConfig clone() => AvatarKtvConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AvatarKtvConfig copyWith(void Function(AvatarKtvConfig) updates) =>
      super.copyWith((message) => updates(message as AvatarKtvConfig))
          as AvatarKtvConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AvatarKtvConfig create() => AvatarKtvConfig._();
  AvatarKtvConfig createEmptyInstance() => create();
  static $pb.PbList<AvatarKtvConfig> createRepeated() =>
      $pb.PbList<AvatarKtvConfig>();
  @$core.pragma('dart2js:noInline')
  static AvatarKtvConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvatarKtvConfig>(create);
  static AvatarKtvConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get chooseSongLimit => $_getIZ(0);
  @$pb.TagNumber(1)
  set chooseSongLimit($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasChooseSongLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearChooseSongLimit() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get chooseSong => $_getIZ(1);
  @$pb.TagNumber(2)
  set chooseSong($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasChooseSong() => $_has(1);
  @$pb.TagNumber(2)
  void clearChooseSong() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get willSongListNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set willSongListNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWillSongListNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearWillSongListNum() => clearField(3);
}

class UserPropInfoItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserPropInfoItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ptype')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propName')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propDesc')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propIcon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propSrc')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topDp',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftDp',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  UserPropInfoItem._() : super();
  factory UserPropInfoItem({
    $core.int? pid,
    $core.String? ptype,
    $core.String? propName,
    $core.String? propDesc,
    $core.String? propIcon,
    $core.String? propSrc,
    $core.int? topDp,
    $core.int? leftDp,
    $core.int? width,
    $core.int? height,
  }) {
    final _result = create();
    if (pid != null) {
      _result.pid = pid;
    }
    if (ptype != null) {
      _result.ptype = ptype;
    }
    if (propName != null) {
      _result.propName = propName;
    }
    if (propDesc != null) {
      _result.propDesc = propDesc;
    }
    if (propIcon != null) {
      _result.propIcon = propIcon;
    }
    if (propSrc != null) {
      _result.propSrc = propSrc;
    }
    if (topDp != null) {
      _result.topDp = topDp;
    }
    if (leftDp != null) {
      _result.leftDp = leftDp;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    return _result;
  }
  factory UserPropInfoItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserPropInfoItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserPropInfoItem clone() => UserPropInfoItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserPropInfoItem copyWith(void Function(UserPropInfoItem) updates) =>
      super.copyWith((message) => updates(message as UserPropInfoItem))
          as UserPropInfoItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserPropInfoItem create() => UserPropInfoItem._();
  UserPropInfoItem createEmptyInstance() => create();
  static $pb.PbList<UserPropInfoItem> createRepeated() =>
      $pb.PbList<UserPropInfoItem>();
  @$core.pragma('dart2js:noInline')
  static UserPropInfoItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserPropInfoItem>(create);
  static UserPropInfoItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pid => $_getIZ(0);
  @$pb.TagNumber(1)
  set pid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPid() => $_has(0);
  @$pb.TagNumber(1)
  void clearPid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ptype => $_getSZ(1);
  @$pb.TagNumber(2)
  set ptype($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPtype() => $_has(1);
  @$pb.TagNumber(2)
  void clearPtype() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get propName => $_getSZ(2);
  @$pb.TagNumber(3)
  set propName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPropName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPropName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get propDesc => $_getSZ(3);
  @$pb.TagNumber(4)
  set propDesc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPropDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearPropDesc() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get propIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set propIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPropIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearPropIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get propSrc => $_getSZ(5);
  @$pb.TagNumber(6)
  set propSrc($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPropSrc() => $_has(5);
  @$pb.TagNumber(6)
  void clearPropSrc() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get topDp => $_getIZ(6);
  @$pb.TagNumber(7)
  set topDp($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTopDp() => $_has(6);
  @$pb.TagNumber(7)
  void clearTopDp() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get leftDp => $_getIZ(7);
  @$pb.TagNumber(8)
  set leftDp($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLeftDp() => $_has(7);
  @$pb.TagNumber(8)
  void clearLeftDp() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get width => $_getIZ(8);
  @$pb.TagNumber(9)
  set width($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasWidth() => $_has(8);
  @$pb.TagNumber(9)
  void clearWidth() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get height => $_getIZ(9);
  @$pb.TagNumber(10)
  set height($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasHeight() => $_has(9);
  @$pb.TagNumber(10)
  void clearHeight() => clearField(10);
}

class AvatarKtvSingerInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AvatarKtvSingerInfo',
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
            : 'userName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userSingScore',
        $pb.PbFieldType.O3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nowSongId')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nowSongName')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nowLrcUrl')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextSingerUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextSingerName')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextSongId')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextSongName')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nowSongArtist')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerOfflineStatus',
        $pb.PbFieldType.OU3)
    ..m<$core.String, UserPropInfoItem>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propInfos',
        entryClassName: 'AvatarKtvSingerInfo.PropInfosEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: UserPropInfoItem.create,
        packageName: const $pb.PackageName('pb'))
    ..pc<UserAvatarInfo>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userAvatarInfo',
        $pb.PbFieldType.PM,
        subBuilder: UserAvatarInfo.create)
    ..hasRequiredFields = false;

  AvatarKtvSingerInfo._() : super();
  factory AvatarKtvSingerInfo({
    $core.int? uid,
    $core.String? userName,
    $core.String? userIcon,
    $core.int? userSingScore,
    $core.String? nowSongId,
    $core.String? nowSongName,
    $core.String? nowLrcUrl,
    $core.int? nextSingerUid,
    $core.String? nextSingerName,
    $core.String? nextSongId,
    $core.String? nextSongName,
    $core.String? nowSongArtist,
    $core.int? singerOfflineStatus,
    $core.Map<$core.String, UserPropInfoItem>? propInfos,
    $core.Iterable<UserAvatarInfo>? userAvatarInfo,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    if (userSingScore != null) {
      _result.userSingScore = userSingScore;
    }
    if (nowSongId != null) {
      _result.nowSongId = nowSongId;
    }
    if (nowSongName != null) {
      _result.nowSongName = nowSongName;
    }
    if (nowLrcUrl != null) {
      _result.nowLrcUrl = nowLrcUrl;
    }
    if (nextSingerUid != null) {
      _result.nextSingerUid = nextSingerUid;
    }
    if (nextSingerName != null) {
      _result.nextSingerName = nextSingerName;
    }
    if (nextSongId != null) {
      _result.nextSongId = nextSongId;
    }
    if (nextSongName != null) {
      _result.nextSongName = nextSongName;
    }
    if (nowSongArtist != null) {
      _result.nowSongArtist = nowSongArtist;
    }
    if (singerOfflineStatus != null) {
      _result.singerOfflineStatus = singerOfflineStatus;
    }
    if (propInfos != null) {
      _result.propInfos.addAll(propInfos);
    }
    if (userAvatarInfo != null) {
      _result.userAvatarInfo.addAll(userAvatarInfo);
    }
    return _result;
  }
  factory AvatarKtvSingerInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AvatarKtvSingerInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AvatarKtvSingerInfo clone() => AvatarKtvSingerInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AvatarKtvSingerInfo copyWith(void Function(AvatarKtvSingerInfo) updates) =>
      super.copyWith((message) => updates(message as AvatarKtvSingerInfo))
          as AvatarKtvSingerInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AvatarKtvSingerInfo create() => AvatarKtvSingerInfo._();
  AvatarKtvSingerInfo createEmptyInstance() => create();
  static $pb.PbList<AvatarKtvSingerInfo> createRepeated() =>
      $pb.PbList<AvatarKtvSingerInfo>();
  @$core.pragma('dart2js:noInline')
  static AvatarKtvSingerInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvatarKtvSingerInfo>(create);
  static AvatarKtvSingerInfo? _defaultInstance;

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
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set userIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUserIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get userSingScore => $_getIZ(3);
  @$pb.TagNumber(4)
  set userSingScore($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUserSingScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserSingScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get nowSongId => $_getSZ(4);
  @$pb.TagNumber(5)
  set nowSongId($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNowSongId() => $_has(4);
  @$pb.TagNumber(5)
  void clearNowSongId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get nowSongName => $_getSZ(5);
  @$pb.TagNumber(6)
  set nowSongName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNowSongName() => $_has(5);
  @$pb.TagNumber(6)
  void clearNowSongName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get nowLrcUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set nowLrcUrl($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasNowLrcUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearNowLrcUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get nextSingerUid => $_getIZ(7);
  @$pb.TagNumber(8)
  set nextSingerUid($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasNextSingerUid() => $_has(7);
  @$pb.TagNumber(8)
  void clearNextSingerUid() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get nextSingerName => $_getSZ(8);
  @$pb.TagNumber(9)
  set nextSingerName($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasNextSingerName() => $_has(8);
  @$pb.TagNumber(9)
  void clearNextSingerName() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get nextSongId => $_getSZ(9);
  @$pb.TagNumber(10)
  set nextSongId($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasNextSongId() => $_has(9);
  @$pb.TagNumber(10)
  void clearNextSongId() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get nextSongName => $_getSZ(10);
  @$pb.TagNumber(11)
  set nextSongName($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasNextSongName() => $_has(10);
  @$pb.TagNumber(11)
  void clearNextSongName() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get nowSongArtist => $_getSZ(11);
  @$pb.TagNumber(12)
  set nowSongArtist($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasNowSongArtist() => $_has(11);
  @$pb.TagNumber(12)
  void clearNowSongArtist() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get singerOfflineStatus => $_getIZ(12);
  @$pb.TagNumber(13)
  set singerOfflineStatus($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasSingerOfflineStatus() => $_has(12);
  @$pb.TagNumber(13)
  void clearSingerOfflineStatus() => clearField(13);

  @$pb.TagNumber(14)
  $core.Map<$core.String, UserPropInfoItem> get propInfos => $_getMap(13);

  @$pb.TagNumber(15)
  $core.List<UserAvatarInfo> get userAvatarInfo => $_getList(14);
}

class UserAvatarInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserAvatarInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'configId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'config')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'firstCtype',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'firstClassifyId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'secondCtype',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'secondClassifyId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  UserAvatarInfo._() : super();
  factory UserAvatarInfo({
    $core.int? configId,
    $core.String? config,
    $core.int? firstCtype,
    $core.int? firstClassifyId,
    $core.int? secondCtype,
    $core.int? secondClassifyId,
  }) {
    final _result = create();
    if (configId != null) {
      _result.configId = configId;
    }
    if (config != null) {
      _result.config = config;
    }
    if (firstCtype != null) {
      _result.firstCtype = firstCtype;
    }
    if (firstClassifyId != null) {
      _result.firstClassifyId = firstClassifyId;
    }
    if (secondCtype != null) {
      _result.secondCtype = secondCtype;
    }
    if (secondClassifyId != null) {
      _result.secondClassifyId = secondClassifyId;
    }
    return _result;
  }
  factory UserAvatarInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserAvatarInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserAvatarInfo clone() => UserAvatarInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserAvatarInfo copyWith(void Function(UserAvatarInfo) updates) =>
      super.copyWith((message) => updates(message as UserAvatarInfo))
          as UserAvatarInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserAvatarInfo create() => UserAvatarInfo._();
  UserAvatarInfo createEmptyInstance() => create();
  static $pb.PbList<UserAvatarInfo> createRepeated() =>
      $pb.PbList<UserAvatarInfo>();
  @$core.pragma('dart2js:noInline')
  static UserAvatarInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserAvatarInfo>(create);
  static UserAvatarInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get configId => $_getIZ(0);
  @$pb.TagNumber(1)
  set configId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConfigId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfigId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get config => $_getSZ(1);
  @$pb.TagNumber(2)
  set config($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConfig() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfig() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get firstCtype => $_getIZ(2);
  @$pb.TagNumber(3)
  set firstCtype($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFirstCtype() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstCtype() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get firstClassifyId => $_getIZ(3);
  @$pb.TagNumber(4)
  set firstClassifyId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFirstClassifyId() => $_has(3);
  @$pb.TagNumber(4)
  void clearFirstClassifyId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get secondCtype => $_getIZ(4);
  @$pb.TagNumber(5)
  set secondCtype($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSecondCtype() => $_has(4);
  @$pb.TagNumber(5)
  void clearSecondCtype() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get secondClassifyId => $_getIZ(5);
  @$pb.TagNumber(6)
  set secondClassifyId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSecondClassifyId() => $_has(5);
  @$pb.TagNumber(6)
  void clearSecondClassifyId() => clearField(6);
}

class AvatarKtvConfigData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AvatarKtvConfigData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<AvatarKtvConfigDataRoom>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomConfig',
        subBuilder: AvatarKtvConfigDataRoom.create)
    ..aOM<AvatarKtvSingerInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerInfo',
        subBuilder: AvatarKtvSingerInfo.create)
    ..hasRequiredFields = false;

  AvatarKtvConfigData._() : super();
  factory AvatarKtvConfigData({
    AvatarKtvConfigDataRoom? roomConfig,
    AvatarKtvSingerInfo? singerInfo,
  }) {
    final _result = create();
    if (roomConfig != null) {
      _result.roomConfig = roomConfig;
    }
    if (singerInfo != null) {
      _result.singerInfo = singerInfo;
    }
    return _result;
  }
  factory AvatarKtvConfigData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AvatarKtvConfigData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AvatarKtvConfigData clone() => AvatarKtvConfigData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AvatarKtvConfigData copyWith(void Function(AvatarKtvConfigData) updates) =>
      super.copyWith((message) => updates(message as AvatarKtvConfigData))
          as AvatarKtvConfigData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AvatarKtvConfigData create() => AvatarKtvConfigData._();
  AvatarKtvConfigData createEmptyInstance() => create();
  static $pb.PbList<AvatarKtvConfigData> createRepeated() =>
      $pb.PbList<AvatarKtvConfigData>();
  @$core.pragma('dart2js:noInline')
  static AvatarKtvConfigData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvatarKtvConfigData>(create);
  static AvatarKtvConfigData? _defaultInstance;

  @$pb.TagNumber(1)
  AvatarKtvConfigDataRoom get roomConfig => $_getN(0);
  @$pb.TagNumber(1)
  set roomConfig(AvatarKtvConfigDataRoom v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoomConfig() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomConfig() => clearField(1);
  @$pb.TagNumber(1)
  AvatarKtvConfigDataRoom ensureRoomConfig() => $_ensure(0);

  @$pb.TagNumber(2)
  AvatarKtvSingerInfo get singerInfo => $_getN(1);
  @$pb.TagNumber(2)
  set singerInfo(AvatarKtvSingerInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSingerInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearSingerInfo() => clearField(2);
  @$pb.TagNumber(2)
  AvatarKtvSingerInfo ensureSingerInfo() => $_ensure(1);
}

class AvatarKtvOption extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AvatarKtvOption',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recommendFrequency',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'applyMicFrequency',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sycScoreSec',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chooseSongLimitMin',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chooseSongLimitMax',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chooseSongLimitRoom',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AvatarKtvOption._() : super();
  factory AvatarKtvOption({
    $core.int? recommendFrequency,
    $core.int? applyMicFrequency,
    $core.int? sycScoreSec,
    $core.int? chooseSongLimitMin,
    $core.int? chooseSongLimitMax,
    $core.int? chooseSongLimitRoom,
  }) {
    final _result = create();
    if (recommendFrequency != null) {
      _result.recommendFrequency = recommendFrequency;
    }
    if (applyMicFrequency != null) {
      _result.applyMicFrequency = applyMicFrequency;
    }
    if (sycScoreSec != null) {
      _result.sycScoreSec = sycScoreSec;
    }
    if (chooseSongLimitMin != null) {
      _result.chooseSongLimitMin = chooseSongLimitMin;
    }
    if (chooseSongLimitMax != null) {
      _result.chooseSongLimitMax = chooseSongLimitMax;
    }
    if (chooseSongLimitRoom != null) {
      _result.chooseSongLimitRoom = chooseSongLimitRoom;
    }
    return _result;
  }
  factory AvatarKtvOption.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AvatarKtvOption.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AvatarKtvOption clone() => AvatarKtvOption()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AvatarKtvOption copyWith(void Function(AvatarKtvOption) updates) =>
      super.copyWith((message) => updates(message as AvatarKtvOption))
          as AvatarKtvOption; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AvatarKtvOption create() => AvatarKtvOption._();
  AvatarKtvOption createEmptyInstance() => create();
  static $pb.PbList<AvatarKtvOption> createRepeated() =>
      $pb.PbList<AvatarKtvOption>();
  @$core.pragma('dart2js:noInline')
  static AvatarKtvOption getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvatarKtvOption>(create);
  static AvatarKtvOption? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get recommendFrequency => $_getIZ(0);
  @$pb.TagNumber(1)
  set recommendFrequency($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRecommendFrequency() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecommendFrequency() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get applyMicFrequency => $_getIZ(1);
  @$pb.TagNumber(2)
  set applyMicFrequency($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasApplyMicFrequency() => $_has(1);
  @$pb.TagNumber(2)
  void clearApplyMicFrequency() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get sycScoreSec => $_getIZ(2);
  @$pb.TagNumber(3)
  set sycScoreSec($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSycScoreSec() => $_has(2);
  @$pb.TagNumber(3)
  void clearSycScoreSec() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get chooseSongLimitMin => $_getIZ(3);
  @$pb.TagNumber(4)
  set chooseSongLimitMin($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasChooseSongLimitMin() => $_has(3);
  @$pb.TagNumber(4)
  void clearChooseSongLimitMin() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get chooseSongLimitMax => $_getIZ(4);
  @$pb.TagNumber(5)
  set chooseSongLimitMax($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasChooseSongLimitMax() => $_has(4);
  @$pb.TagNumber(5)
  void clearChooseSongLimitMax() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get chooseSongLimitRoom => $_getIZ(5);
  @$pb.TagNumber(6)
  set chooseSongLimitRoom($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasChooseSongLimitRoom() => $_has(5);
  @$pb.TagNumber(6)
  void clearChooseSongLimitRoom() => clearField(6);
}

class AvatarKtvConfigRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AvatarKtvConfigRsp',
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
    ..aOM<AvatarKtvConfigData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AvatarKtvConfigData.create)
    ..aOM<AvatarKtvOption>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'option',
        subBuilder: AvatarKtvOption.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourceType',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AvatarKtvConfigRsp._() : super();
  factory AvatarKtvConfigRsp({
    $core.bool? success,
    $core.String? msg,
    AvatarKtvConfigData? data,
    AvatarKtvOption? option,
    $core.int? sourceType,
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
    if (option != null) {
      _result.option = option;
    }
    if (sourceType != null) {
      _result.sourceType = sourceType;
    }
    return _result;
  }
  factory AvatarKtvConfigRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AvatarKtvConfigRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AvatarKtvConfigRsp clone() => AvatarKtvConfigRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AvatarKtvConfigRsp copyWith(void Function(AvatarKtvConfigRsp) updates) =>
      super.copyWith((message) => updates(message as AvatarKtvConfigRsp))
          as AvatarKtvConfigRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AvatarKtvConfigRsp create() => AvatarKtvConfigRsp._();
  AvatarKtvConfigRsp createEmptyInstance() => create();
  static $pb.PbList<AvatarKtvConfigRsp> createRepeated() =>
      $pb.PbList<AvatarKtvConfigRsp>();
  @$core.pragma('dart2js:noInline')
  static AvatarKtvConfigRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvatarKtvConfigRsp>(create);
  static AvatarKtvConfigRsp? _defaultInstance;

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
  AvatarKtvConfigData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AvatarKtvConfigData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AvatarKtvConfigData ensureData() => $_ensure(2);

  @$pb.TagNumber(4)
  AvatarKtvOption get option => $_getN(3);
  @$pb.TagNumber(4)
  set option(AvatarKtvOption v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOption() => $_has(3);
  @$pb.TagNumber(4)
  void clearOption() => clearField(4);
  @$pb.TagNumber(4)
  AvatarKtvOption ensureOption() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get sourceType => $_getIZ(4);
  @$pb.TagNumber(5)
  set sourceType($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSourceType() => $_has(4);
  @$pb.TagNumber(5)
  void clearSourceType() => clearField(5);
}

class AvatarKtvRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AvatarKtvRefresh',
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
            : 'refreshType')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'operatorUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'operateType')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'beOperatedUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'operateSongId')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'operateSongName')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'willSongListNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasSongListNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AvatarKtvRefresh._() : super();
  factory AvatarKtvRefresh({
    $core.int? rid,
    $core.String? refreshType,
    $core.int? operatorUid,
    $core.String? operateType,
    $core.int? beOperatedUid,
    $core.String? operateSongId,
    $core.String? operateSongName,
    $core.int? willSongListNum,
    $core.int? hasSongListNum,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (refreshType != null) {
      _result.refreshType = refreshType;
    }
    if (operatorUid != null) {
      _result.operatorUid = operatorUid;
    }
    if (operateType != null) {
      _result.operateType = operateType;
    }
    if (beOperatedUid != null) {
      _result.beOperatedUid = beOperatedUid;
    }
    if (operateSongId != null) {
      _result.operateSongId = operateSongId;
    }
    if (operateSongName != null) {
      _result.operateSongName = operateSongName;
    }
    if (willSongListNum != null) {
      _result.willSongListNum = willSongListNum;
    }
    if (hasSongListNum != null) {
      _result.hasSongListNum = hasSongListNum;
    }
    return _result;
  }
  factory AvatarKtvRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AvatarKtvRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AvatarKtvRefresh clone() => AvatarKtvRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AvatarKtvRefresh copyWith(void Function(AvatarKtvRefresh) updates) =>
      super.copyWith((message) => updates(message as AvatarKtvRefresh))
          as AvatarKtvRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AvatarKtvRefresh create() => AvatarKtvRefresh._();
  AvatarKtvRefresh createEmptyInstance() => create();
  static $pb.PbList<AvatarKtvRefresh> createRepeated() =>
      $pb.PbList<AvatarKtvRefresh>();
  @$core.pragma('dart2js:noInline')
  static AvatarKtvRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvatarKtvRefresh>(create);
  static AvatarKtvRefresh? _defaultInstance;

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
  $core.String get refreshType => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshType($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRefreshType() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get operatorUid => $_getIZ(2);
  @$pb.TagNumber(3)
  set operatorUid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOperatorUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearOperatorUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get operateType => $_getSZ(3);
  @$pb.TagNumber(4)
  set operateType($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOperateType() => $_has(3);
  @$pb.TagNumber(4)
  void clearOperateType() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get beOperatedUid => $_getIZ(4);
  @$pb.TagNumber(5)
  set beOperatedUid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBeOperatedUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearBeOperatedUid() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get operateSongId => $_getSZ(5);
  @$pb.TagNumber(6)
  set operateSongId($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOperateSongId() => $_has(5);
  @$pb.TagNumber(6)
  void clearOperateSongId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get operateSongName => $_getSZ(6);
  @$pb.TagNumber(7)
  set operateSongName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOperateSongName() => $_has(6);
  @$pb.TagNumber(7)
  void clearOperateSongName() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get willSongListNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set willSongListNum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasWillSongListNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearWillSongListNum() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get hasSongListNum => $_getIZ(8);
  @$pb.TagNumber(9)
  set hasSongListNum($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasHasSongListNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearHasSongListNum() => clearField(9);
}

class MusicTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MusicTab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'index')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'parent')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..pc<MusicTab>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subTab',
        $pb.PbFieldType.PM,
        protoName: 'subTab',
        subBuilder: MusicTab.create)
    ..hasRequiredFields = false;

  MusicTab._() : super();
  factory MusicTab({
    $core.String? index,
    $core.String? parent,
    $core.String? name,
    $core.Iterable<MusicTab>? subTab,
  }) {
    final _result = create();
    if (index != null) {
      _result.index = index;
    }
    if (parent != null) {
      _result.parent = parent;
    }
    if (name != null) {
      _result.name = name;
    }
    if (subTab != null) {
      _result.subTab.addAll(subTab);
    }
    return _result;
  }
  factory MusicTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MusicTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MusicTab clone() => MusicTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MusicTab copyWith(void Function(MusicTab) updates) =>
      super.copyWith((message) => updates(message as MusicTab))
          as MusicTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MusicTab create() => MusicTab._();
  MusicTab createEmptyInstance() => create();
  static $pb.PbList<MusicTab> createRepeated() => $pb.PbList<MusicTab>();
  @$core.pragma('dart2js:noInline')
  static MusicTab getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MusicTab>(create);
  static MusicTab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get index => $_getSZ(0);
  @$pb.TagNumber(1)
  set index($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get parent => $_getSZ(1);
  @$pb.TagNumber(2)
  set parent($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasParent() => $_has(1);
  @$pb.TagNumber(2)
  void clearParent() => clearField(2);

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
  $core.List<MusicTab> get subTab => $_getList(3);
}

class MusicTabRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MusicTabRsp',
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
    ..pc<MusicTab>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: MusicTab.create)
    ..hasRequiredFields = false;

  MusicTabRsp._() : super();
  factory MusicTabRsp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<MusicTab>? data,
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
  factory MusicTabRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MusicTabRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MusicTabRsp clone() => MusicTabRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MusicTabRsp copyWith(void Function(MusicTabRsp) updates) =>
      super.copyWith((message) => updates(message as MusicTabRsp))
          as MusicTabRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MusicTabRsp create() => MusicTabRsp._();
  MusicTabRsp createEmptyInstance() => create();
  static $pb.PbList<MusicTabRsp> createRepeated() => $pb.PbList<MusicTabRsp>();
  @$core.pragma('dart2js:noInline')
  static MusicTabRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MusicTabRsp>(create);
  static MusicTabRsp? _defaultInstance;

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
  $core.List<MusicTab> get data => $_getList(2);
}

class SongItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SongItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songUrl')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lrcUrl')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bidiUrl')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'coverUrl')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..pPS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerSet')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploader')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chooseName')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'choosed',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chooseUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chooseIcon')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accompanyUrl')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'file')
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourceType',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SongItem._() : super();
  factory SongItem({
    $core.String? songUrl,
    $core.int? duration,
    $core.String? lrcUrl,
    $core.String? bidiUrl,
    $core.String? coverUrl,
    $core.String? id,
    $core.String? name,
    $core.Iterable<$core.String>? singerSet,
    $core.String? uploader,
    $core.String? chooseName,
    $core.int? choosed,
    $core.int? chooseUid,
    $core.String? chooseIcon,
    $core.String? accompanyUrl,
    $core.String? file,
    $core.int? sourceType,
  }) {
    final _result = create();
    if (songUrl != null) {
      _result.songUrl = songUrl;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (lrcUrl != null) {
      _result.lrcUrl = lrcUrl;
    }
    if (bidiUrl != null) {
      _result.bidiUrl = bidiUrl;
    }
    if (coverUrl != null) {
      _result.coverUrl = coverUrl;
    }
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (singerSet != null) {
      _result.singerSet.addAll(singerSet);
    }
    if (uploader != null) {
      _result.uploader = uploader;
    }
    if (chooseName != null) {
      _result.chooseName = chooseName;
    }
    if (choosed != null) {
      _result.choosed = choosed;
    }
    if (chooseUid != null) {
      _result.chooseUid = chooseUid;
    }
    if (chooseIcon != null) {
      _result.chooseIcon = chooseIcon;
    }
    if (accompanyUrl != null) {
      _result.accompanyUrl = accompanyUrl;
    }
    if (file != null) {
      _result.file = file;
    }
    if (sourceType != null) {
      _result.sourceType = sourceType;
    }
    return _result;
  }
  factory SongItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SongItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SongItem clone() => SongItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SongItem copyWith(void Function(SongItem) updates) =>
      super.copyWith((message) => updates(message as SongItem))
          as SongItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongItem create() => SongItem._();
  SongItem createEmptyInstance() => create();
  static $pb.PbList<SongItem> createRepeated() => $pb.PbList<SongItem>();
  @$core.pragma('dart2js:noInline')
  static SongItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SongItem>(create);
  static SongItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get songUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set songUrl($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSongUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get duration => $_getIZ(1);
  @$pb.TagNumber(2)
  set duration($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lrcUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set lrcUrl($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLrcUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearLrcUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get bidiUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set bidiUrl($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBidiUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearBidiUrl() => clearField(4);

  @$pb.TagNumber(6)
  $core.String get coverUrl => $_getSZ(4);
  @$pb.TagNumber(6)
  set coverUrl($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCoverUrl() => $_has(4);
  @$pb.TagNumber(6)
  void clearCoverUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get id => $_getSZ(5);
  @$pb.TagNumber(7)
  set id($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasId() => $_has(5);
  @$pb.TagNumber(7)
  void clearId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get name => $_getSZ(6);
  @$pb.TagNumber(8)
  set name($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasName() => $_has(6);
  @$pb.TagNumber(8)
  void clearName() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.String> get singerSet => $_getList(7);

  @$pb.TagNumber(10)
  $core.String get uploader => $_getSZ(8);
  @$pb.TagNumber(10)
  set uploader($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasUploader() => $_has(8);
  @$pb.TagNumber(10)
  void clearUploader() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get chooseName => $_getSZ(9);
  @$pb.TagNumber(11)
  set chooseName($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasChooseName() => $_has(9);
  @$pb.TagNumber(11)
  void clearChooseName() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get choosed => $_getIZ(10);
  @$pb.TagNumber(12)
  set choosed($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasChoosed() => $_has(10);
  @$pb.TagNumber(12)
  void clearChoosed() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get chooseUid => $_getIZ(11);
  @$pb.TagNumber(13)
  set chooseUid($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasChooseUid() => $_has(11);
  @$pb.TagNumber(13)
  void clearChooseUid() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get chooseIcon => $_getSZ(12);
  @$pb.TagNumber(14)
  set chooseIcon($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasChooseIcon() => $_has(12);
  @$pb.TagNumber(14)
  void clearChooseIcon() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get accompanyUrl => $_getSZ(13);
  @$pb.TagNumber(15)
  set accompanyUrl($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasAccompanyUrl() => $_has(13);
  @$pb.TagNumber(15)
  void clearAccompanyUrl() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get file => $_getSZ(14);
  @$pb.TagNumber(16)
  set file($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasFile() => $_has(14);
  @$pb.TagNumber(16)
  void clearFile() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get sourceType => $_getIZ(15);
  @$pb.TagNumber(17)
  set sourceType($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasSourceType() => $_has(15);
  @$pb.TagNumber(17)
  void clearSourceType() => clearField(17);
}

class SongList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SongList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<SongItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'info',
        $pb.PbFieldType.PM,
        subBuilder: SongItem.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore',
        protoName: 'hasMore')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SongList._() : super();
  factory SongList({
    $core.Iterable<SongItem>? info,
    $core.bool? hasMore,
    $core.int? nextId,
  }) {
    final _result = create();
    if (info != null) {
      _result.info.addAll(info);
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    if (nextId != null) {
      _result.nextId = nextId;
    }
    return _result;
  }
  factory SongList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SongList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SongList clone() => SongList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SongList copyWith(void Function(SongList) updates) =>
      super.copyWith((message) => updates(message as SongList))
          as SongList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongList create() => SongList._();
  SongList createEmptyInstance() => create();
  static $pb.PbList<SongList> createRepeated() => $pb.PbList<SongList>();
  @$core.pragma('dart2js:noInline')
  static SongList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SongList>(create);
  static SongList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SongItem> get info => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get hasMore => $_getBF(1);
  @$pb.TagNumber(2)
  set hasMore($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasMore() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get nextId => $_getIZ(2);
  @$pb.TagNumber(3)
  set nextId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNextId() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextId() => clearField(3);
}

class RespChooseSongList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespChooseSongList',
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
    ..aOM<SongList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SongList.create)
    ..hasRequiredFields = false;

  RespChooseSongList._() : super();
  factory RespChooseSongList({
    $core.bool? success,
    $core.String? msg,
    SongList? data,
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
  factory RespChooseSongList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespChooseSongList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespChooseSongList clone() => RespChooseSongList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespChooseSongList copyWith(void Function(RespChooseSongList) updates) =>
      super.copyWith((message) => updates(message as RespChooseSongList))
          as RespChooseSongList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespChooseSongList create() => RespChooseSongList._();
  RespChooseSongList createEmptyInstance() => create();
  static $pb.PbList<RespChooseSongList> createRepeated() =>
      $pb.PbList<RespChooseSongList>();
  @$core.pragma('dart2js:noInline')
  static RespChooseSongList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespChooseSongList>(create);
  static RespChooseSongList? _defaultInstance;

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
  SongList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SongList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SongList ensureData() => $_ensure(2);
}

class RespChooseSongNum extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespChooseSongNum',
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
    ..aOM<ChooseSongNumInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ChooseSongNumInfo.create)
    ..hasRequiredFields = false;

  RespChooseSongNum._() : super();
  factory RespChooseSongNum({
    $core.bool? success,
    $core.String? msg,
    ChooseSongNumInfo? data,
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
  factory RespChooseSongNum.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespChooseSongNum.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespChooseSongNum clone() => RespChooseSongNum()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespChooseSongNum copyWith(void Function(RespChooseSongNum) updates) =>
      super.copyWith((message) => updates(message as RespChooseSongNum))
          as RespChooseSongNum; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespChooseSongNum create() => RespChooseSongNum._();
  RespChooseSongNum createEmptyInstance() => create();
  static $pb.PbList<RespChooseSongNum> createRepeated() =>
      $pb.PbList<RespChooseSongNum>();
  @$core.pragma('dart2js:noInline')
  static RespChooseSongNum getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespChooseSongNum>(create);
  static RespChooseSongNum? _defaultInstance;

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
  ChooseSongNumInfo get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ChooseSongNumInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ChooseSongNumInfo ensureData() => $_ensure(2);
}

class ChooseSongNumInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ChooseSongNumInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userSongNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomSongNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ChooseSongNumInfo._() : super();
  factory ChooseSongNumInfo({
    $core.int? userSongNum,
    $core.int? roomSongNum,
  }) {
    final _result = create();
    if (userSongNum != null) {
      _result.userSongNum = userSongNum;
    }
    if (roomSongNum != null) {
      _result.roomSongNum = roomSongNum;
    }
    return _result;
  }
  factory ChooseSongNumInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChooseSongNumInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChooseSongNumInfo clone() => ChooseSongNumInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChooseSongNumInfo copyWith(void Function(ChooseSongNumInfo) updates) =>
      super.copyWith((message) => updates(message as ChooseSongNumInfo))
          as ChooseSongNumInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChooseSongNumInfo create() => ChooseSongNumInfo._();
  ChooseSongNumInfo createEmptyInstance() => create();
  static $pb.PbList<ChooseSongNumInfo> createRepeated() =>
      $pb.PbList<ChooseSongNumInfo>();
  @$core.pragma('dart2js:noInline')
  static ChooseSongNumInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChooseSongNumInfo>(create);
  static ChooseSongNumInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userSongNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set userSongNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserSongNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserSongNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get roomSongNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set roomSongNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoomSongNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomSongNum() => clearField(2);
}

class RspAvatarPropListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspAvatarPropListItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ptype')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propName')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propDesc')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propIcon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propSrc')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topDp',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftDp',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RspAvatarPropListItem._() : super();
  factory RspAvatarPropListItem({
    $core.int? pid,
    $core.String? ptype,
    $core.String? propName,
    $core.String? propDesc,
    $core.String? propIcon,
    $core.String? propSrc,
    $core.int? topDp,
    $core.int? leftDp,
    $core.int? width,
    $core.int? height,
  }) {
    final _result = create();
    if (pid != null) {
      _result.pid = pid;
    }
    if (ptype != null) {
      _result.ptype = ptype;
    }
    if (propName != null) {
      _result.propName = propName;
    }
    if (propDesc != null) {
      _result.propDesc = propDesc;
    }
    if (propIcon != null) {
      _result.propIcon = propIcon;
    }
    if (propSrc != null) {
      _result.propSrc = propSrc;
    }
    if (topDp != null) {
      _result.topDp = topDp;
    }
    if (leftDp != null) {
      _result.leftDp = leftDp;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    return _result;
  }
  factory RspAvatarPropListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspAvatarPropListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspAvatarPropListItem clone() =>
      RspAvatarPropListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspAvatarPropListItem copyWith(
          void Function(RspAvatarPropListItem) updates) =>
      super.copyWith((message) => updates(message as RspAvatarPropListItem))
          as RspAvatarPropListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspAvatarPropListItem create() => RspAvatarPropListItem._();
  RspAvatarPropListItem createEmptyInstance() => create();
  static $pb.PbList<RspAvatarPropListItem> createRepeated() =>
      $pb.PbList<RspAvatarPropListItem>();
  @$core.pragma('dart2js:noInline')
  static RspAvatarPropListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RspAvatarPropListItem>(create);
  static RspAvatarPropListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pid => $_getIZ(0);
  @$pb.TagNumber(1)
  set pid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPid() => $_has(0);
  @$pb.TagNumber(1)
  void clearPid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ptype => $_getSZ(1);
  @$pb.TagNumber(2)
  set ptype($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPtype() => $_has(1);
  @$pb.TagNumber(2)
  void clearPtype() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get propName => $_getSZ(2);
  @$pb.TagNumber(3)
  set propName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPropName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPropName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get propDesc => $_getSZ(3);
  @$pb.TagNumber(4)
  set propDesc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPropDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearPropDesc() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get propIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set propIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPropIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearPropIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get propSrc => $_getSZ(5);
  @$pb.TagNumber(6)
  set propSrc($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPropSrc() => $_has(5);
  @$pb.TagNumber(6)
  void clearPropSrc() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get topDp => $_getIZ(6);
  @$pb.TagNumber(7)
  set topDp($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTopDp() => $_has(6);
  @$pb.TagNumber(7)
  void clearTopDp() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get leftDp => $_getIZ(7);
  @$pb.TagNumber(8)
  set leftDp($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLeftDp() => $_has(7);
  @$pb.TagNumber(8)
  void clearLeftDp() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get width => $_getIZ(8);
  @$pb.TagNumber(9)
  set width($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasWidth() => $_has(8);
  @$pb.TagNumber(9)
  void clearWidth() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get height => $_getIZ(9);
  @$pb.TagNumber(10)
  set height($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasHeight() => $_has(9);
  @$pb.TagNumber(10)
  void clearHeight() => clearField(10);
}

class RspAvatarPropList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspAvatarPropList',
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
    ..pc<RspAvatarPropListItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: RspAvatarPropListItem.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dressOn',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RspAvatarPropList._() : super();
  factory RspAvatarPropList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<RspAvatarPropListItem>? data,
    $core.int? dressOn,
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
    if (dressOn != null) {
      _result.dressOn = dressOn;
    }
    return _result;
  }
  factory RspAvatarPropList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspAvatarPropList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspAvatarPropList clone() => RspAvatarPropList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspAvatarPropList copyWith(void Function(RspAvatarPropList) updates) =>
      super.copyWith((message) => updates(message as RspAvatarPropList))
          as RspAvatarPropList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspAvatarPropList create() => RspAvatarPropList._();
  RspAvatarPropList createEmptyInstance() => create();
  static $pb.PbList<RspAvatarPropList> createRepeated() =>
      $pb.PbList<RspAvatarPropList>();
  @$core.pragma('dart2js:noInline')
  static RspAvatarPropList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RspAvatarPropList>(create);
  static RspAvatarPropList? _defaultInstance;

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
  $core.List<RspAvatarPropListItem> get data => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get dressOn => $_getIZ(3);
  @$pb.TagNumber(4)
  set dressOn($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDressOn() => $_has(3);
  @$pb.TagNumber(4)
  void clearDressOn() => clearField(4);
}
