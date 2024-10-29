///
//  Generated code. Do not modify.
//  source: grab.mic.sync.v3.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GrabMicSyncV3 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicSyncV3',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'grab.mic.sync.v3'),
      createEmptyInstance: create)
    ..p<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pb',
        $pb.PbFieldType.PU3)
    ..hasRequiredFields = false;

  GrabMicSyncV3._() : super();
  factory GrabMicSyncV3({
    $core.Iterable<$core.int>? pb,
  }) {
    final _result = create();
    if (pb != null) {
      _result.pb.addAll(pb);
    }
    return _result;
  }
  factory GrabMicSyncV3.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicSyncV3.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicSyncV3 clone() => GrabMicSyncV3()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicSyncV3 copyWith(void Function(GrabMicSyncV3) updates) =>
      super.copyWith((message) => updates(message as GrabMicSyncV3))
          as GrabMicSyncV3; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicSyncV3 create() => GrabMicSyncV3._();
  GrabMicSyncV3 createEmptyInstance() => create();
  static $pb.PbList<GrabMicSyncV3> createRepeated() =>
      $pb.PbList<GrabMicSyncV3>();
  @$core.pragma('dart2js:noInline')
  static GrabMicSyncV3 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicSyncV3>(create);
  static GrabMicSyncV3? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get pb => $_getList(0);
}
