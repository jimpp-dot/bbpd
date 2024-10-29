///
//  Generated code. Do not modify.
//  source: room_noble_add_hot.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomNobleAddHot extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomNobleAddHot',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.noble.add.hot'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelLabel')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hotNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomNobleAddHot._() : super();
  factory RoomNobleAddHot({
    $core.String? levelLabel,
    $core.int? count,
    $core.int? hotNum,
  }) {
    final _result = create();
    if (levelLabel != null) {
      _result.levelLabel = levelLabel;
    }
    if (count != null) {
      _result.count = count;
    }
    if (hotNum != null) {
      _result.hotNum = hotNum;
    }
    return _result;
  }
  factory RoomNobleAddHot.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomNobleAddHot.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomNobleAddHot clone() => RoomNobleAddHot()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomNobleAddHot copyWith(void Function(RoomNobleAddHot) updates) =>
      super.copyWith((message) => updates(message as RoomNobleAddHot))
          as RoomNobleAddHot; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomNobleAddHot create() => RoomNobleAddHot._();
  RoomNobleAddHot createEmptyInstance() => create();
  static $pb.PbList<RoomNobleAddHot> createRepeated() =>
      $pb.PbList<RoomNobleAddHot>();
  @$core.pragma('dart2js:noInline')
  static RoomNobleAddHot getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomNobleAddHot>(create);
  static RoomNobleAddHot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get levelLabel => $_getSZ(0);
  @$pb.TagNumber(1)
  set levelLabel($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevelLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevelLabel() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get hotNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set hotNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHotNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearHotNum() => clearField(3);
}
