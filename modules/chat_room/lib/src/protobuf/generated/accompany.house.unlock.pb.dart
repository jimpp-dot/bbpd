///
//  Generated code. Do not modify.
//  source: accompany.house.unlock.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AccompanyHouseUnlock extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccompanyHouseUnlock',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'accompany.house.unlock'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uicon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uname')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitleNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uvip',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'word')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'builderUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'targetUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toname')
    ..hasRequiredFields = false;

  AccompanyHouseUnlock._() : super();
  factory AccompanyHouseUnlock({
    $core.String? uicon,
    $core.String? uname,
    $core.int? utitleNew,
    $core.int? uvip,
    $core.String? word,
    $core.String? icon,
    $core.String? type,
    $core.String? desc,
    $core.int? builderUid,
    $core.int? targetUid,
    $core.String? toname,
  }) {
    final _result = create();
    if (uicon != null) {
      _result.uicon = uicon;
    }
    if (uname != null) {
      _result.uname = uname;
    }
    if (utitleNew != null) {
      _result.utitleNew = utitleNew;
    }
    if (uvip != null) {
      _result.uvip = uvip;
    }
    if (word != null) {
      _result.word = word;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (type != null) {
      _result.type = type;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (builderUid != null) {
      _result.builderUid = builderUid;
    }
    if (targetUid != null) {
      _result.targetUid = targetUid;
    }
    if (toname != null) {
      _result.toname = toname;
    }
    return _result;
  }
  factory AccompanyHouseUnlock.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccompanyHouseUnlock.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccompanyHouseUnlock clone() =>
      AccompanyHouseUnlock()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccompanyHouseUnlock copyWith(void Function(AccompanyHouseUnlock) updates) =>
      super.copyWith((message) => updates(message as AccompanyHouseUnlock))
          as AccompanyHouseUnlock; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccompanyHouseUnlock create() => AccompanyHouseUnlock._();
  AccompanyHouseUnlock createEmptyInstance() => create();
  static $pb.PbList<AccompanyHouseUnlock> createRepeated() =>
      $pb.PbList<AccompanyHouseUnlock>();
  @$core.pragma('dart2js:noInline')
  static AccompanyHouseUnlock getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccompanyHouseUnlock>(create);
  static AccompanyHouseUnlock? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uicon => $_getSZ(0);
  @$pb.TagNumber(1)
  set uicon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUicon() => $_has(0);
  @$pb.TagNumber(1)
  void clearUicon() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uname => $_getSZ(1);
  @$pb.TagNumber(2)
  set uname($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUname() => $_has(1);
  @$pb.TagNumber(2)
  void clearUname() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get utitleNew => $_getIZ(2);
  @$pb.TagNumber(3)
  set utitleNew($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUtitleNew() => $_has(2);
  @$pb.TagNumber(3)
  void clearUtitleNew() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get uvip => $_getIZ(3);
  @$pb.TagNumber(4)
  set uvip($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUvip() => $_has(3);
  @$pb.TagNumber(4)
  void clearUvip() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get word => $_getSZ(4);
  @$pb.TagNumber(5)
  set word($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasWord() => $_has(4);
  @$pb.TagNumber(5)
  void clearWord() => clearField(5);

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
  $core.String get type => $_getSZ(6);
  @$pb.TagNumber(7)
  set type($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get desc => $_getSZ(7);
  @$pb.TagNumber(8)
  set desc($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDesc() => $_has(7);
  @$pb.TagNumber(8)
  void clearDesc() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get builderUid => $_getIZ(8);
  @$pb.TagNumber(9)
  set builderUid($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasBuilderUid() => $_has(8);
  @$pb.TagNumber(9)
  void clearBuilderUid() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get targetUid => $_getIZ(9);
  @$pb.TagNumber(10)
  set targetUid($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTargetUid() => $_has(9);
  @$pb.TagNumber(10)
  void clearTargetUid() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get toname => $_getSZ(10);
  @$pb.TagNumber(11)
  set toname($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasToname() => $_has(10);
  @$pb.TagNumber(11)
  void clearToname() => clearField(11);
}
