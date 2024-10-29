///
//  Generated code. Do not modify.
//  source: ad.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AdScreenType extends $pb.ProtobufEnum {
  static const AdScreenType AdScreenNone = AdScreenType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'AdScreenNone');
  static const AdScreenType AdScreenBannerType = AdScreenType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'AdScreenBannerType');
  static const AdScreenType AdScreenAudioType = AdScreenType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'AdScreenAudioType');

  static const $core.List<AdScreenType> values = <AdScreenType>[
    AdScreenNone,
    AdScreenBannerType,
    AdScreenAudioType,
  ];

  static final $core.Map<$core.int, AdScreenType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static AdScreenType? valueOf($core.int value) => _byValue[value];

  const AdScreenType._($core.int v, $core.String n) : super(v, n);
}
