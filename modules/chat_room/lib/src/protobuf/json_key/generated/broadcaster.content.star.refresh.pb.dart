///
//  Generated code. Do not modify.
//  source: broadcaster.content.star.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BroadcasterContentStarRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcasterContentStarRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'broadcaster.content.star.refresh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star_num',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BroadcasterContentStarRefresh._() : super();
  factory BroadcasterContentStarRefresh({
    $core.int? starNum,
  }) {
    final _result = create();
    if (starNum != null) {
      _result.starNum = starNum;
    }
    return _result;
  }
  factory BroadcasterContentStarRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcasterContentStarRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcasterContentStarRefresh clone() =>
      BroadcasterContentStarRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcasterContentStarRefresh copyWith(
          void Function(BroadcasterContentStarRefresh) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcasterContentStarRefresh))
          as BroadcasterContentStarRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcasterContentStarRefresh create() =>
      BroadcasterContentStarRefresh._();
  BroadcasterContentStarRefresh createEmptyInstance() => create();
  static $pb.PbList<BroadcasterContentStarRefresh> createRepeated() =>
      $pb.PbList<BroadcasterContentStarRefresh>();
  @$core.pragma('dart2js:noInline')
  static BroadcasterContentStarRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcasterContentStarRefresh>(create);
  static BroadcasterContentStarRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get starNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set starNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStarNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearStarNum() => clearField(1);
}
