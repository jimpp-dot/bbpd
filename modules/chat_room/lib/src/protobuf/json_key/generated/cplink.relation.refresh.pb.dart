///
//  Generated code. Do not modify.
//  source: cplink.relation.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CpLinkRelationRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CpLinkRelationRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'cplink.relation.refresh'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'config_refresh')
    ..hasRequiredFields = false;

  CpLinkRelationRefresh._() : super();
  factory CpLinkRelationRefresh({
    $core.bool? configRefresh,
  }) {
    final _result = create();
    if (configRefresh != null) {
      _result.configRefresh = configRefresh;
    }
    return _result;
  }
  factory CpLinkRelationRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CpLinkRelationRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CpLinkRelationRefresh clone() =>
      CpLinkRelationRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CpLinkRelationRefresh copyWith(
          void Function(CpLinkRelationRefresh) updates) =>
      super.copyWith((message) => updates(message as CpLinkRelationRefresh))
          as CpLinkRelationRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CpLinkRelationRefresh create() => CpLinkRelationRefresh._();
  CpLinkRelationRefresh createEmptyInstance() => create();
  static $pb.PbList<CpLinkRelationRefresh> createRepeated() =>
      $pb.PbList<CpLinkRelationRefresh>();
  @$core.pragma('dart2js:noInline')
  static CpLinkRelationRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CpLinkRelationRefresh>(create);
  static CpLinkRelationRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get configRefresh => $_getBF(0);
  @$pb.TagNumber(1)
  set configRefresh($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConfigRefresh() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfigRefresh() => clearField(1);
}
