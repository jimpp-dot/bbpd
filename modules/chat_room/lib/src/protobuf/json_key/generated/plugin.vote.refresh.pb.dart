///
//  Generated code. Do not modify.
//  source: plugin.vote.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PluginVoteRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PluginVoteRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'plugin.vote.refresh'),
      createEmptyInstance: create)
    ..p<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vote_info',
        $pb.PbFieldType.PU3)
    ..hasRequiredFields = false;

  PluginVoteRefresh._() : super();
  factory PluginVoteRefresh({
    $core.Iterable<$core.int>? voteInfo,
  }) {
    final _result = create();
    if (voteInfo != null) {
      _result.voteInfo.addAll(voteInfo);
    }
    return _result;
  }
  factory PluginVoteRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PluginVoteRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PluginVoteRefresh clone() => PluginVoteRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PluginVoteRefresh copyWith(void Function(PluginVoteRefresh) updates) =>
      super.copyWith((message) => updates(message as PluginVoteRefresh))
          as PluginVoteRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PluginVoteRefresh create() => PluginVoteRefresh._();
  PluginVoteRefresh createEmptyInstance() => create();
  static $pb.PbList<PluginVoteRefresh> createRepeated() =>
      $pb.PbList<PluginVoteRefresh>();
  @$core.pragma('dart2js:noInline')
  static PluginVoteRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PluginVoteRefresh>(create);
  static PluginVoteRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get voteInfo => $_getList(0);
}
