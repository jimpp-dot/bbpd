///
//  Generated code. Do not modify.
//  source: suspect.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SuspectRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'suspect.refresh'),
      createEmptyInstance: create)
    ..p<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'suspect.base.info',
        $pb.PbFieldType.PU3,
        protoName: 'info')
    ..hasRequiredFields = false;

  SuspectRefresh._() : super();
  factory SuspectRefresh({
    $core.Iterable<$core.int>? info,
  }) {
    final _result = create();
    if (info != null) {
      _result.info.addAll(info);
    }
    return _result;
  }
  factory SuspectRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectRefresh clone() => SuspectRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectRefresh copyWith(void Function(SuspectRefresh) updates) =>
      super.copyWith((message) => updates(message as SuspectRefresh))
          as SuspectRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectRefresh create() => SuspectRefresh._();
  SuspectRefresh createEmptyInstance() => create();
  static $pb.PbList<SuspectRefresh> createRepeated() =>
      $pb.PbList<SuspectRefresh>();
  @$core.pragma('dart2js:noInline')
  static SuspectRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectRefresh>(create);
  static SuspectRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get info => $_getList(0);
}
