///
//  Generated code. Do not modify.
//  source: nest.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NestUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestUserInfo',
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
            : 'sex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  NestUserInfo._() : super();
  factory NestUserInfo({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
    $core.int? sex,
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
    if (sex != null) {
      _result.sex = sex;
    }
    return _result;
  }
  factory NestUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestUserInfo clone() => NestUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestUserInfo copyWith(void Function(NestUserInfo) updates) =>
      super.copyWith((message) => updates(message as NestUserInfo))
          as NestUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestUserInfo create() => NestUserInfo._();
  NestUserInfo createEmptyInstance() => create();
  static $pb.PbList<NestUserInfo> createRepeated() =>
      $pb.PbList<NestUserInfo>();
  @$core.pragma('dart2js:noInline')
  static NestUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestUserInfo>(create);
  static NestUserInfo? _defaultInstance;

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
  $core.int get sex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);
}

class NestGiftInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestGiftInfo',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftNum',
        $pb.PbFieldType.OU3,
        protoName: 'giftNum')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName',
        protoName: 'giftName')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftUrl',
        protoName: 'giftUrl')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  NestGiftInfo._() : super();
  factory NestGiftInfo({
    $core.int? giftId,
    $core.int? giftNum,
    $core.String? giftName,
    $core.String? giftUrl,
    $core.int? price,
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
    if (giftUrl != null) {
      _result.giftUrl = giftUrl;
    }
    if (price != null) {
      _result.price = price;
    }
    return _result;
  }
  factory NestGiftInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestGiftInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestGiftInfo clone() => NestGiftInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestGiftInfo copyWith(void Function(NestGiftInfo) updates) =>
      super.copyWith((message) => updates(message as NestGiftInfo))
          as NestGiftInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestGiftInfo create() => NestGiftInfo._();
  NestGiftInfo createEmptyInstance() => create();
  static $pb.PbList<NestGiftInfo> createRepeated() =>
      $pb.PbList<NestGiftInfo>();
  @$core.pragma('dart2js:noInline')
  static NestGiftInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestGiftInfo>(create);
  static NestGiftInfo? _defaultInstance;

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
  $core.String get giftUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set giftUrl($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftUrl() => clearField(4);

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
}

class NestGsListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestGsListItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<NestUserInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gs',
        subBuilder: NestUserInfo.create)
    ..aOM<NestGiftInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        subBuilder: NestGiftInfo.create)
    ..hasRequiredFields = false;

  NestGsListItem._() : super();
  factory NestGsListItem({
    NestUserInfo? gs,
    NestGiftInfo? gift,
  }) {
    final _result = create();
    if (gs != null) {
      _result.gs = gs;
    }
    if (gift != null) {
      _result.gift = gift;
    }
    return _result;
  }
  factory NestGsListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestGsListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestGsListItem clone() => NestGsListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestGsListItem copyWith(void Function(NestGsListItem) updates) =>
      super.copyWith((message) => updates(message as NestGsListItem))
          as NestGsListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestGsListItem create() => NestGsListItem._();
  NestGsListItem createEmptyInstance() => create();
  static $pb.PbList<NestGsListItem> createRepeated() =>
      $pb.PbList<NestGsListItem>();
  @$core.pragma('dart2js:noInline')
  static NestGsListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestGsListItem>(create);
  static NestGsListItem? _defaultInstance;

  @$pb.TagNumber(1)
  NestUserInfo get gs => $_getN(0);
  @$pb.TagNumber(1)
  set gs(NestUserInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGs() => $_has(0);
  @$pb.TagNumber(1)
  void clearGs() => clearField(1);
  @$pb.TagNumber(1)
  NestUserInfo ensureGs() => $_ensure(0);

  @$pb.TagNumber(2)
  NestGiftInfo get gift => $_getN(1);
  @$pb.TagNumber(2)
  set gift(NestGiftInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGift() => $_has(1);
  @$pb.TagNumber(2)
  void clearGift() => clearField(2);
  @$pb.TagNumber(2)
  NestGiftInfo ensureGift() => $_ensure(1);
}

class NestGiftCoupon extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestGiftCoupon',
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
            : 'cname')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'discount',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  NestGiftCoupon._() : super();
  factory NestGiftCoupon({
    $core.int? ucid,
    $core.String? cname,
    $core.int? discount,
  }) {
    final _result = create();
    if (ucid != null) {
      _result.ucid = ucid;
    }
    if (cname != null) {
      _result.cname = cname;
    }
    if (discount != null) {
      _result.discount = discount;
    }
    return _result;
  }
  factory NestGiftCoupon.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestGiftCoupon.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestGiftCoupon clone() => NestGiftCoupon()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestGiftCoupon copyWith(void Function(NestGiftCoupon) updates) =>
      super.copyWith((message) => updates(message as NestGiftCoupon))
          as NestGiftCoupon; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestGiftCoupon create() => NestGiftCoupon._();
  NestGiftCoupon createEmptyInstance() => create();
  static $pb.PbList<NestGiftCoupon> createRepeated() =>
      $pb.PbList<NestGiftCoupon>();
  @$core.pragma('dart2js:noInline')
  static NestGiftCoupon getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestGiftCoupon>(create);
  static NestGiftCoupon? _defaultInstance;

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
  $core.String get cname => $_getSZ(1);
  @$pb.TagNumber(2)
  set cname($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCname() => $_has(1);
  @$pb.TagNumber(2)
  void clearCname() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get discount => $_getIZ(2);
  @$pb.TagNumber(3)
  set discount($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDiscount() => $_has(2);
  @$pb.TagNumber(3)
  void clearDiscount() => clearField(3);
}

class NestGsListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestGsListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<NestGsListItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: NestGsListItem.create)
    ..aOM<NestGiftCoupon>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'coupon',
        subBuilder: NestGiftCoupon.create)
    ..hasRequiredFields = false;

  NestGsListData._() : super();
  factory NestGsListData({
    $core.Iterable<NestGsListItem>? data,
    NestGiftCoupon? coupon,
  }) {
    final _result = create();
    if (data != null) {
      _result.data.addAll(data);
    }
    if (coupon != null) {
      _result.coupon = coupon;
    }
    return _result;
  }
  factory NestGsListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestGsListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestGsListData clone() => NestGsListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestGsListData copyWith(void Function(NestGsListData) updates) =>
      super.copyWith((message) => updates(message as NestGsListData))
          as NestGsListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestGsListData create() => NestGsListData._();
  NestGsListData createEmptyInstance() => create();
  static $pb.PbList<NestGsListData> createRepeated() =>
      $pb.PbList<NestGsListData>();
  @$core.pragma('dart2js:noInline')
  static NestGsListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestGsListData>(create);
  static NestGsListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<NestGsListItem> get data => $_getList(0);

  @$pb.TagNumber(2)
  NestGiftCoupon get coupon => $_getN(1);
  @$pb.TagNumber(2)
  set coupon(NestGiftCoupon v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCoupon() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoupon() => clearField(2);
  @$pb.TagNumber(2)
  NestGiftCoupon ensureCoupon() => $_ensure(1);
}

class ApiNestGsListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiNestGsListResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Success',
        protoName: 'Success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOM<NestGsListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: NestGsListData.create)
    ..hasRequiredFields = false;

  ApiNestGsListResponse._() : super();
  factory ApiNestGsListResponse({
    $core.bool? success,
    $core.String? message,
    NestGsListData? data,
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
  factory ApiNestGsListResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiNestGsListResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiNestGsListResponse clone() =>
      ApiNestGsListResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiNestGsListResponse copyWith(
          void Function(ApiNestGsListResponse) updates) =>
      super.copyWith((message) => updates(message as ApiNestGsListResponse))
          as ApiNestGsListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiNestGsListResponse create() => ApiNestGsListResponse._();
  ApiNestGsListResponse createEmptyInstance() => create();
  static $pb.PbList<ApiNestGsListResponse> createRepeated() =>
      $pb.PbList<ApiNestGsListResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiNestGsListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiNestGsListResponse>(create);
  static ApiNestGsListResponse? _defaultInstance;

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
  NestGsListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(NestGsListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  NestGsListData ensureData() => $_ensure(2);
}

class NestSuccessNotifyMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestSuccessNotifyMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<NestUserInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gs',
        subBuilder: NestUserInfo.create)
    ..aOM<NestUserInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boss',
        subBuilder: NestUserInfo.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..hasRequiredFields = false;

  NestSuccessNotifyMessage._() : super();
  factory NestSuccessNotifyMessage({
    NestUserInfo? gs,
    NestUserInfo? boss,
    $core.String? content,
  }) {
    final _result = create();
    if (gs != null) {
      _result.gs = gs;
    }
    if (boss != null) {
      _result.boss = boss;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory NestSuccessNotifyMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestSuccessNotifyMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestSuccessNotifyMessage clone() =>
      NestSuccessNotifyMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestSuccessNotifyMessage copyWith(
          void Function(NestSuccessNotifyMessage) updates) =>
      super.copyWith((message) => updates(message as NestSuccessNotifyMessage))
          as NestSuccessNotifyMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestSuccessNotifyMessage create() => NestSuccessNotifyMessage._();
  NestSuccessNotifyMessage createEmptyInstance() => create();
  static $pb.PbList<NestSuccessNotifyMessage> createRepeated() =>
      $pb.PbList<NestSuccessNotifyMessage>();
  @$core.pragma('dart2js:noInline')
  static NestSuccessNotifyMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestSuccessNotifyMessage>(create);
  static NestSuccessNotifyMessage? _defaultInstance;

  @$pb.TagNumber(1)
  NestUserInfo get gs => $_getN(0);
  @$pb.TagNumber(1)
  set gs(NestUserInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGs() => $_has(0);
  @$pb.TagNumber(1)
  void clearGs() => clearField(1);
  @$pb.TagNumber(1)
  NestUserInfo ensureGs() => $_ensure(0);

  @$pb.TagNumber(2)
  NestUserInfo get boss => $_getN(1);
  @$pb.TagNumber(2)
  set boss(NestUserInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBoss() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoss() => clearField(2);
  @$pb.TagNumber(2)
  NestUserInfo ensureBoss() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);
}

class NestRoomInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestRoomInfo',
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

  NestRoomInfo._() : super();
  factory NestRoomInfo({
    $core.int? rid,
    $core.String? name,
    $core.String? icon,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory NestRoomInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestRoomInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestRoomInfo clone() => NestRoomInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestRoomInfo copyWith(void Function(NestRoomInfo) updates) =>
      super.copyWith((message) => updates(message as NestRoomInfo))
          as NestRoomInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestRoomInfo create() => NestRoomInfo._();
  NestRoomInfo createEmptyInstance() => create();
  static $pb.PbList<NestRoomInfo> createRepeated() =>
      $pb.PbList<NestRoomInfo>();
  @$core.pragma('dart2js:noInline')
  static NestRoomInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestRoomInfo>(create);
  static NestRoomInfo? _defaultInstance;

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

class NestBossNestItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestBossNestItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<NestRoomInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room',
        subBuilder: NestRoomInfo.create)
    ..aOM<NestUserInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: NestUserInfo.create)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gsInRoom',
        protoName: 'gsInRoom')
    ..hasRequiredFields = false;

  NestBossNestItem._() : super();
  factory NestBossNestItem({
    NestRoomInfo? room,
    NestUserInfo? user,
    $core.bool? gsInRoom,
  }) {
    final _result = create();
    if (room != null) {
      _result.room = room;
    }
    if (user != null) {
      _result.user = user;
    }
    if (gsInRoom != null) {
      _result.gsInRoom = gsInRoom;
    }
    return _result;
  }
  factory NestBossNestItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestBossNestItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestBossNestItem clone() => NestBossNestItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestBossNestItem copyWith(void Function(NestBossNestItem) updates) =>
      super.copyWith((message) => updates(message as NestBossNestItem))
          as NestBossNestItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestBossNestItem create() => NestBossNestItem._();
  NestBossNestItem createEmptyInstance() => create();
  static $pb.PbList<NestBossNestItem> createRepeated() =>
      $pb.PbList<NestBossNestItem>();
  @$core.pragma('dart2js:noInline')
  static NestBossNestItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestBossNestItem>(create);
  static NestBossNestItem? _defaultInstance;

  @$pb.TagNumber(1)
  NestRoomInfo get room => $_getN(0);
  @$pb.TagNumber(1)
  set room(NestRoomInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);
  @$pb.TagNumber(1)
  NestRoomInfo ensureRoom() => $_ensure(0);

  @$pb.TagNumber(2)
  NestUserInfo get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(NestUserInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  NestUserInfo ensureUser() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get gsInRoom => $_getBF(2);
  @$pb.TagNumber(3)
  set gsInRoom($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGsInRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearGsInRoom() => clearField(3);
}

class ApiNestBossListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiNestBossListResponse',
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
    ..pc<NestBossNestItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: NestBossNestItem.create)
    ..hasRequiredFields = false;

  ApiNestBossListResponse._() : super();
  factory ApiNestBossListResponse({
    $core.bool? success,
    $core.String? message,
    $core.Iterable<NestBossNestItem>? list,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory ApiNestBossListResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiNestBossListResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiNestBossListResponse clone() =>
      ApiNestBossListResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiNestBossListResponse copyWith(
          void Function(ApiNestBossListResponse) updates) =>
      super.copyWith((message) => updates(message as ApiNestBossListResponse))
          as ApiNestBossListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiNestBossListResponse create() => ApiNestBossListResponse._();
  ApiNestBossListResponse createEmptyInstance() => create();
  static $pb.PbList<ApiNestBossListResponse> createRepeated() =>
      $pb.PbList<ApiNestBossListResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiNestBossListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiNestBossListResponse>(create);
  static ApiNestBossListResponse? _defaultInstance;

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
  $core.List<NestBossNestItem> get list => $_getList(2);
}

class NestChildrenItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestChildrenItem',
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
            : 'total',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  NestChildrenItem._() : super();
  factory NestChildrenItem({
    $core.int? rid,
    $core.String? name,
    $core.String? icon,
    $core.int? total,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (total != null) {
      _result.total = total;
    }
    return _result;
  }
  factory NestChildrenItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestChildrenItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestChildrenItem clone() => NestChildrenItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestChildrenItem copyWith(void Function(NestChildrenItem) updates) =>
      super.copyWith((message) => updates(message as NestChildrenItem))
          as NestChildrenItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestChildrenItem create() => NestChildrenItem._();
  NestChildrenItem createEmptyInstance() => create();
  static $pb.PbList<NestChildrenItem> createRepeated() =>
      $pb.PbList<NestChildrenItem>();
  @$core.pragma('dart2js:noInline')
  static NestChildrenItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestChildrenItem>(create);
  static NestChildrenItem? _defaultInstance;

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
  $core.int get total => $_getIZ(3);
  @$pb.TagNumber(4)
  set total($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTotal() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotal() => clearField(4);
}

class ApiNestChildrenResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiNestChildrenResponse',
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
    ..pc<NestChildrenItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: NestChildrenItem.create)
    ..hasRequiredFields = false;

  ApiNestChildrenResponse._() : super();
  factory ApiNestChildrenResponse({
    $core.bool? success,
    $core.String? message,
    $core.Iterable<NestChildrenItem>? list,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory ApiNestChildrenResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiNestChildrenResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiNestChildrenResponse clone() =>
      ApiNestChildrenResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiNestChildrenResponse copyWith(
          void Function(ApiNestChildrenResponse) updates) =>
      super.copyWith((message) => updates(message as ApiNestChildrenResponse))
          as ApiNestChildrenResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiNestChildrenResponse create() => ApiNestChildrenResponse._();
  ApiNestChildrenResponse createEmptyInstance() => create();
  static $pb.PbList<ApiNestChildrenResponse> createRepeated() =>
      $pb.PbList<ApiNestChildrenResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiNestChildrenResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiNestChildrenResponse>(create);
  static ApiNestChildrenResponse? _defaultInstance;

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
  $core.List<NestChildrenItem> get list => $_getList(2);
}

class NestAcquireRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestAcquireRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gsUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'masterRid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  NestAcquireRequest._() : super();
  factory NestAcquireRequest({
    $core.int? gsUid,
    $core.int? masterRid,
  }) {
    final _result = create();
    if (gsUid != null) {
      _result.gsUid = gsUid;
    }
    if (masterRid != null) {
      _result.masterRid = masterRid;
    }
    return _result;
  }
  factory NestAcquireRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestAcquireRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestAcquireRequest clone() => NestAcquireRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestAcquireRequest copyWith(void Function(NestAcquireRequest) updates) =>
      super.copyWith((message) => updates(message as NestAcquireRequest))
          as NestAcquireRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestAcquireRequest create() => NestAcquireRequest._();
  NestAcquireRequest createEmptyInstance() => create();
  static $pb.PbList<NestAcquireRequest> createRepeated() =>
      $pb.PbList<NestAcquireRequest>();
  @$core.pragma('dart2js:noInline')
  static NestAcquireRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestAcquireRequest>(create);
  static NestAcquireRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gsUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set gsUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGsUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get masterRid => $_getIZ(1);
  @$pb.TagNumber(2)
  set masterRid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMasterRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearMasterRid() => clearField(2);
}

class NestAcquireResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestAcquireResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nestRid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  NestAcquireResponse._() : super();
  factory NestAcquireResponse({
    $core.int? nestRid,
  }) {
    final _result = create();
    if (nestRid != null) {
      _result.nestRid = nestRid;
    }
    return _result;
  }
  factory NestAcquireResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestAcquireResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestAcquireResponse clone() => NestAcquireResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestAcquireResponse copyWith(void Function(NestAcquireResponse) updates) =>
      super.copyWith((message) => updates(message as NestAcquireResponse))
          as NestAcquireResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestAcquireResponse create() => NestAcquireResponse._();
  NestAcquireResponse createEmptyInstance() => create();
  static $pb.PbList<NestAcquireResponse> createRepeated() =>
      $pb.PbList<NestAcquireResponse>();
  @$core.pragma('dart2js:noInline')
  static NestAcquireResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestAcquireResponse>(create);
  static NestAcquireResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nestRid => $_getIZ(0);
  @$pb.TagNumber(1)
  set nestRid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNestRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearNestRid() => clearField(1);
}

class NestReleaseRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestReleaseRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nestRid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  NestReleaseRequest._() : super();
  factory NestReleaseRequest({
    $core.int? nestRid,
  }) {
    final _result = create();
    if (nestRid != null) {
      _result.nestRid = nestRid;
    }
    return _result;
  }
  factory NestReleaseRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestReleaseRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestReleaseRequest clone() => NestReleaseRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestReleaseRequest copyWith(void Function(NestReleaseRequest) updates) =>
      super.copyWith((message) => updates(message as NestReleaseRequest))
          as NestReleaseRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestReleaseRequest create() => NestReleaseRequest._();
  NestReleaseRequest createEmptyInstance() => create();
  static $pb.PbList<NestReleaseRequest> createRepeated() =>
      $pb.PbList<NestReleaseRequest>();
  @$core.pragma('dart2js:noInline')
  static NestReleaseRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestReleaseRequest>(create);
  static NestReleaseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nestRid => $_getIZ(0);
  @$pb.TagNumber(1)
  set nestRid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNestRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearNestRid() => clearField(1);
}

class NestReleaseResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestReleaseResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nestRid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  NestReleaseResponse._() : super();
  factory NestReleaseResponse({
    $core.int? nestRid,
    $core.int? status,
  }) {
    final _result = create();
    if (nestRid != null) {
      _result.nestRid = nestRid;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory NestReleaseResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestReleaseResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestReleaseResponse clone() => NestReleaseResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestReleaseResponse copyWith(void Function(NestReleaseResponse) updates) =>
      super.copyWith((message) => updates(message as NestReleaseResponse))
          as NestReleaseResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestReleaseResponse create() => NestReleaseResponse._();
  NestReleaseResponse createEmptyInstance() => create();
  static $pb.PbList<NestReleaseResponse> createRepeated() =>
      $pb.PbList<NestReleaseResponse>();
  @$core.pragma('dart2js:noInline')
  static NestReleaseResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestReleaseResponse>(create);
  static NestReleaseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nestRid => $_getIZ(0);
  @$pb.TagNumber(1)
  set nestRid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNestRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearNestRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(2)
  set status($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class NestApi {
  $pb.RpcClient _client;
  NestApi(this._client);

  $async.Future<NestAcquireResponse> acquire(
      $pb.ClientContext? ctx, NestAcquireRequest request) {
    var emptyResponse = NestAcquireResponse();
    return _client.invoke<NestAcquireResponse>(
        ctx, 'Nest', 'Acquire', request, emptyResponse);
  }

  $async.Future<NestReleaseResponse> release(
      $pb.ClientContext? ctx, NestReleaseRequest request) {
    var emptyResponse = NestReleaseResponse();
    return _client.invoke<NestReleaseResponse>(
        ctx, 'Nest', 'Release', request, emptyResponse);
  }
}
