///
//  Generated code. Do not modify.
//  source: room.mic.effects.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomMicEffects_Effects extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomMicEffects.Effects',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.mic.effects'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expire',
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
            : 'url')
    ..hasRequiredFields = false;

  RoomMicEffects_Effects._() : super();
  factory RoomMicEffects_Effects({
    $core.int? expire,
    $core.int? uid,
    $core.String? url,
  }) {
    final _result = create();
    if (expire != null) {
      _result.expire = expire;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory RoomMicEffects_Effects.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomMicEffects_Effects.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomMicEffects_Effects clone() =>
      RoomMicEffects_Effects()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomMicEffects_Effects copyWith(
          void Function(RoomMicEffects_Effects) updates) =>
      super.copyWith((message) => updates(message as RoomMicEffects_Effects))
          as RoomMicEffects_Effects; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomMicEffects_Effects create() => RoomMicEffects_Effects._();
  RoomMicEffects_Effects createEmptyInstance() => create();
  static $pb.PbList<RoomMicEffects_Effects> createRepeated() =>
      $pb.PbList<RoomMicEffects_Effects>();
  @$core.pragma('dart2js:noInline')
  static RoomMicEffects_Effects getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomMicEffects_Effects>(create);
  static RoomMicEffects_Effects? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get expire => $_getIZ(0);
  @$pb.TagNumber(1)
  set expire($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasExpire() => $_has(0);
  @$pb.TagNumber(1)
  void clearExpire() => clearField(1);

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

class RoomMicEffects extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomMicEffects',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.mic.effects'),
      createEmptyInstance: create)
    ..pc<RoomMicEffects_Effects>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effects',
        $pb.PbFieldType.PM,
        subBuilder: RoomMicEffects_Effects.create)
    ..hasRequiredFields = false;

  RoomMicEffects._() : super();
  factory RoomMicEffects({
    $core.Iterable<RoomMicEffects_Effects>? effects,
  }) {
    final _result = create();
    if (effects != null) {
      _result.effects.addAll(effects);
    }
    return _result;
  }
  factory RoomMicEffects.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomMicEffects.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomMicEffects clone() => RoomMicEffects()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomMicEffects copyWith(void Function(RoomMicEffects) updates) =>
      super.copyWith((message) => updates(message as RoomMicEffects))
          as RoomMicEffects; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomMicEffects create() => RoomMicEffects._();
  RoomMicEffects createEmptyInstance() => create();
  static $pb.PbList<RoomMicEffects> createRepeated() =>
      $pb.PbList<RoomMicEffects>();
  @$core.pragma('dart2js:noInline')
  static RoomMicEffects getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomMicEffects>(create);
  static RoomMicEffects? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomMicEffects_Effects> get effects => $_getList(0);
}
