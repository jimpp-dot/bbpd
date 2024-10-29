///
//  Generated code. Do not modify.
//  source: vipmic.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'entity_xs_gift.pb.dart' as $0;

class VipMicGiftInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VipMicGiftInfo',
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
            : 'num',
        $pb.PbFieldType.OU3)
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receiverIcons',
        protoName: 'receiverIcons')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'firstReceiverName',
        protoName: 'firstReceiverName')
    ..hasRequiredFields = false;

  VipMicGiftInfo._() : super();
  factory VipMicGiftInfo({
    $core.int? id,
    $core.String? name,
    $core.int? num,
    $core.Iterable<$core.String>? receiverIcons,
    $core.String? firstReceiverName,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (num != null) {
      _result.num = num;
    }
    if (receiverIcons != null) {
      _result.receiverIcons.addAll(receiverIcons);
    }
    if (firstReceiverName != null) {
      _result.firstReceiverName = firstReceiverName;
    }
    return _result;
  }
  factory VipMicGiftInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VipMicGiftInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VipMicGiftInfo clone() => VipMicGiftInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VipMicGiftInfo copyWith(void Function(VipMicGiftInfo) updates) =>
      super.copyWith((message) => updates(message as VipMicGiftInfo))
          as VipMicGiftInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VipMicGiftInfo create() => VipMicGiftInfo._();
  VipMicGiftInfo createEmptyInstance() => create();
  static $pb.PbList<VipMicGiftInfo> createRepeated() =>
      $pb.PbList<VipMicGiftInfo>();
  @$core.pragma('dart2js:noInline')
  static VipMicGiftInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VipMicGiftInfo>(create);
  static VipMicGiftInfo? _defaultInstance;

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
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get receiverIcons => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get firstReceiverName => $_getSZ(4);
  @$pb.TagNumber(5)
  set firstReceiverName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFirstReceiverName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFirstReceiverName() => clearField(5);
}

class VipMicUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VipMicUserInfo',
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
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gray')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularityLevel',
        $pb.PbFieldType.OU3,
        protoName: 'popularityLevel')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeIconInUse',
        protoName: 'badgeIconInUse')
    ..aOM<$0.EntityXsGift>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mount',
        subBuilder: $0.EntityXsGift.create)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mountImage')
    ..hasRequiredFields = false;

  VipMicUserInfo._() : super();
  factory VipMicUserInfo({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.int? title,
    $core.int? vip,
    $core.bool? gray,
    $core.int? age,
    $core.int? popularityLevel,
    $core.String? badgeIconInUse,
    $0.EntityXsGift? mount,
    $core.String? mountImage,
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
    if (sex != null) {
      _result.sex = sex;
    }
    if (title != null) {
      _result.title = title;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (gray != null) {
      _result.gray = gray;
    }
    if (age != null) {
      _result.age = age;
    }
    if (popularityLevel != null) {
      _result.popularityLevel = popularityLevel;
    }
    if (badgeIconInUse != null) {
      _result.badgeIconInUse = badgeIconInUse;
    }
    if (mount != null) {
      _result.mount = mount;
    }
    if (mountImage != null) {
      _result.mountImage = mountImage;
    }
    return _result;
  }
  factory VipMicUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VipMicUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VipMicUserInfo clone() => VipMicUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VipMicUserInfo copyWith(void Function(VipMicUserInfo) updates) =>
      super.copyWith((message) => updates(message as VipMicUserInfo))
          as VipMicUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VipMicUserInfo create() => VipMicUserInfo._();
  VipMicUserInfo createEmptyInstance() => create();
  static $pb.PbList<VipMicUserInfo> createRepeated() =>
      $pb.PbList<VipMicUserInfo>();
  @$core.pragma('dart2js:noInline')
  static VipMicUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VipMicUserInfo>(create);
  static VipMicUserInfo? _defaultInstance;

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
  $core.int get sex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get title => $_getIZ(4);
  @$pb.TagNumber(5)
  set title($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get vip => $_getIZ(5);
  @$pb.TagNumber(6)
  set vip($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVip() => $_has(5);
  @$pb.TagNumber(6)
  void clearVip() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get gray => $_getBF(6);
  @$pb.TagNumber(7)
  set gray($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGray() => $_has(6);
  @$pb.TagNumber(7)
  void clearGray() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get age => $_getIZ(7);
  @$pb.TagNumber(8)
  set age($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAge() => $_has(7);
  @$pb.TagNumber(8)
  void clearAge() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get popularityLevel => $_getIZ(8);
  @$pb.TagNumber(9)
  set popularityLevel($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPopularityLevel() => $_has(8);
  @$pb.TagNumber(9)
  void clearPopularityLevel() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get badgeIconInUse => $_getSZ(9);
  @$pb.TagNumber(10)
  set badgeIconInUse($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasBadgeIconInUse() => $_has(9);
  @$pb.TagNumber(10)
  void clearBadgeIconInUse() => clearField(10);

  @$pb.TagNumber(11)
  $0.EntityXsGift get mount => $_getN(10);
  @$pb.TagNumber(11)
  set mount($0.EntityXsGift v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasMount() => $_has(10);
  @$pb.TagNumber(11)
  void clearMount() => clearField(11);
  @$pb.TagNumber(11)
  $0.EntityXsGift ensureMount() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.String get mountImage => $_getSZ(11);
  @$pb.TagNumber(12)
  set mountImage($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasMountImage() => $_has(11);
  @$pb.TagNumber(12)
  void clearMountImage() => clearField(12);
}

class VipMicVipInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VipMicVipInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  VipMicVipInfo._() : super();
  factory VipMicVipInfo({
    $core.int? duration,
    $fixnum.Int64? value,
  }) {
    final _result = create();
    if (duration != null) {
      _result.duration = duration;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory VipMicVipInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VipMicVipInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VipMicVipInfo clone() => VipMicVipInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VipMicVipInfo copyWith(void Function(VipMicVipInfo) updates) =>
      super.copyWith((message) => updates(message as VipMicVipInfo))
          as VipMicVipInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VipMicVipInfo create() => VipMicVipInfo._();
  VipMicVipInfo createEmptyInstance() => create();
  static $pb.PbList<VipMicVipInfo> createRepeated() =>
      $pb.PbList<VipMicVipInfo>();
  @$core.pragma('dart2js:noInline')
  static VipMicVipInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VipMicVipInfo>(create);
  static VipMicVipInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get duration => $_getIZ(0);
  @$pb.TagNumber(1)
  set duration($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDuration() => $_has(0);
  @$pb.TagNumber(1)
  void clearDuration() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get value => $_getI64(1);
  @$pb.TagNumber(2)
  set value($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class VipMicGiftCoupon extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VipMicGiftCoupon',
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
            : 'ductionMoney',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'couponTips')
    ..hasRequiredFields = false;

  VipMicGiftCoupon._() : super();
  factory VipMicGiftCoupon({
    $core.int? cid,
    $core.int? ductionMoney,
    $core.String? couponTips,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (ductionMoney != null) {
      _result.ductionMoney = ductionMoney;
    }
    if (couponTips != null) {
      _result.couponTips = couponTips;
    }
    return _result;
  }
  factory VipMicGiftCoupon.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VipMicGiftCoupon.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VipMicGiftCoupon clone() => VipMicGiftCoupon()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VipMicGiftCoupon copyWith(void Function(VipMicGiftCoupon) updates) =>
      super.copyWith((message) => updates(message as VipMicGiftCoupon))
          as VipMicGiftCoupon; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VipMicGiftCoupon create() => VipMicGiftCoupon._();
  VipMicGiftCoupon createEmptyInstance() => create();
  static $pb.PbList<VipMicGiftCoupon> createRepeated() =>
      $pb.PbList<VipMicGiftCoupon>();
  @$core.pragma('dart2js:noInline')
  static VipMicGiftCoupon getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VipMicGiftCoupon>(create);
  static VipMicGiftCoupon? _defaultInstance;

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
  $core.int get ductionMoney => $_getIZ(1);
  @$pb.TagNumber(2)
  set ductionMoney($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDuctionMoney() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuctionMoney() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get couponTips => $_getSZ(2);
  @$pb.TagNumber(3)
  set couponTips($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCouponTips() => $_has(2);
  @$pb.TagNumber(3)
  void clearCouponTips() => clearField(3);
}

class VipMicConfigMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VipMicConfigMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<VipMicUserInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: VipMicUserInfo.create)
    ..aOM<VipMicGiftInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        subBuilder: VipMicGiftInfo.create)
    ..aOM<VipMicVipInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        subBuilder: VipMicVipInfo.create)
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'annotation')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOM<VipMicGiftCoupon>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'coupon',
        subBuilder: VipMicGiftCoupon.create)
    ..hasRequiredFields = false;

  VipMicConfigMessage._() : super();
  factory VipMicConfigMessage({
    VipMicUserInfo? user,
    VipMicGiftInfo? gift,
    VipMicVipInfo? vip,
    $core.Iterable<$core.String>? annotation,
    $core.String? frame,
    VipMicGiftCoupon? coupon,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (gift != null) {
      _result.gift = gift;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (annotation != null) {
      _result.annotation.addAll(annotation);
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (coupon != null) {
      _result.coupon = coupon;
    }
    return _result;
  }
  factory VipMicConfigMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VipMicConfigMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VipMicConfigMessage clone() => VipMicConfigMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VipMicConfigMessage copyWith(void Function(VipMicConfigMessage) updates) =>
      super.copyWith((message) => updates(message as VipMicConfigMessage))
          as VipMicConfigMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VipMicConfigMessage create() => VipMicConfigMessage._();
  VipMicConfigMessage createEmptyInstance() => create();
  static $pb.PbList<VipMicConfigMessage> createRepeated() =>
      $pb.PbList<VipMicConfigMessage>();
  @$core.pragma('dart2js:noInline')
  static VipMicConfigMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VipMicConfigMessage>(create);
  static VipMicConfigMessage? _defaultInstance;

  @$pb.TagNumber(1)
  VipMicUserInfo get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(VipMicUserInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  VipMicUserInfo ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  VipMicGiftInfo get gift => $_getN(1);
  @$pb.TagNumber(2)
  set gift(VipMicGiftInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGift() => $_has(1);
  @$pb.TagNumber(2)
  void clearGift() => clearField(2);
  @$pb.TagNumber(2)
  VipMicGiftInfo ensureGift() => $_ensure(1);

  @$pb.TagNumber(3)
  VipMicVipInfo get vip => $_getN(2);
  @$pb.TagNumber(3)
  set vip(VipMicVipInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVip() => $_has(2);
  @$pb.TagNumber(3)
  void clearVip() => clearField(3);
  @$pb.TagNumber(3)
  VipMicVipInfo ensureVip() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$core.String> get annotation => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get frame => $_getSZ(4);
  @$pb.TagNumber(5)
  set frame($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFrame() => $_has(4);
  @$pb.TagNumber(5)
  void clearFrame() => clearField(5);

  @$pb.TagNumber(6)
  VipMicGiftCoupon get coupon => $_getN(5);
  @$pb.TagNumber(6)
  set coupon(VipMicGiftCoupon v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCoupon() => $_has(5);
  @$pb.TagNumber(6)
  void clearCoupon() => clearField(6);
  @$pb.TagNumber(6)
  VipMicGiftCoupon ensureCoupon() => $_ensure(5);
}

class ApiVipMicConfigResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiVipMicConfigResponse',
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
    ..aOM<VipMicConfigMessage>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: VipMicConfigMessage.create)
    ..hasRequiredFields = false;

  ApiVipMicConfigResponse._() : super();
  factory ApiVipMicConfigResponse({
    $core.bool? success,
    $core.String? message,
    VipMicConfigMessage? data,
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
  factory ApiVipMicConfigResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiVipMicConfigResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiVipMicConfigResponse clone() =>
      ApiVipMicConfigResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiVipMicConfigResponse copyWith(
          void Function(ApiVipMicConfigResponse) updates) =>
      super.copyWith((message) => updates(message as ApiVipMicConfigResponse))
          as ApiVipMicConfigResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiVipMicConfigResponse create() => ApiVipMicConfigResponse._();
  ApiVipMicConfigResponse createEmptyInstance() => create();
  static $pb.PbList<ApiVipMicConfigResponse> createRepeated() =>
      $pb.PbList<ApiVipMicConfigResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiVipMicConfigResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiVipMicConfigResponse>(create);
  static ApiVipMicConfigResponse? _defaultInstance;

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
  VipMicConfigMessage get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(VipMicConfigMessage v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  VipMicConfigMessage ensureData() => $_ensure(2);
}

class VipMicUserSimple extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VipMicUserSimple',
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
            : 'sex',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micType',
        $pb.PbFieldType.OU3)
    ..aOM<VipMicCPInfo>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cpInfo',
        subBuilder: VipMicCPInfo.create)
    ..pc<MicCubicleUser>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cubicleUsers',
        $pb.PbFieldType.PM,
        subBuilder: MicCubicleUser.create)
    ..hasRequiredFields = false;

  VipMicUserSimple._() : super();
  factory VipMicUserSimple({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.String? frame,
    $core.int? micType,
    VipMicCPInfo? cpInfo,
    $core.Iterable<MicCubicleUser>? cubicleUsers,
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
    if (sex != null) {
      _result.sex = sex;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (micType != null) {
      _result.micType = micType;
    }
    if (cpInfo != null) {
      _result.cpInfo = cpInfo;
    }
    if (cubicleUsers != null) {
      _result.cubicleUsers.addAll(cubicleUsers);
    }
    return _result;
  }
  factory VipMicUserSimple.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VipMicUserSimple.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VipMicUserSimple clone() => VipMicUserSimple()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VipMicUserSimple copyWith(void Function(VipMicUserSimple) updates) =>
      super.copyWith((message) => updates(message as VipMicUserSimple))
          as VipMicUserSimple; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VipMicUserSimple create() => VipMicUserSimple._();
  VipMicUserSimple createEmptyInstance() => create();
  static $pb.PbList<VipMicUserSimple> createRepeated() =>
      $pb.PbList<VipMicUserSimple>();
  @$core.pragma('dart2js:noInline')
  static VipMicUserSimple getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VipMicUserSimple>(create);
  static VipMicUserSimple? _defaultInstance;

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
  $core.int get sex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get frame => $_getSZ(4);
  @$pb.TagNumber(5)
  set frame($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFrame() => $_has(4);
  @$pb.TagNumber(5)
  void clearFrame() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get micType => $_getIZ(5);
  @$pb.TagNumber(6)
  set micType($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMicType() => $_has(5);
  @$pb.TagNumber(6)
  void clearMicType() => clearField(6);

  @$pb.TagNumber(7)
  VipMicCPInfo get cpInfo => $_getN(6);
  @$pb.TagNumber(7)
  set cpInfo(VipMicCPInfo v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCpInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearCpInfo() => clearField(7);
  @$pb.TagNumber(7)
  VipMicCPInfo ensureCpInfo() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.List<MicCubicleUser> get cubicleUsers => $_getList(7);
}

class ApiVipMicSimpleResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiVipMicSimpleResponse',
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
    ..aOM<VipMicUserSimple>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: VipMicUserSimple.create)
    ..hasRequiredFields = false;

  ApiVipMicSimpleResponse._() : super();
  factory ApiVipMicSimpleResponse({
    $core.bool? success,
    $core.String? message,
    VipMicUserSimple? data,
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
  factory ApiVipMicSimpleResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiVipMicSimpleResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiVipMicSimpleResponse clone() =>
      ApiVipMicSimpleResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiVipMicSimpleResponse copyWith(
          void Function(ApiVipMicSimpleResponse) updates) =>
      super.copyWith((message) => updates(message as ApiVipMicSimpleResponse))
          as ApiVipMicSimpleResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiVipMicSimpleResponse create() => ApiVipMicSimpleResponse._();
  ApiVipMicSimpleResponse createEmptyInstance() => create();
  static $pb.PbList<ApiVipMicSimpleResponse> createRepeated() =>
      $pb.PbList<ApiVipMicSimpleResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiVipMicSimpleResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiVipMicSimpleResponse>(create);
  static ApiVipMicSimpleResponse? _defaultInstance;

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
  VipMicUserSimple get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(VipMicUserSimple v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  VipMicUserSimple ensureData() => $_ensure(2);
}

class VipMicCPInfoData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VipMicCPInfoData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<VipMicCPInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'yesterday',
        subBuilder: VipMicCPInfo.create)
    ..pc<VipMicCPInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'todayLst',
        $pb.PbFieldType.PM,
        subBuilder: VipMicCPInfo.create)
    ..hasRequiredFields = false;

  VipMicCPInfoData._() : super();
  factory VipMicCPInfoData({
    VipMicCPInfo? yesterday,
    $core.Iterable<VipMicCPInfo>? todayLst,
  }) {
    final _result = create();
    if (yesterday != null) {
      _result.yesterday = yesterday;
    }
    if (todayLst != null) {
      _result.todayLst.addAll(todayLst);
    }
    return _result;
  }
  factory VipMicCPInfoData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VipMicCPInfoData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VipMicCPInfoData clone() => VipMicCPInfoData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VipMicCPInfoData copyWith(void Function(VipMicCPInfoData) updates) =>
      super.copyWith((message) => updates(message as VipMicCPInfoData))
          as VipMicCPInfoData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VipMicCPInfoData create() => VipMicCPInfoData._();
  VipMicCPInfoData createEmptyInstance() => create();
  static $pb.PbList<VipMicCPInfoData> createRepeated() =>
      $pb.PbList<VipMicCPInfoData>();
  @$core.pragma('dart2js:noInline')
  static VipMicCPInfoData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VipMicCPInfoData>(create);
  static VipMicCPInfoData? _defaultInstance;

  @$pb.TagNumber(1)
  VipMicCPInfo get yesterday => $_getN(0);
  @$pb.TagNumber(1)
  set yesterday(VipMicCPInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasYesterday() => $_has(0);
  @$pb.TagNumber(1)
  void clearYesterday() => clearField(1);
  @$pb.TagNumber(1)
  VipMicCPInfo ensureYesterday() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<VipMicCPInfo> get todayLst => $_getList(1);
}

class ApiVipMicCPInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiVipMicCPInfoResponse',
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
    ..aOM<VipMicCPInfoData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: VipMicCPInfoData.create)
    ..hasRequiredFields = false;

  ApiVipMicCPInfoResponse._() : super();
  factory ApiVipMicCPInfoResponse({
    $core.bool? success,
    $core.String? message,
    VipMicCPInfoData? data,
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
  factory ApiVipMicCPInfoResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiVipMicCPInfoResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiVipMicCPInfoResponse clone() =>
      ApiVipMicCPInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiVipMicCPInfoResponse copyWith(
          void Function(ApiVipMicCPInfoResponse) updates) =>
      super.copyWith((message) => updates(message as ApiVipMicCPInfoResponse))
          as ApiVipMicCPInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiVipMicCPInfoResponse create() => ApiVipMicCPInfoResponse._();
  ApiVipMicCPInfoResponse createEmptyInstance() => create();
  static $pb.PbList<ApiVipMicCPInfoResponse> createRepeated() =>
      $pb.PbList<ApiVipMicCPInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiVipMicCPInfoResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiVipMicCPInfoResponse>(create);
  static ApiVipMicCPInfoResponse? _defaultInstance;

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
  VipMicCPInfoData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(VipMicCPInfoData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  VipMicCPInfoData ensureData() => $_ensure(2);
}

class VipMicCPInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VipMicCPInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<VipMicCPUser>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user1',
        protoName: 'user_1',
        subBuilder: VipMicCPUser.create)
    ..aOM<VipMicCPUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user2',
        protoName: 'user_2',
        subBuilder: VipMicCPUser.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  VipMicCPInfo._() : super();
  factory VipMicCPInfo({
    VipMicCPUser? user1,
    VipMicCPUser? user2,
    $core.int? value,
  }) {
    final _result = create();
    if (user1 != null) {
      _result.user1 = user1;
    }
    if (user2 != null) {
      _result.user2 = user2;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory VipMicCPInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VipMicCPInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VipMicCPInfo clone() => VipMicCPInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VipMicCPInfo copyWith(void Function(VipMicCPInfo) updates) =>
      super.copyWith((message) => updates(message as VipMicCPInfo))
          as VipMicCPInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VipMicCPInfo create() => VipMicCPInfo._();
  VipMicCPInfo createEmptyInstance() => create();
  static $pb.PbList<VipMicCPInfo> createRepeated() =>
      $pb.PbList<VipMicCPInfo>();
  @$core.pragma('dart2js:noInline')
  static VipMicCPInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VipMicCPInfo>(create);
  static VipMicCPInfo? _defaultInstance;

  @$pb.TagNumber(1)
  VipMicCPUser get user1 => $_getN(0);
  @$pb.TagNumber(1)
  set user1(VipMicCPUser v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUser1() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser1() => clearField(1);
  @$pb.TagNumber(1)
  VipMicCPUser ensureUser1() => $_ensure(0);

  @$pb.TagNumber(2)
  VipMicCPUser get user2 => $_getN(1);
  @$pb.TagNumber(2)
  set user2(VipMicCPUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUser2() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser2() => clearField(2);
  @$pb.TagNumber(2)
  VipMicCPUser ensureUser2() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get value => $_getIZ(2);
  @$pb.TagNumber(3)
  set value($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
}

class VipMicCPUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VipMicCPUser',
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
            : 'vip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  VipMicCPUser._() : super();
  factory VipMicCPUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? vip,
    $core.int? title,
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
    if (vip != null) {
      _result.vip = vip;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory VipMicCPUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VipMicCPUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VipMicCPUser clone() => VipMicCPUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VipMicCPUser copyWith(void Function(VipMicCPUser) updates) =>
      super.copyWith((message) => updates(message as VipMicCPUser))
          as VipMicCPUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VipMicCPUser create() => VipMicCPUser._();
  VipMicCPUser createEmptyInstance() => create();
  static $pb.PbList<VipMicCPUser> createRepeated() =>
      $pb.PbList<VipMicCPUser>();
  @$core.pragma('dart2js:noInline')
  static VipMicCPUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VipMicCPUser>(create);
  static VipMicCPUser? _defaultInstance;

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
  $core.int get vip => $_getIZ(3);
  @$pb.TagNumber(4)
  set vip($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVip() => $_has(3);
  @$pb.TagNumber(4)
  void clearVip() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get title => $_getIZ(4);
  @$pb.TagNumber(5)
  set title($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => clearField(5);
}

class MicCubicleUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MicCubicleUser',
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
            : 'value',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MicCubicleUser._() : super();
  factory MicCubicleUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? value,
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
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory MicCubicleUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MicCubicleUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MicCubicleUser clone() => MicCubicleUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MicCubicleUser copyWith(void Function(MicCubicleUser) updates) =>
      super.copyWith((message) => updates(message as MicCubicleUser))
          as MicCubicleUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MicCubicleUser create() => MicCubicleUser._();
  MicCubicleUser createEmptyInstance() => create();
  static $pb.PbList<MicCubicleUser> createRepeated() =>
      $pb.PbList<MicCubicleUser>();
  @$core.pragma('dart2js:noInline')
  static MicCubicleUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MicCubicleUser>(create);
  static MicCubicleUser? _defaultInstance;

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
  $core.int get value => $_getIZ(3);
  @$pb.TagNumber(4)
  set value($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearValue() => clearField(4);
}
