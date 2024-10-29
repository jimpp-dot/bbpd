///
//  Generated code. Do not modify.
//  source: heartrace.notice.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class HeartraceNotice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HeartraceNotice',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'heartrace.notice'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftIcon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightIcon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subTitle')
    ..hasRequiredFields = false;

  HeartraceNotice._() : super();
  factory HeartraceNotice({
    $core.String? leftIcon,
    $core.String? rightIcon,
    $core.String? title,
    $core.String? subTitle,
  }) {
    final _result = create();
    if (leftIcon != null) {
      _result.leftIcon = leftIcon;
    }
    if (rightIcon != null) {
      _result.rightIcon = rightIcon;
    }
    if (title != null) {
      _result.title = title;
    }
    if (subTitle != null) {
      _result.subTitle = subTitle;
    }
    return _result;
  }
  factory HeartraceNotice.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HeartraceNotice.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HeartraceNotice clone() => HeartraceNotice()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HeartraceNotice copyWith(void Function(HeartraceNotice) updates) =>
      super.copyWith((message) => updates(message as HeartraceNotice))
          as HeartraceNotice; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeartraceNotice create() => HeartraceNotice._();
  HeartraceNotice createEmptyInstance() => create();
  static $pb.PbList<HeartraceNotice> createRepeated() =>
      $pb.PbList<HeartraceNotice>();
  @$core.pragma('dart2js:noInline')
  static HeartraceNotice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartraceNotice>(create);
  static HeartraceNotice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get leftIcon => $_getSZ(0);
  @$pb.TagNumber(1)
  set leftIcon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeftIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get rightIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set rightIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRightIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightIcon() => clearField(2);

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

  @$pb.TagNumber(4)
  $core.String get subTitle => $_getSZ(3);
  @$pb.TagNumber(4)
  set subTitle($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSubTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubTitle() => clearField(4);
}
