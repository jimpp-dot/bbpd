///
//  Generated code. Do not modify.
//  source: room.screen.cast.state.pause.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomScreenCastStatePause extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomScreenCastStatePause',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.screen.cast.state.pause'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playing_sec')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
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

  RoomScreenCastStatePause._() : super();
  factory RoomScreenCastStatePause({
    $core.String? playingSec,
    $core.int? state,
    $core.String? title,
    $core.String? url,
    $core.int? startTime,
  }) {
    final _result = create();
    if (playingSec != null) {
      _result.playingSec = playingSec;
    }
    if (state != null) {
      _result.state = state;
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
  factory RoomScreenCastStatePause.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomScreenCastStatePause.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomScreenCastStatePause clone() =>
      RoomScreenCastStatePause()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomScreenCastStatePause copyWith(
          void Function(RoomScreenCastStatePause) updates) =>
      super.copyWith((message) => updates(message as RoomScreenCastStatePause))
          as RoomScreenCastStatePause; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomScreenCastStatePause create() => RoomScreenCastStatePause._();
  RoomScreenCastStatePause createEmptyInstance() => create();
  static $pb.PbList<RoomScreenCastStatePause> createRepeated() =>
      $pb.PbList<RoomScreenCastStatePause>();
  @$core.pragma('dart2js:noInline')
  static RoomScreenCastStatePause getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomScreenCastStatePause>(create);
  static RoomScreenCastStatePause? _defaultInstance;

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

  @$pb.TagNumber(2)
  $core.int get state => $_getIZ(1);
  @$pb.TagNumber(2)
  set state($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

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
