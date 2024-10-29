///
//  Generated code. Do not modify.
//  source: common_roomticket.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResRoomTicketConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomTicketConfig',
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
    ..aOM<RoomTicketConfigData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomTicketConfigData.create)
    ..hasRequiredFields = false;

  ResRoomTicketConfig._() : super();
  factory ResRoomTicketConfig({
    $core.bool? success,
    $core.String? msg,
    RoomTicketConfigData? data,
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
  factory ResRoomTicketConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomTicketConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomTicketConfig clone() => ResRoomTicketConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomTicketConfig copyWith(void Function(ResRoomTicketConfig) updates) =>
      super.copyWith((message) => updates(message as ResRoomTicketConfig))
          as ResRoomTicketConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomTicketConfig create() => ResRoomTicketConfig._();
  ResRoomTicketConfig createEmptyInstance() => create();
  static $pb.PbList<ResRoomTicketConfig> createRepeated() =>
      $pb.PbList<ResRoomTicketConfig>();
  @$core.pragma('dart2js:noInline')
  static ResRoomTicketConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomTicketConfig>(create);
  static ResRoomTicketConfig? _defaultInstance;

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
  RoomTicketConfigData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomTicketConfigData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomTicketConfigData ensureData() => $_ensure(2);
}

class RoomTicketConfigData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomTicketConfigData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomTicketConfigData._() : super();
  factory RoomTicketConfigData({
    $core.int? giftId,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    return _result;
  }
  factory RoomTicketConfigData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomTicketConfigData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomTicketConfigData clone() =>
      RoomTicketConfigData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomTicketConfigData copyWith(void Function(RoomTicketConfigData) updates) =>
      super.copyWith((message) => updates(message as RoomTicketConfigData))
          as RoomTicketConfigData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomTicketConfigData create() => RoomTicketConfigData._();
  RoomTicketConfigData createEmptyInstance() => create();
  static $pb.PbList<RoomTicketConfigData> createRepeated() =>
      $pb.PbList<RoomTicketConfigData>();
  @$core.pragma('dart2js:noInline')
  static RoomTicketConfigData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomTicketConfigData>(create);
  static RoomTicketConfigData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);
}
