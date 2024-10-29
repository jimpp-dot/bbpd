///
//  Generated code. Do not modify.
//  source: buy_room_hot.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResRoomBuyHot extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomBuyHot',
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
    ..aOM<BuyHotData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BuyHotData.create)
    ..hasRequiredFields = false;

  ResRoomBuyHot._() : super();
  factory ResRoomBuyHot({
    $core.bool? success,
    $core.String? msg,
    BuyHotData? data,
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
  factory ResRoomBuyHot.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomBuyHot.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomBuyHot clone() => ResRoomBuyHot()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomBuyHot copyWith(void Function(ResRoomBuyHot) updates) =>
      super.copyWith((message) => updates(message as ResRoomBuyHot))
          as ResRoomBuyHot; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomBuyHot create() => ResRoomBuyHot._();
  ResRoomBuyHot createEmptyInstance() => create();
  static $pb.PbList<ResRoomBuyHot> createRepeated() =>
      $pb.PbList<ResRoomBuyHot>();
  @$core.pragma('dart2js:noInline')
  static ResRoomBuyHot getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomBuyHot>(create);
  static ResRoomBuyHot? _defaultInstance;

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
  BuyHotData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BuyHotData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BuyHotData ensureData() => $_ensure(2);
}

class BuyHotData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BuyHotData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'buyType')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageBackground')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
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
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..pc<BuyHotItem>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: BuyHotItem.create)
    ..hasRequiredFields = false;

  BuyHotData._() : super();
  factory BuyHotData({
    $core.String? buyType,
    $core.String? imageBackground,
    $core.String? image,
    $core.String? name,
    $core.String? desc,
    $core.int? money,
    $core.Iterable<BuyHotItem>? items,
  }) {
    final _result = create();
    if (buyType != null) {
      _result.buyType = buyType;
    }
    if (imageBackground != null) {
      _result.imageBackground = imageBackground;
    }
    if (image != null) {
      _result.image = image;
    }
    if (name != null) {
      _result.name = name;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (money != null) {
      _result.money = money;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory BuyHotData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BuyHotData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BuyHotData clone() => BuyHotData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BuyHotData copyWith(void Function(BuyHotData) updates) =>
      super.copyWith((message) => updates(message as BuyHotData))
          as BuyHotData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BuyHotData create() => BuyHotData._();
  BuyHotData createEmptyInstance() => create();
  static $pb.PbList<BuyHotData> createRepeated() => $pb.PbList<BuyHotData>();
  @$core.pragma('dart2js:noInline')
  static BuyHotData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BuyHotData>(create);
  static BuyHotData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get buyType => $_getSZ(0);
  @$pb.TagNumber(1)
  set buyType($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBuyType() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuyType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get imageBackground => $_getSZ(1);
  @$pb.TagNumber(2)
  set imageBackground($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImageBackground() => $_has(1);
  @$pb.TagNumber(2)
  void clearImageBackground() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get image => $_getSZ(2);
  @$pb.TagNumber(3)
  set image($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);

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
  $core.List<BuyHotItem> get items => $_getList(6);
}

class BuyHotItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BuyHotItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unitPrice',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'period')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hot',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BuyHotItem._() : super();
  factory BuyHotItem({
    $core.int? cid,
    $core.int? unitPrice,
    $core.String? period,
    $core.int? hot,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (unitPrice != null) {
      _result.unitPrice = unitPrice;
    }
    if (period != null) {
      _result.period = period;
    }
    if (hot != null) {
      _result.hot = hot;
    }
    return _result;
  }
  factory BuyHotItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BuyHotItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BuyHotItem clone() => BuyHotItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BuyHotItem copyWith(void Function(BuyHotItem) updates) =>
      super.copyWith((message) => updates(message as BuyHotItem))
          as BuyHotItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BuyHotItem create() => BuyHotItem._();
  BuyHotItem createEmptyInstance() => create();
  static $pb.PbList<BuyHotItem> createRepeated() => $pb.PbList<BuyHotItem>();
  @$core.pragma('dart2js:noInline')
  static BuyHotItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BuyHotItem>(create);
  static BuyHotItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get unitPrice => $_getIZ(1);
  @$pb.TagNumber(2)
  set unitPrice($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUnitPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnitPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get period => $_getSZ(2);
  @$pb.TagNumber(3)
  set period($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPeriod() => $_has(2);
  @$pb.TagNumber(3)
  void clearPeriod() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get hot => $_getIZ(3);
  @$pb.TagNumber(4)
  set hot($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHot() => $_has(3);
  @$pb.TagNumber(4)
  void clearHot() => clearField(4);
}
