///
//  Generated code. Do not modify.
//  source: parking.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'parking.pbenum.dart';

export 'parking.pbenum.dart';

class ApiParkingLotResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingLotResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Success',
        protoName: 'Success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Message',
        protoName: 'Message')
    ..aOM<ParkingLotData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ParkingLotData.create)
    ..hasRequiredFields = false;

  ApiParkingLotResponse._() : super();
  factory ApiParkingLotResponse({
    $core.bool? success,
    $core.String? message,
    ParkingLotData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingLotResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingLotResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingLotResponse clone() =>
      ApiParkingLotResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingLotResponse copyWith(
          void Function(ApiParkingLotResponse) updates) =>
      super.copyWith((message) => updates(message as ApiParkingLotResponse))
          as ApiParkingLotResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingLotResponse create() => ApiParkingLotResponse._();
  ApiParkingLotResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingLotResponse> createRepeated() =>
      $pb.PbList<ApiParkingLotResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingLotResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingLotResponse>(create);
  static ApiParkingLotResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ParkingLotData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ParkingLotData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ParkingLotData ensureData() => $_ensure(2);
}

class ParkingLotData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingLotData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bestPosition',
        $pb.PbFieldType.O3,
        protoName: 'bestPosition')
    ..pc<ParkingLotPosition>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'positions',
        $pb.PbFieldType.PM,
        subBuilder: ParkingLotPosition.create)
    ..hasRequiredFields = false;

  ParkingLotData._() : super();
  factory ParkingLotData({
    $core.int? bestPosition,
    $core.Iterable<ParkingLotPosition>? positions,
  }) {
    final _result = create();
    if (bestPosition != null) {
      _result.bestPosition = bestPosition;
    }
    if (positions != null) {
      _result.positions.addAll(positions);
    }
    return _result;
  }
  factory ParkingLotData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingLotData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingLotData clone() => ParkingLotData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingLotData copyWith(void Function(ParkingLotData) updates) =>
      super.copyWith((message) => updates(message as ParkingLotData))
          as ParkingLotData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingLotData create() => ParkingLotData._();
  ParkingLotData createEmptyInstance() => create();
  static $pb.PbList<ParkingLotData> createRepeated() =>
      $pb.PbList<ParkingLotData>();
  @$core.pragma('dart2js:noInline')
  static ParkingLotData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingLotData>(create);
  static ParkingLotData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get bestPosition => $_getIZ(0);
  @$pb.TagNumber(1)
  set bestPosition($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBestPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearBestPosition() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ParkingLotPosition> get positions => $_getList(1);
}

class ParkingLotPosition extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingLotPosition',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lot',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerName')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerIcon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'parkingDuration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ticket',
        $pb.PbFieldType.OU3)
    ..aOM<ParkingLotCarProtection>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'protection',
        subBuilder: ParkingLotCarProtection.create)
    ..hasRequiredFields = false;

  ParkingLotPosition._() : super();
  factory ParkingLotPosition({
    $core.int? lot,
    $core.int? position,
    $core.int? ownerUid,
    $core.String? ownerName,
    $core.String? ownerIcon,
    $core.String? image,
    $core.int? level,
    $core.int? parkingDuration,
    $core.int? ticket,
    ParkingLotCarProtection? protection,
  }) {
    final _result = create();
    if (lot != null) {
      _result.lot = lot;
    }
    if (position != null) {
      _result.position = position;
    }
    if (ownerUid != null) {
      _result.ownerUid = ownerUid;
    }
    if (ownerName != null) {
      _result.ownerName = ownerName;
    }
    if (ownerIcon != null) {
      _result.ownerIcon = ownerIcon;
    }
    if (image != null) {
      _result.image = image;
    }
    if (level != null) {
      _result.level = level;
    }
    if (parkingDuration != null) {
      _result.parkingDuration = parkingDuration;
    }
    if (ticket != null) {
      _result.ticket = ticket;
    }
    if (protection != null) {
      _result.protection = protection;
    }
    return _result;
  }
  factory ParkingLotPosition.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingLotPosition.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingLotPosition clone() => ParkingLotPosition()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingLotPosition copyWith(void Function(ParkingLotPosition) updates) =>
      super.copyWith((message) => updates(message as ParkingLotPosition))
          as ParkingLotPosition; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingLotPosition create() => ParkingLotPosition._();
  ParkingLotPosition createEmptyInstance() => create();
  static $pb.PbList<ParkingLotPosition> createRepeated() =>
      $pb.PbList<ParkingLotPosition>();
  @$core.pragma('dart2js:noInline')
  static ParkingLotPosition getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingLotPosition>(create);
  static ParkingLotPosition? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lot => $_getIZ(0);
  @$pb.TagNumber(1)
  set lot($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLot() => $_has(0);
  @$pb.TagNumber(1)
  void clearLot() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get position => $_getIZ(1);
  @$pb.TagNumber(2)
  set position($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get ownerUid => $_getIZ(2);
  @$pb.TagNumber(3)
  set ownerUid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOwnerUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearOwnerUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get ownerName => $_getSZ(3);
  @$pb.TagNumber(4)
  set ownerName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOwnerName() => $_has(3);
  @$pb.TagNumber(4)
  void clearOwnerName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get ownerIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set ownerIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOwnerIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearOwnerIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get image => $_getSZ(5);
  @$pb.TagNumber(6)
  set image($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasImage() => $_has(5);
  @$pb.TagNumber(6)
  void clearImage() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get level => $_getIZ(6);
  @$pb.TagNumber(7)
  set level($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearLevel() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get parkingDuration => $_getIZ(7);
  @$pb.TagNumber(8)
  set parkingDuration($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasParkingDuration() => $_has(7);
  @$pb.TagNumber(8)
  void clearParkingDuration() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get ticket => $_getIZ(8);
  @$pb.TagNumber(9)
  set ticket($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTicket() => $_has(8);
  @$pb.TagNumber(9)
  void clearTicket() => clearField(9);

  @$pb.TagNumber(10)
  ParkingLotCarProtection get protection => $_getN(9);
  @$pb.TagNumber(10)
  set protection(ParkingLotCarProtection v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasProtection() => $_has(9);
  @$pb.TagNumber(10)
  void clearProtection() => clearField(10);
  @$pb.TagNumber(10)
  ParkingLotCarProtection ensureProtection() => $_ensure(9);
}

class ApiParkingGarageResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingGarageResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Success',
        protoName: 'Success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Message',
        protoName: 'Message')
    ..aOM<ParkingGarageData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ParkingGarageData.create)
    ..hasRequiredFields = false;

  ApiParkingGarageResponse._() : super();
  factory ApiParkingGarageResponse({
    $core.bool? success,
    $core.String? message,
    ParkingGarageData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingGarageResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingGarageResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingGarageResponse clone() =>
      ApiParkingGarageResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingGarageResponse copyWith(
          void Function(ApiParkingGarageResponse) updates) =>
      super.copyWith((message) => updates(message as ApiParkingGarageResponse))
          as ApiParkingGarageResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingGarageResponse create() => ApiParkingGarageResponse._();
  ApiParkingGarageResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingGarageResponse> createRepeated() =>
      $pb.PbList<ApiParkingGarageResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingGarageResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingGarageResponse>(create);
  static ApiParkingGarageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ParkingGarageData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ParkingGarageData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ParkingGarageData ensureData() => $_ensure(2);
}

class ParkingGarageData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingGarageData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalEnergy',
        protoName: 'totalEnergy')
    ..pc<ParkingGarageCar>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'temporary',
        $pb.PbFieldType.PM,
        subBuilder: ParkingGarageCar.create)
    ..pc<ParkingGarageCar>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'permanent',
        $pb.PbFieldType.PM,
        subBuilder: ParkingGarageCar.create)
    ..hasRequiredFields = false;

  ParkingGarageData._() : super();
  factory ParkingGarageData({
    $fixnum.Int64? totalEnergy,
    $core.Iterable<ParkingGarageCar>? temporary,
    $core.Iterable<ParkingGarageCar>? permanent,
  }) {
    final _result = create();
    if (totalEnergy != null) {
      _result.totalEnergy = totalEnergy;
    }
    if (temporary != null) {
      _result.temporary.addAll(temporary);
    }
    if (permanent != null) {
      _result.permanent.addAll(permanent);
    }
    return _result;
  }
  factory ParkingGarageData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingGarageData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingGarageData clone() => ParkingGarageData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingGarageData copyWith(void Function(ParkingGarageData) updates) =>
      super.copyWith((message) => updates(message as ParkingGarageData))
          as ParkingGarageData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingGarageData create() => ParkingGarageData._();
  ParkingGarageData createEmptyInstance() => create();
  static $pb.PbList<ParkingGarageData> createRepeated() =>
      $pb.PbList<ParkingGarageData>();
  @$core.pragma('dart2js:noInline')
  static ParkingGarageData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingGarageData>(create);
  static ParkingGarageData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalEnergy => $_getI64(0);
  @$pb.TagNumber(1)
  set totalEnergy($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTotalEnergy() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalEnergy() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ParkingGarageCar> get temporary => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<ParkingGarageCar> get permanent => $_getList(2);
}

class ParkingGarageCar extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingGarageCar',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lot',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'UCid',
        $pb.PbFieldType.OU3,
        protoName: 'UCid')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epm',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'parkingDuration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'period',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expiredDuration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalEnergyProduct',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numPaperStick',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'enterEffectEnable',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'upgradeAwardEnable',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'freeParkingDuration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numCar',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isSpu',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dynamicIcon',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ParkingGarageCar._() : super();
  factory ParkingGarageCar({
    $core.int? lot,
    $core.int? cid,
    $core.int? uCid,
    $core.String? image,
    $core.String? name,
    $core.int? level,
    $core.int? epm,
    $core.int? parkingDuration,
    $core.int? state,
    $core.int? period,
    $core.int? expiredDuration,
    $core.int? rid,
    $fixnum.Int64? totalEnergyProduct,
    $core.int? numPaperStick,
    $core.int? enterEffectEnable,
    $core.int? upgradeAwardEnable,
    $core.int? freeParkingDuration,
    $core.int? numCar,
    $core.int? isSpu,
    $core.int? dynamicIcon,
  }) {
    final _result = create();
    if (lot != null) {
      _result.lot = lot;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (uCid != null) {
      _result.uCid = uCid;
    }
    if (image != null) {
      _result.image = image;
    }
    if (name != null) {
      _result.name = name;
    }
    if (level != null) {
      _result.level = level;
    }
    if (epm != null) {
      _result.epm = epm;
    }
    if (parkingDuration != null) {
      _result.parkingDuration = parkingDuration;
    }
    if (state != null) {
      _result.state = state;
    }
    if (period != null) {
      _result.period = period;
    }
    if (expiredDuration != null) {
      _result.expiredDuration = expiredDuration;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (totalEnergyProduct != null) {
      _result.totalEnergyProduct = totalEnergyProduct;
    }
    if (numPaperStick != null) {
      _result.numPaperStick = numPaperStick;
    }
    if (enterEffectEnable != null) {
      _result.enterEffectEnable = enterEffectEnable;
    }
    if (upgradeAwardEnable != null) {
      _result.upgradeAwardEnable = upgradeAwardEnable;
    }
    if (freeParkingDuration != null) {
      _result.freeParkingDuration = freeParkingDuration;
    }
    if (numCar != null) {
      _result.numCar = numCar;
    }
    if (isSpu != null) {
      _result.isSpu = isSpu;
    }
    if (dynamicIcon != null) {
      _result.dynamicIcon = dynamicIcon;
    }
    return _result;
  }
  factory ParkingGarageCar.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingGarageCar.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingGarageCar clone() => ParkingGarageCar()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingGarageCar copyWith(void Function(ParkingGarageCar) updates) =>
      super.copyWith((message) => updates(message as ParkingGarageCar))
          as ParkingGarageCar; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingGarageCar create() => ParkingGarageCar._();
  ParkingGarageCar createEmptyInstance() => create();
  static $pb.PbList<ParkingGarageCar> createRepeated() =>
      $pb.PbList<ParkingGarageCar>();
  @$core.pragma('dart2js:noInline')
  static ParkingGarageCar getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingGarageCar>(create);
  static ParkingGarageCar? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lot => $_getIZ(0);
  @$pb.TagNumber(1)
  set lot($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLot() => $_has(0);
  @$pb.TagNumber(1)
  void clearLot() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get cid => $_getIZ(1);
  @$pb.TagNumber(2)
  set cid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get uCid => $_getIZ(2);
  @$pb.TagNumber(3)
  set uCid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUCid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUCid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get image => $_getSZ(3);
  @$pb.TagNumber(4)
  set image($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearImage() => clearField(4);

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

  @$pb.TagNumber(6)
  $core.int get level => $_getIZ(5);
  @$pb.TagNumber(6)
  set level($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearLevel() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get epm => $_getIZ(6);
  @$pb.TagNumber(7)
  set epm($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasEpm() => $_has(6);
  @$pb.TagNumber(7)
  void clearEpm() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get parkingDuration => $_getIZ(7);
  @$pb.TagNumber(8)
  set parkingDuration($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasParkingDuration() => $_has(7);
  @$pb.TagNumber(8)
  void clearParkingDuration() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get state => $_getIZ(8);
  @$pb.TagNumber(9)
  set state($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasState() => $_has(8);
  @$pb.TagNumber(9)
  void clearState() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get period => $_getIZ(9);
  @$pb.TagNumber(10)
  set period($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPeriod() => $_has(9);
  @$pb.TagNumber(10)
  void clearPeriod() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get expiredDuration => $_getIZ(10);
  @$pb.TagNumber(11)
  set expiredDuration($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasExpiredDuration() => $_has(10);
  @$pb.TagNumber(11)
  void clearExpiredDuration() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get rid => $_getIZ(11);
  @$pb.TagNumber(12)
  set rid($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasRid() => $_has(11);
  @$pb.TagNumber(12)
  void clearRid() => clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get totalEnergyProduct => $_getI64(12);
  @$pb.TagNumber(13)
  set totalEnergyProduct($fixnum.Int64 v) {
    $_setInt64(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasTotalEnergyProduct() => $_has(12);
  @$pb.TagNumber(13)
  void clearTotalEnergyProduct() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get numPaperStick => $_getIZ(13);
  @$pb.TagNumber(14)
  set numPaperStick($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasNumPaperStick() => $_has(13);
  @$pb.TagNumber(14)
  void clearNumPaperStick() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get enterEffectEnable => $_getIZ(14);
  @$pb.TagNumber(15)
  set enterEffectEnable($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasEnterEffectEnable() => $_has(14);
  @$pb.TagNumber(15)
  void clearEnterEffectEnable() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get upgradeAwardEnable => $_getIZ(15);
  @$pb.TagNumber(16)
  set upgradeAwardEnable($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasUpgradeAwardEnable() => $_has(15);
  @$pb.TagNumber(16)
  void clearUpgradeAwardEnable() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get freeParkingDuration => $_getIZ(16);
  @$pb.TagNumber(17)
  set freeParkingDuration($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasFreeParkingDuration() => $_has(16);
  @$pb.TagNumber(17)
  void clearFreeParkingDuration() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get numCar => $_getIZ(17);
  @$pb.TagNumber(18)
  set numCar($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasNumCar() => $_has(17);
  @$pb.TagNumber(18)
  void clearNumCar() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get isSpu => $_getIZ(18);
  @$pb.TagNumber(19)
  set isSpu($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasIsSpu() => $_has(18);
  @$pb.TagNumber(19)
  void clearIsSpu() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get dynamicIcon => $_getIZ(19);
  @$pb.TagNumber(20)
  set dynamicIcon($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasDynamicIcon() => $_has(19);
  @$pb.TagNumber(20)
  void clearDynamicIcon() => clearField(20);
}

class ApiParkingCarResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingCarResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Success',
        protoName: 'Success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Message',
        protoName: 'Message')
    ..aOM<ParkingLotCar>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ParkingLotCar.create)
    ..hasRequiredFields = false;

  ApiParkingCarResponse._() : super();
  factory ApiParkingCarResponse({
    $core.bool? success,
    $core.String? message,
    ParkingLotCar? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingCarResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingCarResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingCarResponse clone() =>
      ApiParkingCarResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingCarResponse copyWith(
          void Function(ApiParkingCarResponse) updates) =>
      super.copyWith((message) => updates(message as ApiParkingCarResponse))
          as ApiParkingCarResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingCarResponse create() => ApiParkingCarResponse._();
  ApiParkingCarResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingCarResponse> createRepeated() =>
      $pb.PbList<ApiParkingCarResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingCarResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingCarResponse>(create);
  static ApiParkingCarResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ParkingLotCar get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ParkingLotCar v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ParkingLotCar ensureData() => $_ensure(2);
}

class ParkingLotCar extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingLotCar',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lot',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epm',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'parkingDuration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerName')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerIcon')
    ..a<$fixnum.Int64>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'estimateEnergy',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numPaperStick',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'freeParkingDuration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ticket',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'estimateEnergySteal',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numStickEnable',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numProtectEnable',
        $pb.PbFieldType.OU3)
    ..aOM<ParkingLotCarProtection>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'protection',
        subBuilder: ParkingLotCarProtection.create)
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalStickPrevent',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'estimateEnergyLimit',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ParkingLotCar._() : super();
  factory ParkingLotCar({
    $core.int? lot,
    $core.int? position,
    $core.int? rid,
    $core.int? cid,
    $core.String? name,
    $core.String? image,
    $core.int? level,
    $core.String? desc,
    $core.int? epm,
    $core.int? parkingDuration,
    $core.int? ownerUid,
    $core.String? ownerName,
    $core.String? ownerIcon,
    $fixnum.Int64? estimateEnergy,
    $core.int? numPaperStick,
    $core.int? freeParkingDuration,
    $core.int? ticket,
    $core.int? estimateEnergySteal,
    $core.int? numStickEnable,
    $core.int? numProtectEnable,
    ParkingLotCarProtection? protection,
    $core.int? totalStickPrevent,
    $core.int? estimateEnergyLimit,
  }) {
    final _result = create();
    if (lot != null) {
      _result.lot = lot;
    }
    if (position != null) {
      _result.position = position;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    if (level != null) {
      _result.level = level;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (epm != null) {
      _result.epm = epm;
    }
    if (parkingDuration != null) {
      _result.parkingDuration = parkingDuration;
    }
    if (ownerUid != null) {
      _result.ownerUid = ownerUid;
    }
    if (ownerName != null) {
      _result.ownerName = ownerName;
    }
    if (ownerIcon != null) {
      _result.ownerIcon = ownerIcon;
    }
    if (estimateEnergy != null) {
      _result.estimateEnergy = estimateEnergy;
    }
    if (numPaperStick != null) {
      _result.numPaperStick = numPaperStick;
    }
    if (freeParkingDuration != null) {
      _result.freeParkingDuration = freeParkingDuration;
    }
    if (ticket != null) {
      _result.ticket = ticket;
    }
    if (estimateEnergySteal != null) {
      _result.estimateEnergySteal = estimateEnergySteal;
    }
    if (numStickEnable != null) {
      _result.numStickEnable = numStickEnable;
    }
    if (numProtectEnable != null) {
      _result.numProtectEnable = numProtectEnable;
    }
    if (protection != null) {
      _result.protection = protection;
    }
    if (totalStickPrevent != null) {
      _result.totalStickPrevent = totalStickPrevent;
    }
    if (estimateEnergyLimit != null) {
      _result.estimateEnergyLimit = estimateEnergyLimit;
    }
    return _result;
  }
  factory ParkingLotCar.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingLotCar.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingLotCar clone() => ParkingLotCar()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingLotCar copyWith(void Function(ParkingLotCar) updates) =>
      super.copyWith((message) => updates(message as ParkingLotCar))
          as ParkingLotCar; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingLotCar create() => ParkingLotCar._();
  ParkingLotCar createEmptyInstance() => create();
  static $pb.PbList<ParkingLotCar> createRepeated() =>
      $pb.PbList<ParkingLotCar>();
  @$core.pragma('dart2js:noInline')
  static ParkingLotCar getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingLotCar>(create);
  static ParkingLotCar? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lot => $_getIZ(0);
  @$pb.TagNumber(1)
  set lot($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLot() => $_has(0);
  @$pb.TagNumber(1)
  void clearLot() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get position => $_getIZ(1);
  @$pb.TagNumber(2)
  set position($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rid => $_getIZ(2);
  @$pb.TagNumber(3)
  set rid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get cid => $_getIZ(3);
  @$pb.TagNumber(4)
  set cid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCid() => $_has(3);
  @$pb.TagNumber(4)
  void clearCid() => clearField(4);

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

  @$pb.TagNumber(6)
  $core.String get image => $_getSZ(5);
  @$pb.TagNumber(6)
  set image($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasImage() => $_has(5);
  @$pb.TagNumber(6)
  void clearImage() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get level => $_getIZ(6);
  @$pb.TagNumber(7)
  set level($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearLevel() => clearField(7);

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
  $core.int get epm => $_getIZ(8);
  @$pb.TagNumber(9)
  set epm($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasEpm() => $_has(8);
  @$pb.TagNumber(9)
  void clearEpm() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get parkingDuration => $_getIZ(9);
  @$pb.TagNumber(10)
  set parkingDuration($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasParkingDuration() => $_has(9);
  @$pb.TagNumber(10)
  void clearParkingDuration() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get ownerUid => $_getIZ(10);
  @$pb.TagNumber(11)
  set ownerUid($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasOwnerUid() => $_has(10);
  @$pb.TagNumber(11)
  void clearOwnerUid() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get ownerName => $_getSZ(11);
  @$pb.TagNumber(12)
  set ownerName($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasOwnerName() => $_has(11);
  @$pb.TagNumber(12)
  void clearOwnerName() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get ownerIcon => $_getSZ(12);
  @$pb.TagNumber(13)
  set ownerIcon($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasOwnerIcon() => $_has(12);
  @$pb.TagNumber(13)
  void clearOwnerIcon() => clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get estimateEnergy => $_getI64(13);
  @$pb.TagNumber(14)
  set estimateEnergy($fixnum.Int64 v) {
    $_setInt64(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasEstimateEnergy() => $_has(13);
  @$pb.TagNumber(14)
  void clearEstimateEnergy() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get numPaperStick => $_getIZ(14);
  @$pb.TagNumber(15)
  set numPaperStick($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasNumPaperStick() => $_has(14);
  @$pb.TagNumber(15)
  void clearNumPaperStick() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get freeParkingDuration => $_getIZ(15);
  @$pb.TagNumber(16)
  set freeParkingDuration($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasFreeParkingDuration() => $_has(15);
  @$pb.TagNumber(16)
  void clearFreeParkingDuration() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get ticket => $_getIZ(16);
  @$pb.TagNumber(17)
  set ticket($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasTicket() => $_has(16);
  @$pb.TagNumber(17)
  void clearTicket() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get estimateEnergySteal => $_getIZ(17);
  @$pb.TagNumber(18)
  set estimateEnergySteal($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasEstimateEnergySteal() => $_has(17);
  @$pb.TagNumber(18)
  void clearEstimateEnergySteal() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get numStickEnable => $_getIZ(18);
  @$pb.TagNumber(19)
  set numStickEnable($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasNumStickEnable() => $_has(18);
  @$pb.TagNumber(19)
  void clearNumStickEnable() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get numProtectEnable => $_getIZ(19);
  @$pb.TagNumber(20)
  set numProtectEnable($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasNumProtectEnable() => $_has(19);
  @$pb.TagNumber(20)
  void clearNumProtectEnable() => clearField(20);

  @$pb.TagNumber(21)
  ParkingLotCarProtection get protection => $_getN(20);
  @$pb.TagNumber(21)
  set protection(ParkingLotCarProtection v) {
    setField(21, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasProtection() => $_has(20);
  @$pb.TagNumber(21)
  void clearProtection() => clearField(21);
  @$pb.TagNumber(21)
  ParkingLotCarProtection ensureProtection() => $_ensure(20);

  @$pb.TagNumber(22)
  $core.int get totalStickPrevent => $_getIZ(21);
  @$pb.TagNumber(22)
  set totalStickPrevent($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasTotalStickPrevent() => $_has(21);
  @$pb.TagNumber(22)
  void clearTotalStickPrevent() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get estimateEnergyLimit => $_getIZ(22);
  @$pb.TagNumber(23)
  set estimateEnergyLimit($core.int v) {
    $_setUnsignedInt32(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasEstimateEnergyLimit() => $_has(22);
  @$pb.TagNumber(23)
  void clearEstimateEnergyLimit() => clearField(23);
}

class ParkingLotCarProtection extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingLotCarProtection',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'protectUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'protectName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'protectIcon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'timesStickPrevent',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'timesStickTotal',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'protectionDuration',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ParkingLotCarProtection._() : super();
  factory ParkingLotCarProtection({
    $core.int? protectUid,
    $core.String? protectName,
    $core.String? protectIcon,
    $core.int? timesStickPrevent,
    $core.int? timesStickTotal,
    $core.int? protectionDuration,
  }) {
    final _result = create();
    if (protectUid != null) {
      _result.protectUid = protectUid;
    }
    if (protectName != null) {
      _result.protectName = protectName;
    }
    if (protectIcon != null) {
      _result.protectIcon = protectIcon;
    }
    if (timesStickPrevent != null) {
      _result.timesStickPrevent = timesStickPrevent;
    }
    if (timesStickTotal != null) {
      _result.timesStickTotal = timesStickTotal;
    }
    if (protectionDuration != null) {
      _result.protectionDuration = protectionDuration;
    }
    return _result;
  }
  factory ParkingLotCarProtection.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingLotCarProtection.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingLotCarProtection clone() =>
      ParkingLotCarProtection()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingLotCarProtection copyWith(
          void Function(ParkingLotCarProtection) updates) =>
      super.copyWith((message) => updates(message as ParkingLotCarProtection))
          as ParkingLotCarProtection; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingLotCarProtection create() => ParkingLotCarProtection._();
  ParkingLotCarProtection createEmptyInstance() => create();
  static $pb.PbList<ParkingLotCarProtection> createRepeated() =>
      $pb.PbList<ParkingLotCarProtection>();
  @$core.pragma('dart2js:noInline')
  static ParkingLotCarProtection getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingLotCarProtection>(create);
  static ParkingLotCarProtection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get protectUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set protectUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasProtectUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearProtectUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get protectName => $_getSZ(1);
  @$pb.TagNumber(2)
  set protectName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasProtectName() => $_has(1);
  @$pb.TagNumber(2)
  void clearProtectName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get protectIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set protectIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasProtectIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearProtectIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get timesStickPrevent => $_getIZ(3);
  @$pb.TagNumber(4)
  set timesStickPrevent($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTimesStickPrevent() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimesStickPrevent() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get timesStickTotal => $_getIZ(4);
  @$pb.TagNumber(5)
  set timesStickTotal($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTimesStickTotal() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimesStickTotal() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get protectionDuration => $_getIZ(5);
  @$pb.TagNumber(6)
  set protectionDuration($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasProtectionDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearProtectionDuration() => clearField(6);
}

class ParkingProtectBegMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingProtectBegMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lot',
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
            : 'image')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerName')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerIcon')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'charm',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tip')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'limit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numProtectEnable',
        $pb.PbFieldType.OU3)
    ..aOB(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vipGray')
    ..hasRequiredFields = false;

  ParkingProtectBegMessage._() : super();
  factory ParkingProtectBegMessage({
    $core.int? lot,
    $core.String? name,
    $core.String? image,
    $core.int? level,
    $core.int? ownerUid,
    $core.String? ownerName,
    $core.String? ownerIcon,
    $core.String? message,
    $core.int? vip,
    $core.int? charm,
    $core.String? tip,
    $core.int? limit,
    $core.int? numProtectEnable,
    $core.bool? vipGray,
  }) {
    final _result = create();
    if (lot != null) {
      _result.lot = lot;
    }
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    if (level != null) {
      _result.level = level;
    }
    if (ownerUid != null) {
      _result.ownerUid = ownerUid;
    }
    if (ownerName != null) {
      _result.ownerName = ownerName;
    }
    if (ownerIcon != null) {
      _result.ownerIcon = ownerIcon;
    }
    if (message != null) {
      _result.message = message;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (charm != null) {
      _result.charm = charm;
    }
    if (tip != null) {
      _result.tip = tip;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (numProtectEnable != null) {
      _result.numProtectEnable = numProtectEnable;
    }
    if (vipGray != null) {
      _result.vipGray = vipGray;
    }
    return _result;
  }
  factory ParkingProtectBegMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingProtectBegMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingProtectBegMessage clone() =>
      ParkingProtectBegMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingProtectBegMessage copyWith(
          void Function(ParkingProtectBegMessage) updates) =>
      super.copyWith((message) => updates(message as ParkingProtectBegMessage))
          as ParkingProtectBegMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingProtectBegMessage create() => ParkingProtectBegMessage._();
  ParkingProtectBegMessage createEmptyInstance() => create();
  static $pb.PbList<ParkingProtectBegMessage> createRepeated() =>
      $pb.PbList<ParkingProtectBegMessage>();
  @$core.pragma('dart2js:noInline')
  static ParkingProtectBegMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingProtectBegMessage>(create);
  static ParkingProtectBegMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lot => $_getIZ(0);
  @$pb.TagNumber(1)
  set lot($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLot() => $_has(0);
  @$pb.TagNumber(1)
  void clearLot() => clearField(1);

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
  $core.String get image => $_getSZ(2);
  @$pb.TagNumber(3)
  set image($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get level => $_getIZ(3);
  @$pb.TagNumber(4)
  set level($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get ownerUid => $_getIZ(4);
  @$pb.TagNumber(5)
  set ownerUid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOwnerUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearOwnerUid() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get ownerName => $_getSZ(5);
  @$pb.TagNumber(6)
  set ownerName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOwnerName() => $_has(5);
  @$pb.TagNumber(6)
  void clearOwnerName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get ownerIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set ownerIcon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOwnerIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearOwnerIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get message => $_getSZ(7);
  @$pb.TagNumber(8)
  set message($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMessage() => $_has(7);
  @$pb.TagNumber(8)
  void clearMessage() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get vip => $_getIZ(8);
  @$pb.TagNumber(9)
  set vip($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasVip() => $_has(8);
  @$pb.TagNumber(9)
  void clearVip() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get charm => $_getIZ(9);
  @$pb.TagNumber(10)
  set charm($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCharm() => $_has(9);
  @$pb.TagNumber(10)
  void clearCharm() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get tip => $_getSZ(10);
  @$pb.TagNumber(11)
  set tip($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTip() => $_has(10);
  @$pb.TagNumber(11)
  void clearTip() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get limit => $_getIZ(11);
  @$pb.TagNumber(12)
  set limit($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasLimit() => $_has(11);
  @$pb.TagNumber(12)
  void clearLimit() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get numProtectEnable => $_getIZ(12);
  @$pb.TagNumber(13)
  set numProtectEnable($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasNumProtectEnable() => $_has(12);
  @$pb.TagNumber(13)
  void clearNumProtectEnable() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get vipGray => $_getBF(13);
  @$pb.TagNumber(14)
  set vipGray($core.bool v) {
    $_setBool(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasVipGray() => $_has(13);
  @$pb.TagNumber(14)
  void clearVipGray() => clearField(14);
}

class ParkingEntranceBestLot extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingEntranceBestLot',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..hasRequiredFields = false;

  ParkingEntranceBestLot._() : super();
  factory ParkingEntranceBestLot({
    $core.int? rid,
    $core.String? icon,
    $core.String? image,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory ParkingEntranceBestLot.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingEntranceBestLot.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingEntranceBestLot clone() =>
      ParkingEntranceBestLot()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingEntranceBestLot copyWith(
          void Function(ParkingEntranceBestLot) updates) =>
      super.copyWith((message) => updates(message as ParkingEntranceBestLot))
          as ParkingEntranceBestLot; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingEntranceBestLot create() => ParkingEntranceBestLot._();
  ParkingEntranceBestLot createEmptyInstance() => create();
  static $pb.PbList<ParkingEntranceBestLot> createRepeated() =>
      $pb.PbList<ParkingEntranceBestLot>();
  @$core.pragma('dart2js:noInline')
  static ParkingEntranceBestLot getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingEntranceBestLot>(create);
  static ParkingEntranceBestLot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get image => $_getSZ(2);
  @$pb.TagNumber(3)
  set image($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);
}

class ApiParkingMVLResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingMVLResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOM<ParkingEntranceBestLot>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ParkingEntranceBestLot.create)
    ..hasRequiredFields = false;

  ApiParkingMVLResponse._() : super();
  factory ApiParkingMVLResponse({
    $core.bool? success,
    $core.String? message,
    ParkingEntranceBestLot? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingMVLResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingMVLResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingMVLResponse clone() =>
      ApiParkingMVLResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingMVLResponse copyWith(
          void Function(ApiParkingMVLResponse) updates) =>
      super.copyWith((message) => updates(message as ApiParkingMVLResponse))
          as ApiParkingMVLResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingMVLResponse create() => ApiParkingMVLResponse._();
  ApiParkingMVLResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingMVLResponse> createRepeated() =>
      $pb.PbList<ApiParkingMVLResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingMVLResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingMVLResponse>(create);
  static ApiParkingMVLResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ParkingEntranceBestLot get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ParkingEntranceBestLot v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ParkingEntranceBestLot ensureData() => $_ensure(2);
}

class UpgradeMaterial extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpgradeMaterial',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..e<UpgradeMaterialType>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OE,
        defaultOrMaker: UpgradeMaterialType.UPGRADE_MATERIAL_NONE,
        valueOf: UpgradeMaterialType.valueOf,
        enumValues: UpgradeMaterialType.values)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  UpgradeMaterial._() : super();
  factory UpgradeMaterial({
    UpgradeMaterialType? type,
    $core.int? id,
    $core.int? count,
    $core.String? icon,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (id != null) {
      _result.id = id;
    }
    if (count != null) {
      _result.count = count;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory UpgradeMaterial.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpgradeMaterial.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpgradeMaterial clone() => UpgradeMaterial()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpgradeMaterial copyWith(void Function(UpgradeMaterial) updates) =>
      super.copyWith((message) => updates(message as UpgradeMaterial))
          as UpgradeMaterial; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpgradeMaterial create() => UpgradeMaterial._();
  UpgradeMaterial createEmptyInstance() => create();
  static $pb.PbList<UpgradeMaterial> createRepeated() =>
      $pb.PbList<UpgradeMaterial>();
  @$core.pragma('dart2js:noInline')
  static UpgradeMaterial getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpgradeMaterial>(create);
  static UpgradeMaterial? _defaultInstance;

  @$pb.TagNumber(1)
  UpgradeMaterialType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(UpgradeMaterialType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);
}

class PermanentCar extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PermanentCar',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'enterEffect')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'upgradeReward')
    ..aOM<ParkingGarageCar>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'car',
        subBuilder: ParkingGarageCar.create)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'preview')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'animation')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'animationSize',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stickExtraRate',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'towedExtraRate',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'takeExtraRate',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PermanentCar._() : super();
  factory PermanentCar({
    $core.int? level,
    $core.bool? enterEffect,
    $core.bool? upgradeReward,
    ParkingGarageCar? car,
    $core.String? preview,
    $core.String? animation,
    $core.int? animationSize,
    $core.int? stickExtraRate,
    $core.int? towedExtraRate,
    $core.int? takeExtraRate,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (enterEffect != null) {
      _result.enterEffect = enterEffect;
    }
    if (upgradeReward != null) {
      _result.upgradeReward = upgradeReward;
    }
    if (car != null) {
      _result.car = car;
    }
    if (preview != null) {
      _result.preview = preview;
    }
    if (animation != null) {
      _result.animation = animation;
    }
    if (animationSize != null) {
      _result.animationSize = animationSize;
    }
    if (stickExtraRate != null) {
      _result.stickExtraRate = stickExtraRate;
    }
    if (towedExtraRate != null) {
      _result.towedExtraRate = towedExtraRate;
    }
    if (takeExtraRate != null) {
      _result.takeExtraRate = takeExtraRate;
    }
    return _result;
  }
  factory PermanentCar.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PermanentCar.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PermanentCar clone() => PermanentCar()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PermanentCar copyWith(void Function(PermanentCar) updates) =>
      super.copyWith((message) => updates(message as PermanentCar))
          as PermanentCar; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PermanentCar create() => PermanentCar._();
  PermanentCar createEmptyInstance() => create();
  static $pb.PbList<PermanentCar> createRepeated() =>
      $pb.PbList<PermanentCar>();
  @$core.pragma('dart2js:noInline')
  static PermanentCar getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PermanentCar>(create);
  static PermanentCar? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get enterEffect => $_getBF(1);
  @$pb.TagNumber(2)
  set enterEffect($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEnterEffect() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnterEffect() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get upgradeReward => $_getBF(2);
  @$pb.TagNumber(3)
  set upgradeReward($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUpgradeReward() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpgradeReward() => clearField(3);

  @$pb.TagNumber(4)
  ParkingGarageCar get car => $_getN(3);
  @$pb.TagNumber(4)
  set car(ParkingGarageCar v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCar() => $_has(3);
  @$pb.TagNumber(4)
  void clearCar() => clearField(4);
  @$pb.TagNumber(4)
  ParkingGarageCar ensureCar() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get preview => $_getSZ(4);
  @$pb.TagNumber(5)
  set preview($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPreview() => $_has(4);
  @$pb.TagNumber(5)
  void clearPreview() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get animation => $_getSZ(5);
  @$pb.TagNumber(6)
  set animation($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAnimation() => $_has(5);
  @$pb.TagNumber(6)
  void clearAnimation() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get animationSize => $_getIZ(6);
  @$pb.TagNumber(7)
  set animationSize($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAnimationSize() => $_has(6);
  @$pb.TagNumber(7)
  void clearAnimationSize() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get stickExtraRate => $_getIZ(7);
  @$pb.TagNumber(8)
  set stickExtraRate($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStickExtraRate() => $_has(7);
  @$pb.TagNumber(8)
  void clearStickExtraRate() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get towedExtraRate => $_getIZ(8);
  @$pb.TagNumber(9)
  set towedExtraRate($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTowedExtraRate() => $_has(8);
  @$pb.TagNumber(9)
  void clearTowedExtraRate() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get takeExtraRate => $_getIZ(9);
  @$pb.TagNumber(10)
  set takeExtraRate($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTakeExtraRate() => $_has(9);
  @$pb.TagNumber(10)
  void clearTakeExtraRate() => clearField(10);
}

class ParkingCarPermanent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingCarPermanent',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlockPrice',
        $pb.PbFieldType.OU3)
    ..aOM<PermanentCar>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'car',
        subBuilder: PermanentCar.create)
    ..pc<UpgradeMaterial>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'materials',
        $pb.PbFieldType.PM,
        subBuilder: UpgradeMaterial.create)
    ..aOM<PermanentCar>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextLevelCar',
        subBuilder: PermanentCar.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redPoints',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ParkingCarPermanent._() : super();
  factory ParkingCarPermanent({
    $core.int? state,
    $core.int? unlockPrice,
    PermanentCar? car,
    $core.Iterable<UpgradeMaterial>? materials,
    PermanentCar? nextLevelCar,
    $core.int? redPoints,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (unlockPrice != null) {
      _result.unlockPrice = unlockPrice;
    }
    if (car != null) {
      _result.car = car;
    }
    if (materials != null) {
      _result.materials.addAll(materials);
    }
    if (nextLevelCar != null) {
      _result.nextLevelCar = nextLevelCar;
    }
    if (redPoints != null) {
      _result.redPoints = redPoints;
    }
    return _result;
  }
  factory ParkingCarPermanent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingCarPermanent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingCarPermanent clone() => ParkingCarPermanent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingCarPermanent copyWith(void Function(ParkingCarPermanent) updates) =>
      super.copyWith((message) => updates(message as ParkingCarPermanent))
          as ParkingCarPermanent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingCarPermanent create() => ParkingCarPermanent._();
  ParkingCarPermanent createEmptyInstance() => create();
  static $pb.PbList<ParkingCarPermanent> createRepeated() =>
      $pb.PbList<ParkingCarPermanent>();
  @$core.pragma('dart2js:noInline')
  static ParkingCarPermanent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingCarPermanent>(create);
  static ParkingCarPermanent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get state => $_getIZ(0);
  @$pb.TagNumber(1)
  set state($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get unlockPrice => $_getIZ(1);
  @$pb.TagNumber(2)
  set unlockPrice($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUnlockPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnlockPrice() => clearField(2);

  @$pb.TagNumber(3)
  PermanentCar get car => $_getN(2);
  @$pb.TagNumber(3)
  set car(PermanentCar v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCar() => $_has(2);
  @$pb.TagNumber(3)
  void clearCar() => clearField(3);
  @$pb.TagNumber(3)
  PermanentCar ensureCar() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<UpgradeMaterial> get materials => $_getList(3);

  @$pb.TagNumber(5)
  PermanentCar get nextLevelCar => $_getN(4);
  @$pb.TagNumber(5)
  set nextLevelCar(PermanentCar v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNextLevelCar() => $_has(4);
  @$pb.TagNumber(5)
  void clearNextLevelCar() => clearField(5);
  @$pb.TagNumber(5)
  PermanentCar ensureNextLevelCar() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get redPoints => $_getIZ(5);
  @$pb.TagNumber(6)
  set redPoints($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRedPoints() => $_has(5);
  @$pb.TagNumber(6)
  void clearRedPoints() => clearField(6);
}

class ParkingCarPermanents extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingCarPermanents',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ParkingCarPermanent>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'permanents',
        $pb.PbFieldType.PM,
        subBuilder: ParkingCarPermanent.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stickExtraRateSum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'towedExtraRateSum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'takeExtraRateSum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ParkingCarPermanents._() : super();
  factory ParkingCarPermanents({
    $core.Iterable<ParkingCarPermanent>? permanents,
    $core.int? stickExtraRateSum,
    $core.int? towedExtraRateSum,
    $core.int? takeExtraRateSum,
  }) {
    final _result = create();
    if (permanents != null) {
      _result.permanents.addAll(permanents);
    }
    if (stickExtraRateSum != null) {
      _result.stickExtraRateSum = stickExtraRateSum;
    }
    if (towedExtraRateSum != null) {
      _result.towedExtraRateSum = towedExtraRateSum;
    }
    if (takeExtraRateSum != null) {
      _result.takeExtraRateSum = takeExtraRateSum;
    }
    return _result;
  }
  factory ParkingCarPermanents.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingCarPermanents.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingCarPermanents clone() =>
      ParkingCarPermanents()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingCarPermanents copyWith(void Function(ParkingCarPermanents) updates) =>
      super.copyWith((message) => updates(message as ParkingCarPermanents))
          as ParkingCarPermanents; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingCarPermanents create() => ParkingCarPermanents._();
  ParkingCarPermanents createEmptyInstance() => create();
  static $pb.PbList<ParkingCarPermanents> createRepeated() =>
      $pb.PbList<ParkingCarPermanents>();
  @$core.pragma('dart2js:noInline')
  static ParkingCarPermanents getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingCarPermanents>(create);
  static ParkingCarPermanents? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ParkingCarPermanent> get permanents => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get stickExtraRateSum => $_getIZ(1);
  @$pb.TagNumber(2)
  set stickExtraRateSum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStickExtraRateSum() => $_has(1);
  @$pb.TagNumber(2)
  void clearStickExtraRateSum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get towedExtraRateSum => $_getIZ(2);
  @$pb.TagNumber(3)
  set towedExtraRateSum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTowedExtraRateSum() => $_has(2);
  @$pb.TagNumber(3)
  void clearTowedExtraRateSum() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get takeExtraRateSum => $_getIZ(3);
  @$pb.TagNumber(4)
  set takeExtraRateSum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTakeExtraRateSum() => $_has(3);
  @$pb.TagNumber(4)
  void clearTakeExtraRateSum() => clearField(4);
}

class ApiParkingCarPermanentResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingCarPermanentResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Success',
        protoName: 'Success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Message',
        protoName: 'Message')
    ..aOM<ParkingCarPermanents>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ParkingCarPermanents.create)
    ..hasRequiredFields = false;

  ApiParkingCarPermanentResponse._() : super();
  factory ApiParkingCarPermanentResponse({
    $core.bool? success,
    $core.String? message,
    ParkingCarPermanents? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingCarPermanentResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingCarPermanentResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingCarPermanentResponse clone() =>
      ApiParkingCarPermanentResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingCarPermanentResponse copyWith(
          void Function(ApiParkingCarPermanentResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiParkingCarPermanentResponse))
          as ApiParkingCarPermanentResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingCarPermanentResponse create() =>
      ApiParkingCarPermanentResponse._();
  ApiParkingCarPermanentResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingCarPermanentResponse> createRepeated() =>
      $pb.PbList<ApiParkingCarPermanentResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingCarPermanentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingCarPermanentResponse>(create);
  static ApiParkingCarPermanentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ParkingCarPermanents get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ParkingCarPermanents v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ParkingCarPermanents ensureData() => $_ensure(2);
}

class EnergyExchange extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EnergyExchange',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'energy')
    ..hasRequiredFields = false;

  EnergyExchange._() : super();
  factory EnergyExchange({
    $core.int? money,
    $fixnum.Int64? energy,
  }) {
    final _result = create();
    if (money != null) {
      _result.money = money;
    }
    if (energy != null) {
      _result.energy = energy;
    }
    return _result;
  }
  factory EnergyExchange.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EnergyExchange.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EnergyExchange clone() => EnergyExchange()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EnergyExchange copyWith(void Function(EnergyExchange) updates) =>
      super.copyWith((message) => updates(message as EnergyExchange))
          as EnergyExchange; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EnergyExchange create() => EnergyExchange._();
  EnergyExchange createEmptyInstance() => create();
  static $pb.PbList<EnergyExchange> createRepeated() =>
      $pb.PbList<EnergyExchange>();
  @$core.pragma('dart2js:noInline')
  static EnergyExchange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnergyExchange>(create);
  static EnergyExchange? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get money => $_getIZ(0);
  @$pb.TagNumber(1)
  set money($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMoney() => $_has(0);
  @$pb.TagNumber(1)
  void clearMoney() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get energy => $_getI64(1);
  @$pb.TagNumber(2)
  set energy($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEnergy() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnergy() => clearField(2);
}

class ApiParkingEnergyExchangeList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingEnergyExchangeList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'open')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totast')
    ..pc<EnergyExchange>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'exchanges',
        $pb.PbFieldType.PM,
        subBuilder: EnergyExchange.create)
    ..hasRequiredFields = false;

  ApiParkingEnergyExchangeList._() : super();
  factory ApiParkingEnergyExchangeList({
    $core.bool? open,
    $core.String? totast,
    $core.Iterable<EnergyExchange>? exchanges,
  }) {
    final _result = create();
    if (open != null) {
      _result.open = open;
    }
    if (totast != null) {
      _result.totast = totast;
    }
    if (exchanges != null) {
      _result.exchanges.addAll(exchanges);
    }
    return _result;
  }
  factory ApiParkingEnergyExchangeList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingEnergyExchangeList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingEnergyExchangeList clone() =>
      ApiParkingEnergyExchangeList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingEnergyExchangeList copyWith(
          void Function(ApiParkingEnergyExchangeList) updates) =>
      super.copyWith(
              (message) => updates(message as ApiParkingEnergyExchangeList))
          as ApiParkingEnergyExchangeList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingEnergyExchangeList create() =>
      ApiParkingEnergyExchangeList._();
  ApiParkingEnergyExchangeList createEmptyInstance() => create();
  static $pb.PbList<ApiParkingEnergyExchangeList> createRepeated() =>
      $pb.PbList<ApiParkingEnergyExchangeList>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingEnergyExchangeList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingEnergyExchangeList>(create);
  static ApiParkingEnergyExchangeList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get open => $_getBF(0);
  @$pb.TagNumber(1)
  set open($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOpen() => $_has(0);
  @$pb.TagNumber(1)
  void clearOpen() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get totast => $_getSZ(1);
  @$pb.TagNumber(2)
  set totast($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTotast() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotast() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<EnergyExchange> get exchanges => $_getList(2);
}

class ApiEnergyExchangeListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiEnergyExchangeListResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Success',
        protoName: 'Success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Message',
        protoName: 'Message')
    ..aOM<ApiParkingEnergyExchangeList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ApiParkingEnergyExchangeList.create)
    ..hasRequiredFields = false;

  ApiEnergyExchangeListResponse._() : super();
  factory ApiEnergyExchangeListResponse({
    $core.bool? success,
    $core.String? message,
    ApiParkingEnergyExchangeList? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiEnergyExchangeListResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiEnergyExchangeListResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiEnergyExchangeListResponse clone() =>
      ApiEnergyExchangeListResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiEnergyExchangeListResponse copyWith(
          void Function(ApiEnergyExchangeListResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiEnergyExchangeListResponse))
          as ApiEnergyExchangeListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiEnergyExchangeListResponse create() =>
      ApiEnergyExchangeListResponse._();
  ApiEnergyExchangeListResponse createEmptyInstance() => create();
  static $pb.PbList<ApiEnergyExchangeListResponse> createRepeated() =>
      $pb.PbList<ApiEnergyExchangeListResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiEnergyExchangeListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiEnergyExchangeListResponse>(create);
  static ApiEnergyExchangeListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ApiParkingEnergyExchangeList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ApiParkingEnergyExchangeList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ApiParkingEnergyExchangeList ensureData() => $_ensure(2);
}

class UpgardeData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpgardeData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<ParkingGarageCar>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'car',
        subBuilder: ParkingGarageCar.create)
    ..aOM<CommoditySend>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lotteryData',
        protoName: 'lotteryData',
        subBuilder: CommoditySend.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'preview')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'animation')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'animationSize',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  UpgardeData._() : super();
  factory UpgardeData({
    ParkingGarageCar? car,
    CommoditySend? lotteryData,
    $core.String? preview,
    $core.String? animation,
    $core.int? animationSize,
  }) {
    final _result = create();
    if (car != null) {
      _result.car = car;
    }
    if (lotteryData != null) {
      _result.lotteryData = lotteryData;
    }
    if (preview != null) {
      _result.preview = preview;
    }
    if (animation != null) {
      _result.animation = animation;
    }
    if (animationSize != null) {
      _result.animationSize = animationSize;
    }
    return _result;
  }
  factory UpgardeData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpgardeData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpgardeData clone() => UpgardeData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpgardeData copyWith(void Function(UpgardeData) updates) =>
      super.copyWith((message) => updates(message as UpgardeData))
          as UpgardeData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpgardeData create() => UpgardeData._();
  UpgardeData createEmptyInstance() => create();
  static $pb.PbList<UpgardeData> createRepeated() => $pb.PbList<UpgardeData>();
  @$core.pragma('dart2js:noInline')
  static UpgardeData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpgardeData>(create);
  static UpgardeData? _defaultInstance;

  @$pb.TagNumber(1)
  ParkingGarageCar get car => $_getN(0);
  @$pb.TagNumber(1)
  set car(ParkingGarageCar v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCar() => $_has(0);
  @$pb.TagNumber(1)
  void clearCar() => clearField(1);
  @$pb.TagNumber(1)
  ParkingGarageCar ensureCar() => $_ensure(0);

  @$pb.TagNumber(2)
  CommoditySend get lotteryData => $_getN(1);
  @$pb.TagNumber(2)
  set lotteryData(CommoditySend v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLotteryData() => $_has(1);
  @$pb.TagNumber(2)
  void clearLotteryData() => clearField(2);
  @$pb.TagNumber(2)
  CommoditySend ensureLotteryData() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get preview => $_getSZ(2);
  @$pb.TagNumber(3)
  set preview($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPreview() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreview() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get animation => $_getSZ(3);
  @$pb.TagNumber(4)
  set animation($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAnimation() => $_has(3);
  @$pb.TagNumber(4)
  void clearAnimation() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get animationSize => $_getIZ(4);
  @$pb.TagNumber(5)
  set animationSize($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAnimationSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearAnimationSize() => clearField(5);
}

class CommoditySend extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommoditySend',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.O3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  CommoditySend._() : super();
  factory CommoditySend({
    $core.int? cid,
    $core.int? num,
    $core.String? icon,
    $core.int? price,
    $core.String? name,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (num != null) {
      _result.num = num;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (price != null) {
      _result.price = price;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory CommoditySend.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommoditySend.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommoditySend clone() => CommoditySend()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommoditySend copyWith(void Function(CommoditySend) updates) =>
      super.copyWith((message) => updates(message as CommoditySend))
          as CommoditySend; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommoditySend create() => CommoditySend._();
  CommoditySend createEmptyInstance() => create();
  static $pb.PbList<CommoditySend> createRepeated() =>
      $pb.PbList<CommoditySend>();
  @$core.pragma('dart2js:noInline')
  static CommoditySend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommoditySend>(create);
  static CommoditySend? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get num => $_getIZ(1);
  @$pb.TagNumber(2)
  set num($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearNum() => clearField(2);

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
  $core.int get price => $_getIZ(3);
  @$pb.TagNumber(4)
  set price($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => clearField(4);

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

class ApiParkingCarUpgradeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingCarUpgradeResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Success',
        protoName: 'Success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Message',
        protoName: 'Message')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Code',
        $pb.PbFieldType.O3,
        protoName: 'Code')
    ..aOM<UpgardeData>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: UpgardeData.create)
    ..hasRequiredFields = false;

  ApiParkingCarUpgradeResponse._() : super();
  factory ApiParkingCarUpgradeResponse({
    $core.bool? success,
    $core.String? message,
    $core.int? code,
    UpgardeData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (code != null) {
      _result.code = code;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingCarUpgradeResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingCarUpgradeResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingCarUpgradeResponse clone() =>
      ApiParkingCarUpgradeResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingCarUpgradeResponse copyWith(
          void Function(ApiParkingCarUpgradeResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiParkingCarUpgradeResponse))
          as ApiParkingCarUpgradeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingCarUpgradeResponse create() =>
      ApiParkingCarUpgradeResponse._();
  ApiParkingCarUpgradeResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingCarUpgradeResponse> createRepeated() =>
      $pb.PbList<ApiParkingCarUpgradeResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingCarUpgradeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingCarUpgradeResponse>(create);
  static ApiParkingCarUpgradeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get code => $_getIZ(2);
  @$pb.TagNumber(3)
  set code($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCode() => clearField(3);

  @$pb.TagNumber(4)
  UpgardeData get data => $_getN(3);
  @$pb.TagNumber(4)
  set data(UpgardeData v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);
  @$pb.TagNumber(4)
  UpgardeData ensureData() => $_ensure(3);
}

class ApiParkingLogResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingLogResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOM<ParkingLogData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ParkingLogData.create)
    ..hasRequiredFields = false;

  ApiParkingLogResponse._() : super();
  factory ApiParkingLogResponse({
    $core.bool? success,
    $core.String? message,
    ParkingLogData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingLogResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingLogResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingLogResponse clone() =>
      ApiParkingLogResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingLogResponse copyWith(
          void Function(ApiParkingLogResponse) updates) =>
      super.copyWith((message) => updates(message as ApiParkingLogResponse))
          as ApiParkingLogResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingLogResponse create() => ApiParkingLogResponse._();
  ApiParkingLogResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingLogResponse> createRepeated() =>
      $pb.PbList<ApiParkingLogResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingLogResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingLogResponse>(create);
  static ApiParkingLogResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ParkingLogData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ParkingLogData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ParkingLogData ensureData() => $_ensure(2);
}

class ParkingLogData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingLogData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ParkingLogItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ParkingLogItem.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more')
    ..hasRequiredFields = false;

  ParkingLogData._() : super();
  factory ParkingLogData({
    $core.Iterable<ParkingLogItem>? list,
    $core.bool? more,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (more != null) {
      _result.more = more;
    }
    return _result;
  }
  factory ParkingLogData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingLogData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingLogData clone() => ParkingLogData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingLogData copyWith(void Function(ParkingLogData) updates) =>
      super.copyWith((message) => updates(message as ParkingLogData))
          as ParkingLogData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingLogData create() => ParkingLogData._();
  ParkingLogData createEmptyInstance() => create();
  static $pb.PbList<ParkingLogData> createRepeated() =>
      $pb.PbList<ParkingLogData>();
  @$core.pragma('dart2js:noInline')
  static ParkingLogData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingLogData>(create);
  static ParkingLogData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ParkingLogItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get more => $_getBF(1);
  @$pb.TagNumber(2)
  set more($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearMore() => clearField(2);
}

class ParkingLogItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingLogItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<ParkingCarOperateRole>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'operator',
        subBuilder: ParkingCarOperateRole.create)
    ..aOM<ParkingCarOperateRole>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'operated',
        subBuilder: ParkingCarOperateRole.create)
    ..aOM<ParkingCarOperateRole>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'protector',
        subBuilder: ParkingCarOperateRole.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'operation',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'avenge',
        $pb.PbFieldType.OU3)
    ..aOM<ParkingLogCar>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'car',
        subBuilder: ParkingLogCar.create)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'energy',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extraEnergy',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logId',
        $pb.PbFieldType.OU3,
        protoName: 'logId')
    ..hasRequiredFields = false;

  ParkingLogItem._() : super();
  factory ParkingLogItem({
    ParkingCarOperateRole? operator,
    ParkingCarOperateRole? operated,
    ParkingCarOperateRole? protector,
    $core.int? operation,
    $core.int? dateline,
    $core.int? avenge,
    ParkingLogCar? car,
    $core.int? energy,
    $core.int? extraEnergy,
    $core.int? logId,
  }) {
    final _result = create();
    if (operator != null) {
      _result.operator = operator;
    }
    if (operated != null) {
      _result.operated = operated;
    }
    if (protector != null) {
      _result.protector = protector;
    }
    if (operation != null) {
      _result.operation = operation;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (avenge != null) {
      _result.avenge = avenge;
    }
    if (car != null) {
      _result.car = car;
    }
    if (energy != null) {
      _result.energy = energy;
    }
    if (extraEnergy != null) {
      _result.extraEnergy = extraEnergy;
    }
    if (logId != null) {
      _result.logId = logId;
    }
    return _result;
  }
  factory ParkingLogItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingLogItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingLogItem clone() => ParkingLogItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingLogItem copyWith(void Function(ParkingLogItem) updates) =>
      super.copyWith((message) => updates(message as ParkingLogItem))
          as ParkingLogItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingLogItem create() => ParkingLogItem._();
  ParkingLogItem createEmptyInstance() => create();
  static $pb.PbList<ParkingLogItem> createRepeated() =>
      $pb.PbList<ParkingLogItem>();
  @$core.pragma('dart2js:noInline')
  static ParkingLogItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingLogItem>(create);
  static ParkingLogItem? _defaultInstance;

  @$pb.TagNumber(1)
  ParkingCarOperateRole get operator => $_getN(0);
  @$pb.TagNumber(1)
  set operator(ParkingCarOperateRole v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOperator() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperator() => clearField(1);
  @$pb.TagNumber(1)
  ParkingCarOperateRole ensureOperator() => $_ensure(0);

  @$pb.TagNumber(2)
  ParkingCarOperateRole get operated => $_getN(1);
  @$pb.TagNumber(2)
  set operated(ParkingCarOperateRole v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOperated() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperated() => clearField(2);
  @$pb.TagNumber(2)
  ParkingCarOperateRole ensureOperated() => $_ensure(1);

  @$pb.TagNumber(3)
  ParkingCarOperateRole get protector => $_getN(2);
  @$pb.TagNumber(3)
  set protector(ParkingCarOperateRole v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasProtector() => $_has(2);
  @$pb.TagNumber(3)
  void clearProtector() => clearField(3);
  @$pb.TagNumber(3)
  ParkingCarOperateRole ensureProtector() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get operation => $_getIZ(3);
  @$pb.TagNumber(4)
  set operation($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOperation() => $_has(3);
  @$pb.TagNumber(4)
  void clearOperation() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get dateline => $_getIZ(4);
  @$pb.TagNumber(5)
  set dateline($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDateline() => $_has(4);
  @$pb.TagNumber(5)
  void clearDateline() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get avenge => $_getIZ(5);
  @$pb.TagNumber(6)
  set avenge($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAvenge() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvenge() => clearField(6);

  @$pb.TagNumber(7)
  ParkingLogCar get car => $_getN(6);
  @$pb.TagNumber(7)
  set car(ParkingLogCar v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCar() => $_has(6);
  @$pb.TagNumber(7)
  void clearCar() => clearField(7);
  @$pb.TagNumber(7)
  ParkingLogCar ensureCar() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get energy => $_getIZ(7);
  @$pb.TagNumber(8)
  set energy($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasEnergy() => $_has(7);
  @$pb.TagNumber(8)
  void clearEnergy() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get extraEnergy => $_getIZ(8);
  @$pb.TagNumber(9)
  set extraEnergy($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasExtraEnergy() => $_has(8);
  @$pb.TagNumber(9)
  void clearExtraEnergy() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get logId => $_getIZ(9);
  @$pb.TagNumber(10)
  set logId($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasLogId() => $_has(9);
  @$pb.TagNumber(10)
  void clearLogId() => clearField(10);
}

class ParkingLogCar extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingLogCar',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ParkingLogCar._() : super();
  factory ParkingLogCar({
    $core.int? cid,
    $core.String? name,
    $core.int? level,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (level != null) {
      _result.level = level;
    }
    return _result;
  }
  factory ParkingLogCar.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingLogCar.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingLogCar clone() => ParkingLogCar()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingLogCar copyWith(void Function(ParkingLogCar) updates) =>
      super.copyWith((message) => updates(message as ParkingLogCar))
          as ParkingLogCar; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingLogCar create() => ParkingLogCar._();
  ParkingLogCar createEmptyInstance() => create();
  static $pb.PbList<ParkingLogCar> createRepeated() =>
      $pb.PbList<ParkingLogCar>();
  @$core.pragma('dart2js:noInline')
  static ParkingLogCar getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingLogCar>(create);
  static ParkingLogCar? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

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
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);
}

class ParkingCarOperateRole extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingCarOperateRole',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
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
    ..hasRequiredFields = false;

  ParkingCarOperateRole._() : super();
  factory ParkingCarOperateRole({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
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
    return _result;
  }
  factory ParkingCarOperateRole.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingCarOperateRole.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingCarOperateRole clone() =>
      ParkingCarOperateRole()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingCarOperateRole copyWith(
          void Function(ParkingCarOperateRole) updates) =>
      super.copyWith((message) => updates(message as ParkingCarOperateRole))
          as ParkingCarOperateRole; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingCarOperateRole create() => ParkingCarOperateRole._();
  ParkingCarOperateRole createEmptyInstance() => create();
  static $pb.PbList<ParkingCarOperateRole> createRepeated() =>
      $pb.PbList<ParkingCarOperateRole>();
  @$core.pragma('dart2js:noInline')
  static ParkingCarOperateRole getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingCarOperateRole>(create);
  static ParkingCarOperateRole? _defaultInstance;

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
}

class ApiParkingProfileResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingProfileResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOM<ParkingProfileData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ParkingProfileData.create)
    ..hasRequiredFields = false;

  ApiParkingProfileResponse._() : super();
  factory ApiParkingProfileResponse({
    $core.bool? success,
    $core.String? message,
    ParkingProfileData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingProfileResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingProfileResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingProfileResponse clone() =>
      ApiParkingProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingProfileResponse copyWith(
          void Function(ApiParkingProfileResponse) updates) =>
      super.copyWith((message) => updates(message as ApiParkingProfileResponse))
          as ApiParkingProfileResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingProfileResponse create() => ApiParkingProfileResponse._();
  ApiParkingProfileResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingProfileResponse> createRepeated() =>
      $pb.PbList<ApiParkingProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingProfileResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingProfileResponse>(create);
  static ApiParkingProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ParkingProfileData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ParkingProfileData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ParkingProfileData ensureData() => $_ensure(2);
}

class ParkingProfileData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingProfileData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxRecordId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unownedPermanentCid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ParkingProfileData._() : super();
  factory ParkingProfileData({
    $core.int? maxRecordId,
    $core.int? unownedPermanentCid,
  }) {
    final _result = create();
    if (maxRecordId != null) {
      _result.maxRecordId = maxRecordId;
    }
    if (unownedPermanentCid != null) {
      _result.unownedPermanentCid = unownedPermanentCid;
    }
    return _result;
  }
  factory ParkingProfileData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingProfileData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingProfileData clone() => ParkingProfileData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingProfileData copyWith(void Function(ParkingProfileData) updates) =>
      super.copyWith((message) => updates(message as ParkingProfileData))
          as ParkingProfileData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingProfileData create() => ParkingProfileData._();
  ParkingProfileData createEmptyInstance() => create();
  static $pb.PbList<ParkingProfileData> createRepeated() =>
      $pb.PbList<ParkingProfileData>();
  @$core.pragma('dart2js:noInline')
  static ParkingProfileData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingProfileData>(create);
  static ParkingProfileData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get maxRecordId => $_getIZ(0);
  @$pb.TagNumber(1)
  set maxRecordId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMaxRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxRecordId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get unownedPermanentCid => $_getIZ(1);
  @$pb.TagNumber(2)
  set unownedPermanentCid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUnownedPermanentCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnownedPermanentCid() => clearField(2);
}

class ApiParkingDailyTaskResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingDailyTaskResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOM<ParkingDailyTaskData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ParkingDailyTaskData.create)
    ..hasRequiredFields = false;

  ApiParkingDailyTaskResponse._() : super();
  factory ApiParkingDailyTaskResponse({
    $core.bool? success,
    $core.String? message,
    ParkingDailyTaskData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingDailyTaskResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingDailyTaskResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingDailyTaskResponse clone() =>
      ApiParkingDailyTaskResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingDailyTaskResponse copyWith(
          void Function(ApiParkingDailyTaskResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiParkingDailyTaskResponse))
          as ApiParkingDailyTaskResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingDailyTaskResponse create() =>
      ApiParkingDailyTaskResponse._();
  ApiParkingDailyTaskResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingDailyTaskResponse> createRepeated() =>
      $pb.PbList<ApiParkingDailyTaskResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingDailyTaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingDailyTaskResponse>(create);
  static ApiParkingDailyTaskResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ParkingDailyTaskData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ParkingDailyTaskData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ParkingDailyTaskData ensureData() => $_ensure(2);
}

class ParkingDailyTaskData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingDailyTaskData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ParkingDailyTaskItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tasks',
        $pb.PbFieldType.PM,
        subBuilder: ParkingDailyTaskItem.create)
    ..pc<ParkingCardItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cards',
        $pb.PbFieldType.PM,
        subBuilder: ParkingCardItem.create)
    ..hasRequiredFields = false;

  ParkingDailyTaskData._() : super();
  factory ParkingDailyTaskData({
    $core.Iterable<ParkingDailyTaskItem>? tasks,
    $core.Iterable<ParkingCardItem>? cards,
  }) {
    final _result = create();
    if (tasks != null) {
      _result.tasks.addAll(tasks);
    }
    if (cards != null) {
      _result.cards.addAll(cards);
    }
    return _result;
  }
  factory ParkingDailyTaskData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingDailyTaskData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingDailyTaskData clone() =>
      ParkingDailyTaskData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingDailyTaskData copyWith(void Function(ParkingDailyTaskData) updates) =>
      super.copyWith((message) => updates(message as ParkingDailyTaskData))
          as ParkingDailyTaskData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingDailyTaskData create() => ParkingDailyTaskData._();
  ParkingDailyTaskData createEmptyInstance() => create();
  static $pb.PbList<ParkingDailyTaskData> createRepeated() =>
      $pb.PbList<ParkingDailyTaskData>();
  @$core.pragma('dart2js:noInline')
  static ParkingDailyTaskData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingDailyTaskData>(create);
  static ParkingDailyTaskData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ParkingDailyTaskItem> get tasks => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<ParkingCardItem> get cards => $_getList(1);
}

class ParkingDailyTaskItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingDailyTaskItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskID',
        $pb.PbFieldType.OU3,
        protoName: 'taskID')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'award')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'need',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ParkingDailyTaskItem._() : super();
  factory ParkingDailyTaskItem({
    $core.int? taskID,
    $core.String? title,
    $core.String? award,
    $core.int? need,
    $core.int? current,
    $core.int? status,
  }) {
    final _result = create();
    if (taskID != null) {
      _result.taskID = taskID;
    }
    if (title != null) {
      _result.title = title;
    }
    if (award != null) {
      _result.award = award;
    }
    if (need != null) {
      _result.need = need;
    }
    if (current != null) {
      _result.current = current;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory ParkingDailyTaskItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingDailyTaskItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingDailyTaskItem clone() =>
      ParkingDailyTaskItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingDailyTaskItem copyWith(void Function(ParkingDailyTaskItem) updates) =>
      super.copyWith((message) => updates(message as ParkingDailyTaskItem))
          as ParkingDailyTaskItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingDailyTaskItem create() => ParkingDailyTaskItem._();
  ParkingDailyTaskItem createEmptyInstance() => create();
  static $pb.PbList<ParkingDailyTaskItem> createRepeated() =>
      $pb.PbList<ParkingDailyTaskItem>();
  @$core.pragma('dart2js:noInline')
  static ParkingDailyTaskItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingDailyTaskItem>(create);
  static ParkingDailyTaskItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get taskID => $_getIZ(0);
  @$pb.TagNumber(1)
  set taskID($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTaskID() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get award => $_getSZ(2);
  @$pb.TagNumber(3)
  set award($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAward() => $_has(2);
  @$pb.TagNumber(3)
  void clearAward() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get need => $_getIZ(3);
  @$pb.TagNumber(4)
  set need($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNeed() => $_has(3);
  @$pb.TagNumber(4)
  void clearNeed() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get current => $_getIZ(4);
  @$pb.TagNumber(5)
  set current($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCurrent() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrent() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get status => $_getIZ(5);
  @$pb.TagNumber(6)
  set status($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);
}

class ParkingCardItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingCardItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'card',
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
            : 'url')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  ParkingCardItem._() : super();
  factory ParkingCardItem({
    $core.int? card,
    $core.String? name,
    $core.String? url,
    $core.int? num,
    $core.String? desc,
  }) {
    final _result = create();
    if (card != null) {
      _result.card = card;
    }
    if (name != null) {
      _result.name = name;
    }
    if (url != null) {
      _result.url = url;
    }
    if (num != null) {
      _result.num = num;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory ParkingCardItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingCardItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingCardItem clone() => ParkingCardItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingCardItem copyWith(void Function(ParkingCardItem) updates) =>
      super.copyWith((message) => updates(message as ParkingCardItem))
          as ParkingCardItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingCardItem create() => ParkingCardItem._();
  ParkingCardItem createEmptyInstance() => create();
  static $pb.PbList<ParkingCardItem> createRepeated() =>
      $pb.PbList<ParkingCardItem>();
  @$core.pragma('dart2js:noInline')
  static ParkingCardItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingCardItem>(create);
  static ParkingCardItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get card => $_getIZ(0);
  @$pb.TagNumber(1)
  set card($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCard() => $_has(0);
  @$pb.TagNumber(1)
  void clearCard() => clearField(1);

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
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get num => $_getIZ(3);
  @$pb.TagNumber(4)
  set num($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get desc => $_getSZ(4);
  @$pb.TagNumber(5)
  set desc($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDesc() => $_has(4);
  @$pb.TagNumber(5)
  void clearDesc() => clearField(5);
}

class ApiParkingRankTypeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingRankTypeResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOM<ParkingRankTypeData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ParkingRankTypeData.create)
    ..hasRequiredFields = false;

  ApiParkingRankTypeResponse._() : super();
  factory ApiParkingRankTypeResponse({
    $core.bool? success,
    $core.String? message,
    ParkingRankTypeData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingRankTypeResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingRankTypeResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingRankTypeResponse clone() =>
      ApiParkingRankTypeResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingRankTypeResponse copyWith(
          void Function(ApiParkingRankTypeResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiParkingRankTypeResponse))
          as ApiParkingRankTypeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingRankTypeResponse create() => ApiParkingRankTypeResponse._();
  ApiParkingRankTypeResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingRankTypeResponse> createRepeated() =>
      $pb.PbList<ApiParkingRankTypeResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingRankTypeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingRankTypeResponse>(create);
  static ApiParkingRankTypeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ParkingRankTypeData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ParkingRankTypeData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ParkingRankTypeData ensureData() => $_ensure(2);
}

class ParkingRankTypeData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingRankTypeData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ParkingRankTypeItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabs',
        $pb.PbFieldType.PM,
        subBuilder: ParkingRankTypeItem.create)
    ..hasRequiredFields = false;

  ParkingRankTypeData._() : super();
  factory ParkingRankTypeData({
    $core.Iterable<ParkingRankTypeItem>? tabs,
  }) {
    final _result = create();
    if (tabs != null) {
      _result.tabs.addAll(tabs);
    }
    return _result;
  }
  factory ParkingRankTypeData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingRankTypeData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingRankTypeData clone() => ParkingRankTypeData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingRankTypeData copyWith(void Function(ParkingRankTypeData) updates) =>
      super.copyWith((message) => updates(message as ParkingRankTypeData))
          as ParkingRankTypeData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingRankTypeData create() => ParkingRankTypeData._();
  ParkingRankTypeData createEmptyInstance() => create();
  static $pb.PbList<ParkingRankTypeData> createRepeated() =>
      $pb.PbList<ParkingRankTypeData>();
  @$core.pragma('dart2js:noInline')
  static ParkingRankTypeData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingRankTypeData>(create);
  static ParkingRankTypeData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ParkingRankTypeItem> get tabs => $_getList(0);
}

class ParkingRankTypeItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingRankTypeItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  ParkingRankTypeItem._() : super();
  factory ParkingRankTypeItem({
    $core.int? type,
    $core.String? desc,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory ParkingRankTypeItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingRankTypeItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingRankTypeItem clone() => ParkingRankTypeItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingRankTypeItem copyWith(void Function(ParkingRankTypeItem) updates) =>
      super.copyWith((message) => updates(message as ParkingRankTypeItem))
          as ParkingRankTypeItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingRankTypeItem create() => ParkingRankTypeItem._();
  ParkingRankTypeItem createEmptyInstance() => create();
  static $pb.PbList<ParkingRankTypeItem> createRepeated() =>
      $pb.PbList<ParkingRankTypeItem>();
  @$core.pragma('dart2js:noInline')
  static ParkingRankTypeItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingRankTypeItem>(create);
  static ParkingRankTypeItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => clearField(2);
}

class ApiParkingRankResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingRankResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOM<ParkingRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ParkingRankData.create)
    ..hasRequiredFields = false;

  ApiParkingRankResponse._() : super();
  factory ApiParkingRankResponse({
    $core.bool? success,
    $core.String? message,
    ParkingRankData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingRankResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingRankResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingRankResponse clone() =>
      ApiParkingRankResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingRankResponse copyWith(
          void Function(ApiParkingRankResponse) updates) =>
      super.copyWith((message) => updates(message as ApiParkingRankResponse))
          as ApiParkingRankResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingRankResponse create() => ApiParkingRankResponse._();
  ApiParkingRankResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingRankResponse> createRepeated() =>
      $pb.PbList<ApiParkingRankResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingRankResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingRankResponse>(create);
  static ApiParkingRankResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ParkingRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ParkingRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ParkingRankData ensureData() => $_ensure(2);
}

class ParkingRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more')
    ..aOM<ParkingRankItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'my',
        subBuilder: ParkingRankItem.create)
    ..pc<ParkingRankItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ParkingRankItem.create)
    ..hasRequiredFields = false;

  ParkingRankData._() : super();
  factory ParkingRankData({
    $core.bool? more,
    ParkingRankItem? my,
    $core.Iterable<ParkingRankItem>? list,
  }) {
    final _result = create();
    if (more != null) {
      _result.more = more;
    }
    if (my != null) {
      _result.my = my;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory ParkingRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingRankData clone() => ParkingRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingRankData copyWith(void Function(ParkingRankData) updates) =>
      super.copyWith((message) => updates(message as ParkingRankData))
          as ParkingRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingRankData create() => ParkingRankData._();
  ParkingRankData createEmptyInstance() => create();
  static $pb.PbList<ParkingRankData> createRepeated() =>
      $pb.PbList<ParkingRankData>();
  @$core.pragma('dart2js:noInline')
  static ParkingRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingRankData>(create);
  static ParkingRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get more => $_getBF(0);
  @$pb.TagNumber(1)
  set more($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMore() => $_has(0);
  @$pb.TagNumber(1)
  void clearMore() => clearField(1);

  @$pb.TagNumber(2)
  ParkingRankItem get my => $_getN(1);
  @$pb.TagNumber(2)
  set my(ParkingRankItem v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMy() => $_has(1);
  @$pb.TagNumber(2)
  void clearMy() => clearField(2);
  @$pb.TagNumber(2)
  ParkingRankItem ensureMy() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<ParkingRankItem> get list => $_getList(2);
}

class ParkingRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingRankItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityName',
        protoName: 'commodityName')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityImage',
        protoName: 'commodityImage')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityLevel',
        $pb.PbFieldType.OU3,
        protoName: 'commodityLevel')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ParkingRankItem._() : super();
  factory ParkingRankItem({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? cid,
    $core.String? commodityName,
    $core.String? commodityImage,
    $core.int? commodityLevel,
    $core.int? rank,
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
    if (cid != null) {
      _result.cid = cid;
    }
    if (commodityName != null) {
      _result.commodityName = commodityName;
    }
    if (commodityImage != null) {
      _result.commodityImage = commodityImage;
    }
    if (commodityLevel != null) {
      _result.commodityLevel = commodityLevel;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    return _result;
  }
  factory ParkingRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingRankItem clone() => ParkingRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingRankItem copyWith(void Function(ParkingRankItem) updates) =>
      super.copyWith((message) => updates(message as ParkingRankItem))
          as ParkingRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingRankItem create() => ParkingRankItem._();
  ParkingRankItem createEmptyInstance() => create();
  static $pb.PbList<ParkingRankItem> createRepeated() =>
      $pb.PbList<ParkingRankItem>();
  @$core.pragma('dart2js:noInline')
  static ParkingRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingRankItem>(create);
  static ParkingRankItem? _defaultInstance;

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
  $core.int get cid => $_getIZ(3);
  @$pb.TagNumber(4)
  set cid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCid() => $_has(3);
  @$pb.TagNumber(4)
  void clearCid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get commodityName => $_getSZ(4);
  @$pb.TagNumber(5)
  set commodityName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCommodityName() => $_has(4);
  @$pb.TagNumber(5)
  void clearCommodityName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get commodityImage => $_getSZ(5);
  @$pb.TagNumber(6)
  set commodityImage($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCommodityImage() => $_has(5);
  @$pb.TagNumber(6)
  void clearCommodityImage() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get commodityLevel => $_getIZ(6);
  @$pb.TagNumber(7)
  set commodityLevel($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCommodityLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearCommodityLevel() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get rank => $_getIZ(7);
  @$pb.TagNumber(8)
  set rank($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRank() => $_has(7);
  @$pb.TagNumber(8)
  void clearRank() => clearField(8);
}

class ApiParkingParkedCarResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingParkedCarResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOM<ParkingParkedCarData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ParkingParkedCarData.create)
    ..hasRequiredFields = false;

  ApiParkingParkedCarResponse._() : super();
  factory ApiParkingParkedCarResponse({
    $core.bool? success,
    $core.String? message,
    ParkingParkedCarData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingParkedCarResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingParkedCarResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingParkedCarResponse clone() =>
      ApiParkingParkedCarResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingParkedCarResponse copyWith(
          void Function(ApiParkingParkedCarResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiParkingParkedCarResponse))
          as ApiParkingParkedCarResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingParkedCarResponse create() =>
      ApiParkingParkedCarResponse._();
  ApiParkingParkedCarResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingParkedCarResponse> createRepeated() =>
      $pb.PbList<ApiParkingParkedCarResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingParkedCarResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingParkedCarResponse>(create);
  static ApiParkingParkedCarResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ParkingParkedCarData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ParkingParkedCarData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ParkingParkedCarData ensureData() => $_ensure(2);
}

class ParkingParkedCarData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingParkedCarData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<ParkingUserInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: ParkingUserInfo.create)
    ..pc<ParkingGarageCar>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ParkingGarageCar.create)
    ..hasRequiredFields = false;

  ParkingParkedCarData._() : super();
  factory ParkingParkedCarData({
    ParkingUserInfo? user,
    $core.Iterable<ParkingGarageCar>? list,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory ParkingParkedCarData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingParkedCarData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingParkedCarData clone() =>
      ParkingParkedCarData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingParkedCarData copyWith(void Function(ParkingParkedCarData) updates) =>
      super.copyWith((message) => updates(message as ParkingParkedCarData))
          as ParkingParkedCarData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingParkedCarData create() => ParkingParkedCarData._();
  ParkingParkedCarData createEmptyInstance() => create();
  static $pb.PbList<ParkingParkedCarData> createRepeated() =>
      $pb.PbList<ParkingParkedCarData>();
  @$core.pragma('dart2js:noInline')
  static ParkingParkedCarData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingParkedCarData>(create);
  static ParkingParkedCarData? _defaultInstance;

  @$pb.TagNumber(1)
  ParkingUserInfo get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(ParkingUserInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  ParkingUserInfo ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<ParkingGarageCar> get list => $_getList(1);
}

class ParkingUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingUserInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'follow',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ParkingUserInfo._() : super();
  factory ParkingUserInfo({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? follow,
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
    if (follow != null) {
      _result.follow = follow;
    }
    return _result;
  }
  factory ParkingUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingUserInfo clone() => ParkingUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingUserInfo copyWith(void Function(ParkingUserInfo) updates) =>
      super.copyWith((message) => updates(message as ParkingUserInfo))
          as ParkingUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingUserInfo create() => ParkingUserInfo._();
  ParkingUserInfo createEmptyInstance() => create();
  static $pb.PbList<ParkingUserInfo> createRepeated() =>
      $pb.PbList<ParkingUserInfo>();
  @$core.pragma('dart2js:noInline')
  static ParkingUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingUserInfo>(create);
  static ParkingUserInfo? _defaultInstance;

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
  $core.int get follow => $_getIZ(3);
  @$pb.TagNumber(4)
  set follow($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFollow() => $_has(3);
  @$pb.TagNumber(4)
  void clearFollow() => clearField(4);
}

class ApiParkingAwardCheckResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingAwardCheckResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOM<ParkingAwardCheckData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ParkingAwardCheckData.create)
    ..hasRequiredFields = false;

  ApiParkingAwardCheckResponse._() : super();
  factory ApiParkingAwardCheckResponse({
    $core.bool? success,
    $core.String? message,
    ParkingAwardCheckData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingAwardCheckResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingAwardCheckResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingAwardCheckResponse clone() =>
      ApiParkingAwardCheckResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingAwardCheckResponse copyWith(
          void Function(ApiParkingAwardCheckResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiParkingAwardCheckResponse))
          as ApiParkingAwardCheckResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingAwardCheckResponse create() =>
      ApiParkingAwardCheckResponse._();
  ApiParkingAwardCheckResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingAwardCheckResponse> createRepeated() =>
      $pb.PbList<ApiParkingAwardCheckResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingAwardCheckResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingAwardCheckResponse>(create);
  static ApiParkingAwardCheckResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ParkingAwardCheckData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ParkingAwardCheckData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ParkingAwardCheckData ensureData() => $_ensure(2);
}

class ParkingAwardCheckData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingAwardCheckData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<ParkingAwardItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'car',
        subBuilder: ParkingAwardItem.create)
    ..hasRequiredFields = false;

  ParkingAwardCheckData._() : super();
  factory ParkingAwardCheckData({
    ParkingAwardItem? car,
  }) {
    final _result = create();
    if (car != null) {
      _result.car = car;
    }
    return _result;
  }
  factory ParkingAwardCheckData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingAwardCheckData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingAwardCheckData clone() =>
      ParkingAwardCheckData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingAwardCheckData copyWith(
          void Function(ParkingAwardCheckData) updates) =>
      super.copyWith((message) => updates(message as ParkingAwardCheckData))
          as ParkingAwardCheckData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingAwardCheckData create() => ParkingAwardCheckData._();
  ParkingAwardCheckData createEmptyInstance() => create();
  static $pb.PbList<ParkingAwardCheckData> createRepeated() =>
      $pb.PbList<ParkingAwardCheckData>();
  @$core.pragma('dart2js:noInline')
  static ParkingAwardCheckData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingAwardCheckData>(create);
  static ParkingAwardCheckData? _defaultInstance;

  @$pb.TagNumber(1)
  ParkingAwardItem get car => $_getN(0);
  @$pb.TagNumber(1)
  set car(ParkingAwardItem v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCar() => $_has(0);
  @$pb.TagNumber(1)
  void clearCar() => clearField(1);
  @$pb.TagNumber(1)
  ParkingAwardItem ensureCar() => $_ensure(0);
}

class ParkingAwardItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingAwardItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'UCid',
        $pb.PbFieldType.OU3,
        protoName: 'UCid')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'annotation')
    ..hasRequiredFields = false;

  ParkingAwardItem._() : super();
  factory ParkingAwardItem({
    $core.int? cid,
    $core.int? uCid,
    $core.int? num,
    $core.String? name,
    $core.String? image,
    $core.String? annotation,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (uCid != null) {
      _result.uCid = uCid;
    }
    if (num != null) {
      _result.num = num;
    }
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    if (annotation != null) {
      _result.annotation = annotation;
    }
    return _result;
  }
  factory ParkingAwardItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingAwardItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingAwardItem clone() => ParkingAwardItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingAwardItem copyWith(void Function(ParkingAwardItem) updates) =>
      super.copyWith((message) => updates(message as ParkingAwardItem))
          as ParkingAwardItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingAwardItem create() => ParkingAwardItem._();
  ParkingAwardItem createEmptyInstance() => create();
  static $pb.PbList<ParkingAwardItem> createRepeated() =>
      $pb.PbList<ParkingAwardItem>();
  @$core.pragma('dart2js:noInline')
  static ParkingAwardItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingAwardItem>(create);
  static ParkingAwardItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get uCid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uCid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUCid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => clearField(3);

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
  $core.String get image => $_getSZ(4);
  @$pb.TagNumber(5)
  set image($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearImage() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get annotation => $_getSZ(5);
  @$pb.TagNumber(6)
  set annotation($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAnnotation() => $_has(5);
  @$pb.TagNumber(6)
  void clearAnnotation() => clearField(6);
}

class ApiParkingPermanentPreviewResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingPermanentPreviewResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOM<ParkingPermanentPreviewData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ParkingPermanentPreviewData.create)
    ..hasRequiredFields = false;

  ApiParkingPermanentPreviewResponse._() : super();
  factory ApiParkingPermanentPreviewResponse({
    $core.bool? success,
    $core.String? message,
    ParkingPermanentPreviewData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingPermanentPreviewResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingPermanentPreviewResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingPermanentPreviewResponse clone() =>
      ApiParkingPermanentPreviewResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingPermanentPreviewResponse copyWith(
          void Function(ApiParkingPermanentPreviewResponse) updates) =>
      super.copyWith((message) =>
              updates(message as ApiParkingPermanentPreviewResponse))
          as ApiParkingPermanentPreviewResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingPermanentPreviewResponse create() =>
      ApiParkingPermanentPreviewResponse._();
  ApiParkingPermanentPreviewResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingPermanentPreviewResponse> createRepeated() =>
      $pb.PbList<ApiParkingPermanentPreviewResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingPermanentPreviewResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingPermanentPreviewResponse>(
          create);
  static ApiParkingPermanentPreviewResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ParkingPermanentPreviewData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ParkingPermanentPreviewData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ParkingPermanentPreviewData ensureData() => $_ensure(2);
}

class ParkingPermanentPreviewData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingPermanentPreviewData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..pc<ParkingPermanentPreviewLevel>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levels',
        $pb.PbFieldType.PM,
        subBuilder: ParkingPermanentPreviewLevel.create)
    ..hasRequiredFields = false;

  ParkingPermanentPreviewData._() : super();
  factory ParkingPermanentPreviewData({
    $core.int? cid,
    $core.int? level,
    $core.Iterable<ParkingPermanentPreviewLevel>? levels,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (level != null) {
      _result.level = level;
    }
    if (levels != null) {
      _result.levels.addAll(levels);
    }
    return _result;
  }
  factory ParkingPermanentPreviewData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingPermanentPreviewData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingPermanentPreviewData clone() =>
      ParkingPermanentPreviewData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingPermanentPreviewData copyWith(
          void Function(ParkingPermanentPreviewData) updates) =>
      super.copyWith(
              (message) => updates(message as ParkingPermanentPreviewData))
          as ParkingPermanentPreviewData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingPermanentPreviewData create() =>
      ParkingPermanentPreviewData._();
  ParkingPermanentPreviewData createEmptyInstance() => create();
  static $pb.PbList<ParkingPermanentPreviewData> createRepeated() =>
      $pb.PbList<ParkingPermanentPreviewData>();
  @$core.pragma('dart2js:noInline')
  static ParkingPermanentPreviewData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingPermanentPreviewData>(create);
  static ParkingPermanentPreviewData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get level => $_getIZ(1);
  @$pb.TagNumber(2)
  set level($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ParkingPermanentPreviewLevel> get levels => $_getList(2);
}

class ParkingPermanentPreviewLevel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingPermanentPreviewLevel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
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
            : 'image')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasAward',
        protoName: 'hasAward')
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasEffect',
        protoName: 'hasEffect')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epm',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'freeParkingDuration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stickExtraRate',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'towedExtraRate',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'takeExtraRate',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'animation')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'animationSize',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dynamicIcon',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ParkingPermanentPreviewLevel._() : super();
  factory ParkingPermanentPreviewLevel({
    $core.int? level,
    $core.String? name,
    $core.String? image,
    $core.bool? hasAward,
    $core.bool? hasEffect,
    $core.int? epm,
    $core.int? freeParkingDuration,
    $core.int? stickExtraRate,
    $core.int? towedExtraRate,
    $core.int? takeExtraRate,
    $core.String? animation,
    $core.int? animationSize,
    $core.int? dynamicIcon,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    if (hasAward != null) {
      _result.hasAward = hasAward;
    }
    if (hasEffect != null) {
      _result.hasEffect = hasEffect;
    }
    if (epm != null) {
      _result.epm = epm;
    }
    if (freeParkingDuration != null) {
      _result.freeParkingDuration = freeParkingDuration;
    }
    if (stickExtraRate != null) {
      _result.stickExtraRate = stickExtraRate;
    }
    if (towedExtraRate != null) {
      _result.towedExtraRate = towedExtraRate;
    }
    if (takeExtraRate != null) {
      _result.takeExtraRate = takeExtraRate;
    }
    if (animation != null) {
      _result.animation = animation;
    }
    if (animationSize != null) {
      _result.animationSize = animationSize;
    }
    if (dynamicIcon != null) {
      _result.dynamicIcon = dynamicIcon;
    }
    return _result;
  }
  factory ParkingPermanentPreviewLevel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingPermanentPreviewLevel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingPermanentPreviewLevel clone() =>
      ParkingPermanentPreviewLevel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingPermanentPreviewLevel copyWith(
          void Function(ParkingPermanentPreviewLevel) updates) =>
      super.copyWith(
              (message) => updates(message as ParkingPermanentPreviewLevel))
          as ParkingPermanentPreviewLevel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingPermanentPreviewLevel create() =>
      ParkingPermanentPreviewLevel._();
  ParkingPermanentPreviewLevel createEmptyInstance() => create();
  static $pb.PbList<ParkingPermanentPreviewLevel> createRepeated() =>
      $pb.PbList<ParkingPermanentPreviewLevel>();
  @$core.pragma('dart2js:noInline')
  static ParkingPermanentPreviewLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingPermanentPreviewLevel>(create);
  static ParkingPermanentPreviewLevel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

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
  $core.String get image => $_getSZ(2);
  @$pb.TagNumber(3)
  set image($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get hasAward => $_getBF(3);
  @$pb.TagNumber(4)
  set hasAward($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHasAward() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasAward() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get hasEffect => $_getBF(4);
  @$pb.TagNumber(5)
  set hasEffect($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHasEffect() => $_has(4);
  @$pb.TagNumber(5)
  void clearHasEffect() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get epm => $_getIZ(5);
  @$pb.TagNumber(6)
  set epm($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasEpm() => $_has(5);
  @$pb.TagNumber(6)
  void clearEpm() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get freeParkingDuration => $_getIZ(6);
  @$pb.TagNumber(7)
  set freeParkingDuration($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasFreeParkingDuration() => $_has(6);
  @$pb.TagNumber(7)
  void clearFreeParkingDuration() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get stickExtraRate => $_getIZ(7);
  @$pb.TagNumber(8)
  set stickExtraRate($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStickExtraRate() => $_has(7);
  @$pb.TagNumber(8)
  void clearStickExtraRate() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get towedExtraRate => $_getIZ(8);
  @$pb.TagNumber(9)
  set towedExtraRate($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTowedExtraRate() => $_has(8);
  @$pb.TagNumber(9)
  void clearTowedExtraRate() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get takeExtraRate => $_getIZ(9);
  @$pb.TagNumber(10)
  set takeExtraRate($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTakeExtraRate() => $_has(9);
  @$pb.TagNumber(10)
  void clearTakeExtraRate() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get animation => $_getSZ(10);
  @$pb.TagNumber(11)
  set animation($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasAnimation() => $_has(10);
  @$pb.TagNumber(11)
  void clearAnimation() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get animationSize => $_getIZ(11);
  @$pb.TagNumber(12)
  set animationSize($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasAnimationSize() => $_has(11);
  @$pb.TagNumber(12)
  void clearAnimationSize() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get dynamicIcon => $_getIZ(12);
  @$pb.TagNumber(13)
  set dynamicIcon($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasDynamicIcon() => $_has(12);
  @$pb.TagNumber(13)
  void clearDynamicIcon() => clearField(13);
}

class ApiParkingDoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiParkingDoResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOM<ParkingDoData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ParkingDoData.create)
    ..hasRequiredFields = false;

  ApiParkingDoResponse._() : super();
  factory ApiParkingDoResponse({
    $core.bool? success,
    $core.String? message,
    ParkingDoData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiParkingDoResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiParkingDoResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiParkingDoResponse clone() =>
      ApiParkingDoResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiParkingDoResponse copyWith(void Function(ApiParkingDoResponse) updates) =>
      super.copyWith((message) => updates(message as ApiParkingDoResponse))
          as ApiParkingDoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiParkingDoResponse create() => ApiParkingDoResponse._();
  ApiParkingDoResponse createEmptyInstance() => create();
  static $pb.PbList<ApiParkingDoResponse> createRepeated() =>
      $pb.PbList<ApiParkingDoResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiParkingDoResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiParkingDoResponse>(create);
  static ApiParkingDoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ParkingDoData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ParkingDoData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ParkingDoData ensureData() => $_ensure(2);
}

class ParkingDoData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParkingDoData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lot',
        $pb.PbFieldType.OU3)
    ..aOM<ParkingCardItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'card',
        subBuilder: ParkingCardItem.create)
    ..hasRequiredFields = false;

  ParkingDoData._() : super();
  factory ParkingDoData({
    $core.int? lot,
    ParkingCardItem? card,
  }) {
    final _result = create();
    if (lot != null) {
      _result.lot = lot;
    }
    if (card != null) {
      _result.card = card;
    }
    return _result;
  }
  factory ParkingDoData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParkingDoData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParkingDoData clone() => ParkingDoData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParkingDoData copyWith(void Function(ParkingDoData) updates) =>
      super.copyWith((message) => updates(message as ParkingDoData))
          as ParkingDoData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParkingDoData create() => ParkingDoData._();
  ParkingDoData createEmptyInstance() => create();
  static $pb.PbList<ParkingDoData> createRepeated() =>
      $pb.PbList<ParkingDoData>();
  @$core.pragma('dart2js:noInline')
  static ParkingDoData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkingDoData>(create);
  static ParkingDoData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lot => $_getIZ(0);
  @$pb.TagNumber(1)
  set lot($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLot() => $_has(0);
  @$pb.TagNumber(1)
  void clearLot() => clearField(1);

  @$pb.TagNumber(2)
  ParkingCardItem get card => $_getN(1);
  @$pb.TagNumber(2)
  set card(ParkingCardItem v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCard() => $_has(1);
  @$pb.TagNumber(2)
  void clearCard() => clearField(2);
  @$pb.TagNumber(2)
  ParkingCardItem ensureCard() => $_ensure(1);
}
