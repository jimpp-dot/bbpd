///
//  Generated code. Do not modify.
//  source: tour.captain.coming.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TourCaptainComing_Captain extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TourCaptainComing.Captain',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'tour.captain.coming'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  TourCaptainComing_Captain._() : super();
  factory TourCaptainComing_Captain({
    $core.String? icon,
    $core.String? sex,
    $core.int? vip,
    $core.String? uid,
    $core.String? name,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory TourCaptainComing_Captain.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TourCaptainComing_Captain.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TourCaptainComing_Captain clone() =>
      TourCaptainComing_Captain()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TourCaptainComing_Captain copyWith(
          void Function(TourCaptainComing_Captain) updates) =>
      super.copyWith((message) => updates(message as TourCaptainComing_Captain))
          as TourCaptainComing_Captain; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TourCaptainComing_Captain create() => TourCaptainComing_Captain._();
  TourCaptainComing_Captain createEmptyInstance() => create();
  static $pb.PbList<TourCaptainComing_Captain> createRepeated() =>
      $pb.PbList<TourCaptainComing_Captain>();
  @$core.pragma('dart2js:noInline')
  static TourCaptainComing_Captain getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TourCaptainComing_Captain>(create);
  static TourCaptainComing_Captain? _defaultInstance;

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
  $core.String get sex => $_getSZ(1);
  @$pb.TagNumber(2)
  set sex($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSex() => $_has(1);
  @$pb.TagNumber(2)
  void clearSex() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get vip => $_getIZ(2);
  @$pb.TagNumber(3)
  set vip($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVip() => $_has(2);
  @$pb.TagNumber(3)
  void clearVip() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get uid => $_getSZ(3);
  @$pb.TagNumber(4)
  set uid($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);
}

class TourCaptainComing_Group extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TourCaptainComing.Group',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'tour.captain.coming'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'quiet')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..hasRequiredFields = false;

  TourCaptainComing_Group._() : super();
  factory TourCaptainComing_Group({
    $core.String? quiet,
    $core.String? id,
    $core.String? name,
    $core.String? type,
  }) {
    final _result = create();
    if (quiet != null) {
      _result.quiet = quiet;
    }
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory TourCaptainComing_Group.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TourCaptainComing_Group.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TourCaptainComing_Group clone() =>
      TourCaptainComing_Group()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TourCaptainComing_Group copyWith(
          void Function(TourCaptainComing_Group) updates) =>
      super.copyWith((message) => updates(message as TourCaptainComing_Group))
          as TourCaptainComing_Group; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TourCaptainComing_Group create() => TourCaptainComing_Group._();
  TourCaptainComing_Group createEmptyInstance() => create();
  static $pb.PbList<TourCaptainComing_Group> createRepeated() =>
      $pb.PbList<TourCaptainComing_Group>();
  @$core.pragma('dart2js:noInline')
  static TourCaptainComing_Group getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TourCaptainComing_Group>(create);
  static TourCaptainComing_Group? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get quiet => $_getSZ(0);
  @$pb.TagNumber(1)
  set quiet($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasQuiet() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuiet() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);
}

class TourCaptainComing extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TourCaptainComing',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'tour.captain.coming'),
      createEmptyInstance: create)
    ..aOM<TourCaptainComing_Captain>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'captain',
        subBuilder: TourCaptainComing_Captain.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'captain_rid',
        $pb.PbFieldType.OU3)
    ..aOM<TourCaptainComing_Group>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'group',
        subBuilder: TourCaptainComing_Group.create)
    ..hasRequiredFields = false;

  TourCaptainComing._() : super();
  factory TourCaptainComing({
    TourCaptainComing_Captain? captain,
    $core.int? captainRid,
    TourCaptainComing_Group? group,
  }) {
    final _result = create();
    if (captain != null) {
      _result.captain = captain;
    }
    if (captainRid != null) {
      _result.captainRid = captainRid;
    }
    if (group != null) {
      _result.group = group;
    }
    return _result;
  }
  factory TourCaptainComing.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TourCaptainComing.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TourCaptainComing clone() => TourCaptainComing()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TourCaptainComing copyWith(void Function(TourCaptainComing) updates) =>
      super.copyWith((message) => updates(message as TourCaptainComing))
          as TourCaptainComing; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TourCaptainComing create() => TourCaptainComing._();
  TourCaptainComing createEmptyInstance() => create();
  static $pb.PbList<TourCaptainComing> createRepeated() =>
      $pb.PbList<TourCaptainComing>();
  @$core.pragma('dart2js:noInline')
  static TourCaptainComing getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TourCaptainComing>(create);
  static TourCaptainComing? _defaultInstance;

  @$pb.TagNumber(1)
  TourCaptainComing_Captain get captain => $_getN(0);
  @$pb.TagNumber(1)
  set captain(TourCaptainComing_Captain v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCaptain() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaptain() => clearField(1);
  @$pb.TagNumber(1)
  TourCaptainComing_Captain ensureCaptain() => $_ensure(0);

  @$pb.TagNumber(4)
  $core.int get captainRid => $_getIZ(1);
  @$pb.TagNumber(4)
  set captainRid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCaptainRid() => $_has(1);
  @$pb.TagNumber(4)
  void clearCaptainRid() => clearField(4);

  @$pb.TagNumber(5)
  TourCaptainComing_Group get group => $_getN(2);
  @$pb.TagNumber(5)
  set group(TourCaptainComing_Group v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGroup() => $_has(2);
  @$pb.TagNumber(5)
  void clearGroup() => clearField(5);
  @$pb.TagNumber(5)
  TourCaptainComing_Group ensureGroup() => $_ensure(2);
}
