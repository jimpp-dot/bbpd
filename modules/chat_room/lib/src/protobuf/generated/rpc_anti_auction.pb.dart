///
//  Generated code. Do not modify.
//  source: rpc_anti_auction.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ReqCheckIdCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqCheckIdCard',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ai')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'idNum',
        protoName: 'idNum')
    ..hasRequiredFields = false;

  ReqCheckIdCard._() : super();
  factory ReqCheckIdCard({
    $core.String? ai,
    $core.String? name,
    $core.String? idNum,
  }) {
    final _result = create();
    if (ai != null) {
      _result.ai = ai;
    }
    if (name != null) {
      _result.name = name;
    }
    if (idNum != null) {
      _result.idNum = idNum;
    }
    return _result;
  }
  factory ReqCheckIdCard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqCheckIdCard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqCheckIdCard clone() => ReqCheckIdCard()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqCheckIdCard copyWith(void Function(ReqCheckIdCard) updates) =>
      super.copyWith((message) => updates(message as ReqCheckIdCard))
          as ReqCheckIdCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqCheckIdCard create() => ReqCheckIdCard._();
  ReqCheckIdCard createEmptyInstance() => create();
  static $pb.PbList<ReqCheckIdCard> createRepeated() =>
      $pb.PbList<ReqCheckIdCard>();
  @$core.pragma('dart2js:noInline')
  static ReqCheckIdCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqCheckIdCard>(create);
  static ReqCheckIdCard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ai => $_getSZ(0);
  @$pb.TagNumber(1)
  set ai($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAi() => $_has(0);
  @$pb.TagNumber(1)
  void clearAi() => clearField(1);

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
  $core.String get idNum => $_getSZ(2);
  @$pb.TagNumber(3)
  set idNum($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIdNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearIdNum() => clearField(3);
}

class IdCardData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'IdCardData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pi')
    ..hasRequiredFields = false;

  IdCardData._() : super();
  factory IdCardData({
    $core.int? status,
    $core.String? pi,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (pi != null) {
      _result.pi = pi;
    }
    return _result;
  }
  factory IdCardData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IdCardData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IdCardData clone() => IdCardData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IdCardData copyWith(void Function(IdCardData) updates) =>
      super.copyWith((message) => updates(message as IdCardData))
          as IdCardData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IdCardData create() => IdCardData._();
  IdCardData createEmptyInstance() => create();
  static $pb.PbList<IdCardData> createRepeated() => $pb.PbList<IdCardData>();
  @$core.pragma('dart2js:noInline')
  static IdCardData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IdCardData>(create);
  static IdCardData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get pi => $_getSZ(1);
  @$pb.TagNumber(2)
  set pi($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPi() => $_has(1);
  @$pb.TagNumber(2)
  void clearPi() => clearField(2);
}

class ResCheckIdCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResCheckIdCard',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Success',
        protoName: 'Success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Message',
        protoName: 'Message')
    ..aOM<IdCardData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: IdCardData.create)
    ..hasRequiredFields = false;

  ResCheckIdCard._() : super();
  factory ResCheckIdCard({
    $core.bool? success,
    $core.String? message,
    IdCardData? data,
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
  factory ResCheckIdCard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResCheckIdCard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResCheckIdCard clone() => ResCheckIdCard()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResCheckIdCard copyWith(void Function(ResCheckIdCard) updates) =>
      super.copyWith((message) => updates(message as ResCheckIdCard))
          as ResCheckIdCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResCheckIdCard create() => ResCheckIdCard._();
  ResCheckIdCard createEmptyInstance() => create();
  static $pb.PbList<ResCheckIdCard> createRepeated() =>
      $pb.PbList<ResCheckIdCard>();
  @$core.pragma('dart2js:noInline')
  static ResCheckIdCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResCheckIdCard>(create);
  static ResCheckIdCard? _defaultInstance;

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
  IdCardData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(IdCardData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  IdCardData ensureData() => $_ensure(2);
}

class ReqQueryIdCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqQueryIdCard',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ai')
    ..hasRequiredFields = false;

  ReqQueryIdCard._() : super();
  factory ReqQueryIdCard({
    $core.String? ai,
  }) {
    final _result = create();
    if (ai != null) {
      _result.ai = ai;
    }
    return _result;
  }
  factory ReqQueryIdCard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqQueryIdCard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqQueryIdCard clone() => ReqQueryIdCard()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqQueryIdCard copyWith(void Function(ReqQueryIdCard) updates) =>
      super.copyWith((message) => updates(message as ReqQueryIdCard))
          as ReqQueryIdCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqQueryIdCard create() => ReqQueryIdCard._();
  ReqQueryIdCard createEmptyInstance() => create();
  static $pb.PbList<ReqQueryIdCard> createRepeated() =>
      $pb.PbList<ReqQueryIdCard>();
  @$core.pragma('dart2js:noInline')
  static ReqQueryIdCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqQueryIdCard>(create);
  static ReqQueryIdCard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ai => $_getSZ(0);
  @$pb.TagNumber(1)
  set ai($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAi() => $_has(0);
  @$pb.TagNumber(1)
  void clearAi() => clearField(1);
}

class ResQueryIdCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResQueryIdCard',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Success',
        protoName: 'Success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Message',
        protoName: 'Message')
    ..aOM<IdCardData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: IdCardData.create)
    ..hasRequiredFields = false;

  ResQueryIdCard._() : super();
  factory ResQueryIdCard({
    $core.bool? success,
    $core.String? message,
    IdCardData? data,
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
  factory ResQueryIdCard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResQueryIdCard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResQueryIdCard clone() => ResQueryIdCard()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResQueryIdCard copyWith(void Function(ResQueryIdCard) updates) =>
      super.copyWith((message) => updates(message as ResQueryIdCard))
          as ResQueryIdCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResQueryIdCard create() => ResQueryIdCard._();
  ResQueryIdCard createEmptyInstance() => create();
  static $pb.PbList<ResQueryIdCard> createRepeated() =>
      $pb.PbList<ResQueryIdCard>();
  @$core.pragma('dart2js:noInline')
  static ResQueryIdCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResQueryIdCard>(create);
  static ResQueryIdCard? _defaultInstance;

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
  IdCardData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(IdCardData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  IdCardData ensureData() => $_ensure(2);
}

class WlcReportData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WlcReportData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'no',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'si')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bt',
        $pb.PbFieldType.O3)
    ..a<$fixnum.Int64>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ot',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ct',
        $pb.PbFieldType.O3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'di')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pi')
    ..hasRequiredFields = false;

  WlcReportData._() : super();
  factory WlcReportData({
    $core.int? no,
    $core.String? si,
    $core.int? bt,
    $fixnum.Int64? ot,
    $core.int? ct,
    $core.String? di,
    $core.String? pi,
  }) {
    final _result = create();
    if (no != null) {
      _result.no = no;
    }
    if (si != null) {
      _result.si = si;
    }
    if (bt != null) {
      _result.bt = bt;
    }
    if (ot != null) {
      _result.ot = ot;
    }
    if (ct != null) {
      _result.ct = ct;
    }
    if (di != null) {
      _result.di = di;
    }
    if (pi != null) {
      _result.pi = pi;
    }
    return _result;
  }
  factory WlcReportData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WlcReportData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WlcReportData clone() => WlcReportData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WlcReportData copyWith(void Function(WlcReportData) updates) =>
      super.copyWith((message) => updates(message as WlcReportData))
          as WlcReportData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WlcReportData create() => WlcReportData._();
  WlcReportData createEmptyInstance() => create();
  static $pb.PbList<WlcReportData> createRepeated() =>
      $pb.PbList<WlcReportData>();
  @$core.pragma('dart2js:noInline')
  static WlcReportData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WlcReportData>(create);
  static WlcReportData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get no => $_getIZ(0);
  @$pb.TagNumber(1)
  set no($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNo() => $_has(0);
  @$pb.TagNumber(1)
  void clearNo() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get si => $_getSZ(1);
  @$pb.TagNumber(2)
  set si($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSi() => $_has(1);
  @$pb.TagNumber(2)
  void clearSi() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get bt => $_getIZ(2);
  @$pb.TagNumber(3)
  set bt($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBt() => $_has(2);
  @$pb.TagNumber(3)
  void clearBt() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get ot => $_getI64(3);
  @$pb.TagNumber(4)
  set ot($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOt() => $_has(3);
  @$pb.TagNumber(4)
  void clearOt() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get ct => $_getIZ(4);
  @$pb.TagNumber(5)
  set ct($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCt() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get di => $_getSZ(5);
  @$pb.TagNumber(6)
  set di($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDi() => $_has(5);
  @$pb.TagNumber(6)
  void clearDi() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get pi => $_getSZ(6);
  @$pb.TagNumber(7)
  set pi($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPi() => $_has(6);
  @$pb.TagNumber(7)
  void clearPi() => clearField(7);
}

class ReqWlcReport extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqWlcReport',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<WlcReportData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'collections',
        $pb.PbFieldType.PM,
        subBuilder: WlcReportData.create)
    ..hasRequiredFields = false;

  ReqWlcReport._() : super();
  factory ReqWlcReport({
    $core.Iterable<WlcReportData>? collections,
  }) {
    final _result = create();
    if (collections != null) {
      _result.collections.addAll(collections);
    }
    return _result;
  }
  factory ReqWlcReport.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqWlcReport.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqWlcReport clone() => ReqWlcReport()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqWlcReport copyWith(void Function(ReqWlcReport) updates) =>
      super.copyWith((message) => updates(message as ReqWlcReport))
          as ReqWlcReport; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqWlcReport create() => ReqWlcReport._();
  ReqWlcReport createEmptyInstance() => create();
  static $pb.PbList<ReqWlcReport> createRepeated() =>
      $pb.PbList<ReqWlcReport>();
  @$core.pragma('dart2js:noInline')
  static ReqWlcReport getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqWlcReport>(create);
  static ReqWlcReport? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<WlcReportData> get collections => $_getList(0);
}

class ResWlcReport extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResWlcReport',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Success',
        protoName: 'Success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Message',
        protoName: 'Message')
    ..hasRequiredFields = false;

  ResWlcReport._() : super();
  factory ResWlcReport({
    $core.bool? success,
    $core.String? message,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory ResWlcReport.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResWlcReport.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResWlcReport clone() => ResWlcReport()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResWlcReport copyWith(void Function(ResWlcReport) updates) =>
      super.copyWith((message) => updates(message as ResWlcReport))
          as ResWlcReport; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResWlcReport create() => ResWlcReport._();
  ResWlcReport createEmptyInstance() => create();
  static $pb.PbList<ResWlcReport> createRepeated() =>
      $pb.PbList<ResWlcReport>();
  @$core.pragma('dart2js:noInline')
  static ResWlcReport getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResWlcReport>(create);
  static ResWlcReport? _defaultInstance;

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
}

class RPCAntiAuctionApi {
  $pb.RpcClient _client;
  RPCAntiAuctionApi(this._client);

  $async.Future<ResCheckIdCard> checkIdCard(
      $pb.ClientContext? ctx, ReqCheckIdCard request) {
    var emptyResponse = ResCheckIdCard();
    return _client.invoke<ResCheckIdCard>(
        ctx, 'RPCAntiAuction', 'CheckIdCard', request, emptyResponse);
  }

  $async.Future<ResQueryIdCard> queryIdCard(
      $pb.ClientContext? ctx, ReqQueryIdCard request) {
    var emptyResponse = ResQueryIdCard();
    return _client.invoke<ResQueryIdCard>(
        ctx, 'RPCAntiAuction', 'QueryIdCard', request, emptyResponse);
  }

  $async.Future<ResWlcReport> wlcReport(
      $pb.ClientContext? ctx, ReqWlcReport request) {
    var emptyResponse = ResWlcReport();
    return _client.invoke<ResWlcReport>(
        ctx, 'RPCAntiAuction', 'WlcReport', request, emptyResponse);
  }
}
