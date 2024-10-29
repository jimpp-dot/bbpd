///
//  Generated code. Do not modify.
//  source: room_lead_sing.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class LeadSingState extends $pb.ProtobufEnum {
  static const LeadSingState LEAD_SING_STATE_INIT = LeadSingState._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'LEAD_SING_STATE_INIT');
  static const LeadSingState LEAD_SING_STATE_WAIT = LeadSingState._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'LEAD_SING_STATE_WAIT');
  static const LeadSingState LEAD_SING_STATE_LEAD = LeadSingState._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'LEAD_SING_STATE_LEAD');
  static const LeadSingState LEAD_SING_STATE_GRAB = LeadSingState._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'LEAD_SING_STATE_GRAB');
  static const LeadSingState LEAD_SING_STATE_SING = LeadSingState._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'LEAD_SING_STATE_SING');
  static const LeadSingState LEAD_SING_STAGE_RANK = LeadSingState._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'LEAD_SING_STAGE_RANK');

  static const $core.List<LeadSingState> values = <LeadSingState>[
    LEAD_SING_STATE_INIT,
    LEAD_SING_STATE_WAIT,
    LEAD_SING_STATE_LEAD,
    LEAD_SING_STATE_GRAB,
    LEAD_SING_STATE_SING,
    LEAD_SING_STAGE_RANK,
  ];

  static final $core.Map<$core.int, LeadSingState> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static LeadSingState? valueOf($core.int value) => _byValue[value];

  const LeadSingState._($core.int v, $core.String n) : super(v, n);
}
