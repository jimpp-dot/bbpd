///
//  Generated code. Do not modify.
//  source: room_gift_suit.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class GetRoomFrameListResp_Tab_TabItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetRoomFrameListResp.Tab.TabItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showId',
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
            : 'img')
    ..aInt64(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'getTime')
    ..aInt64(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startTime')
    ..aInt64(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endTime')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wearState',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GetRoomFrameListResp_Tab_TabItem._() : super();
  factory GetRoomFrameListResp_Tab_TabItem({
    $core.int? showId,
    $core.String? name,
    $core.String? img,
    $fixnum.Int64? getTime,
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
    $core.int? wearState,
  }) {
    final _result = create();
    if (showId != null) {
      _result.showId = showId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (img != null) {
      _result.img = img;
    }
    if (getTime != null) {
      _result.getTime = getTime;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    if (wearState != null) {
      _result.wearState = wearState;
    }
    return _result;
  }
  factory GetRoomFrameListResp_Tab_TabItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetRoomFrameListResp_Tab_TabItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetRoomFrameListResp_Tab_TabItem clone() =>
      GetRoomFrameListResp_Tab_TabItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetRoomFrameListResp_Tab_TabItem copyWith(
          void Function(GetRoomFrameListResp_Tab_TabItem) updates) =>
      super.copyWith(
              (message) => updates(message as GetRoomFrameListResp_Tab_TabItem))
          as GetRoomFrameListResp_Tab_TabItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRoomFrameListResp_Tab_TabItem create() =>
      GetRoomFrameListResp_Tab_TabItem._();
  GetRoomFrameListResp_Tab_TabItem createEmptyInstance() => create();
  static $pb.PbList<GetRoomFrameListResp_Tab_TabItem> createRepeated() =>
      $pb.PbList<GetRoomFrameListResp_Tab_TabItem>();
  @$core.pragma('dart2js:noInline')
  static GetRoomFrameListResp_Tab_TabItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRoomFrameListResp_Tab_TabItem>(
          create);
  static GetRoomFrameListResp_Tab_TabItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get showId => $_getIZ(0);
  @$pb.TagNumber(1)
  set showId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShowId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowId() => clearField(1);

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
  $core.String get img => $_getSZ(2);
  @$pb.TagNumber(3)
  set img($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImg() => $_has(2);
  @$pb.TagNumber(3)
  void clearImg() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get getTime => $_getI64(3);
  @$pb.TagNumber(4)
  set getTime($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGetTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearGetTime() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get startTime => $_getI64(4);
  @$pb.TagNumber(5)
  set startTime($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStartTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearStartTime() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get endTime => $_getI64(5);
  @$pb.TagNumber(6)
  set endTime($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasEndTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearEndTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get wearState => $_getIZ(6);
  @$pb.TagNumber(7)
  set wearState($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasWearState() => $_has(6);
  @$pb.TagNumber(7)
  void clearWearState() => clearField(7);
}

class GetRoomFrameListResp_Tab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetRoomFrameListResp.Tab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..pc<GetRoomFrameListResp_Tab_TabItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: GetRoomFrameListResp_Tab_TabItem.create)
    ..hasRequiredFields = false;

  GetRoomFrameListResp_Tab._() : super();
  factory GetRoomFrameListResp_Tab({
    $core.int? tabId,
    $core.String? name,
    $core.Iterable<GetRoomFrameListResp_Tab_TabItem>? items,
  }) {
    final _result = create();
    if (tabId != null) {
      _result.tabId = tabId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory GetRoomFrameListResp_Tab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetRoomFrameListResp_Tab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetRoomFrameListResp_Tab clone() =>
      GetRoomFrameListResp_Tab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetRoomFrameListResp_Tab copyWith(
          void Function(GetRoomFrameListResp_Tab) updates) =>
      super.copyWith((message) => updates(message as GetRoomFrameListResp_Tab))
          as GetRoomFrameListResp_Tab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRoomFrameListResp_Tab create() => GetRoomFrameListResp_Tab._();
  GetRoomFrameListResp_Tab createEmptyInstance() => create();
  static $pb.PbList<GetRoomFrameListResp_Tab> createRepeated() =>
      $pb.PbList<GetRoomFrameListResp_Tab>();
  @$core.pragma('dart2js:noInline')
  static GetRoomFrameListResp_Tab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRoomFrameListResp_Tab>(create);
  static GetRoomFrameListResp_Tab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tabId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tabId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTabId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTabId() => clearField(1);

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
  $core.List<GetRoomFrameListResp_Tab_TabItem> get items => $_getList(2);
}

class GetRoomFrameListResp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetRoomFrameListResp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GetRoomFrameListResp_Tab>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabs',
        $pb.PbFieldType.PM,
        subBuilder: GetRoomFrameListResp_Tab.create)
    ..hasRequiredFields = false;

  GetRoomFrameListResp_Data._() : super();
  factory GetRoomFrameListResp_Data({
    $core.Iterable<GetRoomFrameListResp_Tab>? tabs,
  }) {
    final _result = create();
    if (tabs != null) {
      _result.tabs.addAll(tabs);
    }
    return _result;
  }
  factory GetRoomFrameListResp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetRoomFrameListResp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetRoomFrameListResp_Data clone() =>
      GetRoomFrameListResp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetRoomFrameListResp_Data copyWith(
          void Function(GetRoomFrameListResp_Data) updates) =>
      super.copyWith((message) => updates(message as GetRoomFrameListResp_Data))
          as GetRoomFrameListResp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRoomFrameListResp_Data create() => GetRoomFrameListResp_Data._();
  GetRoomFrameListResp_Data createEmptyInstance() => create();
  static $pb.PbList<GetRoomFrameListResp_Data> createRepeated() =>
      $pb.PbList<GetRoomFrameListResp_Data>();
  @$core.pragma('dart2js:noInline')
  static GetRoomFrameListResp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRoomFrameListResp_Data>(create);
  static GetRoomFrameListResp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GetRoomFrameListResp_Tab> get tabs => $_getList(0);
}

class GetRoomFrameListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetRoomFrameListResp',
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
    ..aOM<GetRoomFrameListResp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GetRoomFrameListResp_Data.create)
    ..hasRequiredFields = false;

  GetRoomFrameListResp._() : super();
  factory GetRoomFrameListResp({
    $core.bool? success,
    $core.String? msg,
    GetRoomFrameListResp_Data? data,
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
  factory GetRoomFrameListResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetRoomFrameListResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetRoomFrameListResp clone() =>
      GetRoomFrameListResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetRoomFrameListResp copyWith(void Function(GetRoomFrameListResp) updates) =>
      super.copyWith((message) => updates(message as GetRoomFrameListResp))
          as GetRoomFrameListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRoomFrameListResp create() => GetRoomFrameListResp._();
  GetRoomFrameListResp createEmptyInstance() => create();
  static $pb.PbList<GetRoomFrameListResp> createRepeated() =>
      $pb.PbList<GetRoomFrameListResp>();
  @$core.pragma('dart2js:noInline')
  static GetRoomFrameListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRoomFrameListResp>(create);
  static GetRoomFrameListResp? _defaultInstance;

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
  GetRoomFrameListResp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GetRoomFrameListResp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GetRoomFrameListResp_Data ensureData() => $_ensure(2);
}

class SetRoomFrameResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SetRoomFrameResp',
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
    ..hasRequiredFields = false;

  SetRoomFrameResp._() : super();
  factory SetRoomFrameResp({
    $core.bool? success,
    $core.String? msg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory SetRoomFrameResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SetRoomFrameResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SetRoomFrameResp clone() => SetRoomFrameResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SetRoomFrameResp copyWith(void Function(SetRoomFrameResp) updates) =>
      super.copyWith((message) => updates(message as SetRoomFrameResp))
          as SetRoomFrameResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetRoomFrameResp create() => SetRoomFrameResp._();
  SetRoomFrameResp createEmptyInstance() => create();
  static $pb.PbList<SetRoomFrameResp> createRepeated() =>
      $pb.PbList<SetRoomFrameResp>();
  @$core.pragma('dart2js:noInline')
  static SetRoomFrameResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetRoomFrameResp>(create);
  static SetRoomFrameResp? _defaultInstance;

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
}

class CancelRoomFrameResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CancelRoomFrameResp',
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
    ..hasRequiredFields = false;

  CancelRoomFrameResp._() : super();
  factory CancelRoomFrameResp({
    $core.bool? success,
    $core.String? msg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory CancelRoomFrameResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CancelRoomFrameResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CancelRoomFrameResp clone() => CancelRoomFrameResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CancelRoomFrameResp copyWith(void Function(CancelRoomFrameResp) updates) =>
      super.copyWith((message) => updates(message as CancelRoomFrameResp))
          as CancelRoomFrameResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CancelRoomFrameResp create() => CancelRoomFrameResp._();
  CancelRoomFrameResp createEmptyInstance() => create();
  static $pb.PbList<CancelRoomFrameResp> createRepeated() =>
      $pb.PbList<CancelRoomFrameResp>();
  @$core.pragma('dart2js:noInline')
  static CancelRoomFrameResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelRoomFrameResp>(create);
  static CancelRoomFrameResp? _defaultInstance;

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
}
