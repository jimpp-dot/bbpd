///
//  Generated code. Do not modify.
//  source: party.uncle.bomb.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PartyUncleBomb extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyUncleBomb',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.uncle.bomb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bomb')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bomb_name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stop',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PartyUncleBomb._() : super();
  factory PartyUncleBomb({
    $core.String? bomb,
    $core.String? bombName,
    $core.String? icon,
    $core.String? name,
    $core.int? stop,
    $core.int? uid,
  }) {
    final _result = create();
    if (bomb != null) {
      _result.bomb = bomb;
    }
    if (bombName != null) {
      _result.bombName = bombName;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (stop != null) {
      _result.stop = stop;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PartyUncleBomb.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyUncleBomb.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyUncleBomb clone() => PartyUncleBomb()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyUncleBomb copyWith(void Function(PartyUncleBomb) updates) =>
      super.copyWith((message) => updates(message as PartyUncleBomb))
          as PartyUncleBomb; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyUncleBomb create() => PartyUncleBomb._();
  PartyUncleBomb createEmptyInstance() => create();
  static $pb.PbList<PartyUncleBomb> createRepeated() =>
      $pb.PbList<PartyUncleBomb>();
  @$core.pragma('dart2js:noInline')
  static PartyUncleBomb getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyUncleBomb>(create);
  static PartyUncleBomb? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bomb => $_getSZ(0);
  @$pb.TagNumber(1)
  set bomb($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBomb() => $_has(0);
  @$pb.TagNumber(1)
  void clearBomb() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bombName => $_getSZ(1);
  @$pb.TagNumber(2)
  set bombName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBombName() => $_has(1);
  @$pb.TagNumber(2)
  void clearBombName() => clearField(2);

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
  $core.int get stop => $_getIZ(4);
  @$pb.TagNumber(5)
  set stop($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStop() => $_has(4);
  @$pb.TagNumber(5)
  void clearStop() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get uid => $_getIZ(5);
  @$pb.TagNumber(6)
  set uid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUid() => $_has(5);
  @$pb.TagNumber(6)
  void clearUid() => clearField(6);
}
