///
//  Generated code. Do not modify.
//  source: room_user_pk.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class UserPkScreen extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserPkScreen',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  UserPkScreen._() : super();
  factory UserPkScreen({
    $core.String? content,
    $core.int? pkId,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (pkId != null) {
      _result.pkId = pkId;
    }
    return _result;
  }
  factory UserPkScreen.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserPkScreen.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserPkScreen clone() => UserPkScreen()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserPkScreen copyWith(void Function(UserPkScreen) updates) =>
      super.copyWith((message) => updates(message as UserPkScreen))
          as UserPkScreen; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserPkScreen create() => UserPkScreen._();
  UserPkScreen createEmptyInstance() => create();
  static $pb.PbList<UserPkScreen> createRepeated() =>
      $pb.PbList<UserPkScreen>();
  @$core.pragma('dart2js:noInline')
  static UserPkScreen getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserPkScreen>(create);
  static UserPkScreen? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pkId => $_getIZ(1);
  @$pb.TagNumber(2)
  set pkId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPkId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPkId() => clearField(2);
}

class UserPkFly extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserPkFly',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uicon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uname')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uvip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitle',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitleNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rname')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toname')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tovip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  UserPkFly._() : super();
  factory UserPkFly({
    $core.String? uicon,
    $core.String? uname,
    $core.int? uvip,
    $core.int? utitle,
    $core.int? utitleNew,
    $core.int? rid,
    $core.String? rname,
    $core.String? toname,
    $core.int? tovip,
    $core.int? pkId,
  }) {
    final _result = create();
    if (uicon != null) {
      _result.uicon = uicon;
    }
    if (uname != null) {
      _result.uname = uname;
    }
    if (uvip != null) {
      _result.uvip = uvip;
    }
    if (utitle != null) {
      _result.utitle = utitle;
    }
    if (utitleNew != null) {
      _result.utitleNew = utitleNew;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (rname != null) {
      _result.rname = rname;
    }
    if (toname != null) {
      _result.toname = toname;
    }
    if (tovip != null) {
      _result.tovip = tovip;
    }
    if (pkId != null) {
      _result.pkId = pkId;
    }
    return _result;
  }
  factory UserPkFly.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserPkFly.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserPkFly clone() => UserPkFly()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserPkFly copyWith(void Function(UserPkFly) updates) =>
      super.copyWith((message) => updates(message as UserPkFly))
          as UserPkFly; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserPkFly create() => UserPkFly._();
  UserPkFly createEmptyInstance() => create();
  static $pb.PbList<UserPkFly> createRepeated() => $pb.PbList<UserPkFly>();
  @$core.pragma('dart2js:noInline')
  static UserPkFly getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserPkFly>(create);
  static UserPkFly? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uicon => $_getSZ(0);
  @$pb.TagNumber(1)
  set uicon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUicon() => $_has(0);
  @$pb.TagNumber(1)
  void clearUicon() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uname => $_getSZ(1);
  @$pb.TagNumber(2)
  set uname($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUname() => $_has(1);
  @$pb.TagNumber(2)
  void clearUname() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get uvip => $_getIZ(2);
  @$pb.TagNumber(3)
  set uvip($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUvip() => $_has(2);
  @$pb.TagNumber(3)
  void clearUvip() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get utitle => $_getIZ(3);
  @$pb.TagNumber(4)
  set utitle($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUtitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearUtitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get utitleNew => $_getIZ(4);
  @$pb.TagNumber(5)
  set utitleNew($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUtitleNew() => $_has(4);
  @$pb.TagNumber(5)
  void clearUtitleNew() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get rid => $_getIZ(5);
  @$pb.TagNumber(6)
  set rid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRid() => $_has(5);
  @$pb.TagNumber(6)
  void clearRid() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get rname => $_getSZ(6);
  @$pb.TagNumber(7)
  set rname($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRname() => $_has(6);
  @$pb.TagNumber(7)
  void clearRname() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get toname => $_getSZ(7);
  @$pb.TagNumber(8)
  set toname($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasToname() => $_has(7);
  @$pb.TagNumber(8)
  void clearToname() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get tovip => $_getIZ(8);
  @$pb.TagNumber(9)
  set tovip($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTovip() => $_has(8);
  @$pb.TagNumber(9)
  void clearTovip() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get pkId => $_getIZ(9);
  @$pb.TagNumber(10)
  set pkId($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPkId() => $_has(9);
  @$pb.TagNumber(10)
  void clearPkId() => clearField(10);
}
