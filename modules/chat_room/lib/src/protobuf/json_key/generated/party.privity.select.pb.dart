///
//  Generated code. Do not modify.
//  source: party.privity.select.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PartyPrivitySelect_User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyPrivitySelect.User',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.privity.select'),
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
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PartyPrivitySelect_User._() : super();
  factory PartyPrivitySelect_User({
    $core.String? icon,
    $core.String? name,
    $core.int? uid,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PartyPrivitySelect_User.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyPrivitySelect_User.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyPrivitySelect_User clone() =>
      PartyPrivitySelect_User()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyPrivitySelect_User copyWith(
          void Function(PartyPrivitySelect_User) updates) =>
      super.copyWith((message) => updates(message as PartyPrivitySelect_User))
          as PartyPrivitySelect_User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyPrivitySelect_User create() => PartyPrivitySelect_User._();
  PartyPrivitySelect_User createEmptyInstance() => create();
  static $pb.PbList<PartyPrivitySelect_User> createRepeated() =>
      $pb.PbList<PartyPrivitySelect_User>();
  @$core.pragma('dart2js:noInline')
  static PartyPrivitySelect_User getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyPrivitySelect_User>(create);
  static PartyPrivitySelect_User? _defaultInstance;

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
  $core.int get uid => $_getIZ(2);
  @$pb.TagNumber(3)
  set uid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);
}

class PartyPrivitySelect_Privity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyPrivitySelect.Privity',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.privity.select'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'qid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'select',
        $pb.PbFieldType.OU3)
    ..aOM<PartyPrivitySelect_User>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: PartyPrivitySelect_User.create)
    ..hasRequiredFields = false;

  PartyPrivitySelect_Privity._() : super();
  factory PartyPrivitySelect_Privity({
    $core.int? qid,
    $core.int? select,
    PartyPrivitySelect_User? user,
  }) {
    final _result = create();
    if (qid != null) {
      _result.qid = qid;
    }
    if (select != null) {
      _result.select = select;
    }
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory PartyPrivitySelect_Privity.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyPrivitySelect_Privity.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyPrivitySelect_Privity clone() =>
      PartyPrivitySelect_Privity()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyPrivitySelect_Privity copyWith(
          void Function(PartyPrivitySelect_Privity) updates) =>
      super.copyWith(
              (message) => updates(message as PartyPrivitySelect_Privity))
          as PartyPrivitySelect_Privity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyPrivitySelect_Privity create() => PartyPrivitySelect_Privity._();
  PartyPrivitySelect_Privity createEmptyInstance() => create();
  static $pb.PbList<PartyPrivitySelect_Privity> createRepeated() =>
      $pb.PbList<PartyPrivitySelect_Privity>();
  @$core.pragma('dart2js:noInline')
  static PartyPrivitySelect_Privity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyPrivitySelect_Privity>(create);
  static PartyPrivitySelect_Privity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get qid => $_getIZ(0);
  @$pb.TagNumber(1)
  set qid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasQid() => $_has(0);
  @$pb.TagNumber(1)
  void clearQid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get select => $_getIZ(1);
  @$pb.TagNumber(2)
  set select($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSelect() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelect() => clearField(2);

  @$pb.TagNumber(3)
  PartyPrivitySelect_User get user => $_getN(2);
  @$pb.TagNumber(3)
  set user(PartyPrivitySelect_User v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearUser() => clearField(3);
  @$pb.TagNumber(3)
  PartyPrivitySelect_User ensureUser() => $_ensure(2);
}

class PartyPrivitySelect extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyPrivitySelect',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.privity.select'),
      createEmptyInstance: create)
    ..aOM<PartyPrivitySelect_Privity>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privity',
        subBuilder: PartyPrivitySelect_Privity.create)
    ..hasRequiredFields = false;

  PartyPrivitySelect._() : super();
  factory PartyPrivitySelect({
    PartyPrivitySelect_Privity? privity,
  }) {
    final _result = create();
    if (privity != null) {
      _result.privity = privity;
    }
    return _result;
  }
  factory PartyPrivitySelect.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyPrivitySelect.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyPrivitySelect clone() => PartyPrivitySelect()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyPrivitySelect copyWith(void Function(PartyPrivitySelect) updates) =>
      super.copyWith((message) => updates(message as PartyPrivitySelect))
          as PartyPrivitySelect; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyPrivitySelect create() => PartyPrivitySelect._();
  PartyPrivitySelect createEmptyInstance() => create();
  static $pb.PbList<PartyPrivitySelect> createRepeated() =>
      $pb.PbList<PartyPrivitySelect>();
  @$core.pragma('dart2js:noInline')
  static PartyPrivitySelect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyPrivitySelect>(create);
  static PartyPrivitySelect? _defaultInstance;

  @$pb.TagNumber(1)
  PartyPrivitySelect_Privity get privity => $_getN(0);
  @$pb.TagNumber(1)
  set privity(PartyPrivitySelect_Privity v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrivity() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivity() => clearField(1);
  @$pb.TagNumber(1)
  PartyPrivitySelect_Privity ensurePrivity() => $_ensure(0);
}
