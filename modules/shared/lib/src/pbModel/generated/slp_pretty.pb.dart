///
//  Generated code. Do not modify.
//  source: slp_pretty.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PrettySellItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PrettySellItem',
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
            : 'prettyId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PrettySellItem._() : super();
  factory PrettySellItem({
    $core.int? id,
    $core.int? prettyId,
    $core.int? price,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (prettyId != null) {
      _result.prettyId = prettyId;
    }
    if (price != null) {
      _result.price = price;
    }
    return _result;
  }
  factory PrettySellItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrettySellItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrettySellItem clone() => PrettySellItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrettySellItem copyWith(void Function(PrettySellItem) updates) =>
      super.copyWith((message) => updates(message as PrettySellItem))
          as PrettySellItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PrettySellItem create() => PrettySellItem._();
  PrettySellItem createEmptyInstance() => create();
  static $pb.PbList<PrettySellItem> createRepeated() =>
      $pb.PbList<PrettySellItem>();
  @$core.pragma('dart2js:noInline')
  static PrettySellItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrettySellItem>(create);
  static PrettySellItem? _defaultInstance;

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
  $core.int get prettyId => $_getIZ(1);
  @$pb.TagNumber(2)
  set prettyId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrettyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrettyId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get price => $_getIZ(2);
  @$pb.TagNumber(3)
  set price($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);
}

class PrettySellMeInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PrettySellMeInfo',
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
    ..hasRequiredFields = false;

  PrettySellMeInfo._() : super();
  factory PrettySellMeInfo({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
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
    return _result;
  }
  factory PrettySellMeInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrettySellMeInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrettySellMeInfo clone() => PrettySellMeInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrettySellMeInfo copyWith(void Function(PrettySellMeInfo) updates) =>
      super.copyWith((message) => updates(message as PrettySellMeInfo))
          as PrettySellMeInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PrettySellMeInfo create() => PrettySellMeInfo._();
  PrettySellMeInfo createEmptyInstance() => create();
  static $pb.PbList<PrettySellMeInfo> createRepeated() =>
      $pb.PbList<PrettySellMeInfo>();
  @$core.pragma('dart2js:noInline')
  static PrettySellMeInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrettySellMeInfo>(create);
  static PrettySellMeInfo? _defaultInstance;

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
}

class PrettySellList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PrettySellList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<PrettySellMeInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'meInfo',
        protoName: 'meInfo',
        subBuilder: PrettySellMeInfo.create)
    ..pc<PrettySellItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prettyInfo',
        $pb.PbFieldType.PM,
        protoName: 'prettyInfo',
        subBuilder: PrettySellItem.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noticeText')
    ..hasRequiredFields = false;

  PrettySellList._() : super();
  factory PrettySellList({
    PrettySellMeInfo? meInfo,
    $core.Iterable<PrettySellItem>? prettyInfo,
    $core.String? noticeText,
  }) {
    final _result = create();
    if (meInfo != null) {
      _result.meInfo = meInfo;
    }
    if (prettyInfo != null) {
      _result.prettyInfo.addAll(prettyInfo);
    }
    if (noticeText != null) {
      _result.noticeText = noticeText;
    }
    return _result;
  }
  factory PrettySellList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrettySellList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrettySellList clone() => PrettySellList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrettySellList copyWith(void Function(PrettySellList) updates) =>
      super.copyWith((message) => updates(message as PrettySellList))
          as PrettySellList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PrettySellList create() => PrettySellList._();
  PrettySellList createEmptyInstance() => create();
  static $pb.PbList<PrettySellList> createRepeated() =>
      $pb.PbList<PrettySellList>();
  @$core.pragma('dart2js:noInline')
  static PrettySellList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrettySellList>(create);
  static PrettySellList? _defaultInstance;

  @$pb.TagNumber(1)
  PrettySellMeInfo get meInfo => $_getN(0);
  @$pb.TagNumber(1)
  set meInfo(PrettySellMeInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMeInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeInfo() => clearField(1);
  @$pb.TagNumber(1)
  PrettySellMeInfo ensureMeInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<PrettySellItem> get prettyInfo => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get noticeText => $_getSZ(2);
  @$pb.TagNumber(3)
  set noticeText($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNoticeText() => $_has(2);
  @$pb.TagNumber(3)
  void clearNoticeText() => clearField(3);
}

class ResPrettySellList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResPrettySellList',
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
    ..aOM<PrettySellList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PrettySellList.create)
    ..hasRequiredFields = false;

  ResPrettySellList._() : super();
  factory ResPrettySellList({
    $core.bool? success,
    $core.String? message,
    PrettySellList? data,
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
  factory ResPrettySellList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResPrettySellList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResPrettySellList clone() => ResPrettySellList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResPrettySellList copyWith(void Function(ResPrettySellList) updates) =>
      super.copyWith((message) => updates(message as ResPrettySellList))
          as ResPrettySellList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResPrettySellList create() => ResPrettySellList._();
  ResPrettySellList createEmptyInstance() => create();
  static $pb.PbList<ResPrettySellList> createRepeated() =>
      $pb.PbList<ResPrettySellList>();
  @$core.pragma('dart2js:noInline')
  static ResPrettySellList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResPrettySellList>(create);
  static ResPrettySellList? _defaultInstance;

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
  PrettySellList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(PrettySellList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  PrettySellList ensureData() => $_ensure(2);
}

class ResMyPrettyIdList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMyPrettyIdList',
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
    ..pc<PrettyIdInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: PrettyIdInfo.create)
    ..hasRequiredFields = false;

  ResMyPrettyIdList._() : super();
  factory ResMyPrettyIdList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<PrettyIdInfo>? data,
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
  factory ResMyPrettyIdList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMyPrettyIdList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMyPrettyIdList clone() => ResMyPrettyIdList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMyPrettyIdList copyWith(void Function(ResMyPrettyIdList) updates) =>
      super.copyWith((message) => updates(message as ResMyPrettyIdList))
          as ResMyPrettyIdList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMyPrettyIdList create() => ResMyPrettyIdList._();
  ResMyPrettyIdList createEmptyInstance() => create();
  static $pb.PbList<ResMyPrettyIdList> createRepeated() =>
      $pb.PbList<ResMyPrettyIdList>();
  @$core.pragma('dart2js:noInline')
  static ResMyPrettyIdList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMyPrettyIdList>(create);
  static ResMyPrettyIdList? _defaultInstance;

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
  $core.List<PrettyIdInfo> get data => $_getList(2);
}

class PrettyIdInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PrettyIdInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prettyId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endTime',
        $pb.PbFieldType.OU3)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isUse')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'period',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PrettyIdInfo._() : super();
  factory PrettyIdInfo({
    $core.int? prettyId,
    $core.int? startTime,
    $core.int? endTime,
    $core.bool? isUse,
    $core.int? type,
    $core.String? desc,
    $core.int? period,
  }) {
    final _result = create();
    if (prettyId != null) {
      _result.prettyId = prettyId;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    if (isUse != null) {
      _result.isUse = isUse;
    }
    if (type != null) {
      _result.type = type;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (period != null) {
      _result.period = period;
    }
    return _result;
  }
  factory PrettyIdInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrettyIdInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrettyIdInfo clone() => PrettyIdInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrettyIdInfo copyWith(void Function(PrettyIdInfo) updates) =>
      super.copyWith((message) => updates(message as PrettyIdInfo))
          as PrettyIdInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PrettyIdInfo create() => PrettyIdInfo._();
  PrettyIdInfo createEmptyInstance() => create();
  static $pb.PbList<PrettyIdInfo> createRepeated() =>
      $pb.PbList<PrettyIdInfo>();
  @$core.pragma('dart2js:noInline')
  static PrettyIdInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrettyIdInfo>(create);
  static PrettyIdInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get prettyId => $_getIZ(0);
  @$pb.TagNumber(1)
  set prettyId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrettyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrettyId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get startTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set startTime($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get endTime => $_getIZ(2);
  @$pb.TagNumber(3)
  set endTime($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isUse => $_getBF(3);
  @$pb.TagNumber(4)
  set isUse($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsUse() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsUse() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get type => $_getIZ(4);
  @$pb.TagNumber(5)
  set type($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get period => $_getIZ(6);
  @$pb.TagNumber(7)
  set period($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPeriod() => $_has(6);
  @$pb.TagNumber(7)
  void clearPeriod() => clearField(7);
}
