///
//  Generated code. Do not modify.
//  source: super.voice.play.music.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/struct.pb.dart' as $0;

class SuperVoicePlayMusic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuperVoicePlayMusic',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'super.voice.play.music'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'music_type')
    ..aOM<$0.Value>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SuperVoicePlayMusic._() : super();
  factory SuperVoicePlayMusic({
    $core.String? musicType,
    $0.Value? rid,
    $core.int? state,
  }) {
    final _result = create();
    if (musicType != null) {
      _result.musicType = musicType;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory SuperVoicePlayMusic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuperVoicePlayMusic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuperVoicePlayMusic clone() => SuperVoicePlayMusic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuperVoicePlayMusic copyWith(void Function(SuperVoicePlayMusic) updates) =>
      super.copyWith((message) => updates(message as SuperVoicePlayMusic))
          as SuperVoicePlayMusic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuperVoicePlayMusic create() => SuperVoicePlayMusic._();
  SuperVoicePlayMusic createEmptyInstance() => create();
  static $pb.PbList<SuperVoicePlayMusic> createRepeated() =>
      $pb.PbList<SuperVoicePlayMusic>();
  @$core.pragma('dart2js:noInline')
  static SuperVoicePlayMusic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuperVoicePlayMusic>(create);
  static SuperVoicePlayMusic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get musicType => $_getSZ(0);
  @$pb.TagNumber(1)
  set musicType($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMusicType() => $_has(0);
  @$pb.TagNumber(1)
  void clearMusicType() => clearField(1);

  @$pb.TagNumber(2)
  $0.Value get rid => $_getN(1);
  @$pb.TagNumber(2)
  set rid($0.Value v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => clearField(2);
  @$pb.TagNumber(2)
  $0.Value ensureRid() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get state => $_getIZ(2);
  @$pb.TagNumber(3)
  set state($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);
}
