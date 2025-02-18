///
//  Generated code. Do not modify.
//  source: room.msg.send.mode.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomMsgSendMode extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomMsgSendMode',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.msg.send.mode'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg_send_interval_mode',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomMsgSendMode._() : super();
  factory RoomMsgSendMode({
    $core.int? msgSendIntervalMode,
  }) {
    final _result = create();
    if (msgSendIntervalMode != null) {
      _result.msgSendIntervalMode = msgSendIntervalMode;
    }
    return _result;
  }
  factory RoomMsgSendMode.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomMsgSendMode.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomMsgSendMode clone() => RoomMsgSendMode()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomMsgSendMode copyWith(void Function(RoomMsgSendMode) updates) =>
      super.copyWith((message) => updates(message as RoomMsgSendMode))
          as RoomMsgSendMode; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomMsgSendMode create() => RoomMsgSendMode._();
  RoomMsgSendMode createEmptyInstance() => create();
  static $pb.PbList<RoomMsgSendMode> createRepeated() =>
      $pb.PbList<RoomMsgSendMode>();
  @$core.pragma('dart2js:noInline')
  static RoomMsgSendMode getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomMsgSendMode>(create);
  static RoomMsgSendMode? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get msgSendIntervalMode => $_getIZ(0);
  @$pb.TagNumber(1)
  set msgSendIntervalMode($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMsgSendIntervalMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsgSendIntervalMode() => clearField(1);
}
