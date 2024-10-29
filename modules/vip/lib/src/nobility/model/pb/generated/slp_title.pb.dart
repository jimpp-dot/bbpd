///
//  Generated code. Do not modify.
//  source: slp_title.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResTitleMicSofaSetting extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResTitleMicSofaSetting',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOM<TitleMicSofaData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: TitleMicSofaData.create)
    ..hasRequiredFields = false;

  ResTitleMicSofaSetting._() : super();
  factory ResTitleMicSofaSetting({
    $core.bool? success,
    $core.String? msg,
    TitleMicSofaData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ResTitleMicSofaSetting.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResTitleMicSofaSetting.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResTitleMicSofaSetting clone() =>
      ResTitleMicSofaSetting()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResTitleMicSofaSetting copyWith(
          void Function(ResTitleMicSofaSetting) updates) =>
      super.copyWith((message) => updates(message as ResTitleMicSofaSetting))
          as ResTitleMicSofaSetting; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResTitleMicSofaSetting create() => ResTitleMicSofaSetting._();
  ResTitleMicSofaSetting createEmptyInstance() => create();
  static $pb.PbList<ResTitleMicSofaSetting> createRepeated() =>
      $pb.PbList<ResTitleMicSofaSetting>();
  @$core.pragma('dart2js:noInline')
  static ResTitleMicSofaSetting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResTitleMicSofaSetting>(create);
  static ResTitleMicSofaSetting? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  TitleMicSofaData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(TitleMicSofaData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  TitleMicSofaData ensureData() => $_ensure(2);
}

class TitleMicSofaData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TitleMicSofaData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'enable')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wearLevel',
        $pb.PbFieldType.OU3)
    ..pc<TitleMicSofaInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dropbox',
        $pb.PbFieldType.PM,
        subBuilder: TitleMicSofaInfo.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micNickBgEnable')
    ..hasRequiredFields = false;

  TitleMicSofaData._() : super();
  factory TitleMicSofaData({
    $core.bool? enable,
    $core.int? wearLevel,
    $core.Iterable<TitleMicSofaInfo>? dropbox,
    $core.bool? micNickBgEnable,
  }) {
    final _result = create();
    if (enable != null) {
      _result.enable = enable;
    }
    if (wearLevel != null) {
      _result.wearLevel = wearLevel;
    }
    if (dropbox != null) {
      _result.dropbox.addAll(dropbox);
    }
    if (micNickBgEnable != null) {
      _result.micNickBgEnable = micNickBgEnable;
    }
    return _result;
  }
  factory TitleMicSofaData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TitleMicSofaData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TitleMicSofaData clone() => TitleMicSofaData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TitleMicSofaData copyWith(void Function(TitleMicSofaData) updates) =>
      super.copyWith((message) => updates(message as TitleMicSofaData))
          as TitleMicSofaData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TitleMicSofaData create() => TitleMicSofaData._();
  TitleMicSofaData createEmptyInstance() => create();
  static $pb.PbList<TitleMicSofaData> createRepeated() =>
      $pb.PbList<TitleMicSofaData>();
  @$core.pragma('dart2js:noInline')
  static TitleMicSofaData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TitleMicSofaData>(create);
  static TitleMicSofaData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enable => $_getBF(0);
  @$pb.TagNumber(1)
  set enable($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEnable() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnable() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get wearLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set wearLevel($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWearLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearWearLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<TitleMicSofaInfo> get dropbox => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get micNickBgEnable => $_getBF(3);
  @$pb.TagNumber(4)
  set micNickBgEnable($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMicNickBgEnable() => $_has(3);
  @$pb.TagNumber(4)
  void clearMicNickBgEnable() => clearField(4);
}

class TitleMicSofaInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TitleMicSofaInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selected')
    ..hasRequiredFields = false;

  TitleMicSofaInfo._() : super();
  factory TitleMicSofaInfo({
    $core.int? level,
    $core.String? name,
    $core.int? id,
    $core.bool? selected,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (name != null) {
      _result.name = name;
    }
    if (id != null) {
      _result.id = id;
    }
    if (selected != null) {
      _result.selected = selected;
    }
    return _result;
  }
  factory TitleMicSofaInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TitleMicSofaInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TitleMicSofaInfo clone() => TitleMicSofaInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TitleMicSofaInfo copyWith(void Function(TitleMicSofaInfo) updates) =>
      super.copyWith((message) => updates(message as TitleMicSofaInfo))
          as TitleMicSofaInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TitleMicSofaInfo create() => TitleMicSofaInfo._();
  TitleMicSofaInfo createEmptyInstance() => create();
  static $pb.PbList<TitleMicSofaInfo> createRepeated() =>
      $pb.PbList<TitleMicSofaInfo>();
  @$core.pragma('dart2js:noInline')
  static TitleMicSofaInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TitleMicSofaInfo>(create);
  static TitleMicSofaInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get id => $_getIZ(2);
  @$pb.TagNumber(3)
  set id($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get selected => $_getBF(3);
  @$pb.TagNumber(4)
  set selected($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSelected() => $_has(3);
  @$pb.TagNumber(4)
  void clearSelected() => clearField(4);
}
