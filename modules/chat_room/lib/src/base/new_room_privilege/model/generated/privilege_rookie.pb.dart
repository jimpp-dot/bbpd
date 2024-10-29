///
//  Generated code. Do not modify.
//  source: privilege_rookie.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class RookiePrivilegeItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RookiePrivilegeItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RookiePrivilegeItem._() : super();
  factory RookiePrivilegeItem({
    $core.int? id,
    $core.int? type,
    $core.String? name,
    $core.int? status,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    if (name != null) {
      _result.name = name;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory RookiePrivilegeItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RookiePrivilegeItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RookiePrivilegeItem clone() => RookiePrivilegeItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RookiePrivilegeItem copyWith(void Function(RookiePrivilegeItem) updates) =>
      super.copyWith((message) => updates(message as RookiePrivilegeItem))
          as RookiePrivilegeItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RookiePrivilegeItem create() => RookiePrivilegeItem._();
  RookiePrivilegeItem createEmptyInstance() => create();
  static $pb.PbList<RookiePrivilegeItem> createRepeated() =>
      $pb.PbList<RookiePrivilegeItem>();
  @$core.pragma('dart2js:noInline')
  static RookiePrivilegeItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RookiePrivilegeItem>(create);
  static RookiePrivilegeItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get status => $_getIZ(3);
  @$pb.TagNumber(4)
  set status($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);
}

class RookiePrivilegeDayList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RookiePrivilegeDayList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tab')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'idx',
        $pb.PbFieldType.OU3)
    ..pc<RookiePrivilegeItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RookiePrivilegeItem.create)
    ..hasRequiredFields = false;

  RookiePrivilegeDayList._() : super();
  factory RookiePrivilegeDayList({
    $core.String? tab,
    $core.int? idx,
    $core.Iterable<RookiePrivilegeItem>? list,
  }) {
    final _result = create();
    if (tab != null) {
      _result.tab = tab;
    }
    if (idx != null) {
      _result.idx = idx;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory RookiePrivilegeDayList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RookiePrivilegeDayList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RookiePrivilegeDayList clone() =>
      RookiePrivilegeDayList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RookiePrivilegeDayList copyWith(
          void Function(RookiePrivilegeDayList) updates) =>
      super.copyWith((message) => updates(message as RookiePrivilegeDayList))
          as RookiePrivilegeDayList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RookiePrivilegeDayList create() => RookiePrivilegeDayList._();
  RookiePrivilegeDayList createEmptyInstance() => create();
  static $pb.PbList<RookiePrivilegeDayList> createRepeated() =>
      $pb.PbList<RookiePrivilegeDayList>();
  @$core.pragma('dart2js:noInline')
  static RookiePrivilegeDayList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RookiePrivilegeDayList>(create);
  static RookiePrivilegeDayList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tab => $_getSZ(0);
  @$pb.TagNumber(1)
  set tab($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTab() => $_has(0);
  @$pb.TagNumber(1)
  void clearTab() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get idx => $_getIZ(1);
  @$pb.TagNumber(2)
  set idx($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIdx() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdx() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<RookiePrivilegeItem> get list => $_getList(2);
}

class RookiePrivilegeConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RookiePrivilegeConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expireDuration',
        $pb.PbFieldType.OU6,
        protoName: 'expireDuration',
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tips')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privilege',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'day',
        $pb.PbFieldType.OU3)
    ..pc<RookiePrivilegeDayList>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RookiePrivilegeDayList.create)
    ..hasRequiredFields = false;

  RookiePrivilegeConfig._() : super();
  factory RookiePrivilegeConfig({
    $fixnum.Int64? expireDuration,
    $core.String? desc,
    $core.String? tips,
    $core.int? privilege,
    $core.int? day,
    $core.Iterable<RookiePrivilegeDayList>? list,
  }) {
    final _result = create();
    if (expireDuration != null) {
      _result.expireDuration = expireDuration;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (tips != null) {
      _result.tips = tips;
    }
    if (privilege != null) {
      _result.privilege = privilege;
    }
    if (day != null) {
      _result.day = day;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory RookiePrivilegeConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RookiePrivilegeConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RookiePrivilegeConfig clone() =>
      RookiePrivilegeConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RookiePrivilegeConfig copyWith(
          void Function(RookiePrivilegeConfig) updates) =>
      super.copyWith((message) => updates(message as RookiePrivilegeConfig))
          as RookiePrivilegeConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RookiePrivilegeConfig create() => RookiePrivilegeConfig._();
  RookiePrivilegeConfig createEmptyInstance() => create();
  static $pb.PbList<RookiePrivilegeConfig> createRepeated() =>
      $pb.PbList<RookiePrivilegeConfig>();
  @$core.pragma('dart2js:noInline')
  static RookiePrivilegeConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RookiePrivilegeConfig>(create);
  static RookiePrivilegeConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get expireDuration => $_getI64(0);
  @$pb.TagNumber(1)
  set expireDuration($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasExpireDuration() => $_has(0);
  @$pb.TagNumber(1)
  void clearExpireDuration() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tips => $_getSZ(2);
  @$pb.TagNumber(3)
  set tips($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTips() => $_has(2);
  @$pb.TagNumber(3)
  void clearTips() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get privilege => $_getIZ(3);
  @$pb.TagNumber(4)
  set privilege($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPrivilege() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrivilege() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get day => $_getIZ(4);
  @$pb.TagNumber(5)
  set day($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDay() => $_has(4);
  @$pb.TagNumber(5)
  void clearDay() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<RookiePrivilegeDayList> get list => $_getList(5);
}

class ApiRookiePrivilegeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiRookiePrivilegeResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOM<RookiePrivilegeConfig>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RookiePrivilegeConfig.create)
    ..hasRequiredFields = false;

  ApiRookiePrivilegeResponse._() : super();
  factory ApiRookiePrivilegeResponse({
    $core.bool? success,
    $core.String? message,
    RookiePrivilegeConfig? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiRookiePrivilegeResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiRookiePrivilegeResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiRookiePrivilegeResponse clone() =>
      ApiRookiePrivilegeResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiRookiePrivilegeResponse copyWith(
          void Function(ApiRookiePrivilegeResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiRookiePrivilegeResponse))
          as ApiRookiePrivilegeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiRookiePrivilegeResponse create() => ApiRookiePrivilegeResponse._();
  ApiRookiePrivilegeResponse createEmptyInstance() => create();
  static $pb.PbList<ApiRookiePrivilegeResponse> createRepeated() =>
      $pb.PbList<ApiRookiePrivilegeResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiRookiePrivilegeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiRookiePrivilegeResponse>(create);
  static ApiRookiePrivilegeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  RookiePrivilegeConfig get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RookiePrivilegeConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RookiePrivilegeConfig ensureData() => $_ensure(2);
}
