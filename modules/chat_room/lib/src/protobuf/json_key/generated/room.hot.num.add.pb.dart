///
//  Generated code. Do not modify.
//  source: room.hot.num.add.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomHotNumAdd extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomHotNumAdd',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.hot.num.add'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hot',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomHotNumAdd._() : super();
  factory RoomHotNumAdd({
    $core.int? hot,
  }) {
    final _result = create();
    if (hot != null) {
      _result.hot = hot;
    }
    return _result;
  }
  factory RoomHotNumAdd.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomHotNumAdd.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomHotNumAdd clone() => RoomHotNumAdd()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomHotNumAdd copyWith(void Function(RoomHotNumAdd) updates) =>
      super.copyWith((message) => updates(message as RoomHotNumAdd))
          as RoomHotNumAdd; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomHotNumAdd create() => RoomHotNumAdd._();
  RoomHotNumAdd createEmptyInstance() => create();
  static $pb.PbList<RoomHotNumAdd> createRepeated() =>
      $pb.PbList<RoomHotNumAdd>();
  @$core.pragma('dart2js:noInline')
  static RoomHotNumAdd getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomHotNumAdd>(create);
  static RoomHotNumAdd? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get hot => $_getIZ(0);
  @$pb.TagNumber(1)
  set hot($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHot() => $_has(0);
  @$pb.TagNumber(1)
  void clearHot() => clearField(1);
}
