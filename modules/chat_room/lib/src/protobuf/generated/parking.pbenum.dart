///
//  Generated code. Do not modify.
//  source: parking.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class UpgradeMaterialType extends $pb.ProtobufEnum {
  static const UpgradeMaterialType UPGRADE_MATERIAL_NONE =
      UpgradeMaterialType._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'UPGRADE_MATERIAL_NONE');
  static const UpgradeMaterialType UPGRADE_MATERIAL_ENERGY =
      UpgradeMaterialType._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'UPGRADE_MATERIAL_ENERGY');
  static const UpgradeMaterialType UPGRADE_MATERIAL_MONEY =
      UpgradeMaterialType._(
          2,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'UPGRADE_MATERIAL_MONEY');
  static const UpgradeMaterialType UPGRADE_MATERIAL_COMMODITY =
      UpgradeMaterialType._(
          3,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'UPGRADE_MATERIAL_COMMODITY');

  static const $core.List<UpgradeMaterialType> values = <UpgradeMaterialType>[
    UPGRADE_MATERIAL_NONE,
    UPGRADE_MATERIAL_ENERGY,
    UPGRADE_MATERIAL_MONEY,
    UPGRADE_MATERIAL_COMMODITY,
  ];

  static final $core.Map<$core.int, UpgradeMaterialType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static UpgradeMaterialType? valueOf($core.int value) => _byValue[value];

  const UpgradeMaterialType._($core.int v, $core.String n) : super(v, n);
}
