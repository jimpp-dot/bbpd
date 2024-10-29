///
//  Generated code. Do not modify.
//  source: room.pk.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class RoomPkStart extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomPkStart',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainRid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainIcon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainName')
    ..a<$fixnum.Int64>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainScore',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainMvpName')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainMvpIcon')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainMvpUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestRid',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestIcon')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestName')
    ..a<$fixnum.Int64>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestScore',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestMvpName')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestMvpIcon')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestMvpUid',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadline',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  RoomPkStart._() : super();
  factory RoomPkStart({
    $core.int? mainRid,
    $core.String? mainIcon,
    $core.String? mainName,
    $fixnum.Int64? mainScore,
    $core.String? mainMvpName,
    $core.String? mainMvpIcon,
    $core.int? mainMvpUid,
    $core.int? guestRid,
    $core.String? guestIcon,
    $core.String? guestName,
    $fixnum.Int64? guestScore,
    $core.String? guestMvpName,
    $core.String? guestMvpIcon,
    $core.int? guestMvpUid,
    $fixnum.Int64? deadline,
  }) {
    final _result = create();
    if (mainRid != null) {
      _result.mainRid = mainRid;
    }
    if (mainIcon != null) {
      _result.mainIcon = mainIcon;
    }
    if (mainName != null) {
      _result.mainName = mainName;
    }
    if (mainScore != null) {
      _result.mainScore = mainScore;
    }
    if (mainMvpName != null) {
      _result.mainMvpName = mainMvpName;
    }
    if (mainMvpIcon != null) {
      _result.mainMvpIcon = mainMvpIcon;
    }
    if (mainMvpUid != null) {
      _result.mainMvpUid = mainMvpUid;
    }
    if (guestRid != null) {
      _result.guestRid = guestRid;
    }
    if (guestIcon != null) {
      _result.guestIcon = guestIcon;
    }
    if (guestName != null) {
      _result.guestName = guestName;
    }
    if (guestScore != null) {
      _result.guestScore = guestScore;
    }
    if (guestMvpName != null) {
      _result.guestMvpName = guestMvpName;
    }
    if (guestMvpIcon != null) {
      _result.guestMvpIcon = guestMvpIcon;
    }
    if (guestMvpUid != null) {
      _result.guestMvpUid = guestMvpUid;
    }
    if (deadline != null) {
      _result.deadline = deadline;
    }
    return _result;
  }
  factory RoomPkStart.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomPkStart.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomPkStart clone() => RoomPkStart()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomPkStart copyWith(void Function(RoomPkStart) updates) =>
      super.copyWith((message) => updates(message as RoomPkStart))
          as RoomPkStart; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomPkStart create() => RoomPkStart._();
  RoomPkStart createEmptyInstance() => create();
  static $pb.PbList<RoomPkStart> createRepeated() => $pb.PbList<RoomPkStart>();
  @$core.pragma('dart2js:noInline')
  static RoomPkStart getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomPkStart>(create);
  static RoomPkStart? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get mainRid => $_getIZ(0);
  @$pb.TagNumber(1)
  set mainRid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMainRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearMainRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mainIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set mainIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMainIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearMainIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mainName => $_getSZ(2);
  @$pb.TagNumber(3)
  set mainName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMainName() => $_has(2);
  @$pb.TagNumber(3)
  void clearMainName() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get mainScore => $_getI64(3);
  @$pb.TagNumber(4)
  set mainScore($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMainScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearMainScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get mainMvpName => $_getSZ(4);
  @$pb.TagNumber(5)
  set mainMvpName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMainMvpName() => $_has(4);
  @$pb.TagNumber(5)
  void clearMainMvpName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get mainMvpIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set mainMvpIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMainMvpIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearMainMvpIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get mainMvpUid => $_getIZ(6);
  @$pb.TagNumber(7)
  set mainMvpUid($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMainMvpUid() => $_has(6);
  @$pb.TagNumber(7)
  void clearMainMvpUid() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get guestRid => $_getIZ(7);
  @$pb.TagNumber(8)
  set guestRid($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGuestRid() => $_has(7);
  @$pb.TagNumber(8)
  void clearGuestRid() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get guestIcon => $_getSZ(8);
  @$pb.TagNumber(9)
  set guestIcon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGuestIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearGuestIcon() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get guestName => $_getSZ(9);
  @$pb.TagNumber(10)
  set guestName($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasGuestName() => $_has(9);
  @$pb.TagNumber(10)
  void clearGuestName() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get guestScore => $_getI64(10);
  @$pb.TagNumber(11)
  set guestScore($fixnum.Int64 v) {
    $_setInt64(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasGuestScore() => $_has(10);
  @$pb.TagNumber(11)
  void clearGuestScore() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get guestMvpName => $_getSZ(11);
  @$pb.TagNumber(12)
  set guestMvpName($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasGuestMvpName() => $_has(11);
  @$pb.TagNumber(12)
  void clearGuestMvpName() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get guestMvpIcon => $_getSZ(12);
  @$pb.TagNumber(13)
  set guestMvpIcon($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasGuestMvpIcon() => $_has(12);
  @$pb.TagNumber(13)
  void clearGuestMvpIcon() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get guestMvpUid => $_getIZ(13);
  @$pb.TagNumber(14)
  set guestMvpUid($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasGuestMvpUid() => $_has(13);
  @$pb.TagNumber(14)
  void clearGuestMvpUid() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get deadline => $_getI64(14);
  @$pb.TagNumber(15)
  set deadline($fixnum.Int64 v) {
    $_setInt64(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasDeadline() => $_has(14);
  @$pb.TagNumber(15)
  void clearDeadline() => clearField(15);
}

class RoomPkChanged extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomPkChanged',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainRid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainIcon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainName')
    ..a<$fixnum.Int64>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainScore',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainMvpName')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainMvpIcon')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainMvpUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestRid',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestIcon')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestName')
    ..a<$fixnum.Int64>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestScore',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestMvpName')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestMvpIcon')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestMvpUid',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadline',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  RoomPkChanged._() : super();
  factory RoomPkChanged({
    $core.int? mainRid,
    $core.String? mainIcon,
    $core.String? mainName,
    $fixnum.Int64? mainScore,
    $core.String? mainMvpName,
    $core.String? mainMvpIcon,
    $core.int? mainMvpUid,
    $core.int? guestRid,
    $core.String? guestIcon,
    $core.String? guestName,
    $fixnum.Int64? guestScore,
    $core.String? guestMvpName,
    $core.String? guestMvpIcon,
    $core.int? guestMvpUid,
    $fixnum.Int64? deadline,
  }) {
    final _result = create();
    if (mainRid != null) {
      _result.mainRid = mainRid;
    }
    if (mainIcon != null) {
      _result.mainIcon = mainIcon;
    }
    if (mainName != null) {
      _result.mainName = mainName;
    }
    if (mainScore != null) {
      _result.mainScore = mainScore;
    }
    if (mainMvpName != null) {
      _result.mainMvpName = mainMvpName;
    }
    if (mainMvpIcon != null) {
      _result.mainMvpIcon = mainMvpIcon;
    }
    if (mainMvpUid != null) {
      _result.mainMvpUid = mainMvpUid;
    }
    if (guestRid != null) {
      _result.guestRid = guestRid;
    }
    if (guestIcon != null) {
      _result.guestIcon = guestIcon;
    }
    if (guestName != null) {
      _result.guestName = guestName;
    }
    if (guestScore != null) {
      _result.guestScore = guestScore;
    }
    if (guestMvpName != null) {
      _result.guestMvpName = guestMvpName;
    }
    if (guestMvpIcon != null) {
      _result.guestMvpIcon = guestMvpIcon;
    }
    if (guestMvpUid != null) {
      _result.guestMvpUid = guestMvpUid;
    }
    if (deadline != null) {
      _result.deadline = deadline;
    }
    return _result;
  }
  factory RoomPkChanged.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomPkChanged.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomPkChanged clone() => RoomPkChanged()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomPkChanged copyWith(void Function(RoomPkChanged) updates) =>
      super.copyWith((message) => updates(message as RoomPkChanged))
          as RoomPkChanged; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomPkChanged create() => RoomPkChanged._();
  RoomPkChanged createEmptyInstance() => create();
  static $pb.PbList<RoomPkChanged> createRepeated() =>
      $pb.PbList<RoomPkChanged>();
  @$core.pragma('dart2js:noInline')
  static RoomPkChanged getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomPkChanged>(create);
  static RoomPkChanged? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get mainRid => $_getIZ(0);
  @$pb.TagNumber(1)
  set mainRid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMainRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearMainRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mainIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set mainIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMainIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearMainIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mainName => $_getSZ(2);
  @$pb.TagNumber(3)
  set mainName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMainName() => $_has(2);
  @$pb.TagNumber(3)
  void clearMainName() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get mainScore => $_getI64(3);
  @$pb.TagNumber(4)
  set mainScore($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMainScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearMainScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get mainMvpName => $_getSZ(4);
  @$pb.TagNumber(5)
  set mainMvpName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMainMvpName() => $_has(4);
  @$pb.TagNumber(5)
  void clearMainMvpName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get mainMvpIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set mainMvpIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMainMvpIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearMainMvpIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get mainMvpUid => $_getIZ(6);
  @$pb.TagNumber(7)
  set mainMvpUid($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMainMvpUid() => $_has(6);
  @$pb.TagNumber(7)
  void clearMainMvpUid() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get guestRid => $_getIZ(7);
  @$pb.TagNumber(8)
  set guestRid($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGuestRid() => $_has(7);
  @$pb.TagNumber(8)
  void clearGuestRid() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get guestIcon => $_getSZ(8);
  @$pb.TagNumber(9)
  set guestIcon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGuestIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearGuestIcon() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get guestName => $_getSZ(9);
  @$pb.TagNumber(10)
  set guestName($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasGuestName() => $_has(9);
  @$pb.TagNumber(10)
  void clearGuestName() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get guestScore => $_getI64(10);
  @$pb.TagNumber(11)
  set guestScore($fixnum.Int64 v) {
    $_setInt64(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasGuestScore() => $_has(10);
  @$pb.TagNumber(11)
  void clearGuestScore() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get guestMvpName => $_getSZ(11);
  @$pb.TagNumber(12)
  set guestMvpName($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasGuestMvpName() => $_has(11);
  @$pb.TagNumber(12)
  void clearGuestMvpName() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get guestMvpIcon => $_getSZ(12);
  @$pb.TagNumber(13)
  set guestMvpIcon($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasGuestMvpIcon() => $_has(12);
  @$pb.TagNumber(13)
  void clearGuestMvpIcon() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get guestMvpUid => $_getIZ(13);
  @$pb.TagNumber(14)
  set guestMvpUid($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasGuestMvpUid() => $_has(13);
  @$pb.TagNumber(14)
  void clearGuestMvpUid() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get deadline => $_getI64(14);
  @$pb.TagNumber(15)
  set deadline($fixnum.Int64 v) {
    $_setInt64(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasDeadline() => $_has(14);
  @$pb.TagNumber(15)
  void clearDeadline() => clearField(15);
}

class PkData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PkData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainRid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainIcon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainName')
    ..a<$fixnum.Int64>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainScore',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainMvpName')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainMvpIcon')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainMvpUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestRid',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestIcon')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestName')
    ..a<$fixnum.Int64>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestScore',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestMvpName')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestMvpIcon')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestMvpUid',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadline',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  PkData._() : super();
  factory PkData({
    $core.int? mainRid,
    $core.String? mainIcon,
    $core.String? mainName,
    $fixnum.Int64? mainScore,
    $core.String? mainMvpName,
    $core.String? mainMvpIcon,
    $core.int? mainMvpUid,
    $core.int? guestRid,
    $core.String? guestIcon,
    $core.String? guestName,
    $fixnum.Int64? guestScore,
    $core.String? guestMvpName,
    $core.String? guestMvpIcon,
    $core.int? guestMvpUid,
    $fixnum.Int64? deadline,
  }) {
    final _result = create();
    if (mainRid != null) {
      _result.mainRid = mainRid;
    }
    if (mainIcon != null) {
      _result.mainIcon = mainIcon;
    }
    if (mainName != null) {
      _result.mainName = mainName;
    }
    if (mainScore != null) {
      _result.mainScore = mainScore;
    }
    if (mainMvpName != null) {
      _result.mainMvpName = mainMvpName;
    }
    if (mainMvpIcon != null) {
      _result.mainMvpIcon = mainMvpIcon;
    }
    if (mainMvpUid != null) {
      _result.mainMvpUid = mainMvpUid;
    }
    if (guestRid != null) {
      _result.guestRid = guestRid;
    }
    if (guestIcon != null) {
      _result.guestIcon = guestIcon;
    }
    if (guestName != null) {
      _result.guestName = guestName;
    }
    if (guestScore != null) {
      _result.guestScore = guestScore;
    }
    if (guestMvpName != null) {
      _result.guestMvpName = guestMvpName;
    }
    if (guestMvpIcon != null) {
      _result.guestMvpIcon = guestMvpIcon;
    }
    if (guestMvpUid != null) {
      _result.guestMvpUid = guestMvpUid;
    }
    if (deadline != null) {
      _result.deadline = deadline;
    }
    return _result;
  }
  factory PkData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PkData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PkData clone() => PkData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PkData copyWith(void Function(PkData) updates) =>
      super.copyWith((message) => updates(message as PkData))
          as PkData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PkData create() => PkData._();
  PkData createEmptyInstance() => create();
  static $pb.PbList<PkData> createRepeated() => $pb.PbList<PkData>();
  @$core.pragma('dart2js:noInline')
  static PkData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PkData>(create);
  static PkData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get mainRid => $_getIZ(0);
  @$pb.TagNumber(1)
  set mainRid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMainRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearMainRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mainIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set mainIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMainIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearMainIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mainName => $_getSZ(2);
  @$pb.TagNumber(3)
  set mainName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMainName() => $_has(2);
  @$pb.TagNumber(3)
  void clearMainName() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get mainScore => $_getI64(3);
  @$pb.TagNumber(4)
  set mainScore($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMainScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearMainScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get mainMvpName => $_getSZ(4);
  @$pb.TagNumber(5)
  set mainMvpName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMainMvpName() => $_has(4);
  @$pb.TagNumber(5)
  void clearMainMvpName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get mainMvpIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set mainMvpIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMainMvpIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearMainMvpIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get mainMvpUid => $_getIZ(6);
  @$pb.TagNumber(7)
  set mainMvpUid($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMainMvpUid() => $_has(6);
  @$pb.TagNumber(7)
  void clearMainMvpUid() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get guestRid => $_getIZ(7);
  @$pb.TagNumber(8)
  set guestRid($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGuestRid() => $_has(7);
  @$pb.TagNumber(8)
  void clearGuestRid() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get guestIcon => $_getSZ(8);
  @$pb.TagNumber(9)
  set guestIcon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGuestIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearGuestIcon() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get guestName => $_getSZ(9);
  @$pb.TagNumber(10)
  set guestName($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasGuestName() => $_has(9);
  @$pb.TagNumber(10)
  void clearGuestName() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get guestScore => $_getI64(10);
  @$pb.TagNumber(11)
  set guestScore($fixnum.Int64 v) {
    $_setInt64(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasGuestScore() => $_has(10);
  @$pb.TagNumber(11)
  void clearGuestScore() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get guestMvpName => $_getSZ(11);
  @$pb.TagNumber(12)
  set guestMvpName($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasGuestMvpName() => $_has(11);
  @$pb.TagNumber(12)
  void clearGuestMvpName() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get guestMvpIcon => $_getSZ(12);
  @$pb.TagNumber(13)
  set guestMvpIcon($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasGuestMvpIcon() => $_has(12);
  @$pb.TagNumber(13)
  void clearGuestMvpIcon() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get guestMvpUid => $_getIZ(13);
  @$pb.TagNumber(14)
  set guestMvpUid($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasGuestMvpUid() => $_has(13);
  @$pb.TagNumber(14)
  void clearGuestMvpUid() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get deadline => $_getI64(14);
  @$pb.TagNumber(15)
  set deadline($fixnum.Int64 v) {
    $_setInt64(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasDeadline() => $_has(14);
  @$pb.TagNumber(15)
  void clearDeadline() => clearField(15);
}
