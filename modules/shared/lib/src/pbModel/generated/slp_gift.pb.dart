///
//  Generated code. Do not modify.
//  source: slp_gift.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'entity_xs_commodity.pb.dart' as $0;

class BbGiftPanelData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<BbGiftPanelGift>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelGift.create)
    ..pc<BbGiftPanelGift>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privilegeGift',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelGift.create)
    ..pc<BbGiftPanelCommodities>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodities',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelCommodities.create)
    ..pc<BbGiftPanelKeyCoupons>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'keyCoupons',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelKeyCoupons.create)
    ..pc<BbGiftPanelGlobalBox>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'globalBox',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelGlobalBox.create)
    ..aOM<BbGiftPanelGlobalPiece>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'globalPiece',
        subBuilder: BbGiftPanelGlobalPiece.create)
    ..aOM<BbGiftPanelExtend>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extend',
        subBuilder: BbGiftPanelExtend.create)
    ..pc<BbGiftPanelKeyCommodity>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'keyCommodity',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelKeyCommodity.create)
    ..pc<BbGiftPanelShopCommodities>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'shopCommodities',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelShopCommodities.create)
    ..pc<BbGiftPanelKeyName>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'keyName',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelKeyName.create)
    ..pc<BbGiftPanelDecorates>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'decorates',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelDecorates.create)
    ..pc<BbGiftPanelChooseNumConfig>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chooseNumConfig',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelChooseNumConfig.create)
    ..pc<BbGiftPanelChooseNumConfig>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chooseBoxNumConfig',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelChooseNumConfig.create)
    ..pc<BbGiftPanelTabConfig>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabConfig',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelTabConfig.create)
    ..pc<BbGiftPanelGift>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pubDrinks',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelGift.create)
    ..pc<BbGiftPanelLiveProps>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveProps',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelLiveProps.create)
    ..pc<BbGiftPanelGift>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'interactGift',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelGift.create)
    ..pc<BbGiftPanelGift>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'specialPlays',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelGift.create)
    ..aOM<ExclusiveGiftInfo>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'exclusive',
        subBuilder: ExclusiveGiftInfo.create)
    ..pc<BbGiftPanelGift>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'towerGift',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelGift.create)
    ..aOM<BbGiftPanelBanner>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'banner',
        subBuilder: BbGiftPanelBanner.create)
    ..aOM<BbGiftPanelLuckyEggInfo>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'luckEgg',
        subBuilder: BbGiftPanelLuckyEggInfo.create)
    ..aOM<BbGiftPaneRandomBoxInfo>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'randomBox',
        subBuilder: BbGiftPaneRandomBoxInfo.create)
    ..aOM<OutstandingBoxInfo>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'outstandingBox',
        subBuilder: OutstandingBoxInfo.create)
    ..aOB(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showIntimate')
    ..hasRequiredFields = false;

  BbGiftPanelData._() : super();
  factory BbGiftPanelData({
    $core.Iterable<BbGiftPanelGift>? gift,
    $core.Iterable<BbGiftPanelGift>? privilegeGift,
    $core.Iterable<BbGiftPanelCommodities>? commodities,
    $core.Iterable<BbGiftPanelKeyCoupons>? keyCoupons,
    $core.Iterable<BbGiftPanelGlobalBox>? globalBox,
    BbGiftPanelGlobalPiece? globalPiece,
    BbGiftPanelExtend? extend,
    $core.Iterable<BbGiftPanelKeyCommodity>? keyCommodity,
    $core.Iterable<BbGiftPanelShopCommodities>? shopCommodities,
    $core.Iterable<BbGiftPanelKeyName>? keyName,
    $core.Iterable<BbGiftPanelDecorates>? decorates,
    $core.Iterable<BbGiftPanelChooseNumConfig>? chooseNumConfig,
    $core.Iterable<BbGiftPanelChooseNumConfig>? chooseBoxNumConfig,
    $core.Iterable<BbGiftPanelTabConfig>? tabConfig,
    $core.Iterable<BbGiftPanelGift>? pubDrinks,
    $core.Iterable<BbGiftPanelLiveProps>? liveProps,
    $core.Iterable<BbGiftPanelGift>? interactGift,
    $core.Iterable<BbGiftPanelGift>? specialPlays,
    ExclusiveGiftInfo? exclusive,
    $core.Iterable<BbGiftPanelGift>? towerGift,
    BbGiftPanelBanner? banner,
    BbGiftPanelLuckyEggInfo? luckEgg,
    BbGiftPaneRandomBoxInfo? randomBox,
    OutstandingBoxInfo? outstandingBox,
    $core.bool? showIntimate,
  }) {
    final _result = create();
    if (gift != null) {
      _result.gift.addAll(gift);
    }
    if (privilegeGift != null) {
      _result.privilegeGift.addAll(privilegeGift);
    }
    if (commodities != null) {
      _result.commodities.addAll(commodities);
    }
    if (keyCoupons != null) {
      _result.keyCoupons.addAll(keyCoupons);
    }
    if (globalBox != null) {
      _result.globalBox.addAll(globalBox);
    }
    if (globalPiece != null) {
      _result.globalPiece = globalPiece;
    }
    if (extend != null) {
      _result.extend = extend;
    }
    if (keyCommodity != null) {
      _result.keyCommodity.addAll(keyCommodity);
    }
    if (shopCommodities != null) {
      _result.shopCommodities.addAll(shopCommodities);
    }
    if (keyName != null) {
      _result.keyName.addAll(keyName);
    }
    if (decorates != null) {
      _result.decorates.addAll(decorates);
    }
    if (chooseNumConfig != null) {
      _result.chooseNumConfig.addAll(chooseNumConfig);
    }
    if (chooseBoxNumConfig != null) {
      _result.chooseBoxNumConfig.addAll(chooseBoxNumConfig);
    }
    if (tabConfig != null) {
      _result.tabConfig.addAll(tabConfig);
    }
    if (pubDrinks != null) {
      _result.pubDrinks.addAll(pubDrinks);
    }
    if (liveProps != null) {
      _result.liveProps.addAll(liveProps);
    }
    if (interactGift != null) {
      _result.interactGift.addAll(interactGift);
    }
    if (specialPlays != null) {
      _result.specialPlays.addAll(specialPlays);
    }
    if (exclusive != null) {
      _result.exclusive = exclusive;
    }
    if (towerGift != null) {
      _result.towerGift.addAll(towerGift);
    }
    if (banner != null) {
      _result.banner = banner;
    }
    if (luckEgg != null) {
      _result.luckEgg = luckEgg;
    }
    if (randomBox != null) {
      _result.randomBox = randomBox;
    }
    if (outstandingBox != null) {
      _result.outstandingBox = outstandingBox;
    }
    if (showIntimate != null) {
      _result.showIntimate = showIntimate;
    }
    return _result;
  }
  factory BbGiftPanelData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelData clone() => BbGiftPanelData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelData copyWith(void Function(BbGiftPanelData) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelData))
          as BbGiftPanelData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelData create() => BbGiftPanelData._();
  BbGiftPanelData createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelData> createRepeated() =>
      $pb.PbList<BbGiftPanelData>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelData>(create);
  static BbGiftPanelData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BbGiftPanelGift> get gift => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<BbGiftPanelGift> get privilegeGift => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<BbGiftPanelCommodities> get commodities => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<BbGiftPanelKeyCoupons> get keyCoupons => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<BbGiftPanelGlobalBox> get globalBox => $_getList(4);

  @$pb.TagNumber(6)
  BbGiftPanelGlobalPiece get globalPiece => $_getN(5);
  @$pb.TagNumber(6)
  set globalPiece(BbGiftPanelGlobalPiece v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGlobalPiece() => $_has(5);
  @$pb.TagNumber(6)
  void clearGlobalPiece() => clearField(6);
  @$pb.TagNumber(6)
  BbGiftPanelGlobalPiece ensureGlobalPiece() => $_ensure(5);

  @$pb.TagNumber(7)
  BbGiftPanelExtend get extend => $_getN(6);
  @$pb.TagNumber(7)
  set extend(BbGiftPanelExtend v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasExtend() => $_has(6);
  @$pb.TagNumber(7)
  void clearExtend() => clearField(7);
  @$pb.TagNumber(7)
  BbGiftPanelExtend ensureExtend() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.List<BbGiftPanelKeyCommodity> get keyCommodity => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<BbGiftPanelShopCommodities> get shopCommodities => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<BbGiftPanelKeyName> get keyName => $_getList(9);

  @$pb.TagNumber(11)
  $core.List<BbGiftPanelDecorates> get decorates => $_getList(10);

  @$pb.TagNumber(12)
  $core.List<BbGiftPanelChooseNumConfig> get chooseNumConfig => $_getList(11);

  @$pb.TagNumber(13)
  $core.List<BbGiftPanelChooseNumConfig> get chooseBoxNumConfig =>
      $_getList(12);

  @$pb.TagNumber(14)
  $core.List<BbGiftPanelTabConfig> get tabConfig => $_getList(13);

  @$pb.TagNumber(15)
  $core.List<BbGiftPanelGift> get pubDrinks => $_getList(14);

  @$pb.TagNumber(16)
  $core.List<BbGiftPanelLiveProps> get liveProps => $_getList(15);

  @$pb.TagNumber(17)
  $core.List<BbGiftPanelGift> get interactGift => $_getList(16);

  @$pb.TagNumber(18)
  $core.List<BbGiftPanelGift> get specialPlays => $_getList(17);

  @$pb.TagNumber(19)
  ExclusiveGiftInfo get exclusive => $_getN(18);
  @$pb.TagNumber(19)
  set exclusive(ExclusiveGiftInfo v) {
    setField(19, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasExclusive() => $_has(18);
  @$pb.TagNumber(19)
  void clearExclusive() => clearField(19);
  @$pb.TagNumber(19)
  ExclusiveGiftInfo ensureExclusive() => $_ensure(18);

  @$pb.TagNumber(20)
  $core.List<BbGiftPanelGift> get towerGift => $_getList(19);

  @$pb.TagNumber(21)
  BbGiftPanelBanner get banner => $_getN(20);
  @$pb.TagNumber(21)
  set banner(BbGiftPanelBanner v) {
    setField(21, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasBanner() => $_has(20);
  @$pb.TagNumber(21)
  void clearBanner() => clearField(21);
  @$pb.TagNumber(21)
  BbGiftPanelBanner ensureBanner() => $_ensure(20);

  @$pb.TagNumber(22)
  BbGiftPanelLuckyEggInfo get luckEgg => $_getN(21);
  @$pb.TagNumber(22)
  set luckEgg(BbGiftPanelLuckyEggInfo v) {
    setField(22, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasLuckEgg() => $_has(21);
  @$pb.TagNumber(22)
  void clearLuckEgg() => clearField(22);
  @$pb.TagNumber(22)
  BbGiftPanelLuckyEggInfo ensureLuckEgg() => $_ensure(21);

  @$pb.TagNumber(23)
  BbGiftPaneRandomBoxInfo get randomBox => $_getN(22);
  @$pb.TagNumber(23)
  set randomBox(BbGiftPaneRandomBoxInfo v) {
    setField(23, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasRandomBox() => $_has(22);
  @$pb.TagNumber(23)
  void clearRandomBox() => clearField(23);
  @$pb.TagNumber(23)
  BbGiftPaneRandomBoxInfo ensureRandomBox() => $_ensure(22);

  @$pb.TagNumber(24)
  OutstandingBoxInfo get outstandingBox => $_getN(23);
  @$pb.TagNumber(24)
  set outstandingBox(OutstandingBoxInfo v) {
    setField(24, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasOutstandingBox() => $_has(23);
  @$pb.TagNumber(24)
  void clearOutstandingBox() => clearField(24);
  @$pb.TagNumber(24)
  OutstandingBoxInfo ensureOutstandingBox() => $_ensure(23);

  @$pb.TagNumber(25)
  $core.bool get showIntimate => $_getBF(24);
  @$pb.TagNumber(25)
  set showIntimate($core.bool v) {
    $_setBool(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasShowIntimate() => $_has(24);
  @$pb.TagNumber(25)
  void clearShowIntimate() => clearField(25);
}

class ResGraffitiGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGraffitiGift',
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
    ..aOM<BodyGraffitiGift>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BodyGraffitiGift.create)
    ..hasRequiredFields = false;

  ResGraffitiGift._() : super();
  factory ResGraffitiGift({
    $core.bool? success,
    $core.String? msg,
    BodyGraffitiGift? data,
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
  factory ResGraffitiGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGraffitiGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGraffitiGift clone() => ResGraffitiGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGraffitiGift copyWith(void Function(ResGraffitiGift) updates) =>
      super.copyWith((message) => updates(message as ResGraffitiGift))
          as ResGraffitiGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGraffitiGift create() => ResGraffitiGift._();
  ResGraffitiGift createEmptyInstance() => create();
  static $pb.PbList<ResGraffitiGift> createRepeated() =>
      $pb.PbList<ResGraffitiGift>();
  @$core.pragma('dart2js:noInline')
  static ResGraffitiGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGraffitiGift>(create);
  static ResGraffitiGift? _defaultInstance;

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
  BodyGraffitiGift get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BodyGraffitiGift v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BodyGraffitiGift ensureData() => $_ensure(2);
}

class BodyGraffitiGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BodyGraffitiGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GraffitiItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: GraffitiItem.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BodyGraffitiGift._() : super();
  factory BodyGraffitiGift({
    $core.Iterable<GraffitiItem>? list,
    $core.int? money,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (money != null) {
      _result.money = money;
    }
    return _result;
  }
  factory BodyGraffitiGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BodyGraffitiGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BodyGraffitiGift clone() => BodyGraffitiGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BodyGraffitiGift copyWith(void Function(BodyGraffitiGift) updates) =>
      super.copyWith((message) => updates(message as BodyGraffitiGift))
          as BodyGraffitiGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BodyGraffitiGift create() => BodyGraffitiGift._();
  BodyGraffitiGift createEmptyInstance() => create();
  static $pb.PbList<BodyGraffitiGift> createRepeated() =>
      $pb.PbList<BodyGraffitiGift>();
  @$core.pragma('dart2js:noInline')
  static BodyGraffitiGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BodyGraffitiGift>(create);
  static BodyGraffitiGift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GraffitiItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get money => $_getIZ(1);
  @$pb.TagNumber(2)
  set money($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMoney() => $_has(1);
  @$pb.TagNumber(2)
  void clearMoney() => clearField(2);
}

class GraffitiItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GraffitiItem',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GraffitiItem._() : super();
  factory GraffitiItem({
    $core.int? id,
    $core.String? name,
    $core.int? price,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (price != null) {
      _result.price = price;
    }
    return _result;
  }
  factory GraffitiItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GraffitiItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GraffitiItem clone() => GraffitiItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GraffitiItem copyWith(void Function(GraffitiItem) updates) =>
      super.copyWith((message) => updates(message as GraffitiItem))
          as GraffitiItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GraffitiItem create() => GraffitiItem._();
  GraffitiItem createEmptyInstance() => create();
  static $pb.PbList<GraffitiItem> createRepeated() =>
      $pb.PbList<GraffitiItem>();
  @$core.pragma('dart2js:noInline')
  static GraffitiItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GraffitiItem>(create);
  static GraffitiItem? _defaultInstance;

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

class OutstandingBoxInfo_BoxInfoItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OutstandingBoxInfo.BoxInfoItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boxId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'priceTxt')
    ..p<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loopGifts',
        $pb.PbFieldType.PU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftTxt')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'growthAdd',
        $pb.PbFieldType.OU3)
    ..a<$core.double>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wealthTimes',
        $pb.PbFieldType.OD)
    ..a<$core.double>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'growthTimes',
        $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  OutstandingBoxInfo_BoxInfoItem._() : super();
  factory OutstandingBoxInfo_BoxInfoItem({
    $core.int? boxId,
    $core.int? price,
    $core.String? priceTxt,
    $core.Iterable<$core.int>? loopGifts,
    $core.String? giftTxt,
    $core.int? growthAdd,
    $core.double? wealthTimes,
    $core.double? growthTimes,
  }) {
    final _result = create();
    if (boxId != null) {
      _result.boxId = boxId;
    }
    if (price != null) {
      _result.price = price;
    }
    if (priceTxt != null) {
      _result.priceTxt = priceTxt;
    }
    if (loopGifts != null) {
      _result.loopGifts.addAll(loopGifts);
    }
    if (giftTxt != null) {
      _result.giftTxt = giftTxt;
    }
    if (growthAdd != null) {
      _result.growthAdd = growthAdd;
    }
    if (wealthTimes != null) {
      _result.wealthTimes = wealthTimes;
    }
    if (growthTimes != null) {
      _result.growthTimes = growthTimes;
    }
    return _result;
  }
  factory OutstandingBoxInfo_BoxInfoItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OutstandingBoxInfo_BoxInfoItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OutstandingBoxInfo_BoxInfoItem clone() =>
      OutstandingBoxInfo_BoxInfoItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OutstandingBoxInfo_BoxInfoItem copyWith(
          void Function(OutstandingBoxInfo_BoxInfoItem) updates) =>
      super.copyWith(
              (message) => updates(message as OutstandingBoxInfo_BoxInfoItem))
          as OutstandingBoxInfo_BoxInfoItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OutstandingBoxInfo_BoxInfoItem create() =>
      OutstandingBoxInfo_BoxInfoItem._();
  OutstandingBoxInfo_BoxInfoItem createEmptyInstance() => create();
  static $pb.PbList<OutstandingBoxInfo_BoxInfoItem> createRepeated() =>
      $pb.PbList<OutstandingBoxInfo_BoxInfoItem>();
  @$core.pragma('dart2js:noInline')
  static OutstandingBoxInfo_BoxInfoItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OutstandingBoxInfo_BoxInfoItem>(create);
  static OutstandingBoxInfo_BoxInfoItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get boxId => $_getIZ(0);
  @$pb.TagNumber(1)
  set boxId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBoxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoxId() => clearField(1);

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
  $core.String get priceTxt => $_getSZ(2);
  @$pb.TagNumber(3)
  set priceTxt($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPriceTxt() => $_has(2);
  @$pb.TagNumber(3)
  void clearPriceTxt() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get loopGifts => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get giftTxt => $_getSZ(4);
  @$pb.TagNumber(5)
  set giftTxt($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftTxt() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftTxt() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get growthAdd => $_getIZ(5);
  @$pb.TagNumber(6)
  set growthAdd($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGrowthAdd() => $_has(5);
  @$pb.TagNumber(6)
  void clearGrowthAdd() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get wealthTimes => $_getN(6);
  @$pb.TagNumber(7)
  set wealthTimes($core.double v) {
    $_setDouble(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasWealthTimes() => $_has(6);
  @$pb.TagNumber(7)
  void clearWealthTimes() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get growthTimes => $_getN(7);
  @$pb.TagNumber(8)
  set growthTimes($core.double v) {
    $_setDouble(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGrowthTimes() => $_has(7);
  @$pb.TagNumber(8)
  void clearGrowthTimes() => clearField(8);
}

class OutstandingBoxInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OutstandingBoxInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<OutstandingBoxInfo_BoxInfoItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boxInfo',
        $pb.PbFieldType.PM,
        subBuilder: OutstandingBoxInfo_BoxInfoItem.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankingList')
    ..hasRequiredFields = false;

  OutstandingBoxInfo._() : super();
  factory OutstandingBoxInfo({
    $core.Iterable<OutstandingBoxInfo_BoxInfoItem>? boxInfo,
    $core.String? rankingList,
  }) {
    final _result = create();
    if (boxInfo != null) {
      _result.boxInfo.addAll(boxInfo);
    }
    if (rankingList != null) {
      _result.rankingList = rankingList;
    }
    return _result;
  }
  factory OutstandingBoxInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OutstandingBoxInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OutstandingBoxInfo clone() => OutstandingBoxInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OutstandingBoxInfo copyWith(void Function(OutstandingBoxInfo) updates) =>
      super.copyWith((message) => updates(message as OutstandingBoxInfo))
          as OutstandingBoxInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OutstandingBoxInfo create() => OutstandingBoxInfo._();
  OutstandingBoxInfo createEmptyInstance() => create();
  static $pb.PbList<OutstandingBoxInfo> createRepeated() =>
      $pb.PbList<OutstandingBoxInfo>();
  @$core.pragma('dart2js:noInline')
  static OutstandingBoxInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OutstandingBoxInfo>(create);
  static OutstandingBoxInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<OutstandingBoxInfo_BoxInfoItem> get boxInfo => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get rankingList => $_getSZ(1);
  @$pb.TagNumber(2)
  set rankingList($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRankingList() => $_has(1);
  @$pb.TagNumber(2)
  void clearRankingList() => clearField(2);
}

class ResBbGiftPanel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResBbGiftPanel',
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
    ..aOM<BbGiftPanelData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BbGiftPanelData.create)
    ..hasRequiredFields = false;

  ResBbGiftPanel._() : super();
  factory ResBbGiftPanel({
    $core.bool? success,
    $core.String? msg,
    BbGiftPanelData? data,
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
  factory ResBbGiftPanel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResBbGiftPanel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResBbGiftPanel clone() => ResBbGiftPanel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResBbGiftPanel copyWith(void Function(ResBbGiftPanel) updates) =>
      super.copyWith((message) => updates(message as ResBbGiftPanel))
          as ResBbGiftPanel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResBbGiftPanel create() => ResBbGiftPanel._();
  ResBbGiftPanel createEmptyInstance() => create();
  static $pb.PbList<ResBbGiftPanel> createRepeated() =>
      $pb.PbList<ResBbGiftPanel>();
  @$core.pragma('dart2js:noInline')
  static ResBbGiftPanel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResBbGiftPanel>(create);
  static ResBbGiftPanel? _defaultInstance;

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
  BbGiftPanelData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BbGiftPanelData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BbGiftPanelData ensureData() => $_ensure(2);
}

class BbGiftPanelGift_GiftSuit_ContentZone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelGift.GiftSuit.ContentZone',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isBold')
    ..hasRequiredFields = false;

  BbGiftPanelGift_GiftSuit_ContentZone._() : super();
  factory BbGiftPanelGift_GiftSuit_ContentZone({
    $core.String? content,
    $core.String? color,
    $core.bool? isBold,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (color != null) {
      _result.color = color;
    }
    if (isBold != null) {
      _result.isBold = isBold;
    }
    return _result;
  }
  factory BbGiftPanelGift_GiftSuit_ContentZone.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelGift_GiftSuit_ContentZone.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelGift_GiftSuit_ContentZone clone() =>
      BbGiftPanelGift_GiftSuit_ContentZone()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelGift_GiftSuit_ContentZone copyWith(
          void Function(BbGiftPanelGift_GiftSuit_ContentZone) updates) =>
      super.copyWith((message) =>
              updates(message as BbGiftPanelGift_GiftSuit_ContentZone))
          as BbGiftPanelGift_GiftSuit_ContentZone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelGift_GiftSuit_ContentZone create() =>
      BbGiftPanelGift_GiftSuit_ContentZone._();
  BbGiftPanelGift_GiftSuit_ContentZone createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelGift_GiftSuit_ContentZone> createRepeated() =>
      $pb.PbList<BbGiftPanelGift_GiftSuit_ContentZone>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelGift_GiftSuit_ContentZone getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          BbGiftPanelGift_GiftSuit_ContentZone>(create);
  static BbGiftPanelGift_GiftSuit_ContentZone? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get color => $_getSZ(1);
  @$pb.TagNumber(2)
  set color($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isBold => $_getBF(2);
  @$pb.TagNumber(3)
  set isBold($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsBold() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsBold() => clearField(3);
}

class BbGiftPanelGift_GiftSuit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelGift.GiftSuit',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<BbGiftPanelGift_GiftSuit_ContentZone>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleContent',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelGift_GiftSuit_ContentZone.create)
    ..pc<BbGiftPanelGift_GiftSuit_ContentZone>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'descContent',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelGift_GiftSuit_ContentZone.create)
    ..hasRequiredFields = false;

  BbGiftPanelGift_GiftSuit._() : super();
  factory BbGiftPanelGift_GiftSuit({
    $core.Iterable<BbGiftPanelGift_GiftSuit_ContentZone>? titleContent,
    $core.Iterable<BbGiftPanelGift_GiftSuit_ContentZone>? descContent,
  }) {
    final _result = create();
    if (titleContent != null) {
      _result.titleContent.addAll(titleContent);
    }
    if (descContent != null) {
      _result.descContent.addAll(descContent);
    }
    return _result;
  }
  factory BbGiftPanelGift_GiftSuit.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelGift_GiftSuit.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelGift_GiftSuit clone() =>
      BbGiftPanelGift_GiftSuit()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelGift_GiftSuit copyWith(
          void Function(BbGiftPanelGift_GiftSuit) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelGift_GiftSuit))
          as BbGiftPanelGift_GiftSuit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelGift_GiftSuit create() => BbGiftPanelGift_GiftSuit._();
  BbGiftPanelGift_GiftSuit createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelGift_GiftSuit> createRepeated() =>
      $pb.PbList<BbGiftPanelGift_GiftSuit>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelGift_GiftSuit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelGift_GiftSuit>(create);
  static BbGiftPanelGift_GiftSuit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BbGiftPanelGift_GiftSuit_ContentZone> get titleContent =>
      $_getList(0);

  @$pb.TagNumber(2)
  $core.List<BbGiftPanelGift_GiftSuit_ContentZone> get descContent =>
      $_getList(1);
}

class BbGiftPanelGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelGift',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subDisplay')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftType')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'incomeType')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'withEnd',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sizeBig',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ordering',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'naming')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'xratio')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'xtype')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'excludes')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagUrl')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagIds')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpPage')
    ..a<$core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlockLimit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isSkin',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isCombo',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..aOS(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapType')
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapSize',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapHeader',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapHeaderStart',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapHeaderEnd',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'magic',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'magicSize',
        $pb.PbFieldType.OU3)
    ..aOS(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category')
    ..a<$core.int>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isAppPublic',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pubRedPacket',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isnaming',
        $pb.PbFieldType.OU3)
    ..aOS(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOB(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'has')
    ..a<$core.int>(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cnum',
        $pb.PbFieldType.OU3)
    ..aOS(
        46,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ctype')
    ..a<$core.int>(
        47,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ductionMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        48,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlyNewpay',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        49,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..aOS(
        50,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'periodEndDesc')
    ..aOB(
        51,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'closeHit')
    ..a<$core.int>(
        52,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyIconNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        53,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyPreviewSize',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        54,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyBgSize',
        $pb.PbFieldType.OU3)
    ..aOS(
        55,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyBg')
    ..aOM<BbGiftPanelPrivilegeGift>(
        56,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privilege',
        subBuilder: BbGiftPanelPrivilegeGift.create)
    ..aOM<BbGiftPanelSkin>(
        57,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skin',
        subBuilder: BbGiftPanelSkin.create)
    ..pc<BbGiftPanelTagList>(
        58,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagList',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelTagList.create)
    ..pc<BbGiftPanelDiyGift>(
        59,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyGift',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelDiyGift.create)
    ..aOB(
        60,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isUnity')
    ..aOB(
        61,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showDesc')
    ..aOB(
        62,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isGiftReward')
    ..aOM<BbGiftPanelWeekStarNaming>(
        63,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekNaming',
        subBuilder: BbGiftPanelWeekStarNaming.create)
    ..pc<BbGiftPanelSpecialPlayItem>(
        64,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'specialPlayItems',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelSpecialPlayItem.create)
    ..aOB(
        65,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showOrderSong',
        protoName: 'showOrderSong')
    ..a<$core.int>(
        66,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subEnable',
        $pb.PbFieldType.OU3)
    ..aOM<BbGiftPanelInteractCombine>(
        67,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'combineGift',
        subBuilder: BbGiftPanelInteractCombine.create)
    ..aOM<BbGiftPanelGloryHourStarBanner>(
        68,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gloryBanner',
        subBuilder: BbGiftPanelGloryHourStarBanner.create)
    ..aOM<BbGiftPanelActivityBanner>(
        69,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activityBanner',
        subBuilder: BbGiftPanelActivityBanner.create)
    ..aOM<GiftPanelAwakeInfo>(
        70,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awakeInfo',
        subBuilder: GiftPanelAwakeInfo.create)
    ..aOM<GiftItemCornerIcon>(
        71,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'corner',
        subBuilder: GiftItemCornerIcon.create)
    ..aOM<BbGiftPanelGift_GiftSuit>(
        72,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftSuit',
        subBuilder: BbGiftPanelGift_GiftSuit.create)
    ..hasRequiredFields = false;

  BbGiftPanelGift._() : super();
  factory BbGiftPanelGift({
    $core.int? id,
    $core.String? name,
    $core.int? price,
    $core.String? display,
    $core.String? subDisplay,
    $core.String? type,
    $core.String? giftType,
    $core.String? incomeType,
    $core.int? withEnd,
    $core.int? size,
    $core.int? sizeBig,
    $core.int? ordering,
    $core.int? deleted,
    $core.int? title,
    $core.String? naming,
    $core.String? xratio,
    $core.String? xtype,
    $core.String? excludes,
    $core.String? tagUrl,
    $core.String? tagIds,
    $core.String? description,
    $core.String? jumpPage,
    $core.int? unlockLimit,
    $core.int? extId,
    $core.int? isSkin,
    $core.int? isCombo,
    $core.int? version,
    $core.String? vapType,
    $core.int? vapSize,
    $core.int? vapHeader,
    $core.int? vapHeaderStart,
    $core.int? vapHeaderEnd,
    $core.int? magic,
    $core.int? magicSize,
    $core.String? category,
    $core.int? appId,
    $core.int? isAppPublic,
    $core.int? pubRedPacket,
    $core.int? isnaming,
    $core.String? icon,
    $core.bool? has,
    $core.int? star,
    $core.int? num,
    $core.int? cid,
    $core.int? cnum,
    $core.String? ctype,
    $core.int? ductionMoney,
    $core.int? onlyNewpay,
    $core.int? state,
    $core.String? periodEndDesc,
    $core.bool? closeHit,
    $core.int? diyIconNum,
    $core.int? diyPreviewSize,
    $core.int? diyBgSize,
    $core.String? diyBg,
    BbGiftPanelPrivilegeGift? privilege,
    BbGiftPanelSkin? skin,
    $core.Iterable<BbGiftPanelTagList>? tagList,
    $core.Iterable<BbGiftPanelDiyGift>? diyGift,
    $core.bool? isUnity,
    $core.bool? showDesc,
    $core.bool? isGiftReward,
    BbGiftPanelWeekStarNaming? weekNaming,
    $core.Iterable<BbGiftPanelSpecialPlayItem>? specialPlayItems,
    $core.bool? showOrderSong,
    $core.int? subEnable,
    BbGiftPanelInteractCombine? combineGift,
    BbGiftPanelGloryHourStarBanner? gloryBanner,
    BbGiftPanelActivityBanner? activityBanner,
    GiftPanelAwakeInfo? awakeInfo,
    GiftItemCornerIcon? corner,
    BbGiftPanelGift_GiftSuit? giftSuit,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (price != null) {
      _result.price = price;
    }
    if (display != null) {
      _result.display = display;
    }
    if (subDisplay != null) {
      _result.subDisplay = subDisplay;
    }
    if (type != null) {
      _result.type = type;
    }
    if (giftType != null) {
      _result.giftType = giftType;
    }
    if (incomeType != null) {
      _result.incomeType = incomeType;
    }
    if (withEnd != null) {
      _result.withEnd = withEnd;
    }
    if (size != null) {
      _result.size = size;
    }
    if (sizeBig != null) {
      _result.sizeBig = sizeBig;
    }
    if (ordering != null) {
      _result.ordering = ordering;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (title != null) {
      _result.title = title;
    }
    if (naming != null) {
      _result.naming = naming;
    }
    if (xratio != null) {
      _result.xratio = xratio;
    }
    if (xtype != null) {
      _result.xtype = xtype;
    }
    if (excludes != null) {
      _result.excludes = excludes;
    }
    if (tagUrl != null) {
      _result.tagUrl = tagUrl;
    }
    if (tagIds != null) {
      _result.tagIds = tagIds;
    }
    if (description != null) {
      _result.description = description;
    }
    if (jumpPage != null) {
      _result.jumpPage = jumpPage;
    }
    if (unlockLimit != null) {
      _result.unlockLimit = unlockLimit;
    }
    if (extId != null) {
      _result.extId = extId;
    }
    if (isSkin != null) {
      _result.isSkin = isSkin;
    }
    if (isCombo != null) {
      _result.isCombo = isCombo;
    }
    if (version != null) {
      _result.version = version;
    }
    if (vapType != null) {
      _result.vapType = vapType;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    if (vapHeader != null) {
      _result.vapHeader = vapHeader;
    }
    if (vapHeaderStart != null) {
      _result.vapHeaderStart = vapHeaderStart;
    }
    if (vapHeaderEnd != null) {
      _result.vapHeaderEnd = vapHeaderEnd;
    }
    if (magic != null) {
      _result.magic = magic;
    }
    if (magicSize != null) {
      _result.magicSize = magicSize;
    }
    if (category != null) {
      _result.category = category;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (isAppPublic != null) {
      _result.isAppPublic = isAppPublic;
    }
    if (pubRedPacket != null) {
      _result.pubRedPacket = pubRedPacket;
    }
    if (isnaming != null) {
      _result.isnaming = isnaming;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (has != null) {
      _result.has = has;
    }
    if (star != null) {
      _result.star = star;
    }
    if (num != null) {
      _result.num = num;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (cnum != null) {
      _result.cnum = cnum;
    }
    if (ctype != null) {
      _result.ctype = ctype;
    }
    if (ductionMoney != null) {
      _result.ductionMoney = ductionMoney;
    }
    if (onlyNewpay != null) {
      _result.onlyNewpay = onlyNewpay;
    }
    if (state != null) {
      _result.state = state;
    }
    if (periodEndDesc != null) {
      _result.periodEndDesc = periodEndDesc;
    }
    if (closeHit != null) {
      _result.closeHit = closeHit;
    }
    if (diyIconNum != null) {
      _result.diyIconNum = diyIconNum;
    }
    if (diyPreviewSize != null) {
      _result.diyPreviewSize = diyPreviewSize;
    }
    if (diyBgSize != null) {
      _result.diyBgSize = diyBgSize;
    }
    if (diyBg != null) {
      _result.diyBg = diyBg;
    }
    if (privilege != null) {
      _result.privilege = privilege;
    }
    if (skin != null) {
      _result.skin = skin;
    }
    if (tagList != null) {
      _result.tagList.addAll(tagList);
    }
    if (diyGift != null) {
      _result.diyGift.addAll(diyGift);
    }
    if (isUnity != null) {
      _result.isUnity = isUnity;
    }
    if (showDesc != null) {
      _result.showDesc = showDesc;
    }
    if (isGiftReward != null) {
      _result.isGiftReward = isGiftReward;
    }
    if (weekNaming != null) {
      _result.weekNaming = weekNaming;
    }
    if (specialPlayItems != null) {
      _result.specialPlayItems.addAll(specialPlayItems);
    }
    if (showOrderSong != null) {
      _result.showOrderSong = showOrderSong;
    }
    if (subEnable != null) {
      _result.subEnable = subEnable;
    }
    if (combineGift != null) {
      _result.combineGift = combineGift;
    }
    if (gloryBanner != null) {
      _result.gloryBanner = gloryBanner;
    }
    if (activityBanner != null) {
      _result.activityBanner = activityBanner;
    }
    if (awakeInfo != null) {
      _result.awakeInfo = awakeInfo;
    }
    if (corner != null) {
      _result.corner = corner;
    }
    if (giftSuit != null) {
      _result.giftSuit = giftSuit;
    }
    return _result;
  }
  factory BbGiftPanelGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelGift clone() => BbGiftPanelGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelGift copyWith(void Function(BbGiftPanelGift) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelGift))
          as BbGiftPanelGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelGift create() => BbGiftPanelGift._();
  BbGiftPanelGift createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelGift> createRepeated() =>
      $pb.PbList<BbGiftPanelGift>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelGift>(create);
  static BbGiftPanelGift? _defaultInstance;

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
  $core.int get price => $_getIZ(2);
  @$pb.TagNumber(3)
  set price($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get display => $_getSZ(3);
  @$pb.TagNumber(4)
  set display($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDisplay() => $_has(3);
  @$pb.TagNumber(4)
  void clearDisplay() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get subDisplay => $_getSZ(4);
  @$pb.TagNumber(5)
  set subDisplay($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSubDisplay() => $_has(4);
  @$pb.TagNumber(5)
  void clearSubDisplay() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get type => $_getSZ(5);
  @$pb.TagNumber(6)
  set type($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get giftType => $_getSZ(6);
  @$pb.TagNumber(7)
  set giftType($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGiftType() => $_has(6);
  @$pb.TagNumber(7)
  void clearGiftType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get incomeType => $_getSZ(7);
  @$pb.TagNumber(8)
  set incomeType($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIncomeType() => $_has(7);
  @$pb.TagNumber(8)
  void clearIncomeType() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get withEnd => $_getIZ(8);
  @$pb.TagNumber(9)
  set withEnd($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasWithEnd() => $_has(8);
  @$pb.TagNumber(9)
  void clearWithEnd() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get size => $_getIZ(9);
  @$pb.TagNumber(10)
  set size($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasSize() => $_has(9);
  @$pb.TagNumber(10)
  void clearSize() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get sizeBig => $_getIZ(10);
  @$pb.TagNumber(11)
  set sizeBig($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasSizeBig() => $_has(10);
  @$pb.TagNumber(11)
  void clearSizeBig() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get ordering => $_getIZ(11);
  @$pb.TagNumber(12)
  set ordering($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasOrdering() => $_has(11);
  @$pb.TagNumber(12)
  void clearOrdering() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get deleted => $_getIZ(12);
  @$pb.TagNumber(13)
  set deleted($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasDeleted() => $_has(12);
  @$pb.TagNumber(13)
  void clearDeleted() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get title => $_getIZ(13);
  @$pb.TagNumber(14)
  set title($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasTitle() => $_has(13);
  @$pb.TagNumber(14)
  void clearTitle() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get naming => $_getSZ(14);
  @$pb.TagNumber(15)
  set naming($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasNaming() => $_has(14);
  @$pb.TagNumber(15)
  void clearNaming() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get xratio => $_getSZ(15);
  @$pb.TagNumber(16)
  set xratio($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasXratio() => $_has(15);
  @$pb.TagNumber(16)
  void clearXratio() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get xtype => $_getSZ(16);
  @$pb.TagNumber(17)
  set xtype($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasXtype() => $_has(16);
  @$pb.TagNumber(17)
  void clearXtype() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get excludes => $_getSZ(17);
  @$pb.TagNumber(18)
  set excludes($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasExcludes() => $_has(17);
  @$pb.TagNumber(18)
  void clearExcludes() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get tagUrl => $_getSZ(18);
  @$pb.TagNumber(19)
  set tagUrl($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasTagUrl() => $_has(18);
  @$pb.TagNumber(19)
  void clearTagUrl() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get tagIds => $_getSZ(19);
  @$pb.TagNumber(20)
  set tagIds($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasTagIds() => $_has(19);
  @$pb.TagNumber(20)
  void clearTagIds() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get description => $_getSZ(20);
  @$pb.TagNumber(21)
  set description($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasDescription() => $_has(20);
  @$pb.TagNumber(21)
  void clearDescription() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get jumpPage => $_getSZ(21);
  @$pb.TagNumber(22)
  set jumpPage($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasJumpPage() => $_has(21);
  @$pb.TagNumber(22)
  void clearJumpPage() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get unlockLimit => $_getIZ(22);
  @$pb.TagNumber(23)
  set unlockLimit($core.int v) {
    $_setUnsignedInt32(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasUnlockLimit() => $_has(22);
  @$pb.TagNumber(23)
  void clearUnlockLimit() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get extId => $_getIZ(23);
  @$pb.TagNumber(24)
  set extId($core.int v) {
    $_setUnsignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasExtId() => $_has(23);
  @$pb.TagNumber(24)
  void clearExtId() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get isSkin => $_getIZ(24);
  @$pb.TagNumber(25)
  set isSkin($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasIsSkin() => $_has(24);
  @$pb.TagNumber(25)
  void clearIsSkin() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get isCombo => $_getIZ(25);
  @$pb.TagNumber(26)
  set isCombo($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasIsCombo() => $_has(25);
  @$pb.TagNumber(26)
  void clearIsCombo() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get version => $_getIZ(26);
  @$pb.TagNumber(27)
  set version($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasVersion() => $_has(26);
  @$pb.TagNumber(27)
  void clearVersion() => clearField(27);

  @$pb.TagNumber(28)
  $core.String get vapType => $_getSZ(27);
  @$pb.TagNumber(28)
  set vapType($core.String v) {
    $_setString(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasVapType() => $_has(27);
  @$pb.TagNumber(28)
  void clearVapType() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get vapSize => $_getIZ(28);
  @$pb.TagNumber(29)
  set vapSize($core.int v) {
    $_setUnsignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasVapSize() => $_has(28);
  @$pb.TagNumber(29)
  void clearVapSize() => clearField(29);

  @$pb.TagNumber(30)
  $core.int get vapHeader => $_getIZ(29);
  @$pb.TagNumber(30)
  set vapHeader($core.int v) {
    $_setUnsignedInt32(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasVapHeader() => $_has(29);
  @$pb.TagNumber(30)
  void clearVapHeader() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get vapHeaderStart => $_getIZ(30);
  @$pb.TagNumber(31)
  set vapHeaderStart($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasVapHeaderStart() => $_has(30);
  @$pb.TagNumber(31)
  void clearVapHeaderStart() => clearField(31);

  @$pb.TagNumber(32)
  $core.int get vapHeaderEnd => $_getIZ(31);
  @$pb.TagNumber(32)
  set vapHeaderEnd($core.int v) {
    $_setUnsignedInt32(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasVapHeaderEnd() => $_has(31);
  @$pb.TagNumber(32)
  void clearVapHeaderEnd() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get magic => $_getIZ(32);
  @$pb.TagNumber(33)
  set magic($core.int v) {
    $_setUnsignedInt32(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasMagic() => $_has(32);
  @$pb.TagNumber(33)
  void clearMagic() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get magicSize => $_getIZ(33);
  @$pb.TagNumber(34)
  set magicSize($core.int v) {
    $_setUnsignedInt32(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasMagicSize() => $_has(33);
  @$pb.TagNumber(34)
  void clearMagicSize() => clearField(34);

  @$pb.TagNumber(35)
  $core.String get category => $_getSZ(34);
  @$pb.TagNumber(35)
  set category($core.String v) {
    $_setString(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasCategory() => $_has(34);
  @$pb.TagNumber(35)
  void clearCategory() => clearField(35);

  @$pb.TagNumber(36)
  $core.int get appId => $_getIZ(35);
  @$pb.TagNumber(36)
  set appId($core.int v) {
    $_setUnsignedInt32(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasAppId() => $_has(35);
  @$pb.TagNumber(36)
  void clearAppId() => clearField(36);

  @$pb.TagNumber(37)
  $core.int get isAppPublic => $_getIZ(36);
  @$pb.TagNumber(37)
  set isAppPublic($core.int v) {
    $_setUnsignedInt32(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasIsAppPublic() => $_has(36);
  @$pb.TagNumber(37)
  void clearIsAppPublic() => clearField(37);

  @$pb.TagNumber(38)
  $core.int get pubRedPacket => $_getIZ(37);
  @$pb.TagNumber(38)
  set pubRedPacket($core.int v) {
    $_setUnsignedInt32(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasPubRedPacket() => $_has(37);
  @$pb.TagNumber(38)
  void clearPubRedPacket() => clearField(38);

  @$pb.TagNumber(39)
  $core.int get isnaming => $_getIZ(38);
  @$pb.TagNumber(39)
  set isnaming($core.int v) {
    $_setUnsignedInt32(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasIsnaming() => $_has(38);
  @$pb.TagNumber(39)
  void clearIsnaming() => clearField(39);

  @$pb.TagNumber(40)
  $core.String get icon => $_getSZ(39);
  @$pb.TagNumber(40)
  set icon($core.String v) {
    $_setString(39, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasIcon() => $_has(39);
  @$pb.TagNumber(40)
  void clearIcon() => clearField(40);

  @$pb.TagNumber(41)
  $core.bool get has => $_getBF(40);
  @$pb.TagNumber(41)
  set has($core.bool v) {
    $_setBool(40, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasHas() => $_has(40);
  @$pb.TagNumber(41)
  void clearHas() => clearField(41);

  @$pb.TagNumber(42)
  $core.int get star => $_getIZ(41);
  @$pb.TagNumber(42)
  set star($core.int v) {
    $_setUnsignedInt32(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasStar() => $_has(41);
  @$pb.TagNumber(42)
  void clearStar() => clearField(42);

  @$pb.TagNumber(43)
  $core.int get num => $_getIZ(42);
  @$pb.TagNumber(43)
  set num($core.int v) {
    $_setUnsignedInt32(42, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasNum() => $_has(42);
  @$pb.TagNumber(43)
  void clearNum() => clearField(43);

  @$pb.TagNumber(44)
  $core.int get cid => $_getIZ(43);
  @$pb.TagNumber(44)
  set cid($core.int v) {
    $_setUnsignedInt32(43, v);
  }

  @$pb.TagNumber(44)
  $core.bool hasCid() => $_has(43);
  @$pb.TagNumber(44)
  void clearCid() => clearField(44);

  @$pb.TagNumber(45)
  $core.int get cnum => $_getIZ(44);
  @$pb.TagNumber(45)
  set cnum($core.int v) {
    $_setUnsignedInt32(44, v);
  }

  @$pb.TagNumber(45)
  $core.bool hasCnum() => $_has(44);
  @$pb.TagNumber(45)
  void clearCnum() => clearField(45);

  @$pb.TagNumber(46)
  $core.String get ctype => $_getSZ(45);
  @$pb.TagNumber(46)
  set ctype($core.String v) {
    $_setString(45, v);
  }

  @$pb.TagNumber(46)
  $core.bool hasCtype() => $_has(45);
  @$pb.TagNumber(46)
  void clearCtype() => clearField(46);

  @$pb.TagNumber(47)
  $core.int get ductionMoney => $_getIZ(46);
  @$pb.TagNumber(47)
  set ductionMoney($core.int v) {
    $_setUnsignedInt32(46, v);
  }

  @$pb.TagNumber(47)
  $core.bool hasDuctionMoney() => $_has(46);
  @$pb.TagNumber(47)
  void clearDuctionMoney() => clearField(47);

  @$pb.TagNumber(48)
  $core.int get onlyNewpay => $_getIZ(47);
  @$pb.TagNumber(48)
  set onlyNewpay($core.int v) {
    $_setUnsignedInt32(47, v);
  }

  @$pb.TagNumber(48)
  $core.bool hasOnlyNewpay() => $_has(47);
  @$pb.TagNumber(48)
  void clearOnlyNewpay() => clearField(48);

  @$pb.TagNumber(49)
  $core.int get state => $_getIZ(48);
  @$pb.TagNumber(49)
  set state($core.int v) {
    $_setUnsignedInt32(48, v);
  }

  @$pb.TagNumber(49)
  $core.bool hasState() => $_has(48);
  @$pb.TagNumber(49)
  void clearState() => clearField(49);

  @$pb.TagNumber(50)
  $core.String get periodEndDesc => $_getSZ(49);
  @$pb.TagNumber(50)
  set periodEndDesc($core.String v) {
    $_setString(49, v);
  }

  @$pb.TagNumber(50)
  $core.bool hasPeriodEndDesc() => $_has(49);
  @$pb.TagNumber(50)
  void clearPeriodEndDesc() => clearField(50);

  @$pb.TagNumber(51)
  $core.bool get closeHit => $_getBF(50);
  @$pb.TagNumber(51)
  set closeHit($core.bool v) {
    $_setBool(50, v);
  }

  @$pb.TagNumber(51)
  $core.bool hasCloseHit() => $_has(50);
  @$pb.TagNumber(51)
  void clearCloseHit() => clearField(51);

  @$pb.TagNumber(52)
  $core.int get diyIconNum => $_getIZ(51);
  @$pb.TagNumber(52)
  set diyIconNum($core.int v) {
    $_setUnsignedInt32(51, v);
  }

  @$pb.TagNumber(52)
  $core.bool hasDiyIconNum() => $_has(51);
  @$pb.TagNumber(52)
  void clearDiyIconNum() => clearField(52);

  @$pb.TagNumber(53)
  $core.int get diyPreviewSize => $_getIZ(52);
  @$pb.TagNumber(53)
  set diyPreviewSize($core.int v) {
    $_setUnsignedInt32(52, v);
  }

  @$pb.TagNumber(53)
  $core.bool hasDiyPreviewSize() => $_has(52);
  @$pb.TagNumber(53)
  void clearDiyPreviewSize() => clearField(53);

  @$pb.TagNumber(54)
  $core.int get diyBgSize => $_getIZ(53);
  @$pb.TagNumber(54)
  set diyBgSize($core.int v) {
    $_setUnsignedInt32(53, v);
  }

  @$pb.TagNumber(54)
  $core.bool hasDiyBgSize() => $_has(53);
  @$pb.TagNumber(54)
  void clearDiyBgSize() => clearField(54);

  @$pb.TagNumber(55)
  $core.String get diyBg => $_getSZ(54);
  @$pb.TagNumber(55)
  set diyBg($core.String v) {
    $_setString(54, v);
  }

  @$pb.TagNumber(55)
  $core.bool hasDiyBg() => $_has(54);
  @$pb.TagNumber(55)
  void clearDiyBg() => clearField(55);

  @$pb.TagNumber(56)
  BbGiftPanelPrivilegeGift get privilege => $_getN(55);
  @$pb.TagNumber(56)
  set privilege(BbGiftPanelPrivilegeGift v) {
    setField(56, v);
  }

  @$pb.TagNumber(56)
  $core.bool hasPrivilege() => $_has(55);
  @$pb.TagNumber(56)
  void clearPrivilege() => clearField(56);
  @$pb.TagNumber(56)
  BbGiftPanelPrivilegeGift ensurePrivilege() => $_ensure(55);

  @$pb.TagNumber(57)
  BbGiftPanelSkin get skin => $_getN(56);
  @$pb.TagNumber(57)
  set skin(BbGiftPanelSkin v) {
    setField(57, v);
  }

  @$pb.TagNumber(57)
  $core.bool hasSkin() => $_has(56);
  @$pb.TagNumber(57)
  void clearSkin() => clearField(57);
  @$pb.TagNumber(57)
  BbGiftPanelSkin ensureSkin() => $_ensure(56);

  @$pb.TagNumber(58)
  $core.List<BbGiftPanelTagList> get tagList => $_getList(57);

  @$pb.TagNumber(59)
  $core.List<BbGiftPanelDiyGift> get diyGift => $_getList(58);

  @$pb.TagNumber(60)
  $core.bool get isUnity => $_getBF(59);
  @$pb.TagNumber(60)
  set isUnity($core.bool v) {
    $_setBool(59, v);
  }

  @$pb.TagNumber(60)
  $core.bool hasIsUnity() => $_has(59);
  @$pb.TagNumber(60)
  void clearIsUnity() => clearField(60);

  @$pb.TagNumber(61)
  $core.bool get showDesc => $_getBF(60);
  @$pb.TagNumber(61)
  set showDesc($core.bool v) {
    $_setBool(60, v);
  }

  @$pb.TagNumber(61)
  $core.bool hasShowDesc() => $_has(60);
  @$pb.TagNumber(61)
  void clearShowDesc() => clearField(61);

  @$pb.TagNumber(62)
  $core.bool get isGiftReward => $_getBF(61);
  @$pb.TagNumber(62)
  set isGiftReward($core.bool v) {
    $_setBool(61, v);
  }

  @$pb.TagNumber(62)
  $core.bool hasIsGiftReward() => $_has(61);
  @$pb.TagNumber(62)
  void clearIsGiftReward() => clearField(62);

  @$pb.TagNumber(63)
  BbGiftPanelWeekStarNaming get weekNaming => $_getN(62);
  @$pb.TagNumber(63)
  set weekNaming(BbGiftPanelWeekStarNaming v) {
    setField(63, v);
  }

  @$pb.TagNumber(63)
  $core.bool hasWeekNaming() => $_has(62);
  @$pb.TagNumber(63)
  void clearWeekNaming() => clearField(63);
  @$pb.TagNumber(63)
  BbGiftPanelWeekStarNaming ensureWeekNaming() => $_ensure(62);

  @$pb.TagNumber(64)
  $core.List<BbGiftPanelSpecialPlayItem> get specialPlayItems => $_getList(63);

  @$pb.TagNumber(65)
  $core.bool get showOrderSong => $_getBF(64);
  @$pb.TagNumber(65)
  set showOrderSong($core.bool v) {
    $_setBool(64, v);
  }

  @$pb.TagNumber(65)
  $core.bool hasShowOrderSong() => $_has(64);
  @$pb.TagNumber(65)
  void clearShowOrderSong() => clearField(65);

  @$pb.TagNumber(66)
  $core.int get subEnable => $_getIZ(65);
  @$pb.TagNumber(66)
  set subEnable($core.int v) {
    $_setUnsignedInt32(65, v);
  }

  @$pb.TagNumber(66)
  $core.bool hasSubEnable() => $_has(65);
  @$pb.TagNumber(66)
  void clearSubEnable() => clearField(66);

  @$pb.TagNumber(67)
  BbGiftPanelInteractCombine get combineGift => $_getN(66);
  @$pb.TagNumber(67)
  set combineGift(BbGiftPanelInteractCombine v) {
    setField(67, v);
  }

  @$pb.TagNumber(67)
  $core.bool hasCombineGift() => $_has(66);
  @$pb.TagNumber(67)
  void clearCombineGift() => clearField(67);
  @$pb.TagNumber(67)
  BbGiftPanelInteractCombine ensureCombineGift() => $_ensure(66);

  @$pb.TagNumber(68)
  BbGiftPanelGloryHourStarBanner get gloryBanner => $_getN(67);
  @$pb.TagNumber(68)
  set gloryBanner(BbGiftPanelGloryHourStarBanner v) {
    setField(68, v);
  }

  @$pb.TagNumber(68)
  $core.bool hasGloryBanner() => $_has(67);
  @$pb.TagNumber(68)
  void clearGloryBanner() => clearField(68);
  @$pb.TagNumber(68)
  BbGiftPanelGloryHourStarBanner ensureGloryBanner() => $_ensure(67);

  @$pb.TagNumber(69)
  BbGiftPanelActivityBanner get activityBanner => $_getN(68);
  @$pb.TagNumber(69)
  set activityBanner(BbGiftPanelActivityBanner v) {
    setField(69, v);
  }

  @$pb.TagNumber(69)
  $core.bool hasActivityBanner() => $_has(68);
  @$pb.TagNumber(69)
  void clearActivityBanner() => clearField(69);
  @$pb.TagNumber(69)
  BbGiftPanelActivityBanner ensureActivityBanner() => $_ensure(68);

  @$pb.TagNumber(70)
  GiftPanelAwakeInfo get awakeInfo => $_getN(69);
  @$pb.TagNumber(70)
  set awakeInfo(GiftPanelAwakeInfo v) {
    setField(70, v);
  }

  @$pb.TagNumber(70)
  $core.bool hasAwakeInfo() => $_has(69);
  @$pb.TagNumber(70)
  void clearAwakeInfo() => clearField(70);
  @$pb.TagNumber(70)
  GiftPanelAwakeInfo ensureAwakeInfo() => $_ensure(69);

  @$pb.TagNumber(71)
  GiftItemCornerIcon get corner => $_getN(70);
  @$pb.TagNumber(71)
  set corner(GiftItemCornerIcon v) {
    setField(71, v);
  }

  @$pb.TagNumber(71)
  $core.bool hasCorner() => $_has(70);
  @$pb.TagNumber(71)
  void clearCorner() => clearField(71);
  @$pb.TagNumber(71)
  GiftItemCornerIcon ensureCorner() => $_ensure(70);

  @$pb.TagNumber(72)
  BbGiftPanelGift_GiftSuit get giftSuit => $_getN(71);
  @$pb.TagNumber(72)
  set giftSuit(BbGiftPanelGift_GiftSuit v) {
    setField(72, v);
  }

  @$pb.TagNumber(72)
  $core.bool hasGiftSuit() => $_has(71);
  @$pb.TagNumber(72)
  void clearGiftSuit() => clearField(72);
  @$pb.TagNumber(72)
  BbGiftPanelGift_GiftSuit ensureGiftSuit() => $_ensure(71);
}

class GiftItemCornerIcon extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftItemCornerIcon',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftTop')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightTop')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftBottom')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightBottom')
    ..hasRequiredFields = false;

  GiftItemCornerIcon._() : super();
  factory GiftItemCornerIcon({
    $core.String? leftTop,
    $core.String? rightTop,
    $core.String? leftBottom,
    $core.String? rightBottom,
  }) {
    final _result = create();
    if (leftTop != null) {
      _result.leftTop = leftTop;
    }
    if (rightTop != null) {
      _result.rightTop = rightTop;
    }
    if (leftBottom != null) {
      _result.leftBottom = leftBottom;
    }
    if (rightBottom != null) {
      _result.rightBottom = rightBottom;
    }
    return _result;
  }
  factory GiftItemCornerIcon.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftItemCornerIcon.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftItemCornerIcon clone() => GiftItemCornerIcon()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftItemCornerIcon copyWith(void Function(GiftItemCornerIcon) updates) =>
      super.copyWith((message) => updates(message as GiftItemCornerIcon))
          as GiftItemCornerIcon; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftItemCornerIcon create() => GiftItemCornerIcon._();
  GiftItemCornerIcon createEmptyInstance() => create();
  static $pb.PbList<GiftItemCornerIcon> createRepeated() =>
      $pb.PbList<GiftItemCornerIcon>();
  @$core.pragma('dart2js:noInline')
  static GiftItemCornerIcon getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftItemCornerIcon>(create);
  static GiftItemCornerIcon? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get leftTop => $_getSZ(0);
  @$pb.TagNumber(1)
  set leftTop($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeftTop() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftTop() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get rightTop => $_getSZ(1);
  @$pb.TagNumber(2)
  set rightTop($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRightTop() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightTop() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get leftBottom => $_getSZ(2);
  @$pb.TagNumber(3)
  set leftBottom($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLeftBottom() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeftBottom() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rightBottom => $_getSZ(3);
  @$pb.TagNumber(4)
  set rightBottom($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRightBottom() => $_has(3);
  @$pb.TagNumber(4)
  void clearRightBottom() => clearField(4);
}

class GiftPanelAwakeInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftPanelAwakeInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  GiftPanelAwakeInfo._() : super();
  factory GiftPanelAwakeInfo({
    $core.String? icon,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory GiftPanelAwakeInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftPanelAwakeInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftPanelAwakeInfo clone() => GiftPanelAwakeInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftPanelAwakeInfo copyWith(void Function(GiftPanelAwakeInfo) updates) =>
      super.copyWith((message) => updates(message as GiftPanelAwakeInfo))
          as GiftPanelAwakeInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftPanelAwakeInfo create() => GiftPanelAwakeInfo._();
  GiftPanelAwakeInfo createEmptyInstance() => create();
  static $pb.PbList<GiftPanelAwakeInfo> createRepeated() =>
      $pb.PbList<GiftPanelAwakeInfo>();
  @$core.pragma('dart2js:noInline')
  static GiftPanelAwakeInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftPanelAwakeInfo>(create);
  static GiftPanelAwakeInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => clearField(1);
}

class BbGiftPanelSkin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelSkin',
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
            : 'originId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skinCurrent',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skinTotal',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skinState',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tips')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardId',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardName')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardType')
    ..hasRequiredFields = false;

  BbGiftPanelSkin._() : super();
  factory BbGiftPanelSkin({
    $core.int? giftId,
    $core.String? name,
    $core.String? icon,
    $core.int? originId,
    $core.int? skinCurrent,
    $core.int? skinTotal,
    $core.int? skinState,
    $core.String? tips,
    $core.int? awardId,
    $core.String? awardName,
    $core.String? awardType,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (originId != null) {
      _result.originId = originId;
    }
    if (skinCurrent != null) {
      _result.skinCurrent = skinCurrent;
    }
    if (skinTotal != null) {
      _result.skinTotal = skinTotal;
    }
    if (skinState != null) {
      _result.skinState = skinState;
    }
    if (tips != null) {
      _result.tips = tips;
    }
    if (awardId != null) {
      _result.awardId = awardId;
    }
    if (awardName != null) {
      _result.awardName = awardName;
    }
    if (awardType != null) {
      _result.awardType = awardType;
    }
    return _result;
  }
  factory BbGiftPanelSkin.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelSkin.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelSkin clone() => BbGiftPanelSkin()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelSkin copyWith(void Function(BbGiftPanelSkin) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelSkin))
          as BbGiftPanelSkin; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelSkin create() => BbGiftPanelSkin._();
  BbGiftPanelSkin createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelSkin> createRepeated() =>
      $pb.PbList<BbGiftPanelSkin>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelSkin getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelSkin>(create);
  static BbGiftPanelSkin? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

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
  $core.int get originId => $_getIZ(3);
  @$pb.TagNumber(4)
  set originId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOriginId() => $_has(3);
  @$pb.TagNumber(4)
  void clearOriginId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get skinCurrent => $_getIZ(4);
  @$pb.TagNumber(5)
  set skinCurrent($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSkinCurrent() => $_has(4);
  @$pb.TagNumber(5)
  void clearSkinCurrent() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get skinTotal => $_getIZ(5);
  @$pb.TagNumber(6)
  set skinTotal($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSkinTotal() => $_has(5);
  @$pb.TagNumber(6)
  void clearSkinTotal() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get skinState => $_getIZ(6);
  @$pb.TagNumber(7)
  set skinState($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSkinState() => $_has(6);
  @$pb.TagNumber(7)
  void clearSkinState() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get tips => $_getSZ(7);
  @$pb.TagNumber(8)
  set tips($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTips() => $_has(7);
  @$pb.TagNumber(8)
  void clearTips() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get awardId => $_getIZ(8);
  @$pb.TagNumber(9)
  set awardId($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAwardId() => $_has(8);
  @$pb.TagNumber(9)
  void clearAwardId() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get awardName => $_getSZ(9);
  @$pb.TagNumber(10)
  set awardName($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasAwardName() => $_has(9);
  @$pb.TagNumber(10)
  void clearAwardName() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get awardType => $_getSZ(10);
  @$pb.TagNumber(11)
  set awardType($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasAwardType() => $_has(10);
  @$pb.TagNumber(11)
  void clearAwardType() => clearField(11);
}

class BbGiftPanelTagList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelTagList',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'remark')
    ..hasRequiredFields = false;

  BbGiftPanelTagList._() : super();
  factory BbGiftPanelTagList({
    $core.int? id,
    $core.String? name,
    $core.String? icon,
    $core.String? remark,
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
    if (remark != null) {
      _result.remark = remark;
    }
    return _result;
  }
  factory BbGiftPanelTagList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelTagList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelTagList clone() => BbGiftPanelTagList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelTagList copyWith(void Function(BbGiftPanelTagList) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelTagList))
          as BbGiftPanelTagList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelTagList create() => BbGiftPanelTagList._();
  BbGiftPanelTagList createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelTagList> createRepeated() =>
      $pb.PbList<BbGiftPanelTagList>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelTagList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelTagList>(create);
  static BbGiftPanelTagList? _defaultInstance;

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
  $core.String get remark => $_getSZ(3);
  @$pb.TagNumber(4)
  set remark($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRemark() => $_has(3);
  @$pb.TagNumber(4)
  void clearRemark() => clearField(4);
}

class BbGiftPanelPrivilegeGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelPrivilegeGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grantWay')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grantLimit')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weight',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpTips')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grantLimitIcon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlockTips')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grantLimitFrom',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grantLimitRange')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grantStatus')
    ..pPS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icons')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receiverTag')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpScheme')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownerIcon')
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grantStatusShow',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BbGiftPanelPrivilegeGift._() : super();
  factory BbGiftPanelPrivilegeGift({
    $core.String? grantWay,
    $core.String? grantLimit,
    $core.int? weight,
    $core.String? jumpTips,
    $core.String? grantLimitIcon,
    $core.String? unlockTips,
    $core.int? grantLimitFrom,
    $core.String? grantLimitRange,
    $core.String? grantStatus,
    $core.Iterable<$core.String>? icons,
    $core.String? receiverTag,
    $core.String? description,
    $core.String? jumpScheme,
    $core.int? ownerUid,
    $core.String? ownerIcon,
    $core.int? grantStatusShow,
  }) {
    final _result = create();
    if (grantWay != null) {
      _result.grantWay = grantWay;
    }
    if (grantLimit != null) {
      _result.grantLimit = grantLimit;
    }
    if (weight != null) {
      _result.weight = weight;
    }
    if (jumpTips != null) {
      _result.jumpTips = jumpTips;
    }
    if (grantLimitIcon != null) {
      _result.grantLimitIcon = grantLimitIcon;
    }
    if (unlockTips != null) {
      _result.unlockTips = unlockTips;
    }
    if (grantLimitFrom != null) {
      _result.grantLimitFrom = grantLimitFrom;
    }
    if (grantLimitRange != null) {
      _result.grantLimitRange = grantLimitRange;
    }
    if (grantStatus != null) {
      _result.grantStatus = grantStatus;
    }
    if (icons != null) {
      _result.icons.addAll(icons);
    }
    if (receiverTag != null) {
      _result.receiverTag = receiverTag;
    }
    if (description != null) {
      _result.description = description;
    }
    if (jumpScheme != null) {
      _result.jumpScheme = jumpScheme;
    }
    if (ownerUid != null) {
      _result.ownerUid = ownerUid;
    }
    if (ownerIcon != null) {
      _result.ownerIcon = ownerIcon;
    }
    if (grantStatusShow != null) {
      _result.grantStatusShow = grantStatusShow;
    }
    return _result;
  }
  factory BbGiftPanelPrivilegeGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelPrivilegeGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelPrivilegeGift clone() =>
      BbGiftPanelPrivilegeGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelPrivilegeGift copyWith(
          void Function(BbGiftPanelPrivilegeGift) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelPrivilegeGift))
          as BbGiftPanelPrivilegeGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelPrivilegeGift create() => BbGiftPanelPrivilegeGift._();
  BbGiftPanelPrivilegeGift createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelPrivilegeGift> createRepeated() =>
      $pb.PbList<BbGiftPanelPrivilegeGift>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelPrivilegeGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelPrivilegeGift>(create);
  static BbGiftPanelPrivilegeGift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get grantWay => $_getSZ(0);
  @$pb.TagNumber(1)
  set grantWay($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGrantWay() => $_has(0);
  @$pb.TagNumber(1)
  void clearGrantWay() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get grantLimit => $_getSZ(1);
  @$pb.TagNumber(2)
  set grantLimit($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGrantLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearGrantLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get weight => $_getIZ(2);
  @$pb.TagNumber(3)
  set weight($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearWeight() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get jumpTips => $_getSZ(3);
  @$pb.TagNumber(4)
  set jumpTips($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasJumpTips() => $_has(3);
  @$pb.TagNumber(4)
  void clearJumpTips() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get grantLimitIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set grantLimitIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGrantLimitIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearGrantLimitIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get unlockTips => $_getSZ(5);
  @$pb.TagNumber(6)
  set unlockTips($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUnlockTips() => $_has(5);
  @$pb.TagNumber(6)
  void clearUnlockTips() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get grantLimitFrom => $_getIZ(6);
  @$pb.TagNumber(7)
  set grantLimitFrom($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGrantLimitFrom() => $_has(6);
  @$pb.TagNumber(7)
  void clearGrantLimitFrom() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get grantLimitRange => $_getSZ(7);
  @$pb.TagNumber(8)
  set grantLimitRange($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGrantLimitRange() => $_has(7);
  @$pb.TagNumber(8)
  void clearGrantLimitRange() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get grantStatus => $_getSZ(8);
  @$pb.TagNumber(9)
  set grantStatus($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGrantStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearGrantStatus() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get icons => $_getList(9);

  @$pb.TagNumber(11)
  $core.String get receiverTag => $_getSZ(10);
  @$pb.TagNumber(11)
  set receiverTag($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasReceiverTag() => $_has(10);
  @$pb.TagNumber(11)
  void clearReceiverTag() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get description => $_getSZ(11);
  @$pb.TagNumber(12)
  set description($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasDescription() => $_has(11);
  @$pb.TagNumber(12)
  void clearDescription() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get jumpScheme => $_getSZ(12);
  @$pb.TagNumber(13)
  set jumpScheme($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasJumpScheme() => $_has(12);
  @$pb.TagNumber(13)
  void clearJumpScheme() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get ownerUid => $_getIZ(13);
  @$pb.TagNumber(14)
  set ownerUid($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasOwnerUid() => $_has(13);
  @$pb.TagNumber(14)
  void clearOwnerUid() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get ownerIcon => $_getSZ(14);
  @$pb.TagNumber(15)
  set ownerIcon($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasOwnerIcon() => $_has(14);
  @$pb.TagNumber(15)
  void clearOwnerIcon() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get grantStatusShow => $_getIZ(15);
  @$pb.TagNumber(16)
  set grantStatusShow($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasGrantStatusShow() => $_has(15);
  @$pb.TagNumber(16)
  void clearGrantStatusShow() => clearField(16);
}

class BbGiftPanelDiyGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelDiyGift',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subDisplay')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftType')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'incomeType')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'withEnd',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sizeBig',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ordering',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'naming')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'xratio')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'xtype')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'excludes')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagUrl')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagIds')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpPage')
    ..a<$core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlockLimit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isSkin',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isCombo',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..aOS(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapType')
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapSize',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapHeader',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapHeaderStart',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapHeaderEnd',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'magic',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'magicSize',
        $pb.PbFieldType.OU3)
    ..aOS(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category')
    ..a<$core.int>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isAppPublic',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pubRedPacket',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isnaming',
        $pb.PbFieldType.OU3)
    ..aOS(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOB(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'has')
    ..a<$core.int>(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cnum',
        $pb.PbFieldType.OU3)
    ..aOS(
        46,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ctype')
    ..a<$core.int>(
        47,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ductionMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        48,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlyNewpay',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        49,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..aOS(
        50,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'periodEndDesc')
    ..aOB(
        51,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'closeHit')
    ..a<$core.int>(
        52,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyIconNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        53,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyPreviewSize',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        54,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyBgSize',
        $pb.PbFieldType.OU3)
    ..aOS(
        55,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyBg')
    ..aOB(
        56,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyDefault')
    ..aOM<BbGiftPanelPrivilegeGift>(
        57,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privilege',
        subBuilder: BbGiftPanelPrivilegeGift.create)
    ..aOM<BbGiftPanelSkin>(
        58,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skin',
        subBuilder: BbGiftPanelSkin.create)
    ..pc<BbGiftPanelTagList>(
        59,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagList',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelTagList.create)
    ..aOB(
        60,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isUnity')
    ..a<$core.int>(
        61,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'signPrice',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        62,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'iconPrice',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        63,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'colorPrice',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        64,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'signDirection',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        65,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyUnityAndroidSize',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        66,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyUnityIosSize',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BbGiftPanelDiyGift._() : super();
  factory BbGiftPanelDiyGift({
    $core.int? id,
    $core.String? name,
    $core.int? price,
    $core.String? display,
    $core.String? subDisplay,
    $core.String? type,
    $core.String? giftType,
    $core.String? incomeType,
    $core.int? withEnd,
    $core.int? size,
    $core.int? sizeBig,
    $core.int? ordering,
    $core.int? deleted,
    $core.int? title,
    $core.String? naming,
    $core.String? xratio,
    $core.String? xtype,
    $core.String? excludes,
    $core.String? tagUrl,
    $core.String? tagIds,
    $core.String? description,
    $core.String? jumpPage,
    $core.int? unlockLimit,
    $core.int? extId,
    $core.int? isSkin,
    $core.int? isCombo,
    $core.int? version,
    $core.String? vapType,
    $core.int? vapSize,
    $core.int? vapHeader,
    $core.int? vapHeaderStart,
    $core.int? vapHeaderEnd,
    $core.int? magic,
    $core.int? magicSize,
    $core.String? category,
    $core.int? appId,
    $core.int? isAppPublic,
    $core.int? pubRedPacket,
    $core.int? isnaming,
    $core.String? icon,
    $core.bool? has,
    $core.int? star,
    $core.int? num,
    $core.int? cid,
    $core.int? cnum,
    $core.String? ctype,
    $core.int? ductionMoney,
    $core.int? onlyNewpay,
    $core.int? state,
    $core.String? periodEndDesc,
    $core.bool? closeHit,
    $core.int? diyIconNum,
    $core.int? diyPreviewSize,
    $core.int? diyBgSize,
    $core.String? diyBg,
    $core.bool? diyDefault,
    BbGiftPanelPrivilegeGift? privilege,
    BbGiftPanelSkin? skin,
    $core.Iterable<BbGiftPanelTagList>? tagList,
    $core.bool? isUnity,
    $core.int? signPrice,
    $core.int? iconPrice,
    $core.int? colorPrice,
    $core.int? signDirection,
    $core.int? diyUnityAndroidSize,
    $core.int? diyUnityIosSize,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (price != null) {
      _result.price = price;
    }
    if (display != null) {
      _result.display = display;
    }
    if (subDisplay != null) {
      _result.subDisplay = subDisplay;
    }
    if (type != null) {
      _result.type = type;
    }
    if (giftType != null) {
      _result.giftType = giftType;
    }
    if (incomeType != null) {
      _result.incomeType = incomeType;
    }
    if (withEnd != null) {
      _result.withEnd = withEnd;
    }
    if (size != null) {
      _result.size = size;
    }
    if (sizeBig != null) {
      _result.sizeBig = sizeBig;
    }
    if (ordering != null) {
      _result.ordering = ordering;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (title != null) {
      _result.title = title;
    }
    if (naming != null) {
      _result.naming = naming;
    }
    if (xratio != null) {
      _result.xratio = xratio;
    }
    if (xtype != null) {
      _result.xtype = xtype;
    }
    if (excludes != null) {
      _result.excludes = excludes;
    }
    if (tagUrl != null) {
      _result.tagUrl = tagUrl;
    }
    if (tagIds != null) {
      _result.tagIds = tagIds;
    }
    if (description != null) {
      _result.description = description;
    }
    if (jumpPage != null) {
      _result.jumpPage = jumpPage;
    }
    if (unlockLimit != null) {
      _result.unlockLimit = unlockLimit;
    }
    if (extId != null) {
      _result.extId = extId;
    }
    if (isSkin != null) {
      _result.isSkin = isSkin;
    }
    if (isCombo != null) {
      _result.isCombo = isCombo;
    }
    if (version != null) {
      _result.version = version;
    }
    if (vapType != null) {
      _result.vapType = vapType;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    if (vapHeader != null) {
      _result.vapHeader = vapHeader;
    }
    if (vapHeaderStart != null) {
      _result.vapHeaderStart = vapHeaderStart;
    }
    if (vapHeaderEnd != null) {
      _result.vapHeaderEnd = vapHeaderEnd;
    }
    if (magic != null) {
      _result.magic = magic;
    }
    if (magicSize != null) {
      _result.magicSize = magicSize;
    }
    if (category != null) {
      _result.category = category;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (isAppPublic != null) {
      _result.isAppPublic = isAppPublic;
    }
    if (pubRedPacket != null) {
      _result.pubRedPacket = pubRedPacket;
    }
    if (isnaming != null) {
      _result.isnaming = isnaming;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (has != null) {
      _result.has = has;
    }
    if (star != null) {
      _result.star = star;
    }
    if (num != null) {
      _result.num = num;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (cnum != null) {
      _result.cnum = cnum;
    }
    if (ctype != null) {
      _result.ctype = ctype;
    }
    if (ductionMoney != null) {
      _result.ductionMoney = ductionMoney;
    }
    if (onlyNewpay != null) {
      _result.onlyNewpay = onlyNewpay;
    }
    if (state != null) {
      _result.state = state;
    }
    if (periodEndDesc != null) {
      _result.periodEndDesc = periodEndDesc;
    }
    if (closeHit != null) {
      _result.closeHit = closeHit;
    }
    if (diyIconNum != null) {
      _result.diyIconNum = diyIconNum;
    }
    if (diyPreviewSize != null) {
      _result.diyPreviewSize = diyPreviewSize;
    }
    if (diyBgSize != null) {
      _result.diyBgSize = diyBgSize;
    }
    if (diyBg != null) {
      _result.diyBg = diyBg;
    }
    if (diyDefault != null) {
      _result.diyDefault = diyDefault;
    }
    if (privilege != null) {
      _result.privilege = privilege;
    }
    if (skin != null) {
      _result.skin = skin;
    }
    if (tagList != null) {
      _result.tagList.addAll(tagList);
    }
    if (isUnity != null) {
      _result.isUnity = isUnity;
    }
    if (signPrice != null) {
      _result.signPrice = signPrice;
    }
    if (iconPrice != null) {
      _result.iconPrice = iconPrice;
    }
    if (colorPrice != null) {
      _result.colorPrice = colorPrice;
    }
    if (signDirection != null) {
      _result.signDirection = signDirection;
    }
    if (diyUnityAndroidSize != null) {
      _result.diyUnityAndroidSize = diyUnityAndroidSize;
    }
    if (diyUnityIosSize != null) {
      _result.diyUnityIosSize = diyUnityIosSize;
    }
    return _result;
  }
  factory BbGiftPanelDiyGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelDiyGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelDiyGift clone() => BbGiftPanelDiyGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelDiyGift copyWith(void Function(BbGiftPanelDiyGift) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelDiyGift))
          as BbGiftPanelDiyGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelDiyGift create() => BbGiftPanelDiyGift._();
  BbGiftPanelDiyGift createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelDiyGift> createRepeated() =>
      $pb.PbList<BbGiftPanelDiyGift>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelDiyGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelDiyGift>(create);
  static BbGiftPanelDiyGift? _defaultInstance;

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
  $core.int get price => $_getIZ(2);
  @$pb.TagNumber(3)
  set price($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get display => $_getSZ(3);
  @$pb.TagNumber(4)
  set display($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDisplay() => $_has(3);
  @$pb.TagNumber(4)
  void clearDisplay() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get subDisplay => $_getSZ(4);
  @$pb.TagNumber(5)
  set subDisplay($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSubDisplay() => $_has(4);
  @$pb.TagNumber(5)
  void clearSubDisplay() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get type => $_getSZ(5);
  @$pb.TagNumber(6)
  set type($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get giftType => $_getSZ(6);
  @$pb.TagNumber(7)
  set giftType($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGiftType() => $_has(6);
  @$pb.TagNumber(7)
  void clearGiftType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get incomeType => $_getSZ(7);
  @$pb.TagNumber(8)
  set incomeType($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIncomeType() => $_has(7);
  @$pb.TagNumber(8)
  void clearIncomeType() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get withEnd => $_getIZ(8);
  @$pb.TagNumber(9)
  set withEnd($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasWithEnd() => $_has(8);
  @$pb.TagNumber(9)
  void clearWithEnd() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get size => $_getIZ(9);
  @$pb.TagNumber(10)
  set size($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasSize() => $_has(9);
  @$pb.TagNumber(10)
  void clearSize() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get sizeBig => $_getIZ(10);
  @$pb.TagNumber(11)
  set sizeBig($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasSizeBig() => $_has(10);
  @$pb.TagNumber(11)
  void clearSizeBig() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get ordering => $_getIZ(11);
  @$pb.TagNumber(12)
  set ordering($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasOrdering() => $_has(11);
  @$pb.TagNumber(12)
  void clearOrdering() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get deleted => $_getIZ(12);
  @$pb.TagNumber(13)
  set deleted($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasDeleted() => $_has(12);
  @$pb.TagNumber(13)
  void clearDeleted() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get title => $_getIZ(13);
  @$pb.TagNumber(14)
  set title($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasTitle() => $_has(13);
  @$pb.TagNumber(14)
  void clearTitle() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get naming => $_getSZ(14);
  @$pb.TagNumber(15)
  set naming($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasNaming() => $_has(14);
  @$pb.TagNumber(15)
  void clearNaming() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get xratio => $_getSZ(15);
  @$pb.TagNumber(16)
  set xratio($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasXratio() => $_has(15);
  @$pb.TagNumber(16)
  void clearXratio() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get xtype => $_getSZ(16);
  @$pb.TagNumber(17)
  set xtype($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasXtype() => $_has(16);
  @$pb.TagNumber(17)
  void clearXtype() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get excludes => $_getSZ(17);
  @$pb.TagNumber(18)
  set excludes($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasExcludes() => $_has(17);
  @$pb.TagNumber(18)
  void clearExcludes() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get tagUrl => $_getSZ(18);
  @$pb.TagNumber(19)
  set tagUrl($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasTagUrl() => $_has(18);
  @$pb.TagNumber(19)
  void clearTagUrl() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get tagIds => $_getSZ(19);
  @$pb.TagNumber(20)
  set tagIds($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasTagIds() => $_has(19);
  @$pb.TagNumber(20)
  void clearTagIds() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get description => $_getSZ(20);
  @$pb.TagNumber(21)
  set description($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasDescription() => $_has(20);
  @$pb.TagNumber(21)
  void clearDescription() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get jumpPage => $_getSZ(21);
  @$pb.TagNumber(22)
  set jumpPage($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasJumpPage() => $_has(21);
  @$pb.TagNumber(22)
  void clearJumpPage() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get unlockLimit => $_getIZ(22);
  @$pb.TagNumber(23)
  set unlockLimit($core.int v) {
    $_setUnsignedInt32(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasUnlockLimit() => $_has(22);
  @$pb.TagNumber(23)
  void clearUnlockLimit() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get extId => $_getIZ(23);
  @$pb.TagNumber(24)
  set extId($core.int v) {
    $_setUnsignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasExtId() => $_has(23);
  @$pb.TagNumber(24)
  void clearExtId() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get isSkin => $_getIZ(24);
  @$pb.TagNumber(25)
  set isSkin($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasIsSkin() => $_has(24);
  @$pb.TagNumber(25)
  void clearIsSkin() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get isCombo => $_getIZ(25);
  @$pb.TagNumber(26)
  set isCombo($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasIsCombo() => $_has(25);
  @$pb.TagNumber(26)
  void clearIsCombo() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get version => $_getIZ(26);
  @$pb.TagNumber(27)
  set version($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasVersion() => $_has(26);
  @$pb.TagNumber(27)
  void clearVersion() => clearField(27);

  @$pb.TagNumber(28)
  $core.String get vapType => $_getSZ(27);
  @$pb.TagNumber(28)
  set vapType($core.String v) {
    $_setString(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasVapType() => $_has(27);
  @$pb.TagNumber(28)
  void clearVapType() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get vapSize => $_getIZ(28);
  @$pb.TagNumber(29)
  set vapSize($core.int v) {
    $_setUnsignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasVapSize() => $_has(28);
  @$pb.TagNumber(29)
  void clearVapSize() => clearField(29);

  @$pb.TagNumber(30)
  $core.int get vapHeader => $_getIZ(29);
  @$pb.TagNumber(30)
  set vapHeader($core.int v) {
    $_setUnsignedInt32(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasVapHeader() => $_has(29);
  @$pb.TagNumber(30)
  void clearVapHeader() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get vapHeaderStart => $_getIZ(30);
  @$pb.TagNumber(31)
  set vapHeaderStart($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasVapHeaderStart() => $_has(30);
  @$pb.TagNumber(31)
  void clearVapHeaderStart() => clearField(31);

  @$pb.TagNumber(32)
  $core.int get vapHeaderEnd => $_getIZ(31);
  @$pb.TagNumber(32)
  set vapHeaderEnd($core.int v) {
    $_setUnsignedInt32(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasVapHeaderEnd() => $_has(31);
  @$pb.TagNumber(32)
  void clearVapHeaderEnd() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get magic => $_getIZ(32);
  @$pb.TagNumber(33)
  set magic($core.int v) {
    $_setUnsignedInt32(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasMagic() => $_has(32);
  @$pb.TagNumber(33)
  void clearMagic() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get magicSize => $_getIZ(33);
  @$pb.TagNumber(34)
  set magicSize($core.int v) {
    $_setUnsignedInt32(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasMagicSize() => $_has(33);
  @$pb.TagNumber(34)
  void clearMagicSize() => clearField(34);

  @$pb.TagNumber(35)
  $core.String get category => $_getSZ(34);
  @$pb.TagNumber(35)
  set category($core.String v) {
    $_setString(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasCategory() => $_has(34);
  @$pb.TagNumber(35)
  void clearCategory() => clearField(35);

  @$pb.TagNumber(36)
  $core.int get appId => $_getIZ(35);
  @$pb.TagNumber(36)
  set appId($core.int v) {
    $_setUnsignedInt32(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasAppId() => $_has(35);
  @$pb.TagNumber(36)
  void clearAppId() => clearField(36);

  @$pb.TagNumber(37)
  $core.int get isAppPublic => $_getIZ(36);
  @$pb.TagNumber(37)
  set isAppPublic($core.int v) {
    $_setUnsignedInt32(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasIsAppPublic() => $_has(36);
  @$pb.TagNumber(37)
  void clearIsAppPublic() => clearField(37);

  @$pb.TagNumber(38)
  $core.int get pubRedPacket => $_getIZ(37);
  @$pb.TagNumber(38)
  set pubRedPacket($core.int v) {
    $_setUnsignedInt32(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasPubRedPacket() => $_has(37);
  @$pb.TagNumber(38)
  void clearPubRedPacket() => clearField(38);

  @$pb.TagNumber(39)
  $core.int get isnaming => $_getIZ(38);
  @$pb.TagNumber(39)
  set isnaming($core.int v) {
    $_setUnsignedInt32(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasIsnaming() => $_has(38);
  @$pb.TagNumber(39)
  void clearIsnaming() => clearField(39);

  @$pb.TagNumber(40)
  $core.String get icon => $_getSZ(39);
  @$pb.TagNumber(40)
  set icon($core.String v) {
    $_setString(39, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasIcon() => $_has(39);
  @$pb.TagNumber(40)
  void clearIcon() => clearField(40);

  @$pb.TagNumber(41)
  $core.bool get has => $_getBF(40);
  @$pb.TagNumber(41)
  set has($core.bool v) {
    $_setBool(40, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasHas() => $_has(40);
  @$pb.TagNumber(41)
  void clearHas() => clearField(41);

  @$pb.TagNumber(42)
  $core.int get star => $_getIZ(41);
  @$pb.TagNumber(42)
  set star($core.int v) {
    $_setUnsignedInt32(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasStar() => $_has(41);
  @$pb.TagNumber(42)
  void clearStar() => clearField(42);

  @$pb.TagNumber(43)
  $core.int get num => $_getIZ(42);
  @$pb.TagNumber(43)
  set num($core.int v) {
    $_setUnsignedInt32(42, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasNum() => $_has(42);
  @$pb.TagNumber(43)
  void clearNum() => clearField(43);

  @$pb.TagNumber(44)
  $core.int get cid => $_getIZ(43);
  @$pb.TagNumber(44)
  set cid($core.int v) {
    $_setUnsignedInt32(43, v);
  }

  @$pb.TagNumber(44)
  $core.bool hasCid() => $_has(43);
  @$pb.TagNumber(44)
  void clearCid() => clearField(44);

  @$pb.TagNumber(45)
  $core.int get cnum => $_getIZ(44);
  @$pb.TagNumber(45)
  set cnum($core.int v) {
    $_setUnsignedInt32(44, v);
  }

  @$pb.TagNumber(45)
  $core.bool hasCnum() => $_has(44);
  @$pb.TagNumber(45)
  void clearCnum() => clearField(45);

  @$pb.TagNumber(46)
  $core.String get ctype => $_getSZ(45);
  @$pb.TagNumber(46)
  set ctype($core.String v) {
    $_setString(45, v);
  }

  @$pb.TagNumber(46)
  $core.bool hasCtype() => $_has(45);
  @$pb.TagNumber(46)
  void clearCtype() => clearField(46);

  @$pb.TagNumber(47)
  $core.int get ductionMoney => $_getIZ(46);
  @$pb.TagNumber(47)
  set ductionMoney($core.int v) {
    $_setUnsignedInt32(46, v);
  }

  @$pb.TagNumber(47)
  $core.bool hasDuctionMoney() => $_has(46);
  @$pb.TagNumber(47)
  void clearDuctionMoney() => clearField(47);

  @$pb.TagNumber(48)
  $core.int get onlyNewpay => $_getIZ(47);
  @$pb.TagNumber(48)
  set onlyNewpay($core.int v) {
    $_setUnsignedInt32(47, v);
  }

  @$pb.TagNumber(48)
  $core.bool hasOnlyNewpay() => $_has(47);
  @$pb.TagNumber(48)
  void clearOnlyNewpay() => clearField(48);

  @$pb.TagNumber(49)
  $core.int get state => $_getIZ(48);
  @$pb.TagNumber(49)
  set state($core.int v) {
    $_setUnsignedInt32(48, v);
  }

  @$pb.TagNumber(49)
  $core.bool hasState() => $_has(48);
  @$pb.TagNumber(49)
  void clearState() => clearField(49);

  @$pb.TagNumber(50)
  $core.String get periodEndDesc => $_getSZ(49);
  @$pb.TagNumber(50)
  set periodEndDesc($core.String v) {
    $_setString(49, v);
  }

  @$pb.TagNumber(50)
  $core.bool hasPeriodEndDesc() => $_has(49);
  @$pb.TagNumber(50)
  void clearPeriodEndDesc() => clearField(50);

  @$pb.TagNumber(51)
  $core.bool get closeHit => $_getBF(50);
  @$pb.TagNumber(51)
  set closeHit($core.bool v) {
    $_setBool(50, v);
  }

  @$pb.TagNumber(51)
  $core.bool hasCloseHit() => $_has(50);
  @$pb.TagNumber(51)
  void clearCloseHit() => clearField(51);

  @$pb.TagNumber(52)
  $core.int get diyIconNum => $_getIZ(51);
  @$pb.TagNumber(52)
  set diyIconNum($core.int v) {
    $_setUnsignedInt32(51, v);
  }

  @$pb.TagNumber(52)
  $core.bool hasDiyIconNum() => $_has(51);
  @$pb.TagNumber(52)
  void clearDiyIconNum() => clearField(52);

  @$pb.TagNumber(53)
  $core.int get diyPreviewSize => $_getIZ(52);
  @$pb.TagNumber(53)
  set diyPreviewSize($core.int v) {
    $_setUnsignedInt32(52, v);
  }

  @$pb.TagNumber(53)
  $core.bool hasDiyPreviewSize() => $_has(52);
  @$pb.TagNumber(53)
  void clearDiyPreviewSize() => clearField(53);

  @$pb.TagNumber(54)
  $core.int get diyBgSize => $_getIZ(53);
  @$pb.TagNumber(54)
  set diyBgSize($core.int v) {
    $_setUnsignedInt32(53, v);
  }

  @$pb.TagNumber(54)
  $core.bool hasDiyBgSize() => $_has(53);
  @$pb.TagNumber(54)
  void clearDiyBgSize() => clearField(54);

  @$pb.TagNumber(55)
  $core.String get diyBg => $_getSZ(54);
  @$pb.TagNumber(55)
  set diyBg($core.String v) {
    $_setString(54, v);
  }

  @$pb.TagNumber(55)
  $core.bool hasDiyBg() => $_has(54);
  @$pb.TagNumber(55)
  void clearDiyBg() => clearField(55);

  @$pb.TagNumber(56)
  $core.bool get diyDefault => $_getBF(55);
  @$pb.TagNumber(56)
  set diyDefault($core.bool v) {
    $_setBool(55, v);
  }

  @$pb.TagNumber(56)
  $core.bool hasDiyDefault() => $_has(55);
  @$pb.TagNumber(56)
  void clearDiyDefault() => clearField(56);

  @$pb.TagNumber(57)
  BbGiftPanelPrivilegeGift get privilege => $_getN(56);
  @$pb.TagNumber(57)
  set privilege(BbGiftPanelPrivilegeGift v) {
    setField(57, v);
  }

  @$pb.TagNumber(57)
  $core.bool hasPrivilege() => $_has(56);
  @$pb.TagNumber(57)
  void clearPrivilege() => clearField(57);
  @$pb.TagNumber(57)
  BbGiftPanelPrivilegeGift ensurePrivilege() => $_ensure(56);

  @$pb.TagNumber(58)
  BbGiftPanelSkin get skin => $_getN(57);
  @$pb.TagNumber(58)
  set skin(BbGiftPanelSkin v) {
    setField(58, v);
  }

  @$pb.TagNumber(58)
  $core.bool hasSkin() => $_has(57);
  @$pb.TagNumber(58)
  void clearSkin() => clearField(58);
  @$pb.TagNumber(58)
  BbGiftPanelSkin ensureSkin() => $_ensure(57);

  @$pb.TagNumber(59)
  $core.List<BbGiftPanelTagList> get tagList => $_getList(58);

  @$pb.TagNumber(60)
  $core.bool get isUnity => $_getBF(59);
  @$pb.TagNumber(60)
  set isUnity($core.bool v) {
    $_setBool(59, v);
  }

  @$pb.TagNumber(60)
  $core.bool hasIsUnity() => $_has(59);
  @$pb.TagNumber(60)
  void clearIsUnity() => clearField(60);

  @$pb.TagNumber(61)
  $core.int get signPrice => $_getIZ(60);
  @$pb.TagNumber(61)
  set signPrice($core.int v) {
    $_setUnsignedInt32(60, v);
  }

  @$pb.TagNumber(61)
  $core.bool hasSignPrice() => $_has(60);
  @$pb.TagNumber(61)
  void clearSignPrice() => clearField(61);

  @$pb.TagNumber(62)
  $core.int get iconPrice => $_getIZ(61);
  @$pb.TagNumber(62)
  set iconPrice($core.int v) {
    $_setUnsignedInt32(61, v);
  }

  @$pb.TagNumber(62)
  $core.bool hasIconPrice() => $_has(61);
  @$pb.TagNumber(62)
  void clearIconPrice() => clearField(62);

  @$pb.TagNumber(63)
  $core.int get colorPrice => $_getIZ(62);
  @$pb.TagNumber(63)
  set colorPrice($core.int v) {
    $_setUnsignedInt32(62, v);
  }

  @$pb.TagNumber(63)
  $core.bool hasColorPrice() => $_has(62);
  @$pb.TagNumber(63)
  void clearColorPrice() => clearField(63);

  @$pb.TagNumber(64)
  $core.int get signDirection => $_getIZ(63);
  @$pb.TagNumber(64)
  set signDirection($core.int v) {
    $_setUnsignedInt32(63, v);
  }

  @$pb.TagNumber(64)
  $core.bool hasSignDirection() => $_has(63);
  @$pb.TagNumber(64)
  void clearSignDirection() => clearField(64);

  @$pb.TagNumber(65)
  $core.int get diyUnityAndroidSize => $_getIZ(64);
  @$pb.TagNumber(65)
  set diyUnityAndroidSize($core.int v) {
    $_setUnsignedInt32(64, v);
  }

  @$pb.TagNumber(65)
  $core.bool hasDiyUnityAndroidSize() => $_has(64);
  @$pb.TagNumber(65)
  void clearDiyUnityAndroidSize() => clearField(65);

  @$pb.TagNumber(66)
  $core.int get diyUnityIosSize => $_getIZ(65);
  @$pb.TagNumber(66)
  set diyUnityIosSize($core.int v) {
    $_setUnsignedInt32(65, v);
  }

  @$pb.TagNumber(66)
  $core.bool hasDiyUnityIosSize() => $_has(65);
  @$pb.TagNumber(66)
  void clearDiyUnityIosSize() => clearField(66);
}

class BbGiftPanelWeekStarNaming extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelWeekStarNaming',
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
            : 'userName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasNaming')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tips')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countDown')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpUrl')
    ..hasRequiredFields = false;

  BbGiftPanelWeekStarNaming._() : super();
  factory BbGiftPanelWeekStarNaming({
    $core.int? uid,
    $core.String? userName,
    $core.String? userIcon,
    $core.bool? hasNaming,
    $core.String? tips,
    $core.String? description,
    $core.String? countDown,
    $core.String? jumpUrl,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    if (hasNaming != null) {
      _result.hasNaming = hasNaming;
    }
    if (tips != null) {
      _result.tips = tips;
    }
    if (description != null) {
      _result.description = description;
    }
    if (countDown != null) {
      _result.countDown = countDown;
    }
    if (jumpUrl != null) {
      _result.jumpUrl = jumpUrl;
    }
    return _result;
  }
  factory BbGiftPanelWeekStarNaming.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelWeekStarNaming.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelWeekStarNaming clone() =>
      BbGiftPanelWeekStarNaming()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelWeekStarNaming copyWith(
          void Function(BbGiftPanelWeekStarNaming) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelWeekStarNaming))
          as BbGiftPanelWeekStarNaming; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelWeekStarNaming create() => BbGiftPanelWeekStarNaming._();
  BbGiftPanelWeekStarNaming createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelWeekStarNaming> createRepeated() =>
      $pb.PbList<BbGiftPanelWeekStarNaming>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelWeekStarNaming getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelWeekStarNaming>(create);
  static BbGiftPanelWeekStarNaming? _defaultInstance;

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
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set userIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUserIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get hasNaming => $_getBF(3);
  @$pb.TagNumber(4)
  set hasNaming($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHasNaming() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasNaming() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get tips => $_getSZ(4);
  @$pb.TagNumber(5)
  set tips($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTips() => $_has(4);
  @$pb.TagNumber(5)
  void clearTips() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get countDown => $_getSZ(6);
  @$pb.TagNumber(7)
  set countDown($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCountDown() => $_has(6);
  @$pb.TagNumber(7)
  void clearCountDown() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get jumpUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set jumpUrl($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasJumpUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearJumpUrl() => clearField(8);
}

class BbGiftPanelGloryHourStarBanner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelGloryHourStarBanner',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftIcon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightIcon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpUrl')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'naming')
    ..hasRequiredFields = false;

  BbGiftPanelGloryHourStarBanner._() : super();
  factory BbGiftPanelGloryHourStarBanner({
    $core.int? leftUid,
    $core.int? rightUid,
    $core.String? leftIcon,
    $core.String? rightIcon,
    $core.String? title,
    $core.String? description,
    $core.String? jumpUrl,
    $core.String? naming,
  }) {
    final _result = create();
    if (leftUid != null) {
      _result.leftUid = leftUid;
    }
    if (rightUid != null) {
      _result.rightUid = rightUid;
    }
    if (leftIcon != null) {
      _result.leftIcon = leftIcon;
    }
    if (rightIcon != null) {
      _result.rightIcon = rightIcon;
    }
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (jumpUrl != null) {
      _result.jumpUrl = jumpUrl;
    }
    if (naming != null) {
      _result.naming = naming;
    }
    return _result;
  }
  factory BbGiftPanelGloryHourStarBanner.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelGloryHourStarBanner.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelGloryHourStarBanner clone() =>
      BbGiftPanelGloryHourStarBanner()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelGloryHourStarBanner copyWith(
          void Function(BbGiftPanelGloryHourStarBanner) updates) =>
      super.copyWith(
              (message) => updates(message as BbGiftPanelGloryHourStarBanner))
          as BbGiftPanelGloryHourStarBanner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelGloryHourStarBanner create() =>
      BbGiftPanelGloryHourStarBanner._();
  BbGiftPanelGloryHourStarBanner createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelGloryHourStarBanner> createRepeated() =>
      $pb.PbList<BbGiftPanelGloryHourStarBanner>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelGloryHourStarBanner getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelGloryHourStarBanner>(create);
  static BbGiftPanelGloryHourStarBanner? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get leftUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set leftUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeftUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rightUid => $_getIZ(1);
  @$pb.TagNumber(2)
  set rightUid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRightUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get leftIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set leftIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLeftIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeftIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rightIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set rightIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRightIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearRightIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(5)
  set title($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get jumpUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set jumpUrl($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasJumpUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearJumpUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get naming => $_getSZ(7);
  @$pb.TagNumber(8)
  set naming($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasNaming() => $_has(7);
  @$pb.TagNumber(8)
  void clearNaming() => clearField(8);
}

class BbGiftPanelSpecialPlayItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelSpecialPlayItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newGiftId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grantStatus')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpPage')
    ..pPS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showColor')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BbGiftPanelSpecialPlayItem._() : super();
  factory BbGiftPanelSpecialPlayItem({
    $core.int? newGiftId,
    $core.String? title,
    $core.String? grantStatus,
    $core.String? description,
    $core.String? jumpPage,
    $core.Iterable<$core.String>? showColor,
    $core.String? type,
    $core.String? icon,
    $core.int? price,
  }) {
    final _result = create();
    if (newGiftId != null) {
      _result.newGiftId = newGiftId;
    }
    if (title != null) {
      _result.title = title;
    }
    if (grantStatus != null) {
      _result.grantStatus = grantStatus;
    }
    if (description != null) {
      _result.description = description;
    }
    if (jumpPage != null) {
      _result.jumpPage = jumpPage;
    }
    if (showColor != null) {
      _result.showColor.addAll(showColor);
    }
    if (type != null) {
      _result.type = type;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (price != null) {
      _result.price = price;
    }
    return _result;
  }
  factory BbGiftPanelSpecialPlayItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelSpecialPlayItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelSpecialPlayItem clone() =>
      BbGiftPanelSpecialPlayItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelSpecialPlayItem copyWith(
          void Function(BbGiftPanelSpecialPlayItem) updates) =>
      super.copyWith(
              (message) => updates(message as BbGiftPanelSpecialPlayItem))
          as BbGiftPanelSpecialPlayItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelSpecialPlayItem create() => BbGiftPanelSpecialPlayItem._();
  BbGiftPanelSpecialPlayItem createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelSpecialPlayItem> createRepeated() =>
      $pb.PbList<BbGiftPanelSpecialPlayItem>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelSpecialPlayItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelSpecialPlayItem>(create);
  static BbGiftPanelSpecialPlayItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get newGiftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set newGiftId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNewGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewGiftId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get grantStatus => $_getSZ(2);
  @$pb.TagNumber(3)
  set grantStatus($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGrantStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearGrantStatus() => clearField(3);

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

  @$pb.TagNumber(5)
  $core.String get jumpPage => $_getSZ(4);
  @$pb.TagNumber(5)
  set jumpPage($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasJumpPage() => $_has(4);
  @$pb.TagNumber(5)
  void clearJumpPage() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get showColor => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get type => $_getSZ(6);
  @$pb.TagNumber(7)
  set type($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get icon => $_getSZ(7);
  @$pb.TagNumber(8)
  set icon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearIcon() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get price => $_getIZ(8);
  @$pb.TagNumber(9)
  set price($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPrice() => $_has(8);
  @$pb.TagNumber(9)
  void clearPrice() => clearField(9);
}

class BbGiftPanelInteractCombine extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelInteractCombine',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'combineId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'combineName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'combineDesc')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'combineType',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftA',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftAName')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftANum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftAPrice',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftATo',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftB',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftBName')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftBNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftBPrice',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftBTo',
        $pb.PbFieldType.OU3)
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftBPosition')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftBChoose')
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'combineMoney',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BbGiftPanelInteractCombine._() : super();
  factory BbGiftPanelInteractCombine({
    $core.int? combineId,
    $core.String? combineName,
    $core.String? combineDesc,
    $core.int? combineType,
    $core.int? giftA,
    $core.String? giftAName,
    $core.int? giftANum,
    $core.int? giftAPrice,
    $core.int? giftATo,
    $core.int? giftB,
    $core.String? giftBName,
    $core.int? giftBNum,
    $core.int? giftBPrice,
    $core.int? giftBTo,
    $core.String? giftBPosition,
    $core.String? giftBChoose,
    $core.int? combineMoney,
  }) {
    final _result = create();
    if (combineId != null) {
      _result.combineId = combineId;
    }
    if (combineName != null) {
      _result.combineName = combineName;
    }
    if (combineDesc != null) {
      _result.combineDesc = combineDesc;
    }
    if (combineType != null) {
      _result.combineType = combineType;
    }
    if (giftA != null) {
      _result.giftA = giftA;
    }
    if (giftAName != null) {
      _result.giftAName = giftAName;
    }
    if (giftANum != null) {
      _result.giftANum = giftANum;
    }
    if (giftAPrice != null) {
      _result.giftAPrice = giftAPrice;
    }
    if (giftATo != null) {
      _result.giftATo = giftATo;
    }
    if (giftB != null) {
      _result.giftB = giftB;
    }
    if (giftBName != null) {
      _result.giftBName = giftBName;
    }
    if (giftBNum != null) {
      _result.giftBNum = giftBNum;
    }
    if (giftBPrice != null) {
      _result.giftBPrice = giftBPrice;
    }
    if (giftBTo != null) {
      _result.giftBTo = giftBTo;
    }
    if (giftBPosition != null) {
      _result.giftBPosition = giftBPosition;
    }
    if (giftBChoose != null) {
      _result.giftBChoose = giftBChoose;
    }
    if (combineMoney != null) {
      _result.combineMoney = combineMoney;
    }
    return _result;
  }
  factory BbGiftPanelInteractCombine.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelInteractCombine.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelInteractCombine clone() =>
      BbGiftPanelInteractCombine()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelInteractCombine copyWith(
          void Function(BbGiftPanelInteractCombine) updates) =>
      super.copyWith(
              (message) => updates(message as BbGiftPanelInteractCombine))
          as BbGiftPanelInteractCombine; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelInteractCombine create() => BbGiftPanelInteractCombine._();
  BbGiftPanelInteractCombine createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelInteractCombine> createRepeated() =>
      $pb.PbList<BbGiftPanelInteractCombine>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelInteractCombine getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelInteractCombine>(create);
  static BbGiftPanelInteractCombine? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get combineId => $_getIZ(0);
  @$pb.TagNumber(1)
  set combineId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCombineId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCombineId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get combineName => $_getSZ(1);
  @$pb.TagNumber(2)
  set combineName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCombineName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCombineName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get combineDesc => $_getSZ(2);
  @$pb.TagNumber(3)
  set combineDesc($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCombineDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearCombineDesc() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get combineType => $_getIZ(3);
  @$pb.TagNumber(4)
  set combineType($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCombineType() => $_has(3);
  @$pb.TagNumber(4)
  void clearCombineType() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get giftA => $_getIZ(4);
  @$pb.TagNumber(5)
  set giftA($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftA() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftA() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get giftAName => $_getSZ(5);
  @$pb.TagNumber(6)
  set giftAName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGiftAName() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftAName() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get giftANum => $_getIZ(6);
  @$pb.TagNumber(7)
  set giftANum($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGiftANum() => $_has(6);
  @$pb.TagNumber(7)
  void clearGiftANum() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get giftAPrice => $_getIZ(7);
  @$pb.TagNumber(8)
  set giftAPrice($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGiftAPrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearGiftAPrice() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get giftATo => $_getIZ(8);
  @$pb.TagNumber(9)
  set giftATo($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGiftATo() => $_has(8);
  @$pb.TagNumber(9)
  void clearGiftATo() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get giftB => $_getIZ(9);
  @$pb.TagNumber(10)
  set giftB($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasGiftB() => $_has(9);
  @$pb.TagNumber(10)
  void clearGiftB() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get giftBName => $_getSZ(10);
  @$pb.TagNumber(11)
  set giftBName($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasGiftBName() => $_has(10);
  @$pb.TagNumber(11)
  void clearGiftBName() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get giftBNum => $_getIZ(11);
  @$pb.TagNumber(12)
  set giftBNum($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasGiftBNum() => $_has(11);
  @$pb.TagNumber(12)
  void clearGiftBNum() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get giftBPrice => $_getIZ(12);
  @$pb.TagNumber(13)
  set giftBPrice($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasGiftBPrice() => $_has(12);
  @$pb.TagNumber(13)
  void clearGiftBPrice() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get giftBTo => $_getIZ(13);
  @$pb.TagNumber(14)
  set giftBTo($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasGiftBTo() => $_has(13);
  @$pb.TagNumber(14)
  void clearGiftBTo() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get giftBPosition => $_getSZ(14);
  @$pb.TagNumber(15)
  set giftBPosition($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasGiftBPosition() => $_has(14);
  @$pb.TagNumber(15)
  void clearGiftBPosition() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get giftBChoose => $_getSZ(15);
  @$pb.TagNumber(16)
  set giftBChoose($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasGiftBChoose() => $_has(15);
  @$pb.TagNumber(16)
  void clearGiftBChoose() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get combineMoney => $_getIZ(16);
  @$pb.TagNumber(17)
  set combineMoney($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasCombineMoney() => $_has(16);
  @$pb.TagNumber(17)
  void clearCombineMoney() => clearField(17);
}

class BbGiftPanelCommodities extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelCommodities',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'periodEnd',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'used',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inUse',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subType')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageBg')
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'period',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'periodHour',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlyNewpay',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ductionMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extId',
        $pb.PbFieldType.OU3)
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extName')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpPage')
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'couponType')
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isContinue',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canOpenedByBox',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'salingOnShop',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canGive',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extIdMore',
        $pb.PbFieldType.OU3)
    ..aOS(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extra')
    ..aOS(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'moneyType')
    ..a<$core.int>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endline',
        $pb.PbFieldType.OU3)
    ..aOS(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagIds')
    ..aOS(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'specialType')
    ..a<$core.int>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'spu',
        $pb.PbFieldType.OU3)
    ..aOB(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tryVoice')
    ..a<$core.int>(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpRid',
        $pb.PbFieldType.OU3)
    ..aOS(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpType')
    ..aOS(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftType')
    ..a<$core.int>(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'useable',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        46,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        47,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boxNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        48,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'keyNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        49,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'keyPrice',
        $pb.PbFieldType.OU3)
    ..aOS(
        50,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftImage')
    ..hasRequiredFields = false;

  BbGiftPanelCommodities._() : super();
  factory BbGiftPanelCommodities({
    $core.int? id,
    $core.int? uid,
    $core.int? cid,
    $core.int? state,
    $core.int? num,
    $core.int? periodEnd,
    $core.int? used,
    $core.int? inUse,
    $core.int? dateline,
    $core.String? name,
    $core.int? groupId,
    $core.String? type,
    $core.String? subType,
    $core.String? description,
    $core.int? price,
    $core.String? image,
    $core.String? imageBg,
    $core.int? period,
    $core.int? periodHour,
    $core.int? onlyNewpay,
    $core.int? ductionMoney,
    $core.int? extId,
    $core.String? extName,
    $core.String? jumpPage,
    $core.String? couponType,
    $core.int? isContinue,
    $core.int? canOpenedByBox,
    $core.int? salingOnShop,
    $core.int? canGive,
    $core.int? title,
    $core.int? extIdMore,
    $core.String? extra,
    $core.String? moneyType,
    $core.int? startline,
    $core.int? endline,
    $core.String? tagIds,
    $core.String? specialType,
    $core.int? appId,
    $core.int? spu,
    $core.bool? tryVoice,
    $core.int? jumpRid,
    $core.String? jumpType,
    $core.String? giftType,
    $core.int? star,
    $core.int? useable,
    $core.int? maxNum,
    $core.int? boxNum,
    $core.int? keyNum,
    $core.int? keyPrice,
    $core.String? giftImage,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (state != null) {
      _result.state = state;
    }
    if (num != null) {
      _result.num = num;
    }
    if (periodEnd != null) {
      _result.periodEnd = periodEnd;
    }
    if (used != null) {
      _result.used = used;
    }
    if (inUse != null) {
      _result.inUse = inUse;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (name != null) {
      _result.name = name;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (type != null) {
      _result.type = type;
    }
    if (subType != null) {
      _result.subType = subType;
    }
    if (description != null) {
      _result.description = description;
    }
    if (price != null) {
      _result.price = price;
    }
    if (image != null) {
      _result.image = image;
    }
    if (imageBg != null) {
      _result.imageBg = imageBg;
    }
    if (period != null) {
      _result.period = period;
    }
    if (periodHour != null) {
      _result.periodHour = periodHour;
    }
    if (onlyNewpay != null) {
      _result.onlyNewpay = onlyNewpay;
    }
    if (ductionMoney != null) {
      _result.ductionMoney = ductionMoney;
    }
    if (extId != null) {
      _result.extId = extId;
    }
    if (extName != null) {
      _result.extName = extName;
    }
    if (jumpPage != null) {
      _result.jumpPage = jumpPage;
    }
    if (couponType != null) {
      _result.couponType = couponType;
    }
    if (isContinue != null) {
      _result.isContinue = isContinue;
    }
    if (canOpenedByBox != null) {
      _result.canOpenedByBox = canOpenedByBox;
    }
    if (salingOnShop != null) {
      _result.salingOnShop = salingOnShop;
    }
    if (canGive != null) {
      _result.canGive = canGive;
    }
    if (title != null) {
      _result.title = title;
    }
    if (extIdMore != null) {
      _result.extIdMore = extIdMore;
    }
    if (extra != null) {
      _result.extra = extra;
    }
    if (moneyType != null) {
      _result.moneyType = moneyType;
    }
    if (startline != null) {
      _result.startline = startline;
    }
    if (endline != null) {
      _result.endline = endline;
    }
    if (tagIds != null) {
      _result.tagIds = tagIds;
    }
    if (specialType != null) {
      _result.specialType = specialType;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (spu != null) {
      _result.spu = spu;
    }
    if (tryVoice != null) {
      _result.tryVoice = tryVoice;
    }
    if (jumpRid != null) {
      _result.jumpRid = jumpRid;
    }
    if (jumpType != null) {
      _result.jumpType = jumpType;
    }
    if (giftType != null) {
      _result.giftType = giftType;
    }
    if (star != null) {
      _result.star = star;
    }
    if (useable != null) {
      _result.useable = useable;
    }
    if (maxNum != null) {
      _result.maxNum = maxNum;
    }
    if (boxNum != null) {
      _result.boxNum = boxNum;
    }
    if (keyNum != null) {
      _result.keyNum = keyNum;
    }
    if (keyPrice != null) {
      _result.keyPrice = keyPrice;
    }
    if (giftImage != null) {
      _result.giftImage = giftImage;
    }
    return _result;
  }
  factory BbGiftPanelCommodities.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelCommodities.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelCommodities clone() =>
      BbGiftPanelCommodities()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelCommodities copyWith(
          void Function(BbGiftPanelCommodities) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelCommodities))
          as BbGiftPanelCommodities; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelCommodities create() => BbGiftPanelCommodities._();
  BbGiftPanelCommodities createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelCommodities> createRepeated() =>
      $pb.PbList<BbGiftPanelCommodities>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelCommodities getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelCommodities>(create);
  static BbGiftPanelCommodities? _defaultInstance;

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
  $core.int get cid => $_getIZ(2);
  @$pb.TagNumber(3)
  set cid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCid() => $_has(2);
  @$pb.TagNumber(3)
  void clearCid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get state => $_getIZ(3);
  @$pb.TagNumber(4)
  set state($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

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
  $core.int get periodEnd => $_getIZ(5);
  @$pb.TagNumber(6)
  set periodEnd($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPeriodEnd() => $_has(5);
  @$pb.TagNumber(6)
  void clearPeriodEnd() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get used => $_getIZ(6);
  @$pb.TagNumber(7)
  set used($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUsed() => $_has(6);
  @$pb.TagNumber(7)
  void clearUsed() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get inUse => $_getIZ(7);
  @$pb.TagNumber(8)
  set inUse($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasInUse() => $_has(7);
  @$pb.TagNumber(8)
  void clearInUse() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get dateline => $_getIZ(8);
  @$pb.TagNumber(9)
  set dateline($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasDateline() => $_has(8);
  @$pb.TagNumber(9)
  void clearDateline() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get name => $_getSZ(9);
  @$pb.TagNumber(10)
  set name($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasName() => $_has(9);
  @$pb.TagNumber(10)
  void clearName() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get groupId => $_getIZ(10);
  @$pb.TagNumber(11)
  set groupId($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasGroupId() => $_has(10);
  @$pb.TagNumber(11)
  void clearGroupId() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get type => $_getSZ(11);
  @$pb.TagNumber(12)
  set type($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasType() => $_has(11);
  @$pb.TagNumber(12)
  void clearType() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get subType => $_getSZ(12);
  @$pb.TagNumber(13)
  set subType($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasSubType() => $_has(12);
  @$pb.TagNumber(13)
  void clearSubType() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get description => $_getSZ(13);
  @$pb.TagNumber(14)
  set description($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasDescription() => $_has(13);
  @$pb.TagNumber(14)
  void clearDescription() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get price => $_getIZ(14);
  @$pb.TagNumber(15)
  set price($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasPrice() => $_has(14);
  @$pb.TagNumber(15)
  void clearPrice() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get image => $_getSZ(15);
  @$pb.TagNumber(16)
  set image($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasImage() => $_has(15);
  @$pb.TagNumber(16)
  void clearImage() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get imageBg => $_getSZ(16);
  @$pb.TagNumber(17)
  set imageBg($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasImageBg() => $_has(16);
  @$pb.TagNumber(17)
  void clearImageBg() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get period => $_getIZ(17);
  @$pb.TagNumber(18)
  set period($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasPeriod() => $_has(17);
  @$pb.TagNumber(18)
  void clearPeriod() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get periodHour => $_getIZ(18);
  @$pb.TagNumber(19)
  set periodHour($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasPeriodHour() => $_has(18);
  @$pb.TagNumber(19)
  void clearPeriodHour() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get onlyNewpay => $_getIZ(19);
  @$pb.TagNumber(20)
  set onlyNewpay($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasOnlyNewpay() => $_has(19);
  @$pb.TagNumber(20)
  void clearOnlyNewpay() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get ductionMoney => $_getIZ(20);
  @$pb.TagNumber(21)
  set ductionMoney($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasDuctionMoney() => $_has(20);
  @$pb.TagNumber(21)
  void clearDuctionMoney() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get extId => $_getIZ(21);
  @$pb.TagNumber(22)
  set extId($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasExtId() => $_has(21);
  @$pb.TagNumber(22)
  void clearExtId() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get extName => $_getSZ(22);
  @$pb.TagNumber(23)
  set extName($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasExtName() => $_has(22);
  @$pb.TagNumber(23)
  void clearExtName() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get jumpPage => $_getSZ(23);
  @$pb.TagNumber(24)
  set jumpPage($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasJumpPage() => $_has(23);
  @$pb.TagNumber(24)
  void clearJumpPage() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get couponType => $_getSZ(24);
  @$pb.TagNumber(25)
  set couponType($core.String v) {
    $_setString(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasCouponType() => $_has(24);
  @$pb.TagNumber(25)
  void clearCouponType() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get isContinue => $_getIZ(25);
  @$pb.TagNumber(26)
  set isContinue($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasIsContinue() => $_has(25);
  @$pb.TagNumber(26)
  void clearIsContinue() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get canOpenedByBox => $_getIZ(26);
  @$pb.TagNumber(27)
  set canOpenedByBox($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasCanOpenedByBox() => $_has(26);
  @$pb.TagNumber(27)
  void clearCanOpenedByBox() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get salingOnShop => $_getIZ(27);
  @$pb.TagNumber(28)
  set salingOnShop($core.int v) {
    $_setUnsignedInt32(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasSalingOnShop() => $_has(27);
  @$pb.TagNumber(28)
  void clearSalingOnShop() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get canGive => $_getIZ(28);
  @$pb.TagNumber(29)
  set canGive($core.int v) {
    $_setUnsignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasCanGive() => $_has(28);
  @$pb.TagNumber(29)
  void clearCanGive() => clearField(29);

  @$pb.TagNumber(30)
  $core.int get title => $_getIZ(29);
  @$pb.TagNumber(30)
  set title($core.int v) {
    $_setUnsignedInt32(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasTitle() => $_has(29);
  @$pb.TagNumber(30)
  void clearTitle() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get extIdMore => $_getIZ(30);
  @$pb.TagNumber(31)
  set extIdMore($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasExtIdMore() => $_has(30);
  @$pb.TagNumber(31)
  void clearExtIdMore() => clearField(31);

  @$pb.TagNumber(32)
  $core.String get extra => $_getSZ(31);
  @$pb.TagNumber(32)
  set extra($core.String v) {
    $_setString(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasExtra() => $_has(31);
  @$pb.TagNumber(32)
  void clearExtra() => clearField(32);

  @$pb.TagNumber(33)
  $core.String get moneyType => $_getSZ(32);
  @$pb.TagNumber(33)
  set moneyType($core.String v) {
    $_setString(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasMoneyType() => $_has(32);
  @$pb.TagNumber(33)
  void clearMoneyType() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get startline => $_getIZ(33);
  @$pb.TagNumber(34)
  set startline($core.int v) {
    $_setUnsignedInt32(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasStartline() => $_has(33);
  @$pb.TagNumber(34)
  void clearStartline() => clearField(34);

  @$pb.TagNumber(35)
  $core.int get endline => $_getIZ(34);
  @$pb.TagNumber(35)
  set endline($core.int v) {
    $_setUnsignedInt32(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasEndline() => $_has(34);
  @$pb.TagNumber(35)
  void clearEndline() => clearField(35);

  @$pb.TagNumber(36)
  $core.String get tagIds => $_getSZ(35);
  @$pb.TagNumber(36)
  set tagIds($core.String v) {
    $_setString(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasTagIds() => $_has(35);
  @$pb.TagNumber(36)
  void clearTagIds() => clearField(36);

  @$pb.TagNumber(37)
  $core.String get specialType => $_getSZ(36);
  @$pb.TagNumber(37)
  set specialType($core.String v) {
    $_setString(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasSpecialType() => $_has(36);
  @$pb.TagNumber(37)
  void clearSpecialType() => clearField(37);

  @$pb.TagNumber(38)
  $core.int get appId => $_getIZ(37);
  @$pb.TagNumber(38)
  set appId($core.int v) {
    $_setUnsignedInt32(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasAppId() => $_has(37);
  @$pb.TagNumber(38)
  void clearAppId() => clearField(38);

  @$pb.TagNumber(39)
  $core.int get spu => $_getIZ(38);
  @$pb.TagNumber(39)
  set spu($core.int v) {
    $_setUnsignedInt32(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasSpu() => $_has(38);
  @$pb.TagNumber(39)
  void clearSpu() => clearField(39);

  @$pb.TagNumber(40)
  $core.bool get tryVoice => $_getBF(39);
  @$pb.TagNumber(40)
  set tryVoice($core.bool v) {
    $_setBool(39, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasTryVoice() => $_has(39);
  @$pb.TagNumber(40)
  void clearTryVoice() => clearField(40);

  @$pb.TagNumber(41)
  $core.int get jumpRid => $_getIZ(40);
  @$pb.TagNumber(41)
  set jumpRid($core.int v) {
    $_setUnsignedInt32(40, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasJumpRid() => $_has(40);
  @$pb.TagNumber(41)
  void clearJumpRid() => clearField(41);

  @$pb.TagNumber(42)
  $core.String get jumpType => $_getSZ(41);
  @$pb.TagNumber(42)
  set jumpType($core.String v) {
    $_setString(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasJumpType() => $_has(41);
  @$pb.TagNumber(42)
  void clearJumpType() => clearField(42);

  @$pb.TagNumber(43)
  $core.String get giftType => $_getSZ(42);
  @$pb.TagNumber(43)
  set giftType($core.String v) {
    $_setString(42, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasGiftType() => $_has(42);
  @$pb.TagNumber(43)
  void clearGiftType() => clearField(43);

  @$pb.TagNumber(44)
  $core.int get star => $_getIZ(43);
  @$pb.TagNumber(44)
  set star($core.int v) {
    $_setUnsignedInt32(43, v);
  }

  @$pb.TagNumber(44)
  $core.bool hasStar() => $_has(43);
  @$pb.TagNumber(44)
  void clearStar() => clearField(44);

  @$pb.TagNumber(45)
  $core.int get useable => $_getIZ(44);
  @$pb.TagNumber(45)
  set useable($core.int v) {
    $_setUnsignedInt32(44, v);
  }

  @$pb.TagNumber(45)
  $core.bool hasUseable() => $_has(44);
  @$pb.TagNumber(45)
  void clearUseable() => clearField(45);

  @$pb.TagNumber(46)
  $core.int get maxNum => $_getIZ(45);
  @$pb.TagNumber(46)
  set maxNum($core.int v) {
    $_setUnsignedInt32(45, v);
  }

  @$pb.TagNumber(46)
  $core.bool hasMaxNum() => $_has(45);
  @$pb.TagNumber(46)
  void clearMaxNum() => clearField(46);

  @$pb.TagNumber(47)
  $core.int get boxNum => $_getIZ(46);
  @$pb.TagNumber(47)
  set boxNum($core.int v) {
    $_setUnsignedInt32(46, v);
  }

  @$pb.TagNumber(47)
  $core.bool hasBoxNum() => $_has(46);
  @$pb.TagNumber(47)
  void clearBoxNum() => clearField(47);

  @$pb.TagNumber(48)
  $core.int get keyNum => $_getIZ(47);
  @$pb.TagNumber(48)
  set keyNum($core.int v) {
    $_setUnsignedInt32(47, v);
  }

  @$pb.TagNumber(48)
  $core.bool hasKeyNum() => $_has(47);
  @$pb.TagNumber(48)
  void clearKeyNum() => clearField(48);

  @$pb.TagNumber(49)
  $core.int get keyPrice => $_getIZ(48);
  @$pb.TagNumber(49)
  set keyPrice($core.int v) {
    $_setUnsignedInt32(48, v);
  }

  @$pb.TagNumber(49)
  $core.bool hasKeyPrice() => $_has(48);
  @$pb.TagNumber(49)
  void clearKeyPrice() => clearField(49);

  @$pb.TagNumber(50)
  $core.String get giftImage => $_getSZ(49);
  @$pb.TagNumber(50)
  set giftImage($core.String v) {
    $_setString(49, v);
  }

  @$pb.TagNumber(50)
  $core.bool hasGiftImage() => $_has(49);
  @$pb.TagNumber(50)
  void clearGiftImage() => clearField(50);
}

class BbGiftPanelExtend extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelExtend',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goldCoin',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'moneyCoupon',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'moneyOrder',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftVersion',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'company')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showBuyHeader',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'openBoxUserMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'auctionMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hitTest',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'limitMoney',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'orderPayType')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'orderPayNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabIndex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BbGiftPanelExtend._() : super();
  factory BbGiftPanelExtend({
    $fixnum.Int64? money,
    $fixnum.Int64? goldCoin,
    $fixnum.Int64? moneyCoupon,
    $fixnum.Int64? moneyOrder,
    $core.int? giftVersion,
    $core.String? company,
    $core.int? showBuyHeader,
    $core.int? openBoxUserMoney,
    $core.int? auctionMoney,
    $core.int? hitTest,
    $core.int? limitMoney,
    $core.String? orderPayType,
    $core.int? orderPayNum,
    $core.int? tabIndex,
  }) {
    final _result = create();
    if (money != null) {
      _result.money = money;
    }
    if (goldCoin != null) {
      _result.goldCoin = goldCoin;
    }
    if (moneyCoupon != null) {
      _result.moneyCoupon = moneyCoupon;
    }
    if (moneyOrder != null) {
      _result.moneyOrder = moneyOrder;
    }
    if (giftVersion != null) {
      _result.giftVersion = giftVersion;
    }
    if (company != null) {
      _result.company = company;
    }
    if (showBuyHeader != null) {
      _result.showBuyHeader = showBuyHeader;
    }
    if (openBoxUserMoney != null) {
      _result.openBoxUserMoney = openBoxUserMoney;
    }
    if (auctionMoney != null) {
      _result.auctionMoney = auctionMoney;
    }
    if (hitTest != null) {
      _result.hitTest = hitTest;
    }
    if (limitMoney != null) {
      _result.limitMoney = limitMoney;
    }
    if (orderPayType != null) {
      _result.orderPayType = orderPayType;
    }
    if (orderPayNum != null) {
      _result.orderPayNum = orderPayNum;
    }
    if (tabIndex != null) {
      _result.tabIndex = tabIndex;
    }
    return _result;
  }
  factory BbGiftPanelExtend.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelExtend.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelExtend clone() => BbGiftPanelExtend()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelExtend copyWith(void Function(BbGiftPanelExtend) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelExtend))
          as BbGiftPanelExtend; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelExtend create() => BbGiftPanelExtend._();
  BbGiftPanelExtend createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelExtend> createRepeated() =>
      $pb.PbList<BbGiftPanelExtend>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelExtend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelExtend>(create);
  static BbGiftPanelExtend? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get money => $_getI64(0);
  @$pb.TagNumber(1)
  set money($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMoney() => $_has(0);
  @$pb.TagNumber(1)
  void clearMoney() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get goldCoin => $_getI64(1);
  @$pb.TagNumber(2)
  set goldCoin($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGoldCoin() => $_has(1);
  @$pb.TagNumber(2)
  void clearGoldCoin() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get moneyCoupon => $_getI64(2);
  @$pb.TagNumber(3)
  set moneyCoupon($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMoneyCoupon() => $_has(2);
  @$pb.TagNumber(3)
  void clearMoneyCoupon() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get moneyOrder => $_getI64(3);
  @$pb.TagNumber(4)
  set moneyOrder($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMoneyOrder() => $_has(3);
  @$pb.TagNumber(4)
  void clearMoneyOrder() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get giftVersion => $_getIZ(4);
  @$pb.TagNumber(5)
  set giftVersion($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftVersion() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get company => $_getSZ(5);
  @$pb.TagNumber(6)
  set company($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCompany() => $_has(5);
  @$pb.TagNumber(6)
  void clearCompany() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get showBuyHeader => $_getIZ(6);
  @$pb.TagNumber(7)
  set showBuyHeader($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasShowBuyHeader() => $_has(6);
  @$pb.TagNumber(7)
  void clearShowBuyHeader() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get openBoxUserMoney => $_getIZ(7);
  @$pb.TagNumber(8)
  set openBoxUserMoney($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasOpenBoxUserMoney() => $_has(7);
  @$pb.TagNumber(8)
  void clearOpenBoxUserMoney() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get auctionMoney => $_getIZ(8);
  @$pb.TagNumber(9)
  set auctionMoney($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAuctionMoney() => $_has(8);
  @$pb.TagNumber(9)
  void clearAuctionMoney() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get hitTest => $_getIZ(9);
  @$pb.TagNumber(10)
  set hitTest($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasHitTest() => $_has(9);
  @$pb.TagNumber(10)
  void clearHitTest() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get limitMoney => $_getIZ(10);
  @$pb.TagNumber(11)
  set limitMoney($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasLimitMoney() => $_has(10);
  @$pb.TagNumber(11)
  void clearLimitMoney() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get orderPayType => $_getSZ(11);
  @$pb.TagNumber(12)
  set orderPayType($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasOrderPayType() => $_has(11);
  @$pb.TagNumber(12)
  void clearOrderPayType() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get orderPayNum => $_getIZ(12);
  @$pb.TagNumber(13)
  set orderPayNum($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasOrderPayNum() => $_has(12);
  @$pb.TagNumber(13)
  void clearOrderPayNum() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get tabIndex => $_getIZ(13);
  @$pb.TagNumber(14)
  set tabIndex($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasTabIndex() => $_has(13);
  @$pb.TagNumber(14)
  void clearTabIndex() => clearField(14);
}

class BbGiftPanelKeyCoupons extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelKeyCoupons',
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
            : 'type')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ductionMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlyNewpay',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BbGiftPanelKeyCoupons._() : super();
  factory BbGiftPanelKeyCoupons({
    $core.int? id,
    $core.String? type,
    $core.int? extId,
    $core.int? num,
    $core.int? ductionMoney,
    $core.int? state,
    $core.int? onlyNewpay,
    $core.String? name,
    $core.int? cid,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    if (extId != null) {
      _result.extId = extId;
    }
    if (num != null) {
      _result.num = num;
    }
    if (ductionMoney != null) {
      _result.ductionMoney = ductionMoney;
    }
    if (state != null) {
      _result.state = state;
    }
    if (onlyNewpay != null) {
      _result.onlyNewpay = onlyNewpay;
    }
    if (name != null) {
      _result.name = name;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    return _result;
  }
  factory BbGiftPanelKeyCoupons.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelKeyCoupons.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelKeyCoupons clone() =>
      BbGiftPanelKeyCoupons()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelKeyCoupons copyWith(
          void Function(BbGiftPanelKeyCoupons) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelKeyCoupons))
          as BbGiftPanelKeyCoupons; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelKeyCoupons create() => BbGiftPanelKeyCoupons._();
  BbGiftPanelKeyCoupons createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelKeyCoupons> createRepeated() =>
      $pb.PbList<BbGiftPanelKeyCoupons>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelKeyCoupons getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelKeyCoupons>(create);
  static BbGiftPanelKeyCoupons? _defaultInstance;

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
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get extId => $_getIZ(2);
  @$pb.TagNumber(3)
  set extId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasExtId() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get num => $_getIZ(3);
  @$pb.TagNumber(4)
  set num($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get ductionMoney => $_getIZ(4);
  @$pb.TagNumber(5)
  set ductionMoney($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDuctionMoney() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuctionMoney() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get state => $_getIZ(5);
  @$pb.TagNumber(6)
  set state($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get onlyNewpay => $_getIZ(6);
  @$pb.TagNumber(7)
  set onlyNewpay($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOnlyNewpay() => $_has(6);
  @$pb.TagNumber(7)
  void clearOnlyNewpay() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get name => $_getSZ(7);
  @$pb.TagNumber(8)
  set name($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasName() => $_has(7);
  @$pb.TagNumber(8)
  void clearName() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get cid => $_getIZ(8);
  @$pb.TagNumber(9)
  set cid($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasCid() => $_has(8);
  @$pb.TagNumber(9)
  void clearCid() => clearField(9);
}

class BbGiftPanelGlobalBox extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelGlobalBox',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastRefreshSubCid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastRefreshDateline',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BbGiftPanelGlobalBox._() : super();
  factory BbGiftPanelGlobalBox({
    $core.String? type,
    $core.int? lastRefreshSubCid,
    $core.int? lastRefreshDateline,
    $core.String? name,
    $core.String? image,
    $core.int? gid,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (lastRefreshSubCid != null) {
      _result.lastRefreshSubCid = lastRefreshSubCid;
    }
    if (lastRefreshDateline != null) {
      _result.lastRefreshDateline = lastRefreshDateline;
    }
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    if (gid != null) {
      _result.gid = gid;
    }
    return _result;
  }
  factory BbGiftPanelGlobalBox.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelGlobalBox.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelGlobalBox clone() =>
      BbGiftPanelGlobalBox()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelGlobalBox copyWith(void Function(BbGiftPanelGlobalBox) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelGlobalBox))
          as BbGiftPanelGlobalBox; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelGlobalBox create() => BbGiftPanelGlobalBox._();
  BbGiftPanelGlobalBox createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelGlobalBox> createRepeated() =>
      $pb.PbList<BbGiftPanelGlobalBox>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelGlobalBox getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelGlobalBox>(create);
  static BbGiftPanelGlobalBox? _defaultInstance;

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
  $core.int get lastRefreshSubCid => $_getIZ(1);
  @$pb.TagNumber(2)
  set lastRefreshSubCid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLastRefreshSubCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastRefreshSubCid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get lastRefreshDateline => $_getIZ(2);
  @$pb.TagNumber(3)
  set lastRefreshDateline($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLastRefreshDateline() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastRefreshDateline() => clearField(3);

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
  $core.String get image => $_getSZ(4);
  @$pb.TagNumber(5)
  set image($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearImage() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get gid => $_getIZ(5);
  @$pb.TagNumber(6)
  set gid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGid() => $_has(5);
  @$pb.TagNumber(6)
  void clearGid() => clearField(6);
}

class BbGiftPanelGlobalPiece extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelGlobalPiece',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxGiftImage')
    ..pc<BbGiftPanelGpRecentGifts>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recentGifts',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelGpRecentGifts.create)
    ..hasRequiredFields = false;

  BbGiftPanelGlobalPiece._() : super();
  factory BbGiftPanelGlobalPiece({
    $core.int? maxNum,
    $core.String? url,
    $core.String? maxGiftImage,
    $core.Iterable<BbGiftPanelGpRecentGifts>? recentGifts,
  }) {
    final _result = create();
    if (maxNum != null) {
      _result.maxNum = maxNum;
    }
    if (url != null) {
      _result.url = url;
    }
    if (maxGiftImage != null) {
      _result.maxGiftImage = maxGiftImage;
    }
    if (recentGifts != null) {
      _result.recentGifts.addAll(recentGifts);
    }
    return _result;
  }
  factory BbGiftPanelGlobalPiece.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelGlobalPiece.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelGlobalPiece clone() =>
      BbGiftPanelGlobalPiece()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelGlobalPiece copyWith(
          void Function(BbGiftPanelGlobalPiece) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelGlobalPiece))
          as BbGiftPanelGlobalPiece; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelGlobalPiece create() => BbGiftPanelGlobalPiece._();
  BbGiftPanelGlobalPiece createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelGlobalPiece> createRepeated() =>
      $pb.PbList<BbGiftPanelGlobalPiece>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelGlobalPiece getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelGlobalPiece>(create);
  static BbGiftPanelGlobalPiece? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get maxNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set maxNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMaxNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxNum() => clearField(1);

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
  $core.String get maxGiftImage => $_getSZ(2);
  @$pb.TagNumber(3)
  set maxGiftImage($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMaxGiftImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxGiftImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<BbGiftPanelGpRecentGifts> get recentGifts => $_getList(3);
}

class BbGiftPanelGpRecentGifts extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelGpRecentGifts',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cname')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cimage')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cnum',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'timeText')
    ..hasRequiredFields = false;

  BbGiftPanelGpRecentGifts._() : super();
  factory BbGiftPanelGpRecentGifts({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? cname,
    $core.String? cimage,
    $core.int? cnum,
    $core.String? timeText,
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
    if (cname != null) {
      _result.cname = cname;
    }
    if (cimage != null) {
      _result.cimage = cimage;
    }
    if (cnum != null) {
      _result.cnum = cnum;
    }
    if (timeText != null) {
      _result.timeText = timeText;
    }
    return _result;
  }
  factory BbGiftPanelGpRecentGifts.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelGpRecentGifts.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelGpRecentGifts clone() =>
      BbGiftPanelGpRecentGifts()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelGpRecentGifts copyWith(
          void Function(BbGiftPanelGpRecentGifts) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelGpRecentGifts))
          as BbGiftPanelGpRecentGifts; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelGpRecentGifts create() => BbGiftPanelGpRecentGifts._();
  BbGiftPanelGpRecentGifts createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelGpRecentGifts> createRepeated() =>
      $pb.PbList<BbGiftPanelGpRecentGifts>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelGpRecentGifts getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelGpRecentGifts>(create);
  static BbGiftPanelGpRecentGifts? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.String get cname => $_getSZ(3);
  @$pb.TagNumber(4)
  set cname($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCname() => $_has(3);
  @$pb.TagNumber(4)
  void clearCname() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get cimage => $_getSZ(4);
  @$pb.TagNumber(5)
  set cimage($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCimage() => $_has(4);
  @$pb.TagNumber(5)
  void clearCimage() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get cnum => $_getIZ(5);
  @$pb.TagNumber(6)
  set cnum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCnum() => $_has(5);
  @$pb.TagNumber(6)
  void clearCnum() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get timeText => $_getSZ(6);
  @$pb.TagNumber(7)
  set timeText($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTimeText() => $_has(6);
  @$pb.TagNumber(7)
  void clearTimeText() => clearField(7);
}

class BbGiftPanelKeyCommodity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelKeyCommodity',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'periodEnd',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'used',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inUse',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subType')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageBg')
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'period',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'periodHour',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlyNewpay',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ductionMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extId',
        $pb.PbFieldType.OU3)
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extName')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpPage')
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'couponType')
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isContinue',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canOpenedByBox',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'salingOnShop',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canGive',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extIdMore',
        $pb.PbFieldType.OU3)
    ..aOS(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extra')
    ..aOS(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'moneyType')
    ..a<$core.int>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endline',
        $pb.PbFieldType.OU3)
    ..aOS(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagIds')
    ..aOS(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'specialType')
    ..a<$core.int>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BbGiftPanelKeyCommodity._() : super();
  factory BbGiftPanelKeyCommodity({
    $core.int? id,
    $core.int? uid,
    $core.int? cid,
    $core.int? state,
    $core.int? num,
    $core.int? periodEnd,
    $core.int? used,
    $core.int? inUse,
    $core.int? dateline,
    $core.String? name,
    $core.int? groupId,
    $core.String? type,
    $core.String? subType,
    $core.String? description,
    $core.int? price,
    $core.String? image,
    $core.String? imageBg,
    $core.int? period,
    $core.int? periodHour,
    $core.int? onlyNewpay,
    $core.int? ductionMoney,
    $core.int? extId,
    $core.String? extName,
    $core.String? jumpPage,
    $core.String? couponType,
    $core.int? isContinue,
    $core.int? canOpenedByBox,
    $core.int? salingOnShop,
    $core.int? canGive,
    $core.int? title,
    $core.int? extIdMore,
    $core.String? extra,
    $core.String? moneyType,
    $core.int? startline,
    $core.int? endline,
    $core.String? tagIds,
    $core.String? specialType,
    $core.int? appId,
    $core.int? star,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (state != null) {
      _result.state = state;
    }
    if (num != null) {
      _result.num = num;
    }
    if (periodEnd != null) {
      _result.periodEnd = periodEnd;
    }
    if (used != null) {
      _result.used = used;
    }
    if (inUse != null) {
      _result.inUse = inUse;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (name != null) {
      _result.name = name;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (type != null) {
      _result.type = type;
    }
    if (subType != null) {
      _result.subType = subType;
    }
    if (description != null) {
      _result.description = description;
    }
    if (price != null) {
      _result.price = price;
    }
    if (image != null) {
      _result.image = image;
    }
    if (imageBg != null) {
      _result.imageBg = imageBg;
    }
    if (period != null) {
      _result.period = period;
    }
    if (periodHour != null) {
      _result.periodHour = periodHour;
    }
    if (onlyNewpay != null) {
      _result.onlyNewpay = onlyNewpay;
    }
    if (ductionMoney != null) {
      _result.ductionMoney = ductionMoney;
    }
    if (extId != null) {
      _result.extId = extId;
    }
    if (extName != null) {
      _result.extName = extName;
    }
    if (jumpPage != null) {
      _result.jumpPage = jumpPage;
    }
    if (couponType != null) {
      _result.couponType = couponType;
    }
    if (isContinue != null) {
      _result.isContinue = isContinue;
    }
    if (canOpenedByBox != null) {
      _result.canOpenedByBox = canOpenedByBox;
    }
    if (salingOnShop != null) {
      _result.salingOnShop = salingOnShop;
    }
    if (canGive != null) {
      _result.canGive = canGive;
    }
    if (title != null) {
      _result.title = title;
    }
    if (extIdMore != null) {
      _result.extIdMore = extIdMore;
    }
    if (extra != null) {
      _result.extra = extra;
    }
    if (moneyType != null) {
      _result.moneyType = moneyType;
    }
    if (startline != null) {
      _result.startline = startline;
    }
    if (endline != null) {
      _result.endline = endline;
    }
    if (tagIds != null) {
      _result.tagIds = tagIds;
    }
    if (specialType != null) {
      _result.specialType = specialType;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (star != null) {
      _result.star = star;
    }
    return _result;
  }
  factory BbGiftPanelKeyCommodity.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelKeyCommodity.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelKeyCommodity clone() =>
      BbGiftPanelKeyCommodity()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelKeyCommodity copyWith(
          void Function(BbGiftPanelKeyCommodity) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelKeyCommodity))
          as BbGiftPanelKeyCommodity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelKeyCommodity create() => BbGiftPanelKeyCommodity._();
  BbGiftPanelKeyCommodity createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelKeyCommodity> createRepeated() =>
      $pb.PbList<BbGiftPanelKeyCommodity>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelKeyCommodity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelKeyCommodity>(create);
  static BbGiftPanelKeyCommodity? _defaultInstance;

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
  $core.int get cid => $_getIZ(2);
  @$pb.TagNumber(3)
  set cid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCid() => $_has(2);
  @$pb.TagNumber(3)
  void clearCid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get state => $_getIZ(3);
  @$pb.TagNumber(4)
  set state($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

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
  $core.int get periodEnd => $_getIZ(5);
  @$pb.TagNumber(6)
  set periodEnd($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPeriodEnd() => $_has(5);
  @$pb.TagNumber(6)
  void clearPeriodEnd() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get used => $_getIZ(6);
  @$pb.TagNumber(7)
  set used($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUsed() => $_has(6);
  @$pb.TagNumber(7)
  void clearUsed() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get inUse => $_getIZ(7);
  @$pb.TagNumber(8)
  set inUse($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasInUse() => $_has(7);
  @$pb.TagNumber(8)
  void clearInUse() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get dateline => $_getIZ(8);
  @$pb.TagNumber(9)
  set dateline($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasDateline() => $_has(8);
  @$pb.TagNumber(9)
  void clearDateline() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get name => $_getSZ(9);
  @$pb.TagNumber(10)
  set name($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasName() => $_has(9);
  @$pb.TagNumber(10)
  void clearName() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get groupId => $_getIZ(10);
  @$pb.TagNumber(11)
  set groupId($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasGroupId() => $_has(10);
  @$pb.TagNumber(11)
  void clearGroupId() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get type => $_getSZ(11);
  @$pb.TagNumber(12)
  set type($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasType() => $_has(11);
  @$pb.TagNumber(12)
  void clearType() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get subType => $_getSZ(12);
  @$pb.TagNumber(13)
  set subType($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasSubType() => $_has(12);
  @$pb.TagNumber(13)
  void clearSubType() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get description => $_getSZ(13);
  @$pb.TagNumber(14)
  set description($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasDescription() => $_has(13);
  @$pb.TagNumber(14)
  void clearDescription() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get price => $_getIZ(14);
  @$pb.TagNumber(15)
  set price($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasPrice() => $_has(14);
  @$pb.TagNumber(15)
  void clearPrice() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get image => $_getSZ(15);
  @$pb.TagNumber(16)
  set image($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasImage() => $_has(15);
  @$pb.TagNumber(16)
  void clearImage() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get imageBg => $_getSZ(16);
  @$pb.TagNumber(17)
  set imageBg($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasImageBg() => $_has(16);
  @$pb.TagNumber(17)
  void clearImageBg() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get period => $_getIZ(17);
  @$pb.TagNumber(18)
  set period($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasPeriod() => $_has(17);
  @$pb.TagNumber(18)
  void clearPeriod() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get periodHour => $_getIZ(18);
  @$pb.TagNumber(19)
  set periodHour($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasPeriodHour() => $_has(18);
  @$pb.TagNumber(19)
  void clearPeriodHour() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get onlyNewpay => $_getIZ(19);
  @$pb.TagNumber(20)
  set onlyNewpay($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasOnlyNewpay() => $_has(19);
  @$pb.TagNumber(20)
  void clearOnlyNewpay() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get ductionMoney => $_getIZ(20);
  @$pb.TagNumber(21)
  set ductionMoney($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasDuctionMoney() => $_has(20);
  @$pb.TagNumber(21)
  void clearDuctionMoney() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get extId => $_getIZ(21);
  @$pb.TagNumber(22)
  set extId($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasExtId() => $_has(21);
  @$pb.TagNumber(22)
  void clearExtId() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get extName => $_getSZ(22);
  @$pb.TagNumber(23)
  set extName($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasExtName() => $_has(22);
  @$pb.TagNumber(23)
  void clearExtName() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get jumpPage => $_getSZ(23);
  @$pb.TagNumber(24)
  set jumpPage($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasJumpPage() => $_has(23);
  @$pb.TagNumber(24)
  void clearJumpPage() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get couponType => $_getSZ(24);
  @$pb.TagNumber(25)
  set couponType($core.String v) {
    $_setString(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasCouponType() => $_has(24);
  @$pb.TagNumber(25)
  void clearCouponType() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get isContinue => $_getIZ(25);
  @$pb.TagNumber(26)
  set isContinue($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasIsContinue() => $_has(25);
  @$pb.TagNumber(26)
  void clearIsContinue() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get canOpenedByBox => $_getIZ(26);
  @$pb.TagNumber(27)
  set canOpenedByBox($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasCanOpenedByBox() => $_has(26);
  @$pb.TagNumber(27)
  void clearCanOpenedByBox() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get salingOnShop => $_getIZ(27);
  @$pb.TagNumber(28)
  set salingOnShop($core.int v) {
    $_setUnsignedInt32(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasSalingOnShop() => $_has(27);
  @$pb.TagNumber(28)
  void clearSalingOnShop() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get canGive => $_getIZ(28);
  @$pb.TagNumber(29)
  set canGive($core.int v) {
    $_setUnsignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasCanGive() => $_has(28);
  @$pb.TagNumber(29)
  void clearCanGive() => clearField(29);

  @$pb.TagNumber(30)
  $core.int get title => $_getIZ(29);
  @$pb.TagNumber(30)
  set title($core.int v) {
    $_setUnsignedInt32(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasTitle() => $_has(29);
  @$pb.TagNumber(30)
  void clearTitle() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get extIdMore => $_getIZ(30);
  @$pb.TagNumber(31)
  set extIdMore($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasExtIdMore() => $_has(30);
  @$pb.TagNumber(31)
  void clearExtIdMore() => clearField(31);

  @$pb.TagNumber(32)
  $core.String get extra => $_getSZ(31);
  @$pb.TagNumber(32)
  set extra($core.String v) {
    $_setString(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasExtra() => $_has(31);
  @$pb.TagNumber(32)
  void clearExtra() => clearField(32);

  @$pb.TagNumber(33)
  $core.String get moneyType => $_getSZ(32);
  @$pb.TagNumber(33)
  set moneyType($core.String v) {
    $_setString(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasMoneyType() => $_has(32);
  @$pb.TagNumber(33)
  void clearMoneyType() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get startline => $_getIZ(33);
  @$pb.TagNumber(34)
  set startline($core.int v) {
    $_setUnsignedInt32(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasStartline() => $_has(33);
  @$pb.TagNumber(34)
  void clearStartline() => clearField(34);

  @$pb.TagNumber(35)
  $core.int get endline => $_getIZ(34);
  @$pb.TagNumber(35)
  set endline($core.int v) {
    $_setUnsignedInt32(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasEndline() => $_has(34);
  @$pb.TagNumber(35)
  void clearEndline() => clearField(35);

  @$pb.TagNumber(36)
  $core.String get tagIds => $_getSZ(35);
  @$pb.TagNumber(36)
  set tagIds($core.String v) {
    $_setString(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasTagIds() => $_has(35);
  @$pb.TagNumber(36)
  void clearTagIds() => clearField(36);

  @$pb.TagNumber(37)
  $core.String get specialType => $_getSZ(36);
  @$pb.TagNumber(37)
  set specialType($core.String v) {
    $_setString(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasSpecialType() => $_has(36);
  @$pb.TagNumber(37)
  void clearSpecialType() => clearField(37);

  @$pb.TagNumber(38)
  $core.int get appId => $_getIZ(37);
  @$pb.TagNumber(38)
  set appId($core.int v) {
    $_setUnsignedInt32(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasAppId() => $_has(37);
  @$pb.TagNumber(38)
  void clearAppId() => clearField(38);

  @$pb.TagNumber(39)
  $core.int get star => $_getIZ(38);
  @$pb.TagNumber(39)
  set star($core.int v) {
    $_setUnsignedInt32(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasStar() => $_has(38);
  @$pb.TagNumber(39)
  void clearStar() => clearField(39);
}

class BbGiftPanelShopCommodities extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelShopCommodities',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<$0.EntityXsCommodity>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: $0.EntityXsCommodity.create)
    ..aOM<BbGiftPanelShopCoupon>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'coupon',
        subBuilder: BbGiftPanelShopCoupon.create)
    ..hasRequiredFields = false;

  BbGiftPanelShopCommodities._() : super();
  factory BbGiftPanelShopCommodities({
    $0.EntityXsCommodity? data,
    BbGiftPanelShopCoupon? coupon,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    if (coupon != null) {
      _result.coupon = coupon;
    }
    return _result;
  }
  factory BbGiftPanelShopCommodities.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelShopCommodities.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelShopCommodities clone() =>
      BbGiftPanelShopCommodities()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelShopCommodities copyWith(
          void Function(BbGiftPanelShopCommodities) updates) =>
      super.copyWith(
              (message) => updates(message as BbGiftPanelShopCommodities))
          as BbGiftPanelShopCommodities; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelShopCommodities create() => BbGiftPanelShopCommodities._();
  BbGiftPanelShopCommodities createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelShopCommodities> createRepeated() =>
      $pb.PbList<BbGiftPanelShopCommodities>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelShopCommodities getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelShopCommodities>(create);
  static BbGiftPanelShopCommodities? _defaultInstance;

  @$pb.TagNumber(1)
  $0.EntityXsCommodity get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($0.EntityXsCommodity v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  $0.EntityXsCommodity ensureData() => $_ensure(0);

  @$pb.TagNumber(2)
  BbGiftPanelShopCoupon get coupon => $_getN(1);
  @$pb.TagNumber(2)
  set coupon(BbGiftPanelShopCoupon v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCoupon() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoupon() => clearField(2);
  @$pb.TagNumber(2)
  BbGiftPanelShopCoupon ensureCoupon() => $_ensure(1);
}

class BbGiftPanelShopCoupon extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelShopCoupon',
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
            : 'type')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'couponType')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ductionMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlyNewpay',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BbGiftPanelShopCoupon._() : super();
  factory BbGiftPanelShopCoupon({
    $core.int? id,
    $core.String? type,
    $core.String? couponType,
    $core.int? extId,
    $core.int? num,
    $core.int? ductionMoney,
    $core.int? state,
    $core.int? onlyNewpay,
    $core.String? name,
    $core.int? cid,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    if (couponType != null) {
      _result.couponType = couponType;
    }
    if (extId != null) {
      _result.extId = extId;
    }
    if (num != null) {
      _result.num = num;
    }
    if (ductionMoney != null) {
      _result.ductionMoney = ductionMoney;
    }
    if (state != null) {
      _result.state = state;
    }
    if (onlyNewpay != null) {
      _result.onlyNewpay = onlyNewpay;
    }
    if (name != null) {
      _result.name = name;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    return _result;
  }
  factory BbGiftPanelShopCoupon.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelShopCoupon.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelShopCoupon clone() =>
      BbGiftPanelShopCoupon()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelShopCoupon copyWith(
          void Function(BbGiftPanelShopCoupon) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelShopCoupon))
          as BbGiftPanelShopCoupon; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelShopCoupon create() => BbGiftPanelShopCoupon._();
  BbGiftPanelShopCoupon createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelShopCoupon> createRepeated() =>
      $pb.PbList<BbGiftPanelShopCoupon>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelShopCoupon getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelShopCoupon>(create);
  static BbGiftPanelShopCoupon? _defaultInstance;

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
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get couponType => $_getSZ(2);
  @$pb.TagNumber(3)
  set couponType($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCouponType() => $_has(2);
  @$pb.TagNumber(3)
  void clearCouponType() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get extId => $_getIZ(3);
  @$pb.TagNumber(4)
  set extId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasExtId() => $_has(3);
  @$pb.TagNumber(4)
  void clearExtId() => clearField(4);

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
  $core.int get ductionMoney => $_getIZ(5);
  @$pb.TagNumber(6)
  set ductionMoney($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDuctionMoney() => $_has(5);
  @$pb.TagNumber(6)
  void clearDuctionMoney() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get state => $_getIZ(6);
  @$pb.TagNumber(7)
  set state($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasState() => $_has(6);
  @$pb.TagNumber(7)
  void clearState() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get onlyNewpay => $_getIZ(7);
  @$pb.TagNumber(8)
  set onlyNewpay($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasOnlyNewpay() => $_has(7);
  @$pb.TagNumber(8)
  void clearOnlyNewpay() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get name => $_getSZ(8);
  @$pb.TagNumber(9)
  set name($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasName() => $_has(8);
  @$pb.TagNumber(9)
  void clearName() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get cid => $_getIZ(9);
  @$pb.TagNumber(10)
  set cid($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCid() => $_has(9);
  @$pb.TagNumber(10)
  void clearCid() => clearField(10);
}

class BbGiftPanelKeyName extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelKeyName',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'key',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  BbGiftPanelKeyName._() : super();
  factory BbGiftPanelKeyName({
    $core.int? key,
    $core.String? name,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory BbGiftPanelKeyName.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelKeyName.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelKeyName clone() => BbGiftPanelKeyName()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelKeyName copyWith(void Function(BbGiftPanelKeyName) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelKeyName))
          as BbGiftPanelKeyName; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelKeyName create() => BbGiftPanelKeyName._();
  BbGiftPanelKeyName createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelKeyName> createRepeated() =>
      $pb.PbList<BbGiftPanelKeyName>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelKeyName getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelKeyName>(create);
  static BbGiftPanelKeyName? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get key => $_getIZ(0);
  @$pb.TagNumber(1)
  set key($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

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
}

class BbGiftPanelDecorates extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelDecorates',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'decorateType')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'decorateTypeName')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'moneyType')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'period')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ductionRate',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubbleDesc')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubbleFrontColor')
    ..aOM<BbGiftPanelShopCoupon>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'coupon',
        subBuilder: BbGiftPanelShopCoupon.create)
    ..hasRequiredFields = false;

  BbGiftPanelDecorates._() : super();
  factory BbGiftPanelDecorates({
    $core.int? id,
    $core.String? name,
    $core.int? appId,
    $core.int? price,
    $core.String? image,
    $core.String? decorateType,
    $core.String? decorateTypeName,
    $core.String? moneyType,
    $core.String? period,
    $core.int? ductionRate,
    $core.String? bubbleDesc,
    $core.String? bubbleFrontColor,
    BbGiftPanelShopCoupon? coupon,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (price != null) {
      _result.price = price;
    }
    if (image != null) {
      _result.image = image;
    }
    if (decorateType != null) {
      _result.decorateType = decorateType;
    }
    if (decorateTypeName != null) {
      _result.decorateTypeName = decorateTypeName;
    }
    if (moneyType != null) {
      _result.moneyType = moneyType;
    }
    if (period != null) {
      _result.period = period;
    }
    if (ductionRate != null) {
      _result.ductionRate = ductionRate;
    }
    if (bubbleDesc != null) {
      _result.bubbleDesc = bubbleDesc;
    }
    if (bubbleFrontColor != null) {
      _result.bubbleFrontColor = bubbleFrontColor;
    }
    if (coupon != null) {
      _result.coupon = coupon;
    }
    return _result;
  }
  factory BbGiftPanelDecorates.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelDecorates.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelDecorates clone() =>
      BbGiftPanelDecorates()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelDecorates copyWith(void Function(BbGiftPanelDecorates) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelDecorates))
          as BbGiftPanelDecorates; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelDecorates create() => BbGiftPanelDecorates._();
  BbGiftPanelDecorates createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelDecorates> createRepeated() =>
      $pb.PbList<BbGiftPanelDecorates>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelDecorates getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelDecorates>(create);
  static BbGiftPanelDecorates? _defaultInstance;

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
  $core.int get appId => $_getIZ(2);
  @$pb.TagNumber(3)
  set appId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAppId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAppId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get price => $_getIZ(3);
  @$pb.TagNumber(4)
  set price($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get image => $_getSZ(4);
  @$pb.TagNumber(5)
  set image($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearImage() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get decorateType => $_getSZ(5);
  @$pb.TagNumber(6)
  set decorateType($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDecorateType() => $_has(5);
  @$pb.TagNumber(6)
  void clearDecorateType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get decorateTypeName => $_getSZ(6);
  @$pb.TagNumber(7)
  set decorateTypeName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDecorateTypeName() => $_has(6);
  @$pb.TagNumber(7)
  void clearDecorateTypeName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get moneyType => $_getSZ(7);
  @$pb.TagNumber(8)
  set moneyType($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMoneyType() => $_has(7);
  @$pb.TagNumber(8)
  void clearMoneyType() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get period => $_getSZ(8);
  @$pb.TagNumber(9)
  set period($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPeriod() => $_has(8);
  @$pb.TagNumber(9)
  void clearPeriod() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get ductionRate => $_getIZ(9);
  @$pb.TagNumber(10)
  set ductionRate($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDuctionRate() => $_has(9);
  @$pb.TagNumber(10)
  void clearDuctionRate() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get bubbleDesc => $_getSZ(10);
  @$pb.TagNumber(11)
  set bubbleDesc($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasBubbleDesc() => $_has(10);
  @$pb.TagNumber(11)
  void clearBubbleDesc() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get bubbleFrontColor => $_getSZ(11);
  @$pb.TagNumber(12)
  set bubbleFrontColor($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasBubbleFrontColor() => $_has(11);
  @$pb.TagNumber(12)
  void clearBubbleFrontColor() => clearField(12);

  @$pb.TagNumber(13)
  BbGiftPanelShopCoupon get coupon => $_getN(12);
  @$pb.TagNumber(13)
  set coupon(BbGiftPanelShopCoupon v) {
    setField(13, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasCoupon() => $_has(12);
  @$pb.TagNumber(13)
  void clearCoupon() => clearField(13);
  @$pb.TagNumber(13)
  BbGiftPanelShopCoupon ensureCoupon() => $_ensure(12);
}

class BbGiftPanelChooseNumConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelChooseNumConfig',
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

  BbGiftPanelChooseNumConfig._() : super();
  factory BbGiftPanelChooseNumConfig({
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
  factory BbGiftPanelChooseNumConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelChooseNumConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelChooseNumConfig clone() =>
      BbGiftPanelChooseNumConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelChooseNumConfig copyWith(
          void Function(BbGiftPanelChooseNumConfig) updates) =>
      super.copyWith(
              (message) => updates(message as BbGiftPanelChooseNumConfig))
          as BbGiftPanelChooseNumConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelChooseNumConfig create() => BbGiftPanelChooseNumConfig._();
  BbGiftPanelChooseNumConfig createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelChooseNumConfig> createRepeated() =>
      $pb.PbList<BbGiftPanelChooseNumConfig>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelChooseNumConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelChooseNumConfig>(create);
  static BbGiftPanelChooseNumConfig? _defaultInstance;

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

class BbGiftPanelTabConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelTabConfig',
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
            : 'type')
    ..hasRequiredFields = false;

  BbGiftPanelTabConfig._() : super();
  factory BbGiftPanelTabConfig({
    $core.String? name,
    $core.String? type,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory BbGiftPanelTabConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelTabConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelTabConfig clone() =>
      BbGiftPanelTabConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelTabConfig copyWith(void Function(BbGiftPanelTabConfig) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelTabConfig))
          as BbGiftPanelTabConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelTabConfig create() => BbGiftPanelTabConfig._();
  BbGiftPanelTabConfig createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelTabConfig> createRepeated() =>
      $pb.PbList<BbGiftPanelTabConfig>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelTabConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelTabConfig>(create);
  static BbGiftPanelTabConfig? _defaultInstance;

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
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);
}

class BbGiftPanelLiveProps extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelLiveProps',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expired',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pnum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BbGiftPanelLiveProps._() : super();
  factory BbGiftPanelLiveProps({
    $core.int? pid,
    $core.String? url,
    $core.String? name,
    $core.String? desc,
    $core.int? expired,
    $core.int? pnum,
  }) {
    final _result = create();
    if (pid != null) {
      _result.pid = pid;
    }
    if (url != null) {
      _result.url = url;
    }
    if (name != null) {
      _result.name = name;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (expired != null) {
      _result.expired = expired;
    }
    if (pnum != null) {
      _result.pnum = pnum;
    }
    return _result;
  }
  factory BbGiftPanelLiveProps.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelLiveProps.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelLiveProps clone() =>
      BbGiftPanelLiveProps()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelLiveProps copyWith(void Function(BbGiftPanelLiveProps) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelLiveProps))
          as BbGiftPanelLiveProps; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelLiveProps create() => BbGiftPanelLiveProps._();
  BbGiftPanelLiveProps createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelLiveProps> createRepeated() =>
      $pb.PbList<BbGiftPanelLiveProps>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelLiveProps getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelLiveProps>(create);
  static BbGiftPanelLiveProps? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pid => $_getIZ(0);
  @$pb.TagNumber(1)
  set pid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPid() => $_has(0);
  @$pb.TagNumber(1)
  void clearPid() => clearField(1);

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
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get expired => $_getIZ(4);
  @$pb.TagNumber(5)
  set expired($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasExpired() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpired() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get pnum => $_getIZ(5);
  @$pb.TagNumber(6)
  set pnum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPnum() => $_has(5);
  @$pb.TagNumber(6)
  void clearPnum() => clearField(6);
}

class RocketAssemblyGiftItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RocketAssemblyGiftItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<BbGiftPanelDiyGift>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'panelDiyGift',
        protoName: 'panelDiyGift',
        subBuilder: BbGiftPanelDiyGift.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyGiftImageType',
        $pb.PbFieldType.OU3,
        protoName: 'diyGiftImageType')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sign')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RocketAssemblyGiftItem._() : super();
  factory RocketAssemblyGiftItem({
    BbGiftPanelDiyGift? panelDiyGift,
    $core.int? diyGiftImageType,
    $core.String? sign,
    $core.int? color,
  }) {
    final _result = create();
    if (panelDiyGift != null) {
      _result.panelDiyGift = panelDiyGift;
    }
    if (diyGiftImageType != null) {
      _result.diyGiftImageType = diyGiftImageType;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    if (color != null) {
      _result.color = color;
    }
    return _result;
  }
  factory RocketAssemblyGiftItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RocketAssemblyGiftItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RocketAssemblyGiftItem clone() =>
      RocketAssemblyGiftItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RocketAssemblyGiftItem copyWith(
          void Function(RocketAssemblyGiftItem) updates) =>
      super.copyWith((message) => updates(message as RocketAssemblyGiftItem))
          as RocketAssemblyGiftItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RocketAssemblyGiftItem create() => RocketAssemblyGiftItem._();
  RocketAssemblyGiftItem createEmptyInstance() => create();
  static $pb.PbList<RocketAssemblyGiftItem> createRepeated() =>
      $pb.PbList<RocketAssemblyGiftItem>();
  @$core.pragma('dart2js:noInline')
  static RocketAssemblyGiftItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RocketAssemblyGiftItem>(create);
  static RocketAssemblyGiftItem? _defaultInstance;

  @$pb.TagNumber(1)
  BbGiftPanelDiyGift get panelDiyGift => $_getN(0);
  @$pb.TagNumber(1)
  set panelDiyGift(BbGiftPanelDiyGift v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPanelDiyGift() => $_has(0);
  @$pb.TagNumber(1)
  void clearPanelDiyGift() => clearField(1);
  @$pb.TagNumber(1)
  BbGiftPanelDiyGift ensurePanelDiyGift() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get diyGiftImageType => $_getIZ(1);
  @$pb.TagNumber(2)
  set diyGiftImageType($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDiyGiftImageType() => $_has(1);
  @$pb.TagNumber(2)
  void clearDiyGiftImageType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sign => $_getSZ(2);
  @$pb.TagNumber(3)
  set sign($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSign() => $_has(2);
  @$pb.TagNumber(3)
  void clearSign() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get color => $_getIZ(3);
  @$pb.TagNumber(4)
  set color($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasColor() => $_has(3);
  @$pb.TagNumber(4)
  void clearColor() => clearField(4);
}

class ResRocketAssemblyGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRocketAssemblyGift',
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
    ..pc<RocketAssemblyGiftItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RocketAssemblyGiftItem.create)
    ..hasRequiredFields = false;

  ResRocketAssemblyGift._() : super();
  factory ResRocketAssemblyGift({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<RocketAssemblyGiftItem>? list,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory ResRocketAssemblyGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRocketAssemblyGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRocketAssemblyGift clone() =>
      ResRocketAssemblyGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRocketAssemblyGift copyWith(
          void Function(ResRocketAssemblyGift) updates) =>
      super.copyWith((message) => updates(message as ResRocketAssemblyGift))
          as ResRocketAssemblyGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRocketAssemblyGift create() => ResRocketAssemblyGift._();
  ResRocketAssemblyGift createEmptyInstance() => create();
  static $pb.PbList<ResRocketAssemblyGift> createRepeated() =>
      $pb.PbList<ResRocketAssemblyGift>();
  @$core.pragma('dart2js:noInline')
  static ResRocketAssemblyGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRocketAssemblyGift>(create);
  static ResRocketAssemblyGift? _defaultInstance;

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
  $core.List<RocketAssemblyGiftItem> get list => $_getList(2);
}

class ResNestGiftList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResNestGiftList',
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
    ..pc<BbGiftPanelGift>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelGift.create)
    ..hasRequiredFields = false;

  ResNestGiftList._() : super();
  factory ResNestGiftList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<BbGiftPanelGift>? list,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory ResNestGiftList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResNestGiftList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResNestGiftList clone() => ResNestGiftList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResNestGiftList copyWith(void Function(ResNestGiftList) updates) =>
      super.copyWith((message) => updates(message as ResNestGiftList))
          as ResNestGiftList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResNestGiftList create() => ResNestGiftList._();
  ResNestGiftList createEmptyInstance() => create();
  static $pb.PbList<ResNestGiftList> createRepeated() =>
      $pb.PbList<ResNestGiftList>();
  @$core.pragma('dart2js:noInline')
  static ResNestGiftList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResNestGiftList>(create);
  static ResNestGiftList? _defaultInstance;

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
  $core.List<BbGiftPanelGift> get list => $_getList(2);
}

class GiftWallItemUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftWallItemUser',
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
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  GiftWallItemUser._() : super();
  factory GiftWallItemUser({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory GiftWallItemUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftWallItemUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftWallItemUser clone() => GiftWallItemUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftWallItemUser copyWith(void Function(GiftWallItemUser) updates) =>
      super.copyWith((message) => updates(message as GiftWallItemUser))
          as GiftWallItemUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftWallItemUser create() => GiftWallItemUser._();
  GiftWallItemUser createEmptyInstance() => create();
  static $pb.PbList<GiftWallItemUser> createRepeated() =>
      $pb.PbList<GiftWallItemUser>();
  @$core.pragma('dart2js:noInline')
  static GiftWallItemUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallItemUser>(create);
  static GiftWallItemUser? _defaultInstance;

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
}

class GiftWallItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftWallItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOM<GiftWallItemUser>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: GiftWallItemUser.create)
    ..a<$fixnum.Int64>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sum',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftWallItem._() : super();
  factory GiftWallItem({
    $core.int? gid,
    $core.int? num,
    $core.String? name,
    $core.int? level,
    GiftWallItemUser? user,
    $fixnum.Int64? sum,
    $core.int? price,
  }) {
    final _result = create();
    if (gid != null) {
      _result.gid = gid;
    }
    if (num != null) {
      _result.num = num;
    }
    if (name != null) {
      _result.name = name;
    }
    if (level != null) {
      _result.level = level;
    }
    if (user != null) {
      _result.user = user;
    }
    if (sum != null) {
      _result.sum = sum;
    }
    if (price != null) {
      _result.price = price;
    }
    return _result;
  }
  factory GiftWallItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftWallItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftWallItem clone() => GiftWallItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftWallItem copyWith(void Function(GiftWallItem) updates) =>
      super.copyWith((message) => updates(message as GiftWallItem))
          as GiftWallItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftWallItem create() => GiftWallItem._();
  GiftWallItem createEmptyInstance() => create();
  static $pb.PbList<GiftWallItem> createRepeated() =>
      $pb.PbList<GiftWallItem>();
  @$core.pragma('dart2js:noInline')
  static GiftWallItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallItem>(create);
  static GiftWallItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gid => $_getIZ(0);
  @$pb.TagNumber(1)
  set gid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGid() => $_has(0);
  @$pb.TagNumber(1)
  void clearGid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get num => $_getIZ(1);
  @$pb.TagNumber(2)
  set num($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearNum() => clearField(2);

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
  $core.int get level => $_getIZ(3);
  @$pb.TagNumber(4)
  set level($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  GiftWallItemUser get user => $_getN(4);
  @$pb.TagNumber(5)
  set user(GiftWallItemUser v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUser() => $_has(4);
  @$pb.TagNumber(5)
  void clearUser() => clearField(5);
  @$pb.TagNumber(5)
  GiftWallItemUser ensureUser() => $_ensure(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get sum => $_getI64(5);
  @$pb.TagNumber(6)
  set sum($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSum() => $_has(5);
  @$pb.TagNumber(6)
  void clearSum() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get price => $_getIZ(6);
  @$pb.TagNumber(7)
  set price($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearPrice() => clearField(7);
}

class GiftWallListRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftWallListRes',
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
    ..pc<GiftWallItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: GiftWallItem.create)
    ..pc<GiftWallTabItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabs',
        $pb.PbFieldType.PM,
        subBuilder: GiftWallTabItem.create)
    ..hasRequiredFields = false;

  GiftWallListRes._() : super();
  factory GiftWallListRes({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GiftWallItem>? data,
    $core.Iterable<GiftWallTabItem>? tabs,
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
    if (tabs != null) {
      _result.tabs.addAll(tabs);
    }
    return _result;
  }
  factory GiftWallListRes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftWallListRes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftWallListRes clone() => GiftWallListRes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftWallListRes copyWith(void Function(GiftWallListRes) updates) =>
      super.copyWith((message) => updates(message as GiftWallListRes))
          as GiftWallListRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftWallListRes create() => GiftWallListRes._();
  GiftWallListRes createEmptyInstance() => create();
  static $pb.PbList<GiftWallListRes> createRepeated() =>
      $pb.PbList<GiftWallListRes>();
  @$core.pragma('dart2js:noInline')
  static GiftWallListRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallListRes>(create);
  static GiftWallListRes? _defaultInstance;

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
  $core.List<GiftWallItem> get data => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<GiftWallTabItem> get tabs => $_getList(3);
}

class GiftWallTabItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftWallTabItem',
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
            : 'title')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cur',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'event')
    ..hasRequiredFields = false;

  GiftWallTabItem._() : super();
  factory GiftWallTabItem({
    $core.int? tabId,
    $core.String? title,
    $core.String? icon,
    $core.int? cur,
    $core.int? total,
    $core.String? event,
  }) {
    final _result = create();
    if (tabId != null) {
      _result.tabId = tabId;
    }
    if (title != null) {
      _result.title = title;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (cur != null) {
      _result.cur = cur;
    }
    if (total != null) {
      _result.total = total;
    }
    if (event != null) {
      _result.event = event;
    }
    return _result;
  }
  factory GiftWallTabItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftWallTabItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftWallTabItem clone() => GiftWallTabItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftWallTabItem copyWith(void Function(GiftWallTabItem) updates) =>
      super.copyWith((message) => updates(message as GiftWallTabItem))
          as GiftWallTabItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftWallTabItem create() => GiftWallTabItem._();
  GiftWallTabItem createEmptyInstance() => create();
  static $pb.PbList<GiftWallTabItem> createRepeated() =>
      $pb.PbList<GiftWallTabItem>();
  @$core.pragma('dart2js:noInline')
  static GiftWallTabItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallTabItem>(create);
  static GiftWallTabItem? _defaultInstance;

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
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

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
  $core.int get cur => $_getIZ(3);
  @$pb.TagNumber(4)
  set cur($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCur() => $_has(3);
  @$pb.TagNumber(4)
  void clearCur() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get total => $_getIZ(4);
  @$pb.TagNumber(5)
  set total($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTotal() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotal() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get event => $_getSZ(5);
  @$pb.TagNumber(6)
  set event($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasEvent() => $_has(5);
  @$pb.TagNumber(6)
  void clearEvent() => clearField(6);
}

class GiftWallStatics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftWallStatics',
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
            : 'userIcon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gold',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'silver',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'copper',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelIcon')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextLevelExp',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextLevelName')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'exp',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'helpUrl')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelName')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelBg')
    ..hasRequiredFields = false;

  GiftWallStatics._() : super();
  factory GiftWallStatics({
    $core.int? uid,
    $core.String? userIcon,
    $core.String? name,
    $core.int? total,
    $core.int? gold,
    $core.int? silver,
    $core.int? copper,
    $core.String? levelIcon,
    $core.int? nextLevelExp,
    $core.String? nextLevelName,
    $core.int? exp,
    $core.String? bg,
    $core.String? helpUrl,
    $core.int? level,
    $core.String? levelName,
    $core.String? levelBg,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (total != null) {
      _result.total = total;
    }
    if (gold != null) {
      _result.gold = gold;
    }
    if (silver != null) {
      _result.silver = silver;
    }
    if (copper != null) {
      _result.copper = copper;
    }
    if (levelIcon != null) {
      _result.levelIcon = levelIcon;
    }
    if (nextLevelExp != null) {
      _result.nextLevelExp = nextLevelExp;
    }
    if (nextLevelName != null) {
      _result.nextLevelName = nextLevelName;
    }
    if (exp != null) {
      _result.exp = exp;
    }
    if (bg != null) {
      _result.bg = bg;
    }
    if (helpUrl != null) {
      _result.helpUrl = helpUrl;
    }
    if (level != null) {
      _result.level = level;
    }
    if (levelName != null) {
      _result.levelName = levelName;
    }
    if (levelBg != null) {
      _result.levelBg = levelBg;
    }
    return _result;
  }
  factory GiftWallStatics.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftWallStatics.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftWallStatics clone() => GiftWallStatics()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftWallStatics copyWith(void Function(GiftWallStatics) updates) =>
      super.copyWith((message) => updates(message as GiftWallStatics))
          as GiftWallStatics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftWallStatics create() => GiftWallStatics._();
  GiftWallStatics createEmptyInstance() => create();
  static $pb.PbList<GiftWallStatics> createRepeated() =>
      $pb.PbList<GiftWallStatics>();
  @$core.pragma('dart2js:noInline')
  static GiftWallStatics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallStatics>(create);
  static GiftWallStatics? _defaultInstance;

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
  $core.String get userIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set userIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserIcon() => clearField(2);

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
  $core.int get total => $_getIZ(3);
  @$pb.TagNumber(4)
  set total($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTotal() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotal() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get gold => $_getIZ(4);
  @$pb.TagNumber(5)
  set gold($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGold() => $_has(4);
  @$pb.TagNumber(5)
  void clearGold() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get silver => $_getIZ(5);
  @$pb.TagNumber(6)
  set silver($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSilver() => $_has(5);
  @$pb.TagNumber(6)
  void clearSilver() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get copper => $_getIZ(6);
  @$pb.TagNumber(7)
  set copper($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCopper() => $_has(6);
  @$pb.TagNumber(7)
  void clearCopper() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get levelIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set levelIcon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLevelIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearLevelIcon() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get nextLevelExp => $_getIZ(8);
  @$pb.TagNumber(9)
  set nextLevelExp($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasNextLevelExp() => $_has(8);
  @$pb.TagNumber(9)
  void clearNextLevelExp() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get nextLevelName => $_getSZ(9);
  @$pb.TagNumber(10)
  set nextLevelName($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasNextLevelName() => $_has(9);
  @$pb.TagNumber(10)
  void clearNextLevelName() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get exp => $_getIZ(10);
  @$pb.TagNumber(11)
  set exp($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasExp() => $_has(10);
  @$pb.TagNumber(11)
  void clearExp() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get bg => $_getSZ(11);
  @$pb.TagNumber(12)
  set bg($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasBg() => $_has(11);
  @$pb.TagNumber(12)
  void clearBg() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get helpUrl => $_getSZ(12);
  @$pb.TagNumber(13)
  set helpUrl($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasHelpUrl() => $_has(12);
  @$pb.TagNumber(13)
  void clearHelpUrl() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get level => $_getIZ(13);
  @$pb.TagNumber(14)
  set level($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasLevel() => $_has(13);
  @$pb.TagNumber(14)
  void clearLevel() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get levelName => $_getSZ(14);
  @$pb.TagNumber(15)
  set levelName($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasLevelName() => $_has(14);
  @$pb.TagNumber(15)
  void clearLevelName() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get levelBg => $_getSZ(15);
  @$pb.TagNumber(16)
  set levelBg($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasLevelBg() => $_has(15);
  @$pb.TagNumber(16)
  void clearLevelBg() => clearField(16);
}

class GiftWallStaticsRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftWallStaticsRes',
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
    ..aOM<GiftWallStatics>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftWallStatics.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'flag',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftWallStaticsRes._() : super();
  factory GiftWallStaticsRes({
    $core.bool? success,
    $core.String? msg,
    GiftWallStatics? data,
    $core.int? flag,
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
    if (flag != null) {
      _result.flag = flag;
    }
    return _result;
  }
  factory GiftWallStaticsRes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftWallStaticsRes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftWallStaticsRes clone() => GiftWallStaticsRes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftWallStaticsRes copyWith(void Function(GiftWallStaticsRes) updates) =>
      super.copyWith((message) => updates(message as GiftWallStaticsRes))
          as GiftWallStaticsRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftWallStaticsRes create() => GiftWallStaticsRes._();
  GiftWallStaticsRes createEmptyInstance() => create();
  static $pb.PbList<GiftWallStaticsRes> createRepeated() =>
      $pb.PbList<GiftWallStaticsRes>();
  @$core.pragma('dart2js:noInline')
  static GiftWallStaticsRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallStaticsRes>(create);
  static GiftWallStaticsRes? _defaultInstance;

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
  GiftWallStatics get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftWallStatics v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftWallStatics ensureData() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get flag => $_getIZ(3);
  @$pb.TagNumber(4)
  set flag($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFlag() => $_has(3);
  @$pb.TagNumber(4)
  void clearFlag() => clearField(4);
}

class GraphicGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GraphicGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftLighten',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName')
    ..hasRequiredFields = false;

  GraphicGift._() : super();
  factory GraphicGift({
    $core.int? gid,
    $core.int? giftLighten,
    $core.String? giftName,
  }) {
    final _result = create();
    if (gid != null) {
      _result.gid = gid;
    }
    if (giftLighten != null) {
      _result.giftLighten = giftLighten;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    return _result;
  }
  factory GraphicGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GraphicGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GraphicGift clone() => GraphicGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GraphicGift copyWith(void Function(GraphicGift) updates) =>
      super.copyWith((message) => updates(message as GraphicGift))
          as GraphicGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GraphicGift create() => GraphicGift._();
  GraphicGift createEmptyInstance() => create();
  static $pb.PbList<GraphicGift> createRepeated() => $pb.PbList<GraphicGift>();
  @$core.pragma('dart2js:noInline')
  static GraphicGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GraphicGift>(create);
  static GraphicGift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gid => $_getIZ(0);
  @$pb.TagNumber(1)
  set gid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGid() => $_has(0);
  @$pb.TagNumber(1)
  void clearGid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get giftLighten => $_getIZ(1);
  @$pb.TagNumber(2)
  set giftLighten($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftLighten() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftLighten() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get giftName => $_getSZ(2);
  @$pb.TagNumber(3)
  set giftName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftName() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftName() => clearField(3);
}

class GiftWallGraphic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftWallGraphic',
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
            : 'bg')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lighten',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expire',
        $pb.PbFieldType.OU3)
    ..pc<GraphicGift>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gifts',
        $pb.PbFieldType.PM,
        subBuilder: GraphicGift.create)
    ..pPS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bgColor')
    ..hasRequiredFields = false;

  GiftWallGraphic._() : super();
  factory GiftWallGraphic({
    $core.String? name,
    $core.String? bg,
    $core.int? lighten,
    $core.int? expire,
    $core.Iterable<GraphicGift>? gifts,
    $core.Iterable<$core.String>? bgColor,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (bg != null) {
      _result.bg = bg;
    }
    if (lighten != null) {
      _result.lighten = lighten;
    }
    if (expire != null) {
      _result.expire = expire;
    }
    if (gifts != null) {
      _result.gifts.addAll(gifts);
    }
    if (bgColor != null) {
      _result.bgColor.addAll(bgColor);
    }
    return _result;
  }
  factory GiftWallGraphic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftWallGraphic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftWallGraphic clone() => GiftWallGraphic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftWallGraphic copyWith(void Function(GiftWallGraphic) updates) =>
      super.copyWith((message) => updates(message as GiftWallGraphic))
          as GiftWallGraphic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftWallGraphic create() => GiftWallGraphic._();
  GiftWallGraphic createEmptyInstance() => create();
  static $pb.PbList<GiftWallGraphic> createRepeated() =>
      $pb.PbList<GiftWallGraphic>();
  @$core.pragma('dart2js:noInline')
  static GiftWallGraphic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallGraphic>(create);
  static GiftWallGraphic? _defaultInstance;

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
  $core.String get bg => $_getSZ(1);
  @$pb.TagNumber(2)
  set bg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBg() => $_has(1);
  @$pb.TagNumber(2)
  void clearBg() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get lighten => $_getIZ(2);
  @$pb.TagNumber(3)
  set lighten($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLighten() => $_has(2);
  @$pb.TagNumber(3)
  void clearLighten() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get expire => $_getIZ(3);
  @$pb.TagNumber(4)
  set expire($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasExpire() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpire() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<GraphicGift> get gifts => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get bgColor => $_getList(5);
}

class GiftWallGraphicRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftWallGraphicRes',
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
    ..pc<GiftWallGraphic>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: GiftWallGraphic.create)
    ..hasRequiredFields = false;

  GiftWallGraphicRes._() : super();
  factory GiftWallGraphicRes({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GiftWallGraphic>? data,
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
  factory GiftWallGraphicRes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftWallGraphicRes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftWallGraphicRes clone() => GiftWallGraphicRes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftWallGraphicRes copyWith(void Function(GiftWallGraphicRes) updates) =>
      super.copyWith((message) => updates(message as GiftWallGraphicRes))
          as GiftWallGraphicRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftWallGraphicRes create() => GiftWallGraphicRes._();
  GiftWallGraphicRes createEmptyInstance() => create();
  static $pb.PbList<GiftWallGraphicRes> createRepeated() =>
      $pb.PbList<GiftWallGraphicRes>();
  @$core.pragma('dart2js:noInline')
  static GiftWallGraphicRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallGraphicRes>(create);
  static GiftWallGraphicRes? _defaultInstance;

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
  $core.List<GiftWallGraphic> get data => $_getList(2);
}

class OchGiftData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OchGiftData',
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
    ..pc<BbGiftPanelGift>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelGift.create)
    ..hasRequiredFields = false;

  OchGiftData._() : super();
  factory OchGiftData({
    $core.int? num,
    $core.Iterable<BbGiftPanelGift>? list,
  }) {
    final _result = create();
    if (num != null) {
      _result.num = num;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory OchGiftData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OchGiftData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OchGiftData clone() => OchGiftData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OchGiftData copyWith(void Function(OchGiftData) updates) =>
      super.copyWith((message) => updates(message as OchGiftData))
          as OchGiftData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OchGiftData create() => OchGiftData._();
  OchGiftData createEmptyInstance() => create();
  static $pb.PbList<OchGiftData> createRepeated() => $pb.PbList<OchGiftData>();
  @$core.pragma('dart2js:noInline')
  static OchGiftData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OchGiftData>(create);
  static OchGiftData? _defaultInstance;

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
  $core.List<BbGiftPanelGift> get list => $_getList(1);
}

class ResOchGiftList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResOchGiftList',
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
    ..aOM<OchGiftData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: OchGiftData.create)
    ..hasRequiredFields = false;

  ResOchGiftList._() : super();
  factory ResOchGiftList({
    $core.bool? success,
    $core.String? msg,
    OchGiftData? data,
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
  factory ResOchGiftList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResOchGiftList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResOchGiftList clone() => ResOchGiftList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResOchGiftList copyWith(void Function(ResOchGiftList) updates) =>
      super.copyWith((message) => updates(message as ResOchGiftList))
          as ResOchGiftList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResOchGiftList create() => ResOchGiftList._();
  ResOchGiftList createEmptyInstance() => create();
  static $pb.PbList<ResOchGiftList> createRepeated() =>
      $pb.PbList<ResOchGiftList>();
  @$core.pragma('dart2js:noInline')
  static ResOchGiftList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResOchGiftList>(create);
  static ResOchGiftList? _defaultInstance;

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
  OchGiftData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(OchGiftData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  OchGiftData ensureData() => $_ensure(2);
}

class ResGiftSuperGsList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGiftSuperGsList',
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
    ..aOM<GiftSuperGsData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftSuperGsData.create)
    ..hasRequiredFields = false;

  ResGiftSuperGsList._() : super();
  factory ResGiftSuperGsList({
    $core.bool? success,
    $core.String? msg,
    GiftSuperGsData? data,
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
  factory ResGiftSuperGsList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGiftSuperGsList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGiftSuperGsList clone() => ResGiftSuperGsList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGiftSuperGsList copyWith(void Function(ResGiftSuperGsList) updates) =>
      super.copyWith((message) => updates(message as ResGiftSuperGsList))
          as ResGiftSuperGsList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGiftSuperGsList create() => ResGiftSuperGsList._();
  ResGiftSuperGsList createEmptyInstance() => create();
  static $pb.PbList<ResGiftSuperGsList> createRepeated() =>
      $pb.PbList<ResGiftSuperGsList>();
  @$core.pragma('dart2js:noInline')
  static ResGiftSuperGsList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGiftSuperGsList>(create);
  static ResGiftSuperGsList? _defaultInstance;

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
  GiftSuperGsData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftSuperGsData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftSuperGsData ensureData() => $_ensure(2);
}

class GiftSuperGsData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftSuperGsData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GiftSuperGsUser>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'users',
        $pb.PbFieldType.PM,
        subBuilder: GiftSuperGsUser.create)
    ..hasRequiredFields = false;

  GiftSuperGsData._() : super();
  factory GiftSuperGsData({
    $core.Iterable<GiftSuperGsUser>? users,
  }) {
    final _result = create();
    if (users != null) {
      _result.users.addAll(users);
    }
    return _result;
  }
  factory GiftSuperGsData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftSuperGsData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftSuperGsData clone() => GiftSuperGsData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftSuperGsData copyWith(void Function(GiftSuperGsData) updates) =>
      super.copyWith((message) => updates(message as GiftSuperGsData))
          as GiftSuperGsData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftSuperGsData create() => GiftSuperGsData._();
  GiftSuperGsData createEmptyInstance() => create();
  static $pb.PbList<GiftSuperGsData> createRepeated() =>
      $pb.PbList<GiftSuperGsData>();
  @$core.pragma('dart2js:noInline')
  static GiftSuperGsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftSuperGsData>(create);
  static GiftSuperGsData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GiftSuperGsUser> get users => $_getList(0);
}

class GiftSuperGsUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftSuperGsUser',
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularityLevel',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftSuperGsUser._() : super();
  factory GiftSuperGsUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? age,
    $core.int? sex,
    $core.int? popularityLevel,
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
    if (age != null) {
      _result.age = age;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (popularityLevel != null) {
      _result.popularityLevel = popularityLevel;
    }
    return _result;
  }
  factory GiftSuperGsUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftSuperGsUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftSuperGsUser clone() => GiftSuperGsUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftSuperGsUser copyWith(void Function(GiftSuperGsUser) updates) =>
      super.copyWith((message) => updates(message as GiftSuperGsUser))
          as GiftSuperGsUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftSuperGsUser create() => GiftSuperGsUser._();
  GiftSuperGsUser createEmptyInstance() => create();
  static $pb.PbList<GiftSuperGsUser> createRepeated() =>
      $pb.PbList<GiftSuperGsUser>();
  @$core.pragma('dart2js:noInline')
  static GiftSuperGsUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftSuperGsUser>(create);
  static GiftSuperGsUser? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.int get age => $_getIZ(3);
  @$pb.TagNumber(4)
  set age($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAge() => $_has(3);
  @$pb.TagNumber(4)
  void clearAge() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get sex => $_getIZ(4);
  @$pb.TagNumber(5)
  set sex($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSex() => $_has(4);
  @$pb.TagNumber(5)
  void clearSex() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get popularityLevel => $_getIZ(5);
  @$pb.TagNumber(6)
  set popularityLevel($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPopularityLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearPopularityLevel() => clearField(6);
}

class ExclusiveGiftInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ExclusiveGiftInfo',
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
        $pb.PbFieldType.OU3,
        protoName: 'giftId')
    ..aOM<NextOwner>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cur',
        subBuilder: NextOwner.create)
    ..aOM<NextOwner>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'next',
        subBuilder: NextOwner.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tips')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'notice')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'preAnnotation')
    ..hasRequiredFields = false;

  ExclusiveGiftInfo._() : super();
  factory ExclusiveGiftInfo({
    $core.int? giftId,
    NextOwner? cur,
    NextOwner? next,
    $core.String? tips,
    $core.String? notice,
    $core.String? preAnnotation,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (cur != null) {
      _result.cur = cur;
    }
    if (next != null) {
      _result.next = next;
    }
    if (tips != null) {
      _result.tips = tips;
    }
    if (notice != null) {
      _result.notice = notice;
    }
    if (preAnnotation != null) {
      _result.preAnnotation = preAnnotation;
    }
    return _result;
  }
  factory ExclusiveGiftInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExclusiveGiftInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExclusiveGiftInfo clone() => ExclusiveGiftInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExclusiveGiftInfo copyWith(void Function(ExclusiveGiftInfo) updates) =>
      super.copyWith((message) => updates(message as ExclusiveGiftInfo))
          as ExclusiveGiftInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExclusiveGiftInfo create() => ExclusiveGiftInfo._();
  ExclusiveGiftInfo createEmptyInstance() => create();
  static $pb.PbList<ExclusiveGiftInfo> createRepeated() =>
      $pb.PbList<ExclusiveGiftInfo>();
  @$core.pragma('dart2js:noInline')
  static ExclusiveGiftInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExclusiveGiftInfo>(create);
  static ExclusiveGiftInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  NextOwner get cur => $_getN(1);
  @$pb.TagNumber(2)
  set cur(NextOwner v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCur() => $_has(1);
  @$pb.TagNumber(2)
  void clearCur() => clearField(2);
  @$pb.TagNumber(2)
  NextOwner ensureCur() => $_ensure(1);

  @$pb.TagNumber(3)
  NextOwner get next => $_getN(2);
  @$pb.TagNumber(3)
  set next(NextOwner v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNext() => $_has(2);
  @$pb.TagNumber(3)
  void clearNext() => clearField(3);
  @$pb.TagNumber(3)
  NextOwner ensureNext() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get tips => $_getSZ(3);
  @$pb.TagNumber(4)
  set tips($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTips() => $_has(3);
  @$pb.TagNumber(4)
  void clearTips() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get notice => $_getSZ(4);
  @$pb.TagNumber(5)
  set notice($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNotice() => $_has(4);
  @$pb.TagNumber(5)
  void clearNotice() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get preAnnotation => $_getSZ(5);
  @$pb.TagNumber(6)
  set preAnnotation($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPreAnnotation() => $_has(5);
  @$pb.TagNumber(6)
  void clearPreAnnotation() => clearField(6);
}

class NextOwner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NextOwner',
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
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  NextOwner._() : super();
  factory NextOwner({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory NextOwner.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NextOwner.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NextOwner clone() => NextOwner()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NextOwner copyWith(void Function(NextOwner) updates) =>
      super.copyWith((message) => updates(message as NextOwner))
          as NextOwner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NextOwner create() => NextOwner._();
  NextOwner createEmptyInstance() => create();
  static $pb.PbList<NextOwner> createRepeated() => $pb.PbList<NextOwner>();
  @$core.pragma('dart2js:noInline')
  static NextOwner getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NextOwner>(create);
  static NextOwner? _defaultInstance;

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
}

class BbGiftPanelLuckyEggInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelLuckyEggInfo',
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
        $pb.PbFieldType.OU3)
    ..pc<LuckyEggLevel>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'eggs',
        $pb.PbFieldType.PM,
        subBuilder: LuckyEggLevel.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..hasRequiredFields = false;

  BbGiftPanelLuckyEggInfo._() : super();
  factory BbGiftPanelLuckyEggInfo({
    $core.int? giftId,
    $core.Iterable<LuckyEggLevel>? eggs,
    $core.String? title,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (eggs != null) {
      _result.eggs.addAll(eggs);
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory BbGiftPanelLuckyEggInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelLuckyEggInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelLuckyEggInfo clone() =>
      BbGiftPanelLuckyEggInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelLuckyEggInfo copyWith(
          void Function(BbGiftPanelLuckyEggInfo) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelLuckyEggInfo))
          as BbGiftPanelLuckyEggInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelLuckyEggInfo create() => BbGiftPanelLuckyEggInfo._();
  BbGiftPanelLuckyEggInfo createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelLuckyEggInfo> createRepeated() =>
      $pb.PbList<BbGiftPanelLuckyEggInfo>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelLuckyEggInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelLuckyEggInfo>(create);
  static BbGiftPanelLuckyEggInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<LuckyEggLevel> get eggs => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);
}

class BbGiftPaneRandomBoxInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPaneRandomBoxInfo',
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
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'btTxt')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'priceTxt')
    ..hasRequiredFields = false;

  BbGiftPaneRandomBoxInfo._() : super();
  factory BbGiftPaneRandomBoxInfo({
    $core.int? giftId,
    $core.String? btTxt,
    $core.String? priceTxt,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (btTxt != null) {
      _result.btTxt = btTxt;
    }
    if (priceTxt != null) {
      _result.priceTxt = priceTxt;
    }
    return _result;
  }
  factory BbGiftPaneRandomBoxInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPaneRandomBoxInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPaneRandomBoxInfo clone() =>
      BbGiftPaneRandomBoxInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPaneRandomBoxInfo copyWith(
          void Function(BbGiftPaneRandomBoxInfo) updates) =>
      super.copyWith((message) => updates(message as BbGiftPaneRandomBoxInfo))
          as BbGiftPaneRandomBoxInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPaneRandomBoxInfo create() => BbGiftPaneRandomBoxInfo._();
  BbGiftPaneRandomBoxInfo createEmptyInstance() => create();
  static $pb.PbList<BbGiftPaneRandomBoxInfo> createRepeated() =>
      $pb.PbList<BbGiftPaneRandomBoxInfo>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPaneRandomBoxInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPaneRandomBoxInfo>(create);
  static BbGiftPaneRandomBoxInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get btTxt => $_getSZ(1);
  @$pb.TagNumber(2)
  set btTxt($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBtTxt() => $_has(1);
  @$pb.TagNumber(2)
  void clearBtTxt() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get priceTxt => $_getSZ(2);
  @$pb.TagNumber(3)
  set priceTxt($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPriceTxt() => $_has(2);
  @$pb.TagNumber(3)
  void clearPriceTxt() => clearField(3);
}

class LuckyEggLevel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LuckyEggLevel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'couponName')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'couponImage')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelName')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  LuckyEggLevel._() : super();
  factory LuckyEggLevel({
    $core.int? level,
    $core.int? price,
    $core.String? image,
    $core.String? couponName,
    $core.String? couponImage,
    $core.String? levelName,
    $core.String? name,
    $core.String? desc,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (price != null) {
      _result.price = price;
    }
    if (image != null) {
      _result.image = image;
    }
    if (couponName != null) {
      _result.couponName = couponName;
    }
    if (couponImage != null) {
      _result.couponImage = couponImage;
    }
    if (levelName != null) {
      _result.levelName = levelName;
    }
    if (name != null) {
      _result.name = name;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory LuckyEggLevel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LuckyEggLevel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LuckyEggLevel clone() => LuckyEggLevel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LuckyEggLevel copyWith(void Function(LuckyEggLevel) updates) =>
      super.copyWith((message) => updates(message as LuckyEggLevel))
          as LuckyEggLevel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LuckyEggLevel create() => LuckyEggLevel._();
  LuckyEggLevel createEmptyInstance() => create();
  static $pb.PbList<LuckyEggLevel> createRepeated() =>
      $pb.PbList<LuckyEggLevel>();
  @$core.pragma('dart2js:noInline')
  static LuckyEggLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LuckyEggLevel>(create);
  static LuckyEggLevel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

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
  $core.String get couponName => $_getSZ(3);
  @$pb.TagNumber(4)
  set couponName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCouponName() => $_has(3);
  @$pb.TagNumber(4)
  void clearCouponName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get couponImage => $_getSZ(4);
  @$pb.TagNumber(5)
  set couponImage($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCouponImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearCouponImage() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get levelName => $_getSZ(5);
  @$pb.TagNumber(6)
  set levelName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLevelName() => $_has(5);
  @$pb.TagNumber(6)
  void clearLevelName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get name => $_getSZ(6);
  @$pb.TagNumber(7)
  set name($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasName() => $_has(6);
  @$pb.TagNumber(7)
  void clearName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get desc => $_getSZ(7);
  @$pb.TagNumber(8)
  set desc($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDesc() => $_has(7);
  @$pb.TagNumber(8)
  void clearDesc() => clearField(8);
}

class BbGiftPanelBanner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelBanner',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'achieveTips')
    ..hasRequiredFields = false;

  BbGiftPanelBanner._() : super();
  factory BbGiftPanelBanner({
    $core.String? achieveTips,
  }) {
    final _result = create();
    if (achieveTips != null) {
      _result.achieveTips = achieveTips;
    }
    return _result;
  }
  factory BbGiftPanelBanner.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelBanner.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelBanner clone() => BbGiftPanelBanner()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelBanner copyWith(void Function(BbGiftPanelBanner) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelBanner))
          as BbGiftPanelBanner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelBanner create() => BbGiftPanelBanner._();
  BbGiftPanelBanner createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelBanner> createRepeated() =>
      $pb.PbList<BbGiftPanelBanner>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelBanner getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelBanner>(create);
  static BbGiftPanelBanner? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get achieveTips => $_getSZ(0);
  @$pb.TagNumber(1)
  set achieveTips($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAchieveTips() => $_has(0);
  @$pb.TagNumber(1)
  void clearAchieveTips() => clearField(1);
}

class ResGiftThroneDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGiftThroneDetail',
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
    ..aOM<GiftThroneDetailData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftThroneDetailData.create)
    ..hasRequiredFields = false;

  ResGiftThroneDetail._() : super();
  factory ResGiftThroneDetail({
    $core.bool? success,
    $core.String? msg,
    GiftThroneDetailData? data,
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
  factory ResGiftThroneDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGiftThroneDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGiftThroneDetail clone() => ResGiftThroneDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGiftThroneDetail copyWith(void Function(ResGiftThroneDetail) updates) =>
      super.copyWith((message) => updates(message as ResGiftThroneDetail))
          as ResGiftThroneDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGiftThroneDetail create() => ResGiftThroneDetail._();
  ResGiftThroneDetail createEmptyInstance() => create();
  static $pb.PbList<ResGiftThroneDetail> createRepeated() =>
      $pb.PbList<ResGiftThroneDetail>();
  @$core.pragma('dart2js:noInline')
  static ResGiftThroneDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGiftThroneDetail>(create);
  static ResGiftThroneDetail? _defaultInstance;

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
  GiftThroneDetailData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftThroneDetailData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftThroneDetailData ensureData() => $_ensure(2);
}

class GiftThroneDetailData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftThroneDetailData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<BbGiftThrone>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'throne',
        subBuilder: BbGiftThrone.create)
    ..hasRequiredFields = false;

  GiftThroneDetailData._() : super();
  factory GiftThroneDetailData({
    BbGiftThrone? throne,
  }) {
    final _result = create();
    if (throne != null) {
      _result.throne = throne;
    }
    return _result;
  }
  factory GiftThroneDetailData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftThroneDetailData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftThroneDetailData clone() =>
      GiftThroneDetailData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftThroneDetailData copyWith(void Function(GiftThroneDetailData) updates) =>
      super.copyWith((message) => updates(message as GiftThroneDetailData))
          as GiftThroneDetailData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftThroneDetailData create() => GiftThroneDetailData._();
  GiftThroneDetailData createEmptyInstance() => create();
  static $pb.PbList<GiftThroneDetailData> createRepeated() =>
      $pb.PbList<GiftThroneDetailData>();
  @$core.pragma('dart2js:noInline')
  static GiftThroneDetailData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftThroneDetailData>(create);
  static GiftThroneDetailData? _defaultInstance;

  @$pb.TagNumber(1)
  BbGiftThrone get throne => $_getN(0);
  @$pb.TagNumber(1)
  set throne(BbGiftThrone v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasThrone() => $_has(0);
  @$pb.TagNumber(1)
  void clearThrone() => clearField(1);
  @$pb.TagNumber(1)
  BbGiftThrone ensureThrone() => $_ensure(0);
}

class BbGiftThrone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftThrone',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tips')
    ..pc<BbGiftThroneLevel>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levels',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftThroneLevel.create)
    ..hasRequiredFields = false;

  BbGiftThrone._() : super();
  factory BbGiftThrone({
    $core.int? currLevel,
    $core.int? currNum,
    $core.int? totalNum,
    $core.String? tips,
    $core.Iterable<BbGiftThroneLevel>? levels,
  }) {
    final _result = create();
    if (currLevel != null) {
      _result.currLevel = currLevel;
    }
    if (currNum != null) {
      _result.currNum = currNum;
    }
    if (totalNum != null) {
      _result.totalNum = totalNum;
    }
    if (tips != null) {
      _result.tips = tips;
    }
    if (levels != null) {
      _result.levels.addAll(levels);
    }
    return _result;
  }
  factory BbGiftThrone.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftThrone.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftThrone clone() => BbGiftThrone()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftThrone copyWith(void Function(BbGiftThrone) updates) =>
      super.copyWith((message) => updates(message as BbGiftThrone))
          as BbGiftThrone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftThrone create() => BbGiftThrone._();
  BbGiftThrone createEmptyInstance() => create();
  static $pb.PbList<BbGiftThrone> createRepeated() =>
      $pb.PbList<BbGiftThrone>();
  @$core.pragma('dart2js:noInline')
  static BbGiftThrone getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftThrone>(create);
  static BbGiftThrone? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get currLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set currLevel($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get currNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set currNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCurrNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTotalNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get tips => $_getSZ(3);
  @$pb.TagNumber(4)
  set tips($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTips() => $_has(3);
  @$pb.TagNumber(4)
  void clearTips() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<BbGiftThroneLevel> get levels => $_getList(4);
}

class BbGiftThroneLevel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftThroneLevel',
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
            : 'icon')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'needGift',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BbGiftThroneLevel._() : super();
  factory BbGiftThroneLevel({
    $core.String? name,
    $core.String? icon,
    $core.int? level,
    $core.int? needGift,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (level != null) {
      _result.level = level;
    }
    if (needGift != null) {
      _result.needGift = needGift;
    }
    return _result;
  }
  factory BbGiftThroneLevel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftThroneLevel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftThroneLevel clone() => BbGiftThroneLevel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftThroneLevel copyWith(void Function(BbGiftThroneLevel) updates) =>
      super.copyWith((message) => updates(message as BbGiftThroneLevel))
          as BbGiftThroneLevel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftThroneLevel create() => BbGiftThroneLevel._();
  BbGiftThroneLevel createEmptyInstance() => create();
  static $pb.PbList<BbGiftThroneLevel> createRepeated() =>
      $pb.PbList<BbGiftThroneLevel>();
  @$core.pragma('dart2js:noInline')
  static BbGiftThroneLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftThroneLevel>(create);
  static BbGiftThroneLevel? _defaultInstance;

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
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get needGift => $_getIZ(3);
  @$pb.TagNumber(4)
  set needGift($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNeedGift() => $_has(3);
  @$pb.TagNumber(4)
  void clearNeedGift() => clearField(4);
}

class ResGiftWallLimit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGiftWallLimit',
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
    ..aOM<GiftWallLimitData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftWallLimitData.create)
    ..hasRequiredFields = false;

  ResGiftWallLimit._() : super();
  factory ResGiftWallLimit({
    $core.bool? success,
    $core.String? msg,
    GiftWallLimitData? data,
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
  factory ResGiftWallLimit.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGiftWallLimit.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGiftWallLimit clone() => ResGiftWallLimit()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGiftWallLimit copyWith(void Function(ResGiftWallLimit) updates) =>
      super.copyWith((message) => updates(message as ResGiftWallLimit))
          as ResGiftWallLimit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGiftWallLimit create() => ResGiftWallLimit._();
  ResGiftWallLimit createEmptyInstance() => create();
  static $pb.PbList<ResGiftWallLimit> createRepeated() =>
      $pb.PbList<ResGiftWallLimit>();
  @$core.pragma('dart2js:noInline')
  static ResGiftWallLimit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGiftWallLimit>(create);
  static ResGiftWallLimit? _defaultInstance;

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
  GiftWallLimitData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftWallLimitData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftWallLimitData ensureData() => $_ensure(2);
}

class GiftWallLimitData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftWallLimitData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GiftWallLimitItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightGift',
        $pb.PbFieldType.PM,
        subBuilder: GiftWallLimitItem.create)
    ..aOM<GiftWallLimitItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newGifts',
        subBuilder: GiftWallLimitItem.create)
    ..aOM<GiftWallLimitItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'backGifts',
        subBuilder: GiftWallLimitItem.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftWallLimitData._() : super();
  factory GiftWallLimitData({
    $core.Iterable<GiftWallLimitItem>? lightGift,
    GiftWallLimitItem? newGifts,
    GiftWallLimitItem? backGifts,
    $core.int? version,
  }) {
    final _result = create();
    if (lightGift != null) {
      _result.lightGift.addAll(lightGift);
    }
    if (newGifts != null) {
      _result.newGifts = newGifts;
    }
    if (backGifts != null) {
      _result.backGifts = backGifts;
    }
    if (version != null) {
      _result.version = version;
    }
    return _result;
  }
  factory GiftWallLimitData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftWallLimitData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftWallLimitData clone() => GiftWallLimitData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftWallLimitData copyWith(void Function(GiftWallLimitData) updates) =>
      super.copyWith((message) => updates(message as GiftWallLimitData))
          as GiftWallLimitData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftWallLimitData create() => GiftWallLimitData._();
  GiftWallLimitData createEmptyInstance() => create();
  static $pb.PbList<GiftWallLimitData> createRepeated() =>
      $pb.PbList<GiftWallLimitData>();
  @$core.pragma('dart2js:noInline')
  static GiftWallLimitData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallLimitData>(create);
  static GiftWallLimitData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GiftWallLimitItem> get lightGift => $_getList(0);

  @$pb.TagNumber(2)
  GiftWallLimitItem get newGifts => $_getN(1);
  @$pb.TagNumber(2)
  set newGifts(GiftWallLimitItem v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNewGifts() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewGifts() => clearField(2);
  @$pb.TagNumber(2)
  GiftWallLimitItem ensureNewGifts() => $_ensure(1);

  @$pb.TagNumber(3)
  GiftWallLimitItem get backGifts => $_getN(2);
  @$pb.TagNumber(3)
  set backGifts(GiftWallLimitItem v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBackGifts() => $_has(2);
  @$pb.TagNumber(3)
  void clearBackGifts() => clearField(3);
  @$pb.TagNumber(3)
  GiftWallLimitItem ensureBackGifts() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get version => $_getIZ(3);
  @$pb.TagNumber(4)
  set version($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearVersion() => clearField(4);
}

class GiftWallLimitItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftWallLimitItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..pc<GiftWallItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        $pb.PbFieldType.PM,
        subBuilder: GiftWallItem.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ctype',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftWallLimitItem._() : super();
  factory GiftWallLimitItem({
    $core.String? title,
    $core.Iterable<GiftWallItem>? gift,
    $core.String? desc,
    $core.int? ctype,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (gift != null) {
      _result.gift.addAll(gift);
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (ctype != null) {
      _result.ctype = ctype;
    }
    return _result;
  }
  factory GiftWallLimitItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftWallLimitItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftWallLimitItem clone() => GiftWallLimitItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftWallLimitItem copyWith(void Function(GiftWallLimitItem) updates) =>
      super.copyWith((message) => updates(message as GiftWallLimitItem))
          as GiftWallLimitItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftWallLimitItem create() => GiftWallLimitItem._();
  GiftWallLimitItem createEmptyInstance() => create();
  static $pb.PbList<GiftWallLimitItem> createRepeated() =>
      $pb.PbList<GiftWallLimitItem>();
  @$core.pragma('dart2js:noInline')
  static GiftWallLimitItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallLimitItem>(create);
  static GiftWallLimitItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<GiftWallItem> get gift => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get ctype => $_getIZ(3);
  @$pb.TagNumber(4)
  set ctype($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCtype() => $_has(3);
  @$pb.TagNumber(4)
  void clearCtype() => clearField(4);
}

class ResGiftCombineDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGiftCombineDetail',
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
    ..aOM<GiftCombineDetailData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftCombineDetailData.create)
    ..hasRequiredFields = false;

  ResGiftCombineDetail._() : super();
  factory ResGiftCombineDetail({
    $core.bool? success,
    $core.String? msg,
    GiftCombineDetailData? data,
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
  factory ResGiftCombineDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGiftCombineDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGiftCombineDetail clone() =>
      ResGiftCombineDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGiftCombineDetail copyWith(void Function(ResGiftCombineDetail) updates) =>
      super.copyWith((message) => updates(message as ResGiftCombineDetail))
          as ResGiftCombineDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGiftCombineDetail create() => ResGiftCombineDetail._();
  ResGiftCombineDetail createEmptyInstance() => create();
  static $pb.PbList<ResGiftCombineDetail> createRepeated() =>
      $pb.PbList<ResGiftCombineDetail>();
  @$core.pragma('dart2js:noInline')
  static ResGiftCombineDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGiftCombineDetail>(create);
  static ResGiftCombineDetail? _defaultInstance;

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
  GiftCombineDetailData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftCombineDetailData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftCombineDetailData ensureData() => $_ensure(2);
}

class GiftCombineDetailData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftCombineDetailData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<BbGiftPanelInteractCombine>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singleCombine',
        subBuilder: BbGiftPanelInteractCombine.create)
    ..aOM<BbGiftPanelInteractCombine>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'allCombine',
        subBuilder: BbGiftPanelInteractCombine.create)
    ..hasRequiredFields = false;

  GiftCombineDetailData._() : super();
  factory GiftCombineDetailData({
    BbGiftPanelInteractCombine? singleCombine,
    BbGiftPanelInteractCombine? allCombine,
  }) {
    final _result = create();
    if (singleCombine != null) {
      _result.singleCombine = singleCombine;
    }
    if (allCombine != null) {
      _result.allCombine = allCombine;
    }
    return _result;
  }
  factory GiftCombineDetailData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftCombineDetailData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftCombineDetailData clone() =>
      GiftCombineDetailData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftCombineDetailData copyWith(
          void Function(GiftCombineDetailData) updates) =>
      super.copyWith((message) => updates(message as GiftCombineDetailData))
          as GiftCombineDetailData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftCombineDetailData create() => GiftCombineDetailData._();
  GiftCombineDetailData createEmptyInstance() => create();
  static $pb.PbList<GiftCombineDetailData> createRepeated() =>
      $pb.PbList<GiftCombineDetailData>();
  @$core.pragma('dart2js:noInline')
  static GiftCombineDetailData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftCombineDetailData>(create);
  static GiftCombineDetailData? _defaultInstance;

  @$pb.TagNumber(1)
  BbGiftPanelInteractCombine get singleCombine => $_getN(0);
  @$pb.TagNumber(1)
  set singleCombine(BbGiftPanelInteractCombine v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSingleCombine() => $_has(0);
  @$pb.TagNumber(1)
  void clearSingleCombine() => clearField(1);
  @$pb.TagNumber(1)
  BbGiftPanelInteractCombine ensureSingleCombine() => $_ensure(0);

  @$pb.TagNumber(2)
  BbGiftPanelInteractCombine get allCombine => $_getN(1);
  @$pb.TagNumber(2)
  set allCombine(BbGiftPanelInteractCombine v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAllCombine() => $_has(1);
  @$pb.TagNumber(2)
  void clearAllCombine() => clearField(2);
  @$pb.TagNumber(2)
  BbGiftPanelInteractCombine ensureAllCombine() => $_ensure(1);
}

class RspBoxGiftPoolInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspBoxGiftPoolInfo',
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
    ..aOM<BoxGiftPoolInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BoxGiftPoolInfo.create)
    ..hasRequiredFields = false;

  RspBoxGiftPoolInfo._() : super();
  factory RspBoxGiftPoolInfo({
    $core.bool? success,
    $core.String? msg,
    BoxGiftPoolInfo? data,
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
  factory RspBoxGiftPoolInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspBoxGiftPoolInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspBoxGiftPoolInfo clone() => RspBoxGiftPoolInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspBoxGiftPoolInfo copyWith(void Function(RspBoxGiftPoolInfo) updates) =>
      super.copyWith((message) => updates(message as RspBoxGiftPoolInfo))
          as RspBoxGiftPoolInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspBoxGiftPoolInfo create() => RspBoxGiftPoolInfo._();
  RspBoxGiftPoolInfo createEmptyInstance() => create();
  static $pb.PbList<RspBoxGiftPoolInfo> createRepeated() =>
      $pb.PbList<RspBoxGiftPoolInfo>();
  @$core.pragma('dart2js:noInline')
  static RspBoxGiftPoolInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RspBoxGiftPoolInfo>(create);
  static RspBoxGiftPoolInfo? _defaultInstance;

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
  BoxGiftPoolInfo get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BoxGiftPoolInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BoxGiftPoolInfo ensureData() => $_ensure(2);
}

class BoxGiftPoolInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BoxGiftPoolInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poolType',
        $pb.PbFieldType.OU3)
    ..pc<BoxGiftPoolGiftItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poolGifts',
        $pb.PbFieldType.PM,
        subBuilder: BoxGiftPoolGiftItem.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poolDesc')
    ..hasRequiredFields = false;

  BoxGiftPoolInfo._() : super();
  factory BoxGiftPoolInfo({
    $core.int? price,
    $core.int? poolType,
    $core.Iterable<BoxGiftPoolGiftItem>? poolGifts,
    $core.String? poolDesc,
  }) {
    final _result = create();
    if (price != null) {
      _result.price = price;
    }
    if (poolType != null) {
      _result.poolType = poolType;
    }
    if (poolGifts != null) {
      _result.poolGifts.addAll(poolGifts);
    }
    if (poolDesc != null) {
      _result.poolDesc = poolDesc;
    }
    return _result;
  }
  factory BoxGiftPoolInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BoxGiftPoolInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BoxGiftPoolInfo clone() => BoxGiftPoolInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BoxGiftPoolInfo copyWith(void Function(BoxGiftPoolInfo) updates) =>
      super.copyWith((message) => updates(message as BoxGiftPoolInfo))
          as BoxGiftPoolInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BoxGiftPoolInfo create() => BoxGiftPoolInfo._();
  BoxGiftPoolInfo createEmptyInstance() => create();
  static $pb.PbList<BoxGiftPoolInfo> createRepeated() =>
      $pb.PbList<BoxGiftPoolInfo>();
  @$core.pragma('dart2js:noInline')
  static BoxGiftPoolInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoxGiftPoolInfo>(create);
  static BoxGiftPoolInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get price => $_getIZ(0);
  @$pb.TagNumber(1)
  set price($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrice() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrice() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get poolType => $_getIZ(1);
  @$pb.TagNumber(2)
  set poolType($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPoolType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPoolType() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<BoxGiftPoolGiftItem> get poolGifts => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get poolDesc => $_getSZ(3);
  @$pb.TagNumber(4)
  set poolDesc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPoolDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearPoolDesc() => clearField(4);
}

class BoxGiftPoolGiftItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BoxGiftPoolGiftItem',
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
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weight',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  BoxGiftPoolGiftItem._() : super();
  factory BoxGiftPoolGiftItem({
    $core.int? giftId,
    $core.int? price,
    $core.String? name,
    $core.int? weight,
    $core.String? icon,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (price != null) {
      _result.price = price;
    }
    if (name != null) {
      _result.name = name;
    }
    if (weight != null) {
      _result.weight = weight;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory BoxGiftPoolGiftItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BoxGiftPoolGiftItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BoxGiftPoolGiftItem clone() => BoxGiftPoolGiftItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BoxGiftPoolGiftItem copyWith(void Function(BoxGiftPoolGiftItem) updates) =>
      super.copyWith((message) => updates(message as BoxGiftPoolGiftItem))
          as BoxGiftPoolGiftItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BoxGiftPoolGiftItem create() => BoxGiftPoolGiftItem._();
  BoxGiftPoolGiftItem createEmptyInstance() => create();
  static $pb.PbList<BoxGiftPoolGiftItem> createRepeated() =>
      $pb.PbList<BoxGiftPoolGiftItem>();
  @$core.pragma('dart2js:noInline')
  static BoxGiftPoolGiftItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoxGiftPoolGiftItem>(create);
  static BoxGiftPoolGiftItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setUnsignedInt32(0, v);
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
  $core.int get weight => $_getIZ(3);
  @$pb.TagNumber(4)
  set weight($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeight() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);
}

class BbGiftPanelActivityBanner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelActivityBanner',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'iconW',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'iconH',
        $pb.PbFieldType.OU3)
    ..pc<BbGiftPanelActivityBannerActions>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'actions',
        $pb.PbFieldType.PM,
        subBuilder: BbGiftPanelActivityBannerActions.create)
    ..hasRequiredFields = false;

  BbGiftPanelActivityBanner._() : super();
  factory BbGiftPanelActivityBanner({
    $core.String? icon,
    $core.String? url,
    $core.int? iconW,
    $core.int? iconH,
    $core.Iterable<BbGiftPanelActivityBannerActions>? actions,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (url != null) {
      _result.url = url;
    }
    if (iconW != null) {
      _result.iconW = iconW;
    }
    if (iconH != null) {
      _result.iconH = iconH;
    }
    if (actions != null) {
      _result.actions.addAll(actions);
    }
    return _result;
  }
  factory BbGiftPanelActivityBanner.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelActivityBanner.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelActivityBanner clone() =>
      BbGiftPanelActivityBanner()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelActivityBanner copyWith(
          void Function(BbGiftPanelActivityBanner) updates) =>
      super.copyWith((message) => updates(message as BbGiftPanelActivityBanner))
          as BbGiftPanelActivityBanner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelActivityBanner create() => BbGiftPanelActivityBanner._();
  BbGiftPanelActivityBanner createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelActivityBanner> createRepeated() =>
      $pb.PbList<BbGiftPanelActivityBanner>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelActivityBanner getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelActivityBanner>(create);
  static BbGiftPanelActivityBanner? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => clearField(1);

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
  $core.int get iconW => $_getIZ(2);
  @$pb.TagNumber(3)
  set iconW($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIconW() => $_has(2);
  @$pb.TagNumber(3)
  void clearIconW() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get iconH => $_getIZ(3);
  @$pb.TagNumber(4)
  set iconH($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIconH() => $_has(3);
  @$pb.TagNumber(4)
  void clearIconH() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<BbGiftPanelActivityBannerActions> get actions => $_getList(4);
}

class BbGiftPanelActivityBannerActions extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BbGiftPanelActivityBannerActions',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'x',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'y',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'w',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'h',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BbGiftPanelActivityBannerActions._() : super();
  factory BbGiftPanelActivityBannerActions({
    $core.String? url,
    $core.int? x,
    $core.int? y,
    $core.int? w,
    $core.int? h,
  }) {
    final _result = create();
    if (url != null) {
      _result.url = url;
    }
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    if (w != null) {
      _result.w = w;
    }
    if (h != null) {
      _result.h = h;
    }
    return _result;
  }
  factory BbGiftPanelActivityBannerActions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BbGiftPanelActivityBannerActions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BbGiftPanelActivityBannerActions clone() =>
      BbGiftPanelActivityBannerActions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BbGiftPanelActivityBannerActions copyWith(
          void Function(BbGiftPanelActivityBannerActions) updates) =>
      super.copyWith(
              (message) => updates(message as BbGiftPanelActivityBannerActions))
          as BbGiftPanelActivityBannerActions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelActivityBannerActions create() =>
      BbGiftPanelActivityBannerActions._();
  BbGiftPanelActivityBannerActions createEmptyInstance() => create();
  static $pb.PbList<BbGiftPanelActivityBannerActions> createRepeated() =>
      $pb.PbList<BbGiftPanelActivityBannerActions>();
  @$core.pragma('dart2js:noInline')
  static BbGiftPanelActivityBannerActions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BbGiftPanelActivityBannerActions>(
          create);
  static BbGiftPanelActivityBannerActions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get x => $_getIZ(1);
  @$pb.TagNumber(2)
  set x($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasX() => $_has(1);
  @$pb.TagNumber(2)
  void clearX() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get y => $_getIZ(2);
  @$pb.TagNumber(3)
  set y($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasY() => $_has(2);
  @$pb.TagNumber(3)
  void clearY() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get w => $_getIZ(3);
  @$pb.TagNumber(4)
  set w($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasW() => $_has(3);
  @$pb.TagNumber(4)
  void clearW() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get h => $_getIZ(4);
  @$pb.TagNumber(5)
  set h($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasH() => $_has(4);
  @$pb.TagNumber(5)
  void clearH() => clearField(5);
}
