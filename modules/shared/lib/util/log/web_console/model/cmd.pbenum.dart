///
//  Generated code. Do not modify.
//  source: cmd.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core';
import 'package:protobuf/protobuf.dart';

class Op extends ProtobufEnum {
  static const Op SetLogLevel = Op._(
      0,
      const bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SetLogLevel');
  static const Op SetLogType = Op._(
      1,
      const bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SetLogType');

  static const List<Op> values = <Op>[
    SetLogLevel,
    SetLogType,
  ];

  static final Map<int, Op> _byValue = ProtobufEnum.initByValue(values);
  static Op? valueOf(int value) => _byValue[value];

  const Op._(int v, String n) : super(v, n);
}

class LogLevel extends ProtobufEnum {
  static const LogLevel Verbose = LogLevel._(0,
      const bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Verbose');
  static const LogLevel Debug = LogLevel._(
      1, const bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Debug');
  static const LogLevel Info = LogLevel._(
      2, const bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Info');
  static const LogLevel Warning = LogLevel._(3,
      const bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Warning');
  static const LogLevel Error = LogLevel._(
      4, const bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Error');
  static const LogLevel Wtf = LogLevel._(
      5, const bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Wtf');
  static const LogLevel Nothing = LogLevel._(6,
      const bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Nothing');

  static const List<LogLevel> values = <LogLevel>[
    Verbose,
    Debug,
    Info,
    Warning,
    Error,
    Wtf,
    Nothing,
  ];

  static final Map<int, LogLevel> _byValue = ProtobufEnum.initByValue(values);
  static LogLevel? valueOf(int value) => _byValue[value];

  const LogLevel._(int v, String n) : super(v, n);
}

class LogType extends ProtobufEnum {
  static const LogType Console = LogType._(0,
      const bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Console');
  static const LogType Http = LogType._(
      1, const bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Http');
  static const LogType RoomSocket = LogType._(
      2,
      const bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'RoomSocket');
  static const LogType ImSocket = LogType._(3,
      const bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ImSocket');
  static const LogType Tracker = LogType._(4,
      const bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Tracker');
  static const LogType ChatSocket = LogType._(
      5,
      const bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ChatSocket');

  static const List<LogType> values = <LogType>[
    Console,
    Http,
    RoomSocket,
    ImSocket,
    Tracker,
    ChatSocket,
  ];

  static final Map<int, LogType> _byValue = ProtobufEnum.initByValue(values);
  static LogType? valueOf(int value) => _byValue[value];

  const LogType._(int v, String n) : super(v, n);
}
