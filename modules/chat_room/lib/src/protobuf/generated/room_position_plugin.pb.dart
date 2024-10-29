///
//  Generated code. Do not modify.
//  source: room_position_plugin.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ResRoomPositionPluginRoomMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPositionPluginRoomMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<ResRoomPositionPluginItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResRoomPositionPluginItem.create)
    ..hasRequiredFields = false;

  ResRoomPositionPluginRoomMessage._() : super();
  factory ResRoomPositionPluginRoomMessage({
    ResRoomPositionPluginItem? data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ResRoomPositionPluginRoomMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPositionPluginRoomMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPositionPluginRoomMessage clone() =>
      ResRoomPositionPluginRoomMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPositionPluginRoomMessage copyWith(
          void Function(ResRoomPositionPluginRoomMessage) updates) =>
      super.copyWith(
              (message) => updates(message as ResRoomPositionPluginRoomMessage))
          as ResRoomPositionPluginRoomMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPluginRoomMessage create() =>
      ResRoomPositionPluginRoomMessage._();
  ResRoomPositionPluginRoomMessage createEmptyInstance() => create();
  static $pb.PbList<ResRoomPositionPluginRoomMessage> createRepeated() =>
      $pb.PbList<ResRoomPositionPluginRoomMessage>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPluginRoomMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPositionPluginRoomMessage>(
          create);
  static ResRoomPositionPluginRoomMessage? _defaultInstance;

  @$pb.TagNumber(1)
  ResRoomPositionPluginItem get data => $_getN(0);
  @$pb.TagNumber(1)
  set data(ResRoomPositionPluginItem v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  ResRoomPositionPluginItem ensureData() => $_ensure(0);
}

class ResRoomPositionPluginItemStageInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPositionPluginItemStageInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stageId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pluginId',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pluginType')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startTime',
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
            : 'endTimeType')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'clickType')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'clickExtra')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stageMp4')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endShowType',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msgTime',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  ResRoomPositionPluginItemStageInfo._() : super();
  factory ResRoomPositionPluginItemStageInfo({
    $core.int? stageId,
    $core.int? pluginId,
    $core.String? pluginType,
    $core.int? startTime,
    $core.int? endTime,
    $core.String? endTimeType,
    $core.String? clickType,
    $core.String? clickExtra,
    $core.String? stageMp4,
    $core.int? endShowType,
    $fixnum.Int64? msgTime,
  }) {
    final _result = create();
    if (stageId != null) {
      _result.stageId = stageId;
    }
    if (pluginId != null) {
      _result.pluginId = pluginId;
    }
    if (pluginType != null) {
      _result.pluginType = pluginType;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    if (endTimeType != null) {
      _result.endTimeType = endTimeType;
    }
    if (clickType != null) {
      _result.clickType = clickType;
    }
    if (clickExtra != null) {
      _result.clickExtra = clickExtra;
    }
    if (stageMp4 != null) {
      _result.stageMp4 = stageMp4;
    }
    if (endShowType != null) {
      _result.endShowType = endShowType;
    }
    if (msgTime != null) {
      _result.msgTime = msgTime;
    }
    return _result;
  }
  factory ResRoomPositionPluginItemStageInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPositionPluginItemStageInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPositionPluginItemStageInfo clone() =>
      ResRoomPositionPluginItemStageInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPositionPluginItemStageInfo copyWith(
          void Function(ResRoomPositionPluginItemStageInfo) updates) =>
      super.copyWith((message) =>
              updates(message as ResRoomPositionPluginItemStageInfo))
          as ResRoomPositionPluginItemStageInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPluginItemStageInfo create() =>
      ResRoomPositionPluginItemStageInfo._();
  ResRoomPositionPluginItemStageInfo createEmptyInstance() => create();
  static $pb.PbList<ResRoomPositionPluginItemStageInfo> createRepeated() =>
      $pb.PbList<ResRoomPositionPluginItemStageInfo>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPluginItemStageInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPositionPluginItemStageInfo>(
          create);
  static ResRoomPositionPluginItemStageInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get stageId => $_getIZ(0);
  @$pb.TagNumber(1)
  set stageId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStageId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pluginId => $_getIZ(1);
  @$pb.TagNumber(2)
  set pluginId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPluginId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPluginId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get pluginType => $_getSZ(2);
  @$pb.TagNumber(3)
  set pluginType($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPluginType() => $_has(2);
  @$pb.TagNumber(3)
  void clearPluginType() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get startTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set startTime($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStartTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartTime() => clearField(4);

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
  $core.String get endTimeType => $_getSZ(5);
  @$pb.TagNumber(6)
  set endTimeType($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasEndTimeType() => $_has(5);
  @$pb.TagNumber(6)
  void clearEndTimeType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get clickType => $_getSZ(6);
  @$pb.TagNumber(7)
  set clickType($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasClickType() => $_has(6);
  @$pb.TagNumber(7)
  void clearClickType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get clickExtra => $_getSZ(7);
  @$pb.TagNumber(8)
  set clickExtra($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasClickExtra() => $_has(7);
  @$pb.TagNumber(8)
  void clearClickExtra() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get stageMp4 => $_getSZ(8);
  @$pb.TagNumber(9)
  set stageMp4($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasStageMp4() => $_has(8);
  @$pb.TagNumber(9)
  void clearStageMp4() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get endShowType => $_getIZ(9);
  @$pb.TagNumber(10)
  set endShowType($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasEndShowType() => $_has(9);
  @$pb.TagNumber(10)
  void clearEndShowType() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get msgTime => $_getI64(10);
  @$pb.TagNumber(11)
  set msgTime($fixnum.Int64 v) {
    $_setInt64(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasMsgTime() => $_has(10);
  @$pb.TagNumber(11)
  void clearMsgTime() => clearField(11);
}

class ResRoomPositionPluginItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPositionPluginItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pluginId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'actId',
        $pb.PbFieldType.OU3)
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'previewDownload')
    ..aOM<ResRoomPositionPluginItemStageInfo>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stageInfo',
        subBuilder: ResRoomPositionPluginItemStageInfo.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weight',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pluginShowType')
    ..hasRequiredFields = false;

  ResRoomPositionPluginItem._() : super();
  factory ResRoomPositionPluginItem({
    $core.int? pluginId,
    $core.String? name,
    $core.int? actId,
    $core.Iterable<$core.String>? previewDownload,
    ResRoomPositionPluginItemStageInfo? stageInfo,
    $core.int? weight,
    $core.String? icon,
    $core.String? pluginShowType,
  }) {
    final _result = create();
    if (pluginId != null) {
      _result.pluginId = pluginId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (actId != null) {
      _result.actId = actId;
    }
    if (previewDownload != null) {
      _result.previewDownload.addAll(previewDownload);
    }
    if (stageInfo != null) {
      _result.stageInfo = stageInfo;
    }
    if (weight != null) {
      _result.weight = weight;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (pluginShowType != null) {
      _result.pluginShowType = pluginShowType;
    }
    return _result;
  }
  factory ResRoomPositionPluginItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPositionPluginItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPositionPluginItem clone() =>
      ResRoomPositionPluginItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPositionPluginItem copyWith(
          void Function(ResRoomPositionPluginItem) updates) =>
      super.copyWith((message) => updates(message as ResRoomPositionPluginItem))
          as ResRoomPositionPluginItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPluginItem create() => ResRoomPositionPluginItem._();
  ResRoomPositionPluginItem createEmptyInstance() => create();
  static $pb.PbList<ResRoomPositionPluginItem> createRepeated() =>
      $pb.PbList<ResRoomPositionPluginItem>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPluginItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPositionPluginItem>(create);
  static ResRoomPositionPluginItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pluginId => $_getIZ(0);
  @$pb.TagNumber(1)
  set pluginId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPluginId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPluginId() => clearField(1);

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
  $core.int get actId => $_getIZ(2);
  @$pb.TagNumber(3)
  set actId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasActId() => $_has(2);
  @$pb.TagNumber(3)
  void clearActId() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get previewDownload => $_getList(3);

  @$pb.TagNumber(5)
  ResRoomPositionPluginItemStageInfo get stageInfo => $_getN(4);
  @$pb.TagNumber(5)
  set stageInfo(ResRoomPositionPluginItemStageInfo v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStageInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearStageInfo() => clearField(5);
  @$pb.TagNumber(5)
  ResRoomPositionPluginItemStageInfo ensureStageInfo() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get weight => $_getIZ(5);
  @$pb.TagNumber(6)
  set weight($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearWeight() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get icon => $_getSZ(6);
  @$pb.TagNumber(7)
  set icon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get pluginShowType => $_getSZ(7);
  @$pb.TagNumber(8)
  set pluginShowType($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPluginShowType() => $_has(7);
  @$pb.TagNumber(8)
  void clearPluginShowType() => clearField(8);
}

class ResRoomPositionPluginData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPositionPluginData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ResRoomPositionPluginItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pluginInfo',
        $pb.PbFieldType.PM,
        subBuilder: ResRoomPositionPluginItem.create)
    ..hasRequiredFields = false;

  ResRoomPositionPluginData._() : super();
  factory ResRoomPositionPluginData({
    $core.Iterable<ResRoomPositionPluginItem>? pluginInfo,
  }) {
    final _result = create();
    if (pluginInfo != null) {
      _result.pluginInfo.addAll(pluginInfo);
    }
    return _result;
  }
  factory ResRoomPositionPluginData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPositionPluginData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPositionPluginData clone() =>
      ResRoomPositionPluginData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPositionPluginData copyWith(
          void Function(ResRoomPositionPluginData) updates) =>
      super.copyWith((message) => updates(message as ResRoomPositionPluginData))
          as ResRoomPositionPluginData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPluginData create() => ResRoomPositionPluginData._();
  ResRoomPositionPluginData createEmptyInstance() => create();
  static $pb.PbList<ResRoomPositionPluginData> createRepeated() =>
      $pb.PbList<ResRoomPositionPluginData>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPluginData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPositionPluginData>(create);
  static ResRoomPositionPluginData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ResRoomPositionPluginItem> get pluginInfo => $_getList(0);
}

class ResRoomPositionPlugin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPositionPlugin',
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
    ..aOM<ResRoomPositionPluginData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResRoomPositionPluginData.create)
    ..hasRequiredFields = false;

  ResRoomPositionPlugin._() : super();
  factory ResRoomPositionPlugin({
    $core.bool? success,
    $core.String? msg,
    ResRoomPositionPluginData? data,
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
  factory ResRoomPositionPlugin.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPositionPlugin.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPositionPlugin clone() =>
      ResRoomPositionPlugin()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPositionPlugin copyWith(
          void Function(ResRoomPositionPlugin) updates) =>
      super.copyWith((message) => updates(message as ResRoomPositionPlugin))
          as ResRoomPositionPlugin; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPlugin create() => ResRoomPositionPlugin._();
  ResRoomPositionPlugin createEmptyInstance() => create();
  static $pb.PbList<ResRoomPositionPlugin> createRepeated() =>
      $pb.PbList<ResRoomPositionPlugin>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPlugin getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPositionPlugin>(create);
  static ResRoomPositionPlugin? _defaultInstance;

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
  ResRoomPositionPluginData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ResRoomPositionPluginData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ResRoomPositionPluginData ensureData() => $_ensure(2);
}

class ResRoomPositionPluginClickCheckInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPositionPluginClickCheckInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'needIdentification')
    ..hasRequiredFields = false;

  ResRoomPositionPluginClickCheckInfo._() : super();
  factory ResRoomPositionPluginClickCheckInfo({
    $core.bool? needIdentification,
  }) {
    final _result = create();
    if (needIdentification != null) {
      _result.needIdentification = needIdentification;
    }
    return _result;
  }
  factory ResRoomPositionPluginClickCheckInfo.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPositionPluginClickCheckInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPositionPluginClickCheckInfo clone() =>
      ResRoomPositionPluginClickCheckInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPositionPluginClickCheckInfo copyWith(
          void Function(ResRoomPositionPluginClickCheckInfo) updates) =>
      super.copyWith((message) =>
              updates(message as ResRoomPositionPluginClickCheckInfo))
          as ResRoomPositionPluginClickCheckInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPluginClickCheckInfo create() =>
      ResRoomPositionPluginClickCheckInfo._();
  ResRoomPositionPluginClickCheckInfo createEmptyInstance() => create();
  static $pb.PbList<ResRoomPositionPluginClickCheckInfo> createRepeated() =>
      $pb.PbList<ResRoomPositionPluginClickCheckInfo>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPluginClickCheckInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ResRoomPositionPluginClickCheckInfo>(create);
  static ResRoomPositionPluginClickCheckInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get needIdentification => $_getBF(0);
  @$pb.TagNumber(1)
  set needIdentification($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNeedIdentification() => $_has(0);
  @$pb.TagNumber(1)
  void clearNeedIdentification() => clearField(1);
}

class ResRoomPositionPluginClick extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPositionPluginClick',
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
    ..aOM<ResRoomPositionPluginClickData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResRoomPositionPluginClickData.create)
    ..hasRequiredFields = false;

  ResRoomPositionPluginClick._() : super();
  factory ResRoomPositionPluginClick({
    $core.bool? success,
    $core.String? msg,
    ResRoomPositionPluginClickData? data,
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
  factory ResRoomPositionPluginClick.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPositionPluginClick.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPositionPluginClick clone() =>
      ResRoomPositionPluginClick()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPositionPluginClick copyWith(
          void Function(ResRoomPositionPluginClick) updates) =>
      super.copyWith(
              (message) => updates(message as ResRoomPositionPluginClick))
          as ResRoomPositionPluginClick; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPluginClick create() => ResRoomPositionPluginClick._();
  ResRoomPositionPluginClick createEmptyInstance() => create();
  static $pb.PbList<ResRoomPositionPluginClick> createRepeated() =>
      $pb.PbList<ResRoomPositionPluginClick>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPluginClick getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPositionPluginClick>(create);
  static ResRoomPositionPluginClick? _defaultInstance;

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
  ResRoomPositionPluginClickData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ResRoomPositionPluginClickData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ResRoomPositionPluginClickData ensureData() => $_ensure(2);
}

class ResRoomPositionPluginClickData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPositionPluginClickData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<ResRoomPositionPluginClickCheckInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkInfo',
        subBuilder: ResRoomPositionPluginClickCheckInfo.create)
    ..aOM<ResRoomPositionActPluginClickData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'actData',
        subBuilder: ResRoomPositionActPluginClickData.create)
    ..hasRequiredFields = false;

  ResRoomPositionPluginClickData._() : super();
  factory ResRoomPositionPluginClickData({
    ResRoomPositionPluginClickCheckInfo? checkInfo,
    ResRoomPositionActPluginClickData? actData,
  }) {
    final _result = create();
    if (checkInfo != null) {
      _result.checkInfo = checkInfo;
    }
    if (actData != null) {
      _result.actData = actData;
    }
    return _result;
  }
  factory ResRoomPositionPluginClickData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPositionPluginClickData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPositionPluginClickData clone() =>
      ResRoomPositionPluginClickData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPositionPluginClickData copyWith(
          void Function(ResRoomPositionPluginClickData) updates) =>
      super.copyWith(
              (message) => updates(message as ResRoomPositionPluginClickData))
          as ResRoomPositionPluginClickData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPluginClickData create() =>
      ResRoomPositionPluginClickData._();
  ResRoomPositionPluginClickData createEmptyInstance() => create();
  static $pb.PbList<ResRoomPositionPluginClickData> createRepeated() =>
      $pb.PbList<ResRoomPositionPluginClickData>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionPluginClickData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPositionPluginClickData>(create);
  static ResRoomPositionPluginClickData? _defaultInstance;

  @$pb.TagNumber(1)
  ResRoomPositionPluginClickCheckInfo get checkInfo => $_getN(0);
  @$pb.TagNumber(1)
  set checkInfo(ResRoomPositionPluginClickCheckInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCheckInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearCheckInfo() => clearField(1);
  @$pb.TagNumber(1)
  ResRoomPositionPluginClickCheckInfo ensureCheckInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  ResRoomPositionActPluginClickData get actData => $_getN(1);
  @$pb.TagNumber(2)
  set actData(ResRoomPositionActPluginClickData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasActData() => $_has(1);
  @$pb.TagNumber(2)
  void clearActData() => clearField(2);
  @$pb.TagNumber(2)
  ResRoomPositionActPluginClickData ensureActData() => $_ensure(1);
}

class ResRoomPositionActPluginClickData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPositionActPluginClickData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'backIcon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'buttonIcon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpUrl')
    ..pc<RoomPositionActRewardData>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewards',
        $pb.PbFieldType.PM,
        subBuilder: RoomPositionActRewardData.create)
    ..hasRequiredFields = false;

  ResRoomPositionActPluginClickData._() : super();
  factory ResRoomPositionActPluginClickData({
    $core.String? backIcon,
    $core.String? buttonIcon,
    $core.String? jumpUrl,
    $core.Iterable<RoomPositionActRewardData>? rewards,
  }) {
    final _result = create();
    if (backIcon != null) {
      _result.backIcon = backIcon;
    }
    if (buttonIcon != null) {
      _result.buttonIcon = buttonIcon;
    }
    if (jumpUrl != null) {
      _result.jumpUrl = jumpUrl;
    }
    if (rewards != null) {
      _result.rewards.addAll(rewards);
    }
    return _result;
  }
  factory ResRoomPositionActPluginClickData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPositionActPluginClickData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPositionActPluginClickData clone() =>
      ResRoomPositionActPluginClickData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPositionActPluginClickData copyWith(
          void Function(ResRoomPositionActPluginClickData) updates) =>
      super.copyWith((message) =>
              updates(message as ResRoomPositionActPluginClickData))
          as ResRoomPositionActPluginClickData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionActPluginClickData create() =>
      ResRoomPositionActPluginClickData._();
  ResRoomPositionActPluginClickData createEmptyInstance() => create();
  static $pb.PbList<ResRoomPositionActPluginClickData> createRepeated() =>
      $pb.PbList<ResRoomPositionActPluginClickData>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPositionActPluginClickData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPositionActPluginClickData>(
          create);
  static ResRoomPositionActPluginClickData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get backIcon => $_getSZ(0);
  @$pb.TagNumber(1)
  set backIcon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBackIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearBackIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get buttonIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set buttonIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasButtonIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearButtonIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get jumpUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set jumpUrl($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasJumpUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearJumpUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<RoomPositionActRewardData> get rewards => $_getList(3);
}

class RoomPositionActRewardData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomPositionActRewardData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nameColor')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'iconBgColor')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'iconBgBoardColor')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dotColor')
    ..hasRequiredFields = false;

  RoomPositionActRewardData._() : super();
  factory RoomPositionActRewardData({
    $core.String? name,
    $core.String? nameColor,
    $core.String? icon,
    $core.String? iconBgColor,
    $core.String? iconBgBoardColor,
    $core.String? dotColor,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (nameColor != null) {
      _result.nameColor = nameColor;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (iconBgColor != null) {
      _result.iconBgColor = iconBgColor;
    }
    if (iconBgBoardColor != null) {
      _result.iconBgBoardColor = iconBgBoardColor;
    }
    if (dotColor != null) {
      _result.dotColor = dotColor;
    }
    return _result;
  }
  factory RoomPositionActRewardData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomPositionActRewardData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomPositionActRewardData clone() =>
      RoomPositionActRewardData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomPositionActRewardData copyWith(
          void Function(RoomPositionActRewardData) updates) =>
      super.copyWith((message) => updates(message as RoomPositionActRewardData))
          as RoomPositionActRewardData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomPositionActRewardData create() => RoomPositionActRewardData._();
  RoomPositionActRewardData createEmptyInstance() => create();
  static $pb.PbList<RoomPositionActRewardData> createRepeated() =>
      $pb.PbList<RoomPositionActRewardData>();
  @$core.pragma('dart2js:noInline')
  static RoomPositionActRewardData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomPositionActRewardData>(create);
  static RoomPositionActRewardData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nameColor => $_getSZ(1);
  @$pb.TagNumber(2)
  set nameColor($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNameColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearNameColor() => clearField(2);

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
  $core.String get iconBgColor => $_getSZ(3);
  @$pb.TagNumber(4)
  set iconBgColor($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIconBgColor() => $_has(3);
  @$pb.TagNumber(4)
  void clearIconBgColor() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get iconBgBoardColor => $_getSZ(4);
  @$pb.TagNumber(5)
  set iconBgBoardColor($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIconBgBoardColor() => $_has(4);
  @$pb.TagNumber(5)
  void clearIconBgBoardColor() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get dotColor => $_getSZ(5);
  @$pb.TagNumber(6)
  set dotColor($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDotColor() => $_has(5);
  @$pb.TagNumber(6)
  void clearDotColor() => clearField(6);
}

class RoomChildrenRoomListRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomChildrenRoomListRsp',
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
    ..pc<RoomChildrenRoomListItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: RoomChildrenRoomListItem.create)
    ..hasRequiredFields = false;

  RoomChildrenRoomListRsp._() : super();
  factory RoomChildrenRoomListRsp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<RoomChildrenRoomListItem>? data,
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
  factory RoomChildrenRoomListRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomChildrenRoomListRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomChildrenRoomListRsp clone() =>
      RoomChildrenRoomListRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomChildrenRoomListRsp copyWith(
          void Function(RoomChildrenRoomListRsp) updates) =>
      super.copyWith((message) => updates(message as RoomChildrenRoomListRsp))
          as RoomChildrenRoomListRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomChildrenRoomListRsp create() => RoomChildrenRoomListRsp._();
  RoomChildrenRoomListRsp createEmptyInstance() => create();
  static $pb.PbList<RoomChildrenRoomListRsp> createRepeated() =>
      $pb.PbList<RoomChildrenRoomListRsp>();
  @$core.pragma('dart2js:noInline')
  static RoomChildrenRoomListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomChildrenRoomListRsp>(create);
  static RoomChildrenRoomListRsp? _defaultInstance;

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
  $core.List<RoomChildrenRoomListItem> get data => $_getList(2);
}

class RoomChildrenRoomListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomChildrenRoomListItem',
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
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'parentRid',
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
            : 'id',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomChildrenRoomListItem._() : super();
  factory RoomChildrenRoomListItem({
    $core.int? rid,
    $core.String? icon,
    $core.String? name,
    $core.int? uid,
    $core.int? parentRid,
    $core.String? desc,
    $core.int? id,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (parentRid != null) {
      _result.parentRid = parentRid;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory RoomChildrenRoomListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomChildrenRoomListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomChildrenRoomListItem clone() =>
      RoomChildrenRoomListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomChildrenRoomListItem copyWith(
          void Function(RoomChildrenRoomListItem) updates) =>
      super.copyWith((message) => updates(message as RoomChildrenRoomListItem))
          as RoomChildrenRoomListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomChildrenRoomListItem create() => RoomChildrenRoomListItem._();
  RoomChildrenRoomListItem createEmptyInstance() => create();
  static $pb.PbList<RoomChildrenRoomListItem> createRepeated() =>
      $pb.PbList<RoomChildrenRoomListItem>();
  @$core.pragma('dart2js:noInline')
  static RoomChildrenRoomListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomChildrenRoomListItem>(create);
  static RoomChildrenRoomListItem? _defaultInstance;

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
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => clearField(2);

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
  $core.int get uid => $_getIZ(3);
  @$pb.TagNumber(4)
  set uid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get parentRid => $_getIZ(4);
  @$pb.TagNumber(5)
  set parentRid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasParentRid() => $_has(4);
  @$pb.TagNumber(5)
  void clearParentRid() => clearField(5);

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
  $core.int get id => $_getIZ(6);
  @$pb.TagNumber(7)
  set id($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasId() => $_has(6);
  @$pb.TagNumber(7)
  void clearId() => clearField(7);
}
