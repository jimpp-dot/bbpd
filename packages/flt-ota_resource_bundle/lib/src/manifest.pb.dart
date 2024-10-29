///
//  Generated code. Do not modify.
//  source: manifest.proto
//
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core';

import 'package:protobuf/protobuf.dart';

class FileMeta extends GeneratedMessage {
  static final BuilderInfo _i = BuilderInfo(const bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FileMeta',
      createEmptyInstance: create)
    ..aOS(1, const bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'md5')
    ..a<int>(2, const bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'size', PbFieldType.OU3)
    ..hasRequiredFields = false;

  FileMeta._() : super();
  factory FileMeta() => create();
  factory FileMeta.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FileMeta.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FileMeta clone() => FileMeta()..mergeFromMessage(this);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FileMeta copyWith(void Function(FileMeta) updates) =>
      super.copyWith((message) => updates(message as FileMeta)) as FileMeta; // ignore: deprecated_member_use
  BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static FileMeta create() => FileMeta._();
  FileMeta createEmptyInstance() => create();
  static PbList<FileMeta> createRepeated() => PbList<FileMeta>();
  @pragma('dart2js:noInline')
  static FileMeta getDefault() => _defaultInstance ??= GeneratedMessage.$_defaultFor<FileMeta>(create);
  static FileMeta? _defaultInstance;

  @TagNumber(1)
  String get md5 => $_getSZ(0);
  @TagNumber(1)
  set md5(String v) {
    $_setString(0, v);
  }

  @TagNumber(1)
  bool hasMd5() => $_has(0);
  @TagNumber(1)
  void clearMd5() => clearField(1);

  @TagNumber(2)
  int get size => $_getIZ(1);
  @TagNumber(2)
  set size(int v) {
    $_setUnsignedInt32(1, v);
  }

  @TagNumber(2)
  bool hasSize() => $_has(1);
  @TagNumber(2)
  void clearSize() => clearField(2);
}

class Manifest extends GeneratedMessage {
  static final BuilderInfo _i = BuilderInfo(const bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Manifest',
      createEmptyInstance: create)
    ..aOS(1, const bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version')
    ..m<String, FileMeta>(2, const bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'files',
        entryClassName: 'Manifest.FilesEntry',
        keyFieldType: PbFieldType.OS,
        valueFieldType: PbFieldType.OM,
        valueCreator: FileMeta.create,
        valueDefaultOrMaker: FileMeta.getDefault)
    ..hasRequiredFields = false;

  Manifest._() : super();
  factory Manifest() => create();
  factory Manifest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Manifest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Manifest clone() => Manifest()..mergeFromMessage(this);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Manifest copyWith(void Function(Manifest) updates) =>
      super.copyWith((message) => updates(message as Manifest)) as Manifest; // ignore: deprecated_member_use
  BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static Manifest create() => Manifest._();
  Manifest createEmptyInstance() => create();
  static PbList<Manifest> createRepeated() => PbList<Manifest>();
  @pragma('dart2js:noInline')
  static Manifest getDefault() => _defaultInstance ??= GeneratedMessage.$_defaultFor<Manifest>(create);
  static Manifest? _defaultInstance;

  @TagNumber(1)
  String get version => $_getSZ(0);
  @TagNumber(1)
  set version(String v) {
    $_setString(0, v);
  }

  @TagNumber(1)
  bool hasVersion() => $_has(0);
  @TagNumber(1)
  void clearVersion() => clearField(1);

  @TagNumber(2)
  Map<String, FileMeta> get files => $_getMap(1);
}
