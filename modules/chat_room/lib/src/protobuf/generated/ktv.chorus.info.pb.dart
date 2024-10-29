///
//  Generated code. Do not modify.
//  source: ktv.chorus.info.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ResKtvChorusConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResKtvChorusConfig',
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
    ..aOM<KtvChorusConfigData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: KtvChorusConfigData.create)
    ..hasRequiredFields = false;

  ResKtvChorusConfig._() : super();
  factory ResKtvChorusConfig({
    $core.bool? success,
    $core.String? msg,
    KtvChorusConfigData? data,
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
  factory ResKtvChorusConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResKtvChorusConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResKtvChorusConfig clone() => ResKtvChorusConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResKtvChorusConfig copyWith(void Function(ResKtvChorusConfig) updates) =>
      super.copyWith((message) => updates(message as ResKtvChorusConfig))
          as ResKtvChorusConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResKtvChorusConfig create() => ResKtvChorusConfig._();
  ResKtvChorusConfig createEmptyInstance() => create();
  static $pb.PbList<ResKtvChorusConfig> createRepeated() =>
      $pb.PbList<ResKtvChorusConfig>();
  @$core.pragma('dart2js:noInline')
  static ResKtvChorusConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResKtvChorusConfig>(create);
  static ResKtvChorusConfig? _defaultInstance;

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
  KtvChorusConfigData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(KtvChorusConfigData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  KtvChorusConfigData ensureData() => $_ensure(2);
}

class KtvChorusConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvChorusConfig',
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
    ..aOM<KtvChorusConfigData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ktvChorusInfo',
        subBuilder: KtvChorusConfigData.create)
    ..hasRequiredFields = false;

  KtvChorusConfig._() : super();
  factory KtvChorusConfig({
    $core.int? rid,
    KtvChorusConfigData? ktvChorusInfo,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (ktvChorusInfo != null) {
      _result.ktvChorusInfo = ktvChorusInfo;
    }
    return _result;
  }
  factory KtvChorusConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvChorusConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvChorusConfig clone() => KtvChorusConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvChorusConfig copyWith(void Function(KtvChorusConfig) updates) =>
      super.copyWith((message) => updates(message as KtvChorusConfig))
          as KtvChorusConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvChorusConfig create() => KtvChorusConfig._();
  KtvChorusConfig createEmptyInstance() => create();
  static $pb.PbList<KtvChorusConfig> createRepeated() =>
      $pb.PbList<KtvChorusConfig>();
  @$core.pragma('dart2js:noInline')
  static KtvChorusConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvChorusConfig>(create);
  static KtvChorusConfig? _defaultInstance;

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
  KtvChorusConfigData get ktvChorusInfo => $_getN(1);
  @$pb.TagNumber(2)
  set ktvChorusInfo(KtvChorusConfigData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasKtvChorusInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearKtvChorusInfo() => clearField(2);
  @$pb.TagNumber(2)
  KtvChorusConfigData ensureKtvChorusInfo() => $_ensure(1);
}

class KtvChorusConfigData_OffMicList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvChorusConfigData.OffMicList',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..hasRequiredFields = false;

  KtvChorusConfigData_OffMicList._() : super();
  factory KtvChorusConfigData_OffMicList({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? frame,
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
    if (frame != null) {
      _result.frame = frame;
    }
    return _result;
  }
  factory KtvChorusConfigData_OffMicList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvChorusConfigData_OffMicList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvChorusConfigData_OffMicList clone() =>
      KtvChorusConfigData_OffMicList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvChorusConfigData_OffMicList copyWith(
          void Function(KtvChorusConfigData_OffMicList) updates) =>
      super.copyWith(
              (message) => updates(message as KtvChorusConfigData_OffMicList))
          as KtvChorusConfigData_OffMicList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvChorusConfigData_OffMicList create() =>
      KtvChorusConfigData_OffMicList._();
  KtvChorusConfigData_OffMicList createEmptyInstance() => create();
  static $pb.PbList<KtvChorusConfigData_OffMicList> createRepeated() =>
      $pb.PbList<KtvChorusConfigData_OffMicList>();
  @$core.pragma('dart2js:noInline')
  static KtvChorusConfigData_OffMicList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvChorusConfigData_OffMicList>(create);
  static KtvChorusConfigData_OffMicList? _defaultInstance;

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
  $core.String get frame => $_getSZ(3);
  @$pb.TagNumber(4)
  set frame($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFrame() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrame() => clearField(4);
}

class KtvChorusConfigData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvChorusConfigData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propShowTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propUseTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'listCount',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pid')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appkey')
    ..aOM<KtvChorusConfigDataCurrentSong>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentSong',
        subBuilder: KtvChorusConfigDataCurrentSong.create)
    ..pPS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songList')
    ..pc<KtvChorusConfigDataChorusUser>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chorusUser',
        $pb.PbFieldType.PM,
        subBuilder: KtvChorusConfigDataChorusUser.create)
    ..aOM<KtvChorusConfigDataSongDetail>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songDetail',
        subBuilder: KtvChorusConfigDataSongDetail.create)
    ..pc<KtvChorusConfigData_OffMicList>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'offMicList',
        $pb.PbFieldType.PM,
        subBuilder: KtvChorusConfigData_OffMicList.create)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'agoraSubChannelToken')
    ..hasRequiredFields = false;

  KtvChorusConfigData._() : super();
  factory KtvChorusConfigData({
    $core.int? propShowTime,
    $core.int? propUseTime,
    $core.int? listCount,
    $core.String? pid,
    $core.String? appkey,
    KtvChorusConfigDataCurrentSong? currentSong,
    $core.Iterable<$core.String>? songList,
    $core.Iterable<KtvChorusConfigDataChorusUser>? chorusUser,
    KtvChorusConfigDataSongDetail? songDetail,
    $core.Iterable<KtvChorusConfigData_OffMicList>? offMicList,
    $core.String? agoraSubChannelToken,
  }) {
    final _result = create();
    if (propShowTime != null) {
      _result.propShowTime = propShowTime;
    }
    if (propUseTime != null) {
      _result.propUseTime = propUseTime;
    }
    if (listCount != null) {
      _result.listCount = listCount;
    }
    if (pid != null) {
      _result.pid = pid;
    }
    if (appkey != null) {
      _result.appkey = appkey;
    }
    if (currentSong != null) {
      _result.currentSong = currentSong;
    }
    if (songList != null) {
      _result.songList.addAll(songList);
    }
    if (chorusUser != null) {
      _result.chorusUser.addAll(chorusUser);
    }
    if (songDetail != null) {
      _result.songDetail = songDetail;
    }
    if (offMicList != null) {
      _result.offMicList.addAll(offMicList);
    }
    if (agoraSubChannelToken != null) {
      _result.agoraSubChannelToken = agoraSubChannelToken;
    }
    return _result;
  }
  factory KtvChorusConfigData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvChorusConfigData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvChorusConfigData clone() => KtvChorusConfigData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvChorusConfigData copyWith(void Function(KtvChorusConfigData) updates) =>
      super.copyWith((message) => updates(message as KtvChorusConfigData))
          as KtvChorusConfigData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvChorusConfigData create() => KtvChorusConfigData._();
  KtvChorusConfigData createEmptyInstance() => create();
  static $pb.PbList<KtvChorusConfigData> createRepeated() =>
      $pb.PbList<KtvChorusConfigData>();
  @$core.pragma('dart2js:noInline')
  static KtvChorusConfigData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvChorusConfigData>(create);
  static KtvChorusConfigData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get propShowTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set propShowTime($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPropShowTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearPropShowTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get propUseTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set propUseTime($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPropUseTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearPropUseTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get listCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set listCount($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasListCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearListCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get pid => $_getSZ(3);
  @$pb.TagNumber(4)
  set pid($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPid() => $_has(3);
  @$pb.TagNumber(4)
  void clearPid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get appkey => $_getSZ(4);
  @$pb.TagNumber(5)
  set appkey($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAppkey() => $_has(4);
  @$pb.TagNumber(5)
  void clearAppkey() => clearField(5);

  @$pb.TagNumber(6)
  KtvChorusConfigDataCurrentSong get currentSong => $_getN(5);
  @$pb.TagNumber(6)
  set currentSong(KtvChorusConfigDataCurrentSong v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCurrentSong() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurrentSong() => clearField(6);
  @$pb.TagNumber(6)
  KtvChorusConfigDataCurrentSong ensureCurrentSong() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.List<$core.String> get songList => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<KtvChorusConfigDataChorusUser> get chorusUser => $_getList(7);

  @$pb.TagNumber(9)
  KtvChorusConfigDataSongDetail get songDetail => $_getN(8);
  @$pb.TagNumber(9)
  set songDetail(KtvChorusConfigDataSongDetail v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSongDetail() => $_has(8);
  @$pb.TagNumber(9)
  void clearSongDetail() => clearField(9);
  @$pb.TagNumber(9)
  KtvChorusConfigDataSongDetail ensureSongDetail() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.List<KtvChorusConfigData_OffMicList> get offMicList => $_getList(9);

  @$pb.TagNumber(11)
  $core.String get agoraSubChannelToken => $_getSZ(10);
  @$pb.TagNumber(11)
  set agoraSubChannelToken($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasAgoraSubChannelToken() => $_has(10);
  @$pb.TagNumber(11)
  void clearAgoraSubChannelToken() => clearField(11);
}

class KtvChorusConfigDataCurrentSong extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvChorusConfigDataCurrentSong',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'brc')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'backTrack',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'brcProgress',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerName')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sid',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sname')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status')
    ..a<$fixnum.Int64>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countDown',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platform')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platformSongId')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platformRankId')
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'needReport',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekMusicalNotes',
        $pb.PbFieldType.OU3)
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rtcStreamId')
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chorusSwitch',
        $pb.PbFieldType.OU3)
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'musicId')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pitchLine')
    ..hasRequiredFields = false;

  KtvChorusConfigDataCurrentSong._() : super();
  factory KtvChorusConfigDataCurrentSong({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? brc,
    $core.int? backTrack,
    $core.int? playTime,
    $core.int? brcProgress,
    $core.String? singerName,
    $core.int? sid,
    $core.String? sname,
    $core.String? status,
    $fixnum.Int64? countDown,
    $core.String? platform,
    $core.String? platformSongId,
    $core.String? platformRankId,
    $core.int? needReport,
    $core.int? weekMusicalNotes,
    $core.String? rtcStreamId,
    $core.int? chorusSwitch,
    $core.String? musicId,
    $core.String? pitchLine,
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
    if (brc != null) {
      _result.brc = brc;
    }
    if (backTrack != null) {
      _result.backTrack = backTrack;
    }
    if (playTime != null) {
      _result.playTime = playTime;
    }
    if (brcProgress != null) {
      _result.brcProgress = brcProgress;
    }
    if (singerName != null) {
      _result.singerName = singerName;
    }
    if (sid != null) {
      _result.sid = sid;
    }
    if (sname != null) {
      _result.sname = sname;
    }
    if (status != null) {
      _result.status = status;
    }
    if (countDown != null) {
      _result.countDown = countDown;
    }
    if (platform != null) {
      _result.platform = platform;
    }
    if (platformSongId != null) {
      _result.platformSongId = platformSongId;
    }
    if (platformRankId != null) {
      _result.platformRankId = platformRankId;
    }
    if (needReport != null) {
      _result.needReport = needReport;
    }
    if (weekMusicalNotes != null) {
      _result.weekMusicalNotes = weekMusicalNotes;
    }
    if (rtcStreamId != null) {
      _result.rtcStreamId = rtcStreamId;
    }
    if (chorusSwitch != null) {
      _result.chorusSwitch = chorusSwitch;
    }
    if (musicId != null) {
      _result.musicId = musicId;
    }
    if (pitchLine != null) {
      _result.pitchLine = pitchLine;
    }
    return _result;
  }
  factory KtvChorusConfigDataCurrentSong.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvChorusConfigDataCurrentSong.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvChorusConfigDataCurrentSong clone() =>
      KtvChorusConfigDataCurrentSong()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvChorusConfigDataCurrentSong copyWith(
          void Function(KtvChorusConfigDataCurrentSong) updates) =>
      super.copyWith(
              (message) => updates(message as KtvChorusConfigDataCurrentSong))
          as KtvChorusConfigDataCurrentSong; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvChorusConfigDataCurrentSong create() =>
      KtvChorusConfigDataCurrentSong._();
  KtvChorusConfigDataCurrentSong createEmptyInstance() => create();
  static $pb.PbList<KtvChorusConfigDataCurrentSong> createRepeated() =>
      $pb.PbList<KtvChorusConfigDataCurrentSong>();
  @$core.pragma('dart2js:noInline')
  static KtvChorusConfigDataCurrentSong getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvChorusConfigDataCurrentSong>(create);
  static KtvChorusConfigDataCurrentSong? _defaultInstance;

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
  $core.String get brc => $_getSZ(3);
  @$pb.TagNumber(4)
  set brc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBrc() => $_has(3);
  @$pb.TagNumber(4)
  void clearBrc() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get backTrack => $_getIZ(4);
  @$pb.TagNumber(5)
  set backTrack($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBackTrack() => $_has(4);
  @$pb.TagNumber(5)
  void clearBackTrack() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get playTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set playTime($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPlayTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearPlayTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get brcProgress => $_getIZ(6);
  @$pb.TagNumber(7)
  set brcProgress($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBrcProgress() => $_has(6);
  @$pb.TagNumber(7)
  void clearBrcProgress() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get singerName => $_getSZ(7);
  @$pb.TagNumber(8)
  set singerName($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSingerName() => $_has(7);
  @$pb.TagNumber(8)
  void clearSingerName() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get sid => $_getIZ(8);
  @$pb.TagNumber(9)
  set sid($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSid() => $_has(8);
  @$pb.TagNumber(9)
  void clearSid() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get sname => $_getSZ(9);
  @$pb.TagNumber(10)
  set sname($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasSname() => $_has(9);
  @$pb.TagNumber(10)
  void clearSname() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get status => $_getSZ(10);
  @$pb.TagNumber(11)
  set status($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearStatus() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get countDown => $_getI64(11);
  @$pb.TagNumber(12)
  set countDown($fixnum.Int64 v) {
    $_setInt64(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasCountDown() => $_has(11);
  @$pb.TagNumber(12)
  void clearCountDown() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get platform => $_getSZ(12);
  @$pb.TagNumber(13)
  set platform($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasPlatform() => $_has(12);
  @$pb.TagNumber(13)
  void clearPlatform() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get platformSongId => $_getSZ(13);
  @$pb.TagNumber(14)
  set platformSongId($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasPlatformSongId() => $_has(13);
  @$pb.TagNumber(14)
  void clearPlatformSongId() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get platformRankId => $_getSZ(14);
  @$pb.TagNumber(15)
  set platformRankId($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasPlatformRankId() => $_has(14);
  @$pb.TagNumber(15)
  void clearPlatformRankId() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get needReport => $_getIZ(15);
  @$pb.TagNumber(16)
  set needReport($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasNeedReport() => $_has(15);
  @$pb.TagNumber(16)
  void clearNeedReport() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get weekMusicalNotes => $_getIZ(16);
  @$pb.TagNumber(17)
  set weekMusicalNotes($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasWeekMusicalNotes() => $_has(16);
  @$pb.TagNumber(17)
  void clearWeekMusicalNotes() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get rtcStreamId => $_getSZ(17);
  @$pb.TagNumber(18)
  set rtcStreamId($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasRtcStreamId() => $_has(17);
  @$pb.TagNumber(18)
  void clearRtcStreamId() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get chorusSwitch => $_getIZ(18);
  @$pb.TagNumber(19)
  set chorusSwitch($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasChorusSwitch() => $_has(18);
  @$pb.TagNumber(19)
  void clearChorusSwitch() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get musicId => $_getSZ(19);
  @$pb.TagNumber(20)
  set musicId($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasMusicId() => $_has(19);
  @$pb.TagNumber(20)
  void clearMusicId() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get pitchLine => $_getSZ(20);
  @$pb.TagNumber(21)
  set pitchLine($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasPitchLine() => $_has(20);
  @$pb.TagNumber(21)
  void clearPitchLine() => clearField(21);
}

class KtvChorusConfigDataChorusUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvChorusConfigDataChorusUser',
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
            : 'weekMusicalNotes',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rtcStreamId')
    ..hasRequiredFields = false;

  KtvChorusConfigDataChorusUser._() : super();
  factory KtvChorusConfigDataChorusUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? weekMusicalNotes,
    $core.String? rtcStreamId,
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
    if (weekMusicalNotes != null) {
      _result.weekMusicalNotes = weekMusicalNotes;
    }
    if (rtcStreamId != null) {
      _result.rtcStreamId = rtcStreamId;
    }
    return _result;
  }
  factory KtvChorusConfigDataChorusUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvChorusConfigDataChorusUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvChorusConfigDataChorusUser clone() =>
      KtvChorusConfigDataChorusUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvChorusConfigDataChorusUser copyWith(
          void Function(KtvChorusConfigDataChorusUser) updates) =>
      super.copyWith(
              (message) => updates(message as KtvChorusConfigDataChorusUser))
          as KtvChorusConfigDataChorusUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvChorusConfigDataChorusUser create() =>
      KtvChorusConfigDataChorusUser._();
  KtvChorusConfigDataChorusUser createEmptyInstance() => create();
  static $pb.PbList<KtvChorusConfigDataChorusUser> createRepeated() =>
      $pb.PbList<KtvChorusConfigDataChorusUser>();
  @$core.pragma('dart2js:noInline')
  static KtvChorusConfigDataChorusUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvChorusConfigDataChorusUser>(create);
  static KtvChorusConfigDataChorusUser? _defaultInstance;

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
  $core.int get weekMusicalNotes => $_getIZ(3);
  @$pb.TagNumber(4)
  set weekMusicalNotes($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWeekMusicalNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeekMusicalNotes() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get rtcStreamId => $_getSZ(4);
  @$pb.TagNumber(5)
  set rtcStreamId($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRtcStreamId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRtcStreamId() => clearField(5);
}

class KtvChorusConfigDataSongDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvChorusConfigDataSongDetail',
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
            : 'photo')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'originalMp3')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hqMusic')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hqSize',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hqStatus',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerId',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerName')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploaderUid')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploaderName')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploaderPhoto')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'brc')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'choosed',
        $pb.PbFieldType.OU3)
    ..aOB(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showAccuse')
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.O3)
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'statusDescription')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platform')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playtime',
        $pb.PbFieldType.OU3)
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platformSongId')
    ..hasRequiredFields = false;

  KtvChorusConfigDataSongDetail._() : super();
  factory KtvChorusConfigDataSongDetail({
    $core.int? id,
    $core.String? name,
    $core.String? photo,
    $core.String? originalMp3,
    $core.int? size,
    $core.String? hqMusic,
    $core.int? hqSize,
    $core.int? hqStatus,
    $core.int? singerId,
    $core.String? singerName,
    $core.String? uploaderUid,
    $core.String? uploaderName,
    $core.String? uploaderPhoto,
    $core.String? brc,
    $core.int? choosed,
    $core.bool? showAccuse,
    $core.int? status,
    $core.String? statusDescription,
    $core.String? platform,
    $core.int? playtime,
    $core.String? platformSongId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (photo != null) {
      _result.photo = photo;
    }
    if (originalMp3 != null) {
      _result.originalMp3 = originalMp3;
    }
    if (size != null) {
      _result.size = size;
    }
    if (hqMusic != null) {
      _result.hqMusic = hqMusic;
    }
    if (hqSize != null) {
      _result.hqSize = hqSize;
    }
    if (hqStatus != null) {
      _result.hqStatus = hqStatus;
    }
    if (singerId != null) {
      _result.singerId = singerId;
    }
    if (singerName != null) {
      _result.singerName = singerName;
    }
    if (uploaderUid != null) {
      _result.uploaderUid = uploaderUid;
    }
    if (uploaderName != null) {
      _result.uploaderName = uploaderName;
    }
    if (uploaderPhoto != null) {
      _result.uploaderPhoto = uploaderPhoto;
    }
    if (brc != null) {
      _result.brc = brc;
    }
    if (choosed != null) {
      _result.choosed = choosed;
    }
    if (showAccuse != null) {
      _result.showAccuse = showAccuse;
    }
    if (status != null) {
      _result.status = status;
    }
    if (statusDescription != null) {
      _result.statusDescription = statusDescription;
    }
    if (platform != null) {
      _result.platform = platform;
    }
    if (playtime != null) {
      _result.playtime = playtime;
    }
    if (platformSongId != null) {
      _result.platformSongId = platformSongId;
    }
    return _result;
  }
  factory KtvChorusConfigDataSongDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvChorusConfigDataSongDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvChorusConfigDataSongDetail clone() =>
      KtvChorusConfigDataSongDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvChorusConfigDataSongDetail copyWith(
          void Function(KtvChorusConfigDataSongDetail) updates) =>
      super.copyWith(
              (message) => updates(message as KtvChorusConfigDataSongDetail))
          as KtvChorusConfigDataSongDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvChorusConfigDataSongDetail create() =>
      KtvChorusConfigDataSongDetail._();
  KtvChorusConfigDataSongDetail createEmptyInstance() => create();
  static $pb.PbList<KtvChorusConfigDataSongDetail> createRepeated() =>
      $pb.PbList<KtvChorusConfigDataSongDetail>();
  @$core.pragma('dart2js:noInline')
  static KtvChorusConfigDataSongDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvChorusConfigDataSongDetail>(create);
  static KtvChorusConfigDataSongDetail? _defaultInstance;

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
  $core.String get photo => $_getSZ(2);
  @$pb.TagNumber(3)
  set photo($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPhoto() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhoto() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get originalMp3 => $_getSZ(3);
  @$pb.TagNumber(4)
  set originalMp3($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOriginalMp3() => $_has(3);
  @$pb.TagNumber(4)
  void clearOriginalMp3() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get size => $_getIZ(4);
  @$pb.TagNumber(5)
  set size($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearSize() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get hqMusic => $_getSZ(5);
  @$pb.TagNumber(6)
  set hqMusic($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHqMusic() => $_has(5);
  @$pb.TagNumber(6)
  void clearHqMusic() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get hqSize => $_getIZ(6);
  @$pb.TagNumber(7)
  set hqSize($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasHqSize() => $_has(6);
  @$pb.TagNumber(7)
  void clearHqSize() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get hqStatus => $_getIZ(7);
  @$pb.TagNumber(8)
  set hqStatus($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasHqStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearHqStatus() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get singerId => $_getIZ(8);
  @$pb.TagNumber(9)
  set singerId($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSingerId() => $_has(8);
  @$pb.TagNumber(9)
  void clearSingerId() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get singerName => $_getSZ(9);
  @$pb.TagNumber(10)
  set singerName($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasSingerName() => $_has(9);
  @$pb.TagNumber(10)
  void clearSingerName() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get uploaderUid => $_getSZ(10);
  @$pb.TagNumber(11)
  set uploaderUid($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasUploaderUid() => $_has(10);
  @$pb.TagNumber(11)
  void clearUploaderUid() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get uploaderName => $_getSZ(11);
  @$pb.TagNumber(12)
  set uploaderName($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasUploaderName() => $_has(11);
  @$pb.TagNumber(12)
  void clearUploaderName() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get uploaderPhoto => $_getSZ(12);
  @$pb.TagNumber(13)
  set uploaderPhoto($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasUploaderPhoto() => $_has(12);
  @$pb.TagNumber(13)
  void clearUploaderPhoto() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get brc => $_getSZ(13);
  @$pb.TagNumber(14)
  set brc($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasBrc() => $_has(13);
  @$pb.TagNumber(14)
  void clearBrc() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get choosed => $_getIZ(14);
  @$pb.TagNumber(15)
  set choosed($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasChoosed() => $_has(14);
  @$pb.TagNumber(15)
  void clearChoosed() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get showAccuse => $_getBF(15);
  @$pb.TagNumber(16)
  set showAccuse($core.bool v) {
    $_setBool(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasShowAccuse() => $_has(15);
  @$pb.TagNumber(16)
  void clearShowAccuse() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get status => $_getIZ(16);
  @$pb.TagNumber(17)
  set status($core.int v) {
    $_setSignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasStatus() => $_has(16);
  @$pb.TagNumber(17)
  void clearStatus() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get statusDescription => $_getSZ(17);
  @$pb.TagNumber(18)
  set statusDescription($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasStatusDescription() => $_has(17);
  @$pb.TagNumber(18)
  void clearStatusDescription() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get platform => $_getSZ(18);
  @$pb.TagNumber(19)
  set platform($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasPlatform() => $_has(18);
  @$pb.TagNumber(19)
  void clearPlatform() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get playtime => $_getIZ(19);
  @$pb.TagNumber(20)
  set playtime($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasPlaytime() => $_has(19);
  @$pb.TagNumber(20)
  void clearPlaytime() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get platformSongId => $_getSZ(20);
  @$pb.TagNumber(21)
  set platformSongId($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasPlatformSongId() => $_has(20);
  @$pb.TagNumber(21)
  void clearPlatformSongId() => clearField(21);
}
