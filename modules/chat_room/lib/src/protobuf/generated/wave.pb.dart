///
//  Generated code. Do not modify.
//  source: wave.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class WaveConfigMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WaveConfigMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.wave.sync'),
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
            : 'status',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentWave',
        $pb.PbFieldType.OU3,
        protoName: 'currentWave')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalWave',
        $pb.PbFieldType.OU3,
        protoName: 'totalWave')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextWaveTime',
        $pb.PbFieldType.OU3,
        protoName: 'nextWaveTime')
    ..pc<WaveUserInfo>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'players',
        $pb.PbFieldType.PM,
        subBuilder: WaveUserInfo.create)
    ..aOM<WaveQuit>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'quitWave',
        protoName: 'quitWave',
        subBuilder: WaveQuit.create)
    ..aOM<WaveWinner>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'winner',
        subBuilder: WaveWinner.create)
    ..hasRequiredFields = false;

  WaveConfigMessage._() : super();
  factory WaveConfigMessage({
    $core.int? rid,
    $core.int? status,
    $core.int? version,
    $core.int? currentWave,
    $core.int? totalWave,
    $core.int? nextWaveTime,
    $core.Iterable<WaveUserInfo>? players,
    WaveQuit? quitWave,
    WaveWinner? winner,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (status != null) {
      _result.status = status;
    }
    if (version != null) {
      _result.version = version;
    }
    if (currentWave != null) {
      _result.currentWave = currentWave;
    }
    if (totalWave != null) {
      _result.totalWave = totalWave;
    }
    if (nextWaveTime != null) {
      _result.nextWaveTime = nextWaveTime;
    }
    if (players != null) {
      _result.players.addAll(players);
    }
    if (quitWave != null) {
      _result.quitWave = quitWave;
    }
    if (winner != null) {
      _result.winner = winner;
    }
    return _result;
  }
  factory WaveConfigMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WaveConfigMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WaveConfigMessage clone() => WaveConfigMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WaveConfigMessage copyWith(void Function(WaveConfigMessage) updates) =>
      super.copyWith((message) => updates(message as WaveConfigMessage))
          as WaveConfigMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WaveConfigMessage create() => WaveConfigMessage._();
  WaveConfigMessage createEmptyInstance() => create();
  static $pb.PbList<WaveConfigMessage> createRepeated() =>
      $pb.PbList<WaveConfigMessage>();
  @$core.pragma('dart2js:noInline')
  static WaveConfigMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WaveConfigMessage>(create);
  static WaveConfigMessage? _defaultInstance;

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
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(2)
  set status($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(3)
  set version($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get currentWave => $_getIZ(3);
  @$pb.TagNumber(4)
  set currentWave($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCurrentWave() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentWave() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get totalWave => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalWave($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTotalWave() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalWave() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get nextWaveTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set nextWaveTime($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNextWaveTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearNextWaveTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<WaveUserInfo> get players => $_getList(6);

  @$pb.TagNumber(8)
  WaveQuit get quitWave => $_getN(7);
  @$pb.TagNumber(8)
  set quitWave(WaveQuit v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasQuitWave() => $_has(7);
  @$pb.TagNumber(8)
  void clearQuitWave() => clearField(8);
  @$pb.TagNumber(8)
  WaveQuit ensureQuitWave() => $_ensure(7);

  @$pb.TagNumber(9)
  WaveWinner get winner => $_getN(8);
  @$pb.TagNumber(9)
  set winner(WaveWinner v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasWinner() => $_has(8);
  @$pb.TagNumber(9)
  void clearWinner() => clearField(9);
  @$pb.TagNumber(9)
  WaveWinner ensureWinner() => $_ensure(8);
}

class WaveUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WaveUserInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.wave.sync'),
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
            : 'oxygen',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dead',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  WaveUserInfo._() : super();
  factory WaveUserInfo({
    $core.int? uid,
    $core.int? oxygen,
    $core.int? dead,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (oxygen != null) {
      _result.oxygen = oxygen;
    }
    if (dead != null) {
      _result.dead = dead;
    }
    return _result;
  }
  factory WaveUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WaveUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WaveUserInfo clone() => WaveUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WaveUserInfo copyWith(void Function(WaveUserInfo) updates) =>
      super.copyWith((message) => updates(message as WaveUserInfo))
          as WaveUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WaveUserInfo create() => WaveUserInfo._();
  WaveUserInfo createEmptyInstance() => create();
  static $pb.PbList<WaveUserInfo> createRepeated() =>
      $pb.PbList<WaveUserInfo>();
  @$core.pragma('dart2js:noInline')
  static WaveUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WaveUserInfo>(create);
  static WaveUserInfo? _defaultInstance;

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
  $core.int get oxygen => $_getIZ(1);
  @$pb.TagNumber(2)
  set oxygen($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOxygen() => $_has(1);
  @$pb.TagNumber(2)
  void clearOxygen() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get dead => $_getIZ(2);
  @$pb.TagNumber(3)
  set dead($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDead() => $_has(2);
  @$pb.TagNumber(3)
  void clearDead() => clearField(3);
}

class WaveQuit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WaveQuit',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.wave.sync'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'quit',
        $pb.PbFieldType.OU3)
    ..p<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dead',
        $pb.PbFieldType.PU3)
    ..hasRequiredFields = false;

  WaveQuit._() : super();
  factory WaveQuit({
    $core.int? quit,
    $core.Iterable<$core.int>? dead,
  }) {
    final _result = create();
    if (quit != null) {
      _result.quit = quit;
    }
    if (dead != null) {
      _result.dead.addAll(dead);
    }
    return _result;
  }
  factory WaveQuit.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WaveQuit.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WaveQuit clone() => WaveQuit()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WaveQuit copyWith(void Function(WaveQuit) updates) =>
      super.copyWith((message) => updates(message as WaveQuit))
          as WaveQuit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WaveQuit create() => WaveQuit._();
  WaveQuit createEmptyInstance() => create();
  static $pb.PbList<WaveQuit> createRepeated() => $pb.PbList<WaveQuit>();
  @$core.pragma('dart2js:noInline')
  static WaveQuit getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WaveQuit>(create);
  static WaveQuit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get quit => $_getIZ(0);
  @$pb.TagNumber(1)
  set quit($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasQuit() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuit() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get dead => $_getList(1);
}

class WaveWinner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WaveWinner',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.wave.sync'),
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
            : 'vip',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  WaveWinner._() : super();
  factory WaveWinner({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.int? vip,
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
    if (vip != null) {
      _result.vip = vip;
    }
    return _result;
  }
  factory WaveWinner.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WaveWinner.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WaveWinner clone() => WaveWinner()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WaveWinner copyWith(void Function(WaveWinner) updates) =>
      super.copyWith((message) => updates(message as WaveWinner))
          as WaveWinner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WaveWinner create() => WaveWinner._();
  WaveWinner createEmptyInstance() => create();
  static $pb.PbList<WaveWinner> createRepeated() => $pb.PbList<WaveWinner>();
  @$core.pragma('dart2js:noInline')
  static WaveWinner getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WaveWinner>(create);
  static WaveWinner? _defaultInstance;

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
  $core.int get vip => $_getIZ(4);
  @$pb.TagNumber(5)
  set vip($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasVip() => $_has(4);
  @$pb.TagNumber(5)
  void clearVip() => clearField(5);
}

class ApiWaveConfigResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiWaveConfigResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.wave.sync'),
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
    ..aOM<WaveConfigMessage>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: WaveConfigMessage.create)
    ..hasRequiredFields = false;

  ApiWaveConfigResponse._() : super();
  factory ApiWaveConfigResponse({
    $core.bool? success,
    $core.String? message,
    WaveConfigMessage? data,
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
  factory ApiWaveConfigResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiWaveConfigResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiWaveConfigResponse clone() =>
      ApiWaveConfigResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiWaveConfigResponse copyWith(
          void Function(ApiWaveConfigResponse) updates) =>
      super.copyWith((message) => updates(message as ApiWaveConfigResponse))
          as ApiWaveConfigResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiWaveConfigResponse create() => ApiWaveConfigResponse._();
  ApiWaveConfigResponse createEmptyInstance() => create();
  static $pb.PbList<ApiWaveConfigResponse> createRepeated() =>
      $pb.PbList<ApiWaveConfigResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiWaveConfigResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiWaveConfigResponse>(create);
  static ApiWaveConfigResponse? _defaultInstance;

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
  WaveConfigMessage get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(WaveConfigMessage v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  WaveConfigMessage ensureData() => $_ensure(2);
}
