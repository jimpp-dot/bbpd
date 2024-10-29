///
//  Generated code. Do not modify.
//  source: profile.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class RoomCrossPkWinState extends $pb.ProtobufEnum {
  static const RoomCrossPkWinState CROSSPK_UNKNOWN = RoomCrossPkWinState._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'CROSSPK_UNKNOWN');
  static const RoomCrossPkWinState CROSSPK_WIN = RoomCrossPkWinState._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'CROSSPK_WIN');
  static const RoomCrossPkWinState CROSSPK_DRAW = RoomCrossPkWinState._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'CROSSPK_DRAW');
  static const RoomCrossPkWinState CROSSPK_FAIL = RoomCrossPkWinState._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'CROSSPK_FAIL');

  static const $core.List<RoomCrossPkWinState> values = <RoomCrossPkWinState>[
    CROSSPK_UNKNOWN,
    CROSSPK_WIN,
    CROSSPK_DRAW,
    CROSSPK_FAIL,
  ];

  static final $core.Map<$core.int, RoomCrossPkWinState> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoomCrossPkWinState? valueOf($core.int value) => _byValue[value];

  const RoomCrossPkWinState._($core.int v, $core.String n) : super(v, n);
}
