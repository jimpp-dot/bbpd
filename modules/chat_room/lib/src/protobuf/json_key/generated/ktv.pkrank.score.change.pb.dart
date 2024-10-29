///
//  Generated code. Do not modify.
//  source: ktv.pkrank.score.change.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class KtvPkrankScoreChange extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvPkrankScoreChange',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'ktv.pkrank.score.change'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'before_score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current_score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'on_mic_uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  KtvPkrankScoreChange._() : super();
  factory KtvPkrankScoreChange({
    $core.int? beforeScore,
    $core.int? currentScore,
    $core.int? onMicUid,
  }) {
    final _result = create();
    if (beforeScore != null) {
      _result.beforeScore = beforeScore;
    }
    if (currentScore != null) {
      _result.currentScore = currentScore;
    }
    if (onMicUid != null) {
      _result.onMicUid = onMicUid;
    }
    return _result;
  }
  factory KtvPkrankScoreChange.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvPkrankScoreChange.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvPkrankScoreChange clone() =>
      KtvPkrankScoreChange()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvPkrankScoreChange copyWith(void Function(KtvPkrankScoreChange) updates) =>
      super.copyWith((message) => updates(message as KtvPkrankScoreChange))
          as KtvPkrankScoreChange; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvPkrankScoreChange create() => KtvPkrankScoreChange._();
  KtvPkrankScoreChange createEmptyInstance() => create();
  static $pb.PbList<KtvPkrankScoreChange> createRepeated() =>
      $pb.PbList<KtvPkrankScoreChange>();
  @$core.pragma('dart2js:noInline')
  static KtvPkrankScoreChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvPkrankScoreChange>(create);
  static KtvPkrankScoreChange? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get beforeScore => $_getIZ(0);
  @$pb.TagNumber(1)
  set beforeScore($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBeforeScore() => $_has(0);
  @$pb.TagNumber(1)
  void clearBeforeScore() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get currentScore => $_getIZ(1);
  @$pb.TagNumber(2)
  set currentScore($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCurrentScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentScore() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get onMicUid => $_getIZ(2);
  @$pb.TagNumber(3)
  set onMicUid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOnMicUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearOnMicUid() => clearField(3);
}
