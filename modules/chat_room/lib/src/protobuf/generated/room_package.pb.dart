///
//  Generated code. Do not modify.
//  source: room_package.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BodyRoomPackageRecords_RecordItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BodyRoomPackageRecords.RecordItem',
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
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fromName')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BodyRoomPackageRecords_RecordItem._() : super();
  factory BodyRoomPackageRecords_RecordItem({
    $core.int? id,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? fromName,
    $core.int? money,
    $core.int? dateline,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (fromName != null) {
      _result.fromName = fromName;
    }
    if (money != null) {
      _result.money = money;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    return _result;
  }
  factory BodyRoomPackageRecords_RecordItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BodyRoomPackageRecords_RecordItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BodyRoomPackageRecords_RecordItem clone() =>
      BodyRoomPackageRecords_RecordItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BodyRoomPackageRecords_RecordItem copyWith(
          void Function(BodyRoomPackageRecords_RecordItem) updates) =>
      super.copyWith((message) =>
              updates(message as BodyRoomPackageRecords_RecordItem))
          as BodyRoomPackageRecords_RecordItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BodyRoomPackageRecords_RecordItem create() =>
      BodyRoomPackageRecords_RecordItem._();
  BodyRoomPackageRecords_RecordItem createEmptyInstance() => create();
  static $pb.PbList<BodyRoomPackageRecords_RecordItem> createRepeated() =>
      $pb.PbList<BodyRoomPackageRecords_RecordItem>();
  @$core.pragma('dart2js:noInline')
  static BodyRoomPackageRecords_RecordItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BodyRoomPackageRecords_RecordItem>(
          create);
  static BodyRoomPackageRecords_RecordItem? _defaultInstance;

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
  $core.int get uid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

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
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get fromName => $_getSZ(4);
  @$pb.TagNumber(5)
  set fromName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFromName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFromName() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get money => $_getIZ(5);
  @$pb.TagNumber(6)
  set money($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMoney() => $_has(5);
  @$pb.TagNumber(6)
  void clearMoney() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get dateline => $_getIZ(6);
  @$pb.TagNumber(7)
  set dateline($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDateline() => $_has(6);
  @$pb.TagNumber(7)
  void clearDateline() => clearField(7);
}

class BodyRoomPackageRecords extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BodyRoomPackageRecords',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<BodyRoomPackageRecords_RecordItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: BodyRoomPackageRecords_RecordItem.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastId',
        $pb.PbFieldType.OU3)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore')
    ..hasRequiredFields = false;

  BodyRoomPackageRecords._() : super();
  factory BodyRoomPackageRecords({
    $core.Iterable<BodyRoomPackageRecords_RecordItem>? list,
    $core.int? lastId,
    $core.bool? hasMore,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (lastId != null) {
      _result.lastId = lastId;
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    return _result;
  }
  factory BodyRoomPackageRecords.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BodyRoomPackageRecords.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BodyRoomPackageRecords clone() =>
      BodyRoomPackageRecords()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BodyRoomPackageRecords copyWith(
          void Function(BodyRoomPackageRecords) updates) =>
      super.copyWith((message) => updates(message as BodyRoomPackageRecords))
          as BodyRoomPackageRecords; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BodyRoomPackageRecords create() => BodyRoomPackageRecords._();
  BodyRoomPackageRecords createEmptyInstance() => create();
  static $pb.PbList<BodyRoomPackageRecords> createRepeated() =>
      $pb.PbList<BodyRoomPackageRecords>();
  @$core.pragma('dart2js:noInline')
  static BodyRoomPackageRecords getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BodyRoomPackageRecords>(create);
  static BodyRoomPackageRecords? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BodyRoomPackageRecords_RecordItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get lastId => $_getIZ(1);
  @$pb.TagNumber(2)
  set lastId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLastId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get hasMore => $_getBF(2);
  @$pb.TagNumber(3)
  set hasMore($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHasMore() => $_has(2);
  @$pb.TagNumber(3)
  void clearHasMore() => clearField(3);
}

class RspRoomPackageRecords extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspRoomPackageRecords',
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
    ..aOM<BodyRoomPackageRecords>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BodyRoomPackageRecords.create)
    ..hasRequiredFields = false;

  RspRoomPackageRecords._() : super();
  factory RspRoomPackageRecords({
    $core.bool? success,
    $core.String? msg,
    BodyRoomPackageRecords? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory RspRoomPackageRecords.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspRoomPackageRecords.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspRoomPackageRecords clone() =>
      RspRoomPackageRecords()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspRoomPackageRecords copyWith(
          void Function(RspRoomPackageRecords) updates) =>
      super.copyWith((message) => updates(message as RspRoomPackageRecords))
          as RspRoomPackageRecords; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspRoomPackageRecords create() => RspRoomPackageRecords._();
  RspRoomPackageRecords createEmptyInstance() => create();
  static $pb.PbList<RspRoomPackageRecords> createRepeated() =>
      $pb.PbList<RspRoomPackageRecords>();
  @$core.pragma('dart2js:noInline')
  static RspRoomPackageRecords getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RspRoomPackageRecords>(create);
  static RspRoomPackageRecords? _defaultInstance;

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
  BodyRoomPackageRecords get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BodyRoomPackageRecords v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BodyRoomPackageRecords ensureData() => $_ensure(2);
}
