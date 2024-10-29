///
//  Generated code. Do not modify.
//  source: confess_v2.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ConfessChooseNumConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConfessChooseNumConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  ConfessChooseNumConfig._() : super();
  factory ConfessChooseNumConfig({
    $core.int? num,
    $core.String? desc,
  }) {
    final _result = create();
    if (num != null) {
      _result.num = num;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory ConfessChooseNumConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfessChooseNumConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfessChooseNumConfig clone() =>
      ConfessChooseNumConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfessChooseNumConfig copyWith(
          void Function(ConfessChooseNumConfig) updates) =>
      super.copyWith((message) => updates(message as ConfessChooseNumConfig))
          as ConfessChooseNumConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfessChooseNumConfig create() => ConfessChooseNumConfig._();
  ConfessChooseNumConfig createEmptyInstance() => create();
  static $pb.PbList<ConfessChooseNumConfig> createRepeated() =>
      $pb.PbList<ConfessChooseNumConfig>();
  @$core.pragma('dart2js:noInline')
  static ConfessChooseNumConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfessChooseNumConfig>(create);
  static ConfessChooseNumConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get num => $_getIZ(0);
  @$pb.TagNumber(1)
  set num($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearNum() => clearField(1);

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
}

class ConfessStage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConfessStage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlocked')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'probabilityTxt')
    ..hasRequiredFields = false;

  ConfessStage._() : super();
  factory ConfessStage({
    $core.int? giftId,
    $core.int? price,
    $core.bool? unlocked,
    $core.String? name,
    $core.String? desc,
    $core.String? probabilityTxt,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (price != null) {
      _result.price = price;
    }
    if (unlocked != null) {
      _result.unlocked = unlocked;
    }
    if (name != null) {
      _result.name = name;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (probabilityTxt != null) {
      _result.probabilityTxt = probabilityTxt;
    }
    return _result;
  }
  factory ConfessStage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfessStage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfessStage clone() => ConfessStage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfessStage copyWith(void Function(ConfessStage) updates) =>
      super.copyWith((message) => updates(message as ConfessStage))
          as ConfessStage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfessStage create() => ConfessStage._();
  ConfessStage createEmptyInstance() => create();
  static $pb.PbList<ConfessStage> createRepeated() =>
      $pb.PbList<ConfessStage>();
  @$core.pragma('dart2js:noInline')
  static ConfessStage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfessStage>(create);
  static ConfessStage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get price => $_getIZ(1);
  @$pb.TagNumber(2)
  set price($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get unlocked => $_getBF(2);
  @$pb.TagNumber(3)
  set unlocked($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUnlocked() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnlocked() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get desc => $_getSZ(4);
  @$pb.TagNumber(5)
  set desc($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDesc() => $_has(4);
  @$pb.TagNumber(5)
  void clearDesc() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get probabilityTxt => $_getSZ(5);
  @$pb.TagNumber(6)
  set probabilityTxt($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasProbabilityTxt() => $_has(5);
  @$pb.TagNumber(6)
  void clearProbabilityTxt() => clearField(6);
}

class ConfessIndexData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConfessIndexData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ConfessChooseNumConfig>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chooseNumConfig',
        $pb.PbFieldType.PM,
        subBuilder: ConfessChooseNumConfig.create)
    ..pc<ConfessStage>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stages',
        $pb.PbFieldType.PM,
        subBuilder: ConfessStage.create)
    ..hasRequiredFields = false;

  ConfessIndexData._() : super();
  factory ConfessIndexData({
    $core.Iterable<ConfessChooseNumConfig>? chooseNumConfig,
    $core.Iterable<ConfessStage>? stages,
  }) {
    final _result = create();
    if (chooseNumConfig != null) {
      _result.chooseNumConfig.addAll(chooseNumConfig);
    }
    if (stages != null) {
      _result.stages.addAll(stages);
    }
    return _result;
  }
  factory ConfessIndexData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfessIndexData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfessIndexData clone() => ConfessIndexData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfessIndexData copyWith(void Function(ConfessIndexData) updates) =>
      super.copyWith((message) => updates(message as ConfessIndexData))
          as ConfessIndexData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfessIndexData create() => ConfessIndexData._();
  ConfessIndexData createEmptyInstance() => create();
  static $pb.PbList<ConfessIndexData> createRepeated() =>
      $pb.PbList<ConfessIndexData>();
  @$core.pragma('dart2js:noInline')
  static ConfessIndexData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfessIndexData>(create);
  static ConfessIndexData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ConfessChooseNumConfig> get chooseNumConfig => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<ConfessStage> get stages => $_getList(1);
}

class ResConfessIndex extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResConfessIndex',
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
    ..aOM<ConfessIndexData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ConfessIndexData.create)
    ..hasRequiredFields = false;

  ResConfessIndex._() : super();
  factory ResConfessIndex({
    $core.bool? success,
    $core.String? msg,
    ConfessIndexData? data,
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
  factory ResConfessIndex.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResConfessIndex.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResConfessIndex clone() => ResConfessIndex()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResConfessIndex copyWith(void Function(ResConfessIndex) updates) =>
      super.copyWith((message) => updates(message as ResConfessIndex))
          as ResConfessIndex; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResConfessIndex create() => ResConfessIndex._();
  ResConfessIndex createEmptyInstance() => create();
  static $pb.PbList<ResConfessIndex> createRepeated() =>
      $pb.PbList<ResConfessIndex>();
  @$core.pragma('dart2js:noInline')
  static ResConfessIndex getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResConfessIndex>(create);
  static ResConfessIndex? _defaultInstance;

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
  ConfessIndexData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ConfessIndexData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ConfessIndexData ensureData() => $_ensure(2);
}

class ConfessHistoryItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConfessHistoryItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fromIcon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fromName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toIcon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toName')
    ..aInt64(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'timestamp')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'text')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fromUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toUid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ConfessHistoryItem._() : super();
  factory ConfessHistoryItem({
    $core.String? fromIcon,
    $core.String? fromName,
    $core.String? toIcon,
    $core.String? toName,
    $fixnum.Int64? timestamp,
    $core.String? text,
    $core.int? giftId,
    $core.int? fromUid,
    $core.int? toUid,
  }) {
    final _result = create();
    if (fromIcon != null) {
      _result.fromIcon = fromIcon;
    }
    if (fromName != null) {
      _result.fromName = fromName;
    }
    if (toIcon != null) {
      _result.toIcon = toIcon;
    }
    if (toName != null) {
      _result.toName = toName;
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (text != null) {
      _result.text = text;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (fromUid != null) {
      _result.fromUid = fromUid;
    }
    if (toUid != null) {
      _result.toUid = toUid;
    }
    return _result;
  }
  factory ConfessHistoryItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfessHistoryItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfessHistoryItem clone() => ConfessHistoryItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfessHistoryItem copyWith(void Function(ConfessHistoryItem) updates) =>
      super.copyWith((message) => updates(message as ConfessHistoryItem))
          as ConfessHistoryItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfessHistoryItem create() => ConfessHistoryItem._();
  ConfessHistoryItem createEmptyInstance() => create();
  static $pb.PbList<ConfessHistoryItem> createRepeated() =>
      $pb.PbList<ConfessHistoryItem>();
  @$core.pragma('dart2js:noInline')
  static ConfessHistoryItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfessHistoryItem>(create);
  static ConfessHistoryItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fromIcon => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromIcon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFromIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fromName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fromName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFromName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get toIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set toIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasToIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearToIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get toName => $_getSZ(3);
  @$pb.TagNumber(4)
  set toName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasToName() => $_has(3);
  @$pb.TagNumber(4)
  void clearToName() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get timestamp => $_getI64(4);
  @$pb.TagNumber(5)
  set timestamp($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTimestamp() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimestamp() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get text => $_getSZ(5);
  @$pb.TagNumber(6)
  set text($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasText() => $_has(5);
  @$pb.TagNumber(6)
  void clearText() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get giftId => $_getIZ(6);
  @$pb.TagNumber(7)
  set giftId($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGiftId() => $_has(6);
  @$pb.TagNumber(7)
  void clearGiftId() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get fromUid => $_getIZ(7);
  @$pb.TagNumber(8)
  set fromUid($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasFromUid() => $_has(7);
  @$pb.TagNumber(8)
  void clearFromUid() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get toUid => $_getIZ(8);
  @$pb.TagNumber(9)
  set toUid($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasToUid() => $_has(8);
  @$pb.TagNumber(9)
  void clearToUid() => clearField(9);
}

class ConfessHistoryData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConfessHistoryData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'offset',
        $pb.PbFieldType.OU3)
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastId')
    ..pc<ConfessHistoryItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: ConfessHistoryItem.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ConfessHistoryData._() : super();
  factory ConfessHistoryData({
    $core.int? offset,
    $fixnum.Int64? lastId,
    $core.Iterable<ConfessHistoryItem>? items,
    $core.int? more,
  }) {
    final _result = create();
    if (offset != null) {
      _result.offset = offset;
    }
    if (lastId != null) {
      _result.lastId = lastId;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    if (more != null) {
      _result.more = more;
    }
    return _result;
  }
  factory ConfessHistoryData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfessHistoryData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfessHistoryData clone() => ConfessHistoryData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfessHistoryData copyWith(void Function(ConfessHistoryData) updates) =>
      super.copyWith((message) => updates(message as ConfessHistoryData))
          as ConfessHistoryData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfessHistoryData create() => ConfessHistoryData._();
  ConfessHistoryData createEmptyInstance() => create();
  static $pb.PbList<ConfessHistoryData> createRepeated() =>
      $pb.PbList<ConfessHistoryData>();
  @$core.pragma('dart2js:noInline')
  static ConfessHistoryData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfessHistoryData>(create);
  static ConfessHistoryData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get offset => $_getIZ(0);
  @$pb.TagNumber(1)
  set offset($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastId => $_getI64(1);
  @$pb.TagNumber(2)
  set lastId($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLastId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ConfessHistoryItem> get items => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get more => $_getIZ(3);
  @$pb.TagNumber(4)
  set more($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMore() => $_has(3);
  @$pb.TagNumber(4)
  void clearMore() => clearField(4);
}

class ResConfessHistory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResConfessHistory',
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
    ..aOM<ConfessHistoryData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ConfessHistoryData.create)
    ..hasRequiredFields = false;

  ResConfessHistory._() : super();
  factory ResConfessHistory({
    $core.bool? success,
    $core.String? msg,
    ConfessHistoryData? data,
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
  factory ResConfessHistory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResConfessHistory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResConfessHistory clone() => ResConfessHistory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResConfessHistory copyWith(void Function(ResConfessHistory) updates) =>
      super.copyWith((message) => updates(message as ResConfessHistory))
          as ResConfessHistory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResConfessHistory create() => ResConfessHistory._();
  ResConfessHistory createEmptyInstance() => create();
  static $pb.PbList<ResConfessHistory> createRepeated() =>
      $pb.PbList<ResConfessHistory>();
  @$core.pragma('dart2js:noInline')
  static ResConfessHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResConfessHistory>(create);
  static ResConfessHistory? _defaultInstance;

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
  ConfessHistoryData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ConfessHistoryData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ConfessHistoryData ensureData() => $_ensure(2);
}
