///
//  Generated code. Do not modify.
//  source: share.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RespShare extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespShare',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'share',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wxUserName',
        protoName: 'wxUserName')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wxIcon',
        protoName: 'wxIcon')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wxPath',
        protoName: 'wxPath')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'info')
    ..hasRequiredFields = false;

  RespShare._() : super();
  factory RespShare({
    $core.bool? success,
    $core.String? msg,
    $core.int? share,
    $core.String? title,
    $core.String? icon,
    $core.String? desc,
    $core.String? url,
    $core.String? wxUserName,
    $core.String? wxIcon,
    $core.String? wxPath,
    $core.String? info,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (share != null) {
      _result.share = share;
    }
    if (title != null) {
      _result.title = title;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (url != null) {
      _result.url = url;
    }
    if (wxUserName != null) {
      _result.wxUserName = wxUserName;
    }
    if (wxIcon != null) {
      _result.wxIcon = wxIcon;
    }
    if (wxPath != null) {
      _result.wxPath = wxPath;
    }
    if (info != null) {
      _result.info = info;
    }
    return _result;
  }
  factory RespShare.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespShare.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespShare clone() => RespShare()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespShare copyWith(void Function(RespShare) updates) =>
      super.copyWith((message) => updates(message as RespShare))
          as RespShare; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespShare create() => RespShare._();
  RespShare createEmptyInstance() => create();
  static $pb.PbList<RespShare> createRepeated() => $pb.PbList<RespShare>();
  @$core.pragma('dart2js:noInline')
  static RespShare getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RespShare>(create);
  static RespShare? _defaultInstance;

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
  $core.int get share => $_getIZ(2);
  @$pb.TagNumber(3)
  set share($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShare() => $_has(2);
  @$pb.TagNumber(3)
  void clearShare() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

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

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get url => $_getSZ(6);
  @$pb.TagNumber(7)
  set url($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get wxUserName => $_getSZ(7);
  @$pb.TagNumber(8)
  set wxUserName($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasWxUserName() => $_has(7);
  @$pb.TagNumber(8)
  void clearWxUserName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get wxIcon => $_getSZ(8);
  @$pb.TagNumber(9)
  set wxIcon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasWxIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearWxIcon() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get wxPath => $_getSZ(9);
  @$pb.TagNumber(10)
  set wxPath($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasWxPath() => $_has(9);
  @$pb.TagNumber(10)
  void clearWxPath() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get info => $_getSZ(10);
  @$pb.TagNumber(11)
  set info($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasInfo() => $_has(10);
  @$pb.TagNumber(11)
  void clearInfo() => clearField(11);
}
