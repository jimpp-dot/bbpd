///
//  Generated code. Do not modify.
//  source: piadrama.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PiaJuBenType extends $pb.ProtobufEnum {
  static const PiaJuBenType PiaJuBenTypeSingle = PiaJuBenType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PiaJuBenTypeSingle');
  static const PiaJuBenType PiaJuBenTypeMulti = PiaJuBenType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PiaJuBenTypeMulti');

  static const $core.List<PiaJuBenType> values = <PiaJuBenType>[
    PiaJuBenTypeSingle,
    PiaJuBenTypeMulti,
  ];

  static final $core.Map<$core.int, PiaJuBenType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static PiaJuBenType? valueOf($core.int value) => _byValue[value];

  const PiaJuBenType._($core.int v, $core.String n) : super(v, n);
}
