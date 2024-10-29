///
//  Generated code. Do not modify.
//  source: room.livepk.screen.notice.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomLivePkScreenNotice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomLivePkScreenNotice',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.livepk.screen.notice'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'urid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uname')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uicon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'torid',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toname')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toicon')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'upk_score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topk_score',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'screen_content')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish_content')
    ..hasRequiredFields = false;

  RoomLivePkScreenNotice._() : super();
  factory RoomLivePkScreenNotice({
    $core.String? type,
    $core.int? urid,
    $core.String? uname,
    $core.String? uicon,
    $core.int? torid,
    $core.String? toname,
    $core.String? toicon,
    $core.int? upkScore,
    $core.int? topkScore,
    $core.String? screenContent,
    $core.String? punishContent,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (urid != null) {
      _result.urid = urid;
    }
    if (uname != null) {
      _result.uname = uname;
    }
    if (uicon != null) {
      _result.uicon = uicon;
    }
    if (torid != null) {
      _result.torid = torid;
    }
    if (toname != null) {
      _result.toname = toname;
    }
    if (toicon != null) {
      _result.toicon = toicon;
    }
    if (upkScore != null) {
      _result.upkScore = upkScore;
    }
    if (topkScore != null) {
      _result.topkScore = topkScore;
    }
    if (screenContent != null) {
      _result.screenContent = screenContent;
    }
    if (punishContent != null) {
      _result.punishContent = punishContent;
    }
    return _result;
  }
  factory RoomLivePkScreenNotice.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomLivePkScreenNotice.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomLivePkScreenNotice clone() =>
      RoomLivePkScreenNotice()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomLivePkScreenNotice copyWith(
          void Function(RoomLivePkScreenNotice) updates) =>
      super.copyWith((message) => updates(message as RoomLivePkScreenNotice))
          as RoomLivePkScreenNotice; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomLivePkScreenNotice create() => RoomLivePkScreenNotice._();
  RoomLivePkScreenNotice createEmptyInstance() => create();
  static $pb.PbList<RoomLivePkScreenNotice> createRepeated() =>
      $pb.PbList<RoomLivePkScreenNotice>();
  @$core.pragma('dart2js:noInline')
  static RoomLivePkScreenNotice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomLivePkScreenNotice>(create);
  static RoomLivePkScreenNotice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get urid => $_getIZ(1);
  @$pb.TagNumber(2)
  set urid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUrid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uname => $_getSZ(2);
  @$pb.TagNumber(3)
  set uname($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUname() => $_has(2);
  @$pb.TagNumber(3)
  void clearUname() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get uicon => $_getSZ(3);
  @$pb.TagNumber(4)
  set uicon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUicon() => $_has(3);
  @$pb.TagNumber(4)
  void clearUicon() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get torid => $_getIZ(4);
  @$pb.TagNumber(5)
  set torid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTorid() => $_has(4);
  @$pb.TagNumber(5)
  void clearTorid() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get toname => $_getSZ(5);
  @$pb.TagNumber(6)
  set toname($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasToname() => $_has(5);
  @$pb.TagNumber(6)
  void clearToname() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get toicon => $_getSZ(6);
  @$pb.TagNumber(7)
  set toicon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasToicon() => $_has(6);
  @$pb.TagNumber(7)
  void clearToicon() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get upkScore => $_getIZ(7);
  @$pb.TagNumber(8)
  set upkScore($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUpkScore() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpkScore() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get topkScore => $_getIZ(8);
  @$pb.TagNumber(9)
  set topkScore($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTopkScore() => $_has(8);
  @$pb.TagNumber(9)
  void clearTopkScore() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get screenContent => $_getSZ(9);
  @$pb.TagNumber(10)
  set screenContent($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasScreenContent() => $_has(9);
  @$pb.TagNumber(10)
  void clearScreenContent() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get punishContent => $_getSZ(10);
  @$pb.TagNumber(11)
  set punishContent($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPunishContent() => $_has(10);
  @$pb.TagNumber(11)
  void clearPunishContent() => clearField(11);
}
