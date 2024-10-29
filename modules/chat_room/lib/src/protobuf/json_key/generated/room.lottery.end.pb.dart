///
//  Generated code. Do not modify.
//  source: room.lottery.end.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomLotteryEnd extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomLotteryEnd',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.lottery.end'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lottery_id',
        $pb.PbFieldType.OU3)
    ..p<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'winners',
        $pb.PbFieldType.PU3)
    ..hasRequiredFields = false;

  RoomLotteryEnd._() : super();
  factory RoomLotteryEnd({
    $core.int? lotteryId,
    $core.Iterable<$core.int>? winners,
  }) {
    final _result = create();
    if (lotteryId != null) {
      _result.lotteryId = lotteryId;
    }
    if (winners != null) {
      _result.winners.addAll(winners);
    }
    return _result;
  }
  factory RoomLotteryEnd.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomLotteryEnd.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomLotteryEnd clone() => RoomLotteryEnd()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomLotteryEnd copyWith(void Function(RoomLotteryEnd) updates) =>
      super.copyWith((message) => updates(message as RoomLotteryEnd))
          as RoomLotteryEnd; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomLotteryEnd create() => RoomLotteryEnd._();
  RoomLotteryEnd createEmptyInstance() => create();
  static $pb.PbList<RoomLotteryEnd> createRepeated() =>
      $pb.PbList<RoomLotteryEnd>();
  @$core.pragma('dart2js:noInline')
  static RoomLotteryEnd getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomLotteryEnd>(create);
  static RoomLotteryEnd? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lotteryId => $_getIZ(0);
  @$pb.TagNumber(1)
  set lotteryId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLotteryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLotteryId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get winners => $_getList(1);
}
