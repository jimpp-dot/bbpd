///
//  Generated code. Do not modify.
//  source: digit.bombing.sync.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/struct.pb.dart' as $0;

class DigitBombingSync extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DigitBombingSync',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'digit.bombing.sync'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bomb',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bomb_mode',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cmax',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cmin',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOM<$0.Value>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastdigit',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'max',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'min',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'player',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'player_icon')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'player_name')
    ..aOM<$0.Value>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  DigitBombingSync._() : super();
  factory DigitBombingSync({
    $core.int? bomb,
    $core.int? bombMode,
    $core.int? cmax,
    $core.int? cmin,
    $core.int? id,
    $0.Value? lastdigit,
    $core.int? max,
    $core.int? min,
    $core.int? player,
    $core.String? playerIcon,
    $core.String? playerName,
    $0.Value? position,
    $core.int? rid,
    $core.int? status,
    $core.int? uid,
  }) {
    final _result = create();
    if (bomb != null) {
      _result.bomb = bomb;
    }
    if (bombMode != null) {
      _result.bombMode = bombMode;
    }
    if (cmax != null) {
      _result.cmax = cmax;
    }
    if (cmin != null) {
      _result.cmin = cmin;
    }
    if (id != null) {
      _result.id = id;
    }
    if (lastdigit != null) {
      _result.lastdigit = lastdigit;
    }
    if (max != null) {
      _result.max = max;
    }
    if (min != null) {
      _result.min = min;
    }
    if (player != null) {
      _result.player = player;
    }
    if (playerIcon != null) {
      _result.playerIcon = playerIcon;
    }
    if (playerName != null) {
      _result.playerName = playerName;
    }
    if (position != null) {
      _result.position = position;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (status != null) {
      _result.status = status;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory DigitBombingSync.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DigitBombingSync.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DigitBombingSync clone() => DigitBombingSync()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DigitBombingSync copyWith(void Function(DigitBombingSync) updates) =>
      super.copyWith((message) => updates(message as DigitBombingSync))
          as DigitBombingSync; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DigitBombingSync create() => DigitBombingSync._();
  DigitBombingSync createEmptyInstance() => create();
  static $pb.PbList<DigitBombingSync> createRepeated() =>
      $pb.PbList<DigitBombingSync>();
  @$core.pragma('dart2js:noInline')
  static DigitBombingSync getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DigitBombingSync>(create);
  static DigitBombingSync? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get bomb => $_getIZ(0);
  @$pb.TagNumber(1)
  set bomb($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBomb() => $_has(0);
  @$pb.TagNumber(1)
  void clearBomb() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get bombMode => $_getIZ(1);
  @$pb.TagNumber(2)
  set bombMode($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBombMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearBombMode() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get cmax => $_getIZ(2);
  @$pb.TagNumber(3)
  set cmax($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCmax() => $_has(2);
  @$pb.TagNumber(3)
  void clearCmax() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get cmin => $_getIZ(3);
  @$pb.TagNumber(4)
  set cmin($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCmin() => $_has(3);
  @$pb.TagNumber(4)
  void clearCmin() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get id => $_getIZ(4);
  @$pb.TagNumber(5)
  set id($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasId() => $_has(4);
  @$pb.TagNumber(5)
  void clearId() => clearField(5);

  @$pb.TagNumber(6)
  $0.Value get lastdigit => $_getN(5);
  @$pb.TagNumber(6)
  set lastdigit($0.Value v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLastdigit() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastdigit() => clearField(6);
  @$pb.TagNumber(6)
  $0.Value ensureLastdigit() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get max => $_getIZ(6);
  @$pb.TagNumber(7)
  set max($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMax() => $_has(6);
  @$pb.TagNumber(7)
  void clearMax() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get min => $_getIZ(7);
  @$pb.TagNumber(8)
  set min($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMin() => $_has(7);
  @$pb.TagNumber(8)
  void clearMin() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get player => $_getIZ(8);
  @$pb.TagNumber(9)
  set player($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPlayer() => $_has(8);
  @$pb.TagNumber(9)
  void clearPlayer() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get playerIcon => $_getSZ(9);
  @$pb.TagNumber(10)
  set playerIcon($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPlayerIcon() => $_has(9);
  @$pb.TagNumber(10)
  void clearPlayerIcon() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get playerName => $_getSZ(10);
  @$pb.TagNumber(11)
  set playerName($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPlayerName() => $_has(10);
  @$pb.TagNumber(11)
  void clearPlayerName() => clearField(11);

  @$pb.TagNumber(12)
  $0.Value get position => $_getN(11);
  @$pb.TagNumber(12)
  set position($0.Value v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasPosition() => $_has(11);
  @$pb.TagNumber(12)
  void clearPosition() => clearField(12);
  @$pb.TagNumber(12)
  $0.Value ensurePosition() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.int get rid => $_getIZ(12);
  @$pb.TagNumber(13)
  set rid($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasRid() => $_has(12);
  @$pb.TagNumber(13)
  void clearRid() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get status => $_getIZ(13);
  @$pb.TagNumber(14)
  set status($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasStatus() => $_has(13);
  @$pb.TagNumber(14)
  void clearStatus() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get uid => $_getIZ(14);
  @$pb.TagNumber(15)
  set uid($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasUid() => $_has(14);
  @$pb.TagNumber(15)
  void clearUid() => clearField(15);
}
