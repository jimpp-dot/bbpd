///
//  Generated code. Do not modify.
//  source: defend.join.mic.banner.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class DefendJoinMicBanner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DefendJoinMicBanner',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'defend.join.mic.banner'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'my_name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to_name')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic_suffix')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'font_color')
    ..hasRequiredFields = false;

  DefendJoinMicBanner._() : super();
  factory DefendJoinMicBanner({
    $core.int? rid,
    $core.int? uid,
    $core.String? myName,
    $core.String? toName,
    $core.String? title,
    $core.String? micSuffix,
    $core.String? background,
    $core.String? fontColor,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (myName != null) {
      _result.myName = myName;
    }
    if (toName != null) {
      _result.toName = toName;
    }
    if (title != null) {
      _result.title = title;
    }
    if (micSuffix != null) {
      _result.micSuffix = micSuffix;
    }
    if (background != null) {
      _result.background = background;
    }
    if (fontColor != null) {
      _result.fontColor = fontColor;
    }
    return _result;
  }
  factory DefendJoinMicBanner.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DefendJoinMicBanner.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DefendJoinMicBanner clone() => DefendJoinMicBanner()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DefendJoinMicBanner copyWith(void Function(DefendJoinMicBanner) updates) =>
      super.copyWith((message) => updates(message as DefendJoinMicBanner))
          as DefendJoinMicBanner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DefendJoinMicBanner create() => DefendJoinMicBanner._();
  DefendJoinMicBanner createEmptyInstance() => create();
  static $pb.PbList<DefendJoinMicBanner> createRepeated() =>
      $pb.PbList<DefendJoinMicBanner>();
  @$core.pragma('dart2js:noInline')
  static DefendJoinMicBanner getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DefendJoinMicBanner>(create);
  static DefendJoinMicBanner? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get uid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get myName => $_getSZ(2);
  @$pb.TagNumber(3)
  set myName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMyName() => $_has(2);
  @$pb.TagNumber(3)
  void clearMyName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get toName => $_getSZ(3);
  @$pb.TagNumber(4)
  set toName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasToName() => $_has(3);
  @$pb.TagNumber(4)
  void clearToName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(5)
  set title($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get micSuffix => $_getSZ(5);
  @$pb.TagNumber(6)
  set micSuffix($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMicSuffix() => $_has(5);
  @$pb.TagNumber(6)
  void clearMicSuffix() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get background => $_getSZ(6);
  @$pb.TagNumber(7)
  set background($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBackground() => $_has(6);
  @$pb.TagNumber(7)
  void clearBackground() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get fontColor => $_getSZ(7);
  @$pb.TagNumber(8)
  set fontColor($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasFontColor() => $_has(7);
  @$pb.TagNumber(8)
  void clearFontColor() => clearField(8);
}
