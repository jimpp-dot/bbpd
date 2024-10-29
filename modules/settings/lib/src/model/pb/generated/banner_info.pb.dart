///
//  Generated code. Do not modify.
//  source: banner_info.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SettingChargeGiftResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SettingChargeGiftResp',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'code',
        $pb.PbFieldType.O3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOM<SettingChargeGiftDetail>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chargeGiftDetail',
        protoName: 'chargeGiftDetail',
        subBuilder: SettingChargeGiftDetail.create)
    ..aOM<SettingBannerDetail>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bannerDetail',
        protoName: 'bannerDetail',
        subBuilder: SettingBannerDetail.create)
    ..hasRequiredFields = false;

  SettingChargeGiftResp._() : super();
  factory SettingChargeGiftResp({
    $core.bool? success,
    $core.int? code,
    $core.String? msg,
    SettingChargeGiftDetail? chargeGiftDetail,
    SettingBannerDetail? bannerDetail,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (code != null) {
      _result.code = code;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (chargeGiftDetail != null) {
      _result.chargeGiftDetail = chargeGiftDetail;
    }
    if (bannerDetail != null) {
      _result.bannerDetail = bannerDetail;
    }
    return _result;
  }
  factory SettingChargeGiftResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SettingChargeGiftResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SettingChargeGiftResp clone() =>
      SettingChargeGiftResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SettingChargeGiftResp copyWith(
          void Function(SettingChargeGiftResp) updates) =>
      super.copyWith((message) => updates(message as SettingChargeGiftResp))
          as SettingChargeGiftResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SettingChargeGiftResp create() => SettingChargeGiftResp._();
  SettingChargeGiftResp createEmptyInstance() => create();
  static $pb.PbList<SettingChargeGiftResp> createRepeated() =>
      $pb.PbList<SettingChargeGiftResp>();
  @$core.pragma('dart2js:noInline')
  static SettingChargeGiftResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SettingChargeGiftResp>(create);
  static SettingChargeGiftResp? _defaultInstance;

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
  $core.int get code => $_getIZ(1);
  @$pb.TagNumber(2)
  set code($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);

  @$pb.TagNumber(4)
  SettingChargeGiftDetail get chargeGiftDetail => $_getN(3);
  @$pb.TagNumber(4)
  set chargeGiftDetail(SettingChargeGiftDetail v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasChargeGiftDetail() => $_has(3);
  @$pb.TagNumber(4)
  void clearChargeGiftDetail() => clearField(4);
  @$pb.TagNumber(4)
  SettingChargeGiftDetail ensureChargeGiftDetail() => $_ensure(3);

  @$pb.TagNumber(5)
  SettingBannerDetail get bannerDetail => $_getN(4);
  @$pb.TagNumber(5)
  set bannerDetail(SettingBannerDetail v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBannerDetail() => $_has(4);
  @$pb.TagNumber(5)
  void clearBannerDetail() => clearField(5);
  @$pb.TagNumber(5)
  SettingBannerDetail ensureBannerDetail() => $_ensure(4);
}

class SettingFormatCommodity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SettingFormatCommodity',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
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
            : 'subType')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'moneyType')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'avatar')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageBg')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isLimited',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cornerIcon')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cornerType')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cornerDesc')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubbleDesc')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubbleFrontColor')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'returnNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filterTabName')
    ..hasRequiredFields = false;

  SettingFormatCommodity._() : super();
  factory SettingFormatCommodity({
    $core.int? appId,
    $core.int? cid,
    $core.int? groupId,
    $core.String? name,
    $core.String? subType,
    $core.int? price,
    $core.String? moneyType,
    $core.String? type,
    $core.String? desc,
    $core.String? avatar,
    $core.String? image,
    $core.String? imageBg,
    $core.int? isLimited,
    $core.int? num,
    $core.String? cornerIcon,
    $core.String? cornerType,
    $core.String? cornerDesc,
    $core.String? bubbleDesc,
    $core.String? bubbleFrontColor,
    $core.int? returnNum,
    $core.String? filterTabName,
  }) {
    final _result = create();
    if (appId != null) {
      _result.appId = appId;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (subType != null) {
      _result.subType = subType;
    }
    if (price != null) {
      _result.price = price;
    }
    if (moneyType != null) {
      _result.moneyType = moneyType;
    }
    if (type != null) {
      _result.type = type;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    if (image != null) {
      _result.image = image;
    }
    if (imageBg != null) {
      _result.imageBg = imageBg;
    }
    if (isLimited != null) {
      _result.isLimited = isLimited;
    }
    if (num != null) {
      _result.num = num;
    }
    if (cornerIcon != null) {
      _result.cornerIcon = cornerIcon;
    }
    if (cornerType != null) {
      _result.cornerType = cornerType;
    }
    if (cornerDesc != null) {
      _result.cornerDesc = cornerDesc;
    }
    if (bubbleDesc != null) {
      _result.bubbleDesc = bubbleDesc;
    }
    if (bubbleFrontColor != null) {
      _result.bubbleFrontColor = bubbleFrontColor;
    }
    if (returnNum != null) {
      _result.returnNum = returnNum;
    }
    if (filterTabName != null) {
      _result.filterTabName = filterTabName;
    }
    return _result;
  }
  factory SettingFormatCommodity.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SettingFormatCommodity.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SettingFormatCommodity clone() =>
      SettingFormatCommodity()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SettingFormatCommodity copyWith(
          void Function(SettingFormatCommodity) updates) =>
      super.copyWith((message) => updates(message as SettingFormatCommodity))
          as SettingFormatCommodity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SettingFormatCommodity create() => SettingFormatCommodity._();
  SettingFormatCommodity createEmptyInstance() => create();
  static $pb.PbList<SettingFormatCommodity> createRepeated() =>
      $pb.PbList<SettingFormatCommodity>();
  @$core.pragma('dart2js:noInline')
  static SettingFormatCommodity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SettingFormatCommodity>(create);
  static SettingFormatCommodity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get appId => $_getIZ(0);
  @$pb.TagNumber(1)
  set appId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAppId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get cid => $_getIZ(1);
  @$pb.TagNumber(2)
  set cid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get groupId => $_getIZ(2);
  @$pb.TagNumber(3)
  set groupId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGroupId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupId() => clearField(3);

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
  $core.String get subType => $_getSZ(4);
  @$pb.TagNumber(5)
  set subType($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSubType() => $_has(4);
  @$pb.TagNumber(5)
  void clearSubType() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get price => $_getIZ(5);
  @$pb.TagNumber(6)
  set price($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrice() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get moneyType => $_getSZ(6);
  @$pb.TagNumber(7)
  set moneyType($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMoneyType() => $_has(6);
  @$pb.TagNumber(7)
  void clearMoneyType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get type => $_getSZ(7);
  @$pb.TagNumber(8)
  set type($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasType() => $_has(7);
  @$pb.TagNumber(8)
  void clearType() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get desc => $_getSZ(8);
  @$pb.TagNumber(9)
  set desc($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasDesc() => $_has(8);
  @$pb.TagNumber(9)
  void clearDesc() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get avatar => $_getSZ(9);
  @$pb.TagNumber(10)
  set avatar($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasAvatar() => $_has(9);
  @$pb.TagNumber(10)
  void clearAvatar() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get image => $_getSZ(10);
  @$pb.TagNumber(11)
  set image($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasImage() => $_has(10);
  @$pb.TagNumber(11)
  void clearImage() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get imageBg => $_getSZ(11);
  @$pb.TagNumber(12)
  set imageBg($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasImageBg() => $_has(11);
  @$pb.TagNumber(12)
  void clearImageBg() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get isLimited => $_getIZ(12);
  @$pb.TagNumber(13)
  set isLimited($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasIsLimited() => $_has(12);
  @$pb.TagNumber(13)
  void clearIsLimited() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get num => $_getIZ(13);
  @$pb.TagNumber(14)
  set num($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasNum() => $_has(13);
  @$pb.TagNumber(14)
  void clearNum() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get cornerIcon => $_getSZ(14);
  @$pb.TagNumber(15)
  set cornerIcon($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasCornerIcon() => $_has(14);
  @$pb.TagNumber(15)
  void clearCornerIcon() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get cornerType => $_getSZ(15);
  @$pb.TagNumber(16)
  set cornerType($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasCornerType() => $_has(15);
  @$pb.TagNumber(16)
  void clearCornerType() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get cornerDesc => $_getSZ(16);
  @$pb.TagNumber(17)
  set cornerDesc($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasCornerDesc() => $_has(16);
  @$pb.TagNumber(17)
  void clearCornerDesc() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get bubbleDesc => $_getSZ(17);
  @$pb.TagNumber(18)
  set bubbleDesc($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasBubbleDesc() => $_has(17);
  @$pb.TagNumber(18)
  void clearBubbleDesc() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get bubbleFrontColor => $_getSZ(18);
  @$pb.TagNumber(19)
  set bubbleFrontColor($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasBubbleFrontColor() => $_has(18);
  @$pb.TagNumber(19)
  void clearBubbleFrontColor() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get returnNum => $_getIZ(19);
  @$pb.TagNumber(20)
  set returnNum($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasReturnNum() => $_has(19);
  @$pb.TagNumber(20)
  void clearReturnNum() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get filterTabName => $_getSZ(20);
  @$pb.TagNumber(21)
  set filterTabName($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasFilterTabName() => $_has(20);
  @$pb.TagNumber(21)
  void clearFilterTabName() => clearField(21);
}

class SettingChargeGiftItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SettingChargeGiftItem',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recharge',
        $pb.PbFieldType.OU3)
    ..pc<SettingFormatCommodity>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gifts',
        $pb.PbFieldType.PM,
        subBuilder: SettingFormatCommodity.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'send')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'morePay',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pay',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SettingChargeGiftItem._() : super();
  factory SettingChargeGiftItem({
    $core.String? name,
    $core.int? recharge,
    $core.Iterable<SettingFormatCommodity>? gifts,
    $core.bool? send,
    $core.int? morePay,
    $core.int? pay,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (recharge != null) {
      _result.recharge = recharge;
    }
    if (gifts != null) {
      _result.gifts.addAll(gifts);
    }
    if (send != null) {
      _result.send = send;
    }
    if (morePay != null) {
      _result.morePay = morePay;
    }
    if (pay != null) {
      _result.pay = pay;
    }
    return _result;
  }
  factory SettingChargeGiftItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SettingChargeGiftItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SettingChargeGiftItem clone() =>
      SettingChargeGiftItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SettingChargeGiftItem copyWith(
          void Function(SettingChargeGiftItem) updates) =>
      super.copyWith((message) => updates(message as SettingChargeGiftItem))
          as SettingChargeGiftItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SettingChargeGiftItem create() => SettingChargeGiftItem._();
  SettingChargeGiftItem createEmptyInstance() => create();
  static $pb.PbList<SettingChargeGiftItem> createRepeated() =>
      $pb.PbList<SettingChargeGiftItem>();
  @$core.pragma('dart2js:noInline')
  static SettingChargeGiftItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SettingChargeGiftItem>(create);
  static SettingChargeGiftItem? _defaultInstance;

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
  $core.int get recharge => $_getIZ(1);
  @$pb.TagNumber(2)
  set recharge($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRecharge() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecharge() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<SettingFormatCommodity> get gifts => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get send => $_getBF(3);
  @$pb.TagNumber(4)
  set send($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSend() => $_has(3);
  @$pb.TagNumber(4)
  void clearSend() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get morePay => $_getIZ(4);
  @$pb.TagNumber(5)
  set morePay($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMorePay() => $_has(4);
  @$pb.TagNumber(5)
  void clearMorePay() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get pay => $_getIZ(5);
  @$pb.TagNumber(6)
  set pay($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPay() => $_has(5);
  @$pb.TagNumber(6)
  void clearPay() => clearField(6);
}

class SettingChargeGiftDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SettingChargeGiftDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<SettingChargeGiftItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'packages',
        $pb.PbFieldType.PM,
        subBuilder: SettingChargeGiftItem.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftSeconds',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'introduction')
    ..hasRequiredFields = false;

  SettingChargeGiftDetail._() : super();
  factory SettingChargeGiftDetail({
    $core.Iterable<SettingChargeGiftItem>? packages,
    $core.int? leftSeconds,
    $core.String? introduction,
  }) {
    final _result = create();
    if (packages != null) {
      _result.packages.addAll(packages);
    }
    if (leftSeconds != null) {
      _result.leftSeconds = leftSeconds;
    }
    if (introduction != null) {
      _result.introduction = introduction;
    }
    return _result;
  }
  factory SettingChargeGiftDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SettingChargeGiftDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SettingChargeGiftDetail clone() =>
      SettingChargeGiftDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SettingChargeGiftDetail copyWith(
          void Function(SettingChargeGiftDetail) updates) =>
      super.copyWith((message) => updates(message as SettingChargeGiftDetail))
          as SettingChargeGiftDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SettingChargeGiftDetail create() => SettingChargeGiftDetail._();
  SettingChargeGiftDetail createEmptyInstance() => create();
  static $pb.PbList<SettingChargeGiftDetail> createRepeated() =>
      $pb.PbList<SettingChargeGiftDetail>();
  @$core.pragma('dart2js:noInline')
  static SettingChargeGiftDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SettingChargeGiftDetail>(create);
  static SettingChargeGiftDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SettingChargeGiftItem> get packages => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get leftSeconds => $_getIZ(1);
  @$pb.TagNumber(2)
  set leftSeconds($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLeftSeconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeftSeconds() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get introduction => $_getSZ(2);
  @$pb.TagNumber(3)
  set introduction($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIntroduction() => $_has(2);
  @$pb.TagNumber(3)
  void clearIntroduction() => clearField(3);
}

class SettingBannerDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SettingBannerDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'finished')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'img')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scheme')
    ..hasRequiredFields = false;

  SettingBannerDetail._() : super();
  factory SettingBannerDetail({
    $core.bool? finished,
    $core.String? img,
    $core.String? scheme,
  }) {
    final _result = create();
    if (finished != null) {
      _result.finished = finished;
    }
    if (img != null) {
      _result.img = img;
    }
    if (scheme != null) {
      _result.scheme = scheme;
    }
    return _result;
  }
  factory SettingBannerDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SettingBannerDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SettingBannerDetail clone() => SettingBannerDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SettingBannerDetail copyWith(void Function(SettingBannerDetail) updates) =>
      super.copyWith((message) => updates(message as SettingBannerDetail))
          as SettingBannerDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SettingBannerDetail create() => SettingBannerDetail._();
  SettingBannerDetail createEmptyInstance() => create();
  static $pb.PbList<SettingBannerDetail> createRepeated() =>
      $pb.PbList<SettingBannerDetail>();
  @$core.pragma('dart2js:noInline')
  static SettingBannerDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SettingBannerDetail>(create);
  static SettingBannerDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get finished => $_getBF(0);
  @$pb.TagNumber(1)
  set finished($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFinished() => $_has(0);
  @$pb.TagNumber(1)
  void clearFinished() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get img => $_getSZ(1);
  @$pb.TagNumber(2)
  set img($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImg() => $_has(1);
  @$pb.TagNumber(2)
  void clearImg() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get scheme => $_getSZ(2);
  @$pb.TagNumber(3)
  set scheme($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScheme() => $_has(2);
  @$pb.TagNumber(3)
  void clearScheme() => clearField(3);
}
