///
//  Generated code. Do not modify.
//  source: appraiser.refresh.ui.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AppraiserRefreshUI extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AppraiserRefreshUI',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'appraiser.refresh.ui'),
      createEmptyInstance: create)
    ..p<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pb',
        $pb.PbFieldType.PU3)
    ..hasRequiredFields = false;

  AppraiserRefreshUI._() : super();
  factory AppraiserRefreshUI({
    $core.Iterable<$core.int>? pb,
  }) {
    final _result = create();
    if (pb != null) {
      _result.pb.addAll(pb);
    }
    return _result;
  }
  factory AppraiserRefreshUI.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AppraiserRefreshUI.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AppraiserRefreshUI clone() => AppraiserRefreshUI()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AppraiserRefreshUI copyWith(void Function(AppraiserRefreshUI) updates) =>
      super.copyWith((message) => updates(message as AppraiserRefreshUI))
          as AppraiserRefreshUI; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppraiserRefreshUI create() => AppraiserRefreshUI._();
  AppraiserRefreshUI createEmptyInstance() => create();
  static $pb.PbList<AppraiserRefreshUI> createRepeated() =>
      $pb.PbList<AppraiserRefreshUI>();
  @$core.pragma('dart2js:noInline')
  static AppraiserRefreshUI getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AppraiserRefreshUI>(create);
  static AppraiserRefreshUI? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get pb => $_getList(0);
}
