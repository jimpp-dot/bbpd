///
//  Generated code. Do not modify.
//  source: api_relation.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class FamiliarType extends $pb.ProtobufEnum {
  static const FamiliarType familiar = FamiliarType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'familiar');
  static const FamiliarType group = FamiliarType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'group');

  static const $core.List<FamiliarType> values = <FamiliarType>[
    familiar,
    group,
  ];

  static final $core.Map<$core.int, FamiliarType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static FamiliarType? valueOf($core.int value) => _byValue[value];

  const FamiliarType._($core.int v, $core.String n) : super(v, n);
}
