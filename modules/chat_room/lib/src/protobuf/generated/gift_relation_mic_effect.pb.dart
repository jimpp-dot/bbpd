///
//  Generated code. Do not modify.
//  source: gift_relation_mic_effect.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GiftRelationMicEffect extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftRelationMicEffect',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.wave.sync'),
      createEmptyInstance: create)
    ..p<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.PU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'timeSecond',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..hasRequiredFields = false;

  GiftRelationMicEffect._() : super();
  factory GiftRelationMicEffect({
    $core.Iterable<$core.int>? uid,
    $core.int? timeSecond,
    $core.String? url,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid.addAll(uid);
    }
    if (timeSecond != null) {
      _result.timeSecond = timeSecond;
    }
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory GiftRelationMicEffect.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftRelationMicEffect.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftRelationMicEffect clone() =>
      GiftRelationMicEffect()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftRelationMicEffect copyWith(
          void Function(GiftRelationMicEffect) updates) =>
      super.copyWith((message) => updates(message as GiftRelationMicEffect))
          as GiftRelationMicEffect; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftRelationMicEffect create() => GiftRelationMicEffect._();
  GiftRelationMicEffect createEmptyInstance() => create();
  static $pb.PbList<GiftRelationMicEffect> createRepeated() =>
      $pb.PbList<GiftRelationMicEffect>();
  @$core.pragma('dart2js:noInline')
  static GiftRelationMicEffect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftRelationMicEffect>(create);
  static GiftRelationMicEffect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get uid => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get timeSecond => $_getIZ(1);
  @$pb.TagNumber(2)
  set timeSecond($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTimeSecond() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimeSecond() => clearField(2);

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
}
