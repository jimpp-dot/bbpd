///
//  Generated code. Do not modify.
//  source: boot_app_dialog.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class BootAppPopupType extends $pb.ProtobufEnum {
  static const BootAppPopupType BootAppPopupTypeUnknown = BootAppPopupType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'BootAppPopupTypeUnknown');
  static const BootAppPopupType BootAppPopupTypeCommon = BootAppPopupType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'BootAppPopupTypeCommon');

  static const $core.List<BootAppPopupType> values = <BootAppPopupType>[
    BootAppPopupTypeUnknown,
    BootAppPopupTypeCommon,
  ];

  static final $core.Map<$core.int, BootAppPopupType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static BootAppPopupType? valueOf($core.int value) => _byValue[value];

  const BootAppPopupType._($core.int v, $core.String n) : super(v, n);
}
