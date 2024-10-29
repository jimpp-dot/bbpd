///
//  Generated code. Do not modify.
//  source: dispatch_order.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResDispatchOrder extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResDispatchOrder',
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
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data')
    ..hasRequiredFields = false;

  ResDispatchOrder._() : super();
  factory ResDispatchOrder({
    $core.bool? success,
    $core.String? msg,
    $core.String? data,
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
  factory ResDispatchOrder.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResDispatchOrder.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResDispatchOrder clone() => ResDispatchOrder()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResDispatchOrder copyWith(void Function(ResDispatchOrder) updates) =>
      super.copyWith((message) => updates(message as ResDispatchOrder))
          as ResDispatchOrder; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResDispatchOrder create() => ResDispatchOrder._();
  ResDispatchOrder createEmptyInstance() => create();
  static $pb.PbList<ResDispatchOrder> createRepeated() =>
      $pb.PbList<ResDispatchOrder>();
  @$core.pragma('dart2js:noInline')
  static ResDispatchOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResDispatchOrder>(create);
  static ResDispatchOrder? _defaultInstance;

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
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(3)
  set data($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}

class ResDispatchOrderDemand extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResDispatchOrderDemand',
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
    ..aOM<ResDispatchOrderDemandData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResDispatchOrderDemandData.create)
    ..hasRequiredFields = false;

  ResDispatchOrderDemand._() : super();
  factory ResDispatchOrderDemand({
    $core.bool? success,
    $core.String? msg,
    ResDispatchOrderDemandData? data,
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
  factory ResDispatchOrderDemand.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResDispatchOrderDemand.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResDispatchOrderDemand clone() =>
      ResDispatchOrderDemand()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResDispatchOrderDemand copyWith(
          void Function(ResDispatchOrderDemand) updates) =>
      super.copyWith((message) => updates(message as ResDispatchOrderDemand))
          as ResDispatchOrderDemand; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResDispatchOrderDemand create() => ResDispatchOrderDemand._();
  ResDispatchOrderDemand createEmptyInstance() => create();
  static $pb.PbList<ResDispatchOrderDemand> createRepeated() =>
      $pb.PbList<ResDispatchOrderDemand>();
  @$core.pragma('dart2js:noInline')
  static ResDispatchOrderDemand getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResDispatchOrderDemand>(create);
  static ResDispatchOrderDemand? _defaultInstance;

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
  ResDispatchOrderDemandData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ResDispatchOrderDemandData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ResDispatchOrderDemandData ensureData() => $_ensure(2);
}

class ResDispatchOrderDemandData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResDispatchOrderDemandData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..hasRequiredFields = false;

  ResDispatchOrderDemandData._() : super();
  factory ResDispatchOrderDemandData({
    $core.int? rid,
    $core.String? category,
    $core.int? sex,
    $core.String? description,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (category != null) {
      _result.category = category;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory ResDispatchOrderDemandData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResDispatchOrderDemandData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResDispatchOrderDemandData clone() =>
      ResDispatchOrderDemandData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResDispatchOrderDemandData copyWith(
          void Function(ResDispatchOrderDemandData) updates) =>
      super.copyWith(
              (message) => updates(message as ResDispatchOrderDemandData))
          as ResDispatchOrderDemandData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResDispatchOrderDemandData create() => ResDispatchOrderDemandData._();
  ResDispatchOrderDemandData createEmptyInstance() => create();
  static $pb.PbList<ResDispatchOrderDemandData> createRepeated() =>
      $pb.PbList<ResDispatchOrderDemandData>();
  @$core.pragma('dart2js:noInline')
  static ResDispatchOrderDemandData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResDispatchOrderDemandData>(create);
  static ResDispatchOrderDemandData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get category => $_getSZ(1);
  @$pb.TagNumber(2)
  set category($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategory() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get sex => $_getIZ(2);
  @$pb.TagNumber(3)
  set sex($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSex() => $_has(2);
  @$pb.TagNumber(3)
  void clearSex() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);
}

class ResDispatchOrderSocketDemand extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResDispatchOrderSocketDemand',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<ResDispatchOrderSocketDemandData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomOrder',
        subBuilder: ResDispatchOrderSocketDemandData.create)
    ..hasRequiredFields = false;

  ResDispatchOrderSocketDemand._() : super();
  factory ResDispatchOrderSocketDemand({
    ResDispatchOrderSocketDemandData? roomOrder,
  }) {
    final _result = create();
    if (roomOrder != null) {
      _result.roomOrder = roomOrder;
    }
    return _result;
  }
  factory ResDispatchOrderSocketDemand.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResDispatchOrderSocketDemand.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResDispatchOrderSocketDemand clone() =>
      ResDispatchOrderSocketDemand()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResDispatchOrderSocketDemand copyWith(
          void Function(ResDispatchOrderSocketDemand) updates) =>
      super.copyWith(
              (message) => updates(message as ResDispatchOrderSocketDemand))
          as ResDispatchOrderSocketDemand; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResDispatchOrderSocketDemand create() =>
      ResDispatchOrderSocketDemand._();
  ResDispatchOrderSocketDemand createEmptyInstance() => create();
  static $pb.PbList<ResDispatchOrderSocketDemand> createRepeated() =>
      $pb.PbList<ResDispatchOrderSocketDemand>();
  @$core.pragma('dart2js:noInline')
  static ResDispatchOrderSocketDemand getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResDispatchOrderSocketDemand>(create);
  static ResDispatchOrderSocketDemand? _defaultInstance;

  @$pb.TagNumber(1)
  ResDispatchOrderSocketDemandData get roomOrder => $_getN(0);
  @$pb.TagNumber(1)
  set roomOrder(ResDispatchOrderSocketDemandData v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoomOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomOrder() => clearField(1);
  @$pb.TagNumber(1)
  ResDispatchOrderSocketDemandData ensureRoomOrder() => $_ensure(0);
}

class ResDispatchOrderSocketDemandData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResDispatchOrderSocketDemandData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showDemandIndex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ResDispatchOrderSocketDemandData._() : super();
  factory ResDispatchOrderSocketDemandData({
    $core.int? showDemandIndex,
  }) {
    final _result = create();
    if (showDemandIndex != null) {
      _result.showDemandIndex = showDemandIndex;
    }
    return _result;
  }
  factory ResDispatchOrderSocketDemandData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResDispatchOrderSocketDemandData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResDispatchOrderSocketDemandData clone() =>
      ResDispatchOrderSocketDemandData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResDispatchOrderSocketDemandData copyWith(
          void Function(ResDispatchOrderSocketDemandData) updates) =>
      super.copyWith(
              (message) => updates(message as ResDispatchOrderSocketDemandData))
          as ResDispatchOrderSocketDemandData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResDispatchOrderSocketDemandData create() =>
      ResDispatchOrderSocketDemandData._();
  ResDispatchOrderSocketDemandData createEmptyInstance() => create();
  static $pb.PbList<ResDispatchOrderSocketDemandData> createRepeated() =>
      $pb.PbList<ResDispatchOrderSocketDemandData>();
  @$core.pragma('dart2js:noInline')
  static ResDispatchOrderSocketDemandData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResDispatchOrderSocketDemandData>(
          create);
  static ResDispatchOrderSocketDemandData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get showDemandIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set showDemandIndex($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShowDemandIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowDemandIndex() => clearField(1);
}
