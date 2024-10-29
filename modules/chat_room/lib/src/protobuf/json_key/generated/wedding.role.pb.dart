///
//  Generated code. Do not modify.
//  source: wedding.role.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class WeddingRole_List extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WeddingRole.List',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'wedding.role'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  WeddingRole_List._() : super();
  factory WeddingRole_List({
    $core.int? position,
    $core.int? role,
    $core.int? uid,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (role != null) {
      _result.role = role;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory WeddingRole_List.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WeddingRole_List.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WeddingRole_List clone() => WeddingRole_List()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WeddingRole_List copyWith(void Function(WeddingRole_List) updates) =>
      super.copyWith((message) => updates(message as WeddingRole_List))
          as WeddingRole_List; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WeddingRole_List create() => WeddingRole_List._();
  WeddingRole_List createEmptyInstance() => create();
  static $pb.PbList<WeddingRole_List> createRepeated() =>
      $pb.PbList<WeddingRole_List>();
  @$core.pragma('dart2js:noInline')
  static WeddingRole_List getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WeddingRole_List>(create);
  static WeddingRole_List? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get role => $_getIZ(1);
  @$pb.TagNumber(2)
  set role($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get uid => $_getIZ(2);
  @$pb.TagNumber(3)
  set uid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);
}

class WeddingRole extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WeddingRole',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'wedding.role'),
      createEmptyInstance: create)
    ..pc<WeddingRole_List>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: WeddingRole_List.create)
    ..hasRequiredFields = false;

  WeddingRole._() : super();
  factory WeddingRole({
    $core.Iterable<WeddingRole_List>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory WeddingRole.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WeddingRole.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WeddingRole clone() => WeddingRole()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WeddingRole copyWith(void Function(WeddingRole) updates) =>
      super.copyWith((message) => updates(message as WeddingRole))
          as WeddingRole; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WeddingRole create() => WeddingRole._();
  WeddingRole createEmptyInstance() => create();
  static $pb.PbList<WeddingRole> createRepeated() => $pb.PbList<WeddingRole>();
  @$core.pragma('dart2js:noInline')
  static WeddingRole getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WeddingRole>(create);
  static WeddingRole? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<WeddingRole_List> get list => $_getList(0);
}
