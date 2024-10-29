///
//  Generated code. Do not modify.
//  source: zodiac.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ZodiacCode extends $pb.ProtobufEnum {
  static const ZodiacCode ZodiacCodeUnknown = ZodiacCode._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacCodeUnknown');
  static const ZodiacCode ZodiacAries = ZodiacCode._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacAries');
  static const ZodiacCode ZodiacTaurus = ZodiacCode._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacTaurus');
  static const ZodiacCode ZodiacGemini = ZodiacCode._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacGemini');
  static const ZodiacCode ZodiacCancer = ZodiacCode._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacCancer');
  static const ZodiacCode ZodiacLeo = ZodiacCode._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacLeo');
  static const ZodiacCode ZodiacVirgo = ZodiacCode._(
      6,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacVirgo');
  static const ZodiacCode ZodiacLibra = ZodiacCode._(
      7,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacLibra');
  static const ZodiacCode ZodiacScorpio = ZodiacCode._(
      8,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacScorpio');
  static const ZodiacCode ZodiacSagittarius = ZodiacCode._(
      9,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacSagittarius');
  static const ZodiacCode ZodiacCapricorn = ZodiacCode._(
      10,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacCapricorn');
  static const ZodiacCode ZodiacAquarius = ZodiacCode._(
      11,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacAquarius');
  static const ZodiacCode ZodiacPisces = ZodiacCode._(
      12,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacPisces');
  static const ZodiacCode ZodiacExceeded = ZodiacCode._(
      13,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacExceeded');

  static const $core.List<ZodiacCode> values = <ZodiacCode>[
    ZodiacCodeUnknown,
    ZodiacAries,
    ZodiacTaurus,
    ZodiacGemini,
    ZodiacCancer,
    ZodiacLeo,
    ZodiacVirgo,
    ZodiacLibra,
    ZodiacScorpio,
    ZodiacSagittarius,
    ZodiacCapricorn,
    ZodiacAquarius,
    ZodiacPisces,
    ZodiacExceeded,
  ];

  static final $core.Map<$core.int, ZodiacCode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ZodiacCode? valueOf($core.int value) => _byValue[value];

  const ZodiacCode._($core.int v, $core.String n) : super(v, n);
}

class ZodiacPopupState extends $pb.ProtobufEnum {
  static const ZodiacPopupState ZodiacStateUnknown = ZodiacPopupState._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacStateUnknown');
  static const ZodiacPopupState ZodiacStateDisabled = ZodiacPopupState._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacStateDisabled');
  static const ZodiacPopupState ZodiacStatePrepare = ZodiacPopupState._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacStatePrepare');
  static const ZodiacPopupState ZodiacStateEnable = ZodiacPopupState._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacStateEnable');
  static const ZodiacPopupState ZodiacStateDone = ZodiacPopupState._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ZodiacStateDone');

  static const $core.List<ZodiacPopupState> values = <ZodiacPopupState>[
    ZodiacStateUnknown,
    ZodiacStateDisabled,
    ZodiacStatePrepare,
    ZodiacStateEnable,
    ZodiacStateDone,
  ];

  static final $core.Map<$core.int, ZodiacPopupState> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ZodiacPopupState? valueOf($core.int value) => _byValue[value];

  const ZodiacPopupState._($core.int v, $core.String n) : super(v, n);
}
