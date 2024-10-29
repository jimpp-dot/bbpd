///
//  Generated code. Do not modify.
//  source: room.screen.cast.state.seekTo.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomScreenCastStateSeekTo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomScreenCastStateSeekTo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.screen.cast.state.seekTo'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playing_sec')
    ..hasRequiredFields = false;

  RoomScreenCastStateSeekTo._() : super();
  factory RoomScreenCastStateSeekTo({
    $core.String? playingSec,
  }) {
    final _result = create();
    if (playingSec != null) {
      _result.playingSec = playingSec;
    }
    return _result;
  }
  factory RoomScreenCastStateSeekTo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomScreenCastStateSeekTo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomScreenCastStateSeekTo clone() =>
      RoomScreenCastStateSeekTo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomScreenCastStateSeekTo copyWith(
          void Function(RoomScreenCastStateSeekTo) updates) =>
      super.copyWith((message) => updates(message as RoomScreenCastStateSeekTo))
          as RoomScreenCastStateSeekTo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomScreenCastStateSeekTo create() => RoomScreenCastStateSeekTo._();
  RoomScreenCastStateSeekTo createEmptyInstance() => create();
  static $pb.PbList<RoomScreenCastStateSeekTo> createRepeated() =>
      $pb.PbList<RoomScreenCastStateSeekTo>();
  @$core.pragma('dart2js:noInline')
  static RoomScreenCastStateSeekTo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomScreenCastStateSeekTo>(create);
  static RoomScreenCastStateSeekTo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playingSec => $_getSZ(0);
  @$pb.TagNumber(1)
  set playingSec($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlayingSec() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayingSec() => clearField(1);
}
