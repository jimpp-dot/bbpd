///
//  Generated code. Do not modify.
//  source: cmd.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core';

import 'package:protobuf/protobuf.dart';

import 'cmd.pbenum.dart';

export 'cmd.pbenum.dart';

class Cmd extends GeneratedMessage {
  static final BuilderInfo _i = BuilderInfo(
      const bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Cmd',
      createEmptyInstance: create)
    ..e<Op>(
        1,
        const bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'op',
        PbFieldType.OE,
        defaultOrMaker: Op.SetLogLevel,
        valueOf: Op.valueOf,
        enumValues: Op.values)
    ..aOM<Data>(2,
        const bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data',
        subBuilder: Data.create)
    ..hasRequiredFields = false;

  Cmd._() : super();
  factory Cmd() => create();
  factory Cmd.fromBuffer(List<int> i,
          [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Cmd.fromJson(String i,
          [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Cmd clone() => Cmd()..mergeFromMessage(this);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Cmd copyWith(void Function(Cmd) updates) =>
      super.copyWith((message) => updates(message as Cmd))
          as Cmd; // ignore: deprecated_member_use
  BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static Cmd create() => Cmd._();
  Cmd createEmptyInstance() => create();
  static PbList<Cmd> createRepeated() => PbList<Cmd>();
  @pragma('dart2js:noInline')
  static Cmd getDefault() =>
      _defaultInstance ??= GeneratedMessage.$_defaultFor<Cmd>(create);
  static Cmd? _defaultInstance;

  @TagNumber(1)
  Op get op => $_getN(0);
  @TagNumber(1)
  set op(Op v) {
    setField(1, v);
  }

  @TagNumber(1)
  bool hasOp() => $_has(0);
  @TagNumber(1)
  void clearOp() => clearField(1);

  @TagNumber(2)
  Data get data => $_getN(1);
  @TagNumber(2)
  set data(Data v) {
    setField(2, v);
  }

  @TagNumber(2)
  bool hasData() => $_has(1);
  @TagNumber(2)
  void clearData() => clearField(2);
  @TagNumber(2)
  Data ensureData() => $_ensure(1);
}

class Data extends GeneratedMessage {
  static final BuilderInfo _i = BuilderInfo(
      const bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Data',
      createEmptyInstance: create)
    ..e<LogLevel>(
        1,
        const bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logLevel',
        PbFieldType.OE,
        defaultOrMaker: LogLevel.Verbose,
        valueOf: LogLevel.valueOf,
        enumValues: LogLevel.values)
    ..e<LogType>(
        2,
        const bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logType',
        PbFieldType.OE,
        defaultOrMaker: LogType.Console,
        valueOf: LogType.valueOf,
        enumValues: LogType.values)
    ..aOS(3,
        const bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'other')
    ..hasRequiredFields = false;

  Data._() : super();
  factory Data() => create();
  factory Data.fromBuffer(List<int> i,
          [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Data.fromJson(String i,
          [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Data clone() => Data()..mergeFromMessage(this);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Data copyWith(void Function(Data) updates) =>
      super.copyWith((message) => updates(message as Data))
          as Data; // ignore: deprecated_member_use
  BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static Data create() => Data._();
  Data createEmptyInstance() => create();
  static PbList<Data> createRepeated() => PbList<Data>();
  @pragma('dart2js:noInline')
  static Data getDefault() =>
      _defaultInstance ??= GeneratedMessage.$_defaultFor<Data>(create);
  static Data? _defaultInstance;

  @TagNumber(1)
  LogLevel get logLevel => $_getN(0);
  @TagNumber(1)
  set logLevel(LogLevel v) {
    setField(1, v);
  }

  @TagNumber(1)
  bool hasLogLevel() => $_has(0);
  @TagNumber(1)
  void clearLogLevel() => clearField(1);

  @TagNumber(2)
  LogType get logType => $_getN(1);
  @TagNumber(2)
  set logType(LogType v) {
    setField(2, v);
  }

  @TagNumber(2)
  bool hasLogType() => $_has(1);
  @TagNumber(2)
  void clearLogType() => clearField(2);

  @TagNumber(3)
  String get other => $_getSZ(2);
  @TagNumber(3)
  set other(String v) {
    $_setString(2, v);
  }

  @TagNumber(3)
  bool hasOther() => $_has(2);
  @TagNumber(3)
  void clearOther() => clearField(3);
}
