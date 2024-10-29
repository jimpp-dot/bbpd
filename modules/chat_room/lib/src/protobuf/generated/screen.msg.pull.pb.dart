///
//  Generated code. Do not modify.
//  source: screen.msg.pull.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ScreenMsgPull extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMsgPull',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'screen.msg.pull'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pullSwitch')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentTime')
    ..hasRequiredFields = false;

  ScreenMsgPull._() : super();
  factory ScreenMsgPull({
    $core.bool? pullSwitch,
    $core.String? url,
    $fixnum.Int64? currentTime,
  }) {
    final _result = create();
    if (pullSwitch != null) {
      _result.pullSwitch = pullSwitch;
    }
    if (url != null) {
      _result.url = url;
    }
    if (currentTime != null) {
      _result.currentTime = currentTime;
    }
    return _result;
  }
  factory ScreenMsgPull.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMsgPull.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMsgPull clone() => ScreenMsgPull()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMsgPull copyWith(void Function(ScreenMsgPull) updates) =>
      super.copyWith((message) => updates(message as ScreenMsgPull))
          as ScreenMsgPull; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMsgPull create() => ScreenMsgPull._();
  ScreenMsgPull createEmptyInstance() => create();
  static $pb.PbList<ScreenMsgPull> createRepeated() =>
      $pb.PbList<ScreenMsgPull>();
  @$core.pragma('dart2js:noInline')
  static ScreenMsgPull getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMsgPull>(create);
  static ScreenMsgPull? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get pullSwitch => $_getBF(0);
  @$pb.TagNumber(1)
  set pullSwitch($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPullSwitch() => $_has(0);
  @$pb.TagNumber(1)
  void clearPullSwitch() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get currentTime => $_getI64(2);
  @$pb.TagNumber(3)
  set currentTime($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCurrentTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentTime() => clearField(3);
}
