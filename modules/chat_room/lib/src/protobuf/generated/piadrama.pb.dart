///
//  Generated code. Do not modify.
//  source: piadrama.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'piadrama.pbenum.dart';

export 'piadrama.pbenum.dart';

class PiaJuBenPayConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PiaJuBenPayConfig',
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
            : 'giftName')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftPrice',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftType')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftIcon')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'min',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'max',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PiaJuBenPayConfig._() : super();
  factory PiaJuBenPayConfig({
    $core.int? giftId,
    $core.String? giftName,
    $core.int? giftPrice,
    $core.String? giftType,
    $core.String? giftIcon,
    $core.int? min,
    $core.int? max,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (giftPrice != null) {
      _result.giftPrice = giftPrice;
    }
    if (giftType != null) {
      _result.giftType = giftType;
    }
    if (giftIcon != null) {
      _result.giftIcon = giftIcon;
    }
    if (min != null) {
      _result.min = min;
    }
    if (max != null) {
      _result.max = max;
    }
    return _result;
  }
  factory PiaJuBenPayConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PiaJuBenPayConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PiaJuBenPayConfig clone() => PiaJuBenPayConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PiaJuBenPayConfig copyWith(void Function(PiaJuBenPayConfig) updates) =>
      super.copyWith((message) => updates(message as PiaJuBenPayConfig))
          as PiaJuBenPayConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PiaJuBenPayConfig create() => PiaJuBenPayConfig._();
  PiaJuBenPayConfig createEmptyInstance() => create();
  static $pb.PbList<PiaJuBenPayConfig> createRepeated() =>
      $pb.PbList<PiaJuBenPayConfig>();
  @$core.pragma('dart2js:noInline')
  static PiaJuBenPayConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PiaJuBenPayConfig>(create);
  static PiaJuBenPayConfig? _defaultInstance;

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
  $core.String get giftName => $_getSZ(1);
  @$pb.TagNumber(2)
  set giftName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get giftPrice => $_getIZ(2);
  @$pb.TagNumber(3)
  set giftPrice($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get giftType => $_getSZ(3);
  @$pb.TagNumber(4)
  set giftType($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftType() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get giftIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set giftIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get min => $_getIZ(5);
  @$pb.TagNumber(6)
  set min($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMin() => $_has(5);
  @$pb.TagNumber(6)
  void clearMin() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get max => $_getIZ(6);
  @$pb.TagNumber(7)
  set max($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMax() => $_has(6);
  @$pb.TagNumber(7)
  void clearMax() => clearField(7);
}

class PiaJuBenPayNeed extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PiaJuBenPayNeed',
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
            : 'giftNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftPrice',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftIcon')
    ..hasRequiredFields = false;

  PiaJuBenPayNeed._() : super();
  factory PiaJuBenPayNeed({
    $core.int? giftId,
    $core.int? giftNum,
    $core.String? giftName,
    $core.int? giftPrice,
    $core.String? giftIcon,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftNum != null) {
      _result.giftNum = giftNum;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (giftPrice != null) {
      _result.giftPrice = giftPrice;
    }
    if (giftIcon != null) {
      _result.giftIcon = giftIcon;
    }
    return _result;
  }
  factory PiaJuBenPayNeed.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PiaJuBenPayNeed.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PiaJuBenPayNeed clone() => PiaJuBenPayNeed()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PiaJuBenPayNeed copyWith(void Function(PiaJuBenPayNeed) updates) =>
      super.copyWith((message) => updates(message as PiaJuBenPayNeed))
          as PiaJuBenPayNeed; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PiaJuBenPayNeed create() => PiaJuBenPayNeed._();
  PiaJuBenPayNeed createEmptyInstance() => create();
  static $pb.PbList<PiaJuBenPayNeed> createRepeated() =>
      $pb.PbList<PiaJuBenPayNeed>();
  @$core.pragma('dart2js:noInline')
  static PiaJuBenPayNeed getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PiaJuBenPayNeed>(create);
  static PiaJuBenPayNeed? _defaultInstance;

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
  $core.int get giftNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set giftNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftNum() => clearField(2);

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

  @$pb.TagNumber(4)
  $core.int get giftPrice => $_getIZ(3);
  @$pb.TagNumber(4)
  set giftPrice($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get giftIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set giftIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftIcon() => clearField(5);
}

class PiaJuBen extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PiaJuBen',
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
    ..aOM<PiaOrderUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'creator',
        subBuilder: PiaOrderUser.create)
    ..aOM<PiaJuBenPayNeed>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payCreator',
        subBuilder: PiaJuBenPayNeed.create)
    ..aOM<PiaJuBenPayNeed>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payRecepition',
        subBuilder: PiaJuBenPayNeed.create)
    ..aOM<PiaJuBenPayNeed>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payGs',
        subBuilder: PiaJuBenPayNeed.create)
    ..e<PiaJuBenType>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OE,
        defaultOrMaker: PiaJuBenType.PiaJuBenTypeSingle,
        valueOf: PiaJuBenType.valueOf,
        enumValues: PiaJuBenType.values)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PiaJuBen._() : super();
  factory PiaJuBen({
    $core.String? name,
    PiaOrderUser? creator,
    PiaJuBenPayNeed? payCreator,
    PiaJuBenPayNeed? payRecepition,
    PiaJuBenPayNeed? payGs,
    PiaJuBenType? type,
    $core.int? jid,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (creator != null) {
      _result.creator = creator;
    }
    if (payCreator != null) {
      _result.payCreator = payCreator;
    }
    if (payRecepition != null) {
      _result.payRecepition = payRecepition;
    }
    if (payGs != null) {
      _result.payGs = payGs;
    }
    if (type != null) {
      _result.type = type;
    }
    if (jid != null) {
      _result.jid = jid;
    }
    return _result;
  }
  factory PiaJuBen.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PiaJuBen.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PiaJuBen clone() => PiaJuBen()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PiaJuBen copyWith(void Function(PiaJuBen) updates) =>
      super.copyWith((message) => updates(message as PiaJuBen))
          as PiaJuBen; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PiaJuBen create() => PiaJuBen._();
  PiaJuBen createEmptyInstance() => create();
  static $pb.PbList<PiaJuBen> createRepeated() => $pb.PbList<PiaJuBen>();
  @$core.pragma('dart2js:noInline')
  static PiaJuBen getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PiaJuBen>(create);
  static PiaJuBen? _defaultInstance;

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
  PiaOrderUser get creator => $_getN(1);
  @$pb.TagNumber(2)
  set creator(PiaOrderUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCreator() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreator() => clearField(2);
  @$pb.TagNumber(2)
  PiaOrderUser ensureCreator() => $_ensure(1);

  @$pb.TagNumber(3)
  PiaJuBenPayNeed get payCreator => $_getN(2);
  @$pb.TagNumber(3)
  set payCreator(PiaJuBenPayNeed v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPayCreator() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayCreator() => clearField(3);
  @$pb.TagNumber(3)
  PiaJuBenPayNeed ensurePayCreator() => $_ensure(2);

  @$pb.TagNumber(4)
  PiaJuBenPayNeed get payRecepition => $_getN(3);
  @$pb.TagNumber(4)
  set payRecepition(PiaJuBenPayNeed v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPayRecepition() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayRecepition() => clearField(4);
  @$pb.TagNumber(4)
  PiaJuBenPayNeed ensurePayRecepition() => $_ensure(3);

  @$pb.TagNumber(5)
  PiaJuBenPayNeed get payGs => $_getN(4);
  @$pb.TagNumber(5)
  set payGs(PiaJuBenPayNeed v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPayGs() => $_has(4);
  @$pb.TagNumber(5)
  void clearPayGs() => clearField(5);
  @$pb.TagNumber(5)
  PiaJuBenPayNeed ensurePayGs() => $_ensure(4);

  @$pb.TagNumber(6)
  PiaJuBenType get type => $_getN(5);
  @$pb.TagNumber(6)
  set type(PiaJuBenType v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get jid => $_getIZ(6);
  @$pb.TagNumber(7)
  set jid($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasJid() => $_has(6);
  @$pb.TagNumber(7)
  void clearJid() => clearField(7);
}

class PiaJuBenPayConfigData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PiaJuBenPayConfigData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PiaJuBenPayConfig>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: PiaJuBenPayConfig.create)
    ..aOM<PiaJuBenPayNeed>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defaultPay',
        subBuilder: PiaJuBenPayNeed.create)
    ..hasRequiredFields = false;

  PiaJuBenPayConfigData._() : super();
  factory PiaJuBenPayConfigData({
    $core.Iterable<PiaJuBenPayConfig>? list,
    PiaJuBenPayNeed? defaultPay,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (defaultPay != null) {
      _result.defaultPay = defaultPay;
    }
    return _result;
  }
  factory PiaJuBenPayConfigData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PiaJuBenPayConfigData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PiaJuBenPayConfigData clone() =>
      PiaJuBenPayConfigData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PiaJuBenPayConfigData copyWith(
          void Function(PiaJuBenPayConfigData) updates) =>
      super.copyWith((message) => updates(message as PiaJuBenPayConfigData))
          as PiaJuBenPayConfigData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PiaJuBenPayConfigData create() => PiaJuBenPayConfigData._();
  PiaJuBenPayConfigData createEmptyInstance() => create();
  static $pb.PbList<PiaJuBenPayConfigData> createRepeated() =>
      $pb.PbList<PiaJuBenPayConfigData>();
  @$core.pragma('dart2js:noInline')
  static PiaJuBenPayConfigData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PiaJuBenPayConfigData>(create);
  static PiaJuBenPayConfigData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PiaJuBenPayConfig> get list => $_getList(0);

  @$pb.TagNumber(2)
  PiaJuBenPayNeed get defaultPay => $_getN(1);
  @$pb.TagNumber(2)
  set defaultPay(PiaJuBenPayNeed v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDefaultPay() => $_has(1);
  @$pb.TagNumber(2)
  void clearDefaultPay() => clearField(2);
  @$pb.TagNumber(2)
  PiaJuBenPayNeed ensureDefaultPay() => $_ensure(1);
}

class PiaJuBenListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PiaJuBenListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PiaJuBen>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: PiaJuBen.create)
    ..hasRequiredFields = false;

  PiaJuBenListData._() : super();
  factory PiaJuBenListData({
    $core.Iterable<PiaJuBen>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory PiaJuBenListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PiaJuBenListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PiaJuBenListData clone() => PiaJuBenListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PiaJuBenListData copyWith(void Function(PiaJuBenListData) updates) =>
      super.copyWith((message) => updates(message as PiaJuBenListData))
          as PiaJuBenListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PiaJuBenListData create() => PiaJuBenListData._();
  PiaJuBenListData createEmptyInstance() => create();
  static $pb.PbList<PiaJuBenListData> createRepeated() =>
      $pb.PbList<PiaJuBenListData>();
  @$core.pragma('dart2js:noInline')
  static PiaJuBenListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PiaJuBenListData>(create);
  static PiaJuBenListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PiaJuBen> get list => $_getList(0);
}

class ResPiaJuBenPayConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResPiaJuBenPayConfig',
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
    ..aOM<PiaJuBenPayConfigData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PiaJuBenPayConfigData.create)
    ..hasRequiredFields = false;

  ResPiaJuBenPayConfig._() : super();
  factory ResPiaJuBenPayConfig({
    $core.bool? success,
    $core.String? msg,
    PiaJuBenPayConfigData? data,
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
  factory ResPiaJuBenPayConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResPiaJuBenPayConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResPiaJuBenPayConfig clone() =>
      ResPiaJuBenPayConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResPiaJuBenPayConfig copyWith(void Function(ResPiaJuBenPayConfig) updates) =>
      super.copyWith((message) => updates(message as ResPiaJuBenPayConfig))
          as ResPiaJuBenPayConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResPiaJuBenPayConfig create() => ResPiaJuBenPayConfig._();
  ResPiaJuBenPayConfig createEmptyInstance() => create();
  static $pb.PbList<ResPiaJuBenPayConfig> createRepeated() =>
      $pb.PbList<ResPiaJuBenPayConfig>();
  @$core.pragma('dart2js:noInline')
  static ResPiaJuBenPayConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResPiaJuBenPayConfig>(create);
  static ResPiaJuBenPayConfig? _defaultInstance;

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
  PiaJuBenPayConfigData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(PiaJuBenPayConfigData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  PiaJuBenPayConfigData ensureData() => $_ensure(2);
}

class ResPiaJuBenList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResPiaJuBenList',
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
    ..aOM<PiaJuBenListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PiaJuBenListData.create)
    ..hasRequiredFields = false;

  ResPiaJuBenList._() : super();
  factory ResPiaJuBenList({
    $core.bool? success,
    $core.String? msg,
    PiaJuBenListData? data,
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
  factory ResPiaJuBenList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResPiaJuBenList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResPiaJuBenList clone() => ResPiaJuBenList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResPiaJuBenList copyWith(void Function(ResPiaJuBenList) updates) =>
      super.copyWith((message) => updates(message as ResPiaJuBenList))
          as ResPiaJuBenList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResPiaJuBenList create() => ResPiaJuBenList._();
  ResPiaJuBenList createEmptyInstance() => create();
  static $pb.PbList<ResPiaJuBenList> createRepeated() =>
      $pb.PbList<ResPiaJuBenList>();
  @$core.pragma('dart2js:noInline')
  static ResPiaJuBenList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResPiaJuBenList>(create);
  static ResPiaJuBenList? _defaultInstance;

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
  PiaJuBenListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(PiaJuBenListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  PiaJuBenListData ensureData() => $_ensure(2);
}

class ResPiaOrderList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResPiaOrderList',
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
    ..aOM<PiaOrderListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PiaOrderListData.create)
    ..hasRequiredFields = false;

  ResPiaOrderList._() : super();
  factory ResPiaOrderList({
    $core.bool? success,
    $core.String? msg,
    PiaOrderListData? data,
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
  factory ResPiaOrderList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResPiaOrderList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResPiaOrderList clone() => ResPiaOrderList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResPiaOrderList copyWith(void Function(ResPiaOrderList) updates) =>
      super.copyWith((message) => updates(message as ResPiaOrderList))
          as ResPiaOrderList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResPiaOrderList create() => ResPiaOrderList._();
  ResPiaOrderList createEmptyInstance() => create();
  static $pb.PbList<ResPiaOrderList> createRepeated() =>
      $pb.PbList<ResPiaOrderList>();
  @$core.pragma('dart2js:noInline')
  static ResPiaOrderList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResPiaOrderList>(create);
  static ResPiaOrderList? _defaultInstance;

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
  PiaOrderListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(PiaOrderListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  PiaOrderListData ensureData() => $_ensure(2);
}

class PiaOrderListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PiaOrderListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PiaOrder>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'orders',
        $pb.PbFieldType.PM,
        subBuilder: PiaOrder.create)
    ..hasRequiredFields = false;

  PiaOrderListData._() : super();
  factory PiaOrderListData({
    $core.Iterable<PiaOrder>? orders,
  }) {
    final _result = create();
    if (orders != null) {
      _result.orders.addAll(orders);
    }
    return _result;
  }
  factory PiaOrderListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PiaOrderListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PiaOrderListData clone() => PiaOrderListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PiaOrderListData copyWith(void Function(PiaOrderListData) updates) =>
      super.copyWith((message) => updates(message as PiaOrderListData))
          as PiaOrderListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PiaOrderListData create() => PiaOrderListData._();
  PiaOrderListData createEmptyInstance() => create();
  static $pb.PbList<PiaOrderListData> createRepeated() =>
      $pb.PbList<PiaOrderListData>();
  @$core.pragma('dart2js:noInline')
  static PiaOrderListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PiaOrderListData>(create);
  static PiaOrderListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PiaOrder> get orders => $_getList(0);
}

class PiaOrder extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PiaOrder',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<PiaJuBen>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'juben',
        subBuilder: PiaJuBen.create)
    ..pc<PiaOrderUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'players',
        $pb.PbFieldType.PM,
        subBuilder: PiaOrderUser.create)
    ..aOM<PiaOrderUser>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'orderUser',
        subBuilder: PiaOrderUser.create)
    ..hasRequiredFields = false;

  PiaOrder._() : super();
  factory PiaOrder({
    PiaJuBen? juben,
    $core.Iterable<PiaOrderUser>? players,
    PiaOrderUser? orderUser,
  }) {
    final _result = create();
    if (juben != null) {
      _result.juben = juben;
    }
    if (players != null) {
      _result.players.addAll(players);
    }
    if (orderUser != null) {
      _result.orderUser = orderUser;
    }
    return _result;
  }
  factory PiaOrder.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PiaOrder.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PiaOrder clone() => PiaOrder()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PiaOrder copyWith(void Function(PiaOrder) updates) =>
      super.copyWith((message) => updates(message as PiaOrder))
          as PiaOrder; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PiaOrder create() => PiaOrder._();
  PiaOrder createEmptyInstance() => create();
  static $pb.PbList<PiaOrder> createRepeated() => $pb.PbList<PiaOrder>();
  @$core.pragma('dart2js:noInline')
  static PiaOrder getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PiaOrder>(create);
  static PiaOrder? _defaultInstance;

  @$pb.TagNumber(1)
  PiaJuBen get juben => $_getN(0);
  @$pb.TagNumber(1)
  set juben(PiaJuBen v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasJuben() => $_has(0);
  @$pb.TagNumber(1)
  void clearJuben() => clearField(1);
  @$pb.TagNumber(1)
  PiaJuBen ensureJuben() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<PiaOrderUser> get players => $_getList(1);

  @$pb.TagNumber(3)
  PiaOrderUser get orderUser => $_getN(2);
  @$pb.TagNumber(3)
  set orderUser(PiaOrderUser v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOrderUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrderUser() => clearField(3);
  @$pb.TagNumber(3)
  PiaOrderUser ensureOrderUser() => $_ensure(2);
}

class PiaOrderUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PiaOrderUser',
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
    ..hasRequiredFields = false;

  PiaOrderUser._() : super();
  factory PiaOrderUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
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
    return _result;
  }
  factory PiaOrderUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PiaOrderUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PiaOrderUser clone() => PiaOrderUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PiaOrderUser copyWith(void Function(PiaOrderUser) updates) =>
      super.copyWith((message) => updates(message as PiaOrderUser))
          as PiaOrderUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PiaOrderUser create() => PiaOrderUser._();
  PiaOrderUser createEmptyInstance() => create();
  static $pb.PbList<PiaOrderUser> createRepeated() =>
      $pb.PbList<PiaOrderUser>();
  @$core.pragma('dart2js:noInline')
  static PiaOrderUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PiaOrderUser>(create);
  static PiaOrderUser? _defaultInstance;

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
}

class PiaOrderNotify extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PiaOrderNotify',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<PiaOrderUser>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from',
        subBuilder: PiaOrderUser.create)
    ..aOM<PiaOrderUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to',
        subBuilder: PiaOrderUser.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'juben')
    ..hasRequiredFields = false;

  PiaOrderNotify._() : super();
  factory PiaOrderNotify({
    PiaOrderUser? from,
    PiaOrderUser? to,
    $core.String? juben,
  }) {
    final _result = create();
    if (from != null) {
      _result.from = from;
    }
    if (to != null) {
      _result.to = to;
    }
    if (juben != null) {
      _result.juben = juben;
    }
    return _result;
  }
  factory PiaOrderNotify.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PiaOrderNotify.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PiaOrderNotify clone() => PiaOrderNotify()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PiaOrderNotify copyWith(void Function(PiaOrderNotify) updates) =>
      super.copyWith((message) => updates(message as PiaOrderNotify))
          as PiaOrderNotify; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PiaOrderNotify create() => PiaOrderNotify._();
  PiaOrderNotify createEmptyInstance() => create();
  static $pb.PbList<PiaOrderNotify> createRepeated() =>
      $pb.PbList<PiaOrderNotify>();
  @$core.pragma('dart2js:noInline')
  static PiaOrderNotify getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PiaOrderNotify>(create);
  static PiaOrderNotify? _defaultInstance;

  @$pb.TagNumber(1)
  PiaOrderUser get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(PiaOrderUser v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);
  @$pb.TagNumber(1)
  PiaOrderUser ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  PiaOrderUser get to => $_getN(1);
  @$pb.TagNumber(2)
  set to(PiaOrderUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);
  @$pb.TagNumber(2)
  PiaOrderUser ensureTo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get juben => $_getSZ(2);
  @$pb.TagNumber(3)
  set juben($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasJuben() => $_has(2);
  @$pb.TagNumber(3)
  void clearJuben() => clearField(3);
}
