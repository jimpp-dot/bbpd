///
//  Generated code. Do not modify.
//  source: room.screen.cast.state.stop.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/struct.pb.dart' as $0;

class RoomScreenCastStateStop extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomScreenCastStateStop',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.screen.cast.state.stop'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..aOM<$0.Value>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playing_sec',
        subBuilder: $0.Value.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startTime',
        $pb.PbFieldType.O3,
        protoName: 'startTime')
    ..hasRequiredFields = false;

  RoomScreenCastStateStop._() : super();
  factory RoomScreenCastStateStop({
    $core.int? state,
    $0.Value? playingSec,
    $core.String? title,
    $core.String? url,
    $core.int? startTime,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (playingSec != null) {
      _result.playingSec = playingSec;
    }
    if (title != null) {
      _result.title = title;
    }
    if (url != null) {
      _result.url = url;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    return _result;
  }
  factory RoomScreenCastStateStop.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomScreenCastStateStop.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomScreenCastStateStop clone() =>
      RoomScreenCastStateStop()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomScreenCastStateStop copyWith(
          void Function(RoomScreenCastStateStop) updates) =>
      super.copyWith((message) => updates(message as RoomScreenCastStateStop))
          as RoomScreenCastStateStop; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomScreenCastStateStop create() => RoomScreenCastStateStop._();
  RoomScreenCastStateStop createEmptyInstance() => create();
  static $pb.PbList<RoomScreenCastStateStop> createRepeated() =>
      $pb.PbList<RoomScreenCastStateStop>();
  @$core.pragma('dart2js:noInline')
  static RoomScreenCastStateStop getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomScreenCastStateStop>(create);
  static RoomScreenCastStateStop? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get state => $_getIZ(0);
  @$pb.TagNumber(1)
  set state($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  $0.Value get playingSec => $_getN(1);
  @$pb.TagNumber(2)
  set playingSec($0.Value v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPlayingSec() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayingSec() => clearField(2);
  @$pb.TagNumber(2)
  $0.Value ensurePlayingSec() => $_ensure(1);

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
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get startTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set startTime($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStartTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearStartTime() => clearField(5);
}
