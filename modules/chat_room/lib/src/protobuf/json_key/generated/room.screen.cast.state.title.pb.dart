///
//  Generated code. Do not modify.
//  source: room.screen.cast.state.title.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomScreenCastStateTitle extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomScreenCastStateTitle',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.screen.cast.state.title'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..hasRequiredFields = false;

  RoomScreenCastStateTitle._() : super();
  factory RoomScreenCastStateTitle({
    $core.String? title,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory RoomScreenCastStateTitle.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomScreenCastStateTitle.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomScreenCastStateTitle clone() =>
      RoomScreenCastStateTitle()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomScreenCastStateTitle copyWith(
          void Function(RoomScreenCastStateTitle) updates) =>
      super.copyWith((message) => updates(message as RoomScreenCastStateTitle))
          as RoomScreenCastStateTitle; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomScreenCastStateTitle create() => RoomScreenCastStateTitle._();
  RoomScreenCastStateTitle createEmptyInstance() => create();
  static $pb.PbList<RoomScreenCastStateTitle> createRepeated() =>
      $pb.PbList<RoomScreenCastStateTitle>();
  @$core.pragma('dart2js:noInline')
  static RoomScreenCastStateTitle getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomScreenCastStateTitle>(create);
  static RoomScreenCastStateTitle? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);
}
