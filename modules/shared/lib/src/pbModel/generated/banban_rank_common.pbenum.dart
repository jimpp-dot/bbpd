///
//  Generated code. Do not modify.
//  source: banban_rank_common.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class SingerLevel extends $pb.ProtobufEnum {
  static const SingerLevel SingerLevelNone = SingerLevel._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SingerLevelNone');
  static const SingerLevel SingerLevelNewer = SingerLevel._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SingerLevelNewer');
  static const SingerLevel SingerLevelNormal = SingerLevel._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SingerLevelNormal');
  static const SingerLevel SingerLevelPopSinger = SingerLevel._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SingerLevelPopSinger');
  static const SingerLevel SingerLevelGoldSinger = SingerLevel._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SingerLevelGoldSinger');
  static const SingerLevel SingerLevelExpertSinger = SingerLevel._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SingerLevelExpertSinger');

  static const $core.List<SingerLevel> values = <SingerLevel>[
    SingerLevelNone,
    SingerLevelNewer,
    SingerLevelNormal,
    SingerLevelPopSinger,
    SingerLevelGoldSinger,
    SingerLevelExpertSinger,
  ];

  static final $core.Map<$core.int, SingerLevel> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SingerLevel? valueOf($core.int value) => _byValue[value];

  const SingerLevel._($core.int v, $core.String n) : super(v, n);
}
