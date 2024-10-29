///
//  Generated code. Do not modify.
//  source: room.voice.start.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomVoiceStart extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomVoiceStart',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.voice.start'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to_rid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomVoiceStart._() : super();
  factory RoomVoiceStart({
    $core.int? toRid,
  }) {
    final _result = create();
    if (toRid != null) {
      _result.toRid = toRid;
    }
    return _result;
  }
  factory RoomVoiceStart.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomVoiceStart.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomVoiceStart clone() => RoomVoiceStart()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomVoiceStart copyWith(void Function(RoomVoiceStart) updates) =>
      super.copyWith((message) => updates(message as RoomVoiceStart))
          as RoomVoiceStart; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomVoiceStart create() => RoomVoiceStart._();
  RoomVoiceStart createEmptyInstance() => create();
  static $pb.PbList<RoomVoiceStart> createRepeated() =>
      $pb.PbList<RoomVoiceStart>();
  @$core.pragma('dart2js:noInline')
  static RoomVoiceStart getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomVoiceStart>(create);
  static RoomVoiceStart? _defaultInstance;

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
