///
//  Generated code. Do not modify.
//  source: room.lottery.start.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomLotteryStart extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomLotteryStart',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.lottery.start'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'join_way',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lottery_id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'now',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'round',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'round_time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'start_time',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'words')
    ..hasRequiredFields = false;

  RoomLotteryStart._() : super();
  factory RoomLotteryStart({
    $core.int? giftId,
    $core.int? joinWay,
    $core.int? lotteryId,
    $core.int? now,
    $core.int? rid,
    $core.int? round,
    $core.int? roundTime,
    $core.int? startTime,
    $core.String? words,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (joinWay != null) {
      _result.joinWay = joinWay;
    }
    if (lotteryId != null) {
      _result.lotteryId = lotteryId;
    }
    if (now != null) {
      _result.now = now;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (round != null) {
      _result.round = round;
    }
    if (roundTime != null) {
      _result.roundTime = roundTime;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    if (words != null) {
      _result.words = words;
    }
    return _result;
  }
  factory RoomLotteryStart.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomLotteryStart.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomLotteryStart clone() => RoomLotteryStart()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomLotteryStart copyWith(void Function(RoomLotteryStart) updates) =>
      super.copyWith((message) => updates(message as RoomLotteryStart))
          as RoomLotteryStart; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomLotteryStart create() => RoomLotteryStart._();
  RoomLotteryStart createEmptyInstance() => create();
  static $pb.PbList<RoomLotteryStart> createRepeated() =>
      $pb.PbList<RoomLotteryStart>();
  @$core.pragma('dart2js:noInline')
  static RoomLotteryStart getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomLotteryStart>(create);
  static RoomLotteryStart? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get joinWay => $_getIZ(1);
  @$pb.TagNumber(2)
  set joinWay($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasJoinWay() => $_has(1);
  @$pb.TagNumber(2)
  void clearJoinWay() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get lotteryId => $_getIZ(2);
  @$pb.TagNumber(3)
  set lotteryId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLotteryId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLotteryId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get now => $_getIZ(3);
  @$pb.TagNumber(4)
  set now($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNow() => $_has(3);
  @$pb.TagNumber(4)
  void clearNow() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get rid => $_getIZ(4);
  @$pb.TagNumber(5)
  set rid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRid() => $_has(4);
  @$pb.TagNumber(5)
  void clearRid() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get round => $_getIZ(5);
  @$pb.TagNumber(6)
  set round($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRound() => $_has(5);
  @$pb.TagNumber(6)
  void clearRound() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get roundTime => $_getIZ(6);
  @$pb.TagNumber(7)
  set roundTime($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRoundTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoundTime() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get startTime => $_getIZ(7);
  @$pb.TagNumber(8)
  set startTime($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStartTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearStartTime() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get words => $_getSZ(8);
  @$pb.TagNumber(9)
  set words($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasWords() => $_has(8);
  @$pb.TagNumber(9)
  void clearWords() => clearField(9);
}
