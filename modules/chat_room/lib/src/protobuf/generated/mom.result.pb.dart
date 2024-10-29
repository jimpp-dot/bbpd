///
//  Generated code. Do not modify.
//  source: mom.result.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MomResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MomResult',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'mom.result'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guessNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MomResult._() : super();
  factory MomResult({
    $core.int? guessNum,
  }) {
    final _result = create();
    if (guessNum != null) {
      _result.guessNum = guessNum;
    }
    return _result;
  }
  factory MomResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MomResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MomResult clone() => MomResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MomResult copyWith(void Function(MomResult) updates) =>
      super.copyWith((message) => updates(message as MomResult))
          as MomResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MomResult create() => MomResult._();
  MomResult createEmptyInstance() => create();
  static $pb.PbList<MomResult> createRepeated() => $pb.PbList<MomResult>();
  @$core.pragma('dart2js:noInline')
  static MomResult getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MomResult>(create);
  static MomResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get guessNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set guessNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGuessNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuessNum() => clearField(1);
}
