///
//  Generated code. Do not modify.
//  source: room_setting.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResRoomOption extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResRoomOption', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg')
    ..aOM<RoomOption>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: RoomOption.create)
    ..hasRequiredFields = false
  ;

  ResRoomOption._() : super();
  factory ResRoomOption({
    $core.bool? success,
    $core.String? msg,
    RoomOption? data,
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
  factory ResRoomOption.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResRoomOption.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResRoomOption clone() => ResRoomOption()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResRoomOption copyWith(void Function(ResRoomOption) updates) => super.copyWith((message) => updates(message as ResRoomOption)) as ResRoomOption; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomOption create() => ResRoomOption._();
  ResRoomOption createEmptyInstance() => create();
  static $pb.PbList<ResRoomOption> createRepeated() => $pb.PbList<ResRoomOption>();
  @$core.pragma('dart2js:noInline')
  static ResRoomOption getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResRoomOption>(create);
  static ResRoomOption? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  RoomOption get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomOption v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomOption ensureData() => $_ensure(2);
}

class RoomOption extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoomOption', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<RoomOptionData>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'baseItem', subBuilder: RoomOptionData.create)
    ..aOM<RoomOptionData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomSet', subBuilder: RoomOptionData.create)
    ..aOM<RoomOptionData>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'otherFunction', subBuilder: RoomOptionData.create)
    ..aOM<OptionSwitchData>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switchRoom', subBuilder: OptionSwitchData.create)
    ..aOM<RoomRcmdPlayingData>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recommendList', subBuilder: RoomRcmdPlayingData.create)
    ..hasRequiredFields = false
  ;

  RoomOption._() : super();
  factory RoomOption({
    RoomOptionData? baseItem,
    RoomOptionData? roomSet,
    RoomOptionData? otherFunction,
    OptionSwitchData? switchRoom,
    RoomRcmdPlayingData? recommendList,
  }) {
    final _result = create();
    if (baseItem != null) {
      _result.baseItem = baseItem;
    }
    if (roomSet != null) {
      _result.roomSet = roomSet;
    }
    if (otherFunction != null) {
      _result.otherFunction = otherFunction;
    }
    if (switchRoom != null) {
      _result.switchRoom = switchRoom;
    }
    if (recommendList != null) {
      _result.recommendList = recommendList;
    }
    return _result;
  }
  factory RoomOption.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomOption.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomOption clone() => RoomOption()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomOption copyWith(void Function(RoomOption) updates) => super.copyWith((message) => updates(message as RoomOption)) as RoomOption; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomOption create() => RoomOption._();
  RoomOption createEmptyInstance() => create();
  static $pb.PbList<RoomOption> createRepeated() => $pb.PbList<RoomOption>();
  @$core.pragma('dart2js:noInline')
  static RoomOption getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomOption>(create);
  static RoomOption? _defaultInstance;

  @$pb.TagNumber(1)
  RoomOptionData get baseItem => $_getN(0);
  @$pb.TagNumber(1)
  set baseItem(RoomOptionData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBaseItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearBaseItem() => clearField(1);
  @$pb.TagNumber(1)
  RoomOptionData ensureBaseItem() => $_ensure(0);

  @$pb.TagNumber(2)
  RoomOptionData get roomSet => $_getN(1);
  @$pb.TagNumber(2)
  set roomSet(RoomOptionData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomSet() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomSet() => clearField(2);
  @$pb.TagNumber(2)
  RoomOptionData ensureRoomSet() => $_ensure(1);

  @$pb.TagNumber(3)
  RoomOptionData get otherFunction => $_getN(2);
  @$pb.TagNumber(3)
  set otherFunction(RoomOptionData v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOtherFunction() => $_has(2);
  @$pb.TagNumber(3)
  void clearOtherFunction() => clearField(3);
  @$pb.TagNumber(3)
  RoomOptionData ensureOtherFunction() => $_ensure(2);

  @$pb.TagNumber(4)
  OptionSwitchData get switchRoom => $_getN(3);
  @$pb.TagNumber(4)
  set switchRoom(OptionSwitchData v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSwitchRoom() => $_has(3);
  @$pb.TagNumber(4)
  void clearSwitchRoom() => clearField(4);
  @$pb.TagNumber(4)
  OptionSwitchData ensureSwitchRoom() => $_ensure(3);

  @$pb.TagNumber(5)
  RoomRcmdPlayingData get recommendList => $_getN(4);
  @$pb.TagNumber(5)
  set recommendList(RoomRcmdPlayingData v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasRecommendList() => $_has(4);
  @$pb.TagNumber(5)
  void clearRecommendList() => clearField(5);
  @$pb.TagNumber(5)
  RoomRcmdPlayingData ensureRecommendList() => $_ensure(4);
}

class RoomOptionData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoomOptionData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..pc<RoomOptionItem>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: RoomOptionItem.create)
    ..hasRequiredFields = false
  ;

  RoomOptionData._() : super();
  factory RoomOptionData({
    $core.String? title,
    $core.Iterable<RoomOptionItem>? items,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory RoomOptionData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomOptionData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomOptionData clone() => RoomOptionData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomOptionData copyWith(void Function(RoomOptionData) updates) => super.copyWith((message) => updates(message as RoomOptionData)) as RoomOptionData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomOptionData create() => RoomOptionData._();
  RoomOptionData createEmptyInstance() => create();
  static $pb.PbList<RoomOptionData> createRepeated() => $pb.PbList<RoomOptionData>();
  @$core.pragma('dart2js:noInline')
  static RoomOptionData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomOptionData>(create);
  static RoomOptionData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<RoomOptionItem> get items => $_getList(1);
}

class RoomOptionItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoomOptionItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  RoomOptionItem._() : super();
  factory RoomOptionItem({
    $core.String? key,
    $core.String? name,
    $core.String? icon,
    $core.int? order,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (order != null) {
      _result.order = order;
    }
    return _result;
  }
  factory RoomOptionItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomOptionItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomOptionItem clone() => RoomOptionItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomOptionItem copyWith(void Function(RoomOptionItem) updates) => super.copyWith((message) => updates(message as RoomOptionItem)) as RoomOptionItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomOptionItem create() => RoomOptionItem._();
  RoomOptionItem createEmptyInstance() => create();
  static $pb.PbList<RoomOptionItem> createRepeated() => $pb.PbList<RoomOptionItem>();
  @$core.pragma('dart2js:noInline')
  static RoomOptionItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomOptionItem>(create);
  static RoomOptionItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get order => $_getIZ(3);
  @$pb.TagNumber(4)
  set order($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOrder() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrder() => clearField(4);
}

class OptionSwitchData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OptionSwitchData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..pc<OptionSwitchItem>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: OptionSwitchItem.create)
    ..hasRequiredFields = false
  ;

  OptionSwitchData._() : super();
  factory OptionSwitchData({
    $core.String? title,
    $core.Iterable<OptionSwitchItem>? items,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory OptionSwitchData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OptionSwitchData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OptionSwitchData clone() => OptionSwitchData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OptionSwitchData copyWith(void Function(OptionSwitchData) updates) => super.copyWith((message) => updates(message as OptionSwitchData)) as OptionSwitchData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OptionSwitchData create() => OptionSwitchData._();
  OptionSwitchData createEmptyInstance() => create();
  static $pb.PbList<OptionSwitchData> createRepeated() => $pb.PbList<OptionSwitchData>();
  @$core.pragma('dart2js:noInline')
  static OptionSwitchData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OptionSwitchData>(create);
  static OptionSwitchData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<OptionSwitchItem> get items => $_getList(1);
}

class OptionSwitchItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OptionSwitchItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'partyType')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'homeIcon')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..hasRequiredFields = false
  ;

  OptionSwitchItem._() : super();
  factory OptionSwitchItem({
    $core.String? name,
    $core.String? partyType,
    $core.String? icon,
    $core.String? homeIcon,
    $core.String? type,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (partyType != null) {
      _result.partyType = partyType;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (homeIcon != null) {
      _result.homeIcon = homeIcon;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory OptionSwitchItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OptionSwitchItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OptionSwitchItem clone() => OptionSwitchItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OptionSwitchItem copyWith(void Function(OptionSwitchItem) updates) => super.copyWith((message) => updates(message as OptionSwitchItem)) as OptionSwitchItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OptionSwitchItem create() => OptionSwitchItem._();
  OptionSwitchItem createEmptyInstance() => create();
  static $pb.PbList<OptionSwitchItem> createRepeated() => $pb.PbList<OptionSwitchItem>();
  @$core.pragma('dart2js:noInline')
  static OptionSwitchItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OptionSwitchItem>(create);
  static OptionSwitchItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get partyType => $_getSZ(1);
  @$pb.TagNumber(2)
  set partyType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPartyType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPartyType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get homeIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set homeIcon($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHomeIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearHomeIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get type => $_getSZ(4);
  @$pb.TagNumber(5)
  set type($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);
}

class RoomRcmdPlayingData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoomRcmdPlayingData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..pc<RoomRcmdPlayingDataItem>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: RoomRcmdPlayingDataItem.create)
    ..hasRequiredFields = false
  ;

  RoomRcmdPlayingData._() : super();
  factory RoomRcmdPlayingData({
    $core.String? title,
    $core.Iterable<RoomRcmdPlayingDataItem>? items,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory RoomRcmdPlayingData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomRcmdPlayingData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomRcmdPlayingData clone() => RoomRcmdPlayingData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomRcmdPlayingData copyWith(void Function(RoomRcmdPlayingData) updates) => super.copyWith((message) => updates(message as RoomRcmdPlayingData)) as RoomRcmdPlayingData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRcmdPlayingData create() => RoomRcmdPlayingData._();
  RoomRcmdPlayingData createEmptyInstance() => create();
  static $pb.PbList<RoomRcmdPlayingData> createRepeated() => $pb.PbList<RoomRcmdPlayingData>();
  @$core.pragma('dart2js:noInline')
  static RoomRcmdPlayingData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomRcmdPlayingData>(create);
  static RoomRcmdPlayingData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<RoomRcmdPlayingDataItem> get items => $_getList(1);
}

class RoomRcmdPlayingDataItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RoomRcmdPlayingDataItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid', $pb.PbFieldType.OU3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inRoom', $pb.PbFieldType.OU3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'onlineStatus', $pb.PbFieldType.O3)
    ..aOM<PlayingRoomIcons>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'miniIcon', subBuilder: PlayingRoomIcons.create)
    ..hasRequiredFields = false
  ;

  RoomRcmdPlayingDataItem._() : super();
  factory RoomRcmdPlayingDataItem({
    $core.int? uid,
    $core.String? name,
    $core.int? inRoom,
    $core.String? icon,
    $core.int? onlineStatus,
    PlayingRoomIcons? miniIcon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (inRoom != null) {
      _result.inRoom = inRoom;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (miniIcon != null) {
      _result.miniIcon = miniIcon;
    }
    return _result;
  }
  factory RoomRcmdPlayingDataItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomRcmdPlayingDataItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomRcmdPlayingDataItem clone() => RoomRcmdPlayingDataItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomRcmdPlayingDataItem copyWith(void Function(RoomRcmdPlayingDataItem) updates) => super.copyWith((message) => updates(message as RoomRcmdPlayingDataItem)) as RoomRcmdPlayingDataItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRcmdPlayingDataItem create() => RoomRcmdPlayingDataItem._();
  RoomRcmdPlayingDataItem createEmptyInstance() => create();
  static $pb.PbList<RoomRcmdPlayingDataItem> createRepeated() => $pb.PbList<RoomRcmdPlayingDataItem>();
  @$core.pragma('dart2js:noInline')
  static RoomRcmdPlayingDataItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomRcmdPlayingDataItem>(create);
  static RoomRcmdPlayingDataItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get inRoom => $_getIZ(2);
  @$pb.TagNumber(3)
  set inRoom($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearInRoom() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get onlineStatus => $_getIZ(4);
  @$pb.TagNumber(5)
  set onlineStatus($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOnlineStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineStatus() => clearField(5);

  @$pb.TagNumber(6)
  PlayingRoomIcons get miniIcon => $_getN(5);
  @$pb.TagNumber(6)
  set miniIcon(PlayingRoomIcons v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasMiniIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearMiniIcon() => clearField(6);
  @$pb.TagNumber(6)
  PlayingRoomIcons ensureMiniIcon() => $_ensure(5);
}

class PlayingRoomIcons extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlayingRoomIcons', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'borders')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'boardTitle')
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'boardBg')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'boardIcon')
    ..hasRequiredFields = false
  ;

  PlayingRoomIcons._() : super();
  factory PlayingRoomIcons({
    $core.Iterable<$core.String>? borders,
    $core.String? boardTitle,
    $core.Iterable<$core.String>? boardBg,
    $core.String? boardIcon,
  }) {
    final _result = create();
    if (borders != null) {
      _result.borders.addAll(borders);
    }
    if (boardTitle != null) {
      _result.boardTitle = boardTitle;
    }
    if (boardBg != null) {
      _result.boardBg.addAll(boardBg);
    }
    if (boardIcon != null) {
      _result.boardIcon = boardIcon;
    }
    return _result;
  }
  factory PlayingRoomIcons.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayingRoomIcons.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlayingRoomIcons clone() => PlayingRoomIcons()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlayingRoomIcons copyWith(void Function(PlayingRoomIcons) updates) => super.copyWith((message) => updates(message as PlayingRoomIcons)) as PlayingRoomIcons; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlayingRoomIcons create() => PlayingRoomIcons._();
  PlayingRoomIcons createEmptyInstance() => create();
  static $pb.PbList<PlayingRoomIcons> createRepeated() => $pb.PbList<PlayingRoomIcons>();
  @$core.pragma('dart2js:noInline')
  static PlayingRoomIcons getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayingRoomIcons>(create);
  static PlayingRoomIcons? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get borders => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get boardTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set boardTitle($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoardTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoardTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get boardBg => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get boardIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set boardIcon($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoardIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoardIcon() => clearField(4);
}

