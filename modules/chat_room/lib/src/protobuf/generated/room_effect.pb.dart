///
//  Generated code. Do not modify.
//  source: room_effect.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class IconVapEffect extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'IconVapEffect',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size',
        $pb.PbFieldType.OU3)
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contents')
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'images')
    ..hasRequiredFields = false;

  IconVapEffect._() : super();
  factory IconVapEffect({
    $core.String? url,
    $core.int? size,
    $core.Iterable<$core.String>? contents,
    $core.Iterable<$core.String>? images,
  }) {
    final _result = create();
    if (url != null) {
      _result.url = url;
    }
    if (size != null) {
      _result.size = size;
    }
    if (contents != null) {
      _result.contents.addAll(contents);
    }
    if (images != null) {
      _result.images.addAll(images);
    }
    return _result;
  }
  factory IconVapEffect.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IconVapEffect.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IconVapEffect clone() => IconVapEffect()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IconVapEffect copyWith(void Function(IconVapEffect) updates) =>
      super.copyWith((message) => updates(message as IconVapEffect))
          as IconVapEffect; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IconVapEffect create() => IconVapEffect._();
  IconVapEffect createEmptyInstance() => create();
  static $pb.PbList<IconVapEffect> createRepeated() =>
      $pb.PbList<IconVapEffect>();
  @$core.pragma('dart2js:noInline')
  static IconVapEffect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IconVapEffect>(create);
  static IconVapEffect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get size => $_getIZ(1);
  @$pb.TagNumber(2)
  set size($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get contents => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.String> get images => $_getList(3);
}
