///
//  Generated code. Do not modify.
//  source: room_suspect.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class RoomSuspectStage extends $pb.ProtobufEnum {
  static const RoomSuspectStage ROOM_SUSPECT_STAGE_PENDING = RoomSuspectStage._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_SUSPECT_STAGE_PENDING');
  static const RoomSuspectStage ROOM_SUSPECT_STAGE_READY = RoomSuspectStage._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_SUSPECT_STAGE_READY');
  static const RoomSuspectStage ROOM_SUSPECT_STAGE_PLAYING = RoomSuspectStage._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_SUSPECT_STAGE_PLAYING');
  static const RoomSuspectStage ROOM_SUSPECT_STAGE_END = RoomSuspectStage._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_SUSPECT_STAGE_END');

  static const $core.List<RoomSuspectStage> values = <RoomSuspectStage>[
    ROOM_SUSPECT_STAGE_PENDING,
    ROOM_SUSPECT_STAGE_READY,
    ROOM_SUSPECT_STAGE_PLAYING,
    ROOM_SUSPECT_STAGE_END,
  ];

  static final $core.Map<$core.int, RoomSuspectStage> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoomSuspectStage? valueOf($core.int value) => _byValue[value];

  const RoomSuspectStage._($core.int v, $core.String n) : super(v, n);
}

class RoomSuspectRole extends $pb.ProtobufEnum {
  static const RoomSuspectRole ROOM_SUSPECT_ROLE_NONE = RoomSuspectRole._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_SUSPECT_ROLE_NONE');
  static const RoomSuspectRole ROOM_SUSPECT_ROLE_WITNESS = RoomSuspectRole._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_SUSPECT_ROLE_WITNESS');
  static const RoomSuspectRole ROOM_SUSPECT_ROLE_DETECTIVE = RoomSuspectRole._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_SUSPECT_ROLE_DETECTIVE');

  static const $core.List<RoomSuspectRole> values = <RoomSuspectRole>[
    ROOM_SUSPECT_ROLE_NONE,
    ROOM_SUSPECT_ROLE_WITNESS,
    ROOM_SUSPECT_ROLE_DETECTIVE,
  ];

  static final $core.Map<$core.int, RoomSuspectRole> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoomSuspectRole? valueOf($core.int value) => _byValue[value];

  const RoomSuspectRole._($core.int v, $core.String n) : super(v, n);
}

class RoomSuspectReleaseStatus extends $pb.ProtobufEnum {
  static const RoomSuspectReleaseStatus ROOM_SUSPECT_RELEASE_NONE =
      RoomSuspectReleaseStatus._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'ROOM_SUSPECT_RELEASE_NONE');
  static const RoomSuspectReleaseStatus ROOM_SUSPECT_RELEASE_TRUE =
      RoomSuspectReleaseStatus._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'ROOM_SUSPECT_RELEASE_TRUE');
  static const RoomSuspectReleaseStatus ROOM_SUSPECT_RELEASE_FALSE =
      RoomSuspectReleaseStatus._(
          2,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'ROOM_SUSPECT_RELEASE_FALSE');

  static const $core.List<RoomSuspectReleaseStatus> values =
      <RoomSuspectReleaseStatus>[
    ROOM_SUSPECT_RELEASE_NONE,
    ROOM_SUSPECT_RELEASE_TRUE,
    ROOM_SUSPECT_RELEASE_FALSE,
  ];

  static final $core.Map<$core.int, RoomSuspectReleaseStatus> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoomSuspectReleaseStatus? valueOf($core.int value) => _byValue[value];

  const RoomSuspectReleaseStatus._($core.int v, $core.String n) : super(v, n);
}
