///
//  Generated code. Do not modify.
//  source: rpc_user_room.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class RoomOperateCardBehaviorType extends $pb.ProtobufEnum {
  static const RoomOperateCardBehaviorType INVALID =
      RoomOperateCardBehaviorType._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'INVALID');
  static const RoomOperateCardBehaviorType JOIN_MIC =
      RoomOperateCardBehaviorType._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'JOIN_MIC');
  static const RoomOperateCardBehaviorType OFF_MIC =
      RoomOperateCardBehaviorType._(
          2,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'OFF_MIC');
  static const RoomOperateCardBehaviorType HOLDING_JOIN_MIC =
      RoomOperateCardBehaviorType._(
          3,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'HOLDING_JOIN_MIC');
  static const RoomOperateCardBehaviorType HOLDING_OFF_MIC =
      RoomOperateCardBehaviorType._(
          4,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'HOLDING_OFF_MIC');
  static const RoomOperateCardBehaviorType MUTE = RoomOperateCardBehaviorType._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'MUTE');
  static const RoomOperateCardBehaviorType UNMUTE =
      RoomOperateCardBehaviorType._(
          6,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'UNMUTE');
  static const RoomOperateCardBehaviorType SET_ADMIN =
      RoomOperateCardBehaviorType._(
          7,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'SET_ADMIN');
  static const RoomOperateCardBehaviorType KICK_OUT_ROOM =
      RoomOperateCardBehaviorType._(
          8,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'KICK_OUT_ROOM');

  static const $core.List<RoomOperateCardBehaviorType> values =
      <RoomOperateCardBehaviorType>[
    INVALID,
    JOIN_MIC,
    OFF_MIC,
    HOLDING_JOIN_MIC,
    HOLDING_OFF_MIC,
    MUTE,
    UNMUTE,
    SET_ADMIN,
    KICK_OUT_ROOM,
  ];

  static final $core.Map<$core.int, RoomOperateCardBehaviorType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoomOperateCardBehaviorType? valueOf($core.int value) =>
      _byValue[value];

  const RoomOperateCardBehaviorType._($core.int v, $core.String n)
      : super(v, n);
}
