///
//  Generated code. Do not modify.
//  source: song.list.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SongListRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SongListRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'song.list.refresh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SongListRefresh._() : super();
  factory SongListRefresh({
    $core.int? sid,
  }) {
    final _result = create();
    if (sid != null) {
      _result.sid = sid;
    }
    return _result;
  }
  factory SongListRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SongListRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SongListRefresh clone() => SongListRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SongListRefresh copyWith(void Function(SongListRefresh) updates) =>
      super.copyWith((message) => updates(message as SongListRefresh))
          as SongListRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongListRefresh create() => SongListRefresh._();
  SongListRefresh createEmptyInstance() => create();
  static $pb.PbList<SongListRefresh> createRepeated() =>
      $pb.PbList<SongListRefresh>();
  @$core.pragma('dart2js:noInline')
  static SongListRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SongListRefresh>(create);
  static SongListRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sid => $_getIZ(0);
  @$pb.TagNumber(1)
  set sid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSid() => $_has(0);
  @$pb.TagNumber(1)
  void clearSid() => clearField(1);
}
