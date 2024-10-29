///
//  Generated code. Do not modify.
//  source: slp_cloudbanner.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResCloudBanner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResCloudBanner',
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
    ..aOM<CloudBannerData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: CloudBannerData.create)
    ..hasRequiredFields = false;

  ResCloudBanner._() : super();
  factory ResCloudBanner({
    $core.bool? success,
    $core.String? msg,
    CloudBannerData? data,
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
  factory ResCloudBanner.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResCloudBanner.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResCloudBanner clone() => ResCloudBanner()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResCloudBanner copyWith(void Function(ResCloudBanner) updates) =>
      super.copyWith((message) => updates(message as ResCloudBanner))
          as ResCloudBanner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResCloudBanner create() => ResCloudBanner._();
  ResCloudBanner createEmptyInstance() => create();
  static $pb.PbList<ResCloudBanner> createRepeated() =>
      $pb.PbList<ResCloudBanner>();
  @$core.pragma('dart2js:noInline')
  static ResCloudBanner getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResCloudBanner>(create);
  static ResCloudBanner? _defaultInstance;

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
  CloudBannerData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(CloudBannerData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  CloudBannerData ensureData() => $_ensure(2);
}

class CloudBannerData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CloudBannerData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bannerImg')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bannerText')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bannerUrl')
    ..hasRequiredFields = false;

  CloudBannerData._() : super();
  factory CloudBannerData({
    $core.bool? show,
    $core.String? bannerImg,
    $core.String? bannerText,
    $core.String? bannerUrl,
  }) {
    final _result = create();
    if (show != null) {
      _result.show = show;
    }
    if (bannerImg != null) {
      _result.bannerImg = bannerImg;
    }
    if (bannerText != null) {
      _result.bannerText = bannerText;
    }
    if (bannerUrl != null) {
      _result.bannerUrl = bannerUrl;
    }
    return _result;
  }
  factory CloudBannerData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CloudBannerData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CloudBannerData clone() => CloudBannerData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CloudBannerData copyWith(void Function(CloudBannerData) updates) =>
      super.copyWith((message) => updates(message as CloudBannerData))
          as CloudBannerData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CloudBannerData create() => CloudBannerData._();
  CloudBannerData createEmptyInstance() => create();
  static $pb.PbList<CloudBannerData> createRepeated() =>
      $pb.PbList<CloudBannerData>();
  @$core.pragma('dart2js:noInline')
  static CloudBannerData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CloudBannerData>(create);
  static CloudBannerData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get show => $_getBF(0);
  @$pb.TagNumber(1)
  set show($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShow() => $_has(0);
  @$pb.TagNumber(1)
  void clearShow() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bannerImg => $_getSZ(1);
  @$pb.TagNumber(2)
  set bannerImg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBannerImg() => $_has(1);
  @$pb.TagNumber(2)
  void clearBannerImg() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get bannerText => $_getSZ(2);
  @$pb.TagNumber(3)
  set bannerText($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBannerText() => $_has(2);
  @$pb.TagNumber(3)
  void clearBannerText() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get bannerUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set bannerUrl($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBannerUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearBannerUrl() => clearField(4);
}
