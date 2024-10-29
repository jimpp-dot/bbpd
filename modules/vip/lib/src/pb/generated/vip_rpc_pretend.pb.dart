///
//  Generated code. Do not modify.
//  source: vip_rpc_pretend.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class PretendCategory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendCategory',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sort',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PretendCategory._() : super();
  factory PretendCategory({
    $core.int? id,
    $core.String? name,
    $core.int? sort,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sort != null) {
      _result.sort = sort;
    }
    return _result;
  }
  factory PretendCategory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendCategory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendCategory clone() => PretendCategory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendCategory copyWith(void Function(PretendCategory) updates) =>
      super.copyWith((message) => updates(message as PretendCategory))
          as PretendCategory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendCategory create() => PretendCategory._();
  PretendCategory createEmptyInstance() => create();
  static $pb.PbList<PretendCategory> createRepeated() =>
      $pb.PbList<PretendCategory>();
  @$core.pragma('dart2js:noInline')
  static PretendCategory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendCategory>(create);
  static PretendCategory? _defaultInstance;

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(2)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get sort => $_getIZ(2);
  @$pb.TagNumber(4)
  set sort($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSort() => $_has(2);
  @$pb.TagNumber(4)
  void clearSort() => clearField(4);
}

class PretendGroupInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendGroupInfo',
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
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rechargeFragmentNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rechargeDays',
        $pb.PbFieldType.OU3)
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isHas')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'usePretendId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starNum',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'periodEnd',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'periodEndFmt')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'upStarFragmentNum',
        $pb.PbFieldType.OU3)
    ..aOB(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isUse')
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'useStarNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'useSex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sort',
        $pb.PbFieldType.OU3)
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gotUrl')
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'oneStarScore',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'twoStarScore',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'threeStarScore',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sexState',
        $pb.PbFieldType.OU3)
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gotType')
    ..hasRequiredFields = false;

  PretendGroupInfo._() : super();
  factory PretendGroupInfo({
    $core.int? id,
    $core.String? name,
    $core.String? icon,
    $core.int? rechargeFragmentNum,
    $core.int? rechargeDays,
    $core.bool? isHas,
    $core.int? usePretendId,
    $core.int? starNum,
    $fixnum.Int64? periodEnd,
    $core.String? periodEndFmt,
    $core.int? upStarFragmentNum,
    $core.bool? isUse,
    $core.int? useStarNum,
    $core.int? useSex,
    $core.int? sort,
    $core.String? gotUrl,
    $core.int? oneStarScore,
    $core.int? twoStarScore,
    $core.int? threeStarScore,
    $core.int? sexState,
    $core.String? gotType,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (rechargeFragmentNum != null) {
      _result.rechargeFragmentNum = rechargeFragmentNum;
    }
    if (rechargeDays != null) {
      _result.rechargeDays = rechargeDays;
    }
    if (isHas != null) {
      _result.isHas = isHas;
    }
    if (usePretendId != null) {
      _result.usePretendId = usePretendId;
    }
    if (starNum != null) {
      _result.starNum = starNum;
    }
    if (periodEnd != null) {
      _result.periodEnd = periodEnd;
    }
    if (periodEndFmt != null) {
      _result.periodEndFmt = periodEndFmt;
    }
    if (upStarFragmentNum != null) {
      _result.upStarFragmentNum = upStarFragmentNum;
    }
    if (isUse != null) {
      _result.isUse = isUse;
    }
    if (useStarNum != null) {
      _result.useStarNum = useStarNum;
    }
    if (useSex != null) {
      _result.useSex = useSex;
    }
    if (sort != null) {
      _result.sort = sort;
    }
    if (gotUrl != null) {
      _result.gotUrl = gotUrl;
    }
    if (oneStarScore != null) {
      _result.oneStarScore = oneStarScore;
    }
    if (twoStarScore != null) {
      _result.twoStarScore = twoStarScore;
    }
    if (threeStarScore != null) {
      _result.threeStarScore = threeStarScore;
    }
    if (sexState != null) {
      _result.sexState = sexState;
    }
    if (gotType != null) {
      _result.gotType = gotType;
    }
    return _result;
  }
  factory PretendGroupInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendGroupInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendGroupInfo clone() => PretendGroupInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendGroupInfo copyWith(void Function(PretendGroupInfo) updates) =>
      super.copyWith((message) => updates(message as PretendGroupInfo))
          as PretendGroupInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendGroupInfo create() => PretendGroupInfo._();
  PretendGroupInfo createEmptyInstance() => create();
  static $pb.PbList<PretendGroupInfo> createRepeated() =>
      $pb.PbList<PretendGroupInfo>();
  @$core.pragma('dart2js:noInline')
  static PretendGroupInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendGroupInfo>(create);
  static PretendGroupInfo? _defaultInstance;

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
  $core.int get rechargeFragmentNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set rechargeFragmentNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRechargeFragmentNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearRechargeFragmentNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get rechargeDays => $_getIZ(4);
  @$pb.TagNumber(5)
  set rechargeDays($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRechargeDays() => $_has(4);
  @$pb.TagNumber(5)
  void clearRechargeDays() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isHas => $_getBF(5);
  @$pb.TagNumber(6)
  set isHas($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIsHas() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsHas() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get usePretendId => $_getIZ(6);
  @$pb.TagNumber(7)
  set usePretendId($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUsePretendId() => $_has(6);
  @$pb.TagNumber(7)
  void clearUsePretendId() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get starNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set starNum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStarNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearStarNum() => clearField(8);

  @$pb.TagNumber(11)
  $fixnum.Int64 get periodEnd => $_getI64(8);
  @$pb.TagNumber(11)
  set periodEnd($fixnum.Int64 v) {
    $_setInt64(8, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPeriodEnd() => $_has(8);
  @$pb.TagNumber(11)
  void clearPeriodEnd() => clearField(11);

  @$pb.TagNumber(14)
  $core.String get periodEndFmt => $_getSZ(9);
  @$pb.TagNumber(14)
  set periodEndFmt($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasPeriodEndFmt() => $_has(9);
  @$pb.TagNumber(14)
  void clearPeriodEndFmt() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get upStarFragmentNum => $_getIZ(10);
  @$pb.TagNumber(15)
  set upStarFragmentNum($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasUpStarFragmentNum() => $_has(10);
  @$pb.TagNumber(15)
  void clearUpStarFragmentNum() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get isUse => $_getBF(11);
  @$pb.TagNumber(16)
  set isUse($core.bool v) {
    $_setBool(11, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasIsUse() => $_has(11);
  @$pb.TagNumber(16)
  void clearIsUse() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get useStarNum => $_getIZ(12);
  @$pb.TagNumber(17)
  set useStarNum($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasUseStarNum() => $_has(12);
  @$pb.TagNumber(17)
  void clearUseStarNum() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get useSex => $_getIZ(13);
  @$pb.TagNumber(18)
  set useSex($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasUseSex() => $_has(13);
  @$pb.TagNumber(18)
  void clearUseSex() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get sort => $_getIZ(14);
  @$pb.TagNumber(19)
  set sort($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasSort() => $_has(14);
  @$pb.TagNumber(19)
  void clearSort() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get gotUrl => $_getSZ(15);
  @$pb.TagNumber(20)
  set gotUrl($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasGotUrl() => $_has(15);
  @$pb.TagNumber(20)
  void clearGotUrl() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get oneStarScore => $_getIZ(16);
  @$pb.TagNumber(21)
  set oneStarScore($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasOneStarScore() => $_has(16);
  @$pb.TagNumber(21)
  void clearOneStarScore() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get twoStarScore => $_getIZ(17);
  @$pb.TagNumber(22)
  set twoStarScore($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasTwoStarScore() => $_has(17);
  @$pb.TagNumber(22)
  void clearTwoStarScore() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get threeStarScore => $_getIZ(18);
  @$pb.TagNumber(23)
  set threeStarScore($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasThreeStarScore() => $_has(18);
  @$pb.TagNumber(23)
  void clearThreeStarScore() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get sexState => $_getIZ(19);
  @$pb.TagNumber(24)
  set sexState($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasSexState() => $_has(19);
  @$pb.TagNumber(24)
  void clearSexState() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get gotType => $_getSZ(20);
  @$pb.TagNumber(25)
  set gotType($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasGotType() => $_has(20);
  @$pb.TagNumber(25)
  void clearGotType() => clearField(25);
}

class Mp4Source_ImageText extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Mp4Source.ImageText',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'text')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..hasRequiredFields = false;

  Mp4Source_ImageText._() : super();
  factory Mp4Source_ImageText({
    $core.String? text,
    $core.String? image,
  }) {
    final _result = create();
    if (text != null) {
      _result.text = text;
    }
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory Mp4Source_ImageText.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Mp4Source_ImageText.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Mp4Source_ImageText clone() => Mp4Source_ImageText()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Mp4Source_ImageText copyWith(void Function(Mp4Source_ImageText) updates) =>
      super.copyWith((message) => updates(message as Mp4Source_ImageText))
          as Mp4Source_ImageText; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Mp4Source_ImageText create() => Mp4Source_ImageText._();
  Mp4Source_ImageText createEmptyInstance() => create();
  static $pb.PbList<Mp4Source_ImageText> createRepeated() =>
      $pb.PbList<Mp4Source_ImageText>();
  @$core.pragma('dart2js:noInline')
  static Mp4Source_ImageText getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Mp4Source_ImageText>(create);
  static Mp4Source_ImageText? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(2)
  set image($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);
}

class Mp4Source extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Mp4Source',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapSize',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showType',
        $pb.PbFieldType.OU3)
    ..pc<Mp4Source_ImageText>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageText',
        $pb.PbFieldType.PM,
        subBuilder: Mp4Source_ImageText.create)
    ..hasRequiredFields = false;

  Mp4Source._() : super();
  factory Mp4Source({
    $core.String? url,
    $core.int? vapSize,
    $core.int? showType,
    $core.Iterable<Mp4Source_ImageText>? imageText,
  }) {
    final _result = create();
    if (url != null) {
      _result.url = url;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    if (showType != null) {
      _result.showType = showType;
    }
    if (imageText != null) {
      _result.imageText.addAll(imageText);
    }
    return _result;
  }
  factory Mp4Source.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Mp4Source.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Mp4Source clone() => Mp4Source()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Mp4Source copyWith(void Function(Mp4Source) updates) =>
      super.copyWith((message) => updates(message as Mp4Source))
          as Mp4Source; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Mp4Source create() => Mp4Source._();
  Mp4Source createEmptyInstance() => create();
  static $pb.PbList<Mp4Source> createRepeated() => $pb.PbList<Mp4Source>();
  @$core.pragma('dart2js:noInline')
  static Mp4Source getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Mp4Source>(create);
  static Mp4Source? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get vapSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set vapSize($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVapSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearVapSize() => clearField(2);

  @$pb.TagNumber(4)
  $core.int get showType => $_getIZ(2);
  @$pb.TagNumber(4)
  set showType($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasShowType() => $_has(2);
  @$pb.TagNumber(4)
  void clearShowType() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<Mp4Source_ImageText> get imageText => $_getList(3);
}

class PretendInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
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
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'urlSource')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'previewSource')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapSize',
        $pb.PbFieldType.OU3)
    ..aOB(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isLock')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extId',
        $pb.PbFieldType.OU3)
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fontColor')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cateId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..aOM<Mp4Source>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mp4Source',
        subBuilder: Mp4Source.create)
    ..hasRequiredFields = false;

  PretendInfo._() : super();
  factory PretendInfo({
    $core.int? id,
    $core.String? name,
    $core.int? sex,
    $core.int? starNum,
    $core.String? urlSource,
    $core.String? previewSource,
    $core.String? desc,
    $core.int? vapSize,
    $core.bool? isLock,
    $core.int? extId,
    $core.String? fontColor,
    $core.int? cateId,
    $core.int? groupId,
    Mp4Source? mp4Source,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (starNum != null) {
      _result.starNum = starNum;
    }
    if (urlSource != null) {
      _result.urlSource = urlSource;
    }
    if (previewSource != null) {
      _result.previewSource = previewSource;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    if (isLock != null) {
      _result.isLock = isLock;
    }
    if (extId != null) {
      _result.extId = extId;
    }
    if (fontColor != null) {
      _result.fontColor = fontColor;
    }
    if (cateId != null) {
      _result.cateId = cateId;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (mp4Source != null) {
      _result.mp4Source = mp4Source;
    }
    return _result;
  }
  factory PretendInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendInfo clone() => PretendInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendInfo copyWith(void Function(PretendInfo) updates) =>
      super.copyWith((message) => updates(message as PretendInfo))
          as PretendInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendInfo create() => PretendInfo._();
  PretendInfo createEmptyInstance() => create();
  static $pb.PbList<PretendInfo> createRepeated() => $pb.PbList<PretendInfo>();
  @$core.pragma('dart2js:noInline')
  static PretendInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendInfo>(create);
  static PretendInfo? _defaultInstance;

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(2)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get sex => $_getIZ(2);
  @$pb.TagNumber(4)
  set sex($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(2);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get starNum => $_getIZ(3);
  @$pb.TagNumber(5)
  set starNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStarNum() => $_has(3);
  @$pb.TagNumber(5)
  void clearStarNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get urlSource => $_getSZ(4);
  @$pb.TagNumber(6)
  set urlSource($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUrlSource() => $_has(4);
  @$pb.TagNumber(6)
  void clearUrlSource() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get previewSource => $_getSZ(5);
  @$pb.TagNumber(7)
  set previewSource($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPreviewSource() => $_has(5);
  @$pb.TagNumber(7)
  void clearPreviewSource() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get desc => $_getSZ(6);
  @$pb.TagNumber(8)
  set desc($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDesc() => $_has(6);
  @$pb.TagNumber(8)
  void clearDesc() => clearField(8);

  @$pb.TagNumber(10)
  $core.int get vapSize => $_getIZ(7);
  @$pb.TagNumber(10)
  set vapSize($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasVapSize() => $_has(7);
  @$pb.TagNumber(10)
  void clearVapSize() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isLock => $_getBF(8);
  @$pb.TagNumber(11)
  set isLock($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasIsLock() => $_has(8);
  @$pb.TagNumber(11)
  void clearIsLock() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get extId => $_getIZ(9);
  @$pb.TagNumber(12)
  set extId($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasExtId() => $_has(9);
  @$pb.TagNumber(12)
  void clearExtId() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get fontColor => $_getSZ(10);
  @$pb.TagNumber(13)
  set fontColor($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasFontColor() => $_has(10);
  @$pb.TagNumber(13)
  void clearFontColor() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get cateId => $_getIZ(11);
  @$pb.TagNumber(14)
  set cateId($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasCateId() => $_has(11);
  @$pb.TagNumber(14)
  void clearCateId() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get groupId => $_getIZ(12);
  @$pb.TagNumber(15)
  set groupId($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasGroupId() => $_has(12);
  @$pb.TagNumber(15)
  void clearGroupId() => clearField(15);

  @$pb.TagNumber(16)
  Mp4Source get mp4Source => $_getN(13);
  @$pb.TagNumber(16)
  set mp4Source(Mp4Source v) {
    setField(16, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasMp4Source() => $_has(13);
  @$pb.TagNumber(16)
  void clearMp4Source() => clearField(16);
  @$pb.TagNumber(16)
  Mp4Source ensureMp4Source() => $_ensure(13);
}

class PretendGroupDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendGroupDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<PretendGroupInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupInfo',
        subBuilder: PretendGroupInfo.create)
    ..pc<PretendInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pretendList',
        $pb.PbFieldType.PM,
        subBuilder: PretendInfo.create)
    ..hasRequiredFields = false;

  PretendGroupDetail._() : super();
  factory PretendGroupDetail({
    PretendGroupInfo? groupInfo,
    $core.Iterable<PretendInfo>? pretendList,
  }) {
    final _result = create();
    if (groupInfo != null) {
      _result.groupInfo = groupInfo;
    }
    if (pretendList != null) {
      _result.pretendList.addAll(pretendList);
    }
    return _result;
  }
  factory PretendGroupDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendGroupDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendGroupDetail clone() => PretendGroupDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendGroupDetail copyWith(void Function(PretendGroupDetail) updates) =>
      super.copyWith((message) => updates(message as PretendGroupDetail))
          as PretendGroupDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendGroupDetail create() => PretendGroupDetail._();
  PretendGroupDetail createEmptyInstance() => create();
  static $pb.PbList<PretendGroupDetail> createRepeated() =>
      $pb.PbList<PretendGroupDetail>();
  @$core.pragma('dart2js:noInline')
  static PretendGroupDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendGroupDetail>(create);
  static PretendGroupDetail? _defaultInstance;

  @$pb.TagNumber(1)
  PretendGroupInfo get groupInfo => $_getN(0);
  @$pb.TagNumber(1)
  set groupInfo(PretendGroupInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGroupInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupInfo() => clearField(1);
  @$pb.TagNumber(1)
  PretendGroupInfo ensureGroupInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<PretendInfo> get pretendList => $_getList(1);
}

class PretendMyInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendMyInfo',
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
            : 'fragmentNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starScore',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userLevel',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userLevelIcon')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextLevelScore',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PretendMyInfo._() : super();
  factory PretendMyInfo({
    $core.int? uid,
    $core.int? fragmentNum,
    $core.int? starScore,
    $core.int? userLevel,
    $core.String? userLevelIcon,
    $core.int? nextLevelScore,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (fragmentNum != null) {
      _result.fragmentNum = fragmentNum;
    }
    if (starScore != null) {
      _result.starScore = starScore;
    }
    if (userLevel != null) {
      _result.userLevel = userLevel;
    }
    if (userLevelIcon != null) {
      _result.userLevelIcon = userLevelIcon;
    }
    if (nextLevelScore != null) {
      _result.nextLevelScore = nextLevelScore;
    }
    return _result;
  }
  factory PretendMyInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendMyInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendMyInfo clone() => PretendMyInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendMyInfo copyWith(void Function(PretendMyInfo) updates) =>
      super.copyWith((message) => updates(message as PretendMyInfo))
          as PretendMyInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendMyInfo create() => PretendMyInfo._();
  PretendMyInfo createEmptyInstance() => create();
  static $pb.PbList<PretendMyInfo> createRepeated() =>
      $pb.PbList<PretendMyInfo>();
  @$core.pragma('dart2js:noInline')
  static PretendMyInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendMyInfo>(create);
  static PretendMyInfo? _defaultInstance;

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
  $core.int get fragmentNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set fragmentNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFragmentNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearFragmentNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get starScore => $_getIZ(2);
  @$pb.TagNumber(3)
  set starScore($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStarScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearStarScore() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get userLevel => $_getIZ(3);
  @$pb.TagNumber(4)
  set userLevel($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUserLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userLevelIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set userLevelIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUserLevelIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserLevelIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get nextLevelScore => $_getIZ(5);
  @$pb.TagNumber(6)
  set nextLevelScore($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNextLevelScore() => $_has(5);
  @$pb.TagNumber(6)
  void clearNextLevelScore() => clearField(6);
}

class PretendUseReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendUseReq',
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
            : 'pretendCateId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PretendUseReq._() : super();
  factory PretendUseReq({
    $core.int? uid,
    $core.int? pretendCateId,
    $core.int? groupId,
    $core.int? starNum,
    $core.int? sex,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (pretendCateId != null) {
      _result.pretendCateId = pretendCateId;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (starNum != null) {
      _result.starNum = starNum;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    return _result;
  }
  factory PretendUseReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendUseReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendUseReq clone() => PretendUseReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendUseReq copyWith(void Function(PretendUseReq) updates) =>
      super.copyWith((message) => updates(message as PretendUseReq))
          as PretendUseReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendUseReq create() => PretendUseReq._();
  PretendUseReq createEmptyInstance() => create();
  static $pb.PbList<PretendUseReq> createRepeated() =>
      $pb.PbList<PretendUseReq>();
  @$core.pragma('dart2js:noInline')
  static PretendUseReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendUseReq>(create);
  static PretendUseReq? _defaultInstance;

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
  $core.int get pretendCateId => $_getIZ(1);
  @$pb.TagNumber(2)
  set pretendCateId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPretendCateId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPretendCateId() => clearField(2);

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
  $core.int get starNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set starNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStarNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearStarNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get sex => $_getIZ(4);
  @$pb.TagNumber(5)
  set sex($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSex() => $_has(4);
  @$pb.TagNumber(5)
  void clearSex() => clearField(5);
}

class PretendUseResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendUseResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<PretendGroupDetail>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PretendGroupDetail.create)
    ..hasRequiredFields = false;

  PretendUseResp._() : super();
  factory PretendUseResp({
    PretendGroupDetail? data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory PretendUseResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendUseResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendUseResp clone() => PretendUseResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendUseResp copyWith(void Function(PretendUseResp) updates) =>
      super.copyWith((message) => updates(message as PretendUseResp))
          as PretendUseResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendUseResp create() => PretendUseResp._();
  PretendUseResp createEmptyInstance() => create();
  static $pb.PbList<PretendUseResp> createRepeated() =>
      $pb.PbList<PretendUseResp>();
  @$core.pragma('dart2js:noInline')
  static PretendUseResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendUseResp>(create);
  static PretendUseResp? _defaultInstance;

  @$pb.TagNumber(1)
  PretendGroupDetail get data => $_getN(0);
  @$pb.TagNumber(1)
  set data(PretendGroupDetail v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  PretendGroupDetail ensureData() => $_ensure(0);
}

class PretendCancelReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendCancelReq',
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
            : 'pretendCateId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PretendCancelReq._() : super();
  factory PretendCancelReq({
    $core.int? uid,
    $core.int? pretendCateId,
    $core.int? groupId,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (pretendCateId != null) {
      _result.pretendCateId = pretendCateId;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    return _result;
  }
  factory PretendCancelReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendCancelReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendCancelReq clone() => PretendCancelReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendCancelReq copyWith(void Function(PretendCancelReq) updates) =>
      super.copyWith((message) => updates(message as PretendCancelReq))
          as PretendCancelReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendCancelReq create() => PretendCancelReq._();
  PretendCancelReq createEmptyInstance() => create();
  static $pb.PbList<PretendCancelReq> createRepeated() =>
      $pb.PbList<PretendCancelReq>();
  @$core.pragma('dart2js:noInline')
  static PretendCancelReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendCancelReq>(create);
  static PretendCancelReq? _defaultInstance;

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
  $core.int get pretendCateId => $_getIZ(1);
  @$pb.TagNumber(2)
  set pretendCateId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPretendCateId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPretendCateId() => clearField(2);

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
}

class PretendCancelResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendCancelResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<PretendGroupDetail>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PretendGroupDetail.create)
    ..hasRequiredFields = false;

  PretendCancelResp._() : super();
  factory PretendCancelResp({
    PretendGroupDetail? data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory PretendCancelResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendCancelResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendCancelResp clone() => PretendCancelResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendCancelResp copyWith(void Function(PretendCancelResp) updates) =>
      super.copyWith((message) => updates(message as PretendCancelResp))
          as PretendCancelResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendCancelResp create() => PretendCancelResp._();
  PretendCancelResp createEmptyInstance() => create();
  static $pb.PbList<PretendCancelResp> createRepeated() =>
      $pb.PbList<PretendCancelResp>();
  @$core.pragma('dart2js:noInline')
  static PretendCancelResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendCancelResp>(create);
  static PretendCancelResp? _defaultInstance;

  @$pb.TagNumber(1)
  PretendGroupDetail get data => $_getN(0);
  @$pb.TagNumber(1)
  set data(PretendGroupDetail v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  PretendGroupDetail ensureData() => $_ensure(0);
}

class PretendSetSexReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendSetSexReq',
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
            : 'pretendCateId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PretendSetSexReq._() : super();
  factory PretendSetSexReq({
    $core.int? uid,
    $core.int? pretendCateId,
    $core.int? groupId,
    $core.int? sex,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (pretendCateId != null) {
      _result.pretendCateId = pretendCateId;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    return _result;
  }
  factory PretendSetSexReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendSetSexReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendSetSexReq clone() => PretendSetSexReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendSetSexReq copyWith(void Function(PretendSetSexReq) updates) =>
      super.copyWith((message) => updates(message as PretendSetSexReq))
          as PretendSetSexReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendSetSexReq create() => PretendSetSexReq._();
  PretendSetSexReq createEmptyInstance() => create();
  static $pb.PbList<PretendSetSexReq> createRepeated() =>
      $pb.PbList<PretendSetSexReq>();
  @$core.pragma('dart2js:noInline')
  static PretendSetSexReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendSetSexReq>(create);
  static PretendSetSexReq? _defaultInstance;

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
  $core.int get pretendCateId => $_getIZ(1);
  @$pb.TagNumber(2)
  set pretendCateId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPretendCateId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPretendCateId() => clearField(2);

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

class PretendSetSexResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendSetSexResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<PretendGroupDetail>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PretendGroupDetail.create)
    ..hasRequiredFields = false;

  PretendSetSexResp._() : super();
  factory PretendSetSexResp({
    PretendGroupDetail? data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory PretendSetSexResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendSetSexResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendSetSexResp clone() => PretendSetSexResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendSetSexResp copyWith(void Function(PretendSetSexResp) updates) =>
      super.copyWith((message) => updates(message as PretendSetSexResp))
          as PretendSetSexResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendSetSexResp create() => PretendSetSexResp._();
  PretendSetSexResp createEmptyInstance() => create();
  static $pb.PbList<PretendSetSexResp> createRepeated() =>
      $pb.PbList<PretendSetSexResp>();
  @$core.pragma('dart2js:noInline')
  static PretendSetSexResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendSetSexResp>(create);
  static PretendSetSexResp? _defaultInstance;

  @$pb.TagNumber(1)
  PretendGroupDetail get data => $_getN(0);
  @$pb.TagNumber(1)
  set data(PretendGroupDetail v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  PretendGroupDetail ensureData() => $_ensure(0);
}

class PretendAddFragmentReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendAddFragmentReq',
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
            : 'fragmentNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PretendAddFragmentReq._() : super();
  factory PretendAddFragmentReq({
    $core.int? uid,
    $core.int? fragmentNum,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (fragmentNum != null) {
      _result.fragmentNum = fragmentNum;
    }
    return _result;
  }
  factory PretendAddFragmentReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendAddFragmentReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendAddFragmentReq clone() =>
      PretendAddFragmentReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendAddFragmentReq copyWith(
          void Function(PretendAddFragmentReq) updates) =>
      super.copyWith((message) => updates(message as PretendAddFragmentReq))
          as PretendAddFragmentReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendAddFragmentReq create() => PretendAddFragmentReq._();
  PretendAddFragmentReq createEmptyInstance() => create();
  static $pb.PbList<PretendAddFragmentReq> createRepeated() =>
      $pb.PbList<PretendAddFragmentReq>();
  @$core.pragma('dart2js:noInline')
  static PretendAddFragmentReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendAddFragmentReq>(create);
  static PretendAddFragmentReq? _defaultInstance;

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
  $core.int get fragmentNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set fragmentNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFragmentNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearFragmentNum() => clearField(2);
}

class PretendAddFragmentResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendAddFragmentResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fragmentNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PretendAddFragmentResp._() : super();
  factory PretendAddFragmentResp({
    $core.int? fragmentNum,
  }) {
    final _result = create();
    if (fragmentNum != null) {
      _result.fragmentNum = fragmentNum;
    }
    return _result;
  }
  factory PretendAddFragmentResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendAddFragmentResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendAddFragmentResp clone() =>
      PretendAddFragmentResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendAddFragmentResp copyWith(
          void Function(PretendAddFragmentResp) updates) =>
      super.copyWith((message) => updates(message as PretendAddFragmentResp))
          as PretendAddFragmentResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendAddFragmentResp create() => PretendAddFragmentResp._();
  PretendAddFragmentResp createEmptyInstance() => create();
  static $pb.PbList<PretendAddFragmentResp> createRepeated() =>
      $pb.PbList<PretendAddFragmentResp>();
  @$core.pragma('dart2js:noInline')
  static PretendAddFragmentResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendAddFragmentResp>(create);
  static PretendAddFragmentResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fragmentNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set fragmentNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFragmentNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearFragmentNum() => clearField(1);
}

class PretendRechargePeriodEndReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendRechargePeriodEndReq',
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
            : 'pretendCateId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PretendRechargePeriodEndReq._() : super();
  factory PretendRechargePeriodEndReq({
    $core.int? uid,
    $core.int? pretendCateId,
    $core.int? groupId,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (pretendCateId != null) {
      _result.pretendCateId = pretendCateId;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    return _result;
  }
  factory PretendRechargePeriodEndReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendRechargePeriodEndReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendRechargePeriodEndReq clone() =>
      PretendRechargePeriodEndReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendRechargePeriodEndReq copyWith(
          void Function(PretendRechargePeriodEndReq) updates) =>
      super.copyWith(
              (message) => updates(message as PretendRechargePeriodEndReq))
          as PretendRechargePeriodEndReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendRechargePeriodEndReq create() =>
      PretendRechargePeriodEndReq._();
  PretendRechargePeriodEndReq createEmptyInstance() => create();
  static $pb.PbList<PretendRechargePeriodEndReq> createRepeated() =>
      $pb.PbList<PretendRechargePeriodEndReq>();
  @$core.pragma('dart2js:noInline')
  static PretendRechargePeriodEndReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendRechargePeriodEndReq>(create);
  static PretendRechargePeriodEndReq? _defaultInstance;

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
  $core.int get pretendCateId => $_getIZ(1);
  @$pb.TagNumber(2)
  set pretendCateId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPretendCateId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPretendCateId() => clearField(2);

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
}

class PretendRechargePeriodEndResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendRechargePeriodEndResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<PretendGroupDetail>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PretendGroupDetail.create)
    ..hasRequiredFields = false;

  PretendRechargePeriodEndResp._() : super();
  factory PretendRechargePeriodEndResp({
    PretendGroupDetail? data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory PretendRechargePeriodEndResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendRechargePeriodEndResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendRechargePeriodEndResp clone() =>
      PretendRechargePeriodEndResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendRechargePeriodEndResp copyWith(
          void Function(PretendRechargePeriodEndResp) updates) =>
      super.copyWith(
              (message) => updates(message as PretendRechargePeriodEndResp))
          as PretendRechargePeriodEndResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendRechargePeriodEndResp create() =>
      PretendRechargePeriodEndResp._();
  PretendRechargePeriodEndResp createEmptyInstance() => create();
  static $pb.PbList<PretendRechargePeriodEndResp> createRepeated() =>
      $pb.PbList<PretendRechargePeriodEndResp>();
  @$core.pragma('dart2js:noInline')
  static PretendRechargePeriodEndResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendRechargePeriodEndResp>(create);
  static PretendRechargePeriodEndResp? _defaultInstance;

  @$pb.TagNumber(1)
  PretendGroupDetail get data => $_getN(0);
  @$pb.TagNumber(1)
  set data(PretendGroupDetail v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  PretendGroupDetail ensureData() => $_ensure(0);
}

class PretendUpgradeReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendUpgradeReq',
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
            : 'pretendCateId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PretendUpgradeReq._() : super();
  factory PretendUpgradeReq({
    $core.int? uid,
    $core.int? pretendCateId,
    $core.int? groupId,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (pretendCateId != null) {
      _result.pretendCateId = pretendCateId;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    return _result;
  }
  factory PretendUpgradeReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendUpgradeReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendUpgradeReq clone() => PretendUpgradeReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendUpgradeReq copyWith(void Function(PretendUpgradeReq) updates) =>
      super.copyWith((message) => updates(message as PretendUpgradeReq))
          as PretendUpgradeReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendUpgradeReq create() => PretendUpgradeReq._();
  PretendUpgradeReq createEmptyInstance() => create();
  static $pb.PbList<PretendUpgradeReq> createRepeated() =>
      $pb.PbList<PretendUpgradeReq>();
  @$core.pragma('dart2js:noInline')
  static PretendUpgradeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendUpgradeReq>(create);
  static PretendUpgradeReq? _defaultInstance;

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
  $core.int get pretendCateId => $_getIZ(1);
  @$pb.TagNumber(2)
  set pretendCateId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPretendCateId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPretendCateId() => clearField(2);

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
}

class PretendUpgradeResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendUpgradeResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<PretendGroupDetail>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PretendGroupDetail.create)
    ..hasRequiredFields = false;

  PretendUpgradeResp._() : super();
  factory PretendUpgradeResp({
    PretendGroupDetail? data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory PretendUpgradeResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendUpgradeResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendUpgradeResp clone() => PretendUpgradeResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendUpgradeResp copyWith(void Function(PretendUpgradeResp) updates) =>
      super.copyWith((message) => updates(message as PretendUpgradeResp))
          as PretendUpgradeResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendUpgradeResp create() => PretendUpgradeResp._();
  PretendUpgradeResp createEmptyInstance() => create();
  static $pb.PbList<PretendUpgradeResp> createRepeated() =>
      $pb.PbList<PretendUpgradeResp>();
  @$core.pragma('dart2js:noInline')
  static PretendUpgradeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendUpgradeResp>(create);
  static PretendUpgradeResp? _defaultInstance;

  @$pb.TagNumber(1)
  PretendGroupDetail get data => $_getN(0);
  @$pb.TagNumber(1)
  set data(PretendGroupDetail v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  PretendGroupDetail ensureData() => $_ensure(0);
}

class PretendSendGroupPretendReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendSendGroupPretendReq',
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
            : 'pretendCateId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..aInt64(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'periodEnd')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gotType')
    ..hasRequiredFields = false;

  PretendSendGroupPretendReq._() : super();
  factory PretendSendGroupPretendReq({
    $core.int? uid,
    $core.int? pretendCateId,
    $core.int? groupId,
    $fixnum.Int64? periodEnd,
    $core.String? gotType,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (pretendCateId != null) {
      _result.pretendCateId = pretendCateId;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (periodEnd != null) {
      _result.periodEnd = periodEnd;
    }
    if (gotType != null) {
      _result.gotType = gotType;
    }
    return _result;
  }
  factory PretendSendGroupPretendReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendSendGroupPretendReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendSendGroupPretendReq clone() =>
      PretendSendGroupPretendReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendSendGroupPretendReq copyWith(
          void Function(PretendSendGroupPretendReq) updates) =>
      super.copyWith(
              (message) => updates(message as PretendSendGroupPretendReq))
          as PretendSendGroupPretendReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendSendGroupPretendReq create() => PretendSendGroupPretendReq._();
  PretendSendGroupPretendReq createEmptyInstance() => create();
  static $pb.PbList<PretendSendGroupPretendReq> createRepeated() =>
      $pb.PbList<PretendSendGroupPretendReq>();
  @$core.pragma('dart2js:noInline')
  static PretendSendGroupPretendReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendSendGroupPretendReq>(create);
  static PretendSendGroupPretendReq? _defaultInstance;

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
  $core.int get pretendCateId => $_getIZ(1);
  @$pb.TagNumber(2)
  set pretendCateId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPretendCateId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPretendCateId() => clearField(2);

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
  $fixnum.Int64 get periodEnd => $_getI64(3);
  @$pb.TagNumber(4)
  set periodEnd($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPeriodEnd() => $_has(3);
  @$pb.TagNumber(4)
  void clearPeriodEnd() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get gotType => $_getSZ(4);
  @$pb.TagNumber(5)
  set gotType($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGotType() => $_has(4);
  @$pb.TagNumber(5)
  void clearGotType() => clearField(5);
}

class PretendSendGroupPretendResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendSendGroupPretendResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  PretendSendGroupPretendResp._() : super();
  factory PretendSendGroupPretendResp() => create();
  factory PretendSendGroupPretendResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendSendGroupPretendResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendSendGroupPretendResp clone() =>
      PretendSendGroupPretendResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendSendGroupPretendResp copyWith(
          void Function(PretendSendGroupPretendResp) updates) =>
      super.copyWith(
              (message) => updates(message as PretendSendGroupPretendResp))
          as PretendSendGroupPretendResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendSendGroupPretendResp create() =>
      PretendSendGroupPretendResp._();
  PretendSendGroupPretendResp createEmptyInstance() => create();
  static $pb.PbList<PretendSendGroupPretendResp> createRepeated() =>
      $pb.PbList<PretendSendGroupPretendResp>();
  @$core.pragma('dart2js:noInline')
  static PretendSendGroupPretendResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendSendGroupPretendResp>(create);
  static PretendSendGroupPretendResp? _defaultInstance;
}

class PretendGetUserCateGroupListReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendGetUserCateGroupListReq',
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
            : 'pretendCateId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'page',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'limit',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PretendGetUserCateGroupListReq._() : super();
  factory PretendGetUserCateGroupListReq({
    $core.int? uid,
    $core.int? pretendCateId,
    $core.int? page,
    $core.int? limit,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (pretendCateId != null) {
      _result.pretendCateId = pretendCateId;
    }
    if (page != null) {
      _result.page = page;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    return _result;
  }
  factory PretendGetUserCateGroupListReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendGetUserCateGroupListReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendGetUserCateGroupListReq clone() =>
      PretendGetUserCateGroupListReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendGetUserCateGroupListReq copyWith(
          void Function(PretendGetUserCateGroupListReq) updates) =>
      super.copyWith(
              (message) => updates(message as PretendGetUserCateGroupListReq))
          as PretendGetUserCateGroupListReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendGetUserCateGroupListReq create() =>
      PretendGetUserCateGroupListReq._();
  PretendGetUserCateGroupListReq createEmptyInstance() => create();
  static $pb.PbList<PretendGetUserCateGroupListReq> createRepeated() =>
      $pb.PbList<PretendGetUserCateGroupListReq>();
  @$core.pragma('dart2js:noInline')
  static PretendGetUserCateGroupListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendGetUserCateGroupListReq>(create);
  static PretendGetUserCateGroupListReq? _defaultInstance;

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
  $core.int get pretendCateId => $_getIZ(1);
  @$pb.TagNumber(2)
  set pretendCateId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPretendCateId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPretendCateId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get page => $_getIZ(2);
  @$pb.TagNumber(3)
  set page($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get limit => $_getIZ(3);
  @$pb.TagNumber(4)
  set limit($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => clearField(4);
}

class PretendGetUserCateGroupListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendGetUserCateGroupListResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PretendGroupDetail>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: PretendGroupDetail.create)
    ..hasRequiredFields = false;

  PretendGetUserCateGroupListResp._() : super();
  factory PretendGetUserCateGroupListResp({
    $core.Iterable<PretendGroupDetail>? data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory PretendGetUserCateGroupListResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendGetUserCateGroupListResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendGetUserCateGroupListResp clone() =>
      PretendGetUserCateGroupListResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendGetUserCateGroupListResp copyWith(
          void Function(PretendGetUserCateGroupListResp) updates) =>
      super.copyWith(
              (message) => updates(message as PretendGetUserCateGroupListResp))
          as PretendGetUserCateGroupListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendGetUserCateGroupListResp create() =>
      PretendGetUserCateGroupListResp._();
  PretendGetUserCateGroupListResp createEmptyInstance() => create();
  static $pb.PbList<PretendGetUserCateGroupListResp> createRepeated() =>
      $pb.PbList<PretendGetUserCateGroupListResp>();
  @$core.pragma('dart2js:noInline')
  static PretendGetUserCateGroupListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendGetUserCateGroupListResp>(
          create);
  static PretendGetUserCateGroupListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PretendGroupDetail> get data => $_getList(0);
}

class PretendGetPretendCateListReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendGetPretendCateListReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  PretendGetPretendCateListReq._() : super();
  factory PretendGetPretendCateListReq() => create();
  factory PretendGetPretendCateListReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendGetPretendCateListReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendGetPretendCateListReq clone() =>
      PretendGetPretendCateListReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendGetPretendCateListReq copyWith(
          void Function(PretendGetPretendCateListReq) updates) =>
      super.copyWith(
              (message) => updates(message as PretendGetPretendCateListReq))
          as PretendGetPretendCateListReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendGetPretendCateListReq create() =>
      PretendGetPretendCateListReq._();
  PretendGetPretendCateListReq createEmptyInstance() => create();
  static $pb.PbList<PretendGetPretendCateListReq> createRepeated() =>
      $pb.PbList<PretendGetPretendCateListReq>();
  @$core.pragma('dart2js:noInline')
  static PretendGetPretendCateListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendGetPretendCateListReq>(create);
  static PretendGetPretendCateListReq? _defaultInstance;
}

class PretendGetPretendCateListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendGetPretendCateListResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PretendCategory>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: PretendCategory.create)
    ..hasRequiredFields = false;

  PretendGetPretendCateListResp._() : super();
  factory PretendGetPretendCateListResp({
    $core.Iterable<PretendCategory>? data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory PretendGetPretendCateListResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendGetPretendCateListResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendGetPretendCateListResp clone() =>
      PretendGetPretendCateListResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendGetPretendCateListResp copyWith(
          void Function(PretendGetPretendCateListResp) updates) =>
      super.copyWith(
              (message) => updates(message as PretendGetPretendCateListResp))
          as PretendGetPretendCateListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendGetPretendCateListResp create() =>
      PretendGetPretendCateListResp._();
  PretendGetPretendCateListResp createEmptyInstance() => create();
  static $pb.PbList<PretendGetPretendCateListResp> createRepeated() =>
      $pb.PbList<PretendGetPretendCateListResp>();
  @$core.pragma('dart2js:noInline')
  static PretendGetPretendCateListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendGetPretendCateListResp>(create);
  static PretendGetPretendCateListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PretendCategory> get data => $_getList(0);
}

class PretendMyReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendMyReq',
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
    ..hasRequiredFields = false;

  PretendMyReq._() : super();
  factory PretendMyReq({
    $core.int? uid,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PretendMyReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendMyReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendMyReq clone() => PretendMyReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendMyReq copyWith(void Function(PretendMyReq) updates) =>
      super.copyWith((message) => updates(message as PretendMyReq))
          as PretendMyReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendMyReq create() => PretendMyReq._();
  PretendMyReq createEmptyInstance() => create();
  static $pb.PbList<PretendMyReq> createRepeated() =>
      $pb.PbList<PretendMyReq>();
  @$core.pragma('dart2js:noInline')
  static PretendMyReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendMyReq>(create);
  static PretendMyReq? _defaultInstance;

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
}

class PretendMyResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendMyResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<PretendMyInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'my',
        subBuilder: PretendMyInfo.create)
    ..hasRequiredFields = false;

  PretendMyResp._() : super();
  factory PretendMyResp({
    PretendMyInfo? my,
  }) {
    final _result = create();
    if (my != null) {
      _result.my = my;
    }
    return _result;
  }
  factory PretendMyResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendMyResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendMyResp clone() => PretendMyResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendMyResp copyWith(void Function(PretendMyResp) updates) =>
      super.copyWith((message) => updates(message as PretendMyResp))
          as PretendMyResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendMyResp create() => PretendMyResp._();
  PretendMyResp createEmptyInstance() => create();
  static $pb.PbList<PretendMyResp> createRepeated() =>
      $pb.PbList<PretendMyResp>();
  @$core.pragma('dart2js:noInline')
  static PretendMyResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendMyResp>(create);
  static PretendMyResp? _defaultInstance;

  @$pb.TagNumber(1)
  PretendMyInfo get my => $_getN(0);
  @$pb.TagNumber(1)
  set my(PretendMyInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMy() => $_has(0);
  @$pb.TagNumber(1)
  void clearMy() => clearField(1);
  @$pb.TagNumber(1)
  PretendMyInfo ensureMy() => $_ensure(0);
}

class PretendGetUserDefaultPretendReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendGetUserDefaultPretendReq',
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
    ..hasRequiredFields = false;

  PretendGetUserDefaultPretendReq._() : super();
  factory PretendGetUserDefaultPretendReq({
    $core.int? uid,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PretendGetUserDefaultPretendReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendGetUserDefaultPretendReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendGetUserDefaultPretendReq clone() =>
      PretendGetUserDefaultPretendReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendGetUserDefaultPretendReq copyWith(
          void Function(PretendGetUserDefaultPretendReq) updates) =>
      super.copyWith(
              (message) => updates(message as PretendGetUserDefaultPretendReq))
          as PretendGetUserDefaultPretendReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendGetUserDefaultPretendReq create() =>
      PretendGetUserDefaultPretendReq._();
  PretendGetUserDefaultPretendReq createEmptyInstance() => create();
  static $pb.PbList<PretendGetUserDefaultPretendReq> createRepeated() =>
      $pb.PbList<PretendGetUserDefaultPretendReq>();
  @$core.pragma('dart2js:noInline')
  static PretendGetUserDefaultPretendReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendGetUserDefaultPretendReq>(
          create);
  static PretendGetUserDefaultPretendReq? _defaultInstance;

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
}

class PretendGetUserDefaultPretendResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendGetUserDefaultPretendResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapSize',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PretendGetUserDefaultPretendResp._() : super();
  factory PretendGetUserDefaultPretendResp({
    $core.int? extId,
    $core.int? vapSize,
  }) {
    final _result = create();
    if (extId != null) {
      _result.extId = extId;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    return _result;
  }
  factory PretendGetUserDefaultPretendResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendGetUserDefaultPretendResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendGetUserDefaultPretendResp clone() =>
      PretendGetUserDefaultPretendResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendGetUserDefaultPretendResp copyWith(
          void Function(PretendGetUserDefaultPretendResp) updates) =>
      super.copyWith(
              (message) => updates(message as PretendGetUserDefaultPretendResp))
          as PretendGetUserDefaultPretendResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendGetUserDefaultPretendResp create() =>
      PretendGetUserDefaultPretendResp._();
  PretendGetUserDefaultPretendResp createEmptyInstance() => create();
  static $pb.PbList<PretendGetUserDefaultPretendResp> createRepeated() =>
      $pb.PbList<PretendGetUserDefaultPretendResp>();
  @$core.pragma('dart2js:noInline')
  static PretendGetUserDefaultPretendResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendGetUserDefaultPretendResp>(
          create);
  static PretendGetUserDefaultPretendResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get extId => $_getIZ(0);
  @$pb.TagNumber(1)
  set extId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasExtId() => $_has(0);
  @$pb.TagNumber(1)
  void clearExtId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get vapSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set vapSize($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVapSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearVapSize() => clearField(2);
}

class PretendGetUserCardDecoratePretendReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendGetUserCardDecoratePretendReq',
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
    ..hasRequiredFields = false;

  PretendGetUserCardDecoratePretendReq._() : super();
  factory PretendGetUserCardDecoratePretendReq({
    $core.int? uid,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PretendGetUserCardDecoratePretendReq.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendGetUserCardDecoratePretendReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendGetUserCardDecoratePretendReq clone() =>
      PretendGetUserCardDecoratePretendReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendGetUserCardDecoratePretendReq copyWith(
          void Function(PretendGetUserCardDecoratePretendReq) updates) =>
      super.copyWith((message) =>
              updates(message as PretendGetUserCardDecoratePretendReq))
          as PretendGetUserCardDecoratePretendReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendGetUserCardDecoratePretendReq create() =>
      PretendGetUserCardDecoratePretendReq._();
  PretendGetUserCardDecoratePretendReq createEmptyInstance() => create();
  static $pb.PbList<PretendGetUserCardDecoratePretendReq> createRepeated() =>
      $pb.PbList<PretendGetUserCardDecoratePretendReq>();
  @$core.pragma('dart2js:noInline')
  static PretendGetUserCardDecoratePretendReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          PretendGetUserCardDecoratePretendReq>(create);
  static PretendGetUserCardDecoratePretendReq? _defaultInstance;

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
}

class PretendGetUserCardDecoratePretendResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendGetUserCardDecoratePretendResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapSize',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..hasRequiredFields = false;

  PretendGetUserCardDecoratePretendResp._() : super();
  factory PretendGetUserCardDecoratePretendResp({
    $core.int? extId,
    $core.int? vapSize,
    $core.String? image,
  }) {
    final _result = create();
    if (extId != null) {
      _result.extId = extId;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory PretendGetUserCardDecoratePretendResp.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendGetUserCardDecoratePretendResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendGetUserCardDecoratePretendResp clone() =>
      PretendGetUserCardDecoratePretendResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendGetUserCardDecoratePretendResp copyWith(
          void Function(PretendGetUserCardDecoratePretendResp) updates) =>
      super.copyWith((message) =>
              updates(message as PretendGetUserCardDecoratePretendResp))
          as PretendGetUserCardDecoratePretendResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendGetUserCardDecoratePretendResp create() =>
      PretendGetUserCardDecoratePretendResp._();
  PretendGetUserCardDecoratePretendResp createEmptyInstance() => create();
  static $pb.PbList<PretendGetUserCardDecoratePretendResp> createRepeated() =>
      $pb.PbList<PretendGetUserCardDecoratePretendResp>();
  @$core.pragma('dart2js:noInline')
  static PretendGetUserCardDecoratePretendResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          PretendGetUserCardDecoratePretendResp>(create);
  static PretendGetUserCardDecoratePretendResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get extId => $_getIZ(0);
  @$pb.TagNumber(1)
  set extId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasExtId() => $_has(0);
  @$pb.TagNumber(1)
  void clearExtId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get vapSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set vapSize($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVapSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearVapSize() => clearField(2);

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
}

class PretendGetUserEffectPretendReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendGetUserEffectPretendReq',
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
    ..hasRequiredFields = false;

  PretendGetUserEffectPretendReq._() : super();
  factory PretendGetUserEffectPretendReq({
    $core.int? uid,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PretendGetUserEffectPretendReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendGetUserEffectPretendReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendGetUserEffectPretendReq clone() =>
      PretendGetUserEffectPretendReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendGetUserEffectPretendReq copyWith(
          void Function(PretendGetUserEffectPretendReq) updates) =>
      super.copyWith(
              (message) => updates(message as PretendGetUserEffectPretendReq))
          as PretendGetUserEffectPretendReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendGetUserEffectPretendReq create() =>
      PretendGetUserEffectPretendReq._();
  PretendGetUserEffectPretendReq createEmptyInstance() => create();
  static $pb.PbList<PretendGetUserEffectPretendReq> createRepeated() =>
      $pb.PbList<PretendGetUserEffectPretendReq>();
  @$core.pragma('dart2js:noInline')
  static PretendGetUserEffectPretendReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendGetUserEffectPretendReq>(create);
  static PretendGetUserEffectPretendReq? _defaultInstance;

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
}

class PretendGetUserEffectPretendResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendGetUserEffectPretendResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapSize',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fontColor')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pretendId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PretendGetUserEffectPretendResp._() : super();
  factory PretendGetUserEffectPretendResp({
    $core.int? extId,
    $core.int? vapSize,
    $core.String? image,
    $core.String? fontColor,
    $core.int? pretendId,
  }) {
    final _result = create();
    if (extId != null) {
      _result.extId = extId;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    if (image != null) {
      _result.image = image;
    }
    if (fontColor != null) {
      _result.fontColor = fontColor;
    }
    if (pretendId != null) {
      _result.pretendId = pretendId;
    }
    return _result;
  }
  factory PretendGetUserEffectPretendResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendGetUserEffectPretendResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendGetUserEffectPretendResp clone() =>
      PretendGetUserEffectPretendResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendGetUserEffectPretendResp copyWith(
          void Function(PretendGetUserEffectPretendResp) updates) =>
      super.copyWith(
              (message) => updates(message as PretendGetUserEffectPretendResp))
          as PretendGetUserEffectPretendResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendGetUserEffectPretendResp create() =>
      PretendGetUserEffectPretendResp._();
  PretendGetUserEffectPretendResp createEmptyInstance() => create();
  static $pb.PbList<PretendGetUserEffectPretendResp> createRepeated() =>
      $pb.PbList<PretendGetUserEffectPretendResp>();
  @$core.pragma('dart2js:noInline')
  static PretendGetUserEffectPretendResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendGetUserEffectPretendResp>(
          create);
  static PretendGetUserEffectPretendResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get extId => $_getIZ(0);
  @$pb.TagNumber(1)
  set extId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasExtId() => $_has(0);
  @$pb.TagNumber(1)
  void clearExtId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get vapSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set vapSize($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVapSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearVapSize() => clearField(2);

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
  $core.String get fontColor => $_getSZ(3);
  @$pb.TagNumber(4)
  set fontColor($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFontColor() => $_has(3);
  @$pb.TagNumber(4)
  void clearFontColor() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get pretendId => $_getIZ(4);
  @$pb.TagNumber(5)
  set pretendId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPretendId() => $_has(4);
  @$pb.TagNumber(5)
  void clearPretendId() => clearField(5);
}

class PretendRandomChangeReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendRandomChangeReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PretendRandomChangeReq._() : super();
  factory PretendRandomChangeReq({
    $core.int? category,
    $core.int? uid,
  }) {
    final _result = create();
    if (category != null) {
      _result.category = category;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PretendRandomChangeReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendRandomChangeReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendRandomChangeReq clone() =>
      PretendRandomChangeReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendRandomChangeReq copyWith(
          void Function(PretendRandomChangeReq) updates) =>
      super.copyWith((message) => updates(message as PretendRandomChangeReq))
          as PretendRandomChangeReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendRandomChangeReq create() => PretendRandomChangeReq._();
  PretendRandomChangeReq createEmptyInstance() => create();
  static $pb.PbList<PretendRandomChangeReq> createRepeated() =>
      $pb.PbList<PretendRandomChangeReq>();
  @$core.pragma('dart2js:noInline')
  static PretendRandomChangeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendRandomChangeReq>(create);
  static PretendRandomChangeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get category => $_getIZ(0);
  @$pb.TagNumber(1)
  set category($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCategory() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategory() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get uid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);
}

class PretendRandomChangeRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PretendRandomChangeRsp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<PretendInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pretend',
        subBuilder: PretendInfo.create)
    ..hasRequiredFields = false;

  PretendRandomChangeRsp._() : super();
  factory PretendRandomChangeRsp({
    PretendInfo? pretend,
  }) {
    final _result = create();
    if (pretend != null) {
      _result.pretend = pretend;
    }
    return _result;
  }
  factory PretendRandomChangeRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PretendRandomChangeRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PretendRandomChangeRsp clone() =>
      PretendRandomChangeRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PretendRandomChangeRsp copyWith(
          void Function(PretendRandomChangeRsp) updates) =>
      super.copyWith((message) => updates(message as PretendRandomChangeRsp))
          as PretendRandomChangeRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PretendRandomChangeRsp create() => PretendRandomChangeRsp._();
  PretendRandomChangeRsp createEmptyInstance() => create();
  static $pb.PbList<PretendRandomChangeRsp> createRepeated() =>
      $pb.PbList<PretendRandomChangeRsp>();
  @$core.pragma('dart2js:noInline')
  static PretendRandomChangeRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PretendRandomChangeRsp>(create);
  static PretendRandomChangeRsp? _defaultInstance;

  @$pb.TagNumber(1)
  PretendInfo get pretend => $_getN(0);
  @$pb.TagNumber(1)
  set pretend(PretendInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPretend() => $_has(0);
  @$pb.TagNumber(1)
  void clearPretend() => clearField(1);
  @$pb.TagNumber(1)
  PretendInfo ensurePretend() => $_ensure(0);
}

class pretendApi {
  $pb.RpcClient _client;
  pretendApi(this._client);

  $async.Future<PretendUseResp> use(
      $pb.ClientContext? ctx, PretendUseReq request) {
    var emptyResponse = PretendUseResp();
    return _client.invoke<PretendUseResp>(
        ctx, 'pretend', 'Use', request, emptyResponse);
  }

  $async.Future<PretendCancelResp> cancel(
      $pb.ClientContext? ctx, PretendCancelReq request) {
    var emptyResponse = PretendCancelResp();
    return _client.invoke<PretendCancelResp>(
        ctx, 'pretend', 'Cancel', request, emptyResponse);
  }

  $async.Future<PretendRechargePeriodEndResp> rechargePeriodEnd(
      $pb.ClientContext? ctx, PretendRechargePeriodEndReq request) {
    var emptyResponse = PretendRechargePeriodEndResp();
    return _client.invoke<PretendRechargePeriodEndResp>(
        ctx, 'pretend', 'RechargePeriodEnd', request, emptyResponse);
  }

  $async.Future<PretendUpgradeResp> upgrade(
      $pb.ClientContext? ctx, PretendUpgradeReq request) {
    var emptyResponse = PretendUpgradeResp();
    return _client.invoke<PretendUpgradeResp>(
        ctx, 'pretend', 'Upgrade', request, emptyResponse);
  }

  $async.Future<PretendSendGroupPretendResp> sendGroupPretend(
      $pb.ClientContext? ctx, PretendSendGroupPretendReq request) {
    var emptyResponse = PretendSendGroupPretendResp();
    return _client.invoke<PretendSendGroupPretendResp>(
        ctx, 'pretend', 'SendGroupPretend', request, emptyResponse);
  }

  $async.Future<PretendGetUserCateGroupListResp> getUserCateGroupList(
      $pb.ClientContext? ctx, PretendGetUserCateGroupListReq request) {
    var emptyResponse = PretendGetUserCateGroupListResp();
    return _client.invoke<PretendGetUserCateGroupListResp>(
        ctx, 'pretend', 'GetUserCateGroupList', request, emptyResponse);
  }

  $async.Future<PretendGetUserDefaultPretendResp> getPretendCateList(
      $pb.ClientContext? ctx, PretendGetPretendCateListReq request) {
    var emptyResponse = PretendGetUserDefaultPretendResp();
    return _client.invoke<PretendGetUserDefaultPretendResp>(
        ctx, 'pretend', 'GetPretendCateList', request, emptyResponse);
  }

  $async.Future<PretendGetUserDefaultPretendResp> getUserDecoratePretend(
      $pb.ClientContext? ctx, PretendGetUserDefaultPretendReq request) {
    var emptyResponse = PretendGetUserDefaultPretendResp();
    return _client.invoke<PretendGetUserDefaultPretendResp>(
        ctx, 'pretend', 'GetUserDecoratePretend', request, emptyResponse);
  }

  $async.Future<PretendGetUserCardDecoratePretendResp>
      getUserCardDecoratePretend($pb.ClientContext? ctx,
          PretendGetUserCardDecoratePretendReq request) {
    var emptyResponse = PretendGetUserCardDecoratePretendResp();
    return _client.invoke<PretendGetUserCardDecoratePretendResp>(
        ctx, 'pretend', 'GetUserCardDecoratePretend', request, emptyResponse);
  }

  $async.Future<PretendAddFragmentResp> randomChange(
      $pb.ClientContext? ctx, PretendRandomChangeReq request) {
    var emptyResponse = PretendAddFragmentResp();
    return _client.invoke<PretendAddFragmentResp>(
        ctx, 'pretend', 'RandomChange', request, emptyResponse);
  }

  $async.Future<PretendGetUserEffectPretendResp> getUserEffectPretend(
      $pb.ClientContext? ctx, PretendGetUserEffectPretendReq request) {
    var emptyResponse = PretendGetUserEffectPretendResp();
    return _client.invoke<PretendGetUserEffectPretendResp>(
        ctx, 'pretend', 'GetUserEffectPretend', request, emptyResponse);
  }
}
