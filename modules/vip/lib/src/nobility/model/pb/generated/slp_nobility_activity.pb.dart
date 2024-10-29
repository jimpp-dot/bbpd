///
//  Generated code. Do not modify.
//  source: slp_nobility_activity.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RespGiftBagDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGiftBagDetail',
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
    ..aOM<GiftBagTitleData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleData',
        subBuilder: GiftBagTitleData.create)
    ..aOM<GiftBag11Data>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'elevenData',
        subBuilder: GiftBag11Data.create)
    ..aOM<GiftBagCherishData>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cherishData',
        subBuilder: GiftBagCherishData.create)
    ..hasRequiredFields = false;

  RespGiftBagDetail._() : super();
  factory RespGiftBagDetail({
    $core.bool? success,
    $core.String? msg,
    GiftBagTitleData? titleData,
    GiftBag11Data? elevenData,
    GiftBagCherishData? cherishData,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (titleData != null) {
      _result.titleData = titleData;
    }
    if (elevenData != null) {
      _result.elevenData = elevenData;
    }
    if (cherishData != null) {
      _result.cherishData = cherishData;
    }
    return _result;
  }
  factory RespGiftBagDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGiftBagDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGiftBagDetail clone() => RespGiftBagDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGiftBagDetail copyWith(void Function(RespGiftBagDetail) updates) =>
      super.copyWith((message) => updates(message as RespGiftBagDetail))
          as RespGiftBagDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGiftBagDetail create() => RespGiftBagDetail._();
  RespGiftBagDetail createEmptyInstance() => create();
  static $pb.PbList<RespGiftBagDetail> createRepeated() =>
      $pb.PbList<RespGiftBagDetail>();
  @$core.pragma('dart2js:noInline')
  static RespGiftBagDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGiftBagDetail>(create);
  static RespGiftBagDetail? _defaultInstance;

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
  GiftBagTitleData get titleData => $_getN(2);
  @$pb.TagNumber(3)
  set titleData(GiftBagTitleData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTitleData() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitleData() => clearField(3);
  @$pb.TagNumber(3)
  GiftBagTitleData ensureTitleData() => $_ensure(2);

  @$pb.TagNumber(4)
  GiftBag11Data get elevenData => $_getN(3);
  @$pb.TagNumber(4)
  set elevenData(GiftBag11Data v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasElevenData() => $_has(3);
  @$pb.TagNumber(4)
  void clearElevenData() => clearField(4);
  @$pb.TagNumber(4)
  GiftBag11Data ensureElevenData() => $_ensure(3);

  @$pb.TagNumber(5)
  GiftBagCherishData get cherishData => $_getN(4);
  @$pb.TagNumber(5)
  set cherishData(GiftBagCherishData v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCherishData() => $_has(4);
  @$pb.TagNumber(5)
  void clearCherishData() => clearField(5);
  @$pb.TagNumber(5)
  GiftBagCherishData ensureCherishData() => $_ensure(4);
}

class GiftBagTitleData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftBagTitleData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'period')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cost',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'left',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleIcon')
    ..pc<GiftBagBenefitData>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'benefits',
        $pb.PbFieldType.PM,
        subBuilder: GiftBagBenefitData.create)
    ..pc<GiftBagRewardData>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewards',
        $pb.PbFieldType.PM,
        subBuilder: GiftBagRewardData.create)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardValue',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  GiftBagTitleData._() : super();
  factory GiftBagTitleData({
    $core.String? period,
    $core.int? cost,
    $core.int? left,
    $core.String? titleIcon,
    $core.Iterable<GiftBagBenefitData>? benefits,
    $core.Iterable<GiftBagRewardData>? rewards,
    $core.int? rewardValue,
    $core.String? desc,
  }) {
    final _result = create();
    if (period != null) {
      _result.period = period;
    }
    if (cost != null) {
      _result.cost = cost;
    }
    if (left != null) {
      _result.left = left;
    }
    if (titleIcon != null) {
      _result.titleIcon = titleIcon;
    }
    if (benefits != null) {
      _result.benefits.addAll(benefits);
    }
    if (rewards != null) {
      _result.rewards.addAll(rewards);
    }
    if (rewardValue != null) {
      _result.rewardValue = rewardValue;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory GiftBagTitleData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftBagTitleData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftBagTitleData clone() => GiftBagTitleData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftBagTitleData copyWith(void Function(GiftBagTitleData) updates) =>
      super.copyWith((message) => updates(message as GiftBagTitleData))
          as GiftBagTitleData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftBagTitleData create() => GiftBagTitleData._();
  GiftBagTitleData createEmptyInstance() => create();
  static $pb.PbList<GiftBagTitleData> createRepeated() =>
      $pb.PbList<GiftBagTitleData>();
  @$core.pragma('dart2js:noInline')
  static GiftBagTitleData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftBagTitleData>(create);
  static GiftBagTitleData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get period => $_getSZ(0);
  @$pb.TagNumber(1)
  set period($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPeriod() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeriod() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get cost => $_getIZ(1);
  @$pb.TagNumber(2)
  set cost($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCost() => $_has(1);
  @$pb.TagNumber(2)
  void clearCost() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get left => $_getIZ(2);
  @$pb.TagNumber(3)
  set left($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLeft() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeft() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get titleIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set titleIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTitleIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitleIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<GiftBagBenefitData> get benefits => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<GiftBagRewardData> get rewards => $_getList(5);

  @$pb.TagNumber(7)
  $core.int get rewardValue => $_getIZ(6);
  @$pb.TagNumber(7)
  set rewardValue($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRewardValue() => $_has(6);
  @$pb.TagNumber(7)
  void clearRewardValue() => clearField(7);

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

class GiftBagBenefitData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftBagBenefitData',
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
    ..hasRequiredFields = false;

  GiftBagBenefitData._() : super();
  factory GiftBagBenefitData({
    $core.String? name,
    $core.String? icon,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory GiftBagBenefitData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftBagBenefitData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftBagBenefitData clone() => GiftBagBenefitData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftBagBenefitData copyWith(void Function(GiftBagBenefitData) updates) =>
      super.copyWith((message) => updates(message as GiftBagBenefitData))
          as GiftBagBenefitData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftBagBenefitData create() => GiftBagBenefitData._();
  GiftBagBenefitData createEmptyInstance() => create();
  static $pb.PbList<GiftBagBenefitData> createRepeated() =>
      $pb.PbList<GiftBagBenefitData>();
  @$core.pragma('dart2js:noInline')
  static GiftBagBenefitData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftBagBenefitData>(create);
  static GiftBagBenefitData? _defaultInstance;

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
}

class GiftBagRewardData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftBagRewardData',
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
            : 'cateName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'period',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftBagRewardData._() : super();
  factory GiftBagRewardData({
    $core.String? name,
    $core.String? icon,
    $core.String? cateName,
    $core.int? id,
    $core.int? price,
    $core.int? period,
    $core.int? type,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (cateName != null) {
      _result.cateName = cateName;
    }
    if (id != null) {
      _result.id = id;
    }
    if (price != null) {
      _result.price = price;
    }
    if (period != null) {
      _result.period = period;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory GiftBagRewardData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftBagRewardData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftBagRewardData clone() => GiftBagRewardData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftBagRewardData copyWith(void Function(GiftBagRewardData) updates) =>
      super.copyWith((message) => updates(message as GiftBagRewardData))
          as GiftBagRewardData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftBagRewardData create() => GiftBagRewardData._();
  GiftBagRewardData createEmptyInstance() => create();
  static $pb.PbList<GiftBagRewardData> createRepeated() =>
      $pb.PbList<GiftBagRewardData>();
  @$core.pragma('dart2js:noInline')
  static GiftBagRewardData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftBagRewardData>(create);
  static GiftBagRewardData? _defaultInstance;

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
  $core.String get cateName => $_getSZ(2);
  @$pb.TagNumber(3)
  set cateName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCateName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCateName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get id => $_getIZ(3);
  @$pb.TagNumber(4)
  set id($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get price => $_getIZ(4);
  @$pb.TagNumber(5)
  set price($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get period => $_getIZ(5);
  @$pb.TagNumber(6)
  set period($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPeriod() => $_has(5);
  @$pb.TagNumber(6)
  void clearPeriod() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get type => $_getIZ(6);
  @$pb.TagNumber(7)
  set type($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => clearField(7);
}

class GiftBag11Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftBag11Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'left',
        $pb.PbFieldType.OU3)
    ..pc<GiftBagRewardData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewards',
        $pb.PbFieldType.PM,
        subBuilder: GiftBagRewardData.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cost',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftBag11Data._() : super();
  factory GiftBag11Data({
    $core.int? left,
    $core.Iterable<GiftBagRewardData>? rewards,
    $core.int? cost,
  }) {
    final _result = create();
    if (left != null) {
      _result.left = left;
    }
    if (rewards != null) {
      _result.rewards.addAll(rewards);
    }
    if (cost != null) {
      _result.cost = cost;
    }
    return _result;
  }
  factory GiftBag11Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftBag11Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftBag11Data clone() => GiftBag11Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftBag11Data copyWith(void Function(GiftBag11Data) updates) =>
      super.copyWith((message) => updates(message as GiftBag11Data))
          as GiftBag11Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftBag11Data create() => GiftBag11Data._();
  GiftBag11Data createEmptyInstance() => create();
  static $pb.PbList<GiftBag11Data> createRepeated() =>
      $pb.PbList<GiftBag11Data>();
  @$core.pragma('dart2js:noInline')
  static GiftBag11Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftBag11Data>(create);
  static GiftBag11Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get left => $_getIZ(0);
  @$pb.TagNumber(1)
  set left($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeft() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeft() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<GiftBagRewardData> get rewards => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get cost => $_getIZ(2);
  @$pb.TagNumber(3)
  set cost($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCost() => $_has(2);
  @$pb.TagNumber(3)
  void clearCost() => clearField(3);
}

class GiftBagCherishData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftBagCherishData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'left',
        $pb.PbFieldType.OU3)
    ..pc<GiftBagRewardData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewards',
        $pb.PbFieldType.PM,
        subBuilder: GiftBagRewardData.create)
    ..hasRequiredFields = false;

  GiftBagCherishData._() : super();
  factory GiftBagCherishData({
    $core.int? left,
    $core.Iterable<GiftBagRewardData>? rewards,
  }) {
    final _result = create();
    if (left != null) {
      _result.left = left;
    }
    if (rewards != null) {
      _result.rewards.addAll(rewards);
    }
    return _result;
  }
  factory GiftBagCherishData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftBagCherishData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftBagCherishData clone() => GiftBagCherishData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftBagCherishData copyWith(void Function(GiftBagCherishData) updates) =>
      super.copyWith((message) => updates(message as GiftBagCherishData))
          as GiftBagCherishData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftBagCherishData create() => GiftBagCherishData._();
  GiftBagCherishData createEmptyInstance() => create();
  static $pb.PbList<GiftBagCherishData> createRepeated() =>
      $pb.PbList<GiftBagCherishData>();
  @$core.pragma('dart2js:noInline')
  static GiftBagCherishData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftBagCherishData>(create);
  static GiftBagCherishData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get left => $_getIZ(0);
  @$pb.TagNumber(1)
  set left($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeft() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeft() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<GiftBagRewardData> get rewards => $_getList(1);
}

class RespGiftBagBuy extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGiftBagBuy',
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

  RespGiftBagBuy._() : super();
  factory RespGiftBagBuy({
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
  factory RespGiftBagBuy.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGiftBagBuy.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGiftBagBuy clone() => RespGiftBagBuy()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGiftBagBuy copyWith(void Function(RespGiftBagBuy) updates) =>
      super.copyWith((message) => updates(message as RespGiftBagBuy))
          as RespGiftBagBuy; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGiftBagBuy create() => RespGiftBagBuy._();
  RespGiftBagBuy createEmptyInstance() => create();
  static $pb.PbList<RespGiftBagBuy> createRepeated() =>
      $pb.PbList<RespGiftBagBuy>();
  @$core.pragma('dart2js:noInline')
  static RespGiftBagBuy getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGiftBagBuy>(create);
  static RespGiftBagBuy? _defaultInstance;

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
