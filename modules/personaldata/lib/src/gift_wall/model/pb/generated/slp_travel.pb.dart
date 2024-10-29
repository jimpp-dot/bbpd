///
//  Generated code. Do not modify.
//  source: slp_travel.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResTravelWall extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResTravelWall',
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
    ..aOM<TravelWall>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: TravelWall.create)
    ..hasRequiredFields = false;

  ResTravelWall._() : super();
  factory ResTravelWall({
    $core.bool? success,
    $core.String? msg,
    TravelWall? data,
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
  factory ResTravelWall.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResTravelWall.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResTravelWall clone() => ResTravelWall()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResTravelWall copyWith(void Function(ResTravelWall) updates) =>
      super.copyWith((message) => updates(message as ResTravelWall))
          as ResTravelWall; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResTravelWall create() => ResTravelWall._();
  ResTravelWall createEmptyInstance() => create();
  static $pb.PbList<ResTravelWall> createRepeated() =>
      $pb.PbList<ResTravelWall>();
  @$core.pragma('dart2js:noInline')
  static ResTravelWall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResTravelWall>(create);
  static ResTravelWall? _defaultInstance;

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
  TravelWall get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(TravelWall v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  TravelWall ensureData() => $_ensure(2);
}

class TravelWall extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TravelWall',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightNum',
        $pb.PbFieldType.OU3)
    ..pc<TravelLightItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightList',
        $pb.PbFieldType.PM,
        subBuilder: TravelLightItem.create)
    ..hasRequiredFields = false;

  TravelWall._() : super();
  factory TravelWall({
    $core.int? total,
    $core.int? lightNum,
    $core.Iterable<TravelLightItem>? lightList,
  }) {
    final _result = create();
    if (total != null) {
      _result.total = total;
    }
    if (lightNum != null) {
      _result.lightNum = lightNum;
    }
    if (lightList != null) {
      _result.lightList.addAll(lightList);
    }
    return _result;
  }
  factory TravelWall.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TravelWall.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TravelWall clone() => TravelWall()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TravelWall copyWith(void Function(TravelWall) updates) =>
      super.copyWith((message) => updates(message as TravelWall))
          as TravelWall; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TravelWall create() => TravelWall._();
  TravelWall createEmptyInstance() => create();
  static $pb.PbList<TravelWall> createRepeated() => $pb.PbList<TravelWall>();
  @$core.pragma('dart2js:noInline')
  static TravelWall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TravelWall>(create);
  static TravelWall? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get total => $_getIZ(0);
  @$pb.TagNumber(1)
  set total($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get lightNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set lightNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLightNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearLightNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<TravelLightItem> get lightList => $_getList(2);
}

class TravelLightItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TravelLightItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cityId',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cityName')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightTimes',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cityIcon')
    ..hasRequiredFields = false;

  TravelLightItem._() : super();
  factory TravelLightItem({
    $core.int? giftId,
    $core.int? cityId,
    $core.String? cityName,
    $core.String? giftName,
    $core.int? lightTimes,
    $core.String? cityIcon,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (cityId != null) {
      _result.cityId = cityId;
    }
    if (cityName != null) {
      _result.cityName = cityName;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (lightTimes != null) {
      _result.lightTimes = lightTimes;
    }
    if (cityIcon != null) {
      _result.cityIcon = cityIcon;
    }
    return _result;
  }
  factory TravelLightItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TravelLightItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TravelLightItem clone() => TravelLightItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TravelLightItem copyWith(void Function(TravelLightItem) updates) =>
      super.copyWith((message) => updates(message as TravelLightItem))
          as TravelLightItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TravelLightItem create() => TravelLightItem._();
  TravelLightItem createEmptyInstance() => create();
  static $pb.PbList<TravelLightItem> createRepeated() =>
      $pb.PbList<TravelLightItem>();
  @$core.pragma('dart2js:noInline')
  static TravelLightItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TravelLightItem>(create);
  static TravelLightItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get cityId => $_getIZ(1);
  @$pb.TagNumber(2)
  set cityId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCityId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCityId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cityName => $_getSZ(2);
  @$pb.TagNumber(3)
  set cityName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCityName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCityName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get giftName => $_getSZ(3);
  @$pb.TagNumber(4)
  set giftName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftName() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftName() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get lightTimes => $_getIZ(4);
  @$pb.TagNumber(5)
  set lightTimes($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLightTimes() => $_has(4);
  @$pb.TagNumber(5)
  void clearLightTimes() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get cityIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set cityIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCityIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearCityIcon() => clearField(6);
}
