///
//  Generated code. Do not modify.
//  source: grab_hat_rank.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ApiHatActivityAtlasResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiHatActivityAtlasResponse',
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
            : 'message')
    ..aOM<HatActivityAtlasData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HatActivityAtlasData.create)
    ..hasRequiredFields = false;

  ApiHatActivityAtlasResponse._() : super();
  factory ApiHatActivityAtlasResponse({
    $core.bool? success,
    $core.String? message,
    HatActivityAtlasData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiHatActivityAtlasResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiHatActivityAtlasResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiHatActivityAtlasResponse clone() =>
      ApiHatActivityAtlasResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiHatActivityAtlasResponse copyWith(
          void Function(ApiHatActivityAtlasResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiHatActivityAtlasResponse))
          as ApiHatActivityAtlasResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiHatActivityAtlasResponse create() =>
      ApiHatActivityAtlasResponse._();
  ApiHatActivityAtlasResponse createEmptyInstance() => create();
  static $pb.PbList<ApiHatActivityAtlasResponse> createRepeated() =>
      $pb.PbList<ApiHatActivityAtlasResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiHatActivityAtlasResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiHatActivityAtlasResponse>(create);
  static ApiHatActivityAtlasResponse? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  HatActivityAtlasData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HatActivityAtlasData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HatActivityAtlasData ensureData() => $_ensure(2);
}

class HatActivityUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatActivityUserInfo',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'light',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'charm',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  HatActivityUserInfo._() : super();
  factory HatActivityUserInfo({
    $core.int? uid,
    $core.String? name,
    $core.int? light,
    $fixnum.Int64? charm,
    $core.String? icon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (light != null) {
      _result.light = light;
    }
    if (charm != null) {
      _result.charm = charm;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory HatActivityUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatActivityUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatActivityUserInfo clone() => HatActivityUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatActivityUserInfo copyWith(void Function(HatActivityUserInfo) updates) =>
      super.copyWith((message) => updates(message as HatActivityUserInfo))
          as HatActivityUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatActivityUserInfo create() => HatActivityUserInfo._();
  HatActivityUserInfo createEmptyInstance() => create();
  static $pb.PbList<HatActivityUserInfo> createRepeated() =>
      $pb.PbList<HatActivityUserInfo>();
  @$core.pragma('dart2js:noInline')
  static HatActivityUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatActivityUserInfo>(create);
  static HatActivityUserInfo? _defaultInstance;

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
  $core.int get light => $_getIZ(2);
  @$pb.TagNumber(3)
  set light($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLight() => $_has(2);
  @$pb.TagNumber(3)
  void clearLight() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get charm => $_getI64(3);
  @$pb.TagNumber(4)
  set charm($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCharm() => $_has(3);
  @$pb.TagNumber(4)
  void clearCharm() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);
}

class HatActivityInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatActivityInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'season',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startAt',
        $pb.PbFieldType.OU3,
        protoName: 'startAt')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endAt',
        $pb.PbFieldType.OU3,
        protoName: 'endAt')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'helpUrl',
        protoName: 'helpUrl')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'animation')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapSize',
        $pb.PbFieldType.OU3,
        protoName: 'vapSize')
    ..hasRequiredFields = false;

  HatActivityInfo._() : super();
  factory HatActivityInfo({
    $core.int? season,
    $core.int? startAt,
    $core.int? endAt,
    $core.String? helpUrl,
    $core.String? animation,
    $core.int? vapSize,
  }) {
    final _result = create();
    if (season != null) {
      _result.season = season;
    }
    if (startAt != null) {
      _result.startAt = startAt;
    }
    if (endAt != null) {
      _result.endAt = endAt;
    }
    if (helpUrl != null) {
      _result.helpUrl = helpUrl;
    }
    if (animation != null) {
      _result.animation = animation;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    return _result;
  }
  factory HatActivityInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatActivityInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatActivityInfo clone() => HatActivityInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatActivityInfo copyWith(void Function(HatActivityInfo) updates) =>
      super.copyWith((message) => updates(message as HatActivityInfo))
          as HatActivityInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatActivityInfo create() => HatActivityInfo._();
  HatActivityInfo createEmptyInstance() => create();
  static $pb.PbList<HatActivityInfo> createRepeated() =>
      $pb.PbList<HatActivityInfo>();
  @$core.pragma('dart2js:noInline')
  static HatActivityInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatActivityInfo>(create);
  static HatActivityInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get season => $_getIZ(0);
  @$pb.TagNumber(1)
  set season($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSeason() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeason() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get startAt => $_getIZ(1);
  @$pb.TagNumber(2)
  set startAt($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStartAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartAt() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get endAt => $_getIZ(2);
  @$pb.TagNumber(3)
  set endAt($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEndAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndAt() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get helpUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set helpUrl($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHelpUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearHelpUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get animation => $_getSZ(4);
  @$pb.TagNumber(5)
  set animation($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAnimation() => $_has(4);
  @$pb.TagNumber(5)
  void clearAnimation() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get vapSize => $_getIZ(5);
  @$pb.TagNumber(6)
  set vapSize($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVapSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearVapSize() => clearField(6);
}

class HatActivityHatItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatActivityHatItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hid',
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
            : 'url')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightTimes',
        $pb.PbFieldType.OU3,
        protoName: 'lightTimes')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category')
    ..hasRequiredFields = false;

  HatActivityHatItem._() : super();
  factory HatActivityHatItem({
    $core.int? hid,
    $core.String? name,
    $core.String? url,
    $core.int? lightTimes,
    $core.String? category,
  }) {
    final _result = create();
    if (hid != null) {
      _result.hid = hid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (url != null) {
      _result.url = url;
    }
    if (lightTimes != null) {
      _result.lightTimes = lightTimes;
    }
    if (category != null) {
      _result.category = category;
    }
    return _result;
  }
  factory HatActivityHatItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatActivityHatItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatActivityHatItem clone() => HatActivityHatItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatActivityHatItem copyWith(void Function(HatActivityHatItem) updates) =>
      super.copyWith((message) => updates(message as HatActivityHatItem))
          as HatActivityHatItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatActivityHatItem create() => HatActivityHatItem._();
  HatActivityHatItem createEmptyInstance() => create();
  static $pb.PbList<HatActivityHatItem> createRepeated() =>
      $pb.PbList<HatActivityHatItem>();
  @$core.pragma('dart2js:noInline')
  static HatActivityHatItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatActivityHatItem>(create);
  static HatActivityHatItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get hid => $_getIZ(0);
  @$pb.TagNumber(1)
  set hid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHid() => $_has(0);
  @$pb.TagNumber(1)
  void clearHid() => clearField(1);

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
  $core.int get lightTimes => $_getIZ(3);
  @$pb.TagNumber(4)
  set lightTimes($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLightTimes() => $_has(3);
  @$pb.TagNumber(4)
  void clearLightTimes() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get category => $_getSZ(4);
  @$pb.TagNumber(5)
  set category($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearCategory() => clearField(5);
}

class HatActivityCategoryItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatActivityCategoryItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category')
    ..pc<HatActivityHatItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hats',
        $pb.PbFieldType.PM,
        subBuilder: HatActivityHatItem.create)
    ..hasRequiredFields = false;

  HatActivityCategoryItem._() : super();
  factory HatActivityCategoryItem({
    $core.String? category,
    $core.Iterable<HatActivityHatItem>? hats,
  }) {
    final _result = create();
    if (category != null) {
      _result.category = category;
    }
    if (hats != null) {
      _result.hats.addAll(hats);
    }
    return _result;
  }
  factory HatActivityCategoryItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatActivityCategoryItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatActivityCategoryItem clone() =>
      HatActivityCategoryItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatActivityCategoryItem copyWith(
          void Function(HatActivityCategoryItem) updates) =>
      super.copyWith((message) => updates(message as HatActivityCategoryItem))
          as HatActivityCategoryItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatActivityCategoryItem create() => HatActivityCategoryItem._();
  HatActivityCategoryItem createEmptyInstance() => create();
  static $pb.PbList<HatActivityCategoryItem> createRepeated() =>
      $pb.PbList<HatActivityCategoryItem>();
  @$core.pragma('dart2js:noInline')
  static HatActivityCategoryItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatActivityCategoryItem>(create);
  static HatActivityCategoryItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get category => $_getSZ(0);
  @$pb.TagNumber(1)
  set category($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCategory() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategory() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<HatActivityHatItem> get hats => $_getList(1);
}

class HatActivityRewardCommodity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatActivityRewardCommodity',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
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
            : 'url')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'period',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'periodHour',
        $pb.PbFieldType.OU3,
        protoName: 'periodHour')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HatActivityRewardCommodity._() : super();
  factory HatActivityRewardCommodity({
    $core.int? cid,
    $core.String? name,
    $core.String? url,
    $core.int? period,
    $core.int? periodHour,
    $core.int? price,
    $core.int? num,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (url != null) {
      _result.url = url;
    }
    if (period != null) {
      _result.period = period;
    }
    if (periodHour != null) {
      _result.periodHour = periodHour;
    }
    if (price != null) {
      _result.price = price;
    }
    if (num != null) {
      _result.num = num;
    }
    return _result;
  }
  factory HatActivityRewardCommodity.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatActivityRewardCommodity.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatActivityRewardCommodity clone() =>
      HatActivityRewardCommodity()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatActivityRewardCommodity copyWith(
          void Function(HatActivityRewardCommodity) updates) =>
      super.copyWith(
              (message) => updates(message as HatActivityRewardCommodity))
          as HatActivityRewardCommodity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatActivityRewardCommodity create() => HatActivityRewardCommodity._();
  HatActivityRewardCommodity createEmptyInstance() => create();
  static $pb.PbList<HatActivityRewardCommodity> createRepeated() =>
      $pb.PbList<HatActivityRewardCommodity>();
  @$core.pragma('dart2js:noInline')
  static HatActivityRewardCommodity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatActivityRewardCommodity>(create);
  static HatActivityRewardCommodity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

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
  $core.int get period => $_getIZ(3);
  @$pb.TagNumber(4)
  set period($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPeriod() => $_has(3);
  @$pb.TagNumber(4)
  void clearPeriod() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get periodHour => $_getIZ(4);
  @$pb.TagNumber(5)
  set periodHour($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPeriodHour() => $_has(4);
  @$pb.TagNumber(5)
  void clearPeriodHour() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get price => $_getIZ(5);
  @$pb.TagNumber(6)
  set price($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrice() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get num => $_getIZ(6);
  @$pb.TagNumber(7)
  set num($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearNum() => clearField(7);
}

class HatActivityCollectRewordItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatActivityCollectRewordItem',
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
            : 'task')
    ..pc<HatActivityRewardCommodity>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodities',
        $pb.PbFieldType.PM,
        subBuilder: HatActivityRewardCommodity.create)
    ..hasRequiredFields = false;

  HatActivityCollectRewordItem._() : super();
  factory HatActivityCollectRewordItem({
    $core.String? title,
    $core.String? task,
    $core.Iterable<HatActivityRewardCommodity>? commodities,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (task != null) {
      _result.task = task;
    }
    if (commodities != null) {
      _result.commodities.addAll(commodities);
    }
    return _result;
  }
  factory HatActivityCollectRewordItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatActivityCollectRewordItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatActivityCollectRewordItem clone() =>
      HatActivityCollectRewordItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatActivityCollectRewordItem copyWith(
          void Function(HatActivityCollectRewordItem) updates) =>
      super.copyWith(
              (message) => updates(message as HatActivityCollectRewordItem))
          as HatActivityCollectRewordItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatActivityCollectRewordItem create() =>
      HatActivityCollectRewordItem._();
  HatActivityCollectRewordItem createEmptyInstance() => create();
  static $pb.PbList<HatActivityCollectRewordItem> createRepeated() =>
      $pb.PbList<HatActivityCollectRewordItem>();
  @$core.pragma('dart2js:noInline')
  static HatActivityCollectRewordItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatActivityCollectRewordItem>(create);
  static HatActivityCollectRewordItem? _defaultInstance;

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
  $core.String get task => $_getSZ(1);
  @$pb.TagNumber(2)
  set task($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearTask() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<HatActivityRewardCommodity> get commodities => $_getList(2);
}

class HatActivityAtlasData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatActivityAtlasData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<HatActivityUserInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'me',
        subBuilder: HatActivityUserInfo.create)
    ..aOM<HatActivityInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activity',
        subBuilder: HatActivityInfo.create)
    ..pc<HatActivityCategoryItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hatCategories',
        $pb.PbFieldType.PM,
        protoName: 'hatCategories',
        subBuilder: HatActivityCategoryItem.create)
    ..pc<HatActivityCollectRewordItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'collectRewards',
        $pb.PbFieldType.PM,
        protoName: 'collectRewards',
        subBuilder: HatActivityCollectRewordItem.create)
    ..hasRequiredFields = false;

  HatActivityAtlasData._() : super();
  factory HatActivityAtlasData({
    HatActivityUserInfo? me,
    HatActivityInfo? activity,
    $core.Iterable<HatActivityCategoryItem>? hatCategories,
    $core.Iterable<HatActivityCollectRewordItem>? collectRewards,
  }) {
    final _result = create();
    if (me != null) {
      _result.me = me;
    }
    if (activity != null) {
      _result.activity = activity;
    }
    if (hatCategories != null) {
      _result.hatCategories.addAll(hatCategories);
    }
    if (collectRewards != null) {
      _result.collectRewards.addAll(collectRewards);
    }
    return _result;
  }
  factory HatActivityAtlasData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatActivityAtlasData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatActivityAtlasData clone() =>
      HatActivityAtlasData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatActivityAtlasData copyWith(void Function(HatActivityAtlasData) updates) =>
      super.copyWith((message) => updates(message as HatActivityAtlasData))
          as HatActivityAtlasData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatActivityAtlasData create() => HatActivityAtlasData._();
  HatActivityAtlasData createEmptyInstance() => create();
  static $pb.PbList<HatActivityAtlasData> createRepeated() =>
      $pb.PbList<HatActivityAtlasData>();
  @$core.pragma('dart2js:noInline')
  static HatActivityAtlasData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatActivityAtlasData>(create);
  static HatActivityAtlasData? _defaultInstance;

  @$pb.TagNumber(1)
  HatActivityUserInfo get me => $_getN(0);
  @$pb.TagNumber(1)
  set me(HatActivityUserInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMe() => $_has(0);
  @$pb.TagNumber(1)
  void clearMe() => clearField(1);
  @$pb.TagNumber(1)
  HatActivityUserInfo ensureMe() => $_ensure(0);

  @$pb.TagNumber(2)
  HatActivityInfo get activity => $_getN(1);
  @$pb.TagNumber(2)
  set activity(HatActivityInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasActivity() => $_has(1);
  @$pb.TagNumber(2)
  void clearActivity() => clearField(2);
  @$pb.TagNumber(2)
  HatActivityInfo ensureActivity() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<HatActivityCategoryItem> get hatCategories => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<HatActivityCollectRewordItem> get collectRewards => $_getList(3);
}

class ApiHatActivityRankIndexResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiHatActivityRankIndexResponse',
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
            : 'message')
    ..aOM<HatActivityRankIndexData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HatActivityRankIndexData.create)
    ..hasRequiredFields = false;

  ApiHatActivityRankIndexResponse._() : super();
  factory ApiHatActivityRankIndexResponse({
    $core.bool? success,
    $core.String? message,
    HatActivityRankIndexData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiHatActivityRankIndexResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiHatActivityRankIndexResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiHatActivityRankIndexResponse clone() =>
      ApiHatActivityRankIndexResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiHatActivityRankIndexResponse copyWith(
          void Function(ApiHatActivityRankIndexResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiHatActivityRankIndexResponse))
          as ApiHatActivityRankIndexResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiHatActivityRankIndexResponse create() =>
      ApiHatActivityRankIndexResponse._();
  ApiHatActivityRankIndexResponse createEmptyInstance() => create();
  static $pb.PbList<ApiHatActivityRankIndexResponse> createRepeated() =>
      $pb.PbList<ApiHatActivityRankIndexResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiHatActivityRankIndexResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiHatActivityRankIndexResponse>(
          create);
  static ApiHatActivityRankIndexResponse? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  HatActivityRankIndexData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HatActivityRankIndexData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HatActivityRankIndexData ensureData() => $_ensure(2);
}

class HatActivityRankIndexData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatActivityRankIndexData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<HatActivityRankTabItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabs',
        $pb.PbFieldType.PM,
        subBuilder: HatActivityRankTabItem.create)
    ..hasRequiredFields = false;

  HatActivityRankIndexData._() : super();
  factory HatActivityRankIndexData({
    $core.Iterable<HatActivityRankTabItem>? tabs,
  }) {
    final _result = create();
    if (tabs != null) {
      _result.tabs.addAll(tabs);
    }
    return _result;
  }
  factory HatActivityRankIndexData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatActivityRankIndexData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatActivityRankIndexData clone() =>
      HatActivityRankIndexData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatActivityRankIndexData copyWith(
          void Function(HatActivityRankIndexData) updates) =>
      super.copyWith((message) => updates(message as HatActivityRankIndexData))
          as HatActivityRankIndexData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatActivityRankIndexData create() => HatActivityRankIndexData._();
  HatActivityRankIndexData createEmptyInstance() => create();
  static $pb.PbList<HatActivityRankIndexData> createRepeated() =>
      $pb.PbList<HatActivityRankIndexData>();
  @$core.pragma('dart2js:noInline')
  static HatActivityRankIndexData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatActivityRankIndexData>(create);
  static HatActivityRankIndexData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<HatActivityRankTabItem> get tabs => $_getList(0);
}

class HatActivityRankTabItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatActivityRankTabItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tab')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'token',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HatActivityRankTabItem._() : super();
  factory HatActivityRankTabItem({
    $core.String? tab,
    $core.int? token,
  }) {
    final _result = create();
    if (tab != null) {
      _result.tab = tab;
    }
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory HatActivityRankTabItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatActivityRankTabItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatActivityRankTabItem clone() =>
      HatActivityRankTabItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatActivityRankTabItem copyWith(
          void Function(HatActivityRankTabItem) updates) =>
      super.copyWith((message) => updates(message as HatActivityRankTabItem))
          as HatActivityRankTabItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatActivityRankTabItem create() => HatActivityRankTabItem._();
  HatActivityRankTabItem createEmptyInstance() => create();
  static $pb.PbList<HatActivityRankTabItem> createRepeated() =>
      $pb.PbList<HatActivityRankTabItem>();
  @$core.pragma('dart2js:noInline')
  static HatActivityRankTabItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatActivityRankTabItem>(create);
  static HatActivityRankTabItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tab => $_getSZ(0);
  @$pb.TagNumber(1)
  set tab($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTab() => $_has(0);
  @$pb.TagNumber(1)
  void clearTab() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get token => $_getIZ(1);
  @$pb.TagNumber(2)
  set token($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);
}

class ApiHatActivityRankResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiHatActivityRankResponse',
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
            : 'message')
    ..aOM<HatActivityRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HatActivityRankData.create)
    ..hasRequiredFields = false;

  ApiHatActivityRankResponse._() : super();
  factory ApiHatActivityRankResponse({
    $core.bool? success,
    $core.String? message,
    HatActivityRankData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiHatActivityRankResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiHatActivityRankResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiHatActivityRankResponse clone() =>
      ApiHatActivityRankResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiHatActivityRankResponse copyWith(
          void Function(ApiHatActivityRankResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiHatActivityRankResponse))
          as ApiHatActivityRankResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiHatActivityRankResponse create() => ApiHatActivityRankResponse._();
  ApiHatActivityRankResponse createEmptyInstance() => create();
  static $pb.PbList<ApiHatActivityRankResponse> createRepeated() =>
      $pb.PbList<ApiHatActivityRankResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiHatActivityRankResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiHatActivityRankResponse>(create);
  static ApiHatActivityRankResponse? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  HatActivityRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HatActivityRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HatActivityRankData ensureData() => $_ensure(2);
}

class HatActivityRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatActivityRankItem',
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'light',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'charm',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  HatActivityRankItem._() : super();
  factory HatActivityRankItem({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? light,
    $core.int? charm,
    $core.int? rank,
    $core.int? score,
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
    if (light != null) {
      _result.light = light;
    }
    if (charm != null) {
      _result.charm = charm;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory HatActivityRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatActivityRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatActivityRankItem clone() => HatActivityRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatActivityRankItem copyWith(void Function(HatActivityRankItem) updates) =>
      super.copyWith((message) => updates(message as HatActivityRankItem))
          as HatActivityRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatActivityRankItem create() => HatActivityRankItem._();
  HatActivityRankItem createEmptyInstance() => create();
  static $pb.PbList<HatActivityRankItem> createRepeated() =>
      $pb.PbList<HatActivityRankItem>();
  @$core.pragma('dart2js:noInline')
  static HatActivityRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatActivityRankItem>(create);
  static HatActivityRankItem? _defaultInstance;

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
  $core.int get light => $_getIZ(3);
  @$pb.TagNumber(4)
  set light($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLight() => $_has(3);
  @$pb.TagNumber(4)
  void clearLight() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get charm => $_getIZ(4);
  @$pb.TagNumber(5)
  set charm($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCharm() => $_has(4);
  @$pb.TagNumber(5)
  void clearCharm() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get rank => $_getIZ(5);
  @$pb.TagNumber(6)
  set rank($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRank() => $_has(5);
  @$pb.TagNumber(6)
  void clearRank() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get score => $_getIZ(6);
  @$pb.TagNumber(7)
  set score($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasScore() => $_has(6);
  @$pb.TagNumber(7)
  void clearScore() => clearField(7);
}

class HatActivityRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatActivityRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankType',
        $pb.PbFieldType.OU3,
        protoName: 'rankType')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'page',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more',
        $pb.PbFieldType.OU3)
    ..pc<HatActivityRankItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: HatActivityRankItem.create)
    ..aOM<HatActivityRankItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'me',
        subBuilder: HatActivityRankItem.create)
    ..hasRequiredFields = false;

  HatActivityRankData._() : super();
  factory HatActivityRankData({
    $core.int? rankType,
    $core.int? page,
    $core.int? more,
    $core.Iterable<HatActivityRankItem>? list,
    HatActivityRankItem? me,
  }) {
    final _result = create();
    if (rankType != null) {
      _result.rankType = rankType;
    }
    if (page != null) {
      _result.page = page;
    }
    if (more != null) {
      _result.more = more;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (me != null) {
      _result.me = me;
    }
    return _result;
  }
  factory HatActivityRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatActivityRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatActivityRankData clone() => HatActivityRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatActivityRankData copyWith(void Function(HatActivityRankData) updates) =>
      super.copyWith((message) => updates(message as HatActivityRankData))
          as HatActivityRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatActivityRankData create() => HatActivityRankData._();
  HatActivityRankData createEmptyInstance() => create();
  static $pb.PbList<HatActivityRankData> createRepeated() =>
      $pb.PbList<HatActivityRankData>();
  @$core.pragma('dart2js:noInline')
  static HatActivityRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatActivityRankData>(create);
  static HatActivityRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rankType => $_getIZ(0);
  @$pb.TagNumber(1)
  set rankType($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRankType() => $_has(0);
  @$pb.TagNumber(1)
  void clearRankType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get page => $_getIZ(1);
  @$pb.TagNumber(2)
  set page($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get more => $_getIZ(2);
  @$pb.TagNumber(3)
  set more($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMore() => $_has(2);
  @$pb.TagNumber(3)
  void clearMore() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<HatActivityRankItem> get list => $_getList(3);

  @$pb.TagNumber(5)
  HatActivityRankItem get me => $_getN(4);
  @$pb.TagNumber(5)
  set me(HatActivityRankItem v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMe() => $_has(4);
  @$pb.TagNumber(5)
  void clearMe() => clearField(5);
  @$pb.TagNumber(5)
  HatActivityRankItem ensureMe() => $_ensure(4);
}

class ApiHatActivityHelpResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiHatActivityHelpResponse',
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
            : 'message')
    ..aOM<HatActivityHelpData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HatActivityHelpData.create)
    ..hasRequiredFields = false;

  ApiHatActivityHelpResponse._() : super();
  factory ApiHatActivityHelpResponse({
    $core.bool? success,
    $core.String? message,
    HatActivityHelpData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiHatActivityHelpResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiHatActivityHelpResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiHatActivityHelpResponse clone() =>
      ApiHatActivityHelpResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiHatActivityHelpResponse copyWith(
          void Function(ApiHatActivityHelpResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiHatActivityHelpResponse))
          as ApiHatActivityHelpResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiHatActivityHelpResponse create() => ApiHatActivityHelpResponse._();
  ApiHatActivityHelpResponse createEmptyInstance() => create();
  static $pb.PbList<ApiHatActivityHelpResponse> createRepeated() =>
      $pb.PbList<ApiHatActivityHelpResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiHatActivityHelpResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiHatActivityHelpResponse>(create);
  static ApiHatActivityHelpResponse? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  HatActivityHelpData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HatActivityHelpData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HatActivityHelpData ensureData() => $_ensure(2);
}

class HatActivityHelpData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatActivityHelpData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rule')
    ..aOM<HatActivityRankRewardData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewards',
        subBuilder: HatActivityRankRewardData.create)
    ..hasRequiredFields = false;

  HatActivityHelpData._() : super();
  factory HatActivityHelpData({
    $core.String? rule,
    HatActivityRankRewardData? rewards,
  }) {
    final _result = create();
    if (rule != null) {
      _result.rule = rule;
    }
    if (rewards != null) {
      _result.rewards = rewards;
    }
    return _result;
  }
  factory HatActivityHelpData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatActivityHelpData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatActivityHelpData clone() => HatActivityHelpData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatActivityHelpData copyWith(void Function(HatActivityHelpData) updates) =>
      super.copyWith((message) => updates(message as HatActivityHelpData))
          as HatActivityHelpData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatActivityHelpData create() => HatActivityHelpData._();
  HatActivityHelpData createEmptyInstance() => create();
  static $pb.PbList<HatActivityHelpData> createRepeated() =>
      $pb.PbList<HatActivityHelpData>();
  @$core.pragma('dart2js:noInline')
  static HatActivityHelpData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatActivityHelpData>(create);
  static HatActivityHelpData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rule => $_getSZ(0);
  @$pb.TagNumber(1)
  set rule($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRule() => $_has(0);
  @$pb.TagNumber(1)
  void clearRule() => clearField(1);

  @$pb.TagNumber(3)
  HatActivityRankRewardData get rewards => $_getN(1);
  @$pb.TagNumber(3)
  set rewards(HatActivityRankRewardData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRewards() => $_has(1);
  @$pb.TagNumber(3)
  void clearRewards() => clearField(3);
  @$pb.TagNumber(3)
  HatActivityRankRewardData ensureRewards() => $_ensure(1);
}

class HatActivityRankRewardData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatActivityRankRewardData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<HatActivityRankRewardItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dailyReward',
        $pb.PbFieldType.PM,
        protoName: 'dailyReward',
        subBuilder: HatActivityRankRewardItem.create)
    ..pc<HatActivityRankRewardItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weeklyReward',
        $pb.PbFieldType.PM,
        protoName: 'weeklyReward',
        subBuilder: HatActivityRankRewardItem.create)
    ..pc<HatActivityRankRewardItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalReward',
        $pb.PbFieldType.PM,
        protoName: 'totalReward',
        subBuilder: HatActivityRankRewardItem.create)
    ..hasRequiredFields = false;

  HatActivityRankRewardData._() : super();
  factory HatActivityRankRewardData({
    $core.Iterable<HatActivityRankRewardItem>? dailyReward,
    $core.Iterable<HatActivityRankRewardItem>? weeklyReward,
    $core.Iterable<HatActivityRankRewardItem>? totalReward,
  }) {
    final _result = create();
    if (dailyReward != null) {
      _result.dailyReward.addAll(dailyReward);
    }
    if (weeklyReward != null) {
      _result.weeklyReward.addAll(weeklyReward);
    }
    if (totalReward != null) {
      _result.totalReward.addAll(totalReward);
    }
    return _result;
  }
  factory HatActivityRankRewardData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatActivityRankRewardData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatActivityRankRewardData clone() =>
      HatActivityRankRewardData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatActivityRankRewardData copyWith(
          void Function(HatActivityRankRewardData) updates) =>
      super.copyWith((message) => updates(message as HatActivityRankRewardData))
          as HatActivityRankRewardData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatActivityRankRewardData create() => HatActivityRankRewardData._();
  HatActivityRankRewardData createEmptyInstance() => create();
  static $pb.PbList<HatActivityRankRewardData> createRepeated() =>
      $pb.PbList<HatActivityRankRewardData>();
  @$core.pragma('dart2js:noInline')
  static HatActivityRankRewardData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatActivityRankRewardData>(create);
  static HatActivityRankRewardData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<HatActivityRankRewardItem> get dailyReward => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<HatActivityRankRewardItem> get weeklyReward => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<HatActivityRankRewardItem> get totalReward => $_getList(2);
}

class HatActivityRankRewardItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatActivityRankRewardItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..pc<HatActivityRewardCommodity>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodities',
        $pb.PbFieldType.PM,
        subBuilder: HatActivityRewardCommodity.create)
    ..hasRequiredFields = false;

  HatActivityRankRewardItem._() : super();
  factory HatActivityRankRewardItem({
    $core.int? rank,
    $core.Iterable<HatActivityRewardCommodity>? commodities,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank = rank;
    }
    if (commodities != null) {
      _result.commodities.addAll(commodities);
    }
    return _result;
  }
  factory HatActivityRankRewardItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatActivityRankRewardItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatActivityRankRewardItem clone() =>
      HatActivityRankRewardItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatActivityRankRewardItem copyWith(
          void Function(HatActivityRankRewardItem) updates) =>
      super.copyWith((message) => updates(message as HatActivityRankRewardItem))
          as HatActivityRankRewardItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatActivityRankRewardItem create() => HatActivityRankRewardItem._();
  HatActivityRankRewardItem createEmptyInstance() => create();
  static $pb.PbList<HatActivityRankRewardItem> createRepeated() =>
      $pb.PbList<HatActivityRankRewardItem>();
  @$core.pragma('dart2js:noInline')
  static HatActivityRankRewardItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatActivityRankRewardItem>(create);
  static HatActivityRankRewardItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rank => $_getIZ(0);
  @$pb.TagNumber(1)
  set rank($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearRank() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<HatActivityRewardCommodity> get commodities => $_getList(1);
}
