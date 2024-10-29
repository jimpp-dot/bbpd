///
//  Generated code. Do not modify.
//  source: emoticon.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResEmoticonSearch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResEmoticonSearch',
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
    ..aOM<EmoticonSearchData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: EmoticonSearchData.create)
    ..hasRequiredFields = false;

  ResEmoticonSearch._() : super();
  factory ResEmoticonSearch({
    $core.bool? success,
    $core.String? msg,
    EmoticonSearchData? data,
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
  factory ResEmoticonSearch.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResEmoticonSearch.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResEmoticonSearch clone() => ResEmoticonSearch()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResEmoticonSearch copyWith(void Function(ResEmoticonSearch) updates) =>
      super.copyWith((message) => updates(message as ResEmoticonSearch))
          as ResEmoticonSearch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResEmoticonSearch create() => ResEmoticonSearch._();
  ResEmoticonSearch createEmptyInstance() => create();
  static $pb.PbList<ResEmoticonSearch> createRepeated() =>
      $pb.PbList<ResEmoticonSearch>();
  @$core.pragma('dart2js:noInline')
  static ResEmoticonSearch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResEmoticonSearch>(create);
  static ResEmoticonSearch? _defaultInstance;

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
  EmoticonSearchData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(EmoticonSearchData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  EmoticonSearchData ensureData() => $_ensure(2);
}

class EmoticonSearchData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EmoticonSearchData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userDefault')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expireSec',
        $pb.PbFieldType.O3)
    ..pc<EmoticonSearchListItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: EmoticonSearchListItem.create)
    ..hasRequiredFields = false;

  EmoticonSearchData._() : super();
  factory EmoticonSearchData({
    $core.bool? userDefault,
    $core.int? expireSec,
    $core.Iterable<EmoticonSearchListItem>? list,
  }) {
    final _result = create();
    if (userDefault != null) {
      _result.userDefault = userDefault;
    }
    if (expireSec != null) {
      _result.expireSec = expireSec;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory EmoticonSearchData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EmoticonSearchData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EmoticonSearchData clone() => EmoticonSearchData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EmoticonSearchData copyWith(void Function(EmoticonSearchData) updates) =>
      super.copyWith((message) => updates(message as EmoticonSearchData))
          as EmoticonSearchData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmoticonSearchData create() => EmoticonSearchData._();
  EmoticonSearchData createEmptyInstance() => create();
  static $pb.PbList<EmoticonSearchData> createRepeated() =>
      $pb.PbList<EmoticonSearchData>();
  @$core.pragma('dart2js:noInline')
  static EmoticonSearchData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmoticonSearchData>(create);
  static EmoticonSearchData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get userDefault => $_getBF(0);
  @$pb.TagNumber(1)
  set userDefault($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserDefault() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserDefault() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get expireSec => $_getIZ(1);
  @$pb.TagNumber(2)
  set expireSec($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasExpireSec() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpireSec() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<EmoticonSearchListItem> get list => $_getList(2);
}

class EmoticonSearchListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EmoticonSearchListItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gif')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.O3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'webp')
    ..hasRequiredFields = false;

  EmoticonSearchListItem._() : super();
  factory EmoticonSearchListItem({
    $core.String? gif,
    $core.int? width,
    $core.int? height,
    $core.String? id,
    $core.String? webp,
  }) {
    final _result = create();
    if (gif != null) {
      _result.gif = gif;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    if (id != null) {
      _result.id = id;
    }
    if (webp != null) {
      _result.webp = webp;
    }
    return _result;
  }
  factory EmoticonSearchListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EmoticonSearchListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EmoticonSearchListItem clone() =>
      EmoticonSearchListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EmoticonSearchListItem copyWith(
          void Function(EmoticonSearchListItem) updates) =>
      super.copyWith((message) => updates(message as EmoticonSearchListItem))
          as EmoticonSearchListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmoticonSearchListItem create() => EmoticonSearchListItem._();
  EmoticonSearchListItem createEmptyInstance() => create();
  static $pb.PbList<EmoticonSearchListItem> createRepeated() =>
      $pb.PbList<EmoticonSearchListItem>();
  @$core.pragma('dart2js:noInline')
  static EmoticonSearchListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmoticonSearchListItem>(create);
  static EmoticonSearchListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gif => $_getSZ(0);
  @$pb.TagNumber(1)
  set gif($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGif() => $_has(0);
  @$pb.TagNumber(1)
  void clearGif() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get width => $_getIZ(1);
  @$pb.TagNumber(2)
  set width($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWidth() => $_has(1);
  @$pb.TagNumber(2)
  void clearWidth() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get height => $_getIZ(2);
  @$pb.TagNumber(3)
  set height($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get id => $_getSZ(3);
  @$pb.TagNumber(4)
  set id($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get webp => $_getSZ(4);
  @$pb.TagNumber(5)
  set webp($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasWebp() => $_has(4);
  @$pb.TagNumber(5)
  void clearWebp() => clearField(5);
}
