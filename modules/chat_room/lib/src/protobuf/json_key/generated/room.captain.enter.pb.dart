///
//  Generated code. Do not modify.
//  source: room.captain.enter.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomCaptainEnter_Group extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCaptainEnter.Group',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.captain.enter'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'captain')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'quiet',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCaptainEnter_Group._() : super();
  factory RoomCaptainEnter_Group({
    $core.String? id,
    $core.String? name,
    $core.String? captain,
    $core.int? quiet,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (captain != null) {
      _result.captain = captain;
    }
    if (quiet != null) {
      _result.quiet = quiet;
    }
    return _result;
  }
  factory RoomCaptainEnter_Group.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCaptainEnter_Group.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCaptainEnter_Group clone() =>
      RoomCaptainEnter_Group()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCaptainEnter_Group copyWith(
          void Function(RoomCaptainEnter_Group) updates) =>
      super.copyWith((message) => updates(message as RoomCaptainEnter_Group))
          as RoomCaptainEnter_Group; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCaptainEnter_Group create() => RoomCaptainEnter_Group._();
  RoomCaptainEnter_Group createEmptyInstance() => create();
  static $pb.PbList<RoomCaptainEnter_Group> createRepeated() =>
      $pb.PbList<RoomCaptainEnter_Group>();
  @$core.pragma('dart2js:noInline')
  static RoomCaptainEnter_Group getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCaptainEnter_Group>(create);
  static RoomCaptainEnter_Group? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get captain => $_getSZ(2);
  @$pb.TagNumber(3)
  set captain($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCaptain() => $_has(2);
  @$pb.TagNumber(3)
  void clearCaptain() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get quiet => $_getIZ(3);
  @$pb.TagNumber(4)
  set quiet($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasQuiet() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuiet() => clearField(4);
}

class RoomCaptainEnter_Captain extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCaptainEnter.Captain',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.captain.enter'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCaptainEnter_Captain._() : super();
  factory RoomCaptainEnter_Captain({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? sex,
    $core.int? vip,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    return _result;
  }
  factory RoomCaptainEnter_Captain.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCaptainEnter_Captain.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCaptainEnter_Captain clone() =>
      RoomCaptainEnter_Captain()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCaptainEnter_Captain copyWith(
          void Function(RoomCaptainEnter_Captain) updates) =>
      super.copyWith((message) => updates(message as RoomCaptainEnter_Captain))
          as RoomCaptainEnter_Captain; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCaptainEnter_Captain create() => RoomCaptainEnter_Captain._();
  RoomCaptainEnter_Captain createEmptyInstance() => create();
  static $pb.PbList<RoomCaptainEnter_Captain> createRepeated() =>
      $pb.PbList<RoomCaptainEnter_Captain>();
  @$core.pragma('dart2js:noInline')
  static RoomCaptainEnter_Captain getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCaptainEnter_Captain>(create);
  static RoomCaptainEnter_Captain? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sex => $_getSZ(3);
  @$pb.TagNumber(4)
  set sex($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get vip => $_getIZ(4);
  @$pb.TagNumber(5)
  set vip($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasVip() => $_has(4);
  @$pb.TagNumber(5)
  void clearVip() => clearField(5);
}

class RoomCaptainEnter_Effect extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCaptainEnter.Effect',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.captain.enter'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'font_color')
    ..hasRequiredFields = false;

  RoomCaptainEnter_Effect._() : super();
  factory RoomCaptainEnter_Effect({
    $core.String? image,
    $core.String? fontColor,
  }) {
    final _result = create();
    if (image != null) {
      _result.image = image;
    }
    if (fontColor != null) {
      _result.fontColor = fontColor;
    }
    return _result;
  }
  factory RoomCaptainEnter_Effect.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCaptainEnter_Effect.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCaptainEnter_Effect clone() =>
      RoomCaptainEnter_Effect()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCaptainEnter_Effect copyWith(
          void Function(RoomCaptainEnter_Effect) updates) =>
      super.copyWith((message) => updates(message as RoomCaptainEnter_Effect))
          as RoomCaptainEnter_Effect; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCaptainEnter_Effect create() => RoomCaptainEnter_Effect._();
  RoomCaptainEnter_Effect createEmptyInstance() => create();
  static $pb.PbList<RoomCaptainEnter_Effect> createRepeated() =>
      $pb.PbList<RoomCaptainEnter_Effect>();
  @$core.pragma('dart2js:noInline')
  static RoomCaptainEnter_Effect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCaptainEnter_Effect>(create);
  static RoomCaptainEnter_Effect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get image => $_getSZ(0);
  @$pb.TagNumber(1)
  set image($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fontColor => $_getSZ(1);
  @$pb.TagNumber(2)
  set fontColor($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFontColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearFontColor() => clearField(2);
}

class RoomCaptainEnter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCaptainEnter',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.captain.enter'),
      createEmptyInstance: create)
    ..aOM<RoomCaptainEnter_Group>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'group',
        subBuilder: RoomCaptainEnter_Group.create)
    ..aOM<RoomCaptainEnter_Captain>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'captain',
        subBuilder: RoomCaptainEnter_Captain.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'alive',
        $pb.PbFieldType.OU3)
    ..aOM<RoomCaptainEnter_Effect>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effect',
        subBuilder: RoomCaptainEnter_Effect.create)
    ..hasRequiredFields = false;

  RoomCaptainEnter._() : super();
  factory RoomCaptainEnter({
    RoomCaptainEnter_Group? group,
    RoomCaptainEnter_Captain? captain,
    $core.int? alive,
    RoomCaptainEnter_Effect? effect,
  }) {
    final _result = create();
    if (group != null) {
      _result.group = group;
    }
    if (captain != null) {
      _result.captain = captain;
    }
    if (alive != null) {
      _result.alive = alive;
    }
    if (effect != null) {
      _result.effect = effect;
    }
    return _result;
  }
  factory RoomCaptainEnter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCaptainEnter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCaptainEnter clone() => RoomCaptainEnter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCaptainEnter copyWith(void Function(RoomCaptainEnter) updates) =>
      super.copyWith((message) => updates(message as RoomCaptainEnter))
          as RoomCaptainEnter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCaptainEnter create() => RoomCaptainEnter._();
  RoomCaptainEnter createEmptyInstance() => create();
  static $pb.PbList<RoomCaptainEnter> createRepeated() =>
      $pb.PbList<RoomCaptainEnter>();
  @$core.pragma('dart2js:noInline')
  static RoomCaptainEnter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCaptainEnter>(create);
  static RoomCaptainEnter? _defaultInstance;

  @$pb.TagNumber(1)
  RoomCaptainEnter_Group get group => $_getN(0);
  @$pb.TagNumber(1)
  set group(RoomCaptainEnter_Group v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroup() => clearField(1);
  @$pb.TagNumber(1)
  RoomCaptainEnter_Group ensureGroup() => $_ensure(0);

  @$pb.TagNumber(2)
  RoomCaptainEnter_Captain get captain => $_getN(1);
  @$pb.TagNumber(2)
  set captain(RoomCaptainEnter_Captain v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCaptain() => $_has(1);
  @$pb.TagNumber(2)
  void clearCaptain() => clearField(2);
  @$pb.TagNumber(2)
  RoomCaptainEnter_Captain ensureCaptain() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get alive => $_getIZ(2);
  @$pb.TagNumber(3)
  set alive($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAlive() => $_has(2);
  @$pb.TagNumber(3)
  void clearAlive() => clearField(3);

  @$pb.TagNumber(4)
  RoomCaptainEnter_Effect get effect => $_getN(3);
  @$pb.TagNumber(4)
  set effect(RoomCaptainEnter_Effect v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEffect() => $_has(3);
  @$pb.TagNumber(4)
  void clearEffect() => clearField(4);
  @$pb.TagNumber(4)
  RoomCaptainEnter_Effect ensureEffect() => $_ensure(3);
}
