///
//  Generated code. Do not modify.
//  source: drainage.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class DrainageRoomType extends $pb.ProtobufEnum {
  static const DrainageRoomType DrainageRoomTypeNone = DrainageRoomType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DrainageRoomTypeNone');
  static const DrainageRoomType DrainageRoomTypeMaster = DrainageRoomType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DrainageRoomTypeMaster');
  static const DrainageRoomType DrainageRoomTypeSlave = DrainageRoomType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DrainageRoomTypeSlave');

  static const $core.List<DrainageRoomType> values = <DrainageRoomType>[
    DrainageRoomTypeNone,
    DrainageRoomTypeMaster,
    DrainageRoomTypeSlave,
  ];

  static final $core.Map<$core.int, DrainageRoomType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static DrainageRoomType? valueOf($core.int value) => _byValue[value];

  const DrainageRoomType._($core.int v, $core.String n) : super(v, n);
}

class RoomDrainageOperation extends $pb.ProtobufEnum {
  static const RoomDrainageOperation RoomDrainageEnter =
      RoomDrainageOperation._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'RoomDrainageEnter');
  static const RoomDrainageOperation RoomDrainageInvite =
      RoomDrainageOperation._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'RoomDrainageInvite');
  static const RoomDrainageOperation RoomDrainageCloseAndInvite =
      RoomDrainageOperation._(
          2,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'RoomDrainageCloseAndInvite');
  static const RoomDrainageOperation RoomDrainageChooseInvite =
      RoomDrainageOperation._(
          3,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'RoomDrainageChooseInvite');

  static const $core.List<RoomDrainageOperation> values =
      <RoomDrainageOperation>[
    RoomDrainageEnter,
    RoomDrainageInvite,
    RoomDrainageCloseAndInvite,
    RoomDrainageChooseInvite,
  ];

  static final $core.Map<$core.int, RoomDrainageOperation> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoomDrainageOperation? valueOf($core.int value) => _byValue[value];

  const RoomDrainageOperation._($core.int v, $core.String n) : super(v, n);
}

class RoomDrainageEvent extends $pb.ProtobufEnum {
  static const RoomDrainageEvent RoomDrainageAdd = RoomDrainageEvent._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'RoomDrainageAdd');
  static const RoomDrainageEvent RoomDrainageRemove = RoomDrainageEvent._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'RoomDrainageRemove');

  static const $core.List<RoomDrainageEvent> values = <RoomDrainageEvent>[
    RoomDrainageAdd,
    RoomDrainageRemove,
  ];

  static final $core.Map<$core.int, RoomDrainageEvent> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoomDrainageEvent? valueOf($core.int value) => _byValue[value];

  const RoomDrainageEvent._($core.int v, $core.String n) : super(v, n);
}
