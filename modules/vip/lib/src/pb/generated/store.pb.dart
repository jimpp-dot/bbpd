///
//  Generated code. Do not modify.
//  source: store.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class StoreCommodityProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoreCommodityProfile',
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

  StoreCommodityProfile._() : super();
  factory StoreCommodityProfile({
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
  factory StoreCommodityProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoreCommodityProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoreCommodityProfile clone() =>
      StoreCommodityProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoreCommodityProfile copyWith(
          void Function(StoreCommodityProfile) updates) =>
      super.copyWith((message) => updates(message as StoreCommodityProfile))
          as StoreCommodityProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreCommodityProfile create() => StoreCommodityProfile._();
  StoreCommodityProfile createEmptyInstance() => create();
  static $pb.PbList<StoreCommodityProfile> createRepeated() =>
      $pb.PbList<StoreCommodityProfile>();
  @$core.pragma('dart2js:noInline')
  static StoreCommodityProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreCommodityProfile>(create);
  static StoreCommodityProfile? _defaultInstance;

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

class StoreCommodityItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoreCommodityItem',
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
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeName')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subType')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'moneyType')
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
            : 'limited',
        $pb.PbFieldType.OU3)
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cornerIcon')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cornerDesc')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cornerType')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grade')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gradeIcon')
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numTotal',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numStock',
        $pb.PbFieldType.OU3)
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partition')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubbleDesc')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubbleFontColor')
    ..aOM<StoreCommodityProfile>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'owner',
        subBuilder: StoreCommodityProfile.create)
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'limitedPrice',
        $pb.PbFieldType.OU3,
        protoName: 'limitedPrice')
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ductionRate',
        $pb.PbFieldType.OU3)
    ..aOS(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grantWay')
    ..aOS(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grantLimit')
    ..aOS(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpType')
    ..aOS(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpUrl')
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightScore',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'salingOnShop',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  StoreCommodityItem._() : super();
  factory StoreCommodityItem({
    $core.int? cid,
    $core.int? groupId,
    $core.String? name,
    $core.String? type,
    $core.String? typeName,
    $core.String? subType,
    $core.int? price,
    $core.String? moneyType,
    $core.String? desc,
    $core.String? avatar,
    $core.String? image,
    $core.String? imageBg,
    $core.int? limited,
    $core.String? cornerIcon,
    $core.String? cornerDesc,
    $core.String? cornerType,
    $core.String? grade,
    $core.String? gradeIcon,
    $core.int? numTotal,
    $core.int? numStock,
    $core.String? partition,
    $core.String? bubbleDesc,
    $core.String? bubbleFontColor,
    StoreCommodityProfile? owner,
    $core.int? limitedPrice,
    $core.int? ductionRate,
    $core.String? grantWay,
    $core.String? grantLimit,
    $core.String? jumpType,
    $core.String? jumpUrl,
    $core.int? lightScore,
    $core.int? salingOnShop,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    if (typeName != null) {
      _result.typeName = typeName;
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
    if (limited != null) {
      _result.limited = limited;
    }
    if (cornerIcon != null) {
      _result.cornerIcon = cornerIcon;
    }
    if (cornerDesc != null) {
      _result.cornerDesc = cornerDesc;
    }
    if (cornerType != null) {
      _result.cornerType = cornerType;
    }
    if (grade != null) {
      _result.grade = grade;
    }
    if (gradeIcon != null) {
      _result.gradeIcon = gradeIcon;
    }
    if (numTotal != null) {
      _result.numTotal = numTotal;
    }
    if (numStock != null) {
      _result.numStock = numStock;
    }
    if (partition != null) {
      _result.partition = partition;
    }
    if (bubbleDesc != null) {
      _result.bubbleDesc = bubbleDesc;
    }
    if (bubbleFontColor != null) {
      _result.bubbleFontColor = bubbleFontColor;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    if (limitedPrice != null) {
      _result.limitedPrice = limitedPrice;
    }
    if (ductionRate != null) {
      _result.ductionRate = ductionRate;
    }
    if (grantWay != null) {
      _result.grantWay = grantWay;
    }
    if (grantLimit != null) {
      _result.grantLimit = grantLimit;
    }
    if (jumpType != null) {
      _result.jumpType = jumpType;
    }
    if (jumpUrl != null) {
      _result.jumpUrl = jumpUrl;
    }
    if (lightScore != null) {
      _result.lightScore = lightScore;
    }
    if (salingOnShop != null) {
      _result.salingOnShop = salingOnShop;
    }
    return _result;
  }
  factory StoreCommodityItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoreCommodityItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoreCommodityItem clone() => StoreCommodityItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoreCommodityItem copyWith(void Function(StoreCommodityItem) updates) =>
      super.copyWith((message) => updates(message as StoreCommodityItem))
          as StoreCommodityItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreCommodityItem create() => StoreCommodityItem._();
  StoreCommodityItem createEmptyInstance() => create();
  static $pb.PbList<StoreCommodityItem> createRepeated() =>
      $pb.PbList<StoreCommodityItem>();
  @$core.pragma('dart2js:noInline')
  static StoreCommodityItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreCommodityItem>(create);
  static StoreCommodityItem? _defaultInstance;

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
  $core.int get groupId => $_getIZ(1);
  @$pb.TagNumber(2)
  set groupId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupId() => clearField(2);

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
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get typeName => $_getSZ(4);
  @$pb.TagNumber(5)
  set typeName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTypeName() => $_has(4);
  @$pb.TagNumber(5)
  void clearTypeName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get subType => $_getSZ(5);
  @$pb.TagNumber(6)
  set subType($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSubType() => $_has(5);
  @$pb.TagNumber(6)
  void clearSubType() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get price => $_getIZ(6);
  @$pb.TagNumber(7)
  set price($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearPrice() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get moneyType => $_getSZ(7);
  @$pb.TagNumber(8)
  set moneyType($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMoneyType() => $_has(7);
  @$pb.TagNumber(8)
  void clearMoneyType() => clearField(8);

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
  $core.int get limited => $_getIZ(12);
  @$pb.TagNumber(13)
  set limited($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasLimited() => $_has(12);
  @$pb.TagNumber(13)
  void clearLimited() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get cornerIcon => $_getSZ(13);
  @$pb.TagNumber(14)
  set cornerIcon($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasCornerIcon() => $_has(13);
  @$pb.TagNumber(14)
  void clearCornerIcon() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get cornerDesc => $_getSZ(14);
  @$pb.TagNumber(15)
  set cornerDesc($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasCornerDesc() => $_has(14);
  @$pb.TagNumber(15)
  void clearCornerDesc() => clearField(15);

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
  $core.String get grade => $_getSZ(16);
  @$pb.TagNumber(17)
  set grade($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasGrade() => $_has(16);
  @$pb.TagNumber(17)
  void clearGrade() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get gradeIcon => $_getSZ(17);
  @$pb.TagNumber(18)
  set gradeIcon($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasGradeIcon() => $_has(17);
  @$pb.TagNumber(18)
  void clearGradeIcon() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get numTotal => $_getIZ(18);
  @$pb.TagNumber(19)
  set numTotal($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasNumTotal() => $_has(18);
  @$pb.TagNumber(19)
  void clearNumTotal() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get numStock => $_getIZ(19);
  @$pb.TagNumber(20)
  set numStock($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasNumStock() => $_has(19);
  @$pb.TagNumber(20)
  void clearNumStock() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get partition => $_getSZ(20);
  @$pb.TagNumber(21)
  set partition($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasPartition() => $_has(20);
  @$pb.TagNumber(21)
  void clearPartition() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get bubbleDesc => $_getSZ(21);
  @$pb.TagNumber(22)
  set bubbleDesc($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasBubbleDesc() => $_has(21);
  @$pb.TagNumber(22)
  void clearBubbleDesc() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get bubbleFontColor => $_getSZ(22);
  @$pb.TagNumber(23)
  set bubbleFontColor($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasBubbleFontColor() => $_has(22);
  @$pb.TagNumber(23)
  void clearBubbleFontColor() => clearField(23);

  @$pb.TagNumber(24)
  StoreCommodityProfile get owner => $_getN(23);
  @$pb.TagNumber(24)
  set owner(StoreCommodityProfile v) {
    setField(24, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasOwner() => $_has(23);
  @$pb.TagNumber(24)
  void clearOwner() => clearField(24);
  @$pb.TagNumber(24)
  StoreCommodityProfile ensureOwner() => $_ensure(23);

  @$pb.TagNumber(25)
  $core.int get limitedPrice => $_getIZ(24);
  @$pb.TagNumber(25)
  set limitedPrice($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasLimitedPrice() => $_has(24);
  @$pb.TagNumber(25)
  void clearLimitedPrice() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get ductionRate => $_getIZ(25);
  @$pb.TagNumber(26)
  set ductionRate($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasDuctionRate() => $_has(25);
  @$pb.TagNumber(26)
  void clearDuctionRate() => clearField(26);

  @$pb.TagNumber(27)
  $core.String get grantWay => $_getSZ(26);
  @$pb.TagNumber(27)
  set grantWay($core.String v) {
    $_setString(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasGrantWay() => $_has(26);
  @$pb.TagNumber(27)
  void clearGrantWay() => clearField(27);

  @$pb.TagNumber(28)
  $core.String get grantLimit => $_getSZ(27);
  @$pb.TagNumber(28)
  set grantLimit($core.String v) {
    $_setString(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasGrantLimit() => $_has(27);
  @$pb.TagNumber(28)
  void clearGrantLimit() => clearField(28);

  @$pb.TagNumber(29)
  $core.String get jumpType => $_getSZ(28);
  @$pb.TagNumber(29)
  set jumpType($core.String v) {
    $_setString(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasJumpType() => $_has(28);
  @$pb.TagNumber(29)
  void clearJumpType() => clearField(29);

  @$pb.TagNumber(30)
  $core.String get jumpUrl => $_getSZ(29);
  @$pb.TagNumber(30)
  set jumpUrl($core.String v) {
    $_setString(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasJumpUrl() => $_has(29);
  @$pb.TagNumber(30)
  void clearJumpUrl() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get lightScore => $_getIZ(30);
  @$pb.TagNumber(31)
  set lightScore($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasLightScore() => $_has(30);
  @$pb.TagNumber(31)
  void clearLightScore() => clearField(31);

  @$pb.TagNumber(32)
  $core.int get salingOnShop => $_getIZ(31);
  @$pb.TagNumber(32)
  set salingOnShop($core.int v) {
    $_setSignedInt32(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasSalingOnShop() => $_has(31);
  @$pb.TagNumber(32)
  void clearSalingOnShop() => clearField(32);
}

class StoreCommodityList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoreCommodityList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<StoreCategoryEntity>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'entity',
        subBuilder: StoreCategoryEntity.create)
    ..pc<StoreCommodityItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: StoreCommodityItem.create)
    ..hasRequiredFields = false;

  StoreCommodityList._() : super();
  factory StoreCommodityList({
    StoreCategoryEntity? entity,
    $core.Iterable<StoreCommodityItem>? list,
  }) {
    final _result = create();
    if (entity != null) {
      _result.entity = entity;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory StoreCommodityList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoreCommodityList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoreCommodityList clone() => StoreCommodityList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoreCommodityList copyWith(void Function(StoreCommodityList) updates) =>
      super.copyWith((message) => updates(message as StoreCommodityList))
          as StoreCommodityList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreCommodityList create() => StoreCommodityList._();
  StoreCommodityList createEmptyInstance() => create();
  static $pb.PbList<StoreCommodityList> createRepeated() =>
      $pb.PbList<StoreCommodityList>();
  @$core.pragma('dart2js:noInline')
  static StoreCommodityList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreCommodityList>(create);
  static StoreCommodityList? _defaultInstance;

  @$pb.TagNumber(1)
  StoreCategoryEntity get entity => $_getN(0);
  @$pb.TagNumber(1)
  set entity(StoreCategoryEntity v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEntity() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntity() => clearField(1);
  @$pb.TagNumber(1)
  StoreCategoryEntity ensureEntity() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<StoreCommodityItem> get list => $_getList(1);
}

class StoreCategoryEntity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoreCategoryEntity',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'page')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'descIcon')
    ..hasRequiredFields = false;

  StoreCategoryEntity._() : super();
  factory StoreCategoryEntity({
    $core.String? category,
    $core.String? page,
    $core.String? url,
    $core.String? desc,
    $core.String? descIcon,
  }) {
    final _result = create();
    if (category != null) {
      _result.category = category;
    }
    if (page != null) {
      _result.page = page;
    }
    if (url != null) {
      _result.url = url;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (descIcon != null) {
      _result.descIcon = descIcon;
    }
    return _result;
  }
  factory StoreCategoryEntity.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoreCategoryEntity.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoreCategoryEntity clone() => StoreCategoryEntity()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoreCategoryEntity copyWith(void Function(StoreCategoryEntity) updates) =>
      super.copyWith((message) => updates(message as StoreCategoryEntity))
          as StoreCategoryEntity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreCategoryEntity create() => StoreCategoryEntity._();
  StoreCategoryEntity createEmptyInstance() => create();
  static $pb.PbList<StoreCategoryEntity> createRepeated() =>
      $pb.PbList<StoreCategoryEntity>();
  @$core.pragma('dart2js:noInline')
  static StoreCategoryEntity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreCategoryEntity>(create);
  static StoreCategoryEntity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get category => $_getSZ(0);
  @$pb.TagNumber(1)
  set category($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCategory() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategory() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get page => $_getSZ(1);
  @$pb.TagNumber(2)
  set page($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get descIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set descIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDescIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescIcon() => clearField(5);
}

enum StoreListItem_Item { commodity, category, notSet }

class StoreListItem extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, StoreListItem_Item>
      _StoreListItem_ItemByTag = {
    1: StoreListItem_Item.commodity,
    2: StoreListItem_Item.category,
    0: StoreListItem_Item.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoreListItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<StoreCommodityItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodity',
        subBuilder: StoreCommodityItem.create)
    ..aOM<StoreCategoryEntity>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category',
        subBuilder: StoreCategoryEntity.create)
    ..hasRequiredFields = false;

  StoreListItem._() : super();
  factory StoreListItem({
    StoreCommodityItem? commodity,
    StoreCategoryEntity? category,
  }) {
    final _result = create();
    if (commodity != null) {
      _result.commodity = commodity;
    }
    if (category != null) {
      _result.category = category;
    }
    return _result;
  }
  factory StoreListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoreListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoreListItem clone() => StoreListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoreListItem copyWith(void Function(StoreListItem) updates) =>
      super.copyWith((message) => updates(message as StoreListItem))
          as StoreListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreListItem create() => StoreListItem._();
  StoreListItem createEmptyInstance() => create();
  static $pb.PbList<StoreListItem> createRepeated() =>
      $pb.PbList<StoreListItem>();
  @$core.pragma('dart2js:noInline')
  static StoreListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreListItem>(create);
  static StoreListItem? _defaultInstance;

  StoreListItem_Item whichItem() => _StoreListItem_ItemByTag[$_whichOneof(0)]!;
  void clearItem() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  StoreCommodityItem get commodity => $_getN(0);
  @$pb.TagNumber(1)
  set commodity(StoreCommodityItem v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCommodity() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommodity() => clearField(1);
  @$pb.TagNumber(1)
  StoreCommodityItem ensureCommodity() => $_ensure(0);

  @$pb.TagNumber(2)
  StoreCategoryEntity get category => $_getN(1);
  @$pb.TagNumber(2)
  set category(StoreCategoryEntity v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategory() => clearField(2);
  @$pb.TagNumber(2)
  StoreCategoryEntity ensureCategory() => $_ensure(1);
}

class StoreListParams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoreListParams',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'offset',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'limit',
        $pb.PbFieldType.O3)
    ..pc<StoreWhere>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'storeWhere',
        $pb.PbFieldType.PM,
        subBuilder: StoreWhere.create)
    ..hasRequiredFields = false;

  StoreListParams._() : super();
  factory StoreListParams({
    $core.String? category,
    $core.int? offset,
    $core.int? limit,
    $core.Iterable<StoreWhere>? storeWhere,
  }) {
    final _result = create();
    if (category != null) {
      _result.category = category;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (storeWhere != null) {
      _result.storeWhere.addAll(storeWhere);
    }
    return _result;
  }
  factory StoreListParams.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoreListParams.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoreListParams clone() => StoreListParams()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoreListParams copyWith(void Function(StoreListParams) updates) =>
      super.copyWith((message) => updates(message as StoreListParams))
          as StoreListParams; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreListParams create() => StoreListParams._();
  StoreListParams createEmptyInstance() => create();
  static $pb.PbList<StoreListParams> createRepeated() =>
      $pb.PbList<StoreListParams>();
  @$core.pragma('dart2js:noInline')
  static StoreListParams getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreListParams>(create);
  static StoreListParams? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get category => $_getSZ(0);
  @$pb.TagNumber(1)
  set category($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCategory() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategory() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get offset => $_getIZ(1);
  @$pb.TagNumber(2)
  set offset($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get limit => $_getIZ(2);
  @$pb.TagNumber(3)
  set limit($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<StoreWhere> get storeWhere => $_getList(3);
}

class ReqStoreList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqStoreList',
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
    ..aOM<StoreListParams>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'params',
        subBuilder: StoreListParams.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'package')
    ..hasRequiredFields = false;

  ReqStoreList._() : super();
  factory ReqStoreList({
    $core.int? uid,
    StoreListParams? params,
    $core.String? package,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (params != null) {
      _result.params = params;
    }
    if (package != null) {
      _result.package = package;
    }
    return _result;
  }
  factory ReqStoreList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqStoreList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqStoreList clone() => ReqStoreList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqStoreList copyWith(void Function(ReqStoreList) updates) =>
      super.copyWith((message) => updates(message as ReqStoreList))
          as ReqStoreList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqStoreList create() => ReqStoreList._();
  ReqStoreList createEmptyInstance() => create();
  static $pb.PbList<ReqStoreList> createRepeated() =>
      $pb.PbList<ReqStoreList>();
  @$core.pragma('dart2js:noInline')
  static ReqStoreList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqStoreList>(create);
  static ReqStoreList? _defaultInstance;

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
  StoreListParams get params => $_getN(1);
  @$pb.TagNumber(2)
  set params(StoreListParams v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasParams() => $_has(1);
  @$pb.TagNumber(2)
  void clearParams() => clearField(2);
  @$pb.TagNumber(2)
  StoreListParams ensureParams() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get package => $_getSZ(2);
  @$pb.TagNumber(3)
  set package($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPackage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPackage() => clearField(3);
}

class RspStoreList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspStoreList',
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
            : 'url')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'page')
    ..pc<StoreListItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: StoreListItem.create)
    ..hasRequiredFields = false;

  RspStoreList._() : super();
  factory RspStoreList({
    $core.String? name,
    $core.String? url,
    $core.String? desc,
    $core.String? page,
    $core.Iterable<StoreListItem>? list,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (url != null) {
      _result.url = url;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (page != null) {
      _result.page = page;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory RspStoreList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspStoreList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspStoreList clone() => RspStoreList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspStoreList copyWith(void Function(RspStoreList) updates) =>
      super.copyWith((message) => updates(message as RspStoreList))
          as RspStoreList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspStoreList create() => RspStoreList._();
  RspStoreList createEmptyInstance() => create();
  static $pb.PbList<RspStoreList> createRepeated() =>
      $pb.PbList<RspStoreList>();
  @$core.pragma('dart2js:noInline')
  static RspStoreList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RspStoreList>(create);
  static RspStoreList? _defaultInstance;

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
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

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

  @$pb.TagNumber(4)
  $core.String get page => $_getSZ(3);
  @$pb.TagNumber(4)
  set page($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPage() => $_has(3);
  @$pb.TagNumber(4)
  void clearPage() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<StoreListItem> get list => $_getList(4);
}

class ReqStoreMultiList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqStoreMultiList',
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
    ..pc<StoreListParams>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'categories',
        $pb.PbFieldType.PM,
        subBuilder: StoreListParams.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'package')
    ..hasRequiredFields = false;

  ReqStoreMultiList._() : super();
  factory ReqStoreMultiList({
    $core.int? uid,
    $core.Iterable<StoreListParams>? categories,
    $core.String? package,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (categories != null) {
      _result.categories.addAll(categories);
    }
    if (package != null) {
      _result.package = package;
    }
    return _result;
  }
  factory ReqStoreMultiList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqStoreMultiList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqStoreMultiList clone() => ReqStoreMultiList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqStoreMultiList copyWith(void Function(ReqStoreMultiList) updates) =>
      super.copyWith((message) => updates(message as ReqStoreMultiList))
          as ReqStoreMultiList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqStoreMultiList create() => ReqStoreMultiList._();
  ReqStoreMultiList createEmptyInstance() => create();
  static $pb.PbList<ReqStoreMultiList> createRepeated() =>
      $pb.PbList<ReqStoreMultiList>();
  @$core.pragma('dart2js:noInline')
  static ReqStoreMultiList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqStoreMultiList>(create);
  static ReqStoreMultiList? _defaultInstance;

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
  $core.List<StoreListParams> get categories => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get package => $_getSZ(2);
  @$pb.TagNumber(3)
  set package($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPackage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPackage() => clearField(3);
}

class RspStoreMultiList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspStoreMultiList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<RspStoreList>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'multi',
        $pb.PbFieldType.PM,
        subBuilder: RspStoreList.create)
    ..hasRequiredFields = false;

  RspStoreMultiList._() : super();
  factory RspStoreMultiList({
    $core.Iterable<RspStoreList>? multi,
  }) {
    final _result = create();
    if (multi != null) {
      _result.multi.addAll(multi);
    }
    return _result;
  }
  factory RspStoreMultiList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspStoreMultiList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspStoreMultiList clone() => RspStoreMultiList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspStoreMultiList copyWith(void Function(RspStoreMultiList) updates) =>
      super.copyWith((message) => updates(message as RspStoreMultiList))
          as RspStoreMultiList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspStoreMultiList create() => RspStoreMultiList._();
  RspStoreMultiList createEmptyInstance() => create();
  static $pb.PbList<RspStoreMultiList> createRepeated() =>
      $pb.PbList<RspStoreMultiList>();
  @$core.pragma('dart2js:noInline')
  static RspStoreMultiList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RspStoreMultiList>(create);
  static RspStoreMultiList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RspStoreList> get multi => $_getList(0);
}

class ReqStoreGoodsProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqStoreGoodsProfile',
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
            : 'cid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ReqStoreGoodsProfile._() : super();
  factory ReqStoreGoodsProfile({
    $core.int? uid,
    $core.int? cid,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    return _result;
  }
  factory ReqStoreGoodsProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqStoreGoodsProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqStoreGoodsProfile clone() =>
      ReqStoreGoodsProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqStoreGoodsProfile copyWith(void Function(ReqStoreGoodsProfile) updates) =>
      super.copyWith((message) => updates(message as ReqStoreGoodsProfile))
          as ReqStoreGoodsProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqStoreGoodsProfile create() => ReqStoreGoodsProfile._();
  ReqStoreGoodsProfile createEmptyInstance() => create();
  static $pb.PbList<ReqStoreGoodsProfile> createRepeated() =>
      $pb.PbList<ReqStoreGoodsProfile>();
  @$core.pragma('dart2js:noInline')
  static ReqStoreGoodsProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqStoreGoodsProfile>(create);
  static ReqStoreGoodsProfile? _defaultInstance;

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
  $core.int get cid => $_getIZ(1);
  @$pb.TagNumber(2)
  set cid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => clearField(2);
}

class RspStoreGoodsProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspStoreGoodsProfile',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<StoreCommodityItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodity',
        subBuilder: StoreCommodityItem.create)
    ..hasRequiredFields = false;

  RspStoreGoodsProfile._() : super();
  factory RspStoreGoodsProfile({
    StoreCommodityItem? commodity,
  }) {
    final _result = create();
    if (commodity != null) {
      _result.commodity = commodity;
    }
    return _result;
  }
  factory RspStoreGoodsProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspStoreGoodsProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspStoreGoodsProfile clone() =>
      RspStoreGoodsProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspStoreGoodsProfile copyWith(void Function(RspStoreGoodsProfile) updates) =>
      super.copyWith((message) => updates(message as RspStoreGoodsProfile))
          as RspStoreGoodsProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspStoreGoodsProfile create() => RspStoreGoodsProfile._();
  RspStoreGoodsProfile createEmptyInstance() => create();
  static $pb.PbList<RspStoreGoodsProfile> createRepeated() =>
      $pb.PbList<RspStoreGoodsProfile>();
  @$core.pragma('dart2js:noInline')
  static RspStoreGoodsProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RspStoreGoodsProfile>(create);
  static RspStoreGoodsProfile? _defaultInstance;

  @$pb.TagNumber(1)
  StoreCommodityItem get commodity => $_getN(0);
  @$pb.TagNumber(1)
  set commodity(StoreCommodityItem v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCommodity() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommodity() => clearField(1);
  @$pb.TagNumber(1)
  StoreCommodityItem ensureCommodity() => $_ensure(0);
}

class ApiStoreIndexResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiStoreIndexResponse',
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
    ..aOM<StoreIndexData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: StoreIndexData.create)
    ..hasRequiredFields = false;

  ApiStoreIndexResponse._() : super();
  factory ApiStoreIndexResponse({
    $core.bool? success,
    $core.String? message,
    StoreIndexData? data,
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
  factory ApiStoreIndexResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiStoreIndexResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiStoreIndexResponse clone() =>
      ApiStoreIndexResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiStoreIndexResponse copyWith(
          void Function(ApiStoreIndexResponse) updates) =>
      super.copyWith((message) => updates(message as ApiStoreIndexResponse))
          as ApiStoreIndexResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiStoreIndexResponse create() => ApiStoreIndexResponse._();
  ApiStoreIndexResponse createEmptyInstance() => create();
  static $pb.PbList<ApiStoreIndexResponse> createRepeated() =>
      $pb.PbList<ApiStoreIndexResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiStoreIndexResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiStoreIndexResponse>(create);
  static ApiStoreIndexResponse? _defaultInstance;

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
  StoreIndexData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(StoreIndexData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  StoreIndexData ensureData() => $_ensure(2);
}

class StoreIndexData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoreIndexData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<StoreCategoryEntity>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: StoreCategoryEntity.create)
    ..hasRequiredFields = false;

  StoreIndexData._() : super();
  factory StoreIndexData({
    $core.Iterable<StoreCategoryEntity>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory StoreIndexData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoreIndexData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoreIndexData clone() => StoreIndexData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoreIndexData copyWith(void Function(StoreIndexData) updates) =>
      super.copyWith((message) => updates(message as StoreIndexData))
          as StoreIndexData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreIndexData create() => StoreIndexData._();
  StoreIndexData createEmptyInstance() => create();
  static $pb.PbList<StoreIndexData> createRepeated() =>
      $pb.PbList<StoreIndexData>();
  @$core.pragma('dart2js:noInline')
  static StoreIndexData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreIndexData>(create);
  static StoreIndexData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<StoreCategoryEntity> get list => $_getList(0);
}

class ApiStorePageResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiStorePageResponse',
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
    ..aOM<StorePageData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: StorePageData.create)
    ..hasRequiredFields = false;

  ApiStorePageResponse._() : super();
  factory ApiStorePageResponse({
    $core.bool? success,
    $core.String? message,
    StorePageData? data,
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
  factory ApiStorePageResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiStorePageResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiStorePageResponse clone() =>
      ApiStorePageResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiStorePageResponse copyWith(void Function(ApiStorePageResponse) updates) =>
      super.copyWith((message) => updates(message as ApiStorePageResponse))
          as ApiStorePageResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiStorePageResponse create() => ApiStorePageResponse._();
  ApiStorePageResponse createEmptyInstance() => create();
  static $pb.PbList<ApiStorePageResponse> createRepeated() =>
      $pb.PbList<ApiStorePageResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiStorePageResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiStorePageResponse>(create);
  static ApiStorePageResponse? _defaultInstance;

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
  StorePageData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(StorePageData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  StorePageData ensureData() => $_ensure(2);
}

class StoreGradeConfigItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoreGradeConfigItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grade')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gradeIcon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gradeName')
    ..hasRequiredFields = false;

  StoreGradeConfigItem._() : super();
  factory StoreGradeConfigItem({
    $core.String? grade,
    $core.String? gradeIcon,
    $core.String? gradeName,
  }) {
    final _result = create();
    if (grade != null) {
      _result.grade = grade;
    }
    if (gradeIcon != null) {
      _result.gradeIcon = gradeIcon;
    }
    if (gradeName != null) {
      _result.gradeName = gradeName;
    }
    return _result;
  }
  factory StoreGradeConfigItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoreGradeConfigItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoreGradeConfigItem clone() =>
      StoreGradeConfigItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoreGradeConfigItem copyWith(void Function(StoreGradeConfigItem) updates) =>
      super.copyWith((message) => updates(message as StoreGradeConfigItem))
          as StoreGradeConfigItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreGradeConfigItem create() => StoreGradeConfigItem._();
  StoreGradeConfigItem createEmptyInstance() => create();
  static $pb.PbList<StoreGradeConfigItem> createRepeated() =>
      $pb.PbList<StoreGradeConfigItem>();
  @$core.pragma('dart2js:noInline')
  static StoreGradeConfigItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreGradeConfigItem>(create);
  static StoreGradeConfigItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get grade => $_getSZ(0);
  @$pb.TagNumber(1)
  set grade($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGrade() => $_has(0);
  @$pb.TagNumber(1)
  void clearGrade() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get gradeIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set gradeIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGradeIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearGradeIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get gradeName => $_getSZ(2);
  @$pb.TagNumber(3)
  set gradeName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGradeName() => $_has(2);
  @$pb.TagNumber(3)
  void clearGradeName() => clearField(3);
}

class StoreGradeConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoreGradeConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<StoreGradeConfigItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'config',
        $pb.PbFieldType.PM,
        subBuilder: StoreGradeConfigItem.create)
    ..hasRequiredFields = false;

  StoreGradeConfig._() : super();
  factory StoreGradeConfig({
    $core.Iterable<StoreGradeConfigItem>? config,
  }) {
    final _result = create();
    if (config != null) {
      _result.config.addAll(config);
    }
    return _result;
  }
  factory StoreGradeConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoreGradeConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoreGradeConfig clone() => StoreGradeConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoreGradeConfig copyWith(void Function(StoreGradeConfig) updates) =>
      super.copyWith((message) => updates(message as StoreGradeConfig))
          as StoreGradeConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreGradeConfig create() => StoreGradeConfig._();
  StoreGradeConfig createEmptyInstance() => create();
  static $pb.PbList<StoreGradeConfig> createRepeated() =>
      $pb.PbList<StoreGradeConfig>();
  @$core.pragma('dart2js:noInline')
  static StoreGradeConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreGradeConfig>(create);
  static StoreGradeConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<StoreGradeConfigItem> get config => $_getList(0);
}

class StorePageData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StorePageData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'page')
    ..pc<StoreCommodityList>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partition',
        $pb.PbFieldType.PM,
        subBuilder: StoreCommodityList.create)
    ..pc<StoreCategoryEntity>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subCategory',
        $pb.PbFieldType.PM,
        protoName: 'subCategory',
        subBuilder: StoreCategoryEntity.create)
    ..aOM<StoreCommodityList>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'limited',
        subBuilder: StoreCommodityList.create)
    ..aOM<StoreCommodityList>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        subBuilder: StoreCommodityList.create)
    ..aOM<StoreGradeConfig>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gradeConfig',
        subBuilder: StoreGradeConfig.create)
    ..aOM<StoreCommodityList>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        subBuilder: StoreCommodityList.create)
    ..aOM<StoreCommodityList>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'discount',
        subBuilder: StoreCommodityList.create)
    ..hasRequiredFields = false;

  StorePageData._() : super();
  factory StorePageData({
    $core.String? page,
    $core.Iterable<StoreCommodityList>? partition,
    $core.Iterable<StoreCategoryEntity>? subCategory,
    StoreCommodityList? limited,
    StoreCommodityList? vip,
    StoreGradeConfig? gradeConfig,
    StoreCommodityList? title,
    StoreCommodityList? discount,
  }) {
    final _result = create();
    if (page != null) {
      _result.page = page;
    }
    if (partition != null) {
      _result.partition.addAll(partition);
    }
    if (subCategory != null) {
      _result.subCategory.addAll(subCategory);
    }
    if (limited != null) {
      _result.limited = limited;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (gradeConfig != null) {
      _result.gradeConfig = gradeConfig;
    }
    if (title != null) {
      _result.title = title;
    }
    if (discount != null) {
      _result.discount = discount;
    }
    return _result;
  }
  factory StorePageData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StorePageData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StorePageData clone() => StorePageData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StorePageData copyWith(void Function(StorePageData) updates) =>
      super.copyWith((message) => updates(message as StorePageData))
          as StorePageData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StorePageData create() => StorePageData._();
  StorePageData createEmptyInstance() => create();
  static $pb.PbList<StorePageData> createRepeated() =>
      $pb.PbList<StorePageData>();
  @$core.pragma('dart2js:noInline')
  static StorePageData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StorePageData>(create);
  static StorePageData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get page => $_getSZ(0);
  @$pb.TagNumber(1)
  set page($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<StoreCommodityList> get partition => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<StoreCategoryEntity> get subCategory => $_getList(2);

  @$pb.TagNumber(4)
  StoreCommodityList get limited => $_getN(3);
  @$pb.TagNumber(4)
  set limited(StoreCommodityList v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLimited() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimited() => clearField(4);
  @$pb.TagNumber(4)
  StoreCommodityList ensureLimited() => $_ensure(3);

  @$pb.TagNumber(5)
  StoreCommodityList get vip => $_getN(4);
  @$pb.TagNumber(5)
  set vip(StoreCommodityList v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasVip() => $_has(4);
  @$pb.TagNumber(5)
  void clearVip() => clearField(5);
  @$pb.TagNumber(5)
  StoreCommodityList ensureVip() => $_ensure(4);

  @$pb.TagNumber(6)
  StoreGradeConfig get gradeConfig => $_getN(5);
  @$pb.TagNumber(6)
  set gradeConfig(StoreGradeConfig v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGradeConfig() => $_has(5);
  @$pb.TagNumber(6)
  void clearGradeConfig() => clearField(6);
  @$pb.TagNumber(6)
  StoreGradeConfig ensureGradeConfig() => $_ensure(5);

  @$pb.TagNumber(7)
  StoreCommodityList get title => $_getN(6);
  @$pb.TagNumber(7)
  set title(StoreCommodityList v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTitle() => $_has(6);
  @$pb.TagNumber(7)
  void clearTitle() => clearField(7);
  @$pb.TagNumber(7)
  StoreCommodityList ensureTitle() => $_ensure(6);

  @$pb.TagNumber(8)
  StoreCommodityList get discount => $_getN(7);
  @$pb.TagNumber(8)
  set discount(StoreCommodityList v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDiscount() => $_has(7);
  @$pb.TagNumber(8)
  void clearDiscount() => clearField(8);
  @$pb.TagNumber(8)
  StoreCommodityList ensureDiscount() => $_ensure(7);
}

class ApiStoreGoodsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiStoreGoodsResponse',
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
    ..aOM<StoreGoodsData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: StoreGoodsData.create)
    ..hasRequiredFields = false;

  ApiStoreGoodsResponse._() : super();
  factory ApiStoreGoodsResponse({
    $core.bool? success,
    $core.String? message,
    StoreGoodsData? data,
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
  factory ApiStoreGoodsResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiStoreGoodsResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiStoreGoodsResponse clone() =>
      ApiStoreGoodsResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiStoreGoodsResponse copyWith(
          void Function(ApiStoreGoodsResponse) updates) =>
      super.copyWith((message) => updates(message as ApiStoreGoodsResponse))
          as ApiStoreGoodsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiStoreGoodsResponse create() => ApiStoreGoodsResponse._();
  ApiStoreGoodsResponse createEmptyInstance() => create();
  static $pb.PbList<ApiStoreGoodsResponse> createRepeated() =>
      $pb.PbList<ApiStoreGoodsResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiStoreGoodsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiStoreGoodsResponse>(create);
  static ApiStoreGoodsResponse? _defaultInstance;

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
  StoreGoodsData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(StoreGoodsData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  StoreGoodsData ensureData() => $_ensure(2);
}

class StoreGoodsData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoreGoodsData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  StoreGoodsData._() : super();
  factory StoreGoodsData() => create();
  factory StoreGoodsData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoreGoodsData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoreGoodsData clone() => StoreGoodsData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoreGoodsData copyWith(void Function(StoreGoodsData) updates) =>
      super.copyWith((message) => updates(message as StoreGoodsData))
          as StoreGoodsData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreGoodsData create() => StoreGoodsData._();
  StoreGoodsData createEmptyInstance() => create();
  static $pb.PbList<StoreGoodsData> createRepeated() =>
      $pb.PbList<StoreGoodsData>();
  @$core.pragma('dart2js:noInline')
  static StoreGoodsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreGoodsData>(create);
  static StoreGoodsData? _defaultInstance;
}

class ApiStoreEntranceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiStoreEntranceResponse',
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
    ..aOM<StoreEntranceData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: StoreEntranceData.create)
    ..hasRequiredFields = false;

  ApiStoreEntranceResponse._() : super();
  factory ApiStoreEntranceResponse({
    $core.bool? success,
    $core.String? message,
    StoreEntranceData? data,
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
  factory ApiStoreEntranceResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiStoreEntranceResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiStoreEntranceResponse clone() =>
      ApiStoreEntranceResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiStoreEntranceResponse copyWith(
          void Function(ApiStoreEntranceResponse) updates) =>
      super.copyWith((message) => updates(message as ApiStoreEntranceResponse))
          as ApiStoreEntranceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiStoreEntranceResponse create() => ApiStoreEntranceResponse._();
  ApiStoreEntranceResponse createEmptyInstance() => create();
  static $pb.PbList<ApiStoreEntranceResponse> createRepeated() =>
      $pb.PbList<ApiStoreEntranceResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiStoreEntranceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiStoreEntranceResponse>(create);
  static ApiStoreEntranceResponse? _defaultInstance;

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
  StoreEntranceData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(StoreEntranceData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  StoreEntranceData ensureData() => $_ensure(2);
}

class StoreEntranceData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoreEntranceData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'page')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grayOldStore',
        $pb.PbFieldType.OU3)
    ..pc<StoreCommodityItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: StoreCommodityItem.create)
    ..hasRequiredFields = false;

  StoreEntranceData._() : super();
  factory StoreEntranceData({
    $core.String? page,
    $core.int? grayOldStore,
    $core.Iterable<StoreCommodityItem>? list,
  }) {
    final _result = create();
    if (page != null) {
      _result.page = page;
    }
    if (grayOldStore != null) {
      _result.grayOldStore = grayOldStore;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory StoreEntranceData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoreEntranceData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoreEntranceData clone() => StoreEntranceData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoreEntranceData copyWith(void Function(StoreEntranceData) updates) =>
      super.copyWith((message) => updates(message as StoreEntranceData))
          as StoreEntranceData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreEntranceData create() => StoreEntranceData._();
  StoreEntranceData createEmptyInstance() => create();
  static $pb.PbList<StoreEntranceData> createRepeated() =>
      $pb.PbList<StoreEntranceData>();
  @$core.pragma('dart2js:noInline')
  static StoreEntranceData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreEntranceData>(create);
  static StoreEntranceData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get page => $_getSZ(0);
  @$pb.TagNumber(1)
  set page($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get grayOldStore => $_getIZ(1);
  @$pb.TagNumber(2)
  set grayOldStore($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGrayOldStore() => $_has(1);
  @$pb.TagNumber(2)
  void clearGrayOldStore() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<StoreCommodityItem> get list => $_getList(2);
}

class StoreWhere_SalingOnShopState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoreWhere.SalingOnShopState',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isSaling')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'SalingOnShop',
        $pb.PbFieldType.O3,
        protoName: 'SalingOnShop')
    ..hasRequiredFields = false;

  StoreWhere_SalingOnShopState._() : super();
  factory StoreWhere_SalingOnShopState({
    $core.bool? isSaling,
    $core.int? salingOnShop,
  }) {
    final _result = create();
    if (isSaling != null) {
      _result.isSaling = isSaling;
    }
    if (salingOnShop != null) {
      _result.salingOnShop = salingOnShop;
    }
    return _result;
  }
  factory StoreWhere_SalingOnShopState.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoreWhere_SalingOnShopState.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoreWhere_SalingOnShopState clone() =>
      StoreWhere_SalingOnShopState()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoreWhere_SalingOnShopState copyWith(
          void Function(StoreWhere_SalingOnShopState) updates) =>
      super.copyWith(
              (message) => updates(message as StoreWhere_SalingOnShopState))
          as StoreWhere_SalingOnShopState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreWhere_SalingOnShopState create() =>
      StoreWhere_SalingOnShopState._();
  StoreWhere_SalingOnShopState createEmptyInstance() => create();
  static $pb.PbList<StoreWhere_SalingOnShopState> createRepeated() =>
      $pb.PbList<StoreWhere_SalingOnShopState>();
  @$core.pragma('dart2js:noInline')
  static StoreWhere_SalingOnShopState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreWhere_SalingOnShopState>(create);
  static StoreWhere_SalingOnShopState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isSaling => $_getBF(0);
  @$pb.TagNumber(1)
  set isSaling($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIsSaling() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSaling() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get salingOnShop => $_getIZ(1);
  @$pb.TagNumber(2)
  set salingOnShop($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSalingOnShop() => $_has(1);
  @$pb.TagNumber(2)
  void clearSalingOnShop() => clearField(2);
}

class StoreWhere extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoreWhere',
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
            : 'subtype')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ductionRate',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nobility')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recommend')
    ..aOM<StoreWhere_SalingOnShopState>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'SalingOnShop',
        protoName: 'SalingOnShop',
        subBuilder: StoreWhere_SalingOnShopState.create)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  StoreWhere._() : super();
  factory StoreWhere({
    $core.String? type,
    $core.String? subtype,
    $core.int? ductionRate,
    $core.String? vip,
    $core.String? nobility,
    $core.String? recommend,
    StoreWhere_SalingOnShopState? salingOnShop,
    $core.int? tagId,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (subtype != null) {
      _result.subtype = subtype;
    }
    if (ductionRate != null) {
      _result.ductionRate = ductionRate;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (nobility != null) {
      _result.nobility = nobility;
    }
    if (recommend != null) {
      _result.recommend = recommend;
    }
    if (salingOnShop != null) {
      _result.salingOnShop = salingOnShop;
    }
    if (tagId != null) {
      _result.tagId = tagId;
    }
    return _result;
  }
  factory StoreWhere.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoreWhere.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoreWhere clone() => StoreWhere()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoreWhere copyWith(void Function(StoreWhere) updates) =>
      super.copyWith((message) => updates(message as StoreWhere))
          as StoreWhere; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreWhere create() => StoreWhere._();
  StoreWhere createEmptyInstance() => create();
  static $pb.PbList<StoreWhere> createRepeated() => $pb.PbList<StoreWhere>();
  @$core.pragma('dart2js:noInline')
  static StoreWhere getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreWhere>(create);
  static StoreWhere? _defaultInstance;

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
  $core.String get subtype => $_getSZ(1);
  @$pb.TagNumber(2)
  set subtype($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubtype() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubtype() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get ductionRate => $_getIZ(2);
  @$pb.TagNumber(3)
  set ductionRate($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDuctionRate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuctionRate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get vip => $_getSZ(3);
  @$pb.TagNumber(4)
  set vip($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVip() => $_has(3);
  @$pb.TagNumber(4)
  void clearVip() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get nobility => $_getSZ(4);
  @$pb.TagNumber(5)
  set nobility($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNobility() => $_has(4);
  @$pb.TagNumber(5)
  void clearNobility() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get recommend => $_getSZ(5);
  @$pb.TagNumber(6)
  set recommend($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRecommend() => $_has(5);
  @$pb.TagNumber(6)
  void clearRecommend() => clearField(6);

  @$pb.TagNumber(7)
  StoreWhere_SalingOnShopState get salingOnShop => $_getN(6);
  @$pb.TagNumber(7)
  set salingOnShop(StoreWhere_SalingOnShopState v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSalingOnShop() => $_has(6);
  @$pb.TagNumber(7)
  void clearSalingOnShop() => clearField(7);
  @$pb.TagNumber(7)
  StoreWhere_SalingOnShopState ensureSalingOnShop() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get tagId => $_getIZ(7);
  @$pb.TagNumber(8)
  set tagId($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTagId() => $_has(7);
  @$pb.TagNumber(8)
  void clearTagId() => clearField(8);
}

class ReqStoreMultiListCount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqStoreMultiListCount',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<StoreWhere>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'where',
        $pb.PbFieldType.PM,
        subBuilder: StoreWhere.create)
    ..hasRequiredFields = false;

  ReqStoreMultiListCount._() : super();
  factory ReqStoreMultiListCount({
    $core.Iterable<StoreWhere>? where,
  }) {
    final _result = create();
    if (where != null) {
      _result.where.addAll(where);
    }
    return _result;
  }
  factory ReqStoreMultiListCount.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqStoreMultiListCount.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqStoreMultiListCount clone() =>
      ReqStoreMultiListCount()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqStoreMultiListCount copyWith(
          void Function(ReqStoreMultiListCount) updates) =>
      super.copyWith((message) => updates(message as ReqStoreMultiListCount))
          as ReqStoreMultiListCount; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqStoreMultiListCount create() => ReqStoreMultiListCount._();
  ReqStoreMultiListCount createEmptyInstance() => create();
  static $pb.PbList<ReqStoreMultiListCount> createRepeated() =>
      $pb.PbList<ReqStoreMultiListCount>();
  @$core.pragma('dart2js:noInline')
  static ReqStoreMultiListCount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqStoreMultiListCount>(create);
  static ReqStoreMultiListCount? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<StoreWhere> get where => $_getList(0);
}

class RspStoreMultiListCount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspStoreMultiListCount',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..p<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count',
        $pb.PbFieldType.P3)
    ..hasRequiredFields = false;

  RspStoreMultiListCount._() : super();
  factory RspStoreMultiListCount({
    $core.Iterable<$core.int>? count,
  }) {
    final _result = create();
    if (count != null) {
      _result.count.addAll(count);
    }
    return _result;
  }
  factory RspStoreMultiListCount.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspStoreMultiListCount.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspStoreMultiListCount clone() =>
      RspStoreMultiListCount()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspStoreMultiListCount copyWith(
          void Function(RspStoreMultiListCount) updates) =>
      super.copyWith((message) => updates(message as RspStoreMultiListCount))
          as RspStoreMultiListCount; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspStoreMultiListCount create() => RspStoreMultiListCount._();
  RspStoreMultiListCount createEmptyInstance() => create();
  static $pb.PbList<RspStoreMultiListCount> createRepeated() =>
      $pb.PbList<RspStoreMultiListCount>();
  @$core.pragma('dart2js:noInline')
  static RspStoreMultiListCount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RspStoreMultiListCount>(create);
  static RspStoreMultiListCount? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.int> get count => $_getList(0);
}

class storeApi {
  $pb.RpcClient _client;
  storeApi(this._client);

  $async.Future<RspStoreList> list(
      $pb.ClientContext? ctx, ReqStoreList request) {
    var emptyResponse = RspStoreList();
    return _client.invoke<RspStoreList>(
        ctx, 'store', 'List', request, emptyResponse);
  }

  $async.Future<RspStoreMultiList> multiList(
      $pb.ClientContext? ctx, ReqStoreMultiList request) {
    var emptyResponse = RspStoreMultiList();
    return _client.invoke<RspStoreMultiList>(
        ctx, 'store', 'MultiList', request, emptyResponse);
  }

  $async.Future<RspStoreGoodsProfile> goodsProfile(
      $pb.ClientContext? ctx, ReqStoreGoodsProfile request) {
    var emptyResponse = RspStoreGoodsProfile();
    return _client.invoke<RspStoreGoodsProfile>(
        ctx, 'store', 'GoodsProfile', request, emptyResponse);
  }
}
