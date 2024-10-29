///
//  Generated code. Do not modify.
//  source: broadcaster.star.get.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BroadcasterStarGet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcasterStarGet',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'broadcaster.star.get'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reward_star_total_time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reward_star_stay_time',
        $pb.PbFieldType.OU3)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reward_star_stay_finish')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reward_star_icon')
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
            : 'count',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BroadcasterStarGet._() : super();
  factory BroadcasterStarGet({
    $core.int? rewardStarTotalTime,
    $core.int? rewardStarStayTime,
    $core.bool? rewardStarStayFinish,
    $core.String? rewardStarIcon,
    $core.int? dateline,
    $core.int? count,
  }) {
    final _result = create();
    if (rewardStarTotalTime != null) {
      _result.rewardStarTotalTime = rewardStarTotalTime;
    }
    if (rewardStarStayTime != null) {
      _result.rewardStarStayTime = rewardStarStayTime;
    }
    if (rewardStarStayFinish != null) {
      _result.rewardStarStayFinish = rewardStarStayFinish;
    }
    if (rewardStarIcon != null) {
      _result.rewardStarIcon = rewardStarIcon;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory BroadcasterStarGet.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcasterStarGet.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcasterStarGet clone() => BroadcasterStarGet()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcasterStarGet copyWith(void Function(BroadcasterStarGet) updates) =>
      super.copyWith((message) => updates(message as BroadcasterStarGet))
          as BroadcasterStarGet; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcasterStarGet create() => BroadcasterStarGet._();
  BroadcasterStarGet createEmptyInstance() => create();
  static $pb.PbList<BroadcasterStarGet> createRepeated() =>
      $pb.PbList<BroadcasterStarGet>();
  @$core.pragma('dart2js:noInline')
  static BroadcasterStarGet getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcasterStarGet>(create);
  static BroadcasterStarGet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rewardStarTotalTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set rewardStarTotalTime($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRewardStarTotalTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearRewardStarTotalTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rewardStarStayTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set rewardStarStayTime($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRewardStarStayTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearRewardStarStayTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get rewardStarStayFinish => $_getBF(2);
  @$pb.TagNumber(3)
  set rewardStarStayFinish($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRewardStarStayFinish() => $_has(2);
  @$pb.TagNumber(3)
  void clearRewardStarStayFinish() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rewardStarIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set rewardStarIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRewardStarIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearRewardStarIcon() => clearField(4);

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
  $core.int get count => $_getIZ(5);
  @$pb.TagNumber(6)
  set count($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearCount() => clearField(6);
}
