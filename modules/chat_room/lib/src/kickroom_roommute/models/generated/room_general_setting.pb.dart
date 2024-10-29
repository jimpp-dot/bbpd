///
//  Generated code. Do not modify.
//  source: room_general_setting.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResRoomGeneralSetting extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomGeneralSetting',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room'),
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
    ..aOM<RoomGeneralSetting>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomGeneralSetting.create)
    ..hasRequiredFields = false;

  ResRoomGeneralSetting._() : super();
  factory ResRoomGeneralSetting({
    $core.bool? success,
    $core.String? msg,
    RoomGeneralSetting? data,
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
  factory ResRoomGeneralSetting.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomGeneralSetting.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomGeneralSetting clone() =>
      ResRoomGeneralSetting()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomGeneralSetting copyWith(
          void Function(ResRoomGeneralSetting) updates) =>
      super.copyWith((message) => updates(message as ResRoomGeneralSetting))
          as ResRoomGeneralSetting; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomGeneralSetting create() => ResRoomGeneralSetting._();
  ResRoomGeneralSetting createEmptyInstance() => create();
  static $pb.PbList<ResRoomGeneralSetting> createRepeated() =>
      $pb.PbList<ResRoomGeneralSetting>();
  @$core.pragma('dart2js:noInline')
  static ResRoomGeneralSetting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomGeneralSetting>(create);
  static ResRoomGeneralSetting? _defaultInstance;

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
  RoomGeneralSetting get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomGeneralSetting v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomGeneralSetting ensureData() => $_ensure(2);
}

class RoomGeneralSetting extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomGeneralSetting',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room'),
      createEmptyInstance: create)
    ..aOM<RoomMuteData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomMute',
        subBuilder: RoomMuteData.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'openPiaDramaJuben',
        $pb.PbFieldType.OU3,
        protoName: 'openPiaDramaJuben')
    ..aOM<RoomGloryHourRankEntrance>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gloryRank',
        subBuilder: RoomGloryHourRankEntrance.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'openReceptionRank',
        $pb.PbFieldType.OU3,
        protoName: 'openReceptionRank')
    ..hasRequiredFields = false;

  RoomGeneralSetting._() : super();
  factory RoomGeneralSetting({
    RoomMuteData? roomMute,
    $core.int? openPiaDramaJuben,
    RoomGloryHourRankEntrance? gloryRank,
    $core.int? openReceptionRank,
  }) {
    final _result = create();
    if (roomMute != null) {
      _result.roomMute = roomMute;
    }
    if (openPiaDramaJuben != null) {
      _result.openPiaDramaJuben = openPiaDramaJuben;
    }
    if (gloryRank != null) {
      _result.gloryRank = gloryRank;
    }
    if (openReceptionRank != null) {
      _result.openReceptionRank = openReceptionRank;
    }
    return _result;
  }
  factory RoomGeneralSetting.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomGeneralSetting.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomGeneralSetting clone() => RoomGeneralSetting()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomGeneralSetting copyWith(void Function(RoomGeneralSetting) updates) =>
      super.copyWith((message) => updates(message as RoomGeneralSetting))
          as RoomGeneralSetting; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomGeneralSetting create() => RoomGeneralSetting._();
  RoomGeneralSetting createEmptyInstance() => create();
  static $pb.PbList<RoomGeneralSetting> createRepeated() =>
      $pb.PbList<RoomGeneralSetting>();
  @$core.pragma('dart2js:noInline')
  static RoomGeneralSetting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomGeneralSetting>(create);
  static RoomGeneralSetting? _defaultInstance;

  @$pb.TagNumber(1)
  RoomMuteData get roomMute => $_getN(0);
  @$pb.TagNumber(1)
  set roomMute(RoomMuteData v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoomMute() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomMute() => clearField(1);
  @$pb.TagNumber(1)
  RoomMuteData ensureRoomMute() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get openPiaDramaJuben => $_getIZ(1);
  @$pb.TagNumber(2)
  set openPiaDramaJuben($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOpenPiaDramaJuben() => $_has(1);
  @$pb.TagNumber(2)
  void clearOpenPiaDramaJuben() => clearField(2);

  @$pb.TagNumber(3)
  RoomGloryHourRankEntrance get gloryRank => $_getN(2);
  @$pb.TagNumber(3)
  set gloryRank(RoomGloryHourRankEntrance v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGloryRank() => $_has(2);
  @$pb.TagNumber(3)
  void clearGloryRank() => clearField(3);
  @$pb.TagNumber(3)
  RoomGloryHourRankEntrance ensureGloryRank() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get openReceptionRank => $_getIZ(3);
  @$pb.TagNumber(4)
  set openReceptionRank($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOpenReceptionRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearOpenReceptionRank() => clearField(4);
}

class RoomMuteData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomMuteData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mute')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countdown',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomMuteData._() : super();
  factory RoomMuteData({
    $core.bool? mute,
    $core.int? countdown,
  }) {
    final _result = create();
    if (mute != null) {
      _result.mute = mute;
    }
    if (countdown != null) {
      _result.countdown = countdown;
    }
    return _result;
  }
  factory RoomMuteData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomMuteData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomMuteData clone() => RoomMuteData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomMuteData copyWith(void Function(RoomMuteData) updates) =>
      super.copyWith((message) => updates(message as RoomMuteData))
          as RoomMuteData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomMuteData create() => RoomMuteData._();
  RoomMuteData createEmptyInstance() => create();
  static $pb.PbList<RoomMuteData> createRepeated() =>
      $pb.PbList<RoomMuteData>();
  @$core.pragma('dart2js:noInline')
  static RoomMuteData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomMuteData>(create);
  static RoomMuteData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get mute => $_getBF(0);
  @$pb.TagNumber(1)
  set mute($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMute() => $_has(0);
  @$pb.TagNumber(1)
  void clearMute() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get countdown => $_getIZ(1);
  @$pb.TagNumber(2)
  set countdown($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCountdown() => $_has(1);
  @$pb.TagNumber(2)
  void clearCountdown() => clearField(2);
}

class RoomGloryHourRankEntrance extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomGloryHourRankEntrance',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room'),
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
