///
//  Generated code. Do not modify.
//  source: emotion.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class EmojiDurationType extends $pb.ProtobufEnum {
  static const EmojiDurationType EmojiDurationNone = EmojiDurationType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'EmojiDurationNone');
  static const EmojiDurationType EmojiDurationMonth = EmojiDurationType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'EmojiDurationMonth');
  static const EmojiDurationType EmojiDurationQuarter = EmojiDurationType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'EmojiDurationQuarter');
  static const EmojiDurationType EmojiDurationYear = EmojiDurationType._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'EmojiDurationYear');

  static const $core.List<EmojiDurationType> values = <EmojiDurationType>[
    EmojiDurationNone,
    EmojiDurationMonth,
    EmojiDurationQuarter,
    EmojiDurationYear,
  ];

  static final $core.Map<$core.int, EmojiDurationType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static EmojiDurationType? valueOf($core.int value) => _byValue[value];

  const EmojiDurationType._($core.int v, $core.String n) : super(v, n);
}
