///
//  Generated code. Do not modify.
//  source: nest.private.invite.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NestPrivateInvite extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestPrivateInvite',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'nest.private.invite'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'password')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gs')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boss',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  NestPrivateInvite._() : super();
  factory NestPrivateInvite({
    $core.String? rid,
    $core.String? password,
    $core.String? gs,
    $core.int? boss,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (password != null) {
      _result.password = password;
    }
    if (gs != null) {
      _result.gs = gs;
    }
    if (boss != null) {
      _result.boss = boss;
    }
    return _result;
  }
  factory NestPrivateInvite.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestPrivateInvite.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestPrivateInvite clone() => NestPrivateInvite()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestPrivateInvite copyWith(void Function(NestPrivateInvite) updates) =>
      super.copyWith((message) => updates(message as NestPrivateInvite))
          as NestPrivateInvite; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestPrivateInvite create() => NestPrivateInvite._();
  NestPrivateInvite createEmptyInstance() => create();
  static $pb.PbList<NestPrivateInvite> createRepeated() =>
      $pb.PbList<NestPrivateInvite>();
  @$core.pragma('dart2js:noInline')
  static NestPrivateInvite getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestPrivateInvite>(create);
  static NestPrivateInvite? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rid => $_getSZ(0);
  @$pb.TagNumber(1)
  set rid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get gs => $_getSZ(2);
  @$pb.TagNumber(3)
  set gs($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGs() => $_has(2);
  @$pb.TagNumber(3)
  void clearGs() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get boss => $_getIZ(3);
  @$pb.TagNumber(4)
  set boss($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBoss() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoss() => clearField(4);
}
