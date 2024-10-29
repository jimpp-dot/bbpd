///
//  Generated code. Do not modify.
//  source: room.screen.cast.state.finish.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomScreenCastStateFinish extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomScreenCastStateFinish',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.screen.cast.state.finish'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  RoomScreenCastStateFinish._() : super();
  factory RoomScreenCastStateFinish() => create();
  factory RoomScreenCastStateFinish.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomScreenCastStateFinish.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomScreenCastStateFinish clone() =>
      RoomScreenCastStateFinish()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomScreenCastStateFinish copyWith(
          void Function(RoomScreenCastStateFinish) updates) =>
      super.copyWith((message) => updates(message as RoomScreenCastStateFinish))
          as RoomScreenCastStateFinish; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomScreenCastStateFinish create() => RoomScreenCastStateFinish._();
  RoomScreenCastStateFinish createEmptyInstance() => create();
  static $pb.PbList<RoomScreenCastStateFinish> createRepeated() =>
      $pb.PbList<RoomScreenCastStateFinish>();
  @$core.pragma('dart2js:noInline')
  static RoomScreenCastStateFinish getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomScreenCastStateFinish>(create);
  static RoomScreenCastStateFinish? _defaultInstance;
}
