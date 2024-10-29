///
//  Generated code. Do not modify.
//  source: room.packet.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomPacketRefresh_Packet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomPacketRefresh.Packet',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.packet.refresh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sign')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomPacketRefresh_Packet._() : super();
  factory RoomPacketRefresh_Packet({
    $core.String? icon,
    $core.int? id,
    $core.String? sign,
    $core.String? state,
    $core.int? time,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (id != null) {
      _result.id = id;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    if (state != null) {
      _result.state = state;
    }
    if (time != null) {
      _result.time = time;
    }
    return _result;
  }
  factory RoomPacketRefresh_Packet.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomPacketRefresh_Packet.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomPacketRefresh_Packet clone() =>
      RoomPacketRefresh_Packet()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomPacketRefresh_Packet copyWith(
          void Function(RoomPacketRefresh_Packet) updates) =>
      super.copyWith((message) => updates(message as RoomPacketRefresh_Packet))
          as RoomPacketRefresh_Packet; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomPacketRefresh_Packet create() => RoomPacketRefresh_Packet._();
  RoomPacketRefresh_Packet createEmptyInstance() => create();
  static $pb.PbList<RoomPacketRefresh_Packet> createRepeated() =>
      $pb.PbList<RoomPacketRefresh_Packet>();
  @$core.pragma('dart2js:noInline')
  static RoomPacketRefresh_Packet getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomPacketRefresh_Packet>(create);
  static RoomPacketRefresh_Packet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sign => $_getSZ(2);
  @$pb.TagNumber(3)
  set sign($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSign() => $_has(2);
  @$pb.TagNumber(3)
  void clearSign() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get state => $_getSZ(3);
  @$pb.TagNumber(4)
  set state($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get time => $_getIZ(4);
  @$pb.TagNumber(5)
  set time($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => clearField(5);
}

class RoomPacketRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomPacketRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.packet.refresh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count',
        $pb.PbFieldType.OU3)
    ..aOM<RoomPacketRefresh_Packet>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'packet',
        subBuilder: RoomPacketRefresh_Packet.create)
    ..hasRequiredFields = false;

  RoomPacketRefresh._() : super();
  factory RoomPacketRefresh({
    $core.int? count,
    RoomPacketRefresh_Packet? packet,
  }) {
    final _result = create();
    if (count != null) {
      _result.count = count;
    }
    if (packet != null) {
      _result.packet = packet;
    }
    return _result;
  }
  factory RoomPacketRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomPacketRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomPacketRefresh clone() => RoomPacketRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomPacketRefresh copyWith(void Function(RoomPacketRefresh) updates) =>
      super.copyWith((message) => updates(message as RoomPacketRefresh))
          as RoomPacketRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomPacketRefresh create() => RoomPacketRefresh._();
  RoomPacketRefresh createEmptyInstance() => create();
  static $pb.PbList<RoomPacketRefresh> createRepeated() =>
      $pb.PbList<RoomPacketRefresh>();
  @$core.pragma('dart2js:noInline')
  static RoomPacketRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomPacketRefresh>(create);
  static RoomPacketRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => clearField(1);

  @$pb.TagNumber(2)
  RoomPacketRefresh_Packet get packet => $_getN(1);
  @$pb.TagNumber(2)
  set packet(RoomPacketRefresh_Packet v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPacket() => $_has(1);
  @$pb.TagNumber(2)
  void clearPacket() => clearField(2);
  @$pb.TagNumber(2)
  RoomPacketRefresh_Packet ensurePacket() => $_ensure(1);
}
