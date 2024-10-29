///
//  Generated code. Do not modify.
//  source: wedding.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class WeddingRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WeddingRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'wedding.refresh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blessing_score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stage',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  WeddingRefresh._() : super();
  factory WeddingRefresh({
    $core.int? blessingScore,
    $core.int? stage,
  }) {
    final _result = create();
    if (blessingScore != null) {
      _result.blessingScore = blessingScore;
    }
    if (stage != null) {
      _result.stage = stage;
    }
    return _result;
  }
  factory WeddingRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WeddingRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WeddingRefresh clone() => WeddingRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WeddingRefresh copyWith(void Function(WeddingRefresh) updates) =>
      super.copyWith((message) => updates(message as WeddingRefresh))
          as WeddingRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WeddingRefresh create() => WeddingRefresh._();
  WeddingRefresh createEmptyInstance() => create();
  static $pb.PbList<WeddingRefresh> createRepeated() =>
      $pb.PbList<WeddingRefresh>();
  @$core.pragma('dart2js:noInline')
  static WeddingRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WeddingRefresh>(create);
  static WeddingRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get blessingScore => $_getIZ(0);
  @$pb.TagNumber(1)
  set blessingScore($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBlessingScore() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlessingScore() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get stage => $_getIZ(1);
  @$pb.TagNumber(2)
  set stage($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStage() => $_has(1);
  @$pb.TagNumber(2)
  void clearStage() => clearField(2);
}
