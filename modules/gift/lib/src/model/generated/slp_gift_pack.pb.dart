///
//  Generated code. Do not modify.
//  source: slp_gift_pack.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResGiftPackCenterTabs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGiftPackCenterTabs',
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
    ..pc<GiftPackCenterTab>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabs',
        $pb.PbFieldType.PM,
        subBuilder: GiftPackCenterTab.create)
    ..hasRequiredFields = false;

  ResGiftPackCenterTabs._() : super();
  factory ResGiftPackCenterTabs({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GiftPackCenterTab>? tabs,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (tabs != null) {
      _result.tabs.addAll(tabs);
    }
    return _result;
  }
  factory ResGiftPackCenterTabs.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGiftPackCenterTabs.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGiftPackCenterTabs clone() =>
      ResGiftPackCenterTabs()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGiftPackCenterTabs copyWith(
          void Function(ResGiftPackCenterTabs) updates) =>
      super.copyWith((message) => updates(message as ResGiftPackCenterTabs))
          as ResGiftPackCenterTabs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGiftPackCenterTabs create() => ResGiftPackCenterTabs._();
  ResGiftPackCenterTabs createEmptyInstance() => create();
  static $pb.PbList<ResGiftPackCenterTabs> createRepeated() =>
      $pb.PbList<ResGiftPackCenterTabs>();
  @$core.pragma('dart2js:noInline')
  static ResGiftPackCenterTabs getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGiftPackCenterTabs>(create);
  static ResGiftPackCenterTabs? _defaultInstance;

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
  $core.List<GiftPackCenterTab> get tabs => $_getList(2);
}

class GiftPackCenterTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftPackCenterTab',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..hasRequiredFields = false;

  GiftPackCenterTab._() : super();
  factory GiftPackCenterTab({
    $core.String? name,
    $core.String? type,
    $core.String? url,
    $core.String? color,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    if (url != null) {
      _result.url = url;
    }
    if (color != null) {
      _result.color = color;
    }
    return _result;
  }
  factory GiftPackCenterTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftPackCenterTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftPackCenterTab clone() => GiftPackCenterTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftPackCenterTab copyWith(void Function(GiftPackCenterTab) updates) =>
      super.copyWith((message) => updates(message as GiftPackCenterTab))
          as GiftPackCenterTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftPackCenterTab create() => GiftPackCenterTab._();
  GiftPackCenterTab createEmptyInstance() => create();
  static $pb.PbList<GiftPackCenterTab> createRepeated() =>
      $pb.PbList<GiftPackCenterTab>();
  @$core.pragma('dart2js:noInline')
  static GiftPackCenterTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftPackCenterTab>(create);
  static GiftPackCenterTab? _defaultInstance;

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
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get color => $_getSZ(3);
  @$pb.TagNumber(4)
  set color($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasColor() => $_has(3);
  @$pb.TagNumber(4)
  void clearColor() => clearField(4);
}

class ResGiftPackDailyConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGiftPackDailyConfig',
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
    ..aOM<GiftPackDailyConfig>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftPackDailyConfig.create)
    ..hasRequiredFields = false;

  ResGiftPackDailyConfig._() : super();
  factory ResGiftPackDailyConfig({
    $core.bool? success,
    $core.String? msg,
    GiftPackDailyConfig? data,
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
  factory ResGiftPackDailyConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGiftPackDailyConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGiftPackDailyConfig clone() =>
      ResGiftPackDailyConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGiftPackDailyConfig copyWith(
          void Function(ResGiftPackDailyConfig) updates) =>
      super.copyWith((message) => updates(message as ResGiftPackDailyConfig))
          as ResGiftPackDailyConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGiftPackDailyConfig create() => ResGiftPackDailyConfig._();
  ResGiftPackDailyConfig createEmptyInstance() => create();
  static $pb.PbList<ResGiftPackDailyConfig> createRepeated() =>
      $pb.PbList<ResGiftPackDailyConfig>();
  @$core.pragma('dart2js:noInline')
  static ResGiftPackDailyConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGiftPackDailyConfig>(create);
  static ResGiftPackDailyConfig? _defaultInstance;

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
  GiftPackDailyConfig get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftPackDailyConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftPackDailyConfig ensureData() => $_ensure(2);
}

class ResGiftPackOpen extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGiftPackOpen',
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
    ..aOM<GiftPackOpen>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftPackOpen.create)
    ..pc<GiftPackOpen>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dataList',
        $pb.PbFieldType.PM,
        subBuilder: GiftPackOpen.create)
    ..hasRequiredFields = false;

  ResGiftPackOpen._() : super();
  factory ResGiftPackOpen({
    $core.bool? success,
    $core.String? msg,
    GiftPackOpen? data,
    $core.Iterable<GiftPackOpen>? dataList,
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
    if (dataList != null) {
      _result.dataList.addAll(dataList);
    }
    return _result;
  }
  factory ResGiftPackOpen.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGiftPackOpen.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGiftPackOpen clone() => ResGiftPackOpen()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGiftPackOpen copyWith(void Function(ResGiftPackOpen) updates) =>
      super.copyWith((message) => updates(message as ResGiftPackOpen))
          as ResGiftPackOpen; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGiftPackOpen create() => ResGiftPackOpen._();
  ResGiftPackOpen createEmptyInstance() => create();
  static $pb.PbList<ResGiftPackOpen> createRepeated() =>
      $pb.PbList<ResGiftPackOpen>();
  @$core.pragma('dart2js:noInline')
  static ResGiftPackOpen getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGiftPackOpen>(create);
  static ResGiftPackOpen? _defaultInstance;

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
  GiftPackOpen get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftPackOpen v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftPackOpen ensureData() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<GiftPackOpen> get dataList => $_getList(3);
}

class GiftPackOpen extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftPackOpen',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityIcon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityName')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'periodDay',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'periodHour',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tips')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftPackOpen._() : super();
  factory GiftPackOpen({
    $core.String? commodityIcon,
    $core.String? commodityName,
    $core.int? periodDay,
    $core.int? periodHour,
    $core.String? tips,
    $core.int? cid,
    $core.int? count,
  }) {
    final _result = create();
    if (commodityIcon != null) {
      _result.commodityIcon = commodityIcon;
    }
    if (commodityName != null) {
      _result.commodityName = commodityName;
    }
    if (periodDay != null) {
      _result.periodDay = periodDay;
    }
    if (periodHour != null) {
      _result.periodHour = periodHour;
    }
    if (tips != null) {
      _result.tips = tips;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory GiftPackOpen.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftPackOpen.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftPackOpen clone() => GiftPackOpen()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftPackOpen copyWith(void Function(GiftPackOpen) updates) =>
      super.copyWith((message) => updates(message as GiftPackOpen))
          as GiftPackOpen; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftPackOpen create() => GiftPackOpen._();
  GiftPackOpen createEmptyInstance() => create();
  static $pb.PbList<GiftPackOpen> createRepeated() =>
      $pb.PbList<GiftPackOpen>();
  @$core.pragma('dart2js:noInline')
  static GiftPackOpen getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftPackOpen>(create);
  static GiftPackOpen? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get commodityIcon => $_getSZ(0);
  @$pb.TagNumber(1)
  set commodityIcon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCommodityIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommodityIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get commodityName => $_getSZ(1);
  @$pb.TagNumber(2)
  set commodityName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCommodityName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommodityName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get periodDay => $_getIZ(2);
  @$pb.TagNumber(3)
  set periodDay($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPeriodDay() => $_has(2);
  @$pb.TagNumber(3)
  void clearPeriodDay() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get periodHour => $_getIZ(3);
  @$pb.TagNumber(4)
  set periodHour($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPeriodHour() => $_has(3);
  @$pb.TagNumber(4)
  void clearPeriodHour() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get tips => $_getSZ(4);
  @$pb.TagNumber(5)
  set tips($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTips() => $_has(4);
  @$pb.TagNumber(5)
  void clearTips() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get cid => $_getIZ(5);
  @$pb.TagNumber(6)
  set cid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCid() => $_has(5);
  @$pb.TagNumber(6)
  void clearCid() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get count => $_getIZ(6);
  @$pb.TagNumber(7)
  set count($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearCount() => clearField(7);
}

class ResGiftPackGetPrayAward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGiftPackGetPrayAward',
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
    ..aOM<GiftPackGetPrayAward>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftPackGetPrayAward.create)
    ..hasRequiredFields = false;

  ResGiftPackGetPrayAward._() : super();
  factory ResGiftPackGetPrayAward({
    $core.bool? success,
    $core.String? msg,
    GiftPackGetPrayAward? data,
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
  factory ResGiftPackGetPrayAward.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGiftPackGetPrayAward.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGiftPackGetPrayAward clone() =>
      ResGiftPackGetPrayAward()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGiftPackGetPrayAward copyWith(
          void Function(ResGiftPackGetPrayAward) updates) =>
      super.copyWith((message) => updates(message as ResGiftPackGetPrayAward))
          as ResGiftPackGetPrayAward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGiftPackGetPrayAward create() => ResGiftPackGetPrayAward._();
  ResGiftPackGetPrayAward createEmptyInstance() => create();
  static $pb.PbList<ResGiftPackGetPrayAward> createRepeated() =>
      $pb.PbList<ResGiftPackGetPrayAward>();
  @$core.pragma('dart2js:noInline')
  static ResGiftPackGetPrayAward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGiftPackGetPrayAward>(create);
  static ResGiftPackGetPrayAward? _defaultInstance;

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
  GiftPackGetPrayAward get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftPackGetPrayAward v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftPackGetPrayAward ensureData() => $_ensure(2);
}

class ResGiftPackCouponLog extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGiftPackCouponLog',
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
    ..pc<GiftPackCouponLogItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'couponList',
        $pb.PbFieldType.PM,
        subBuilder: GiftPackCouponLogItem.create)
    ..hasRequiredFields = false;

  ResGiftPackCouponLog._() : super();
  factory ResGiftPackCouponLog({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GiftPackCouponLogItem>? couponList,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (couponList != null) {
      _result.couponList.addAll(couponList);
    }
    return _result;
  }
  factory ResGiftPackCouponLog.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGiftPackCouponLog.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGiftPackCouponLog clone() =>
      ResGiftPackCouponLog()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGiftPackCouponLog copyWith(void Function(ResGiftPackCouponLog) updates) =>
      super.copyWith((message) => updates(message as ResGiftPackCouponLog))
          as ResGiftPackCouponLog; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGiftPackCouponLog create() => ResGiftPackCouponLog._();
  ResGiftPackCouponLog createEmptyInstance() => create();
  static $pb.PbList<ResGiftPackCouponLog> createRepeated() =>
      $pb.PbList<ResGiftPackCouponLog>();
  @$core.pragma('dart2js:noInline')
  static ResGiftPackCouponLog getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGiftPackCouponLog>(create);
  static ResGiftPackCouponLog? _defaultInstance;

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
  $core.List<GiftPackCouponLogItem> get couponList => $_getList(2);
}

class GiftPackCouponLogItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftPackCouponLogItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subject')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftPackCouponLogItem._() : super();
  factory GiftPackCouponLogItem({
    $core.String? subject,
    $core.int? createTime,
    $core.int? num,
    $core.int? type,
  }) {
    final _result = create();
    if (subject != null) {
      _result.subject = subject;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (num != null) {
      _result.num = num;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory GiftPackCouponLogItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftPackCouponLogItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftPackCouponLogItem clone() =>
      GiftPackCouponLogItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftPackCouponLogItem copyWith(
          void Function(GiftPackCouponLogItem) updates) =>
      super.copyWith((message) => updates(message as GiftPackCouponLogItem))
          as GiftPackCouponLogItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftPackCouponLogItem create() => GiftPackCouponLogItem._();
  GiftPackCouponLogItem createEmptyInstance() => create();
  static $pb.PbList<GiftPackCouponLogItem> createRepeated() =>
      $pb.PbList<GiftPackCouponLogItem>();
  @$core.pragma('dart2js:noInline')
  static GiftPackCouponLogItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftPackCouponLogItem>(create);
  static GiftPackCouponLogItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get subject => $_getSZ(0);
  @$pb.TagNumber(1)
  set subject($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSubject() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubject() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get createTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set createTime($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCreateTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreateTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get type => $_getIZ(3);
  @$pb.TagNumber(4)
  set type($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);
}

class ResGiftPackPrayHistory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGiftPackPrayHistory',
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
    ..pc<GiftPackPrayHistoryItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'historyList',
        $pb.PbFieldType.PM,
        subBuilder: GiftPackPrayHistoryItem.create)
    ..hasRequiredFields = false;

  ResGiftPackPrayHistory._() : super();
  factory ResGiftPackPrayHistory({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GiftPackPrayHistoryItem>? historyList,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (historyList != null) {
      _result.historyList.addAll(historyList);
    }
    return _result;
  }
  factory ResGiftPackPrayHistory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGiftPackPrayHistory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGiftPackPrayHistory clone() =>
      ResGiftPackPrayHistory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGiftPackPrayHistory copyWith(
          void Function(ResGiftPackPrayHistory) updates) =>
      super.copyWith((message) => updates(message as ResGiftPackPrayHistory))
          as ResGiftPackPrayHistory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGiftPackPrayHistory create() => ResGiftPackPrayHistory._();
  ResGiftPackPrayHistory createEmptyInstance() => create();
  static $pb.PbList<ResGiftPackPrayHistory> createRepeated() =>
      $pb.PbList<ResGiftPackPrayHistory>();
  @$core.pragma('dart2js:noInline')
  static ResGiftPackPrayHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGiftPackPrayHistory>(create);
  static ResGiftPackPrayHistory? _defaultInstance;

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
  $core.List<GiftPackPrayHistoryItem> get historyList => $_getList(2);
}

class GiftPackPrayHistoryItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftPackPrayHistoryItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createTime',
        $pb.PbFieldType.OU3)
    ..pc<GiftPackPrayItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prayList',
        $pb.PbFieldType.PM,
        subBuilder: GiftPackPrayItem.create)
    ..hasRequiredFields = false;

  GiftPackPrayHistoryItem._() : super();
  factory GiftPackPrayHistoryItem({
    $core.int? createTime,
    $core.Iterable<GiftPackPrayItem>? prayList,
  }) {
    final _result = create();
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (prayList != null) {
      _result.prayList.addAll(prayList);
    }
    return _result;
  }
  factory GiftPackPrayHistoryItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftPackPrayHistoryItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftPackPrayHistoryItem clone() =>
      GiftPackPrayHistoryItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftPackPrayHistoryItem copyWith(
          void Function(GiftPackPrayHistoryItem) updates) =>
      super.copyWith((message) => updates(message as GiftPackPrayHistoryItem))
          as GiftPackPrayHistoryItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftPackPrayHistoryItem create() => GiftPackPrayHistoryItem._();
  GiftPackPrayHistoryItem createEmptyInstance() => create();
  static $pb.PbList<GiftPackPrayHistoryItem> createRepeated() =>
      $pb.PbList<GiftPackPrayHistoryItem>();
  @$core.pragma('dart2js:noInline')
  static GiftPackPrayHistoryItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftPackPrayHistoryItem>(create);
  static GiftPackPrayHistoryItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get createTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set createTime($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCreateTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreateTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<GiftPackPrayItem> get prayList => $_getList(1);
}

class GiftPackPrayItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftPackPrayItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
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
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityName')
    ..hasRequiredFields = false;

  GiftPackPrayItem._() : super();
  factory GiftPackPrayItem({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? commodityName,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (commodityName != null) {
      _result.commodityName = commodityName;
    }
    return _result;
  }
  factory GiftPackPrayItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftPackPrayItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftPackPrayItem clone() => GiftPackPrayItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftPackPrayItem copyWith(void Function(GiftPackPrayItem) updates) =>
      super.copyWith((message) => updates(message as GiftPackPrayItem))
          as GiftPackPrayItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftPackPrayItem create() => GiftPackPrayItem._();
  GiftPackPrayItem createEmptyInstance() => create();
  static $pb.PbList<GiftPackPrayItem> createRepeated() =>
      $pb.PbList<GiftPackPrayItem>();
  @$core.pragma('dart2js:noInline')
  static GiftPackPrayItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftPackPrayItem>(create);
  static GiftPackPrayItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

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
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get commodityName => $_getSZ(3);
  @$pb.TagNumber(4)
  set commodityName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCommodityName() => $_has(3);
  @$pb.TagNumber(4)
  void clearCommodityName() => clearField(4);
}

class GiftPackGetPrayAward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftPackGetPrayAward',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityIcon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeIcon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeName')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardDate',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftPackGetPrayAward._() : super();
  factory GiftPackGetPrayAward({
    $core.String? commodityIcon,
    $core.String? commodityName,
    $core.String? badgeIcon,
    $core.String? badgeName,
    $core.int? cid,
    $core.int? badgeId,
    $core.int? awardDate,
  }) {
    final _result = create();
    if (commodityIcon != null) {
      _result.commodityIcon = commodityIcon;
    }
    if (commodityName != null) {
      _result.commodityName = commodityName;
    }
    if (badgeIcon != null) {
      _result.badgeIcon = badgeIcon;
    }
    if (badgeName != null) {
      _result.badgeName = badgeName;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (badgeId != null) {
      _result.badgeId = badgeId;
    }
    if (awardDate != null) {
      _result.awardDate = awardDate;
    }
    return _result;
  }
  factory GiftPackGetPrayAward.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftPackGetPrayAward.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftPackGetPrayAward clone() =>
      GiftPackGetPrayAward()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftPackGetPrayAward copyWith(void Function(GiftPackGetPrayAward) updates) =>
      super.copyWith((message) => updates(message as GiftPackGetPrayAward))
          as GiftPackGetPrayAward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftPackGetPrayAward create() => GiftPackGetPrayAward._();
  GiftPackGetPrayAward createEmptyInstance() => create();
  static $pb.PbList<GiftPackGetPrayAward> createRepeated() =>
      $pb.PbList<GiftPackGetPrayAward>();
  @$core.pragma('dart2js:noInline')
  static GiftPackGetPrayAward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftPackGetPrayAward>(create);
  static GiftPackGetPrayAward? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get commodityIcon => $_getSZ(0);
  @$pb.TagNumber(1)
  set commodityIcon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCommodityIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommodityIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get commodityName => $_getSZ(1);
  @$pb.TagNumber(2)
  set commodityName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCommodityName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommodityName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get badgeIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set badgeIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBadgeIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearBadgeIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get badgeName => $_getSZ(3);
  @$pb.TagNumber(4)
  set badgeName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBadgeName() => $_has(3);
  @$pb.TagNumber(4)
  void clearBadgeName() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get cid => $_getIZ(4);
  @$pb.TagNumber(5)
  set cid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCid() => $_has(4);
  @$pb.TagNumber(5)
  void clearCid() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get badgeId => $_getIZ(5);
  @$pb.TagNumber(6)
  set badgeId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasBadgeId() => $_has(5);
  @$pb.TagNumber(6)
  void clearBadgeId() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get awardDate => $_getIZ(6);
  @$pb.TagNumber(7)
  set awardDate($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAwardDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearAwardDate() => clearField(7);
}

class GiftPackDailyConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftPackDailyConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PrayAwardPreviewList>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prayAwardPreview',
        $pb.PbFieldType.PM,
        subBuilder: PrayAwardPreviewList.create)
    ..pc<PayDutyItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payDutyList',
        $pb.PbFieldType.PM,
        subBuilder: PayDutyItem.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'couponNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'openBoxType')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'openedBoxType')
    ..pc<PrevPrayAwardResult>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prevPrayAwardResult',
        $pb.PbFieldType.PM,
        subBuilder: PrevPrayAwardResult.create)
    ..pc<PrayAwardList>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prayAwardList',
        $pb.PbFieldType.PM,
        subBuilder: PrayAwardList.create)
    ..pc<PrayAwardItem>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'primaryPrayAwardConfig',
        $pb.PbFieldType.PM,
        subBuilder: PrayAwardItem.create)
    ..pc<PrayAwardItem>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'middlePrayAwardConfig',
        $pb.PbFieldType.PM,
        subBuilder: PrayAwardItem.create)
    ..pc<PrayAwardItem>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seniorPrayAwardConfig',
        $pb.PbFieldType.PM,
        subBuilder: PrayAwardItem.create)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'primaryBoxPrice',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'middleBoxPrice',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seniorBoxPrice',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'openNums',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftOpenNums',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftPackDailyConfig._() : super();
  factory GiftPackDailyConfig({
    $core.Iterable<PrayAwardPreviewList>? prayAwardPreview,
    $core.Iterable<PayDutyItem>? payDutyList,
    $core.int? couponNum,
    $core.String? openBoxType,
    $core.String? openedBoxType,
    $core.Iterable<PrevPrayAwardResult>? prevPrayAwardResult,
    $core.Iterable<PrayAwardList>? prayAwardList,
    $core.Iterable<PrayAwardItem>? primaryPrayAwardConfig,
    $core.Iterable<PrayAwardItem>? middlePrayAwardConfig,
    $core.Iterable<PrayAwardItem>? seniorPrayAwardConfig,
    $core.int? primaryBoxPrice,
    $core.int? middleBoxPrice,
    $core.int? seniorBoxPrice,
    $core.int? openNums,
    $core.int? leftOpenNums,
  }) {
    final _result = create();
    if (prayAwardPreview != null) {
      _result.prayAwardPreview.addAll(prayAwardPreview);
    }
    if (payDutyList != null) {
      _result.payDutyList.addAll(payDutyList);
    }
    if (couponNum != null) {
      _result.couponNum = couponNum;
    }
    if (openBoxType != null) {
      _result.openBoxType = openBoxType;
    }
    if (openedBoxType != null) {
      _result.openedBoxType = openedBoxType;
    }
    if (prevPrayAwardResult != null) {
      _result.prevPrayAwardResult.addAll(prevPrayAwardResult);
    }
    if (prayAwardList != null) {
      _result.prayAwardList.addAll(prayAwardList);
    }
    if (primaryPrayAwardConfig != null) {
      _result.primaryPrayAwardConfig.addAll(primaryPrayAwardConfig);
    }
    if (middlePrayAwardConfig != null) {
      _result.middlePrayAwardConfig.addAll(middlePrayAwardConfig);
    }
    if (seniorPrayAwardConfig != null) {
      _result.seniorPrayAwardConfig.addAll(seniorPrayAwardConfig);
    }
    if (primaryBoxPrice != null) {
      _result.primaryBoxPrice = primaryBoxPrice;
    }
    if (middleBoxPrice != null) {
      _result.middleBoxPrice = middleBoxPrice;
    }
    if (seniorBoxPrice != null) {
      _result.seniorBoxPrice = seniorBoxPrice;
    }
    if (openNums != null) {
      _result.openNums = openNums;
    }
    if (leftOpenNums != null) {
      _result.leftOpenNums = leftOpenNums;
    }
    return _result;
  }
  factory GiftPackDailyConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftPackDailyConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftPackDailyConfig clone() => GiftPackDailyConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftPackDailyConfig copyWith(void Function(GiftPackDailyConfig) updates) =>
      super.copyWith((message) => updates(message as GiftPackDailyConfig))
          as GiftPackDailyConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftPackDailyConfig create() => GiftPackDailyConfig._();
  GiftPackDailyConfig createEmptyInstance() => create();
  static $pb.PbList<GiftPackDailyConfig> createRepeated() =>
      $pb.PbList<GiftPackDailyConfig>();
  @$core.pragma('dart2js:noInline')
  static GiftPackDailyConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftPackDailyConfig>(create);
  static GiftPackDailyConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PrayAwardPreviewList> get prayAwardPreview => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<PayDutyItem> get payDutyList => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get couponNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set couponNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCouponNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearCouponNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get openBoxType => $_getSZ(3);
  @$pb.TagNumber(4)
  set openBoxType($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOpenBoxType() => $_has(3);
  @$pb.TagNumber(4)
  void clearOpenBoxType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get openedBoxType => $_getSZ(4);
  @$pb.TagNumber(5)
  set openedBoxType($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOpenedBoxType() => $_has(4);
  @$pb.TagNumber(5)
  void clearOpenedBoxType() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<PrevPrayAwardResult> get prevPrayAwardResult => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<PrayAwardList> get prayAwardList => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<PrayAwardItem> get primaryPrayAwardConfig => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<PrayAwardItem> get middlePrayAwardConfig => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<PrayAwardItem> get seniorPrayAwardConfig => $_getList(9);

  @$pb.TagNumber(11)
  $core.int get primaryBoxPrice => $_getIZ(10);
  @$pb.TagNumber(11)
  set primaryBoxPrice($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPrimaryBoxPrice() => $_has(10);
  @$pb.TagNumber(11)
  void clearPrimaryBoxPrice() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get middleBoxPrice => $_getIZ(11);
  @$pb.TagNumber(12)
  set middleBoxPrice($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasMiddleBoxPrice() => $_has(11);
  @$pb.TagNumber(12)
  void clearMiddleBoxPrice() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get seniorBoxPrice => $_getIZ(12);
  @$pb.TagNumber(13)
  set seniorBoxPrice($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasSeniorBoxPrice() => $_has(12);
  @$pb.TagNumber(13)
  void clearSeniorBoxPrice() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get openNums => $_getIZ(13);
  @$pb.TagNumber(14)
  set openNums($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasOpenNums() => $_has(13);
  @$pb.TagNumber(14)
  void clearOpenNums() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get leftOpenNums => $_getIZ(14);
  @$pb.TagNumber(15)
  set leftOpenNums($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasLeftOpenNums() => $_has(14);
  @$pb.TagNumber(15)
  void clearLeftOpenNums() => clearField(15);
}

class PayDutyItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PayDutyItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progress',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'limit',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..hasRequiredFields = false;

  PayDutyItem._() : super();
  factory PayDutyItem({
    $core.int? progress,
    $core.int? limit,
    $core.String? title,
  }) {
    final _result = create();
    if (progress != null) {
      _result.progress = progress;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory PayDutyItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PayDutyItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PayDutyItem clone() => PayDutyItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PayDutyItem copyWith(void Function(PayDutyItem) updates) =>
      super.copyWith((message) => updates(message as PayDutyItem))
          as PayDutyItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PayDutyItem create() => PayDutyItem._();
  PayDutyItem createEmptyInstance() => create();
  static $pb.PbList<PayDutyItem> createRepeated() => $pb.PbList<PayDutyItem>();
  @$core.pragma('dart2js:noInline')
  static PayDutyItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayDutyItem>(create);
  static PayDutyItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get progress => $_getIZ(0);
  @$pb.TagNumber(1)
  set progress($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasProgress() => $_has(0);
  @$pb.TagNumber(1)
  void clearProgress() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);
}

class PrayAwardPreviewList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PrayAwardPreviewList',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..hasRequiredFields = false;

  PrayAwardPreviewList._() : super();
  factory PrayAwardPreviewList({
    $core.String? name,
    $core.String? icon,
    $core.int? num,
    $core.int? price,
    $core.String? type,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (num != null) {
      _result.num = num;
    }
    if (price != null) {
      _result.price = price;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory PrayAwardPreviewList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrayAwardPreviewList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrayAwardPreviewList clone() =>
      PrayAwardPreviewList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrayAwardPreviewList copyWith(void Function(PrayAwardPreviewList) updates) =>
      super.copyWith((message) => updates(message as PrayAwardPreviewList))
          as PrayAwardPreviewList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PrayAwardPreviewList create() => PrayAwardPreviewList._();
  PrayAwardPreviewList createEmptyInstance() => create();
  static $pb.PbList<PrayAwardPreviewList> createRepeated() =>
      $pb.PbList<PrayAwardPreviewList>();
  @$core.pragma('dart2js:noInline')
  static PrayAwardPreviewList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrayAwardPreviewList>(create);
  static PrayAwardPreviewList? _defaultInstance;

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
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get price => $_getIZ(3);
  @$pb.TagNumber(4)
  set price($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get type => $_getSZ(4);
  @$pb.TagNumber(5)
  set type($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);
}

class PrayAwardList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PrayAwardList',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityIcon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityName')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeId',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeIcon')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeName')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PrayAwardList._() : super();
  factory PrayAwardList({
    $core.int? id,
    $core.int? cid,
    $core.String? commodityIcon,
    $core.String? commodityName,
    $core.int? badgeId,
    $core.String? badgeIcon,
    $core.String? badgeName,
    $core.int? awardTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (commodityIcon != null) {
      _result.commodityIcon = commodityIcon;
    }
    if (commodityName != null) {
      _result.commodityName = commodityName;
    }
    if (badgeId != null) {
      _result.badgeId = badgeId;
    }
    if (badgeIcon != null) {
      _result.badgeIcon = badgeIcon;
    }
    if (badgeName != null) {
      _result.badgeName = badgeName;
    }
    if (awardTime != null) {
      _result.awardTime = awardTime;
    }
    return _result;
  }
  factory PrayAwardList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrayAwardList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrayAwardList clone() => PrayAwardList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrayAwardList copyWith(void Function(PrayAwardList) updates) =>
      super.copyWith((message) => updates(message as PrayAwardList))
          as PrayAwardList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PrayAwardList create() => PrayAwardList._();
  PrayAwardList createEmptyInstance() => create();
  static $pb.PbList<PrayAwardList> createRepeated() =>
      $pb.PbList<PrayAwardList>();
  @$core.pragma('dart2js:noInline')
  static PrayAwardList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrayAwardList>(create);
  static PrayAwardList? _defaultInstance;

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
  $core.int get cid => $_getIZ(1);
  @$pb.TagNumber(2)
  set cid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get commodityIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set commodityIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCommodityIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommodityIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get commodityName => $_getSZ(3);
  @$pb.TagNumber(4)
  set commodityName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCommodityName() => $_has(3);
  @$pb.TagNumber(4)
  void clearCommodityName() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get badgeId => $_getIZ(4);
  @$pb.TagNumber(5)
  set badgeId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBadgeId() => $_has(4);
  @$pb.TagNumber(5)
  void clearBadgeId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get badgeIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set badgeIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasBadgeIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearBadgeIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get badgeName => $_getSZ(6);
  @$pb.TagNumber(7)
  set badgeName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBadgeName() => $_has(6);
  @$pb.TagNumber(7)
  void clearBadgeName() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get awardTime => $_getIZ(7);
  @$pb.TagNumber(8)
  set awardTime($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAwardTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearAwardTime() => clearField(8);
}

class PrevPrayAwardResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PrevPrayAwardResult',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
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
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityIcon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityName')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeIcon')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeName')
    ..hasRequiredFields = false;

  PrevPrayAwardResult._() : super();
  factory PrevPrayAwardResult({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? commodityIcon,
    $core.String? commodityName,
    $core.String? badgeIcon,
    $core.String? badgeName,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (commodityIcon != null) {
      _result.commodityIcon = commodityIcon;
    }
    if (commodityName != null) {
      _result.commodityName = commodityName;
    }
    if (badgeIcon != null) {
      _result.badgeIcon = badgeIcon;
    }
    if (badgeName != null) {
      _result.badgeName = badgeName;
    }
    return _result;
  }
  factory PrevPrayAwardResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrevPrayAwardResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrevPrayAwardResult clone() => PrevPrayAwardResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrevPrayAwardResult copyWith(void Function(PrevPrayAwardResult) updates) =>
      super.copyWith((message) => updates(message as PrevPrayAwardResult))
          as PrevPrayAwardResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PrevPrayAwardResult create() => PrevPrayAwardResult._();
  PrevPrayAwardResult createEmptyInstance() => create();
  static $pb.PbList<PrevPrayAwardResult> createRepeated() =>
      $pb.PbList<PrevPrayAwardResult>();
  @$core.pragma('dart2js:noInline')
  static PrevPrayAwardResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrevPrayAwardResult>(create);
  static PrevPrayAwardResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

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
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get commodityIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set commodityIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCommodityIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearCommodityIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get commodityName => $_getSZ(4);
  @$pb.TagNumber(5)
  set commodityName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCommodityName() => $_has(4);
  @$pb.TagNumber(5)
  void clearCommodityName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get badgeIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set badgeIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasBadgeIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearBadgeIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get badgeName => $_getSZ(6);
  @$pb.TagNumber(7)
  set badgeName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBadgeName() => $_has(6);
  @$pb.TagNumber(7)
  void clearBadgeName() => clearField(7);
}

class PrayAwardItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PrayAwardItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tips')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardIcon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardName')
    ..hasRequiredFields = false;

  PrayAwardItem._() : super();
  factory PrayAwardItem({
    $core.String? type,
    $core.int? price,
    $core.String? tips,
    $core.String? awardIcon,
    $core.String? awardName,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (price != null) {
      _result.price = price;
    }
    if (tips != null) {
      _result.tips = tips;
    }
    if (awardIcon != null) {
      _result.awardIcon = awardIcon;
    }
    if (awardName != null) {
      _result.awardName = awardName;
    }
    return _result;
  }
  factory PrayAwardItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrayAwardItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrayAwardItem clone() => PrayAwardItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrayAwardItem copyWith(void Function(PrayAwardItem) updates) =>
      super.copyWith((message) => updates(message as PrayAwardItem))
          as PrayAwardItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PrayAwardItem create() => PrayAwardItem._();
  PrayAwardItem createEmptyInstance() => create();
  static $pb.PbList<PrayAwardItem> createRepeated() =>
      $pb.PbList<PrayAwardItem>();
  @$core.pragma('dart2js:noInline')
  static PrayAwardItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrayAwardItem>(create);
  static PrayAwardItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get price => $_getIZ(1);
  @$pb.TagNumber(2)
  set price($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tips => $_getSZ(2);
  @$pb.TagNumber(3)
  set tips($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTips() => $_has(2);
  @$pb.TagNumber(3)
  void clearTips() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get awardIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set awardIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAwardIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearAwardIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get awardName => $_getSZ(4);
  @$pb.TagNumber(5)
  set awardName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAwardName() => $_has(4);
  @$pb.TagNumber(5)
  void clearAwardName() => clearField(5);
}
