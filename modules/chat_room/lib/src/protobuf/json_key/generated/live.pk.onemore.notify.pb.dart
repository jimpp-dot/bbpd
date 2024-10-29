///
//  Generated code. Do not modify.
//  source: live.pk.onemore.notify.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LivePkOnemoreNotify extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LivePkOnemoreNotify',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'live.pk.onemore.notify'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expire_time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from_rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from_uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pk_time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to_rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to_uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  LivePkOnemoreNotify._() : super();
  factory LivePkOnemoreNotify({
    $core.int? expireTime,
    $core.int? fromRid,
    $core.int? fromUid,
    $core.int? pkTime,
    $core.int? toRid,
    $core.int? toUid,
  }) {
    final _result = create();
    if (expireTime != null) {
      _result.expireTime = expireTime;
    }
    if (fromRid != null) {
      _result.fromRid = fromRid;
    }
    if (fromUid != null) {
      _result.fromUid = fromUid;
    }
    if (pkTime != null) {
      _result.pkTime = pkTime;
    }
    if (toRid != null) {
      _result.toRid = toRid;
    }
    if (toUid != null) {
      _result.toUid = toUid;
    }
    return _result;
  }
  factory LivePkOnemoreNotify.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LivePkOnemoreNotify.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LivePkOnemoreNotify clone() => LivePkOnemoreNotify()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LivePkOnemoreNotify copyWith(void Function(LivePkOnemoreNotify) updates) =>
      super.copyWith((message) => updates(message as LivePkOnemoreNotify))
          as LivePkOnemoreNotify; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LivePkOnemoreNotify create() => LivePkOnemoreNotify._();
  LivePkOnemoreNotify createEmptyInstance() => create();
  static $pb.PbList<LivePkOnemoreNotify> createRepeated() =>
      $pb.PbList<LivePkOnemoreNotify>();
  @$core.pragma('dart2js:noInline')
  static LivePkOnemoreNotify getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LivePkOnemoreNotify>(create);
  static LivePkOnemoreNotify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get expireTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set expireTime($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasExpireTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearExpireTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get fromRid => $_getIZ(1);
  @$pb.TagNumber(2)
  set fromRid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFromRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromRid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get fromUid => $_getIZ(2);
  @$pb.TagNumber(3)
  set fromUid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFromUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearFromUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get pkTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set pkTime($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPkTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearPkTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get toRid => $_getIZ(4);
  @$pb.TagNumber(5)
  set toRid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasToRid() => $_has(4);
  @$pb.TagNumber(5)
  void clearToRid() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get toUid => $_getIZ(5);
  @$pb.TagNumber(6)
  set toUid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasToUid() => $_has(5);
  @$pb.TagNumber(6)
  void clearToUid() => clearField(6);
}
