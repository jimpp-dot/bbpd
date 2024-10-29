///
//  Generated code. Do not modify.
//  source: room_box.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomBoxNotify extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomBoxNotify',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'close',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomBoxNotify._() : super();
  factory RoomBoxNotify({
    $core.String? type,
    $core.String? url,
    $core.int? close,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (url != null) {
      _result.url = url;
    }
    if (close != null) {
      _result.close = close;
    }
    return _result;
  }
  factory RoomBoxNotify.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomBoxNotify.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomBoxNotify clone() => RoomBoxNotify()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomBoxNotify copyWith(void Function(RoomBoxNotify) updates) =>
      super.copyWith((message) => updates(message as RoomBoxNotify))
          as RoomBoxNotify; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomBoxNotify create() => RoomBoxNotify._();
  RoomBoxNotify createEmptyInstance() => create();
  static $pb.PbList<RoomBoxNotify> createRepeated() =>
      $pb.PbList<RoomBoxNotify>();
  @$core.pragma('dart2js:noInline')
  static RoomBoxNotify getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomBoxNotify>(create);
  static RoomBoxNotify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get close => $_getIZ(2);
  @$pb.TagNumber(3)
  set close($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasClose() => $_has(2);
  @$pb.TagNumber(3)
  void clearClose() => clearField(3);
}

class AnnualPartyRoomBoxInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnnualPartyRoomBoxInfo',
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
            : 'totalNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endTime',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  AnnualPartyRoomBoxInfo._() : super();
  factory AnnualPartyRoomBoxInfo({
    $core.int? id,
    $core.int? totalNum,
    $core.int? leftNum,
    $core.int? status,
    $core.int? endTime,
    $core.String? icon,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (totalNum != null) {
      _result.totalNum = totalNum;
    }
    if (leftNum != null) {
      _result.leftNum = leftNum;
    }
    if (status != null) {
      _result.status = status;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory AnnualPartyRoomBoxInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnnualPartyRoomBoxInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnnualPartyRoomBoxInfo clone() =>
      AnnualPartyRoomBoxInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnnualPartyRoomBoxInfo copyWith(
          void Function(AnnualPartyRoomBoxInfo) updates) =>
      super.copyWith((message) => updates(message as AnnualPartyRoomBoxInfo))
          as AnnualPartyRoomBoxInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnnualPartyRoomBoxInfo create() => AnnualPartyRoomBoxInfo._();
  AnnualPartyRoomBoxInfo createEmptyInstance() => create();
  static $pb.PbList<AnnualPartyRoomBoxInfo> createRepeated() =>
      $pb.PbList<AnnualPartyRoomBoxInfo>();
  @$core.pragma('dart2js:noInline')
  static AnnualPartyRoomBoxInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnnualPartyRoomBoxInfo>(create);
  static AnnualPartyRoomBoxInfo? _defaultInstance;

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
  $core.int get totalNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTotalNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get leftNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set leftNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLeftNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeftNum() => clearField(3);

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

  @$pb.TagNumber(5)
  $core.int get endTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set endTime($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasEndTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get icon => $_getSZ(5);
  @$pb.TagNumber(6)
  set icon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearIcon() => clearField(6);
}

class ApiAnnualPartyRoomBoxRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiAnnualPartyRoomBoxRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<AnnualPartyRoomBoxInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boxInfo',
        subBuilder: AnnualPartyRoomBoxInfo.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'actUrl')
    ..hasRequiredFields = false;

  ApiAnnualPartyRoomBoxRsp_Data._() : super();
  factory ApiAnnualPartyRoomBoxRsp_Data({
    AnnualPartyRoomBoxInfo? boxInfo,
    $core.String? actUrl,
  }) {
    final _result = create();
    if (boxInfo != null) {
      _result.boxInfo = boxInfo;
    }
    if (actUrl != null) {
      _result.actUrl = actUrl;
    }
    return _result;
  }
  factory ApiAnnualPartyRoomBoxRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiAnnualPartyRoomBoxRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiAnnualPartyRoomBoxRsp_Data clone() =>
      ApiAnnualPartyRoomBoxRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiAnnualPartyRoomBoxRsp_Data copyWith(
          void Function(ApiAnnualPartyRoomBoxRsp_Data) updates) =>
      super.copyWith(
              (message) => updates(message as ApiAnnualPartyRoomBoxRsp_Data))
          as ApiAnnualPartyRoomBoxRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiAnnualPartyRoomBoxRsp_Data create() =>
      ApiAnnualPartyRoomBoxRsp_Data._();
  ApiAnnualPartyRoomBoxRsp_Data createEmptyInstance() => create();
  static $pb.PbList<ApiAnnualPartyRoomBoxRsp_Data> createRepeated() =>
      $pb.PbList<ApiAnnualPartyRoomBoxRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static ApiAnnualPartyRoomBoxRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiAnnualPartyRoomBoxRsp_Data>(create);
  static ApiAnnualPartyRoomBoxRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  AnnualPartyRoomBoxInfo get boxInfo => $_getN(0);
  @$pb.TagNumber(1)
  set boxInfo(AnnualPartyRoomBoxInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBoxInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoxInfo() => clearField(1);
  @$pb.TagNumber(1)
  AnnualPartyRoomBoxInfo ensureBoxInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get actUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set actUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasActUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearActUrl() => clearField(2);
}

class ApiAnnualPartyRoomBoxRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiAnnualPartyRoomBoxRsp',
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
    ..aOM<ApiAnnualPartyRoomBoxRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ApiAnnualPartyRoomBoxRsp_Data.create)
    ..hasRequiredFields = false;

  ApiAnnualPartyRoomBoxRsp._() : super();
  factory ApiAnnualPartyRoomBoxRsp({
    $core.bool? success,
    $core.String? message,
    ApiAnnualPartyRoomBoxRsp_Data? data,
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
  factory ApiAnnualPartyRoomBoxRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiAnnualPartyRoomBoxRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiAnnualPartyRoomBoxRsp clone() =>
      ApiAnnualPartyRoomBoxRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiAnnualPartyRoomBoxRsp copyWith(
          void Function(ApiAnnualPartyRoomBoxRsp) updates) =>
      super.copyWith((message) => updates(message as ApiAnnualPartyRoomBoxRsp))
          as ApiAnnualPartyRoomBoxRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiAnnualPartyRoomBoxRsp create() => ApiAnnualPartyRoomBoxRsp._();
  ApiAnnualPartyRoomBoxRsp createEmptyInstance() => create();
  static $pb.PbList<ApiAnnualPartyRoomBoxRsp> createRepeated() =>
      $pb.PbList<ApiAnnualPartyRoomBoxRsp>();
  @$core.pragma('dart2js:noInline')
  static ApiAnnualPartyRoomBoxRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiAnnualPartyRoomBoxRsp>(create);
  static ApiAnnualPartyRoomBoxRsp? _defaultInstance;

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
  ApiAnnualPartyRoomBoxRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ApiAnnualPartyRoomBoxRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ApiAnnualPartyRoomBoxRsp_Data ensureData() => $_ensure(2);
}

class AnnualPartyOpenRoomBoxRwdMeta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnnualPartyOpenRoomBoxRwdMeta',
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
            : 'day',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typ')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  AnnualPartyOpenRoomBoxRwdMeta._() : super();
  factory AnnualPartyOpenRoomBoxRwdMeta({
    $core.int? id,
    $core.String? name,
    $core.String? icon,
    $core.int? day,
    $core.int? num,
    $core.String? typ,
    $core.String? desc,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (day != null) {
      _result.day = day;
    }
    if (num != null) {
      _result.num = num;
    }
    if (typ != null) {
      _result.typ = typ;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory AnnualPartyOpenRoomBoxRwdMeta.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnnualPartyOpenRoomBoxRwdMeta.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnnualPartyOpenRoomBoxRwdMeta clone() =>
      AnnualPartyOpenRoomBoxRwdMeta()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnnualPartyOpenRoomBoxRwdMeta copyWith(
          void Function(AnnualPartyOpenRoomBoxRwdMeta) updates) =>
      super.copyWith(
              (message) => updates(message as AnnualPartyOpenRoomBoxRwdMeta))
          as AnnualPartyOpenRoomBoxRwdMeta; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnnualPartyOpenRoomBoxRwdMeta create() =>
      AnnualPartyOpenRoomBoxRwdMeta._();
  AnnualPartyOpenRoomBoxRwdMeta createEmptyInstance() => create();
  static $pb.PbList<AnnualPartyOpenRoomBoxRwdMeta> createRepeated() =>
      $pb.PbList<AnnualPartyOpenRoomBoxRwdMeta>();
  @$core.pragma('dart2js:noInline')
  static AnnualPartyOpenRoomBoxRwdMeta getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnnualPartyOpenRoomBoxRwdMeta>(create);
  static AnnualPartyOpenRoomBoxRwdMeta? _defaultInstance;

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
  $core.int get day => $_getIZ(3);
  @$pb.TagNumber(4)
  set day($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDay() => $_has(3);
  @$pb.TagNumber(4)
  void clearDay() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get num => $_getIZ(4);
  @$pb.TagNumber(5)
  set num($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get typ => $_getSZ(5);
  @$pb.TagNumber(6)
  set typ($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTyp() => $_has(5);
  @$pb.TagNumber(6)
  void clearTyp() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get desc => $_getSZ(6);
  @$pb.TagNumber(7)
  set desc($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDesc() => $_has(6);
  @$pb.TagNumber(7)
  void clearDesc() => clearField(7);
}

class ApiAnnualPartyOpenRoomBoxRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiAnnualPartyOpenRoomBoxRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<AnnualPartyOpenRoomBoxRwdMeta>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityInfo',
        subBuilder: AnnualPartyOpenRoomBoxRwdMeta.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'actUrl')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isOpened')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ApiAnnualPartyOpenRoomBoxRsp_Data._() : super();
  factory ApiAnnualPartyOpenRoomBoxRsp_Data({
    AnnualPartyOpenRoomBoxRwdMeta? commodityInfo,
    $core.String? actUrl,
    $core.bool? isOpened,
    $core.int? status,
  }) {
    final _result = create();
    if (commodityInfo != null) {
      _result.commodityInfo = commodityInfo;
    }
    if (actUrl != null) {
      _result.actUrl = actUrl;
    }
    if (isOpened != null) {
      _result.isOpened = isOpened;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory ApiAnnualPartyOpenRoomBoxRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiAnnualPartyOpenRoomBoxRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiAnnualPartyOpenRoomBoxRsp_Data clone() =>
      ApiAnnualPartyOpenRoomBoxRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiAnnualPartyOpenRoomBoxRsp_Data copyWith(
          void Function(ApiAnnualPartyOpenRoomBoxRsp_Data) updates) =>
      super.copyWith((message) =>
              updates(message as ApiAnnualPartyOpenRoomBoxRsp_Data))
          as ApiAnnualPartyOpenRoomBoxRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiAnnualPartyOpenRoomBoxRsp_Data create() =>
      ApiAnnualPartyOpenRoomBoxRsp_Data._();
  ApiAnnualPartyOpenRoomBoxRsp_Data createEmptyInstance() => create();
  static $pb.PbList<ApiAnnualPartyOpenRoomBoxRsp_Data> createRepeated() =>
      $pb.PbList<ApiAnnualPartyOpenRoomBoxRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static ApiAnnualPartyOpenRoomBoxRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiAnnualPartyOpenRoomBoxRsp_Data>(
          create);
  static ApiAnnualPartyOpenRoomBoxRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  AnnualPartyOpenRoomBoxRwdMeta get commodityInfo => $_getN(0);
  @$pb.TagNumber(1)
  set commodityInfo(AnnualPartyOpenRoomBoxRwdMeta v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCommodityInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommodityInfo() => clearField(1);
  @$pb.TagNumber(1)
  AnnualPartyOpenRoomBoxRwdMeta ensureCommodityInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get actUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set actUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasActUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearActUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isOpened => $_getBF(2);
  @$pb.TagNumber(3)
  set isOpened($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsOpened() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsOpened() => clearField(3);

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

class ApiAnnualPartyOpenRoomBoxRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiAnnualPartyOpenRoomBoxRsp',
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
    ..aOM<ApiAnnualPartyOpenRoomBoxRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ApiAnnualPartyOpenRoomBoxRsp_Data.create)
    ..hasRequiredFields = false;

  ApiAnnualPartyOpenRoomBoxRsp._() : super();
  factory ApiAnnualPartyOpenRoomBoxRsp({
    $core.bool? success,
    $core.String? message,
    ApiAnnualPartyOpenRoomBoxRsp_Data? data,
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
  factory ApiAnnualPartyOpenRoomBoxRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiAnnualPartyOpenRoomBoxRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiAnnualPartyOpenRoomBoxRsp clone() =>
      ApiAnnualPartyOpenRoomBoxRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiAnnualPartyOpenRoomBoxRsp copyWith(
          void Function(ApiAnnualPartyOpenRoomBoxRsp) updates) =>
      super.copyWith(
              (message) => updates(message as ApiAnnualPartyOpenRoomBoxRsp))
          as ApiAnnualPartyOpenRoomBoxRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiAnnualPartyOpenRoomBoxRsp create() =>
      ApiAnnualPartyOpenRoomBoxRsp._();
  ApiAnnualPartyOpenRoomBoxRsp createEmptyInstance() => create();
  static $pb.PbList<ApiAnnualPartyOpenRoomBoxRsp> createRepeated() =>
      $pb.PbList<ApiAnnualPartyOpenRoomBoxRsp>();
  @$core.pragma('dart2js:noInline')
  static ApiAnnualPartyOpenRoomBoxRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiAnnualPartyOpenRoomBoxRsp>(create);
  static ApiAnnualPartyOpenRoomBoxRsp? _defaultInstance;

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
  ApiAnnualPartyOpenRoomBoxRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ApiAnnualPartyOpenRoomBoxRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ApiAnnualPartyOpenRoomBoxRsp_Data ensureData() => $_ensure(2);
}

class BroadcastAnnualPartyRoomBox extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcastAnnualPartyRoomBox',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<AnnualPartyRoomBoxInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boxInfo',
        subBuilder: AnnualPartyRoomBoxInfo.create)
    ..hasRequiredFields = false;

  BroadcastAnnualPartyRoomBox._() : super();
  factory BroadcastAnnualPartyRoomBox({
    AnnualPartyRoomBoxInfo? boxInfo,
  }) {
    final _result = create();
    if (boxInfo != null) {
      _result.boxInfo = boxInfo;
    }
    return _result;
  }
  factory BroadcastAnnualPartyRoomBox.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcastAnnualPartyRoomBox.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyRoomBox clone() =>
      BroadcastAnnualPartyRoomBox()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcastAnnualPartyRoomBox copyWith(
          void Function(BroadcastAnnualPartyRoomBox) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcastAnnualPartyRoomBox))
          as BroadcastAnnualPartyRoomBox; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyRoomBox create() =>
      BroadcastAnnualPartyRoomBox._();
  BroadcastAnnualPartyRoomBox createEmptyInstance() => create();
  static $pb.PbList<BroadcastAnnualPartyRoomBox> createRepeated() =>
      $pb.PbList<BroadcastAnnualPartyRoomBox>();
  @$core.pragma('dart2js:noInline')
  static BroadcastAnnualPartyRoomBox getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastAnnualPartyRoomBox>(create);
  static BroadcastAnnualPartyRoomBox? _defaultInstance;

  @$pb.TagNumber(1)
  AnnualPartyRoomBoxInfo get boxInfo => $_getN(0);
  @$pb.TagNumber(1)
  set boxInfo(AnnualPartyRoomBoxInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBoxInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoxInfo() => clearField(1);
  @$pb.TagNumber(1)
  AnnualPartyRoomBoxInfo ensureBoxInfo() => $_ensure(0);
}
