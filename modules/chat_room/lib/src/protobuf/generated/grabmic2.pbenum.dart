///
//  Generated code. Do not modify.
//  source: grabmic2.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class GrabMicResult extends $pb.ProtobufEnum {
  static const GrabMicResult Unknown = GrabMicResult._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Unknown');
  static const GrabMicResult Pass = GrabMicResult._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Pass');
  static const GrabMicResult PassChorused = GrabMicResult._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PassChorused');
  static const GrabMicResult Fail = GrabMicResult._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Fail');
  static const GrabMicResult FailChorused = GrabMicResult._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'FailChorused');
  static const GrabMicResult NoGrab = GrabMicResult._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'NoGrab');
  static const GrabMicResult NoCooperation = GrabMicResult._(
      6,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'NoCooperation');
  static const GrabMicResult Accepted = GrabMicResult._(
      7,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Accepted');

  static const $core.List<GrabMicResult> values = <GrabMicResult>[
    Unknown,
    Pass,
    PassChorused,
    Fail,
    FailChorused,
    NoGrab,
    NoCooperation,
    Accepted,
  ];

  static final $core.Map<$core.int, GrabMicResult> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static GrabMicResult? valueOf($core.int value) => _byValue[value];

  const GrabMicResult._($core.int v, $core.String n) : super(v, n);
}

class GrabMicState extends $pb.ProtobufEnum {
  static const GrabMicState UnknownState = GrabMicState._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UnknownState');
  static const GrabMicState Wait = GrabMicState._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Wait');
  static const GrabMicState Start = GrabMicState._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Start');
  static const GrabMicState Play = GrabMicState._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Play');
  static const GrabMicState StartGrab = GrabMicState._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'StartGrab');
  static const GrabMicState PublishGrab = GrabMicState._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PublishGrab');
  static const GrabMicState Sing = GrabMicState._(
      6,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Sing');
  static const GrabMicState WaitSingResult = GrabMicState._(
      7,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'WaitSingResult');
  static const GrabMicState SingResult = GrabMicState._(
      8,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SingResult');
  static const GrabMicState Next = GrabMicState._(
      9,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Next');
  static const GrabMicState StartEnd = GrabMicState._(
      10,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'StartEnd');
  static const GrabMicState End = GrabMicState._(
      11,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'End');

  static const $core.List<GrabMicState> values = <GrabMicState>[
    UnknownState,
    Wait,
    Start,
    Play,
    StartGrab,
    PublishGrab,
    Sing,
    WaitSingResult,
    SingResult,
    Next,
    StartEnd,
    End,
  ];

  static final $core.Map<$core.int, GrabMicState> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static GrabMicState? valueOf($core.int value) => _byValue[value];

  const GrabMicState._($core.int v, $core.String n) : super(v, n);
}
