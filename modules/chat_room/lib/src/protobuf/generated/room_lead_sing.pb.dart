///
//  Generated code. Do not modify.
//  source: room_lead_sing.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'room_lead_sing.pbenum.dart';

export 'room_lead_sing.pbenum.dart';

class SingUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SingUser',
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
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
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
            : 'hot',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SingUser._() : super();
  factory SingUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.int? hot,
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
    if (sex != null) {
      _result.sex = sex;
    }
    if (hot != null) {
      _result.hot = hot;
    }
    return _result;
  }
  factory SingUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SingUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SingUser clone() => SingUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SingUser copyWith(void Function(SingUser) updates) =>
      super.copyWith((message) => updates(message as SingUser))
          as SingUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SingUser create() => SingUser._();
  SingUser createEmptyInstance() => create();
  static $pb.PbList<SingUser> createRepeated() => $pb.PbList<SingUser>();
  @$core.pragma('dart2js:noInline')
  static SingUser getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SingUser>(create);
  static SingUser? _defaultInstance;

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
  $core.int get hot => $_getIZ(4);
  @$pb.TagNumber(5)
  set hot($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHot() => $_has(4);
  @$pb.TagNumber(5)
  void clearHot() => clearField(5);
}

class SongPoint extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SongPoint',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pointId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pointVal',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SongPoint._() : super();
  factory SongPoint({
    $core.int? pointId,
    $core.int? pointVal,
  }) {
    final _result = create();
    if (pointId != null) {
      _result.pointId = pointId;
    }
    if (pointVal != null) {
      _result.pointVal = pointVal;
    }
    return _result;
  }
  factory SongPoint.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SongPoint.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SongPoint clone() => SongPoint()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SongPoint copyWith(void Function(SongPoint) updates) =>
      super.copyWith((message) => updates(message as SongPoint))
          as SongPoint; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongPoint create() => SongPoint._();
  SongPoint createEmptyInstance() => create();
  static $pb.PbList<SongPoint> createRepeated() => $pb.PbList<SongPoint>();
  @$core.pragma('dart2js:noInline')
  static SongPoint getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SongPoint>(create);
  static SongPoint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pointId => $_getIZ(0);
  @$pb.TagNumber(1)
  set pointId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPointId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPointId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pointVal => $_getIZ(1);
  @$pb.TagNumber(2)
  set pointVal($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPointVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearPointVal() => clearField(2);
}

class SongInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SongInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songId')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songLrcUrl')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songUrl')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..pc<SongPoint>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'point',
        $pb.PbFieldType.PM,
        subBuilder: SongPoint.create)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accompanyUrl')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'artistName')
    ..hasRequiredFields = false;

  SongInfo._() : super();
  factory SongInfo({
    $core.String? songId,
    $core.String? songName,
    $core.String? songLrcUrl,
    $core.String? songUrl,
    $core.int? duration,
    $core.Iterable<SongPoint>? point,
    $core.String? accompanyUrl,
    $core.String? artistName,
  }) {
    final _result = create();
    if (songId != null) {
      _result.songId = songId;
    }
    if (songName != null) {
      _result.songName = songName;
    }
    if (songLrcUrl != null) {
      _result.songLrcUrl = songLrcUrl;
    }
    if (songUrl != null) {
      _result.songUrl = songUrl;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (point != null) {
      _result.point.addAll(point);
    }
    if (accompanyUrl != null) {
      _result.accompanyUrl = accompanyUrl;
    }
    if (artistName != null) {
      _result.artistName = artistName;
    }
    return _result;
  }
  factory SongInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SongInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SongInfo clone() => SongInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SongInfo copyWith(void Function(SongInfo) updates) =>
      super.copyWith((message) => updates(message as SongInfo))
          as SongInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongInfo create() => SongInfo._();
  SongInfo createEmptyInstance() => create();
  static $pb.PbList<SongInfo> createRepeated() => $pb.PbList<SongInfo>();
  @$core.pragma('dart2js:noInline')
  static SongInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SongInfo>(create);
  static SongInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get songId => $_getSZ(0);
  @$pb.TagNumber(1)
  set songId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSongId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get songName => $_getSZ(1);
  @$pb.TagNumber(2)
  set songName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSongName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSongName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get songLrcUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set songLrcUrl($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSongLrcUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearSongLrcUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get songUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set songUrl($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSongUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearSongUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get duration => $_getIZ(4);
  @$pb.TagNumber(5)
  set duration($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuration() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<SongPoint> get point => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get accompanyUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set accompanyUrl($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAccompanyUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearAccompanyUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get artistName => $_getSZ(7);
  @$pb.TagNumber(8)
  set artistName($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasArtistName() => $_has(7);
  @$pb.TagNumber(8)
  void clearArtistName() => clearField(8);
}

class LeadSingConfigData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LeadSingConfigData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..e<LeadSingState>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomState',
        $pb.PbFieldType.OE,
        defaultOrMaker: LeadSingState.LEAD_SING_STATE_INIT,
        valueOf: LeadSingState.valueOf,
        enumValues: LeadSingState.values)
    ..aOM<SongInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songInfo',
        subBuilder: SongInfo.create)
    ..aOM<SingUser>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leadUser',
        subBuilder: SingUser.create)
    ..aOM<SingUser>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partnerUser',
        subBuilder: SingUser.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cycleId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'orderNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  LeadSingConfigData._() : super();
  factory LeadSingConfigData({
    LeadSingState? roomState,
    SongInfo? songInfo,
    SingUser? leadUser,
    SingUser? partnerUser,
    $core.int? cycleId,
    $core.int? orderNum,
  }) {
    final _result = create();
    if (roomState != null) {
      _result.roomState = roomState;
    }
    if (songInfo != null) {
      _result.songInfo = songInfo;
    }
    if (leadUser != null) {
      _result.leadUser = leadUser;
    }
    if (partnerUser != null) {
      _result.partnerUser = partnerUser;
    }
    if (cycleId != null) {
      _result.cycleId = cycleId;
    }
    if (orderNum != null) {
      _result.orderNum = orderNum;
    }
    return _result;
  }
  factory LeadSingConfigData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LeadSingConfigData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LeadSingConfigData clone() => LeadSingConfigData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LeadSingConfigData copyWith(void Function(LeadSingConfigData) updates) =>
      super.copyWith((message) => updates(message as LeadSingConfigData))
          as LeadSingConfigData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LeadSingConfigData create() => LeadSingConfigData._();
  LeadSingConfigData createEmptyInstance() => create();
  static $pb.PbList<LeadSingConfigData> createRepeated() =>
      $pb.PbList<LeadSingConfigData>();
  @$core.pragma('dart2js:noInline')
  static LeadSingConfigData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeadSingConfigData>(create);
  static LeadSingConfigData? _defaultInstance;

  @$pb.TagNumber(1)
  LeadSingState get roomState => $_getN(0);
  @$pb.TagNumber(1)
  set roomState(LeadSingState v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoomState() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomState() => clearField(1);

  @$pb.TagNumber(2)
  SongInfo get songInfo => $_getN(1);
  @$pb.TagNumber(2)
  set songInfo(SongInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSongInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearSongInfo() => clearField(2);
  @$pb.TagNumber(2)
  SongInfo ensureSongInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  SingUser get leadUser => $_getN(2);
  @$pb.TagNumber(3)
  set leadUser(SingUser v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLeadUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeadUser() => clearField(3);
  @$pb.TagNumber(3)
  SingUser ensureLeadUser() => $_ensure(2);

  @$pb.TagNumber(4)
  SingUser get partnerUser => $_getN(3);
  @$pb.TagNumber(4)
  set partnerUser(SingUser v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPartnerUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearPartnerUser() => clearField(4);
  @$pb.TagNumber(4)
  SingUser ensurePartnerUser() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get cycleId => $_getIZ(4);
  @$pb.TagNumber(5)
  set cycleId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCycleId() => $_has(4);
  @$pb.TagNumber(5)
  void clearCycleId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get orderNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set orderNum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOrderNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderNum() => clearField(6);
}

class ResLeadSingConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResLeadSingConfig',
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
    ..aOM<LeadSingConfigData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: LeadSingConfigData.create)
    ..hasRequiredFields = false;

  ResLeadSingConfig._() : super();
  factory ResLeadSingConfig({
    $core.bool? success,
    $core.String? msg,
    LeadSingConfigData? data,
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
  factory ResLeadSingConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResLeadSingConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResLeadSingConfig clone() => ResLeadSingConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResLeadSingConfig copyWith(void Function(ResLeadSingConfig) updates) =>
      super.copyWith((message) => updates(message as ResLeadSingConfig))
          as ResLeadSingConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResLeadSingConfig create() => ResLeadSingConfig._();
  ResLeadSingConfig createEmptyInstance() => create();
  static $pb.PbList<ResLeadSingConfig> createRepeated() =>
      $pb.PbList<ResLeadSingConfig>();
  @$core.pragma('dart2js:noInline')
  static ResLeadSingConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResLeadSingConfig>(create);
  static ResLeadSingConfig? _defaultInstance;

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
  LeadSingConfigData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(LeadSingConfigData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  LeadSingConfigData ensureData() => $_ensure(2);
}

class LeadSingSongNumData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LeadSingSongNumData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'orderNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  LeadSingSongNumData._() : super();
  factory LeadSingSongNumData({
    $core.int? orderNum,
  }) {
    final _result = create();
    if (orderNum != null) {
      _result.orderNum = orderNum;
    }
    return _result;
  }
  factory LeadSingSongNumData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LeadSingSongNumData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LeadSingSongNumData clone() => LeadSingSongNumData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LeadSingSongNumData copyWith(void Function(LeadSingSongNumData) updates) =>
      super.copyWith((message) => updates(message as LeadSingSongNumData))
          as LeadSingSongNumData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LeadSingSongNumData create() => LeadSingSongNumData._();
  LeadSingSongNumData createEmptyInstance() => create();
  static $pb.PbList<LeadSingSongNumData> createRepeated() =>
      $pb.PbList<LeadSingSongNumData>();
  @$core.pragma('dart2js:noInline')
  static LeadSingSongNumData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeadSingSongNumData>(create);
  static LeadSingSongNumData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get orderNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set orderNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOrderNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderNum() => clearField(1);
}

class LeadSingUserHotData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LeadSingUserHotData',
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
            : 'hot',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  LeadSingUserHotData._() : super();
  factory LeadSingUserHotData({
    $core.int? uid,
    $core.int? hot,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (hot != null) {
      _result.hot = hot;
    }
    return _result;
  }
  factory LeadSingUserHotData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LeadSingUserHotData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LeadSingUserHotData clone() => LeadSingUserHotData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LeadSingUserHotData copyWith(void Function(LeadSingUserHotData) updates) =>
      super.copyWith((message) => updates(message as LeadSingUserHotData))
          as LeadSingUserHotData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LeadSingUserHotData create() => LeadSingUserHotData._();
  LeadSingUserHotData createEmptyInstance() => create();
  static $pb.PbList<LeadSingUserHotData> createRepeated() =>
      $pb.PbList<LeadSingUserHotData>();
  @$core.pragma('dart2js:noInline')
  static LeadSingUserHotData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeadSingUserHotData>(create);
  static LeadSingUserHotData? _defaultInstance;

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
  $core.int get hot => $_getIZ(1);
  @$pb.TagNumber(2)
  set hot($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHot() => $_has(1);
  @$pb.TagNumber(2)
  void clearHot() => clearField(2);
}

class LeadRankRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LeadRankRsp',
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
    ..pc<LeadRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: LeadRankData.create)
    ..hasRequiredFields = false;

  LeadRankRsp._() : super();
  factory LeadRankRsp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<LeadRankData>? data,
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
  factory LeadRankRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LeadRankRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LeadRankRsp clone() => LeadRankRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LeadRankRsp copyWith(void Function(LeadRankRsp) updates) =>
      super.copyWith((message) => updates(message as LeadRankRsp))
          as LeadRankRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LeadRankRsp create() => LeadRankRsp._();
  LeadRankRsp createEmptyInstance() => create();
  static $pb.PbList<LeadRankRsp> createRepeated() => $pb.PbList<LeadRankRsp>();
  @$core.pragma('dart2js:noInline')
  static LeadRankRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeadRankRsp>(create);
  static LeadRankRsp? _defaultInstance;

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
  $core.List<LeadRankData> get data => $_getList(2);
}

class LeadRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LeadRankData',
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
            : 'rankId',
        $pb.PbFieldType.OU3,
        protoName: 'rankId')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hot',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  LeadRankData._() : super();
  factory LeadRankData({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
    $core.int? rankId,
    $core.int? hot,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (rankId != null) {
      _result.rankId = rankId;
    }
    if (hot != null) {
      _result.hot = hot;
    }
    return _result;
  }
  factory LeadRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LeadRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LeadRankData clone() => LeadRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LeadRankData copyWith(void Function(LeadRankData) updates) =>
      super.copyWith((message) => updates(message as LeadRankData))
          as LeadRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LeadRankData create() => LeadRankData._();
  LeadRankData createEmptyInstance() => create();
  static $pb.PbList<LeadRankData> createRepeated() =>
      $pb.PbList<LeadRankData>();
  @$core.pragma('dart2js:noInline')
  static LeadRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeadRankData>(create);
  static LeadRankData? _defaultInstance;

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
  $core.int get rankId => $_getIZ(3);
  @$pb.TagNumber(4)
  set rankId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRankId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRankId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get hot => $_getIZ(4);
  @$pb.TagNumber(5)
  set hot($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHot() => $_has(4);
  @$pb.TagNumber(5)
  void clearHot() => clearField(5);
}
