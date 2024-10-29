///
//  Generated code. Do not modify.
//  source: api_config.proto
//
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core';

import 'package:protobuf/protobuf.dart';

class ResAppAssetUpdateConfig extends GeneratedMessage {
  static final BuilderInfo _i = BuilderInfo(
      const bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAppAssetUpdateConfig',
      package: const PackageName(
          const bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2, const bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg')
    ..aOM<AppAssetConfigData>(3,
        const bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data',
        subBuilder: AppAssetConfigData.create)
    ..hasRequiredFields = false;

  ResAppAssetUpdateConfig._() : super();
  factory ResAppAssetUpdateConfig() => create();
  factory ResAppAssetUpdateConfig.fromBuffer(List<int> i,
          [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAppAssetUpdateConfig.fromJson(String i,
          [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAppAssetUpdateConfig clone() =>
      ResAppAssetUpdateConfig()..mergeFromMessage(this);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAppAssetUpdateConfig copyWith(
          void Function(ResAppAssetUpdateConfig) updates) =>
      super.copyWith((message) => updates(message as ResAppAssetUpdateConfig))
          as ResAppAssetUpdateConfig; // ignore: deprecated_member_use
  BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static ResAppAssetUpdateConfig create() => ResAppAssetUpdateConfig._();
  ResAppAssetUpdateConfig createEmptyInstance() => create();
  static PbList<ResAppAssetUpdateConfig> createRepeated() =>
      PbList<ResAppAssetUpdateConfig>();
  @pragma('dart2js:noInline')
  static ResAppAssetUpdateConfig getDefault() => _defaultInstance ??=
      GeneratedMessage.$_defaultFor<ResAppAssetUpdateConfig>(create);
  static ResAppAssetUpdateConfig? _defaultInstance;

  @TagNumber(1)
  bool get success => $_getBF(0);
  @TagNumber(1)
  set success(bool v) {
    $_setBool(0, v);
  }

  @TagNumber(1)
  bool hasSuccess() => $_has(0);
  @TagNumber(1)
  void clearSuccess() => clearField(1);

  @TagNumber(2)
  String get msg => $_getSZ(1);
  @TagNumber(2)
  set msg(String v) {
    $_setString(1, v);
  }

  @TagNumber(2)
  bool hasMsg() => $_has(1);
  @TagNumber(2)
  void clearMsg() => clearField(2);

  @TagNumber(3)
  AppAssetConfigData get data => $_getN(2);
  @TagNumber(3)
  set data(AppAssetConfigData v) {
    setField(3, v);
  }

  @TagNumber(3)
  bool hasData() => $_has(2);
  @TagNumber(3)
  void clearData() => clearField(3);
  @TagNumber(3)
  AppAssetConfigData ensureData() => $_ensure(2);
}

class AppAssetConfigData extends GeneratedMessage {
  static final BuilderInfo _i = BuilderInfo(
      const bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AppAssetConfigData',
      package: const PackageName(
          const bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'targetVersion')
    ..aOS(
        2,
        const bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'assetManifestMd5')
    ..aOS(
        4,
        const bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'domainUrl')
    ..hasRequiredFields = false;

  AppAssetConfigData._() : super();
  factory AppAssetConfigData() => create();
  factory AppAssetConfigData.fromBuffer(List<int> i,
          [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AppAssetConfigData.fromJson(String i,
          [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AppAssetConfigData clone() => AppAssetConfigData()..mergeFromMessage(this);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AppAssetConfigData copyWith(void Function(AppAssetConfigData) updates) =>
      super.copyWith((message) => updates(message as AppAssetConfigData))
          as AppAssetConfigData; // ignore: deprecated_member_use
  BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static AppAssetConfigData create() => AppAssetConfigData._();
  AppAssetConfigData createEmptyInstance() => create();
  static PbList<AppAssetConfigData> createRepeated() =>
      PbList<AppAssetConfigData>();
  @pragma('dart2js:noInline')
  static AppAssetConfigData getDefault() => _defaultInstance ??=
      GeneratedMessage.$_defaultFor<AppAssetConfigData>(create);
  static AppAssetConfigData? _defaultInstance;

  @TagNumber(1)
  String get targetVersion => $_getSZ(0);
  @TagNumber(1)
  set targetVersion(String v) {
    $_setString(0, v);
  }

  @TagNumber(1)
  bool hasTargetVersion() => $_has(0);
  @TagNumber(1)
  void clearTargetVersion() => clearField(1);

  @TagNumber(2)
  String get assetManifestMd5 => $_getSZ(1);
  @TagNumber(2)
  set assetManifestMd5(String v) {
    $_setString(1, v);
  }

  @TagNumber(2)
  bool hasAssetManifestMd5() => $_has(1);
  @TagNumber(2)
  void clearAssetManifestMd5() => clearField(2);

  @TagNumber(4)
  String get domainUrl => $_getSZ(2);
  @TagNumber(4)
  set domainUrl(String v) {
    $_setString(2, v);
  }

  @TagNumber(4)
  bool hasDomainUrl() => $_has(2);
  @TagNumber(4)
  void clearDomainUrl() => clearField(4);
}
