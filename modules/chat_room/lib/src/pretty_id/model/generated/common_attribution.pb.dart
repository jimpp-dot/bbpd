///
//  Generated code. Do not modify.
//  source: common_attribution.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AttributionReward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AttributionReward',
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
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  AttributionReward._() : super();
  factory AttributionReward({
    $core.int? cid,
    $core.int? num,
    $core.String? icon,
    $core.String? name,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (num != null) {
      _result.num = num;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory AttributionReward.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AttributionReward.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AttributionReward clone() => AttributionReward()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AttributionReward copyWith(void Function(AttributionReward) updates) =>
      super.copyWith((message) => updates(message as AttributionReward))
          as AttributionReward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttributionReward create() => AttributionReward._();
  AttributionReward createEmptyInstance() => create();
  static $pb.PbList<AttributionReward> createRepeated() =>
      $pb.PbList<AttributionReward>();
  @$core.pragma('dart2js:noInline')
  static AttributionReward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AttributionReward>(create);
  static AttributionReward? _defaultInstance;

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
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);
}

class AttributionBag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AttributionBag',
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
        $pb.PbFieldType.O3)
    ..pc<AttributionReward>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewards',
        $pb.PbFieldType.PM,
        subBuilder: AttributionReward.create)
    ..hasRequiredFields = false;

  AttributionBag._() : super();
  factory AttributionBag({
    $core.int? id,
    $core.Iterable<AttributionReward>? rewards,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (rewards != null) {
      _result.rewards.addAll(rewards);
    }
    return _result;
  }
  factory AttributionBag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AttributionBag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AttributionBag clone() => AttributionBag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AttributionBag copyWith(void Function(AttributionBag) updates) =>
      super.copyWith((message) => updates(message as AttributionBag))
          as AttributionBag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttributionBag create() => AttributionBag._();
  AttributionBag createEmptyInstance() => create();
  static $pb.PbList<AttributionBag> createRepeated() =>
      $pb.PbList<AttributionBag>();
  @$core.pragma('dart2js:noInline')
  static AttributionBag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AttributionBag>(create);
  static AttributionBag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<AttributionReward> get rewards => $_getList(1);
}

class AttributionRewardData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AttributionRewardData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pop')
    ..pc<AttributionBag>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bags',
        $pb.PbFieldType.PM,
        subBuilder: AttributionBag.create)
    ..pc<AttributionReward>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewards',
        $pb.PbFieldType.PM,
        subBuilder: AttributionReward.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..hasRequiredFields = false;

  AttributionRewardData._() : super();
  factory AttributionRewardData({
    $core.bool? pop,
    $core.Iterable<AttributionBag>? bags,
    $core.Iterable<AttributionReward>? rewards,
    $core.String? description,
  }) {
    final _result = create();
    if (pop != null) {
      _result.pop = pop;
    }
    if (bags != null) {
      _result.bags.addAll(bags);
    }
    if (rewards != null) {
      _result.rewards.addAll(rewards);
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory AttributionRewardData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AttributionRewardData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AttributionRewardData clone() =>
      AttributionRewardData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AttributionRewardData copyWith(
          void Function(AttributionRewardData) updates) =>
      super.copyWith((message) => updates(message as AttributionRewardData))
          as AttributionRewardData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttributionRewardData create() => AttributionRewardData._();
  AttributionRewardData createEmptyInstance() => create();
  static $pb.PbList<AttributionRewardData> createRepeated() =>
      $pb.PbList<AttributionRewardData>();
  @$core.pragma('dart2js:noInline')
  static AttributionRewardData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AttributionRewardData>(create);
  static AttributionRewardData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get pop => $_getBF(0);
  @$pb.TagNumber(1)
  set pop($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPop() => $_has(0);
  @$pb.TagNumber(1)
  void clearPop() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<AttributionBag> get bags => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<AttributionReward> get rewards => $_getList(2);

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
}

class ResAttributionReward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAttributionReward',
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
    ..aOM<AttributionRewardData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AttributionRewardData.create)
    ..hasRequiredFields = false;

  ResAttributionReward._() : super();
  factory ResAttributionReward({
    $core.bool? success,
    $core.String? msg,
    AttributionRewardData? data,
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
  factory ResAttributionReward.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAttributionReward.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAttributionReward clone() =>
      ResAttributionReward()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAttributionReward copyWith(void Function(ResAttributionReward) updates) =>
      super.copyWith((message) => updates(message as ResAttributionReward))
          as ResAttributionReward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAttributionReward create() => ResAttributionReward._();
  ResAttributionReward createEmptyInstance() => create();
  static $pb.PbList<ResAttributionReward> createRepeated() =>
      $pb.PbList<ResAttributionReward>();
  @$core.pragma('dart2js:noInline')
  static ResAttributionReward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAttributionReward>(create);
  static ResAttributionReward? _defaultInstance;

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
  AttributionRewardData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AttributionRewardData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AttributionRewardData ensureData() => $_ensure(2);
}

class ClaimRewardData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ClaimRewardData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<AttributionBag>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bag',
        subBuilder: AttributionBag.create)
    ..pc<AttributionReward>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewards',
        $pb.PbFieldType.PM,
        subBuilder: AttributionReward.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prettyId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ClaimRewardData._() : super();
  factory ClaimRewardData({
    AttributionBag? bag,
    $core.Iterable<AttributionReward>? rewards,
    $core.int? prettyId,
  }) {
    final _result = create();
    if (bag != null) {
      _result.bag = bag;
    }
    if (rewards != null) {
      _result.rewards.addAll(rewards);
    }
    if (prettyId != null) {
      _result.prettyId = prettyId;
    }
    return _result;
  }
  factory ClaimRewardData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ClaimRewardData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ClaimRewardData clone() => ClaimRewardData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ClaimRewardData copyWith(void Function(ClaimRewardData) updates) =>
      super.copyWith((message) => updates(message as ClaimRewardData))
          as ClaimRewardData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClaimRewardData create() => ClaimRewardData._();
  ClaimRewardData createEmptyInstance() => create();
  static $pb.PbList<ClaimRewardData> createRepeated() =>
      $pb.PbList<ClaimRewardData>();
  @$core.pragma('dart2js:noInline')
  static ClaimRewardData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimRewardData>(create);
  static ClaimRewardData? _defaultInstance;

  @$pb.TagNumber(1)
  AttributionBag get bag => $_getN(0);
  @$pb.TagNumber(1)
  set bag(AttributionBag v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBag() => $_has(0);
  @$pb.TagNumber(1)
  void clearBag() => clearField(1);
  @$pb.TagNumber(1)
  AttributionBag ensureBag() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<AttributionReward> get rewards => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get prettyId => $_getIZ(2);
  @$pb.TagNumber(3)
  set prettyId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrettyId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrettyId() => clearField(3);
}

class ResClaimReward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResClaimReward',
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
    ..aOM<ClaimRewardData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ClaimRewardData.create)
    ..hasRequiredFields = false;

  ResClaimReward._() : super();
  factory ResClaimReward({
    $core.bool? success,
    $core.String? msg,
    ClaimRewardData? data,
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
  factory ResClaimReward.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResClaimReward.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResClaimReward clone() => ResClaimReward()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResClaimReward copyWith(void Function(ResClaimReward) updates) =>
      super.copyWith((message) => updates(message as ResClaimReward))
          as ResClaimReward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResClaimReward create() => ResClaimReward._();
  ResClaimReward createEmptyInstance() => create();
  static $pb.PbList<ResClaimReward> createRepeated() =>
      $pb.PbList<ResClaimReward>();
  @$core.pragma('dart2js:noInline')
  static ResClaimReward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResClaimReward>(create);
  static ResClaimReward? _defaultInstance;

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
  ClaimRewardData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ClaimRewardData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ClaimRewardData ensureData() => $_ensure(2);
}
