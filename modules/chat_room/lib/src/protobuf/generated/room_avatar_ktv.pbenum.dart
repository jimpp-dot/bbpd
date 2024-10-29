///
//  Generated code. Do not modify.
//  source: room_avatar_ktv.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AvatarKtvStage extends $pb.ProtobufEnum {
  static const AvatarKtvStage SY_ROOM_KTV_STAGE_INIT = AvatarKtvStage._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SY_ROOM_KTV_STAGE_INIT');
  static const AvatarKtvStage SY_ROOM_KTV_STAGE_READY = AvatarKtvStage._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SY_ROOM_KTV_STAGE_READY');
  static const AvatarKtvStage SY_ROOM_KTV_STAGE_SING = AvatarKtvStage._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SY_ROOM_KTV_STAGE_SING');
  static const AvatarKtvStage SY_ROOM_KTV_STAGE_SHOW_SCORE = AvatarKtvStage._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SY_ROOM_KTV_STAGE_SHOW_SCORE');
  static const AvatarKtvStage SY_ROOM_KTV_STAGE_OVER = AvatarKtvStage._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SY_ROOM_KTV_STAGE_OVER');

  static const $core.List<AvatarKtvStage> values = <AvatarKtvStage>[
    SY_ROOM_KTV_STAGE_INIT,
    SY_ROOM_KTV_STAGE_READY,
    SY_ROOM_KTV_STAGE_SING,
    SY_ROOM_KTV_STAGE_SHOW_SCORE,
    SY_ROOM_KTV_STAGE_OVER,
  ];

  static final $core.Map<$core.int, AvatarKtvStage> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static AvatarKtvStage? valueOf($core.int value) => _byValue[value];

  const AvatarKtvStage._($core.int v, $core.String n) : super(v, n);
}

class SyPropTypeEnum extends $pb.ProtobufEnum {
  static const SyPropTypeEnum SyPropTypeRing = SyPropTypeEnum._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SyPropTypeRing');
  static const SyPropTypeEnum SyPropTypeInstrument = SyPropTypeEnum._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SyPropTypeInstrument');

  static const $core.List<SyPropTypeEnum> values = <SyPropTypeEnum>[
    SyPropTypeRing,
    SyPropTypeInstrument,
  ];

  static final $core.Map<$core.int, SyPropTypeEnum> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SyPropTypeEnum? valueOf($core.int value) => _byValue[value];

  const SyPropTypeEnum._($core.int v, $core.String n) : super(v, n);
}
