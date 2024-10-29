///
//  Generated code. Do not modify.
//  source: room.voice.end.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomVoiceEnd extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomVoiceEnd',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.voice.end'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to_rid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomVoiceEnd._() : super();
  factory RoomVoiceEnd({
    $core.int? toRid,
  }) {
    final _result = create();
    if (toRid != null) {
      _result.toRid = toRid;
    }
    return _result;
  }
  factory RoomVoiceEnd.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomVoiceEnd.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomVoiceEnd clone() => RoomVoiceEnd()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomVoiceEnd copyWith(void Function(RoomVoiceEnd) updates) =>
      super.copyWith((message) => updates(message as RoomVoiceEnd))
          as RoomVoiceEnd; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomVoiceEnd create() => RoomVoiceEnd._();
  RoomVoiceEnd createEmptyInstance() => create();
  static $pb.PbList<RoomVoiceEnd> createRepeated() =>
      $pb.PbList<RoomVoiceEnd>();
  @$core.pragma('dart2js:noInline')
  static RoomVoiceEnd getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomVoiceEnd>(create);
  static RoomVoiceEnd? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get toRid => $_getIZ(0);
  @$pb.TagNumber(1)
  set toRid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasToRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearToRid() => clearField(1);
}
