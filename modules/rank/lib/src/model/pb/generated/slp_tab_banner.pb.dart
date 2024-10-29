///
//  Generated code. Do not modify.
//  source: slp_tab_banner.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResTabBanner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResTabBanner',
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
    ..aOM<TabBannerData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: TabBannerData.create)
    ..hasRequiredFields = false;

  ResTabBanner._() : super();
  factory ResTabBanner({
    $core.bool? success,
    $core.String? msg,
    TabBannerData? data,
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
  factory ResTabBanner.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResTabBanner.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResTabBanner clone() => ResTabBanner()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResTabBanner copyWith(void Function(ResTabBanner) updates) =>
      super.copyWith((message) => updates(message as ResTabBanner))
          as ResTabBanner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResTabBanner create() => ResTabBanner._();
  ResTabBanner createEmptyInstance() => create();
  static $pb.PbList<ResTabBanner> createRepeated() =>
      $pb.PbList<ResTabBanner>();
  @$core.pragma('dart2js:noInline')
  static ResTabBanner getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResTabBanner>(create);
  static ResTabBanner? _defaultInstance;

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
  TabBannerData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(TabBannerData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  TabBannerData ensureData() => $_ensure(2);
}

class TabBannerData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TabBannerData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<TabBannerItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: TabBannerItem.create)
    ..aOM<TabBannerOptionData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'opt',
        subBuilder: TabBannerOptionData.create)
    ..hasRequiredFields = false;

  TabBannerData._() : super();
  factory TabBannerData({
    $core.Iterable<TabBannerItem>? items,
    TabBannerOptionData? opt,
  }) {
    final _result = create();
    if (items != null) {
      _result.items.addAll(items);
    }
    if (opt != null) {
      _result.opt = opt;
    }
    return _result;
  }
  factory TabBannerData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TabBannerData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TabBannerData clone() => TabBannerData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TabBannerData copyWith(void Function(TabBannerData) updates) =>
      super.copyWith((message) => updates(message as TabBannerData))
          as TabBannerData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TabBannerData create() => TabBannerData._();
  TabBannerData createEmptyInstance() => create();
  static $pb.PbList<TabBannerData> createRepeated() =>
      $pb.PbList<TabBannerData>();
  @$core.pragma('dart2js:noInline')
  static TabBannerData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TabBannerData>(create);
  static TabBannerData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TabBannerItem> get items => $_getList(0);

  @$pb.TagNumber(2)
  TabBannerOptionData get opt => $_getN(1);
  @$pb.TagNumber(2)
  set opt(TabBannerOptionData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOpt() => $_has(1);
  @$pb.TagNumber(2)
  void clearOpt() => clearField(2);
  @$pb.TagNumber(2)
  TabBannerOptionData ensureOpt() => $_ensure(1);
}

class TabBannerItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TabBannerItem',
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
            : 'image')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOM<TabBannerOptionData>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'opt',
        subBuilder: TabBannerOptionData.create)
    ..hasRequiredFields = false;

  TabBannerItem._() : super();
  factory TabBannerItem({
    $core.int? id,
    $core.String? image,
    $core.int? width,
    $core.int? height,
    $core.int? duration,
    $core.String? url,
    $core.String? title,
    $core.String? position,
    $core.String? data,
    $core.String? type,
    TabBannerOptionData? opt,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (image != null) {
      _result.image = image;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (url != null) {
      _result.url = url;
    }
    if (title != null) {
      _result.title = title;
    }
    if (position != null) {
      _result.position = position;
    }
    if (data != null) {
      _result.data = data;
    }
    if (type != null) {
      _result.type = type;
    }
    if (opt != null) {
      _result.opt = opt;
    }
    return _result;
  }
  factory TabBannerItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TabBannerItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TabBannerItem clone() => TabBannerItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TabBannerItem copyWith(void Function(TabBannerItem) updates) =>
      super.copyWith((message) => updates(message as TabBannerItem))
          as TabBannerItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TabBannerItem create() => TabBannerItem._();
  TabBannerItem createEmptyInstance() => create();
  static $pb.PbList<TabBannerItem> createRepeated() =>
      $pb.PbList<TabBannerItem>();
  @$core.pragma('dart2js:noInline')
  static TabBannerItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TabBannerItem>(create);
  static TabBannerItem? _defaultInstance;

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
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(2)
  set image($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get duration => $_getIZ(4);
  @$pb.TagNumber(5)
  set duration($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuration() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get url => $_getSZ(5);
  @$pb.TagNumber(6)
  set url($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get title => $_getSZ(6);
  @$pb.TagNumber(7)
  set title($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTitle() => $_has(6);
  @$pb.TagNumber(7)
  void clearTitle() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get position => $_getSZ(7);
  @$pb.TagNumber(8)
  set position($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPosition() => $_has(7);
  @$pb.TagNumber(8)
  void clearPosition() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get data => $_getSZ(8);
  @$pb.TagNumber(9)
  set data($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasData() => $_has(8);
  @$pb.TagNumber(9)
  void clearData() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get type => $_getSZ(9);
  @$pb.TagNumber(10)
  set type($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasType() => $_has(9);
  @$pb.TagNumber(10)
  void clearType() => clearField(10);

  @$pb.TagNumber(11)
  TabBannerOptionData get opt => $_getN(10);
  @$pb.TagNumber(11)
  set opt(TabBannerOptionData v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasOpt() => $_has(10);
  @$pb.TagNumber(11)
  void clearOpt() => clearField(11);
  @$pb.TagNumber(11)
  TabBannerOptionData ensureOpt() => $_ensure(10);
}

class TabBannerOptionData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TabBannerOptionData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showClose')
    ..hasRequiredFields = false;

  TabBannerOptionData._() : super();
  factory TabBannerOptionData({
    $core.bool? showClose,
  }) {
    final _result = create();
    if (showClose != null) {
      _result.showClose = showClose;
    }
    return _result;
  }
  factory TabBannerOptionData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TabBannerOptionData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TabBannerOptionData clone() => TabBannerOptionData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TabBannerOptionData copyWith(void Function(TabBannerOptionData) updates) =>
      super.copyWith((message) => updates(message as TabBannerOptionData))
          as TabBannerOptionData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TabBannerOptionData create() => TabBannerOptionData._();
  TabBannerOptionData createEmptyInstance() => create();
  static $pb.PbList<TabBannerOptionData> createRepeated() =>
      $pb.PbList<TabBannerOptionData>();
  @$core.pragma('dart2js:noInline')
  static TabBannerOptionData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TabBannerOptionData>(create);
  static TabBannerOptionData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get showClose => $_getBF(0);
  @$pb.TagNumber(1)
  set showClose($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShowClose() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowClose() => clearField(1);
}
