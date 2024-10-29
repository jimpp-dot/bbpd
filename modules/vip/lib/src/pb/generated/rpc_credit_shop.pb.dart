///
//  Generated code. Do not modify.
//  source: rpc_credit_shop.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'store.pb.dart' as $0;

class CreditGoodsIndex_CreditGoodsType extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreditGoodsIndex.CreditGoodsType',
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
    ..pc<$0.StoreCommodityItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: $0.StoreCommodityItem.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  CreditGoodsIndex_CreditGoodsType._() : super();
  factory CreditGoodsIndex_CreditGoodsType({
    $core.String? name,
    $core.Iterable<$0.StoreCommodityItem>? items,
    $core.String? desc,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory CreditGoodsIndex_CreditGoodsType.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreditGoodsIndex_CreditGoodsType.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreditGoodsIndex_CreditGoodsType clone() =>
      CreditGoodsIndex_CreditGoodsType()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreditGoodsIndex_CreditGoodsType copyWith(
          void Function(CreditGoodsIndex_CreditGoodsType) updates) =>
      super.copyWith(
              (message) => updates(message as CreditGoodsIndex_CreditGoodsType))
          as CreditGoodsIndex_CreditGoodsType; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreditGoodsIndex_CreditGoodsType create() =>
      CreditGoodsIndex_CreditGoodsType._();
  CreditGoodsIndex_CreditGoodsType createEmptyInstance() => create();
  static $pb.PbList<CreditGoodsIndex_CreditGoodsType> createRepeated() =>
      $pb.PbList<CreditGoodsIndex_CreditGoodsType>();
  @$core.pragma('dart2js:noInline')
  static CreditGoodsIndex_CreditGoodsType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreditGoodsIndex_CreditGoodsType>(
          create);
  static CreditGoodsIndex_CreditGoodsType? _defaultInstance;

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
  $core.List<$0.StoreCommodityItem> get items => $_getList(1);

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
}

class CreditGoodsIndex_CustomZone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreditGoodsIndex.CustomZone',
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
    ..pc<CreditGoodsIndex_CustomZoneItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: CreditGoodsIndex_CustomZoneItem.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  CreditGoodsIndex_CustomZone._() : super();
  factory CreditGoodsIndex_CustomZone({
    $core.String? name,
    $core.Iterable<CreditGoodsIndex_CustomZoneItem>? items,
    $core.String? desc,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory CreditGoodsIndex_CustomZone.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreditGoodsIndex_CustomZone.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreditGoodsIndex_CustomZone clone() =>
      CreditGoodsIndex_CustomZone()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreditGoodsIndex_CustomZone copyWith(
          void Function(CreditGoodsIndex_CustomZone) updates) =>
      super.copyWith(
              (message) => updates(message as CreditGoodsIndex_CustomZone))
          as CreditGoodsIndex_CustomZone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreditGoodsIndex_CustomZone create() =>
      CreditGoodsIndex_CustomZone._();
  CreditGoodsIndex_CustomZone createEmptyInstance() => create();
  static $pb.PbList<CreditGoodsIndex_CustomZone> createRepeated() =>
      $pb.PbList<CreditGoodsIndex_CustomZone>();
  @$core.pragma('dart2js:noInline')
  static CreditGoodsIndex_CustomZone getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreditGoodsIndex_CustomZone>(create);
  static CreditGoodsIndex_CustomZone? _defaultInstance;

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
  $core.List<CreditGoodsIndex_CustomZoneItem> get items => $_getList(1);

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
}

class CreditGoodsIndex_CustomZoneItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreditGoodsIndex.CustomZoneItem',
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
            : 'image')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageBg')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  CreditGoodsIndex_CustomZoneItem._() : super();
  factory CreditGoodsIndex_CustomZoneItem({
    $core.int? id,
    $core.String? name,
    $core.String? image,
    $core.String? imageBg,
    $core.int? score,
    $core.int? money,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
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
    if (score != null) {
      _result.score = score;
    }
    if (money != null) {
      _result.money = money;
    }
    return _result;
  }
  factory CreditGoodsIndex_CustomZoneItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreditGoodsIndex_CustomZoneItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreditGoodsIndex_CustomZoneItem clone() =>
      CreditGoodsIndex_CustomZoneItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreditGoodsIndex_CustomZoneItem copyWith(
          void Function(CreditGoodsIndex_CustomZoneItem) updates) =>
      super.copyWith(
              (message) => updates(message as CreditGoodsIndex_CustomZoneItem))
          as CreditGoodsIndex_CustomZoneItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreditGoodsIndex_CustomZoneItem create() =>
      CreditGoodsIndex_CustomZoneItem._();
  CreditGoodsIndex_CustomZoneItem createEmptyInstance() => create();
  static $pb.PbList<CreditGoodsIndex_CustomZoneItem> createRepeated() =>
      $pb.PbList<CreditGoodsIndex_CustomZoneItem>();
  @$core.pragma('dart2js:noInline')
  static CreditGoodsIndex_CustomZoneItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreditGoodsIndex_CustomZoneItem>(
          create);
  static CreditGoodsIndex_CustomZoneItem? _defaultInstance;

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
  $core.String get imageBg => $_getSZ(3);
  @$pb.TagNumber(4)
  set imageBg($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasImageBg() => $_has(3);
  @$pb.TagNumber(4)
  void clearImageBg() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get score => $_getIZ(4);
  @$pb.TagNumber(5)
  set score($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearScore() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get money => $_getIZ(5);
  @$pb.TagNumber(6)
  set money($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMoney() => $_has(5);
  @$pb.TagNumber(6)
  void clearMoney() => clearField(6);
}

class CreditGoodsIndex_CreditGoodsMode extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreditGoodsIndex.CreditGoodsMode',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cType',
        $pb.PbFieldType.OU3)
    ..pc<CreditGoodsIndex_CustomZone>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'zone',
        $pb.PbFieldType.PM,
        subBuilder: CreditGoodsIndex_CustomZone.create)
    ..pc<CreditGoodsIndex_CreditGoodsType>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goods',
        $pb.PbFieldType.PM,
        subBuilder: CreditGoodsIndex_CreditGoodsType.create)
    ..hasRequiredFields = false;

  CreditGoodsIndex_CreditGoodsMode._() : super();
  factory CreditGoodsIndex_CreditGoodsMode({
    $core.int? cType,
    $core.Iterable<CreditGoodsIndex_CustomZone>? zone,
    $core.Iterable<CreditGoodsIndex_CreditGoodsType>? goods,
  }) {
    final _result = create();
    if (cType != null) {
      _result.cType = cType;
    }
    if (zone != null) {
      _result.zone.addAll(zone);
    }
    if (goods != null) {
      _result.goods.addAll(goods);
    }
    return _result;
  }
  factory CreditGoodsIndex_CreditGoodsMode.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreditGoodsIndex_CreditGoodsMode.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreditGoodsIndex_CreditGoodsMode clone() =>
      CreditGoodsIndex_CreditGoodsMode()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreditGoodsIndex_CreditGoodsMode copyWith(
          void Function(CreditGoodsIndex_CreditGoodsMode) updates) =>
      super.copyWith(
              (message) => updates(message as CreditGoodsIndex_CreditGoodsMode))
          as CreditGoodsIndex_CreditGoodsMode; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreditGoodsIndex_CreditGoodsMode create() =>
      CreditGoodsIndex_CreditGoodsMode._();
  CreditGoodsIndex_CreditGoodsMode createEmptyInstance() => create();
  static $pb.PbList<CreditGoodsIndex_CreditGoodsMode> createRepeated() =>
      $pb.PbList<CreditGoodsIndex_CreditGoodsMode>();
  @$core.pragma('dart2js:noInline')
  static CreditGoodsIndex_CreditGoodsMode getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreditGoodsIndex_CreditGoodsMode>(
          create);
  static CreditGoodsIndex_CreditGoodsMode? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cType => $_getIZ(0);
  @$pb.TagNumber(1)
  set cType($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCType() => $_has(0);
  @$pb.TagNumber(1)
  void clearCType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<CreditGoodsIndex_CustomZone> get zone => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<CreditGoodsIndex_CreditGoodsType> get goods => $_getList(2);
}

class CreditGoodsIndex extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreditGoodsIndex',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'balanceScore',
        $pb.PbFieldType.O3)
    ..pc<CreditGoodsIndex_CreditGoodsMode>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cMode',
        $pb.PbFieldType.PM,
        subBuilder: CreditGoodsIndex_CreditGoodsMode.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'promptText')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ready')
    ..hasRequiredFields = false;

  CreditGoodsIndex._() : super();
  factory CreditGoodsIndex({
    $core.int? balanceScore,
    $core.Iterable<CreditGoodsIndex_CreditGoodsMode>? cMode,
    $core.String? promptText,
    $core.bool? ready,
  }) {
    final _result = create();
    if (balanceScore != null) {
      _result.balanceScore = balanceScore;
    }
    if (cMode != null) {
      _result.cMode.addAll(cMode);
    }
    if (promptText != null) {
      _result.promptText = promptText;
    }
    if (ready != null) {
      _result.ready = ready;
    }
    return _result;
  }
  factory CreditGoodsIndex.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreditGoodsIndex.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreditGoodsIndex clone() => CreditGoodsIndex()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreditGoodsIndex copyWith(void Function(CreditGoodsIndex) updates) =>
      super.copyWith((message) => updates(message as CreditGoodsIndex))
          as CreditGoodsIndex; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreditGoodsIndex create() => CreditGoodsIndex._();
  CreditGoodsIndex createEmptyInstance() => create();
  static $pb.PbList<CreditGoodsIndex> createRepeated() =>
      $pb.PbList<CreditGoodsIndex>();
  @$core.pragma('dart2js:noInline')
  static CreditGoodsIndex getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreditGoodsIndex>(create);
  static CreditGoodsIndex? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get balanceScore => $_getIZ(0);
  @$pb.TagNumber(1)
  set balanceScore($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBalanceScore() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalanceScore() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<CreditGoodsIndex_CreditGoodsMode> get cMode => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get promptText => $_getSZ(2);
  @$pb.TagNumber(3)
  set promptText($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPromptText() => $_has(2);
  @$pb.TagNumber(3)
  void clearPromptText() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get ready => $_getBF(3);
  @$pb.TagNumber(4)
  set ready($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasReady() => $_has(3);
  @$pb.TagNumber(4)
  void clearReady() => clearField(4);
}
