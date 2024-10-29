///
//  Generated code. Do not modify.
//  source: rpc_shop.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'store.pb.dart' as $0;
import 'vip_rpc_pretend.pb.dart' as $1;

import 'rpc_shop.pbenum.dart';

export 'rpc_shop.pbenum.dart';

class ShopCateInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShopCateInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'page')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'descIcon')
    ..pc<ShopSubsetCate>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subsets',
        $pb.PbFieldType.PM,
        subBuilder: ShopSubsetCate.create)
    ..hasRequiredFields = false;

  ShopCateInfo._() : super();
  factory ShopCateInfo({
    $core.String? category,
    $core.String? page,
    $core.String? url,
    $core.String? desc,
    $core.String? descIcon,
    $core.Iterable<ShopSubsetCate>? subsets,
  }) {
    final _result = create();
    if (category != null) {
      _result.category = category;
    }
    if (page != null) {
      _result.page = page;
    }
    if (url != null) {
      _result.url = url;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (descIcon != null) {
      _result.descIcon = descIcon;
    }
    if (subsets != null) {
      _result.subsets.addAll(subsets);
    }
    return _result;
  }
  factory ShopCateInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShopCateInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShopCateInfo clone() => ShopCateInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShopCateInfo copyWith(void Function(ShopCateInfo) updates) =>
      super.copyWith((message) => updates(message as ShopCateInfo))
          as ShopCateInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopCateInfo create() => ShopCateInfo._();
  ShopCateInfo createEmptyInstance() => create();
  static $pb.PbList<ShopCateInfo> createRepeated() =>
      $pb.PbList<ShopCateInfo>();
  @$core.pragma('dart2js:noInline')
  static ShopCateInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShopCateInfo>(create);
  static ShopCateInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get category => $_getSZ(0);
  @$pb.TagNumber(1)
  set category($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCategory() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategory() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get page => $_getSZ(1);
  @$pb.TagNumber(2)
  set page($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

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
  $core.String get descIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set descIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDescIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<ShopSubsetCate> get subsets => $_getList(5);
}

class ShopSubsetCate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShopSubsetCate',
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
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'page')
    ..aOM<$0.StoreWhere>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'storeWhere',
        subBuilder: $0.StoreWhere.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'parentBType',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ShopSubsetCate._() : super();
  factory ShopSubsetCate({
    $core.String? name,
    $core.String? icon,
    $core.String? page,
    $0.StoreWhere? storeWhere,
    $core.int? parentBType,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (page != null) {
      _result.page = page;
    }
    if (storeWhere != null) {
      _result.storeWhere = storeWhere;
    }
    if (parentBType != null) {
      _result.parentBType = parentBType;
    }
    return _result;
  }
  factory ShopSubsetCate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShopSubsetCate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShopSubsetCate clone() => ShopSubsetCate()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShopSubsetCate copyWith(void Function(ShopSubsetCate) updates) =>
      super.copyWith((message) => updates(message as ShopSubsetCate))
          as ShopSubsetCate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopSubsetCate create() => ShopSubsetCate._();
  ShopSubsetCate createEmptyInstance() => create();
  static $pb.PbList<ShopSubsetCate> createRepeated() =>
      $pb.PbList<ShopSubsetCate>();
  @$core.pragma('dart2js:noInline')
  static ShopSubsetCate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShopSubsetCate>(create);
  static ShopSubsetCate? _defaultInstance;

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
  $core.String get page => $_getSZ(2);
  @$pb.TagNumber(3)
  set page($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => clearField(3);

  @$pb.TagNumber(4)
  $0.StoreWhere get storeWhere => $_getN(3);
  @$pb.TagNumber(4)
  set storeWhere($0.StoreWhere v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStoreWhere() => $_has(3);
  @$pb.TagNumber(4)
  void clearStoreWhere() => clearField(4);
  @$pb.TagNumber(4)
  $0.StoreWhere ensureStoreWhere() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get parentBType => $_getIZ(4);
  @$pb.TagNumber(5)
  set parentBType($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasParentBType() => $_has(4);
  @$pb.TagNumber(5)
  void clearParentBType() => clearField(5);
}

class ShopIndexData_ShopGiftBagType extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShopIndexData.ShopGiftBagType',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..e<ShopBagType>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bType',
        $pb.PbFieldType.OE,
        defaultOrMaker: ShopBagType.DefaultShowBagType,
        valueOf: ShopBagType.valueOf,
        enumValues: ShopBagType.values)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countDown',
        $pb.PbFieldType.OU3)
    ..pc<ShopGoods>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ShopGoods.create)
    ..pc<ShopSubsetCate>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subset',
        $pb.PbFieldType.PM,
        subBuilder: ShopSubsetCate.create)
    ..hasRequiredFields = false;

  ShopIndexData_ShopGiftBagType._() : super();
  factory ShopIndexData_ShopGiftBagType({
    ShopBagType? bType,
    $core.String? name,
    $core.int? countDown,
    $core.Iterable<ShopGoods>? list,
    $core.Iterable<ShopSubsetCate>? subset,
  }) {
    final _result = create();
    if (bType != null) {
      _result.bType = bType;
    }
    if (name != null) {
      _result.name = name;
    }
    if (countDown != null) {
      _result.countDown = countDown;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (subset != null) {
      _result.subset.addAll(subset);
    }
    return _result;
  }
  factory ShopIndexData_ShopGiftBagType.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShopIndexData_ShopGiftBagType.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShopIndexData_ShopGiftBagType clone() =>
      ShopIndexData_ShopGiftBagType()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShopIndexData_ShopGiftBagType copyWith(
          void Function(ShopIndexData_ShopGiftBagType) updates) =>
      super.copyWith(
              (message) => updates(message as ShopIndexData_ShopGiftBagType))
          as ShopIndexData_ShopGiftBagType; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopIndexData_ShopGiftBagType create() =>
      ShopIndexData_ShopGiftBagType._();
  ShopIndexData_ShopGiftBagType createEmptyInstance() => create();
  static $pb.PbList<ShopIndexData_ShopGiftBagType> createRepeated() =>
      $pb.PbList<ShopIndexData_ShopGiftBagType>();
  @$core.pragma('dart2js:noInline')
  static ShopIndexData_ShopGiftBagType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShopIndexData_ShopGiftBagType>(create);
  static ShopIndexData_ShopGiftBagType? _defaultInstance;

  @$pb.TagNumber(1)
  ShopBagType get bType => $_getN(0);
  @$pb.TagNumber(1)
  set bType(ShopBagType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBType() => $_has(0);
  @$pb.TagNumber(1)
  void clearBType() => clearField(1);

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
  $core.int get countDown => $_getIZ(2);
  @$pb.TagNumber(3)
  set countDown($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCountDown() => $_has(2);
  @$pb.TagNumber(3)
  void clearCountDown() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<ShopGoods> get list => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<ShopSubsetCate> get subset => $_getList(4);
}

class ShopIndexData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShopIndexData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ShopBanner>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'banner',
        $pb.PbFieldType.PM,
        subBuilder: ShopBanner.create)
    ..pc<ShopIndexData_ShopGiftBagType>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bagList',
        $pb.PbFieldType.PM,
        subBuilder: ShopIndexData_ShopGiftBagType.create)
    ..hasRequiredFields = false;

  ShopIndexData._() : super();
  factory ShopIndexData({
    $core.Iterable<ShopBanner>? banner,
    $core.Iterable<ShopIndexData_ShopGiftBagType>? bagList,
  }) {
    final _result = create();
    if (banner != null) {
      _result.banner.addAll(banner);
    }
    if (bagList != null) {
      _result.bagList.addAll(bagList);
    }
    return _result;
  }
  factory ShopIndexData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShopIndexData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShopIndexData clone() => ShopIndexData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShopIndexData copyWith(void Function(ShopIndexData) updates) =>
      super.copyWith((message) => updates(message as ShopIndexData))
          as ShopIndexData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopIndexData create() => ShopIndexData._();
  ShopIndexData createEmptyInstance() => create();
  static $pb.PbList<ShopIndexData> createRepeated() =>
      $pb.PbList<ShopIndexData>();
  @$core.pragma('dart2js:noInline')
  static ShopIndexData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShopIndexData>(create);
  static ShopIndexData? _defaultInstance;

  @$pb.TagNumber(4)
  $core.List<ShopBanner> get banner => $_getList(0);

  @$pb.TagNumber(6)
  $core.List<ShopIndexData_ShopGiftBagType> get bagList => $_getList(1);
}

class ShopBanner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShopBanner',
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
            : 'image')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOM<ShopBannerOptionData>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'opt',
        subBuilder: ShopBannerOptionData.create)
    ..hasRequiredFields = false;

  ShopBanner._() : super();
  factory ShopBanner({
    $core.int? id,
    $core.String? image,
    $core.int? width,
    $core.int? height,
    $core.int? duration,
    $core.String? url,
    $core.String? title,
    $core.String? position,
    $core.String? data,
    $core.String? type,
    ShopBannerOptionData? opt,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (image != null) {
      _result.image = image;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (url != null) {
      _result.url = url;
    }
    if (title != null) {
      _result.title = title;
    }
    if (position != null) {
      _result.position = position;
    }
    if (data != null) {
      _result.data = data;
    }
    if (type != null) {
      _result.type = type;
    }
    if (opt != null) {
      _result.opt = opt;
    }
    return _result;
  }
  factory ShopBanner.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShopBanner.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShopBanner clone() => ShopBanner()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShopBanner copyWith(void Function(ShopBanner) updates) =>
      super.copyWith((message) => updates(message as ShopBanner))
          as ShopBanner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopBanner create() => ShopBanner._();
  ShopBanner createEmptyInstance() => create();
  static $pb.PbList<ShopBanner> createRepeated() => $pb.PbList<ShopBanner>();
  @$core.pragma('dart2js:noInline')
  static ShopBanner getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShopBanner>(create);
  static ShopBanner? _defaultInstance;

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
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(2)
  set image($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get duration => $_getIZ(4);
  @$pb.TagNumber(5)
  set duration($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuration() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get url => $_getSZ(5);
  @$pb.TagNumber(6)
  set url($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get title => $_getSZ(6);
  @$pb.TagNumber(7)
  set title($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTitle() => $_has(6);
  @$pb.TagNumber(7)
  void clearTitle() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get position => $_getSZ(7);
  @$pb.TagNumber(8)
  set position($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPosition() => $_has(7);
  @$pb.TagNumber(8)
  void clearPosition() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get data => $_getSZ(8);
  @$pb.TagNumber(9)
  set data($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasData() => $_has(8);
  @$pb.TagNumber(9)
  void clearData() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get type => $_getSZ(9);
  @$pb.TagNumber(10)
  set type($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasType() => $_has(9);
  @$pb.TagNumber(10)
  void clearType() => clearField(10);

  @$pb.TagNumber(11)
  ShopBannerOptionData get opt => $_getN(10);
  @$pb.TagNumber(11)
  set opt(ShopBannerOptionData v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasOpt() => $_has(10);
  @$pb.TagNumber(11)
  void clearOpt() => clearField(11);
  @$pb.TagNumber(11)
  ShopBannerOptionData ensureOpt() => $_ensure(10);
}

class ShopBannerOptionData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShopBannerOptionData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showClose')
    ..hasRequiredFields = false;

  ShopBannerOptionData._() : super();
  factory ShopBannerOptionData({
    $core.bool? showClose,
  }) {
    final _result = create();
    if (showClose != null) {
      _result.showClose = showClose;
    }
    return _result;
  }
  factory ShopBannerOptionData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShopBannerOptionData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShopBannerOptionData clone() =>
      ShopBannerOptionData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShopBannerOptionData copyWith(void Function(ShopBannerOptionData) updates) =>
      super.copyWith((message) => updates(message as ShopBannerOptionData))
          as ShopBannerOptionData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopBannerOptionData create() => ShopBannerOptionData._();
  ShopBannerOptionData createEmptyInstance() => create();
  static $pb.PbList<ShopBannerOptionData> createRepeated() =>
      $pb.PbList<ShopBannerOptionData>();
  @$core.pragma('dart2js:noInline')
  static ShopBannerOptionData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShopBannerOptionData>(create);
  static ShopBannerOptionData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get showClose => $_getBF(0);
  @$pb.TagNumber(1)
  set showClose($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShowClose() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowClose() => clearField(1);
}

class ShopGoods extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShopGoods',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..e<ShopType>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cType',
        $pb.PbFieldType.OE,
        defaultOrMaker: ShopType.CommodityType,
        valueOf: ShopType.valueOf,
        enumValues: ShopType.values)
    ..aOM<$0.StoreCommodityItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodity',
        subBuilder: $0.StoreCommodityItem.create)
    ..aOM<ShopBag>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bag',
        subBuilder: ShopBag.create)
    ..hasRequiredFields = false;

  ShopGoods._() : super();
  factory ShopGoods({
    ShopType? cType,
    $0.StoreCommodityItem? commodity,
    ShopBag? bag,
  }) {
    final _result = create();
    if (cType != null) {
      _result.cType = cType;
    }
    if (commodity != null) {
      _result.commodity = commodity;
    }
    if (bag != null) {
      _result.bag = bag;
    }
    return _result;
  }
  factory ShopGoods.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShopGoods.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShopGoods clone() => ShopGoods()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShopGoods copyWith(void Function(ShopGoods) updates) =>
      super.copyWith((message) => updates(message as ShopGoods))
          as ShopGoods; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopGoods create() => ShopGoods._();
  ShopGoods createEmptyInstance() => create();
  static $pb.PbList<ShopGoods> createRepeated() => $pb.PbList<ShopGoods>();
  @$core.pragma('dart2js:noInline')
  static ShopGoods getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShopGoods>(create);
  static ShopGoods? _defaultInstance;

  @$pb.TagNumber(1)
  ShopType get cType => $_getN(0);
  @$pb.TagNumber(1)
  set cType(ShopType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCType() => $_has(0);
  @$pb.TagNumber(1)
  void clearCType() => clearField(1);

  @$pb.TagNumber(2)
  $0.StoreCommodityItem get commodity => $_getN(1);
  @$pb.TagNumber(2)
  set commodity($0.StoreCommodityItem v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCommodity() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommodity() => clearField(2);
  @$pb.TagNumber(2)
  $0.StoreCommodityItem ensureCommodity() => $_ensure(1);

  @$pb.TagNumber(3)
  ShopBag get bag => $_getN(2);
  @$pb.TagNumber(3)
  set bag(ShopBag v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBag() => $_has(2);
  @$pb.TagNumber(3)
  void clearBag() => clearField(3);
  @$pb.TagNumber(3)
  ShopBag ensureBag() => $_ensure(2);
}

class ShopBag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShopBag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bagId',
        $pb.PbFieldType.OU3)
    ..e<ShopBagType>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bType',
        $pb.PbFieldType.OE,
        defaultOrMaker: ShopBagType.DefaultShowBagType,
        valueOf: ShopBagType.valueOf,
        enumValues: ShopBagType.values)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageBg')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bDesc')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userMoney',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bTag')
    ..a<$core.int>(
        101,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userPayNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        102,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userAlreadyPayNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        103,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalPayNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        104,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalAlreadyPayNum',
        $pb.PbFieldType.OU3)
    ..pc<BagGoods>(
        105,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goods',
        $pb.PbFieldType.PM,
        subBuilder: BagGoods.create)
    ..hasRequiredFields = false;

  ShopBag._() : super();
  factory ShopBag({
    $core.int? bagId,
    ShopBagType? bType,
    $core.String? name,
    $core.String? image,
    $core.String? imageBg,
    $core.String? bDesc,
    $core.int? price,
    $core.int? userMoney,
    $core.String? bTag,
    $core.int? userPayNum,
    $core.int? userAlreadyPayNum,
    $core.int? totalPayNum,
    $core.int? totalAlreadyPayNum,
    $core.Iterable<BagGoods>? goods,
  }) {
    final _result = create();
    if (bagId != null) {
      _result.bagId = bagId;
    }
    if (bType != null) {
      _result.bType = bType;
    }
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    if (imageBg != null) {
      _result.imageBg = imageBg;
    }
    if (bDesc != null) {
      _result.bDesc = bDesc;
    }
    if (price != null) {
      _result.price = price;
    }
    if (userMoney != null) {
      _result.userMoney = userMoney;
    }
    if (bTag != null) {
      _result.bTag = bTag;
    }
    if (userPayNum != null) {
      _result.userPayNum = userPayNum;
    }
    if (userAlreadyPayNum != null) {
      _result.userAlreadyPayNum = userAlreadyPayNum;
    }
    if (totalPayNum != null) {
      _result.totalPayNum = totalPayNum;
    }
    if (totalAlreadyPayNum != null) {
      _result.totalAlreadyPayNum = totalAlreadyPayNum;
    }
    if (goods != null) {
      _result.goods.addAll(goods);
    }
    return _result;
  }
  factory ShopBag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShopBag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShopBag clone() => ShopBag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShopBag copyWith(void Function(ShopBag) updates) =>
      super.copyWith((message) => updates(message as ShopBag))
          as ShopBag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopBag create() => ShopBag._();
  ShopBag createEmptyInstance() => create();
  static $pb.PbList<ShopBag> createRepeated() => $pb.PbList<ShopBag>();
  @$core.pragma('dart2js:noInline')
  static ShopBag getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShopBag>(create);
  static ShopBag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get bagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set bagId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBagId() => clearField(1);

  @$pb.TagNumber(2)
  ShopBagType get bType => $_getN(1);
  @$pb.TagNumber(2)
  set bType(ShopBagType v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBType() => $_has(1);
  @$pb.TagNumber(2)
  void clearBType() => clearField(2);

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
  $core.String get image => $_getSZ(3);
  @$pb.TagNumber(4)
  set image($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearImage() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get imageBg => $_getSZ(4);
  @$pb.TagNumber(5)
  set imageBg($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasImageBg() => $_has(4);
  @$pb.TagNumber(5)
  void clearImageBg() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get bDesc => $_getSZ(5);
  @$pb.TagNumber(6)
  set bDesc($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasBDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearBDesc() => clearField(6);

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

  @$pb.TagNumber(8)
  $core.int get userMoney => $_getIZ(7);
  @$pb.TagNumber(8)
  set userMoney($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUserMoney() => $_has(7);
  @$pb.TagNumber(8)
  void clearUserMoney() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get bTag => $_getSZ(8);
  @$pb.TagNumber(9)
  set bTag($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasBTag() => $_has(8);
  @$pb.TagNumber(9)
  void clearBTag() => clearField(9);

  @$pb.TagNumber(101)
  $core.int get userPayNum => $_getIZ(9);
  @$pb.TagNumber(101)
  set userPayNum($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(101)
  $core.bool hasUserPayNum() => $_has(9);
  @$pb.TagNumber(101)
  void clearUserPayNum() => clearField(101);

  @$pb.TagNumber(102)
  $core.int get userAlreadyPayNum => $_getIZ(10);
  @$pb.TagNumber(102)
  set userAlreadyPayNum($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(102)
  $core.bool hasUserAlreadyPayNum() => $_has(10);
  @$pb.TagNumber(102)
  void clearUserAlreadyPayNum() => clearField(102);

  @$pb.TagNumber(103)
  $core.int get totalPayNum => $_getIZ(11);
  @$pb.TagNumber(103)
  set totalPayNum($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(103)
  $core.bool hasTotalPayNum() => $_has(11);
  @$pb.TagNumber(103)
  void clearTotalPayNum() => clearField(103);

  @$pb.TagNumber(104)
  $core.int get totalAlreadyPayNum => $_getIZ(12);
  @$pb.TagNumber(104)
  set totalAlreadyPayNum($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(104)
  $core.bool hasTotalAlreadyPayNum() => $_has(12);
  @$pb.TagNumber(104)
  void clearTotalAlreadyPayNum() => clearField(104);

  @$pb.TagNumber(105)
  $core.List<BagGoods> get goods => $_getList(13);
}

class BagGoods extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BagGoods',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..e<ShopBagGoodsType>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bType',
        $pb.PbFieldType.OE,
        defaultOrMaker: ShopBagGoodsType.DefaultShopGoodsType,
        valueOf: ShopBagGoodsType.valueOf,
        enumValues: ShopBagGoodsType.values)
    ..aOM<$0.StoreCommodityItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodity',
        subBuilder: $0.StoreCommodityItem.create)
    ..aOM<ShopBagGoodsBadge>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badge',
        subBuilder: ShopBagGoodsBadge.create)
    ..aOM<$1.PretendInfo>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pretend',
        subBuilder: $1.PretendInfo.create)
    ..hasRequiredFields = false;

  BagGoods._() : super();
  factory BagGoods({
    ShopBagGoodsType? bType,
    $0.StoreCommodityItem? commodity,
    ShopBagGoodsBadge? badge,
    $1.PretendInfo? pretend,
  }) {
    final _result = create();
    if (bType != null) {
      _result.bType = bType;
    }
    if (commodity != null) {
      _result.commodity = commodity;
    }
    if (badge != null) {
      _result.badge = badge;
    }
    if (pretend != null) {
      _result.pretend = pretend;
    }
    return _result;
  }
  factory BagGoods.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BagGoods.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BagGoods clone() => BagGoods()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BagGoods copyWith(void Function(BagGoods) updates) =>
      super.copyWith((message) => updates(message as BagGoods))
          as BagGoods; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BagGoods create() => BagGoods._();
  BagGoods createEmptyInstance() => create();
  static $pb.PbList<BagGoods> createRepeated() => $pb.PbList<BagGoods>();
  @$core.pragma('dart2js:noInline')
  static BagGoods getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BagGoods>(create);
  static BagGoods? _defaultInstance;

  @$pb.TagNumber(2)
  ShopBagGoodsType get bType => $_getN(0);
  @$pb.TagNumber(2)
  set bType(ShopBagGoodsType v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBType() => $_has(0);
  @$pb.TagNumber(2)
  void clearBType() => clearField(2);

  @$pb.TagNumber(3)
  $0.StoreCommodityItem get commodity => $_getN(1);
  @$pb.TagNumber(3)
  set commodity($0.StoreCommodityItem v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCommodity() => $_has(1);
  @$pb.TagNumber(3)
  void clearCommodity() => clearField(3);
  @$pb.TagNumber(3)
  $0.StoreCommodityItem ensureCommodity() => $_ensure(1);

  @$pb.TagNumber(4)
  ShopBagGoodsBadge get badge => $_getN(2);
  @$pb.TagNumber(4)
  set badge(ShopBagGoodsBadge v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBadge() => $_has(2);
  @$pb.TagNumber(4)
  void clearBadge() => clearField(4);
  @$pb.TagNumber(4)
  ShopBagGoodsBadge ensureBadge() => $_ensure(2);

  @$pb.TagNumber(5)
  $1.PretendInfo get pretend => $_getN(3);
  @$pb.TagNumber(5)
  set pretend($1.PretendInfo v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPretend() => $_has(3);
  @$pb.TagNumber(5)
  void clearPretend() => clearField(5);
  @$pb.TagNumber(5)
  $1.PretendInfo ensurePretend() => $_ensure(3);
}

class ShopBagGoodsBadge extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShopBagGoodsBadge',
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
            : 'title')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.O3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageBg')
    ..hasRequiredFields = false;

  ShopBagGoodsBadge._() : super();
  factory ShopBagGoodsBadge({
    $core.int? id,
    $core.String? title,
    $core.String? icon,
    $core.String? desc,
    $core.int? createTime,
    $core.int? giftId,
    $core.String? imageBg,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (imageBg != null) {
      _result.imageBg = imageBg;
    }
    return _result;
  }
  factory ShopBagGoodsBadge.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShopBagGoodsBadge.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShopBagGoodsBadge clone() => ShopBagGoodsBadge()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShopBagGoodsBadge copyWith(void Function(ShopBagGoodsBadge) updates) =>
      super.copyWith((message) => updates(message as ShopBagGoodsBadge))
          as ShopBagGoodsBadge; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopBagGoodsBadge create() => ShopBagGoodsBadge._();
  ShopBagGoodsBadge createEmptyInstance() => create();
  static $pb.PbList<ShopBagGoodsBadge> createRepeated() =>
      $pb.PbList<ShopBagGoodsBadge>();
  @$core.pragma('dart2js:noInline')
  static ShopBagGoodsBadge getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShopBagGoodsBadge>(create);
  static ShopBagGoodsBadge? _defaultInstance;

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
  $core.int get createTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set createTime($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCreateTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get giftId => $_getIZ(5);
  @$pb.TagNumber(6)
  set giftId($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGiftId() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get imageBg => $_getSZ(6);
  @$pb.TagNumber(7)
  set imageBg($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasImageBg() => $_has(6);
  @$pb.TagNumber(7)
  void clearImageBg() => clearField(7);
}
