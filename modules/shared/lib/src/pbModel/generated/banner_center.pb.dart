///
//  Generated code. Do not modify.
//  source: banner_center.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BaseBannerItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BaseBannerItem',
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
    ..aOM<BaseBannerOptionData>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'opt',
        subBuilder: BaseBannerOptionData.create)
    ..hasRequiredFields = false;

  BaseBannerItem._() : super();
  factory BaseBannerItem({
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
    BaseBannerOptionData? opt,
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
  factory BaseBannerItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BaseBannerItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BaseBannerItem clone() => BaseBannerItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BaseBannerItem copyWith(void Function(BaseBannerItem) updates) =>
      super.copyWith((message) => updates(message as BaseBannerItem))
          as BaseBannerItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BaseBannerItem create() => BaseBannerItem._();
  BaseBannerItem createEmptyInstance() => create();
  static $pb.PbList<BaseBannerItem> createRepeated() =>
      $pb.PbList<BaseBannerItem>();
  @$core.pragma('dart2js:noInline')
  static BaseBannerItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BaseBannerItem>(create);
  static BaseBannerItem? _defaultInstance;

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
  BaseBannerOptionData get opt => $_getN(10);
  @$pb.TagNumber(11)
  set opt(BaseBannerOptionData v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasOpt() => $_has(10);
  @$pb.TagNumber(11)
  void clearOpt() => clearField(11);
  @$pb.TagNumber(11)
  BaseBannerOptionData ensureOpt() => $_ensure(10);
}

class BaseBannerOptionData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BaseBannerOptionData',
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

  BaseBannerOptionData._() : super();
  factory BaseBannerOptionData({
    $core.bool? showClose,
  }) {
    final _result = create();
    if (showClose != null) {
      _result.showClose = showClose;
    }
    return _result;
  }
  factory BaseBannerOptionData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BaseBannerOptionData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BaseBannerOptionData clone() =>
      BaseBannerOptionData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BaseBannerOptionData copyWith(void Function(BaseBannerOptionData) updates) =>
      super.copyWith((message) => updates(message as BaseBannerOptionData))
          as BaseBannerOptionData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BaseBannerOptionData create() => BaseBannerOptionData._();
  BaseBannerOptionData createEmptyInstance() => create();
  static $pb.PbList<BaseBannerOptionData> createRepeated() =>
      $pb.PbList<BaseBannerOptionData>();
  @$core.pragma('dart2js:noInline')
  static BaseBannerOptionData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BaseBannerOptionData>(create);
  static BaseBannerOptionData? _defaultInstance;

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

class ResBannerCenter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResBannerCenter',
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
    ..aOM<BannerCenterData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BannerCenterData.create)
    ..hasRequiredFields = false;

  ResBannerCenter._() : super();
  factory ResBannerCenter({
    $core.bool? success,
    $core.String? msg,
    BannerCenterData? data,
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
  factory ResBannerCenter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResBannerCenter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResBannerCenter clone() => ResBannerCenter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResBannerCenter copyWith(void Function(ResBannerCenter) updates) =>
      super.copyWith((message) => updates(message as ResBannerCenter))
          as ResBannerCenter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResBannerCenter create() => ResBannerCenter._();
  ResBannerCenter createEmptyInstance() => create();
  static $pb.PbList<ResBannerCenter> createRepeated() =>
      $pb.PbList<ResBannerCenter>();
  @$core.pragma('dart2js:noInline')
  static ResBannerCenter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResBannerCenter>(create);
  static ResBannerCenter? _defaultInstance;

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
  BannerCenterData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BannerCenterData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BannerCenterData ensureData() => $_ensure(2);
}

class BannerCenterData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BannerCenterData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<BannerCenterTab>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabs',
        $pb.PbFieldType.PM,
        subBuilder: BannerCenterTab.create)
    ..aOM<BaseBannerOptionData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'opt',
        subBuilder: BaseBannerOptionData.create)
    ..hasRequiredFields = false;

  BannerCenterData._() : super();
  factory BannerCenterData({
    $core.Iterable<BannerCenterTab>? tabs,
    BaseBannerOptionData? opt,
  }) {
    final _result = create();
    if (tabs != null) {
      _result.tabs.addAll(tabs);
    }
    if (opt != null) {
      _result.opt = opt;
    }
    return _result;
  }
  factory BannerCenterData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BannerCenterData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BannerCenterData clone() => BannerCenterData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BannerCenterData copyWith(void Function(BannerCenterData) updates) =>
      super.copyWith((message) => updates(message as BannerCenterData))
          as BannerCenterData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BannerCenterData create() => BannerCenterData._();
  BannerCenterData createEmptyInstance() => create();
  static $pb.PbList<BannerCenterData> createRepeated() =>
      $pb.PbList<BannerCenterData>();
  @$core.pragma('dart2js:noInline')
  static BannerCenterData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BannerCenterData>(create);
  static BannerCenterData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BannerCenterTab> get tabs => $_getList(0);

  @$pb.TagNumber(2)
  BaseBannerOptionData get opt => $_getN(1);
  @$pb.TagNumber(2)
  set opt(BaseBannerOptionData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOpt() => $_has(1);
  @$pb.TagNumber(2)
  void clearOpt() => clearField(2);
  @$pb.TagNumber(2)
  BaseBannerOptionData ensureOpt() => $_ensure(1);
}

class BannerCenterTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BannerCenterTab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showType',
        $pb.PbFieldType.O3)
    ..pc<BaseBannerItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: BaseBannerItem.create)
    ..hasRequiredFields = false;

  BannerCenterTab._() : super();
  factory BannerCenterTab({
    $core.String? name,
    $core.int? showType,
    $core.Iterable<BaseBannerItem>? items,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (showType != null) {
      _result.showType = showType;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory BannerCenterTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BannerCenterTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BannerCenterTab clone() => BannerCenterTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BannerCenterTab copyWith(void Function(BannerCenterTab) updates) =>
      super.copyWith((message) => updates(message as BannerCenterTab))
          as BannerCenterTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BannerCenterTab create() => BannerCenterTab._();
  BannerCenterTab createEmptyInstance() => create();
  static $pb.PbList<BannerCenterTab> createRepeated() =>
      $pb.PbList<BannerCenterTab>();
  @$core.pragma('dart2js:noInline')
  static BannerCenterTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BannerCenterTab>(create);
  static BannerCenterTab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get showType => $_getIZ(1);
  @$pb.TagNumber(2)
  set showType($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShowType() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowType() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<BaseBannerItem> get items => $_getList(2);
}

class ResRechargeBanner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRechargeBanner',
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
    ..pc<RechargeBanner>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: RechargeBanner.create)
    ..hasRequiredFields = false;

  ResRechargeBanner._() : super();
  factory ResRechargeBanner({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<RechargeBanner>? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory ResRechargeBanner.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRechargeBanner.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRechargeBanner clone() => ResRechargeBanner()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRechargeBanner copyWith(void Function(ResRechargeBanner) updates) =>
      super.copyWith((message) => updates(message as ResRechargeBanner))
          as ResRechargeBanner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRechargeBanner create() => ResRechargeBanner._();
  ResRechargeBanner createEmptyInstance() => create();
  static $pb.PbList<ResRechargeBanner> createRepeated() =>
      $pb.PbList<ResRechargeBanner>();
  @$core.pragma('dart2js:noInline')
  static ResRechargeBanner getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRechargeBanner>(create);
  static ResRechargeBanner? _defaultInstance;

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
  $core.List<RechargeBanner> get data => $_getList(2);
}

class RechargeBanner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RechargeBanner',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bannerUrl')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpTo')
    ..hasRequiredFields = false;

  RechargeBanner._() : super();
  factory RechargeBanner({
    $core.String? bannerUrl,
    $core.String? jumpTo,
  }) {
    final _result = create();
    if (bannerUrl != null) {
      _result.bannerUrl = bannerUrl;
    }
    if (jumpTo != null) {
      _result.jumpTo = jumpTo;
    }
    return _result;
  }
  factory RechargeBanner.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RechargeBanner.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RechargeBanner clone() => RechargeBanner()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RechargeBanner copyWith(void Function(RechargeBanner) updates) =>
      super.copyWith((message) => updates(message as RechargeBanner))
          as RechargeBanner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RechargeBanner create() => RechargeBanner._();
  RechargeBanner createEmptyInstance() => create();
  static $pb.PbList<RechargeBanner> createRepeated() =>
      $pb.PbList<RechargeBanner>();
  @$core.pragma('dart2js:noInline')
  static RechargeBanner getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RechargeBanner>(create);
  static RechargeBanner? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bannerUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set bannerUrl($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBannerUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearBannerUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get jumpTo => $_getSZ(1);
  @$pb.TagNumber(2)
  set jumpTo($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasJumpTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearJumpTo() => clearField(2);
}
