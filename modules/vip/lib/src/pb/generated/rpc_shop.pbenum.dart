///
//  Generated code. Do not modify.
//  source: rpc_shop.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ShopType extends $pb.ProtobufEnum {
  static const ShopType CommodityType = ShopType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'CommodityType');
  static const ShopType GiftBagType = ShopType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'GiftBagType');

  static const $core.List<ShopType> values = <ShopType>[
    CommodityType,
    GiftBagType,
  ];

  static final $core.Map<$core.int, ShopType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ShopType? valueOf($core.int value) => _byValue[value];

  const ShopType._($core.int v, $core.String n) : super(v, n);
}

class ShopBagType extends $pb.ProtobufEnum {
  static const ShopBagType DefaultShowBagType = ShopBagType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DefaultShowBagType');
  static const ShopBagType NewPeopleType = ShopBagType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'NewPeopleType');
  static const ShopBagType ActivityType = ShopBagType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ActivityType');
  static const ShopBagType VipPopularityType = ShopBagType._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'VipPopularityType');
  static const ShopBagType SelectGiftType = ShopBagType._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SelectGiftType');
  static const ShopBagType NobilityGoodsType = ShopBagType._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'NobilityGoodsType');
  static const ShopBagType RecommendType = ShopBagType._(
      6,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'RecommendType');

  static const $core.List<ShopBagType> values = <ShopBagType>[
    DefaultShowBagType,
    NewPeopleType,
    ActivityType,
    VipPopularityType,
    SelectGiftType,
    NobilityGoodsType,
    RecommendType,
  ];

  static final $core.Map<$core.int, ShopBagType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ShopBagType? valueOf($core.int value) => _byValue[value];

  const ShopBagType._($core.int v, $core.String n) : super(v, n);
}

class ShopBagGoodsType extends $pb.ProtobufEnum {
  static const ShopBagGoodsType DefaultShopGoodsType = ShopBagGoodsType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DefaultShopGoodsType');
  static const ShopBagGoodsType ShopGoodsTypeBagCidSType = ShopBagGoodsType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ShopGoodsTypeBagCidSType');
  static const ShopBagGoodsType ShopGoodsTypeBagMedal = ShopBagGoodsType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ShopGoodsTypeBagMedal');
  static const ShopBagGoodsType ShopPretendTypeBagMedal = ShopBagGoodsType._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ShopPretendTypeBagMedal');

  static const $core.List<ShopBagGoodsType> values = <ShopBagGoodsType>[
    DefaultShopGoodsType,
    ShopGoodsTypeBagCidSType,
    ShopGoodsTypeBagMedal,
    ShopPretendTypeBagMedal,
  ];

  static final $core.Map<$core.int, ShopBagGoodsType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ShopBagGoodsType? valueOf($core.int value) => _byValue[value];

  const ShopBagGoodsType._($core.int v, $core.String n) : super(v, n);
}
