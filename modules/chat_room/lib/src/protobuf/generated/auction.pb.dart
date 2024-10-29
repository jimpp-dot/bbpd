///
//  Generated code. Do not modify.
//  source: auction.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'auction.pbenum.dart';

export 'auction.pbenum.dart';

class AuctionCommodity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionCommodity',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityId',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodityName')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numDays',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.O3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftPrice',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  AuctionCommodity._() : super();
  factory AuctionCommodity({
    $core.int? commodityId,
    $core.String? commodityName,
    $core.int? numDays,
    $core.int? giftId,
    $core.String? giftName,
    $core.int? giftPrice,
  }) {
    final _result = create();
    if (commodityId != null) {
      _result.commodityId = commodityId;
    }
    if (commodityName != null) {
      _result.commodityName = commodityName;
    }
    if (numDays != null) {
      _result.numDays = numDays;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (giftPrice != null) {
      _result.giftPrice = giftPrice;
    }
    return _result;
  }
  factory AuctionCommodity.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionCommodity.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionCommodity clone() => AuctionCommodity()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionCommodity copyWith(void Function(AuctionCommodity) updates) =>
      super.copyWith((message) => updates(message as AuctionCommodity))
          as AuctionCommodity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionCommodity create() => AuctionCommodity._();
  AuctionCommodity createEmptyInstance() => create();
  static $pb.PbList<AuctionCommodity> createRepeated() =>
      $pb.PbList<AuctionCommodity>();
  @$core.pragma('dart2js:noInline')
  static AuctionCommodity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionCommodity>(create);
  static AuctionCommodity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get commodityId => $_getIZ(0);
  @$pb.TagNumber(1)
  set commodityId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCommodityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommodityId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get commodityName => $_getSZ(1);
  @$pb.TagNumber(2)
  set commodityName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCommodityName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommodityName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get numDays => $_getIZ(2);
  @$pb.TagNumber(3)
  set numDays($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNumDays() => $_has(2);
  @$pb.TagNumber(3)
  void clearNumDays() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get giftId => $_getIZ(3);
  @$pb.TagNumber(4)
  set giftId($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftId() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get giftName => $_getSZ(4);
  @$pb.TagNumber(5)
  set giftName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftName() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftName() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get giftPrice => $_getIZ(5);
  @$pb.TagNumber(6)
  set giftPrice($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGiftPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftPrice() => clearField(6);
}

class AuctionGiftItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionGiftItem',
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
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  AuctionGiftItem._() : super();
  factory AuctionGiftItem({
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
  factory AuctionGiftItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionGiftItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionGiftItem clone() => AuctionGiftItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionGiftItem copyWith(void Function(AuctionGiftItem) updates) =>
      super.copyWith((message) => updates(message as AuctionGiftItem))
          as AuctionGiftItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionGiftItem create() => AuctionGiftItem._();
  AuctionGiftItem createEmptyInstance() => create();
  static $pb.PbList<AuctionGiftItem> createRepeated() =>
      $pb.PbList<AuctionGiftItem>();
  @$core.pragma('dart2js:noInline')
  static AuctionGiftItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionGiftItem>(create);
  static AuctionGiftItem? _defaultInstance;

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
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);
}

class AuctionUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionUser',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.O3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wishReceived',
        $pb.PbFieldType.O3,
        protoName: 'wishReceived')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wishSent',
        $pb.PbFieldType.O3,
        protoName: 'wishSent')
    ..hasRequiredFields = false;

  AuctionUser._() : super();
  factory AuctionUser({
    $core.int? uid,
    $core.int? sex,
    $core.String? name,
    $core.String? icon,
    $core.int? wishReceived,
    $core.int? wishSent,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (wishReceived != null) {
      _result.wishReceived = wishReceived;
    }
    if (wishSent != null) {
      _result.wishSent = wishSent;
    }
    return _result;
  }
  factory AuctionUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionUser clone() => AuctionUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionUser copyWith(void Function(AuctionUser) updates) =>
      super.copyWith((message) => updates(message as AuctionUser))
          as AuctionUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionUser create() => AuctionUser._();
  AuctionUser createEmptyInstance() => create();
  static $pb.PbList<AuctionUser> createRepeated() => $pb.PbList<AuctionUser>();
  @$core.pragma('dart2js:noInline')
  static AuctionUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionUser>(create);
  static AuctionUser? _defaultInstance;

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
  $core.int get sex => $_getIZ(1);
  @$pb.TagNumber(2)
  set sex($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSex() => $_has(1);
  @$pb.TagNumber(2)
  void clearSex() => clearField(2);

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
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get wishReceived => $_getIZ(4);
  @$pb.TagNumber(5)
  set wishReceived($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasWishReceived() => $_has(4);
  @$pb.TagNumber(5)
  void clearWishReceived() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get wishSent => $_getIZ(5);
  @$pb.TagNumber(6)
  set wishSent($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWishSent() => $_has(5);
  @$pb.TagNumber(6)
  void clearWishSent() => clearField(6);
}

class AuctionRelationTotalProgressItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionRelationTotalProgressItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyStatus',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.O3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendName')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyName')
    ..aInt64(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price')
    ..hasRequiredFields = false;

  AuctionRelationTotalProgressItem._() : super();
  factory AuctionRelationTotalProgressItem({
    $core.int? value,
    $core.String? name,
    $core.int? diyStatus,
    $core.int? level,
    $core.String? title,
    $core.String? defendName,
    $core.String? diyName,
    $fixnum.Int64? price,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    if (name != null) {
      _result.name = name;
    }
    if (diyStatus != null) {
      _result.diyStatus = diyStatus;
    }
    if (level != null) {
      _result.level = level;
    }
    if (title != null) {
      _result.title = title;
    }
    if (defendName != null) {
      _result.defendName = defendName;
    }
    if (diyName != null) {
      _result.diyName = diyName;
    }
    if (price != null) {
      _result.price = price;
    }
    return _result;
  }
  factory AuctionRelationTotalProgressItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionRelationTotalProgressItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionRelationTotalProgressItem clone() =>
      AuctionRelationTotalProgressItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionRelationTotalProgressItem copyWith(
          void Function(AuctionRelationTotalProgressItem) updates) =>
      super.copyWith(
              (message) => updates(message as AuctionRelationTotalProgressItem))
          as AuctionRelationTotalProgressItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionRelationTotalProgressItem create() =>
      AuctionRelationTotalProgressItem._();
  AuctionRelationTotalProgressItem createEmptyInstance() => create();
  static $pb.PbList<AuctionRelationTotalProgressItem> createRepeated() =>
      $pb.PbList<AuctionRelationTotalProgressItem>();
  @$core.pragma('dart2js:noInline')
  static AuctionRelationTotalProgressItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionRelationTotalProgressItem>(
          create);
  static AuctionRelationTotalProgressItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

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
  $core.int get diyStatus => $_getIZ(2);
  @$pb.TagNumber(3)
  set diyStatus($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDiyStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearDiyStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get level => $_getIZ(3);
  @$pb.TagNumber(4)
  set level($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

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
  $core.String get defendName => $_getSZ(5);
  @$pb.TagNumber(6)
  set defendName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDefendName() => $_has(5);
  @$pb.TagNumber(6)
  void clearDefendName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get diyName => $_getSZ(6);
  @$pb.TagNumber(7)
  set diyName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDiyName() => $_has(6);
  @$pb.TagNumber(7)
  void clearDiyName() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get price => $_getI64(7);
  @$pb.TagNumber(8)
  set price($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearPrice() => clearField(8);
}

class AuctionRelationTotalProgress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionRelationTotalProgress',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<AuctionRelationTotalProgressItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: AuctionRelationTotalProgressItem.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  AuctionRelationTotalProgress._() : super();
  factory AuctionRelationTotalProgress({
    $core.Iterable<AuctionRelationTotalProgressItem>? list,
    $core.int? current,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (current != null) {
      _result.current = current;
    }
    return _result;
  }
  factory AuctionRelationTotalProgress.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionRelationTotalProgress.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionRelationTotalProgress clone() =>
      AuctionRelationTotalProgress()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionRelationTotalProgress copyWith(
          void Function(AuctionRelationTotalProgress) updates) =>
      super.copyWith(
              (message) => updates(message as AuctionRelationTotalProgress))
          as AuctionRelationTotalProgress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionRelationTotalProgress create() =>
      AuctionRelationTotalProgress._();
  AuctionRelationTotalProgress createEmptyInstance() => create();
  static $pb.PbList<AuctionRelationTotalProgress> createRepeated() =>
      $pb.PbList<AuctionRelationTotalProgress>();
  @$core.pragma('dart2js:noInline')
  static AuctionRelationTotalProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionRelationTotalProgress>(create);
  static AuctionRelationTotalProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AuctionRelationTotalProgressItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get current => $_getIZ(1);
  @$pb.TagNumber(2)
  set current($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCurrent() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrent() => clearField(2);
}

class AuctionRelationCurrentProgressItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionRelationCurrentProgressItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.O3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftIcon')
    ..hasRequiredFields = false;

  AuctionRelationCurrentProgressItem._() : super();
  factory AuctionRelationCurrentProgressItem({
    $core.int? value,
    $core.int? giftId,
    $core.String? giftName,
    $core.String? giftIcon,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (giftIcon != null) {
      _result.giftIcon = giftIcon;
    }
    return _result;
  }
  factory AuctionRelationCurrentProgressItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionRelationCurrentProgressItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionRelationCurrentProgressItem clone() =>
      AuctionRelationCurrentProgressItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionRelationCurrentProgressItem copyWith(
          void Function(AuctionRelationCurrentProgressItem) updates) =>
      super.copyWith((message) =>
              updates(message as AuctionRelationCurrentProgressItem))
          as AuctionRelationCurrentProgressItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionRelationCurrentProgressItem create() =>
      AuctionRelationCurrentProgressItem._();
  AuctionRelationCurrentProgressItem createEmptyInstance() => create();
  static $pb.PbList<AuctionRelationCurrentProgressItem> createRepeated() =>
      $pb.PbList<AuctionRelationCurrentProgressItem>();
  @$core.pragma('dart2js:noInline')
  static AuctionRelationCurrentProgressItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionRelationCurrentProgressItem>(
          create);
  static AuctionRelationCurrentProgressItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get giftId => $_getIZ(1);
  @$pb.TagNumber(2)
  set giftId($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftId() => clearField(2);

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
  $core.String get giftIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set giftIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftIcon() => clearField(4);
}

class AuctionRelationCurrentProgress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionRelationCurrentProgress',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<AuctionRelationCurrentProgressItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: AuctionRelationCurrentProgressItem.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  AuctionRelationCurrentProgress._() : super();
  factory AuctionRelationCurrentProgress({
    $core.Iterable<AuctionRelationCurrentProgressItem>? list,
    $core.int? current,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (current != null) {
      _result.current = current;
    }
    return _result;
  }
  factory AuctionRelationCurrentProgress.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionRelationCurrentProgress.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionRelationCurrentProgress clone() =>
      AuctionRelationCurrentProgress()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionRelationCurrentProgress copyWith(
          void Function(AuctionRelationCurrentProgress) updates) =>
      super.copyWith(
              (message) => updates(message as AuctionRelationCurrentProgress))
          as AuctionRelationCurrentProgress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionRelationCurrentProgress create() =>
      AuctionRelationCurrentProgress._();
  AuctionRelationCurrentProgress createEmptyInstance() => create();
  static $pb.PbList<AuctionRelationCurrentProgress> createRepeated() =>
      $pb.PbList<AuctionRelationCurrentProgress>();
  @$core.pragma('dart2js:noInline')
  static AuctionRelationCurrentProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionRelationCurrentProgress>(create);
  static AuctionRelationCurrentProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AuctionRelationCurrentProgressItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get current => $_getIZ(1);
  @$pb.TagNumber(2)
  set current($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCurrent() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrent() => clearField(2);
}

class AuctionCommodityMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionCommodityMessage',
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
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodity')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.O3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'days')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.O3,
        protoName: 'giftId')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftPrice',
        $pb.PbFieldType.O3,
        protoName: 'giftPrice')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName',
        protoName: 'giftName')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checked',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'editable',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  AuctionCommodityMessage._() : super();
  factory AuctionCommodityMessage({
    $core.int? cid,
    $core.String? commodity,
    $core.int? duration,
    $core.String? days,
    $core.int? giftId,
    $core.int? giftPrice,
    $core.String? giftName,
    $core.int? checked,
    $core.int? editable,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (commodity != null) {
      _result.commodity = commodity;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (days != null) {
      _result.days = days;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftPrice != null) {
      _result.giftPrice = giftPrice;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (checked != null) {
      _result.checked = checked;
    }
    if (editable != null) {
      _result.editable = editable;
    }
    return _result;
  }
  factory AuctionCommodityMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionCommodityMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionCommodityMessage clone() =>
      AuctionCommodityMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionCommodityMessage copyWith(
          void Function(AuctionCommodityMessage) updates) =>
      super.copyWith((message) => updates(message as AuctionCommodityMessage))
          as AuctionCommodityMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionCommodityMessage create() => AuctionCommodityMessage._();
  AuctionCommodityMessage createEmptyInstance() => create();
  static $pb.PbList<AuctionCommodityMessage> createRepeated() =>
      $pb.PbList<AuctionCommodityMessage>();
  @$core.pragma('dart2js:noInline')
  static AuctionCommodityMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionCommodityMessage>(create);
  static AuctionCommodityMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get commodity => $_getSZ(1);
  @$pb.TagNumber(2)
  set commodity($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCommodity() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommodity() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get duration => $_getIZ(2);
  @$pb.TagNumber(3)
  set duration($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get days => $_getSZ(3);
  @$pb.TagNumber(4)
  set days($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDays() => $_has(3);
  @$pb.TagNumber(4)
  void clearDays() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get giftId => $_getIZ(4);
  @$pb.TagNumber(5)
  set giftId($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftId() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get giftPrice => $_getIZ(5);
  @$pb.TagNumber(6)
  set giftPrice($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGiftPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftPrice() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get giftName => $_getSZ(6);
  @$pb.TagNumber(7)
  set giftName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGiftName() => $_has(6);
  @$pb.TagNumber(7)
  void clearGiftName() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get checked => $_getIZ(7);
  @$pb.TagNumber(8)
  set checked($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasChecked() => $_has(7);
  @$pb.TagNumber(8)
  void clearChecked() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get editable => $_getIZ(8);
  @$pb.TagNumber(9)
  set editable($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasEditable() => $_has(8);
  @$pb.TagNumber(9)
  void clearEditable() => clearField(9);
}

class AuctionConfigMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionConfigMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vvc',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endline',
        $pb.PbFieldType.O3)
    ..e<AuctionStatus>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OE,
        defaultOrMaker: AuctionStatus.UNKNOWN,
        valueOf: AuctionStatus.valueOf,
        enumValues: AuctionStatus.values)
    ..aOM<AuctionCommodityMessage>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodity',
        subBuilder: AuctionCommodityMessage.create)
    ..aOM<AuctionUser>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'auctionUser',
        protoName: 'auctionUser',
        subBuilder: AuctionUser.create)
    ..aOM<AuctionUser>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendUser',
        protoName: 'defendUser',
        subBuilder: AuctionUser.create)
    ..pc<AuctionUser>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.PM,
        subBuilder: AuctionUser.create)
    ..aOM<AuctionRelationTotalProgress>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalProgress',
        protoName: 'totalProgress',
        subBuilder: AuctionRelationTotalProgress.create)
    ..aOM<AuctionRelationCurrentProgress>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentProgress',
        protoName: 'currentProgress',
        subBuilder: AuctionRelationCurrentProgress.create)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mode',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AuctionConfigMessage._() : super();
  factory AuctionConfigMessage({
    $core.int? rid,
    $core.int? vvc,
    $core.int? endline,
    AuctionStatus? status,
    AuctionCommodityMessage? commodity,
    AuctionUser? auctionUser,
    AuctionUser? defendUser,
    $core.Iterable<AuctionUser>? rank,
    AuctionRelationTotalProgress? totalProgress,
    AuctionRelationCurrentProgress? currentProgress,
    $core.int? mode,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (vvc != null) {
      _result.vvc = vvc;
    }
    if (endline != null) {
      _result.endline = endline;
    }
    if (status != null) {
      _result.status = status;
    }
    if (commodity != null) {
      _result.commodity = commodity;
    }
    if (auctionUser != null) {
      _result.auctionUser = auctionUser;
    }
    if (defendUser != null) {
      _result.defendUser = defendUser;
    }
    if (rank != null) {
      _result.rank.addAll(rank);
    }
    if (totalProgress != null) {
      _result.totalProgress = totalProgress;
    }
    if (currentProgress != null) {
      _result.currentProgress = currentProgress;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    return _result;
  }
  factory AuctionConfigMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionConfigMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionConfigMessage clone() =>
      AuctionConfigMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionConfigMessage copyWith(void Function(AuctionConfigMessage) updates) =>
      super.copyWith((message) => updates(message as AuctionConfigMessage))
          as AuctionConfigMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionConfigMessage create() => AuctionConfigMessage._();
  AuctionConfigMessage createEmptyInstance() => create();
  static $pb.PbList<AuctionConfigMessage> createRepeated() =>
      $pb.PbList<AuctionConfigMessage>();
  @$core.pragma('dart2js:noInline')
  static AuctionConfigMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionConfigMessage>(create);
  static AuctionConfigMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get vvc => $_getIZ(1);
  @$pb.TagNumber(2)
  set vvc($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVvc() => $_has(1);
  @$pb.TagNumber(2)
  void clearVvc() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get endline => $_getIZ(2);
  @$pb.TagNumber(3)
  set endline($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEndline() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndline() => clearField(3);

  @$pb.TagNumber(4)
  AuctionStatus get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(AuctionStatus v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  AuctionCommodityMessage get commodity => $_getN(4);
  @$pb.TagNumber(5)
  set commodity(AuctionCommodityMessage v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCommodity() => $_has(4);
  @$pb.TagNumber(5)
  void clearCommodity() => clearField(5);
  @$pb.TagNumber(5)
  AuctionCommodityMessage ensureCommodity() => $_ensure(4);

  @$pb.TagNumber(6)
  AuctionUser get auctionUser => $_getN(5);
  @$pb.TagNumber(6)
  set auctionUser(AuctionUser v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAuctionUser() => $_has(5);
  @$pb.TagNumber(6)
  void clearAuctionUser() => clearField(6);
  @$pb.TagNumber(6)
  AuctionUser ensureAuctionUser() => $_ensure(5);

  @$pb.TagNumber(7)
  AuctionUser get defendUser => $_getN(6);
  @$pb.TagNumber(7)
  set defendUser(AuctionUser v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDefendUser() => $_has(6);
  @$pb.TagNumber(7)
  void clearDefendUser() => clearField(7);
  @$pb.TagNumber(7)
  AuctionUser ensureDefendUser() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.List<AuctionUser> get rank => $_getList(7);

  @$pb.TagNumber(9)
  AuctionRelationTotalProgress get totalProgress => $_getN(8);
  @$pb.TagNumber(9)
  set totalProgress(AuctionRelationTotalProgress v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTotalProgress() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalProgress() => clearField(9);
  @$pb.TagNumber(9)
  AuctionRelationTotalProgress ensureTotalProgress() => $_ensure(8);

  @$pb.TagNumber(10)
  AuctionRelationCurrentProgress get currentProgress => $_getN(9);
  @$pb.TagNumber(10)
  set currentProgress(AuctionRelationCurrentProgress v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCurrentProgress() => $_has(9);
  @$pb.TagNumber(10)
  void clearCurrentProgress() => clearField(10);
  @$pb.TagNumber(10)
  AuctionRelationCurrentProgress ensureCurrentProgress() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.int get mode => $_getIZ(10);
  @$pb.TagNumber(11)
  set mode($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasMode() => $_has(10);
  @$pb.TagNumber(11)
  void clearMode() => clearField(11);
}

class AuctionCommoditySettingsItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionCommoditySettingsItem',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isSelfDefine',
        protoName: 'isSelfDefine')
    ..m<$core.int, $fixnum.Int64>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partPrice',
        protoName: 'partPrice',
        entryClassName: 'AuctionCommoditySettingsItem.PartPriceEntry',
        keyFieldType: $pb.PbFieldType.OU3,
        valueFieldType: $pb.PbFieldType.OU6,
        packageName: const $pb.PackageName('pb'))
    ..hasRequiredFields = false;

  AuctionCommoditySettingsItem._() : super();
  factory AuctionCommoditySettingsItem({
    $core.int? id,
    $core.String? name,
    $core.String? tag,
    $core.bool? isSelfDefine,
    $core.Map<$core.int, $fixnum.Int64>? partPrice,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (isSelfDefine != null) {
      _result.isSelfDefine = isSelfDefine;
    }
    if (partPrice != null) {
      _result.partPrice.addAll(partPrice);
    }
    return _result;
  }
  factory AuctionCommoditySettingsItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionCommoditySettingsItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionCommoditySettingsItem clone() =>
      AuctionCommoditySettingsItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionCommoditySettingsItem copyWith(
          void Function(AuctionCommoditySettingsItem) updates) =>
      super.copyWith(
              (message) => updates(message as AuctionCommoditySettingsItem))
          as AuctionCommoditySettingsItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionCommoditySettingsItem create() =>
      AuctionCommoditySettingsItem._();
  AuctionCommoditySettingsItem createEmptyInstance() => create();
  static $pb.PbList<AuctionCommoditySettingsItem> createRepeated() =>
      $pb.PbList<AuctionCommoditySettingsItem>();
  @$core.pragma('dart2js:noInline')
  static AuctionCommoditySettingsItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionCommoditySettingsItem>(create);
  static AuctionCommoditySettingsItem? _defaultInstance;

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
  $core.String get tag => $_getSZ(2);
  @$pb.TagNumber(3)
  set tag($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTag() => $_has(2);
  @$pb.TagNumber(3)
  void clearTag() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isSelfDefine => $_getBF(3);
  @$pb.TagNumber(4)
  set isSelfDefine($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsSelfDefine() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsSelfDefine() => clearField(4);

  @$pb.TagNumber(5)
  $core.Map<$core.int, $fixnum.Int64> get partPrice => $_getMap(4);
}

class AuctionTimeSettingsItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionTimeSettingsItem',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  AuctionTimeSettingsItem._() : super();
  factory AuctionTimeSettingsItem({
    $core.int? id,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory AuctionTimeSettingsItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionTimeSettingsItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionTimeSettingsItem clone() =>
      AuctionTimeSettingsItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionTimeSettingsItem copyWith(
          void Function(AuctionTimeSettingsItem) updates) =>
      super.copyWith((message) => updates(message as AuctionTimeSettingsItem))
          as AuctionTimeSettingsItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionTimeSettingsItem create() => AuctionTimeSettingsItem._();
  AuctionTimeSettingsItem createEmptyInstance() => create();
  static $pb.PbList<AuctionTimeSettingsItem> createRepeated() =>
      $pb.PbList<AuctionTimeSettingsItem>();
  @$core.pragma('dart2js:noInline')
  static AuctionTimeSettingsItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionTimeSettingsItem>(create);
  static AuctionTimeSettingsItem? _defaultInstance;

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

class AuctionSettingData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionSettingData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<AuctionCommodity>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current',
        subBuilder: AuctionCommodity.create)
    ..pc<AuctionCommoditySettingsItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'listCommodity',
        $pb.PbFieldType.PM,
        protoName: 'listCommodity',
        subBuilder: AuctionCommoditySettingsItem.create)
    ..pc<AuctionTimeSettingsItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'listTime',
        $pb.PbFieldType.PM,
        protoName: 'listTime',
        subBuilder: AuctionTimeSettingsItem.create)
    ..pc<AuctionGiftItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'listGift',
        $pb.PbFieldType.PM,
        protoName: 'listGift',
        subBuilder: AuctionGiftItem.create)
    ..pc<AuctionCommoditySettingsItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'listCommoditySelfDefine',
        $pb.PbFieldType.PM,
        protoName: 'listCommoditySelfDefine',
        subBuilder: AuctionCommoditySettingsItem.create)
    ..hasRequiredFields = false;

  AuctionSettingData._() : super();
  factory AuctionSettingData({
    AuctionCommodity? current,
    $core.Iterable<AuctionCommoditySettingsItem>? listCommodity,
    $core.Iterable<AuctionTimeSettingsItem>? listTime,
    $core.Iterable<AuctionGiftItem>? listGift,
    $core.Iterable<AuctionCommoditySettingsItem>? listCommoditySelfDefine,
  }) {
    final _result = create();
    if (current != null) {
      _result.current = current;
    }
    if (listCommodity != null) {
      _result.listCommodity.addAll(listCommodity);
    }
    if (listTime != null) {
      _result.listTime.addAll(listTime);
    }
    if (listGift != null) {
      _result.listGift.addAll(listGift);
    }
    if (listCommoditySelfDefine != null) {
      _result.listCommoditySelfDefine.addAll(listCommoditySelfDefine);
    }
    return _result;
  }
  factory AuctionSettingData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionSettingData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionSettingData clone() => AuctionSettingData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionSettingData copyWith(void Function(AuctionSettingData) updates) =>
      super.copyWith((message) => updates(message as AuctionSettingData))
          as AuctionSettingData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionSettingData create() => AuctionSettingData._();
  AuctionSettingData createEmptyInstance() => create();
  static $pb.PbList<AuctionSettingData> createRepeated() =>
      $pb.PbList<AuctionSettingData>();
  @$core.pragma('dart2js:noInline')
  static AuctionSettingData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionSettingData>(create);
  static AuctionSettingData? _defaultInstance;

  @$pb.TagNumber(1)
  AuctionCommodity get current => $_getN(0);
  @$pb.TagNumber(1)
  set current(AuctionCommodity v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrent() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrent() => clearField(1);
  @$pb.TagNumber(1)
  AuctionCommodity ensureCurrent() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<AuctionCommoditySettingsItem> get listCommodity => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<AuctionTimeSettingsItem> get listTime => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<AuctionGiftItem> get listGift => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<AuctionCommoditySettingsItem> get listCommoditySelfDefine =>
      $_getList(4);
}

class RespAuctionSetting extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespAuctionSetting',
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
            : 'message')
    ..aOM<AuctionSettingData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AuctionSettingData.create)
    ..hasRequiredFields = false;

  RespAuctionSetting._() : super();
  factory RespAuctionSetting({
    $core.bool? success,
    $core.String? message,
    AuctionSettingData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory RespAuctionSetting.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespAuctionSetting.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespAuctionSetting clone() => RespAuctionSetting()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespAuctionSetting copyWith(void Function(RespAuctionSetting) updates) =>
      super.copyWith((message) => updates(message as RespAuctionSetting))
          as RespAuctionSetting; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespAuctionSetting create() => RespAuctionSetting._();
  RespAuctionSetting createEmptyInstance() => create();
  static $pb.PbList<RespAuctionSetting> createRepeated() =>
      $pb.PbList<RespAuctionSetting>();
  @$core.pragma('dart2js:noInline')
  static RespAuctionSetting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespAuctionSetting>(create);
  static RespAuctionSetting? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  AuctionSettingData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AuctionSettingData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AuctionSettingData ensureData() => $_ensure(2);
}

class RespAuctionSave extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespAuctionSave',
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
            : 'message')
    ..aOM<AuctionCommodity>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AuctionCommodity.create)
    ..hasRequiredFields = false;

  RespAuctionSave._() : super();
  factory RespAuctionSave({
    $core.bool? success,
    $core.String? message,
    AuctionCommodity? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory RespAuctionSave.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespAuctionSave.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespAuctionSave clone() => RespAuctionSave()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespAuctionSave copyWith(void Function(RespAuctionSave) updates) =>
      super.copyWith((message) => updates(message as RespAuctionSave))
          as RespAuctionSave; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespAuctionSave create() => RespAuctionSave._();
  RespAuctionSave createEmptyInstance() => create();
  static $pb.PbList<RespAuctionSave> createRepeated() =>
      $pb.PbList<RespAuctionSave>();
  @$core.pragma('dart2js:noInline')
  static RespAuctionSave getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespAuctionSave>(create);
  static RespAuctionSave? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  AuctionCommodity get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AuctionCommodity v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AuctionCommodity ensureData() => $_ensure(2);
}

class RespAuctionAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespAuctionAction',
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
            : 'message')
    ..hasRequiredFields = false;

  RespAuctionAction._() : super();
  factory RespAuctionAction({
    $core.bool? success,
    $core.String? message,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory RespAuctionAction.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespAuctionAction.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespAuctionAction clone() => RespAuctionAction()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespAuctionAction copyWith(void Function(RespAuctionAction) updates) =>
      super.copyWith((message) => updates(message as RespAuctionAction))
          as RespAuctionAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespAuctionAction create() => RespAuctionAction._();
  RespAuctionAction createEmptyInstance() => create();
  static $pb.PbList<RespAuctionAction> createRepeated() =>
      $pb.PbList<RespAuctionAction>();
  @$core.pragma('dart2js:noInline')
  static RespAuctionAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespAuctionAction>(create);
  static RespAuctionAction? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class RespAuctionConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespAuctionConfig',
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
            : 'message')
    ..aOM<AuctionConfigMessage>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AuctionConfigMessage.create)
    ..hasRequiredFields = false;

  RespAuctionConfig._() : super();
  factory RespAuctionConfig({
    $core.bool? success,
    $core.String? message,
    AuctionConfigMessage? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory RespAuctionConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespAuctionConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespAuctionConfig clone() => RespAuctionConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespAuctionConfig copyWith(void Function(RespAuctionConfig) updates) =>
      super.copyWith((message) => updates(message as RespAuctionConfig))
          as RespAuctionConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespAuctionConfig create() => RespAuctionConfig._();
  RespAuctionConfig createEmptyInstance() => create();
  static $pb.PbList<RespAuctionConfig> createRepeated() =>
      $pb.PbList<RespAuctionConfig>();
  @$core.pragma('dart2js:noInline')
  static RespAuctionConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespAuctionConfig>(create);
  static RespAuctionConfig? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  AuctionConfigMessage get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AuctionConfigMessage v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AuctionConfigMessage ensureData() => $_ensure(2);
}

class AuctionRankUserProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionRankUserProfile',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.O3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularity',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AuctionRankUserProfile._() : super();
  factory AuctionRankUserProfile({
    $core.int? uid,
    $core.int? sex,
    $core.String? name,
    $core.String? icon,
    $core.int? popularity,
    $core.int? age,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (popularity != null) {
      _result.popularity = popularity;
    }
    if (age != null) {
      _result.age = age;
    }
    return _result;
  }
  factory AuctionRankUserProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionRankUserProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionRankUserProfile clone() =>
      AuctionRankUserProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionRankUserProfile copyWith(
          void Function(AuctionRankUserProfile) updates) =>
      super.copyWith((message) => updates(message as AuctionRankUserProfile))
          as AuctionRankUserProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionRankUserProfile create() => AuctionRankUserProfile._();
  AuctionRankUserProfile createEmptyInstance() => create();
  static $pb.PbList<AuctionRankUserProfile> createRepeated() =>
      $pb.PbList<AuctionRankUserProfile>();
  @$core.pragma('dart2js:noInline')
  static AuctionRankUserProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionRankUserProfile>(create);
  static AuctionRankUserProfile? _defaultInstance;

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
  $core.int get sex => $_getIZ(1);
  @$pb.TagNumber(2)
  set sex($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSex() => $_has(1);
  @$pb.TagNumber(2)
  void clearSex() => clearField(2);

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
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get popularity => $_getIZ(4);
  @$pb.TagNumber(5)
  set popularity($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPopularity() => $_has(4);
  @$pb.TagNumber(5)
  void clearPopularity() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get age => $_getIZ(5);
  @$pb.TagNumber(6)
  set age($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAge() => $_has(5);
  @$pb.TagNumber(6)
  void clearAge() => clearField(6);
}

class RespAuctionRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespAuctionRankItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<AuctionRankUserProfile>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'auctionUser',
        protoName: 'auctionUser',
        subBuilder: AuctionRankUserProfile.create)
    ..aOM<AuctionRankUserProfile>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendUser',
        protoName: 'defendUser',
        subBuilder: AuctionRankUserProfile.create)
    ..e<AuctionRelationLevel>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OE,
        defaultOrMaker: AuctionRelationLevel.NORMAL,
        valueOf: AuctionRelationLevel.valueOf,
        enumValues: AuctionRelationLevel.values)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relation')
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
            : 'endLine',
        $pb.PbFieldType.OU3,
        protoName: 'endLine')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateLine',
        $pb.PbFieldType.OU3,
        protoName: 'dateLine')
    ..hasRequiredFields = false;

  RespAuctionRankItem._() : super();
  factory RespAuctionRankItem({
    AuctionRankUserProfile? auctionUser,
    AuctionRankUserProfile? defendUser,
    AuctionRelationLevel? level,
    $core.String? relation,
    $core.int? score,
    $core.int? endLine,
    $core.int? dateLine,
  }) {
    final _result = create();
    if (auctionUser != null) {
      _result.auctionUser = auctionUser;
    }
    if (defendUser != null) {
      _result.defendUser = defendUser;
    }
    if (level != null) {
      _result.level = level;
    }
    if (relation != null) {
      _result.relation = relation;
    }
    if (score != null) {
      _result.score = score;
    }
    if (endLine != null) {
      _result.endLine = endLine;
    }
    if (dateLine != null) {
      _result.dateLine = dateLine;
    }
    return _result;
  }
  factory RespAuctionRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespAuctionRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespAuctionRankItem clone() => RespAuctionRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespAuctionRankItem copyWith(void Function(RespAuctionRankItem) updates) =>
      super.copyWith((message) => updates(message as RespAuctionRankItem))
          as RespAuctionRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespAuctionRankItem create() => RespAuctionRankItem._();
  RespAuctionRankItem createEmptyInstance() => create();
  static $pb.PbList<RespAuctionRankItem> createRepeated() =>
      $pb.PbList<RespAuctionRankItem>();
  @$core.pragma('dart2js:noInline')
  static RespAuctionRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespAuctionRankItem>(create);
  static RespAuctionRankItem? _defaultInstance;

  @$pb.TagNumber(1)
  AuctionRankUserProfile get auctionUser => $_getN(0);
  @$pb.TagNumber(1)
  set auctionUser(AuctionRankUserProfile v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAuctionUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuctionUser() => clearField(1);
  @$pb.TagNumber(1)
  AuctionRankUserProfile ensureAuctionUser() => $_ensure(0);

  @$pb.TagNumber(2)
  AuctionRankUserProfile get defendUser => $_getN(1);
  @$pb.TagNumber(2)
  set defendUser(AuctionRankUserProfile v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDefendUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearDefendUser() => clearField(2);
  @$pb.TagNumber(2)
  AuctionRankUserProfile ensureDefendUser() => $_ensure(1);

  @$pb.TagNumber(3)
  AuctionRelationLevel get level => $_getN(2);
  @$pb.TagNumber(3)
  set level(AuctionRelationLevel v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get relation => $_getSZ(3);
  @$pb.TagNumber(4)
  set relation($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRelation() => $_has(3);
  @$pb.TagNumber(4)
  void clearRelation() => clearField(4);

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
  $core.int get endLine => $_getIZ(5);
  @$pb.TagNumber(6)
  set endLine($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasEndLine() => $_has(5);
  @$pb.TagNumber(6)
  void clearEndLine() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get dateLine => $_getIZ(6);
  @$pb.TagNumber(7)
  set dateLine($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDateLine() => $_has(6);
  @$pb.TagNumber(7)
  void clearDateLine() => clearField(7);
}

class RespAuctionRankList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespAuctionRankList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<RespAuctionRankItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RespAuctionRankItem.create)
    ..hasRequiredFields = false;

  RespAuctionRankList._() : super();
  factory RespAuctionRankList({
    $core.Iterable<RespAuctionRankItem>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory RespAuctionRankList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespAuctionRankList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespAuctionRankList clone() => RespAuctionRankList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespAuctionRankList copyWith(void Function(RespAuctionRankList) updates) =>
      super.copyWith((message) => updates(message as RespAuctionRankList))
          as RespAuctionRankList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespAuctionRankList create() => RespAuctionRankList._();
  RespAuctionRankList createEmptyInstance() => create();
  static $pb.PbList<RespAuctionRankList> createRepeated() =>
      $pb.PbList<RespAuctionRankList>();
  @$core.pragma('dart2js:noInline')
  static RespAuctionRankList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespAuctionRankList>(create);
  static RespAuctionRankList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RespAuctionRankItem> get list => $_getList(0);
}

class RespAuctionRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespAuctionRank',
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
            : 'message')
    ..aOM<RespAuctionRankList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RespAuctionRankList.create)
    ..hasRequiredFields = false;

  RespAuctionRank._() : super();
  factory RespAuctionRank({
    $core.bool? success,
    $core.String? message,
    RespAuctionRankList? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory RespAuctionRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespAuctionRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespAuctionRank clone() => RespAuctionRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespAuctionRank copyWith(void Function(RespAuctionRank) updates) =>
      super.copyWith((message) => updates(message as RespAuctionRank))
          as RespAuctionRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespAuctionRank create() => RespAuctionRank._();
  RespAuctionRank createEmptyInstance() => create();
  static $pb.PbList<RespAuctionRank> createRepeated() =>
      $pb.PbList<RespAuctionRank>();
  @$core.pragma('dart2js:noInline')
  static RespAuctionRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespAuctionRank>(create);
  static RespAuctionRank? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  RespAuctionRankList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RespAuctionRankList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RespAuctionRankList ensureData() => $_ensure(2);
}

class AuctionStageEffectMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionStageEffectMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vvc',
        $pb.PbFieldType.OU3)
    ..e<AuctionStatus>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stage',
        $pb.PbFieldType.OE,
        defaultOrMaker: AuctionStatus.UNKNOWN,
        valueOf: AuctionStatus.valueOf,
        enumValues: AuctionStatus.values)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOM<AuctionConfigMessage>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'config',
        subBuilder: AuctionConfigMessage.create)
    ..hasRequiredFields = false;

  AuctionStageEffectMessage._() : super();
  factory AuctionStageEffectMessage({
    $core.int? rid,
    $core.int? vvc,
    AuctionStatus? stage,
    $core.int? duration,
    $core.String? url,
    AuctionConfigMessage? config,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (vvc != null) {
      _result.vvc = vvc;
    }
    if (stage != null) {
      _result.stage = stage;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (url != null) {
      _result.url = url;
    }
    if (config != null) {
      _result.config = config;
    }
    return _result;
  }
  factory AuctionStageEffectMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionStageEffectMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionStageEffectMessage clone() =>
      AuctionStageEffectMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionStageEffectMessage copyWith(
          void Function(AuctionStageEffectMessage) updates) =>
      super.copyWith((message) => updates(message as AuctionStageEffectMessage))
          as AuctionStageEffectMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionStageEffectMessage create() => AuctionStageEffectMessage._();
  AuctionStageEffectMessage createEmptyInstance() => create();
  static $pb.PbList<AuctionStageEffectMessage> createRepeated() =>
      $pb.PbList<AuctionStageEffectMessage>();
  @$core.pragma('dart2js:noInline')
  static AuctionStageEffectMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionStageEffectMessage>(create);
  static AuctionStageEffectMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get vvc => $_getIZ(1);
  @$pb.TagNumber(2)
  set vvc($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVvc() => $_has(1);
  @$pb.TagNumber(2)
  void clearVvc() => clearField(2);

  @$pb.TagNumber(3)
  AuctionStatus get stage => $_getN(2);
  @$pb.TagNumber(3)
  set stage(AuctionStatus v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStage() => $_has(2);
  @$pb.TagNumber(3)
  void clearStage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get duration => $_getIZ(3);
  @$pb.TagNumber(4)
  set duration($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get url => $_getSZ(4);
  @$pb.TagNumber(5)
  set url($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearUrl() => clearField(5);

  @$pb.TagNumber(6)
  AuctionConfigMessage get config => $_getN(5);
  @$pb.TagNumber(6)
  set config(AuctionConfigMessage v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasConfig() => $_has(5);
  @$pb.TagNumber(6)
  void clearConfig() => clearField(6);
  @$pb.TagNumber(6)
  AuctionConfigMessage ensureConfig() => $_ensure(5);
}

class AuctionOchHitMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionOchHitMessage',
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
            : 'num',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AuctionOchHitMessage._() : super();
  factory AuctionOchHitMessage({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? num,
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
    if (num != null) {
      _result.num = num;
    }
    return _result;
  }
  factory AuctionOchHitMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionOchHitMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionOchHitMessage clone() =>
      AuctionOchHitMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionOchHitMessage copyWith(void Function(AuctionOchHitMessage) updates) =>
      super.copyWith((message) => updates(message as AuctionOchHitMessage))
          as AuctionOchHitMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionOchHitMessage create() => AuctionOchHitMessage._();
  AuctionOchHitMessage createEmptyInstance() => create();
  static $pb.PbList<AuctionOchHitMessage> createRepeated() =>
      $pb.PbList<AuctionOchHitMessage>();
  @$core.pragma('dart2js:noInline')
  static AuctionOchHitMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionOchHitMessage>(create);
  static AuctionOchHitMessage? _defaultInstance;

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
  $core.int get num => $_getIZ(3);
  @$pb.TagNumber(4)
  set num($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearNum() => clearField(4);
}

class AuctionDefendDiyEmitMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionDefendDiyEmitMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vvc',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
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
            : 'icon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diyName',
        protoName: 'diyName')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'originName',
        protoName: 'originName')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendLevel',
        $pb.PbFieldType.O3,
        protoName: 'defendLevel')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendTitle',
        protoName: 'defendTitle')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'targetUid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AuctionDefendDiyEmitMessage._() : super();
  factory AuctionDefendDiyEmitMessage({
    $core.int? rid,
    $core.int? vvc,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? diyName,
    $core.int? version,
    $core.String? originName,
    $core.int? defendLevel,
    $core.String? defendTitle,
    $core.int? targetUid,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (vvc != null) {
      _result.vvc = vvc;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (diyName != null) {
      _result.diyName = diyName;
    }
    if (version != null) {
      _result.version = version;
    }
    if (originName != null) {
      _result.originName = originName;
    }
    if (defendLevel != null) {
      _result.defendLevel = defendLevel;
    }
    if (defendTitle != null) {
      _result.defendTitle = defendTitle;
    }
    if (targetUid != null) {
      _result.targetUid = targetUid;
    }
    return _result;
  }
  factory AuctionDefendDiyEmitMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionDefendDiyEmitMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionDefendDiyEmitMessage clone() =>
      AuctionDefendDiyEmitMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionDefendDiyEmitMessage copyWith(
          void Function(AuctionDefendDiyEmitMessage) updates) =>
      super.copyWith(
              (message) => updates(message as AuctionDefendDiyEmitMessage))
          as AuctionDefendDiyEmitMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionDefendDiyEmitMessage create() =>
      AuctionDefendDiyEmitMessage._();
  AuctionDefendDiyEmitMessage createEmptyInstance() => create();
  static $pb.PbList<AuctionDefendDiyEmitMessage> createRepeated() =>
      $pb.PbList<AuctionDefendDiyEmitMessage>();
  @$core.pragma('dart2js:noInline')
  static AuctionDefendDiyEmitMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionDefendDiyEmitMessage>(create);
  static AuctionDefendDiyEmitMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get vvc => $_getIZ(1);
  @$pb.TagNumber(2)
  set vvc($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVvc() => $_has(1);
  @$pb.TagNumber(2)
  void clearVvc() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get uid => $_getIZ(2);
  @$pb.TagNumber(3)
  set uid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);

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
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get diyName => $_getSZ(5);
  @$pb.TagNumber(6)
  set diyName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDiyName() => $_has(5);
  @$pb.TagNumber(6)
  void clearDiyName() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get version => $_getIZ(6);
  @$pb.TagNumber(7)
  set version($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasVersion() => $_has(6);
  @$pb.TagNumber(7)
  void clearVersion() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get originName => $_getSZ(7);
  @$pb.TagNumber(8)
  set originName($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasOriginName() => $_has(7);
  @$pb.TagNumber(8)
  void clearOriginName() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get defendLevel => $_getIZ(8);
  @$pb.TagNumber(9)
  set defendLevel($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasDefendLevel() => $_has(8);
  @$pb.TagNumber(9)
  void clearDefendLevel() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get defendTitle => $_getSZ(9);
  @$pb.TagNumber(10)
  set defendTitle($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDefendTitle() => $_has(9);
  @$pb.TagNumber(10)
  void clearDefendTitle() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get targetUid => $_getIZ(10);
  @$pb.TagNumber(11)
  set targetUid($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTargetUid() => $_has(10);
  @$pb.TagNumber(11)
  void clearTargetUid() => clearField(11);
}
