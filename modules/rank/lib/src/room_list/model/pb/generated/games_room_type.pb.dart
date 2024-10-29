///
//  Generated code. Do not modify.
//  source: games_room_type.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GamesRoomTypeName1 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GamesRoomTypeName1',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'val')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'homeIcon')
    ..hasRequiredFields = false;

  GamesRoomTypeName1._() : super();
  factory GamesRoomTypeName1({
    $core.String? label,
    $core.String? val,
    $core.String? color,
    $core.Iterable<$core.String>? bg,
    $core.String? show,
    $core.String? icon,
    $core.String? homeIcon,
  }) {
    final _result = create();
    if (label != null) {
      _result.label = label;
    }
    if (val != null) {
      _result.val = val;
    }
    if (color != null) {
      _result.color = color;
    }
    if (bg != null) {
      _result.bg.addAll(bg);
    }
    if (show != null) {
      _result.show = show;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (homeIcon != null) {
      _result.homeIcon = homeIcon;
    }
    return _result;
  }
  factory GamesRoomTypeName1.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GamesRoomTypeName1.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GamesRoomTypeName1 clone() => GamesRoomTypeName1()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GamesRoomTypeName1 copyWith(void Function(GamesRoomTypeName1) updates) =>
      super.copyWith((message) => updates(message as GamesRoomTypeName1))
          as GamesRoomTypeName1; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GamesRoomTypeName1 create() => GamesRoomTypeName1._();
  GamesRoomTypeName1 createEmptyInstance() => create();
  static $pb.PbList<GamesRoomTypeName1> createRepeated() =>
      $pb.PbList<GamesRoomTypeName1>();
  @$core.pragma('dart2js:noInline')
  static GamesRoomTypeName1 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GamesRoomTypeName1>(create);
  static GamesRoomTypeName1? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get val => $_getSZ(1);
  @$pb.TagNumber(2)
  set val($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearVal() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get color => $_getSZ(2);
  @$pb.TagNumber(3)
  set color($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearColor() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get bg => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get show => $_getSZ(4);
  @$pb.TagNumber(5)
  set show($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasShow() => $_has(4);
  @$pb.TagNumber(5)
  void clearShow() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get icon => $_getSZ(5);
  @$pb.TagNumber(6)
  set icon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get homeIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set homeIcon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasHomeIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearHomeIcon() => clearField(7);
}
