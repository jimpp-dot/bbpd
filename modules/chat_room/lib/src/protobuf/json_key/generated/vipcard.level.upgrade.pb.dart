///
//  Generated code. Do not modify.
//  source: vipcard.level.upgrade.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class VipcardLevelUpgrade extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VipcardLevelUpgrade',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'vipcard.level.upgrade'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level_new',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title_new',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip_level',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  VipcardLevelUpgrade._() : super();
  factory VipcardLevelUpgrade({
    $core.String? icon,
    $core.int? levelNew,
    $core.String? message,
    $core.String? name,
    $core.int? titleNew,
    $core.String? type,
    $core.int? uid,
    $core.int? vipLevel,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (levelNew != null) {
      _result.levelNew = levelNew;
    }
    if (message != null) {
      _result.message = message;
    }
    if (name != null) {
      _result.name = name;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    if (type != null) {
      _result.type = type;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (vipLevel != null) {
      _result.vipLevel = vipLevel;
    }
    return _result;
  }
  factory VipcardLevelUpgrade.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VipcardLevelUpgrade.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VipcardLevelUpgrade clone() => VipcardLevelUpgrade()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VipcardLevelUpgrade copyWith(void Function(VipcardLevelUpgrade) updates) =>
      super.copyWith((message) => updates(message as VipcardLevelUpgrade))
          as VipcardLevelUpgrade; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VipcardLevelUpgrade create() => VipcardLevelUpgrade._();
  VipcardLevelUpgrade createEmptyInstance() => create();
  static $pb.PbList<VipcardLevelUpgrade> createRepeated() =>
      $pb.PbList<VipcardLevelUpgrade>();
  @$core.pragma('dart2js:noInline')
  static VipcardLevelUpgrade getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VipcardLevelUpgrade>(create);
  static VipcardLevelUpgrade? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get levelNew => $_getIZ(1);
  @$pb.TagNumber(2)
  set levelNew($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLevelNew() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevelNew() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get titleNew => $_getIZ(4);
  @$pb.TagNumber(5)
  set titleNew($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTitleNew() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitleNew() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get type => $_getSZ(5);
  @$pb.TagNumber(6)
  set type($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get uid => $_getIZ(6);
  @$pb.TagNumber(7)
  set uid($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUid() => $_has(6);
  @$pb.TagNumber(7)
  void clearUid() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get vipLevel => $_getIZ(7);
  @$pb.TagNumber(8)
  set vipLevel($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasVipLevel() => $_has(7);
  @$pb.TagNumber(8)
  void clearVipLevel() => clearField(8);
}
