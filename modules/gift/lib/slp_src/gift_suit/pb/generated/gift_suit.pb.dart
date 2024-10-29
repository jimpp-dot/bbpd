///
//  Generated code. Do not modify.
//  source: gift_suit.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class GetSuitInfoResp_Tab_TabItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetSuitInfoResp.Tab.TabItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'img')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imgTwo')
    ..aInt64(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seconds')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourceType',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GetSuitInfoResp_Tab_TabItem._() : super();
  factory GetSuitInfoResp_Tab_TabItem({
    $core.int? id,
    $core.String? name,
    $core.String? img,
    $core.String? imgTwo,
    $fixnum.Int64? seconds,
    $core.int? sourceType,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (img != null) {
      _result.img = img;
    }
    if (imgTwo != null) {
      _result.imgTwo = imgTwo;
    }
    if (seconds != null) {
      _result.seconds = seconds;
    }
    if (sourceType != null) {
      _result.sourceType = sourceType;
    }
    return _result;
  }
  factory GetSuitInfoResp_Tab_TabItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetSuitInfoResp_Tab_TabItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetSuitInfoResp_Tab_TabItem clone() =>
      GetSuitInfoResp_Tab_TabItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetSuitInfoResp_Tab_TabItem copyWith(
          void Function(GetSuitInfoResp_Tab_TabItem) updates) =>
      super.copyWith(
              (message) => updates(message as GetSuitInfoResp_Tab_TabItem))
          as GetSuitInfoResp_Tab_TabItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSuitInfoResp_Tab_TabItem create() =>
      GetSuitInfoResp_Tab_TabItem._();
  GetSuitInfoResp_Tab_TabItem createEmptyInstance() => create();
  static $pb.PbList<GetSuitInfoResp_Tab_TabItem> createRepeated() =>
      $pb.PbList<GetSuitInfoResp_Tab_TabItem>();
  @$core.pragma('dart2js:noInline')
  static GetSuitInfoResp_Tab_TabItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSuitInfoResp_Tab_TabItem>(create);
  static GetSuitInfoResp_Tab_TabItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

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
  $core.String get img => $_getSZ(2);
  @$pb.TagNumber(3)
  set img($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImg() => $_has(2);
  @$pb.TagNumber(3)
  void clearImg() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get imgTwo => $_getSZ(3);
  @$pb.TagNumber(4)
  set imgTwo($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasImgTwo() => $_has(3);
  @$pb.TagNumber(4)
  void clearImgTwo() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get seconds => $_getI64(4);
  @$pb.TagNumber(5)
  set seconds($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSeconds() => $_has(4);
  @$pb.TagNumber(5)
  void clearSeconds() => clearField(5);

  @$pb.TagNumber(7)
  $core.int get sourceType => $_getIZ(5);
  @$pb.TagNumber(7)
  set sourceType($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSourceType() => $_has(5);
  @$pb.TagNumber(7)
  void clearSourceType() => clearField(7);
}

class GetSuitInfoResp_Tab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetSuitInfoResp.Tab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..pc<GetSuitInfoResp_Tab_TabItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: GetSuitInfoResp_Tab_TabItem.create)
    ..hasRequiredFields = false;

  GetSuitInfoResp_Tab._() : super();
  factory GetSuitInfoResp_Tab({
    $core.int? tabId,
    $core.String? name,
    $core.Iterable<GetSuitInfoResp_Tab_TabItem>? items,
  }) {
    final _result = create();
    if (tabId != null) {
      _result.tabId = tabId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory GetSuitInfoResp_Tab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetSuitInfoResp_Tab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetSuitInfoResp_Tab clone() => GetSuitInfoResp_Tab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetSuitInfoResp_Tab copyWith(void Function(GetSuitInfoResp_Tab) updates) =>
      super.copyWith((message) => updates(message as GetSuitInfoResp_Tab))
          as GetSuitInfoResp_Tab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSuitInfoResp_Tab create() => GetSuitInfoResp_Tab._();
  GetSuitInfoResp_Tab createEmptyInstance() => create();
  static $pb.PbList<GetSuitInfoResp_Tab> createRepeated() =>
      $pb.PbList<GetSuitInfoResp_Tab>();
  @$core.pragma('dart2js:noInline')
  static GetSuitInfoResp_Tab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSuitInfoResp_Tab>(create);
  static GetSuitInfoResp_Tab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tabId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tabId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTabId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTabId() => clearField(1);

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
  $core.List<GetSuitInfoResp_Tab_TabItem> get items => $_getList(2);
}

class GetSuitInfoResp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetSuitInfoResp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..pc<GetSuitInfoResp_Tab>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabs',
        $pb.PbFieldType.PM,
        subBuilder: GetSuitInfoResp_Tab.create)
    ..hasRequiredFields = false;

  GetSuitInfoResp_Data._() : super();
  factory GetSuitInfoResp_Data({
    $core.String? title,
    $core.String? desc,
    $core.Iterable<GetSuitInfoResp_Tab>? tabs,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (tabs != null) {
      _result.tabs.addAll(tabs);
    }
    return _result;
  }
  factory GetSuitInfoResp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetSuitInfoResp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetSuitInfoResp_Data clone() =>
      GetSuitInfoResp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetSuitInfoResp_Data copyWith(void Function(GetSuitInfoResp_Data) updates) =>
      super.copyWith((message) => updates(message as GetSuitInfoResp_Data))
          as GetSuitInfoResp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSuitInfoResp_Data create() => GetSuitInfoResp_Data._();
  GetSuitInfoResp_Data createEmptyInstance() => create();
  static $pb.PbList<GetSuitInfoResp_Data> createRepeated() =>
      $pb.PbList<GetSuitInfoResp_Data>();
  @$core.pragma('dart2js:noInline')
  static GetSuitInfoResp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSuitInfoResp_Data>(create);
  static GetSuitInfoResp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<GetSuitInfoResp_Tab> get tabs => $_getList(2);
}

class GetSuitInfoResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetSuitInfoResp',
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
    ..aOM<GetSuitInfoResp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GetSuitInfoResp_Data.create)
    ..hasRequiredFields = false;

  GetSuitInfoResp._() : super();
  factory GetSuitInfoResp({
    $core.bool? success,
    $core.String? msg,
    GetSuitInfoResp_Data? data,
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
  factory GetSuitInfoResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetSuitInfoResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetSuitInfoResp clone() => GetSuitInfoResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetSuitInfoResp copyWith(void Function(GetSuitInfoResp) updates) =>
      super.copyWith((message) => updates(message as GetSuitInfoResp))
          as GetSuitInfoResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSuitInfoResp create() => GetSuitInfoResp._();
  GetSuitInfoResp createEmptyInstance() => create();
  static $pb.PbList<GetSuitInfoResp> createRepeated() =>
      $pb.PbList<GetSuitInfoResp>();
  @$core.pragma('dart2js:noInline')
  static GetSuitInfoResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSuitInfoResp>(create);
  static GetSuitInfoResp? _defaultInstance;

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
  GetSuitInfoResp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GetSuitInfoResp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GetSuitInfoResp_Data ensureData() => $_ensure(2);
}
