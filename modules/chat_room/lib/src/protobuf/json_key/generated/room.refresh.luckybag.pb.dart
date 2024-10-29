///
//  Generated code. Do not modify.
//  source: room.refresh.luckybag.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomRefreshLuckyBag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefreshLuckyBag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refresh.luckybag'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  RoomRefreshLuckyBag._() : super();
  factory RoomRefreshLuckyBag() => create();
  factory RoomRefreshLuckyBag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefreshLuckyBag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefreshLuckyBag clone() => RoomRefreshLuckyBag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefreshLuckyBag copyWith(void Function(RoomRefreshLuckyBag) updates) =>
      super.copyWith((message) => updates(message as RoomRefreshLuckyBag))
          as RoomRefreshLuckyBag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefreshLuckyBag create() => RoomRefreshLuckyBag._();
  RoomRefreshLuckyBag createEmptyInstance() => create();
  static $pb.PbList<RoomRefreshLuckyBag> createRepeated() =>
      $pb.PbList<RoomRefreshLuckyBag>();
  @$core.pragma('dart2js:noInline')
  static RoomRefreshLuckyBag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefreshLuckyBag>(create);
  static RoomRefreshLuckyBag? _defaultInstance;
}
