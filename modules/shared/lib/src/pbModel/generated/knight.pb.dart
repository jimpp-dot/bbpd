///
//  Generated code. Do not modify.
//  source: knight.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class KnightEquities extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KnightEquities',
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
            : 'label')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  KnightEquities._() : super();
  factory KnightEquities({
    $core.String? icon,
    $core.String? label,
    $core.String? desc,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (label != null) {
      _result.label = label;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory KnightEquities.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KnightEquities.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KnightEquities clone() => KnightEquities()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KnightEquities copyWith(void Function(KnightEquities) updates) =>
      super.copyWith((message) => updates(message as KnightEquities))
          as KnightEquities; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KnightEquities create() => KnightEquities._();
  KnightEquities createEmptyInstance() => create();
  static $pb.PbList<KnightEquities> createRepeated() =>
      $pb.PbList<KnightEquities>();
  @$core.pragma('dart2js:noInline')
  static KnightEquities getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KnightEquities>(create);
  static KnightEquities? _defaultInstance;

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
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(2)
  set label($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLabel() => clearField(2);

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

class KnightDurationList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KnightDurationList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'durationLabel',
        protoName: 'durationLabel')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'durationPrice',
        $pb.PbFieldType.OU3,
        protoName: 'durationPrice')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'durationLevel',
        $pb.PbFieldType.OU3,
        protoName: 'durationLevel')
    ..hasRequiredFields = false;

  KnightDurationList._() : super();
  factory KnightDurationList({
    $core.String? durationLabel,
    $core.int? durationPrice,
    $core.int? durationLevel,
  }) {
    final _result = create();
    if (durationLabel != null) {
      _result.durationLabel = durationLabel;
    }
    if (durationPrice != null) {
      _result.durationPrice = durationPrice;
    }
    if (durationLevel != null) {
      _result.durationLevel = durationLevel;
    }
    return _result;
  }
  factory KnightDurationList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KnightDurationList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KnightDurationList clone() => KnightDurationList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KnightDurationList copyWith(void Function(KnightDurationList) updates) =>
      super.copyWith((message) => updates(message as KnightDurationList))
          as KnightDurationList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KnightDurationList create() => KnightDurationList._();
  KnightDurationList createEmptyInstance() => create();
  static $pb.PbList<KnightDurationList> createRepeated() =>
      $pb.PbList<KnightDurationList>();
  @$core.pragma('dart2js:noInline')
  static KnightDurationList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KnightDurationList>(create);
  static KnightDurationList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get durationLabel => $_getSZ(0);
  @$pb.TagNumber(1)
  set durationLabel($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDurationLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearDurationLabel() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get durationPrice => $_getIZ(1);
  @$pb.TagNumber(2)
  set durationPrice($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDurationPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearDurationPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get durationLevel => $_getIZ(2);
  @$pb.TagNumber(3)
  set durationLevel($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDurationLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearDurationLevel() => clearField(3);
}

class KnightItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KnightItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightName',
        protoName: 'knightName')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightLevel',
        $pb.PbFieldType.OU3,
        protoName: 'knightLevel')
    ..pc<KnightEquities>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'equitiesList',
        $pb.PbFieldType.PM,
        protoName: 'equitiesList',
        subBuilder: KnightEquities.create)
    ..pc<KnightDurationList>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'durationList',
        $pb.PbFieldType.PM,
        protoName: 'durationList',
        subBuilder: KnightDurationList.create)
    ..aOM<KnightCouponInfo>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightCoupon',
        protoName: 'knightCoupon',
        subBuilder: KnightCouponInfo.create)
    ..hasRequiredFields = false;

  KnightItem._() : super();
  factory KnightItem({
    $core.String? knightName,
    $core.int? knightLevel,
    $core.Iterable<KnightEquities>? equitiesList,
    $core.Iterable<KnightDurationList>? durationList,
    KnightCouponInfo? knightCoupon,
  }) {
    final _result = create();
    if (knightName != null) {
      _result.knightName = knightName;
    }
    if (knightLevel != null) {
      _result.knightLevel = knightLevel;
    }
    if (equitiesList != null) {
      _result.equitiesList.addAll(equitiesList);
    }
    if (durationList != null) {
      _result.durationList.addAll(durationList);
    }
    if (knightCoupon != null) {
      _result.knightCoupon = knightCoupon;
    }
    return _result;
  }
  factory KnightItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KnightItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KnightItem clone() => KnightItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KnightItem copyWith(void Function(KnightItem) updates) =>
      super.copyWith((message) => updates(message as KnightItem))
          as KnightItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KnightItem create() => KnightItem._();
  KnightItem createEmptyInstance() => create();
  static $pb.PbList<KnightItem> createRepeated() => $pb.PbList<KnightItem>();
  @$core.pragma('dart2js:noInline')
  static KnightItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KnightItem>(create);
  static KnightItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get knightName => $_getSZ(0);
  @$pb.TagNumber(1)
  set knightName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKnightName() => $_has(0);
  @$pb.TagNumber(1)
  void clearKnightName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get knightLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set knightLevel($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasKnightLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearKnightLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<KnightEquities> get equitiesList => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<KnightDurationList> get durationList => $_getList(3);

  @$pb.TagNumber(5)
  KnightCouponInfo get knightCoupon => $_getN(4);
  @$pb.TagNumber(5)
  set knightCoupon(KnightCouponInfo v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasKnightCoupon() => $_has(4);
  @$pb.TagNumber(5)
  void clearKnightCoupon() => clearField(5);
  @$pb.TagNumber(5)
  KnightCouponInfo ensureKnightCoupon() => $_ensure(4);
}

class ResKnightConfigList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResKnightConfigList',
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
    ..pc<KnightItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: KnightItem.create)
    ..pc<KnightItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'verifyData',
        $pb.PbFieldType.PM,
        subBuilder: KnightItem.create)
    ..hasRequiredFields = false;

  ResKnightConfigList._() : super();
  factory ResKnightConfigList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<KnightItem>? data,
    $core.Iterable<KnightItem>? verifyData,
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
    if (verifyData != null) {
      _result.verifyData.addAll(verifyData);
    }
    return _result;
  }
  factory ResKnightConfigList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResKnightConfigList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResKnightConfigList clone() => ResKnightConfigList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResKnightConfigList copyWith(void Function(ResKnightConfigList) updates) =>
      super.copyWith((message) => updates(message as ResKnightConfigList))
          as ResKnightConfigList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResKnightConfigList create() => ResKnightConfigList._();
  ResKnightConfigList createEmptyInstance() => create();
  static $pb.PbList<ResKnightConfigList> createRepeated() =>
      $pb.PbList<ResKnightConfigList>();
  @$core.pragma('dart2js:noInline')
  static ResKnightConfigList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResKnightConfigList>(create);
  static ResKnightConfigList? _defaultInstance;

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
  $core.List<KnightItem> get data => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<KnightItem> get verifyData => $_getList(3);
}

class KnightRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KnightRankItem',
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
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sortIndex',
        $pb.PbFieldType.OU3,
        protoName: 'sortIndex')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sortScore',
        $pb.PbFieldType.OU3,
        protoName: 'sortScore')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightLevel',
        $pb.PbFieldType.OU3,
        protoName: 'knightLevel')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightIcon',
        protoName: 'knightIcon')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expireDesc',
        protoName: 'expireDesc')
    ..aOB(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expireAlert',
        protoName: 'expireAlert')
    ..hasRequiredFields = false;

  KnightRankItem._() : super();
  factory KnightRankItem({
    $core.String? icon,
    $core.String? name,
    $core.int? sortIndex,
    $core.int? sortScore,
    $core.int? knightLevel,
    $core.String? knightIcon,
    $core.String? expireDesc,
    $core.bool? expireAlert,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sortIndex != null) {
      _result.sortIndex = sortIndex;
    }
    if (sortScore != null) {
      _result.sortScore = sortScore;
    }
    if (knightLevel != null) {
      _result.knightLevel = knightLevel;
    }
    if (knightIcon != null) {
      _result.knightIcon = knightIcon;
    }
    if (expireDesc != null) {
      _result.expireDesc = expireDesc;
    }
    if (expireAlert != null) {
      _result.expireAlert = expireAlert;
    }
    return _result;
  }
  factory KnightRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KnightRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KnightRankItem clone() => KnightRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KnightRankItem copyWith(void Function(KnightRankItem) updates) =>
      super.copyWith((message) => updates(message as KnightRankItem))
          as KnightRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KnightRankItem create() => KnightRankItem._();
  KnightRankItem createEmptyInstance() => create();
  static $pb.PbList<KnightRankItem> createRepeated() =>
      $pb.PbList<KnightRankItem>();
  @$core.pragma('dart2js:noInline')
  static KnightRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KnightRankItem>(create);
  static KnightRankItem? _defaultInstance;

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
  $core.int get sortIndex => $_getIZ(2);
  @$pb.TagNumber(3)
  set sortIndex($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSortIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearSortIndex() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get sortScore => $_getIZ(3);
  @$pb.TagNumber(4)
  set sortScore($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSortScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearSortScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get knightLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set knightLevel($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasKnightLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearKnightLevel() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get knightIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set knightIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasKnightIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearKnightIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get expireDesc => $_getSZ(6);
  @$pb.TagNumber(7)
  set expireDesc($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasExpireDesc() => $_has(6);
  @$pb.TagNumber(7)
  void clearExpireDesc() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get expireAlert => $_getBF(7);
  @$pb.TagNumber(8)
  set expireAlert($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasExpireAlert() => $_has(7);
  @$pb.TagNumber(8)
  void clearExpireAlert() => clearField(8);
}

class KnightGroupInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KnightGroupInfo',
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
    ..a<$fixnum.Int64>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupScore',
        $pb.PbFieldType.OU6,
        protoName: 'groupScore',
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'memberNum',
        $pb.PbFieldType.OU3,
        protoName: 'memberNum')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupRank',
        $pb.PbFieldType.OU3,
        protoName: 'groupRank')
    ..hasRequiredFields = false;

  KnightGroupInfo._() : super();
  factory KnightGroupInfo({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $fixnum.Int64? groupScore,
    $core.int? memberNum,
    $core.int? groupRank,
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
    if (groupScore != null) {
      _result.groupScore = groupScore;
    }
    if (memberNum != null) {
      _result.memberNum = memberNum;
    }
    if (groupRank != null) {
      _result.groupRank = groupRank;
    }
    return _result;
  }
  factory KnightGroupInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KnightGroupInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KnightGroupInfo clone() => KnightGroupInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KnightGroupInfo copyWith(void Function(KnightGroupInfo) updates) =>
      super.copyWith((message) => updates(message as KnightGroupInfo))
          as KnightGroupInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KnightGroupInfo create() => KnightGroupInfo._();
  KnightGroupInfo createEmptyInstance() => create();
  static $pb.PbList<KnightGroupInfo> createRepeated() =>
      $pb.PbList<KnightGroupInfo>();
  @$core.pragma('dart2js:noInline')
  static KnightGroupInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KnightGroupInfo>(create);
  static KnightGroupInfo? _defaultInstance;

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
  $fixnum.Int64 get groupScore => $_getI64(3);
  @$pb.TagNumber(4)
  set groupScore($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGroupScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearGroupScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get memberNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set memberNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMemberNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearMemberNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get groupRank => $_getIZ(5);
  @$pb.TagNumber(6)
  set groupRank($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGroupRank() => $_has(5);
  @$pb.TagNumber(6)
  void clearGroupRank() => clearField(6);
}

class KnightCouponInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KnightCouponInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ucid',
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
            : 'ductionMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightLevel',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'couponTips')
    ..hasRequiredFields = false;

  KnightCouponInfo._() : super();
  factory KnightCouponInfo({
    $core.int? ucid,
    $core.String? name,
    $core.int? ductionMoney,
    $core.int? knightLevel,
    $core.String? couponTips,
  }) {
    final _result = create();
    if (ucid != null) {
      _result.ucid = ucid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (ductionMoney != null) {
      _result.ductionMoney = ductionMoney;
    }
    if (knightLevel != null) {
      _result.knightLevel = knightLevel;
    }
    if (couponTips != null) {
      _result.couponTips = couponTips;
    }
    return _result;
  }
  factory KnightCouponInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KnightCouponInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KnightCouponInfo clone() => KnightCouponInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KnightCouponInfo copyWith(void Function(KnightCouponInfo) updates) =>
      super.copyWith((message) => updates(message as KnightCouponInfo))
          as KnightCouponInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KnightCouponInfo create() => KnightCouponInfo._();
  KnightCouponInfo createEmptyInstance() => create();
  static $pb.PbList<KnightCouponInfo> createRepeated() =>
      $pb.PbList<KnightCouponInfo>();
  @$core.pragma('dart2js:noInline')
  static KnightCouponInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KnightCouponInfo>(create);
  static KnightCouponInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get ucid => $_getIZ(0);
  @$pb.TagNumber(1)
  set ucid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUcid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUcid() => clearField(1);

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
  $core.int get ductionMoney => $_getIZ(2);
  @$pb.TagNumber(3)
  set ductionMoney($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDuctionMoney() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuctionMoney() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get knightLevel => $_getIZ(3);
  @$pb.TagNumber(4)
  set knightLevel($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasKnightLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearKnightLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get couponTips => $_getSZ(4);
  @$pb.TagNumber(5)
  set couponTips($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCouponTips() => $_has(4);
  @$pb.TagNumber(5)
  void clearCouponTips() => clearField(5);
}

class ResKnightRankList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResKnightRankList',
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
    ..aOM<KnightRankItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightRankMaster',
        protoName: 'knightRankMaster',
        subBuilder: KnightRankItem.create)
    ..aOM<KnightRankItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightMyInfo',
        protoName: 'knightMyInfo',
        subBuilder: KnightRankItem.create)
    ..pc<KnightRankItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: KnightRankItem.create)
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore',
        protoName: 'hasMore')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..aOB(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isRoomer',
        protoName: 'isRoomer')
    ..aOM<KnightGroupInfo>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightGroupInfo',
        protoName: 'knightGroupInfo',
        subBuilder: KnightGroupInfo.create)
    ..aOM<KnightCouponInfo>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightCoupon',
        protoName: 'knightCoupon',
        subBuilder: KnightCouponInfo.create)
    ..hasRequiredFields = false;

  ResKnightRankList._() : super();
  factory ResKnightRankList({
    $core.bool? success,
    $core.String? msg,
    KnightRankItem? knightRankMaster,
    KnightRankItem? knightMyInfo,
    $core.Iterable<KnightRankItem>? list,
    $core.bool? hasMore,
    $core.int? total,
    $core.bool? isRoomer,
    KnightGroupInfo? knightGroupInfo,
    KnightCouponInfo? knightCoupon,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (knightRankMaster != null) {
      _result.knightRankMaster = knightRankMaster;
    }
    if (knightMyInfo != null) {
      _result.knightMyInfo = knightMyInfo;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    if (total != null) {
      _result.total = total;
    }
    if (isRoomer != null) {
      _result.isRoomer = isRoomer;
    }
    if (knightGroupInfo != null) {
      _result.knightGroupInfo = knightGroupInfo;
    }
    if (knightCoupon != null) {
      _result.knightCoupon = knightCoupon;
    }
    return _result;
  }
  factory ResKnightRankList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResKnightRankList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResKnightRankList clone() => ResKnightRankList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResKnightRankList copyWith(void Function(ResKnightRankList) updates) =>
      super.copyWith((message) => updates(message as ResKnightRankList))
          as ResKnightRankList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResKnightRankList create() => ResKnightRankList._();
  ResKnightRankList createEmptyInstance() => create();
  static $pb.PbList<ResKnightRankList> createRepeated() =>
      $pb.PbList<ResKnightRankList>();
  @$core.pragma('dart2js:noInline')
  static ResKnightRankList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResKnightRankList>(create);
  static ResKnightRankList? _defaultInstance;

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
  KnightRankItem get knightRankMaster => $_getN(2);
  @$pb.TagNumber(3)
  set knightRankMaster(KnightRankItem v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasKnightRankMaster() => $_has(2);
  @$pb.TagNumber(3)
  void clearKnightRankMaster() => clearField(3);
  @$pb.TagNumber(3)
  KnightRankItem ensureKnightRankMaster() => $_ensure(2);

  @$pb.TagNumber(4)
  KnightRankItem get knightMyInfo => $_getN(3);
  @$pb.TagNumber(4)
  set knightMyInfo(KnightRankItem v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasKnightMyInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearKnightMyInfo() => clearField(4);
  @$pb.TagNumber(4)
  KnightRankItem ensureKnightMyInfo() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<KnightRankItem> get list => $_getList(4);

  @$pb.TagNumber(6)
  $core.bool get hasMore => $_getBF(5);
  @$pb.TagNumber(6)
  set hasMore($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHasMore() => $_has(5);
  @$pb.TagNumber(6)
  void clearHasMore() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get total => $_getIZ(6);
  @$pb.TagNumber(7)
  set total($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTotal() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotal() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isRoomer => $_getBF(7);
  @$pb.TagNumber(8)
  set isRoomer($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIsRoomer() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsRoomer() => clearField(8);

  @$pb.TagNumber(9)
  KnightGroupInfo get knightGroupInfo => $_getN(8);
  @$pb.TagNumber(9)
  set knightGroupInfo(KnightGroupInfo v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasKnightGroupInfo() => $_has(8);
  @$pb.TagNumber(9)
  void clearKnightGroupInfo() => clearField(9);
  @$pb.TagNumber(9)
  KnightGroupInfo ensureKnightGroupInfo() => $_ensure(8);

  @$pb.TagNumber(10)
  KnightCouponInfo get knightCoupon => $_getN(9);
  @$pb.TagNumber(10)
  set knightCoupon(KnightCouponInfo v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasKnightCoupon() => $_has(9);
  @$pb.TagNumber(10)
  void clearKnightCoupon() => clearField(10);
  @$pb.TagNumber(10)
  KnightCouponInfo ensureKnightCoupon() => $_ensure(9);
}

class MeKnightItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MeKnightItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightName',
        protoName: 'knightName')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightLevel',
        $pb.PbFieldType.OU3,
        protoName: 'knightLevel')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expireTime',
        $pb.PbFieldType.OU3,
        protoName: 'expireTime')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasBuy',
        protoName: 'hasBuy')
    ..hasRequiredFields = false;

  MeKnightItem._() : super();
  factory MeKnightItem({
    $core.String? knightName,
    $core.int? knightLevel,
    $core.int? expireTime,
    $core.bool? hasBuy,
  }) {
    final _result = create();
    if (knightName != null) {
      _result.knightName = knightName;
    }
    if (knightLevel != null) {
      _result.knightLevel = knightLevel;
    }
    if (expireTime != null) {
      _result.expireTime = expireTime;
    }
    if (hasBuy != null) {
      _result.hasBuy = hasBuy;
    }
    return _result;
  }
  factory MeKnightItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MeKnightItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MeKnightItem clone() => MeKnightItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MeKnightItem copyWith(void Function(MeKnightItem) updates) =>
      super.copyWith((message) => updates(message as MeKnightItem))
          as MeKnightItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MeKnightItem create() => MeKnightItem._();
  MeKnightItem createEmptyInstance() => create();
  static $pb.PbList<MeKnightItem> createRepeated() =>
      $pb.PbList<MeKnightItem>();
  @$core.pragma('dart2js:noInline')
  static MeKnightItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MeKnightItem>(create);
  static MeKnightItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get knightName => $_getSZ(0);
  @$pb.TagNumber(1)
  set knightName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKnightName() => $_has(0);
  @$pb.TagNumber(1)
  void clearKnightName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get knightLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set knightLevel($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasKnightLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearKnightLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get expireTime => $_getIZ(2);
  @$pb.TagNumber(3)
  set expireTime($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasExpireTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpireTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get hasBuy => $_getBF(3);
  @$pb.TagNumber(4)
  set hasBuy($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHasBuy() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasBuy() => clearField(4);
}

class ResKnightMine extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResKnightMine',
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
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightScore',
        $pb.PbFieldType.OU3,
        protoName: 'knightScore')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightLevel',
        $pb.PbFieldType.OU3,
        protoName: 'knightLevel')
    ..pc<MeKnightItem>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightList',
        $pb.PbFieldType.PM,
        protoName: 'knightList',
        subBuilder: MeKnightItem.create)
    ..hasRequiredFields = false;

  ResKnightMine._() : super();
  factory ResKnightMine({
    $core.bool? success,
    $core.String? msg,
    $core.String? icon,
    $core.String? name,
    $core.int? knightScore,
    $core.int? knightLevel,
    $core.Iterable<MeKnightItem>? knightList,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (knightScore != null) {
      _result.knightScore = knightScore;
    }
    if (knightLevel != null) {
      _result.knightLevel = knightLevel;
    }
    if (knightList != null) {
      _result.knightList.addAll(knightList);
    }
    return _result;
  }
  factory ResKnightMine.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResKnightMine.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResKnightMine clone() => ResKnightMine()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResKnightMine copyWith(void Function(ResKnightMine) updates) =>
      super.copyWith((message) => updates(message as ResKnightMine))
          as ResKnightMine; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResKnightMine create() => ResKnightMine._();
  ResKnightMine createEmptyInstance() => create();
  static $pb.PbList<ResKnightMine> createRepeated() =>
      $pb.PbList<ResKnightMine>();
  @$core.pragma('dart2js:noInline')
  static ResKnightMine getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResKnightMine>(create);
  static ResKnightMine? _defaultInstance;

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

  @$pb.TagNumber(5)
  $core.int get knightScore => $_getIZ(4);
  @$pb.TagNumber(5)
  set knightScore($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasKnightScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearKnightScore() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get knightLevel => $_getIZ(5);
  @$pb.TagNumber(6)
  set knightLevel($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasKnightLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearKnightLevel() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<MeKnightItem> get knightList => $_getList(6);
}

class ResKnightGroupRankList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResKnightGroupRankList',
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
    ..pc<KnightGroupRankItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: KnightGroupRankItem.create)
    ..aOM<KnightGroupRankItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'my',
        subBuilder: KnightGroupRankItem.create)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore',
        protoName: 'hasMore')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ResKnightGroupRankList._() : super();
  factory ResKnightGroupRankList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<KnightGroupRankItem>? list,
    KnightGroupRankItem? my,
    $core.bool? hasMore,
    $core.int? total,
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
    if (my != null) {
      _result.my = my;
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    if (total != null) {
      _result.total = total;
    }
    return _result;
  }
  factory ResKnightGroupRankList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResKnightGroupRankList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResKnightGroupRankList clone() =>
      ResKnightGroupRankList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResKnightGroupRankList copyWith(
          void Function(ResKnightGroupRankList) updates) =>
      super.copyWith((message) => updates(message as ResKnightGroupRankList))
          as ResKnightGroupRankList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResKnightGroupRankList create() => ResKnightGroupRankList._();
  ResKnightGroupRankList createEmptyInstance() => create();
  static $pb.PbList<ResKnightGroupRankList> createRepeated() =>
      $pb.PbList<ResKnightGroupRankList>();
  @$core.pragma('dart2js:noInline')
  static ResKnightGroupRankList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResKnightGroupRankList>(create);
  static ResKnightGroupRankList? _defaultInstance;

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
  $core.List<KnightGroupRankItem> get list => $_getList(2);

  @$pb.TagNumber(4)
  KnightGroupRankItem get my => $_getN(3);
  @$pb.TagNumber(4)
  set my(KnightGroupRankItem v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMy() => $_has(3);
  @$pb.TagNumber(4)
  void clearMy() => clearField(4);
  @$pb.TagNumber(4)
  KnightGroupRankItem ensureMy() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get hasMore => $_getBF(4);
  @$pb.TagNumber(5)
  set hasMore($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHasMore() => $_has(4);
  @$pb.TagNumber(5)
  void clearHasMore() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get total => $_getIZ(5);
  @$pb.TagNumber(6)
  set total($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTotal() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotal() => clearField(6);
}

class KnightGroupRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KnightGroupRankItem',
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sortIndex',
        $pb.PbFieldType.OU3,
        protoName: 'sortIndex')
    ..a<$fixnum.Int64>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sortScore',
        $pb.PbFieldType.OU6,
        protoName: 'sortScore',
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'memberNum',
        $pb.PbFieldType.OU3,
        protoName: 'memberNum')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentRid',
        $pb.PbFieldType.OU3,
        protoName: 'currentRid')
    ..hasRequiredFields = false;

  KnightGroupRankItem._() : super();
  factory KnightGroupRankItem({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
    $core.int? sortIndex,
    $fixnum.Int64? sortScore,
    $core.int? memberNum,
    $core.int? currentRid,
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
    if (sortIndex != null) {
      _result.sortIndex = sortIndex;
    }
    if (sortScore != null) {
      _result.sortScore = sortScore;
    }
    if (memberNum != null) {
      _result.memberNum = memberNum;
    }
    if (currentRid != null) {
      _result.currentRid = currentRid;
    }
    return _result;
  }
  factory KnightGroupRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KnightGroupRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KnightGroupRankItem clone() => KnightGroupRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KnightGroupRankItem copyWith(void Function(KnightGroupRankItem) updates) =>
      super.copyWith((message) => updates(message as KnightGroupRankItem))
          as KnightGroupRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KnightGroupRankItem create() => KnightGroupRankItem._();
  KnightGroupRankItem createEmptyInstance() => create();
  static $pb.PbList<KnightGroupRankItem> createRepeated() =>
      $pb.PbList<KnightGroupRankItem>();
  @$core.pragma('dart2js:noInline')
  static KnightGroupRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KnightGroupRankItem>(create);
  static KnightGroupRankItem? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.int get sortIndex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sortIndex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSortIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSortIndex() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get sortScore => $_getI64(4);
  @$pb.TagNumber(5)
  set sortScore($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSortScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearSortScore() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get memberNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set memberNum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMemberNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearMemberNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get currentRid => $_getIZ(6);
  @$pb.TagNumber(7)
  set currentRid($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCurrentRid() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurrentRid() => clearField(7);
}
