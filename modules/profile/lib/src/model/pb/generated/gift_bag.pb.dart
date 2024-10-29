///
//  Generated code. Do not modify.
//  source: gift_bag.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AwardUserDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwardUserDetail',
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
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'period',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.O3)
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canUse')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cType')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.O3)
    ..aOB(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isGet')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dayNum',
        $pb.PbFieldType.O3)
    ..aOB(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isCanGet')
    ..hasRequiredFields = false;

  AwardUserDetail._() : super();
  factory AwardUserDetail({
    $core.int? cid,
    $core.String? name,
    $core.String? image,
    $core.int? period,
    $core.int? num,
    $core.bool? canUse,
    $core.String? cType,
    $core.int? price,
    $core.bool? isGet,
    $core.int? dayNum,
    $core.bool? isCanGet,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    if (period != null) {
      _result.period = period;
    }
    if (num != null) {
      _result.num = num;
    }
    if (canUse != null) {
      _result.canUse = canUse;
    }
    if (cType != null) {
      _result.cType = cType;
    }
    if (price != null) {
      _result.price = price;
    }
    if (isGet != null) {
      _result.isGet = isGet;
    }
    if (dayNum != null) {
      _result.dayNum = dayNum;
    }
    if (isCanGet != null) {
      _result.isCanGet = isCanGet;
    }
    return _result;
  }
  factory AwardUserDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwardUserDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwardUserDetail clone() => AwardUserDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwardUserDetail copyWith(void Function(AwardUserDetail) updates) =>
      super.copyWith((message) => updates(message as AwardUserDetail))
          as AwardUserDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwardUserDetail create() => AwardUserDetail._();
  AwardUserDetail createEmptyInstance() => create();
  static $pb.PbList<AwardUserDetail> createRepeated() =>
      $pb.PbList<AwardUserDetail>();
  @$core.pragma('dart2js:noInline')
  static AwardUserDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwardUserDetail>(create);
  static AwardUserDetail? _defaultInstance;

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
  $core.int get period => $_getIZ(3);
  @$pb.TagNumber(4)
  set period($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPeriod() => $_has(3);
  @$pb.TagNumber(4)
  void clearPeriod() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get num => $_getIZ(4);
  @$pb.TagNumber(5)
  set num($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get canUse => $_getBF(5);
  @$pb.TagNumber(6)
  set canUse($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCanUse() => $_has(5);
  @$pb.TagNumber(6)
  void clearCanUse() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get cType => $_getSZ(6);
  @$pb.TagNumber(7)
  set cType($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCType() => $_has(6);
  @$pb.TagNumber(7)
  void clearCType() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get price => $_getIZ(7);
  @$pb.TagNumber(8)
  set price($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearPrice() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isGet => $_getBF(8);
  @$pb.TagNumber(9)
  set isGet($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasIsGet() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsGet() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get dayNum => $_getIZ(9);
  @$pb.TagNumber(10)
  set dayNum($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDayNum() => $_has(9);
  @$pb.TagNumber(10)
  void clearDayNum() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isCanGet => $_getBF(10);
  @$pb.TagNumber(11)
  set isCanGet($core.bool v) {
    $_setBool(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasIsCanGet() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsCanGet() => clearField(11);
}

class AwardUserDetailPush extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwardUserDetailPush',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expireTime',
        $pb.PbFieldType.OU3)
    ..pc<AwardUserDetail>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodities',
        $pb.PbFieldType.PM,
        subBuilder: AwardUserDetail.create)
    ..hasRequiredFields = false;

  AwardUserDetailPush._() : super();
  factory AwardUserDetailPush({
    $core.String? type,
    $core.String? title,
    $core.int? expireTime,
    $core.Iterable<AwardUserDetail>? commodities,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (title != null) {
      _result.title = title;
    }
    if (expireTime != null) {
      _result.expireTime = expireTime;
    }
    if (commodities != null) {
      _result.commodities.addAll(commodities);
    }
    return _result;
  }
  factory AwardUserDetailPush.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwardUserDetailPush.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwardUserDetailPush clone() => AwardUserDetailPush()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwardUserDetailPush copyWith(void Function(AwardUserDetailPush) updates) =>
      super.copyWith((message) => updates(message as AwardUserDetailPush))
          as AwardUserDetailPush; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwardUserDetailPush create() => AwardUserDetailPush._();
  AwardUserDetailPush createEmptyInstance() => create();
  static $pb.PbList<AwardUserDetailPush> createRepeated() =>
      $pb.PbList<AwardUserDetailPush>();
  @$core.pragma('dart2js:noInline')
  static AwardUserDetailPush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwardUserDetailPush>(create);
  static AwardUserDetailPush? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

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
  $core.List<AwardUserDetail> get commodities => $_getList(3);
}

class RespRewardUserList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespRewardUserList',
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
            : 'bagType')
    ..aOM<AwardUserDetailPush>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AwardUserDetailPush.create)
    ..hasRequiredFields = false;

  RespRewardUserList._() : super();
  factory RespRewardUserList({
    $core.bool? success,
    $core.String? msg,
    $core.String? bagType,
    AwardUserDetailPush? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (bagType != null) {
      _result.bagType = bagType;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory RespRewardUserList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespRewardUserList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespRewardUserList clone() => RespRewardUserList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespRewardUserList copyWith(void Function(RespRewardUserList) updates) =>
      super.copyWith((message) => updates(message as RespRewardUserList))
          as RespRewardUserList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespRewardUserList create() => RespRewardUserList._();
  RespRewardUserList createEmptyInstance() => create();
  static $pb.PbList<RespRewardUserList> createRepeated() =>
      $pb.PbList<RespRewardUserList>();
  @$core.pragma('dart2js:noInline')
  static RespRewardUserList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespRewardUserList>(create);
  static RespRewardUserList? _defaultInstance;

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
  $core.String get bagType => $_getSZ(2);
  @$pb.TagNumber(3)
  set bagType($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBagType() => $_has(2);
  @$pb.TagNumber(3)
  void clearBagType() => clearField(3);

  @$pb.TagNumber(4)
  AwardUserDetailPush get data => $_getN(3);
  @$pb.TagNumber(4)
  set data(AwardUserDetailPush v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);
  @$pb.TagNumber(4)
  AwardUserDetailPush ensureData() => $_ensure(3);
}

class RespGiftBagNormal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGiftBagNormal',
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

  RespGiftBagNormal._() : super();
  factory RespGiftBagNormal({
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
  factory RespGiftBagNormal.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGiftBagNormal.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGiftBagNormal clone() => RespGiftBagNormal()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGiftBagNormal copyWith(void Function(RespGiftBagNormal) updates) =>
      super.copyWith((message) => updates(message as RespGiftBagNormal))
          as RespGiftBagNormal; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGiftBagNormal create() => RespGiftBagNormal._();
  RespGiftBagNormal createEmptyInstance() => create();
  static $pb.PbList<RespGiftBagNormal> createRepeated() =>
      $pb.PbList<RespGiftBagNormal>();
  @$core.pragma('dart2js:noInline')
  static RespGiftBagNormal getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGiftBagNormal>(create);
  static RespGiftBagNormal? _defaultInstance;

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

class RespGiftBagSend extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGiftBagSend',
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
    ..pc<CommoditySimpleInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardList',
        $pb.PbFieldType.PM,
        subBuilder: CommoditySimpleInfo.create)
    ..hasRequiredFields = false;

  RespGiftBagSend._() : super();
  factory RespGiftBagSend({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<CommoditySimpleInfo>? rewardList,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (rewardList != null) {
      _result.rewardList.addAll(rewardList);
    }
    return _result;
  }
  factory RespGiftBagSend.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGiftBagSend.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGiftBagSend clone() => RespGiftBagSend()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGiftBagSend copyWith(void Function(RespGiftBagSend) updates) =>
      super.copyWith((message) => updates(message as RespGiftBagSend))
          as RespGiftBagSend; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGiftBagSend create() => RespGiftBagSend._();
  RespGiftBagSend createEmptyInstance() => create();
  static $pb.PbList<RespGiftBagSend> createRepeated() =>
      $pb.PbList<RespGiftBagSend>();
  @$core.pragma('dart2js:noInline')
  static RespGiftBagSend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGiftBagSend>(create);
  static RespGiftBagSend? _defaultInstance;

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
  $core.List<CommoditySimpleInfo> get rewardList => $_getList(2);
}

class CommoditySimpleInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommoditySimpleInfo',
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
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'period',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.O3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canUse',
        protoName: 'canUse')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ctype')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageBg')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.O3)
    ..aOB(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isProbability')
    ..hasRequiredFields = false;

  CommoditySimpleInfo._() : super();
  factory CommoditySimpleInfo({
    $core.int? cid,
    $core.String? name,
    $core.String? image,
    $core.int? period,
    $core.int? num,
    $core.String? msg,
    $core.bool? canUse,
    $core.String? ctype,
    $core.String? imageBg,
    $core.String? desc,
    $core.int? price,
    $core.bool? isProbability,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    if (period != null) {
      _result.period = period;
    }
    if (num != null) {
      _result.num = num;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (canUse != null) {
      _result.canUse = canUse;
    }
    if (ctype != null) {
      _result.ctype = ctype;
    }
    if (imageBg != null) {
      _result.imageBg = imageBg;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (price != null) {
      _result.price = price;
    }
    if (isProbability != null) {
      _result.isProbability = isProbability;
    }
    return _result;
  }
  factory CommoditySimpleInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommoditySimpleInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommoditySimpleInfo clone() => CommoditySimpleInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommoditySimpleInfo copyWith(void Function(CommoditySimpleInfo) updates) =>
      super.copyWith((message) => updates(message as CommoditySimpleInfo))
          as CommoditySimpleInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommoditySimpleInfo create() => CommoditySimpleInfo._();
  CommoditySimpleInfo createEmptyInstance() => create();
  static $pb.PbList<CommoditySimpleInfo> createRepeated() =>
      $pb.PbList<CommoditySimpleInfo>();
  @$core.pragma('dart2js:noInline')
  static CommoditySimpleInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommoditySimpleInfo>(create);
  static CommoditySimpleInfo? _defaultInstance;

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
  $core.int get period => $_getIZ(3);
  @$pb.TagNumber(4)
  set period($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPeriod() => $_has(3);
  @$pb.TagNumber(4)
  void clearPeriod() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get num => $_getIZ(4);
  @$pb.TagNumber(5)
  set num($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get msg => $_getSZ(5);
  @$pb.TagNumber(6)
  set msg($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMsg() => $_has(5);
  @$pb.TagNumber(6)
  void clearMsg() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get canUse => $_getBF(6);
  @$pb.TagNumber(7)
  set canUse($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCanUse() => $_has(6);
  @$pb.TagNumber(7)
  void clearCanUse() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get ctype => $_getSZ(7);
  @$pb.TagNumber(8)
  set ctype($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCtype() => $_has(7);
  @$pb.TagNumber(8)
  void clearCtype() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get imageBg => $_getSZ(8);
  @$pb.TagNumber(9)
  set imageBg($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasImageBg() => $_has(8);
  @$pb.TagNumber(9)
  void clearImageBg() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get desc => $_getSZ(9);
  @$pb.TagNumber(10)
  set desc($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDesc() => $_has(9);
  @$pb.TagNumber(10)
  void clearDesc() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get price => $_getIZ(10);
  @$pb.TagNumber(11)
  set price($core.int v) {
    $_setSignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPrice() => $_has(10);
  @$pb.TagNumber(11)
  void clearPrice() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get isProbability => $_getBF(11);
  @$pb.TagNumber(12)
  set isProbability($core.bool v) {
    $_setBool(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasIsProbability() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsProbability() => clearField(12);
}
