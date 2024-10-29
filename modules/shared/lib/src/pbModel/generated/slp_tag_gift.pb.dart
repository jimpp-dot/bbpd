///
//  Generated code. Do not modify.
//  source: slp_tag_gift.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'slp_gift.pb.dart' as $0;

class ResGiftImpressionDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGiftImpressionDetail',
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
    ..aOM<GiftImpressionDetail>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftImpressionDetail.create)
    ..pc<$0.BbGiftPanelChooseNumConfig>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chooseNumConfig',
        $pb.PbFieldType.PM,
        subBuilder: $0.BbGiftPanelChooseNumConfig.create)
    ..hasRequiredFields = false;

  ResGiftImpressionDetail._() : super();
  factory ResGiftImpressionDetail({
    $core.bool? success,
    $core.String? msg,
    GiftImpressionDetail? data,
    $core.Iterable<$0.BbGiftPanelChooseNumConfig>? chooseNumConfig,
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
    if (chooseNumConfig != null) {
      _result.chooseNumConfig.addAll(chooseNumConfig);
    }
    return _result;
  }
  factory ResGiftImpressionDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGiftImpressionDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGiftImpressionDetail clone() =>
      ResGiftImpressionDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGiftImpressionDetail copyWith(
          void Function(ResGiftImpressionDetail) updates) =>
      super.copyWith((message) => updates(message as ResGiftImpressionDetail))
          as ResGiftImpressionDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGiftImpressionDetail create() => ResGiftImpressionDetail._();
  ResGiftImpressionDetail createEmptyInstance() => create();
  static $pb.PbList<ResGiftImpressionDetail> createRepeated() =>
      $pb.PbList<ResGiftImpressionDetail>();
  @$core.pragma('dart2js:noInline')
  static ResGiftImpressionDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGiftImpressionDetail>(create);
  static ResGiftImpressionDetail? _defaultInstance;

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
  GiftImpressionDetail get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftImpressionDetail v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftImpressionDetail ensureData() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$0.BbGiftPanelChooseNumConfig> get chooseNumConfig => $_getList(3);
}

class GiftImpressionDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftImpressionDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GiftImpressionTagGift>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tags',
        $pb.PbFieldType.PM,
        subBuilder: GiftImpressionTagGift.create)
    ..pc<GiftImpressionUserStat>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userStat',
        $pb.PbFieldType.PM,
        subBuilder: GiftImpressionUserStat.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'latestTagName')
    ..hasRequiredFields = false;

  GiftImpressionDetail._() : super();
  factory GiftImpressionDetail({
    $core.Iterable<GiftImpressionTagGift>? tags,
    $core.Iterable<GiftImpressionUserStat>? userStat,
    $core.String? latestTagName,
  }) {
    final _result = create();
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    if (userStat != null) {
      _result.userStat.addAll(userStat);
    }
    if (latestTagName != null) {
      _result.latestTagName = latestTagName;
    }
    return _result;
  }
  factory GiftImpressionDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftImpressionDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftImpressionDetail clone() =>
      GiftImpressionDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftImpressionDetail copyWith(void Function(GiftImpressionDetail) updates) =>
      super.copyWith((message) => updates(message as GiftImpressionDetail))
          as GiftImpressionDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftImpressionDetail create() => GiftImpressionDetail._();
  GiftImpressionDetail createEmptyInstance() => create();
  static $pb.PbList<GiftImpressionDetail> createRepeated() =>
      $pb.PbList<GiftImpressionDetail>();
  @$core.pragma('dart2js:noInline')
  static GiftImpressionDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftImpressionDetail>(create);
  static GiftImpressionDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GiftImpressionTagGift> get tags => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<GiftImpressionUserStat> get userStat => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get latestTagName => $_getSZ(2);
  @$pb.TagNumber(3)
  set latestTagName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLatestTagName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatestTagName() => clearField(3);
}

class GiftImpressionTagGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftImpressionTagGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagBg')
    ..aOM<GiftImpressionTagNaming>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'naming',
        subBuilder: GiftImpressionTagNaming.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftImpressionTagGift._() : super();
  factory GiftImpressionTagGift({
    $core.int? tagId,
    $core.String? tagName,
    $core.String? tagBg,
    GiftImpressionTagNaming? naming,
    $core.int? giftId,
    $core.int? price,
  }) {
    final _result = create();
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (tagName != null) {
      _result.tagName = tagName;
    }
    if (tagBg != null) {
      _result.tagBg = tagBg;
    }
    if (naming != null) {
      _result.naming = naming;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (price != null) {
      _result.price = price;
    }
    return _result;
  }
  factory GiftImpressionTagGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftImpressionTagGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftImpressionTagGift clone() =>
      GiftImpressionTagGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftImpressionTagGift copyWith(
          void Function(GiftImpressionTagGift) updates) =>
      super.copyWith((message) => updates(message as GiftImpressionTagGift))
          as GiftImpressionTagGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftImpressionTagGift create() => GiftImpressionTagGift._();
  GiftImpressionTagGift createEmptyInstance() => create();
  static $pb.PbList<GiftImpressionTagGift> createRepeated() =>
      $pb.PbList<GiftImpressionTagGift>();
  @$core.pragma('dart2js:noInline')
  static GiftImpressionTagGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftImpressionTagGift>(create);
  static GiftImpressionTagGift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tagName => $_getSZ(1);
  @$pb.TagNumber(2)
  set tagName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTagName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTagName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tagBg => $_getSZ(2);
  @$pb.TagNumber(3)
  set tagBg($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTagBg() => $_has(2);
  @$pb.TagNumber(3)
  void clearTagBg() => clearField(3);

  @$pb.TagNumber(4)
  GiftImpressionTagNaming get naming => $_getN(3);
  @$pb.TagNumber(4)
  set naming(GiftImpressionTagNaming v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNaming() => $_has(3);
  @$pb.TagNumber(4)
  void clearNaming() => clearField(4);
  @$pb.TagNumber(4)
  GiftImpressionTagNaming ensureNaming() => $_ensure(3);

  @$pb.TagNumber(6)
  $core.int get giftId => $_getIZ(4);
  @$pb.TagNumber(6)
  set giftId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGiftId() => $_has(4);
  @$pb.TagNumber(6)
  void clearGiftId() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get price => $_getIZ(5);
  @$pb.TagNumber(7)
  set price($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPrice() => $_has(5);
  @$pb.TagNumber(7)
  void clearPrice() => clearField(7);
}

class GiftImpressionTagNaming extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftImpressionTagNaming',
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
            : 'userName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
    ..hasRequiredFields = false;

  GiftImpressionTagNaming._() : super();
  factory GiftImpressionTagNaming({
    $core.int? uid,
    $core.String? userName,
    $core.String? userIcon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    return _result;
  }
  factory GiftImpressionTagNaming.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftImpressionTagNaming.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftImpressionTagNaming clone() =>
      GiftImpressionTagNaming()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftImpressionTagNaming copyWith(
          void Function(GiftImpressionTagNaming) updates) =>
      super.copyWith((message) => updates(message as GiftImpressionTagNaming))
          as GiftImpressionTagNaming; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftImpressionTagNaming create() => GiftImpressionTagNaming._();
  GiftImpressionTagNaming createEmptyInstance() => create();
  static $pb.PbList<GiftImpressionTagNaming> createRepeated() =>
      $pb.PbList<GiftImpressionTagNaming>();
  @$core.pragma('dart2js:noInline')
  static GiftImpressionTagNaming getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftImpressionTagNaming>(create);
  static GiftImpressionTagNaming? _defaultInstance;

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
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set userIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUserIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserIcon() => clearField(3);
}

class GiftImpressionUserStat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftImpressionUserStat',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagBg')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'incomeNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topSenderIcon')
    ..hasRequiredFields = false;

  GiftImpressionUserStat._() : super();
  factory GiftImpressionUserStat({
    $core.int? tagId,
    $core.String? tagName,
    $core.String? tagBg,
    $core.int? incomeNum,
    $core.String? topSenderIcon,
  }) {
    final _result = create();
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (tagName != null) {
      _result.tagName = tagName;
    }
    if (tagBg != null) {
      _result.tagBg = tagBg;
    }
    if (incomeNum != null) {
      _result.incomeNum = incomeNum;
    }
    if (topSenderIcon != null) {
      _result.topSenderIcon = topSenderIcon;
    }
    return _result;
  }
  factory GiftImpressionUserStat.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftImpressionUserStat.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftImpressionUserStat clone() =>
      GiftImpressionUserStat()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftImpressionUserStat copyWith(
          void Function(GiftImpressionUserStat) updates) =>
      super.copyWith((message) => updates(message as GiftImpressionUserStat))
          as GiftImpressionUserStat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftImpressionUserStat create() => GiftImpressionUserStat._();
  GiftImpressionUserStat createEmptyInstance() => create();
  static $pb.PbList<GiftImpressionUserStat> createRepeated() =>
      $pb.PbList<GiftImpressionUserStat>();
  @$core.pragma('dart2js:noInline')
  static GiftImpressionUserStat getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftImpressionUserStat>(create);
  static GiftImpressionUserStat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tagName => $_getSZ(1);
  @$pb.TagNumber(2)
  set tagName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTagName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTagName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tagBg => $_getSZ(2);
  @$pb.TagNumber(3)
  set tagBg($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTagBg() => $_has(2);
  @$pb.TagNumber(3)
  void clearTagBg() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get incomeNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set incomeNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIncomeNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearIncomeNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get topSenderIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set topSenderIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTopSenderIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearTopSenderIcon() => clearField(5);
}

class ResGiftImpressionRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGiftImpressionRank',
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
    ..aOM<GiftImpressionRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftImpressionRankData.create)
    ..hasRequiredFields = false;

  ResGiftImpressionRank._() : super();
  factory ResGiftImpressionRank({
    $core.bool? success,
    $core.String? msg,
    GiftImpressionRankData? data,
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
  factory ResGiftImpressionRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGiftImpressionRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGiftImpressionRank clone() =>
      ResGiftImpressionRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGiftImpressionRank copyWith(
          void Function(ResGiftImpressionRank) updates) =>
      super.copyWith((message) => updates(message as ResGiftImpressionRank))
          as ResGiftImpressionRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGiftImpressionRank create() => ResGiftImpressionRank._();
  ResGiftImpressionRank createEmptyInstance() => create();
  static $pb.PbList<ResGiftImpressionRank> createRepeated() =>
      $pb.PbList<ResGiftImpressionRank>();
  @$core.pragma('dart2js:noInline')
  static ResGiftImpressionRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGiftImpressionRank>(create);
  static ResGiftImpressionRank? _defaultInstance;

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
  GiftImpressionRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftImpressionRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftImpressionRankData ensureData() => $_ensure(2);
}

class GiftImpressionRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftImpressionRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GiftImpressionTag>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tags',
        $pb.PbFieldType.PM,
        subBuilder: GiftImpressionTag.create)
    ..pc<GiftImpressionRank>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: GiftImpressionRank.create)
    ..hasRequiredFields = false;

  GiftImpressionRankData._() : super();
  factory GiftImpressionRankData({
    $core.Iterable<GiftImpressionTag>? tags,
    $core.Iterable<GiftImpressionRank>? list,
  }) {
    final _result = create();
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory GiftImpressionRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftImpressionRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftImpressionRankData clone() =>
      GiftImpressionRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftImpressionRankData copyWith(
          void Function(GiftImpressionRankData) updates) =>
      super.copyWith((message) => updates(message as GiftImpressionRankData))
          as GiftImpressionRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftImpressionRankData create() => GiftImpressionRankData._();
  GiftImpressionRankData createEmptyInstance() => create();
  static $pb.PbList<GiftImpressionRankData> createRepeated() =>
      $pb.PbList<GiftImpressionRankData>();
  @$core.pragma('dart2js:noInline')
  static GiftImpressionRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftImpressionRankData>(create);
  static GiftImpressionRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GiftImpressionTag> get tags => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<GiftImpressionRank> get list => $_getList(1);
}

class GiftImpressionTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftImpressionTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagName')
    ..hasRequiredFields = false;

  GiftImpressionTag._() : super();
  factory GiftImpressionTag({
    $core.int? tagId,
    $core.String? tagName,
  }) {
    final _result = create();
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (tagName != null) {
      _result.tagName = tagName;
    }
    return _result;
  }
  factory GiftImpressionTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftImpressionTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftImpressionTag clone() => GiftImpressionTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftImpressionTag copyWith(void Function(GiftImpressionTag) updates) =>
      super.copyWith((message) => updates(message as GiftImpressionTag))
          as GiftImpressionTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftImpressionTag create() => GiftImpressionTag._();
  GiftImpressionTag createEmptyInstance() => create();
  static $pb.PbList<GiftImpressionTag> createRepeated() =>
      $pb.PbList<GiftImpressionTag>();
  @$core.pragma('dart2js:noInline')
  static GiftImpressionTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftImpressionTag>(create);
  static GiftImpressionTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tagName => $_getSZ(1);
  @$pb.TagNumber(2)
  set tagName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTagName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTagName() => clearField(2);
}

class GiftImpressionRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftImpressionRank',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userName')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftImpressionRank._() : super();
  factory GiftImpressionRank({
    $core.int? rank,
    $core.int? uid,
    $core.String? userName,
    $core.String? userIcon,
    $core.int? score,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank = rank;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory GiftImpressionRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftImpressionRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftImpressionRank clone() => GiftImpressionRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftImpressionRank copyWith(void Function(GiftImpressionRank) updates) =>
      super.copyWith((message) => updates(message as GiftImpressionRank))
          as GiftImpressionRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftImpressionRank create() => GiftImpressionRank._();
  GiftImpressionRank createEmptyInstance() => create();
  static $pb.PbList<GiftImpressionRank> createRepeated() =>
      $pb.PbList<GiftImpressionRank>();
  @$core.pragma('dart2js:noInline')
  static GiftImpressionRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftImpressionRank>(create);
  static GiftImpressionRank? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rank => $_getIZ(0);
  @$pb.TagNumber(1)
  set rank($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearRank() => clearField(1);

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

  @$pb.TagNumber(3)
  $core.String get userName => $_getSZ(2);
  @$pb.TagNumber(3)
  set userName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUserName() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set userIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUserIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get score => $_getIZ(4);
  @$pb.TagNumber(5)
  set score($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearScore() => clearField(5);
}
