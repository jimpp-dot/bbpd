///
//  Generated code. Do not modify.
//  source: room_rob_mic.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ShowMicPosData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShowMicPosData',
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
            : 'giftTotal',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defenseNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'alarmDeadline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isOffline',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ShowMicPosData._() : super();
  factory ShowMicPosData({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? giftTotal,
    $core.int? defenseNum,
    $core.int? alarmDeadline,
    $core.int? isOffline,
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
    if (giftTotal != null) {
      _result.giftTotal = giftTotal;
    }
    if (defenseNum != null) {
      _result.defenseNum = defenseNum;
    }
    if (alarmDeadline != null) {
      _result.alarmDeadline = alarmDeadline;
    }
    if (isOffline != null) {
      _result.isOffline = isOffline;
    }
    return _result;
  }
  factory ShowMicPosData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShowMicPosData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShowMicPosData clone() => ShowMicPosData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShowMicPosData copyWith(void Function(ShowMicPosData) updates) =>
      super.copyWith((message) => updates(message as ShowMicPosData))
          as ShowMicPosData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShowMicPosData create() => ShowMicPosData._();
  ShowMicPosData createEmptyInstance() => create();
  static $pb.PbList<ShowMicPosData> createRepeated() =>
      $pb.PbList<ShowMicPosData>();
  @$core.pragma('dart2js:noInline')
  static ShowMicPosData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShowMicPosData>(create);
  static ShowMicPosData? _defaultInstance;

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
  $core.int get giftTotal => $_getIZ(3);
  @$pb.TagNumber(4)
  set giftTotal($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftTotal() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftTotal() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get defenseNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set defenseNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDefenseNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearDefenseNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get alarmDeadline => $_getIZ(5);
  @$pb.TagNumber(6)
  set alarmDeadline($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAlarmDeadline() => $_has(5);
  @$pb.TagNumber(6)
  void clearAlarmDeadline() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get isOffline => $_getIZ(6);
  @$pb.TagNumber(7)
  set isOffline($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIsOffline() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsOffline() => clearField(7);
}

class RobMicPosData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RobMicPosData',
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
            : 'robDeadline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'robState',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftTotal',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RobMicPosData._() : super();
  factory RobMicPosData({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? robDeadline,
    $core.int? robState,
    $core.int? giftTotal,
    $core.int? position,
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
    if (robDeadline != null) {
      _result.robDeadline = robDeadline;
    }
    if (robState != null) {
      _result.robState = robState;
    }
    if (giftTotal != null) {
      _result.giftTotal = giftTotal;
    }
    if (position != null) {
      _result.position = position;
    }
    return _result;
  }
  factory RobMicPosData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RobMicPosData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RobMicPosData clone() => RobMicPosData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RobMicPosData copyWith(void Function(RobMicPosData) updates) =>
      super.copyWith((message) => updates(message as RobMicPosData))
          as RobMicPosData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RobMicPosData create() => RobMicPosData._();
  RobMicPosData createEmptyInstance() => create();
  static $pb.PbList<RobMicPosData> createRepeated() =>
      $pb.PbList<RobMicPosData>();
  @$core.pragma('dart2js:noInline')
  static RobMicPosData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RobMicPosData>(create);
  static RobMicPosData? _defaultInstance;

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
  $core.int get robDeadline => $_getIZ(3);
  @$pb.TagNumber(4)
  set robDeadline($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRobDeadline() => $_has(3);
  @$pb.TagNumber(4)
  void clearRobDeadline() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get robState => $_getIZ(4);
  @$pb.TagNumber(5)
  set robState($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRobState() => $_has(4);
  @$pb.TagNumber(5)
  void clearRobState() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get giftTotal => $_getIZ(5);
  @$pb.TagNumber(6)
  set giftTotal($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGiftTotal() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftTotal() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get position => $_getIZ(6);
  @$pb.TagNumber(7)
  set position($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPosition() => $_has(6);
  @$pb.TagNumber(7)
  void clearPosition() => clearField(7);
}

class RobMicConfigData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RobMicConfigData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<ShowMicPosData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showMicPos',
        subBuilder: ShowMicPosData.create)
    ..pc<RobMicPosData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'robMicPos',
        $pb.PbFieldType.PM,
        subBuilder: RobMicPosData.create)
    ..hasRequiredFields = false;

  RobMicConfigData._() : super();
  factory RobMicConfigData({
    ShowMicPosData? showMicPos,
    $core.Iterable<RobMicPosData>? robMicPos,
  }) {
    final _result = create();
    if (showMicPos != null) {
      _result.showMicPos = showMicPos;
    }
    if (robMicPos != null) {
      _result.robMicPos.addAll(robMicPos);
    }
    return _result;
  }
  factory RobMicConfigData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RobMicConfigData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RobMicConfigData clone() => RobMicConfigData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RobMicConfigData copyWith(void Function(RobMicConfigData) updates) =>
      super.copyWith((message) => updates(message as RobMicConfigData))
          as RobMicConfigData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RobMicConfigData create() => RobMicConfigData._();
  RobMicConfigData createEmptyInstance() => create();
  static $pb.PbList<RobMicConfigData> createRepeated() =>
      $pb.PbList<RobMicConfigData>();
  @$core.pragma('dart2js:noInline')
  static RobMicConfigData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RobMicConfigData>(create);
  static RobMicConfigData? _defaultInstance;

  @$pb.TagNumber(1)
  ShowMicPosData get showMicPos => $_getN(0);
  @$pb.TagNumber(1)
  set showMicPos(ShowMicPosData v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShowMicPos() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowMicPos() => clearField(1);
  @$pb.TagNumber(1)
  ShowMicPosData ensureShowMicPos() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<RobMicPosData> get robMicPos => $_getList(1);
}

class ResRobMicConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRobMicConfig',
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
    ..aOM<RobMicConfigData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RobMicConfigData.create)
    ..hasRequiredFields = false;

  ResRobMicConfig._() : super();
  factory ResRobMicConfig({
    $core.bool? success,
    $core.String? msg,
    RobMicConfigData? data,
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
  factory ResRobMicConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRobMicConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRobMicConfig clone() => ResRobMicConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRobMicConfig copyWith(void Function(ResRobMicConfig) updates) =>
      super.copyWith((message) => updates(message as ResRobMicConfig))
          as ResRobMicConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRobMicConfig create() => ResRobMicConfig._();
  ResRobMicConfig createEmptyInstance() => create();
  static $pb.PbList<ResRobMicConfig> createRepeated() =>
      $pb.PbList<ResRobMicConfig>();
  @$core.pragma('dart2js:noInline')
  static ResRobMicConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRobMicConfig>(create);
  static ResRobMicConfig? _defaultInstance;

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
  RobMicConfigData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RobMicConfigData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RobMicConfigData ensureData() => $_ensure(2);
}

class RobSuccessData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RobSuccessData',
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
    ..pc<RobSuccessUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RobSuccessUser.create)
    ..hasRequiredFields = false;

  RobSuccessData._() : super();
  factory RobSuccessData({
    $core.int? uid,
    $core.Iterable<RobSuccessUser>? list,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory RobSuccessData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RobSuccessData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RobSuccessData clone() => RobSuccessData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RobSuccessData copyWith(void Function(RobSuccessData) updates) =>
      super.copyWith((message) => updates(message as RobSuccessData))
          as RobSuccessData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RobSuccessData create() => RobSuccessData._();
  RobSuccessData createEmptyInstance() => create();
  static $pb.PbList<RobSuccessData> createRepeated() =>
      $pb.PbList<RobSuccessData>();
  @$core.pragma('dart2js:noInline')
  static RobSuccessData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RobSuccessData>(create);
  static RobSuccessData? _defaultInstance;

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
  $core.List<RobSuccessUser> get list => $_getList(1);
}

class RobSuccessUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RobSuccessUser',
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
            : 'giftTotal',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RobSuccessUser._() : super();
  factory RobSuccessUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.int? giftTotal,
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
    if (giftTotal != null) {
      _result.giftTotal = giftTotal;
    }
    return _result;
  }
  factory RobSuccessUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RobSuccessUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RobSuccessUser clone() => RobSuccessUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RobSuccessUser copyWith(void Function(RobSuccessUser) updates) =>
      super.copyWith((message) => updates(message as RobSuccessUser))
          as RobSuccessUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RobSuccessUser create() => RobSuccessUser._();
  RobSuccessUser createEmptyInstance() => create();
  static $pb.PbList<RobSuccessUser> createRepeated() =>
      $pb.PbList<RobSuccessUser>();
  @$core.pragma('dart2js:noInline')
  static RobSuccessUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RobSuccessUser>(create);
  static RobSuccessUser? _defaultInstance;

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
  $core.int get giftTotal => $_getIZ(4);
  @$pb.TagNumber(5)
  set giftTotal($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftTotal() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftTotal() => clearField(5);
}

class RobPosRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RobPosRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<RobMicPosData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RobMicPosData.create)
    ..hasRequiredFields = false;

  RobPosRefresh._() : super();
  factory RobPosRefresh({
    $core.Iterable<RobMicPosData>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory RobPosRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RobPosRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RobPosRefresh clone() => RobPosRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RobPosRefresh copyWith(void Function(RobPosRefresh) updates) =>
      super.copyWith((message) => updates(message as RobPosRefresh))
          as RobPosRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RobPosRefresh create() => RobPosRefresh._();
  RobPosRefresh createEmptyInstance() => create();
  static $pb.PbList<RobPosRefresh> createRepeated() =>
      $pb.PbList<RobPosRefresh>();
  @$core.pragma('dart2js:noInline')
  static RobPosRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RobPosRefresh>(create);
  static RobPosRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RobMicPosData> get list => $_getList(0);
}

class RobMicTips extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RobMicTips',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rType',
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
            : 'desc')
    ..hasRequiredFields = false;

  RobMicTips._() : super();
  factory RobMicTips({
    $core.int? rType,
    $core.String? name,
    $core.String? icon,
    $core.String? desc,
  }) {
    final _result = create();
    if (rType != null) {
      _result.rType = rType;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory RobMicTips.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RobMicTips.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RobMicTips clone() => RobMicTips()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RobMicTips copyWith(void Function(RobMicTips) updates) =>
      super.copyWith((message) => updates(message as RobMicTips))
          as RobMicTips; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RobMicTips create() => RobMicTips._();
  RobMicTips createEmptyInstance() => create();
  static $pb.PbList<RobMicTips> createRepeated() => $pb.PbList<RobMicTips>();
  @$core.pragma('dart2js:noInline')
  static RobMicTips getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RobMicTips>(create);
  static RobMicTips? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rType => $_getIZ(0);
  @$pb.TagNumber(1)
  set rType($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRType() => $_has(0);
  @$pb.TagNumber(1)
  void clearRType() => clearField(1);

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
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => clearField(4);
}
