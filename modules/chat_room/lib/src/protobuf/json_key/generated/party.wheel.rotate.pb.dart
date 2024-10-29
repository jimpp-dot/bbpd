///
//  Generated code. Do not modify.
//  source: party.wheel.rotate.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PartyWheelRotate_User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyWheelRotate.User',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.wheel.rotate'),
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
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PartyWheelRotate_User._() : super();
  factory PartyWheelRotate_User({
    $core.String? icon,
    $core.int? uid,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PartyWheelRotate_User.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyWheelRotate_User.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyWheelRotate_User clone() =>
      PartyWheelRotate_User()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyWheelRotate_User copyWith(
          void Function(PartyWheelRotate_User) updates) =>
      super.copyWith((message) => updates(message as PartyWheelRotate_User))
          as PartyWheelRotate_User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyWheelRotate_User create() => PartyWheelRotate_User._();
  PartyWheelRotate_User createEmptyInstance() => create();
  static $pb.PbList<PartyWheelRotate_User> createRepeated() =>
      $pb.PbList<PartyWheelRotate_User>();
  @$core.pragma('dart2js:noInline')
  static PartyWheelRotate_User getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyWheelRotate_User>(create);
  static PartyWheelRotate_User? _defaultInstance;

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
  $core.int get uid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);
}

class PartyWheelRotate_Wheel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyWheelRotate.Wheel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.wheel.rotate'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_started',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish_id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rotating',
        $pb.PbFieldType.OU3)
    ..aOM<PartyWheelRotate_User>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: PartyWheelRotate_User.create)
    ..hasRequiredFields = false;

  PartyWheelRotate_Wheel._() : super();
  factory PartyWheelRotate_Wheel({
    $core.int? id,
    $core.int? isStarted,
    $core.String? name,
    $core.int? punishId,
    $core.int? rotating,
    PartyWheelRotate_User? user,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (isStarted != null) {
      _result.isStarted = isStarted;
    }
    if (name != null) {
      _result.name = name;
    }
    if (punishId != null) {
      _result.punishId = punishId;
    }
    if (rotating != null) {
      _result.rotating = rotating;
    }
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory PartyWheelRotate_Wheel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyWheelRotate_Wheel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyWheelRotate_Wheel clone() =>
      PartyWheelRotate_Wheel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyWheelRotate_Wheel copyWith(
          void Function(PartyWheelRotate_Wheel) updates) =>
      super.copyWith((message) => updates(message as PartyWheelRotate_Wheel))
          as PartyWheelRotate_Wheel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyWheelRotate_Wheel create() => PartyWheelRotate_Wheel._();
  PartyWheelRotate_Wheel createEmptyInstance() => create();
  static $pb.PbList<PartyWheelRotate_Wheel> createRepeated() =>
      $pb.PbList<PartyWheelRotate_Wheel>();
  @$core.pragma('dart2js:noInline')
  static PartyWheelRotate_Wheel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyWheelRotate_Wheel>(create);
  static PartyWheelRotate_Wheel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get isStarted => $_getIZ(1);
  @$pb.TagNumber(2)
  set isStarted($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsStarted() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsStarted() => clearField(2);

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
  $core.int get punishId => $_getIZ(3);
  @$pb.TagNumber(4)
  set punishId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPunishId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPunishId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get rotating => $_getIZ(4);
  @$pb.TagNumber(5)
  set rotating($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRotating() => $_has(4);
  @$pb.TagNumber(5)
  void clearRotating() => clearField(5);

  @$pb.TagNumber(6)
  PartyWheelRotate_User get user => $_getN(5);
  @$pb.TagNumber(6)
  set user(PartyWheelRotate_User v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUser() => $_has(5);
  @$pb.TagNumber(6)
  void clearUser() => clearField(6);
  @$pb.TagNumber(6)
  PartyWheelRotate_User ensureUser() => $_ensure(5);
}

class PartyWheelRotate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyWheelRotate',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.wheel.rotate'),
      createEmptyInstance: create)
    ..aOM<PartyWheelRotate_Wheel>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wheel',
        subBuilder: PartyWheelRotate_Wheel.create)
    ..hasRequiredFields = false;

  PartyWheelRotate._() : super();
  factory PartyWheelRotate({
    PartyWheelRotate_Wheel? wheel,
  }) {
    final _result = create();
    if (wheel != null) {
      _result.wheel = wheel;
    }
    return _result;
  }
  factory PartyWheelRotate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyWheelRotate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyWheelRotate clone() => PartyWheelRotate()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyWheelRotate copyWith(void Function(PartyWheelRotate) updates) =>
      super.copyWith((message) => updates(message as PartyWheelRotate))
          as PartyWheelRotate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyWheelRotate create() => PartyWheelRotate._();
  PartyWheelRotate createEmptyInstance() => create();
  static $pb.PbList<PartyWheelRotate> createRepeated() =>
      $pb.PbList<PartyWheelRotate>();
  @$core.pragma('dart2js:noInline')
  static PartyWheelRotate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyWheelRotate>(create);
  static PartyWheelRotate? _defaultInstance;

  @$pb.TagNumber(1)
  PartyWheelRotate_Wheel get wheel => $_getN(0);
  @$pb.TagNumber(1)
  set wheel(PartyWheelRotate_Wheel v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasWheel() => $_has(0);
  @$pb.TagNumber(1)
  void clearWheel() => clearField(1);
  @$pb.TagNumber(1)
  PartyWheelRotate_Wheel ensureWheel() => $_ensure(0);
}
