///
//  Generated code. Do not modify.
//  source: balloon.notice.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class BalloonNotice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BalloonNotice',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'balloon.notice'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expireTime')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showAnimate')
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stop')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'animate')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapSize',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  BalloonNotice._() : super();
  factory BalloonNotice({
    $core.int? id,
    $fixnum.Int64? expireTime,
    $core.String? icon,
    $core.bool? showAnimate,
    $core.bool? stop,
    $core.String? animate,
    $core.int? vapSize,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (expireTime != null) {
      _result.expireTime = expireTime;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (showAnimate != null) {
      _result.showAnimate = showAnimate;
    }
    if (stop != null) {
      _result.stop = stop;
    }
    if (animate != null) {
      _result.animate = animate;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    return _result;
  }
  factory BalloonNotice.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BalloonNotice.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BalloonNotice clone() => BalloonNotice()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BalloonNotice copyWith(void Function(BalloonNotice) updates) =>
      super.copyWith((message) => updates(message as BalloonNotice))
          as BalloonNotice; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BalloonNotice create() => BalloonNotice._();
  BalloonNotice createEmptyInstance() => create();
  static $pb.PbList<BalloonNotice> createRepeated() =>
      $pb.PbList<BalloonNotice>();
  @$core.pragma('dart2js:noInline')
  static BalloonNotice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BalloonNotice>(create);
  static BalloonNotice? _defaultInstance;

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
  $fixnum.Int64 get expireTime => $_getI64(1);
  @$pb.TagNumber(2)
  set expireTime($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasExpireTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpireTime() => clearField(2);

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
  $core.bool get showAnimate => $_getBF(3);
  @$pb.TagNumber(4)
  set showAnimate($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasShowAnimate() => $_has(3);
  @$pb.TagNumber(4)
  void clearShowAnimate() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get stop => $_getBF(4);
  @$pb.TagNumber(5)
  set stop($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStop() => $_has(4);
  @$pb.TagNumber(5)
  void clearStop() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get animate => $_getSZ(5);
  @$pb.TagNumber(6)
  set animate($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAnimate() => $_has(5);
  @$pb.TagNumber(6)
  void clearAnimate() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get vapSize => $_getIZ(6);
  @$pb.TagNumber(7)
  set vapSize($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasVapSize() => $_has(6);
  @$pb.TagNumber(7)
  void clearVapSize() => clearField(7);
}
