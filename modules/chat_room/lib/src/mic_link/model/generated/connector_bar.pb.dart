///
//  Generated code. Do not modify.
//  source: connector_bar.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RespConnectorBarLabelList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespConnectorBarLabelList',
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
            : 'msg')
    ..pc<PosLabelInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: PosLabelInfo.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'auditStatus',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RespConnectorBarLabelList._() : super();
  factory RespConnectorBarLabelList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<PosLabelInfo>? data,
    $core.int? auditStatus,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    if (auditStatus != null) {
      _result.auditStatus = auditStatus;
    }
    return _result;
  }
  factory RespConnectorBarLabelList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespConnectorBarLabelList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespConnectorBarLabelList clone() =>
      RespConnectorBarLabelList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespConnectorBarLabelList copyWith(
          void Function(RespConnectorBarLabelList) updates) =>
      super.copyWith((message) => updates(message as RespConnectorBarLabelList))
          as RespConnectorBarLabelList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespConnectorBarLabelList create() => RespConnectorBarLabelList._();
  RespConnectorBarLabelList createEmptyInstance() => create();
  static $pb.PbList<RespConnectorBarLabelList> createRepeated() =>
      $pb.PbList<RespConnectorBarLabelList>();
  @$core.pragma('dart2js:noInline')
  static RespConnectorBarLabelList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespConnectorBarLabelList>(create);
  static RespConnectorBarLabelList? _defaultInstance;

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
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<PosLabelInfo> get data => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get auditStatus => $_getIZ(3);
  @$pb.TagNumber(4)
  set auditStatus($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAuditStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuditStatus() => clearField(4);
}

class PosLabelInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PosLabelInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pos',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  PosLabelInfo._() : super();
  factory PosLabelInfo({
    $core.int? pos,
    $core.String? label,
    $core.int? status,
    $core.String? desc,
  }) {
    final _result = create();
    if (pos != null) {
      _result.pos = pos;
    }
    if (label != null) {
      _result.label = label;
    }
    if (status != null) {
      _result.status = status;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory PosLabelInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PosLabelInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PosLabelInfo clone() => PosLabelInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PosLabelInfo copyWith(void Function(PosLabelInfo) updates) =>
      super.copyWith((message) => updates(message as PosLabelInfo))
          as PosLabelInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PosLabelInfo create() => PosLabelInfo._();
  PosLabelInfo createEmptyInstance() => create();
  static $pb.PbList<PosLabelInfo> createRepeated() =>
      $pb.PbList<PosLabelInfo>();
  @$core.pragma('dart2js:noInline')
  static PosLabelInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PosLabelInfo>(create);
  static PosLabelInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pos => $_getIZ(0);
  @$pb.TagNumber(1)
  set pos($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPos() => $_has(0);
  @$pb.TagNumber(1)
  void clearPos() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(2)
  set label($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLabel() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get status => $_getIZ(2);
  @$pb.TagNumber(3)
  set status($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => clearField(4);
}

class RespConnectorBarPresentsList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespConnectorBarPresentsList',
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
            : 'msg')
    ..pc<PresentsUserInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: PresentsUserInfo.create)
    ..hasRequiredFields = false;

  RespConnectorBarPresentsList._() : super();
  factory RespConnectorBarPresentsList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<PresentsUserInfo>? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory RespConnectorBarPresentsList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespConnectorBarPresentsList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespConnectorBarPresentsList clone() =>
      RespConnectorBarPresentsList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespConnectorBarPresentsList copyWith(
          void Function(RespConnectorBarPresentsList) updates) =>
      super.copyWith(
              (message) => updates(message as RespConnectorBarPresentsList))
          as RespConnectorBarPresentsList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespConnectorBarPresentsList create() =>
      RespConnectorBarPresentsList._();
  RespConnectorBarPresentsList createEmptyInstance() => create();
  static $pb.PbList<RespConnectorBarPresentsList> createRepeated() =>
      $pb.PbList<RespConnectorBarPresentsList>();
  @$core.pragma('dart2js:noInline')
  static RespConnectorBarPresentsList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespConnectorBarPresentsList>(create);
  static RespConnectorBarPresentsList? _defaultInstance;

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
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<PresentsUserInfo> get data => $_getList(2);
}

class PresentsUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PresentsUserInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pos',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'charm',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micStatus',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PresentsUserInfo._() : super();
  factory PresentsUserInfo({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? pos,
    $core.int? charm,
    $core.int? micStatus,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (pos != null) {
      _result.pos = pos;
    }
    if (charm != null) {
      _result.charm = charm;
    }
    if (micStatus != null) {
      _result.micStatus = micStatus;
    }
    return _result;
  }
  factory PresentsUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PresentsUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PresentsUserInfo clone() => PresentsUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PresentsUserInfo copyWith(void Function(PresentsUserInfo) updates) =>
      super.copyWith((message) => updates(message as PresentsUserInfo))
          as PresentsUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PresentsUserInfo create() => PresentsUserInfo._();
  PresentsUserInfo createEmptyInstance() => create();
  static $pb.PbList<PresentsUserInfo> createRepeated() =>
      $pb.PbList<PresentsUserInfo>();
  @$core.pragma('dart2js:noInline')
  static PresentsUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PresentsUserInfo>(create);
  static PresentsUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get pos => $_getIZ(3);
  @$pb.TagNumber(4)
  set pos($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPos() => $_has(3);
  @$pb.TagNumber(4)
  void clearPos() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get charm => $_getIZ(4);
  @$pb.TagNumber(5)
  set charm($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCharm() => $_has(4);
  @$pb.TagNumber(5)
  void clearCharm() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get micStatus => $_getIZ(5);
  @$pb.TagNumber(6)
  set micStatus($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMicStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearMicStatus() => clearField(6);
}
