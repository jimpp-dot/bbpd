///
//  Generated code. Do not modify.
//  source: emotion.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'emotion.pbenum.dart';

export 'emotion.pbenum.dart';

class EmojiItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EmojiItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'key')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlyInMic',
        protoName: 'onlyInMic')
    ..hasRequiredFields = false;

  EmojiItem._() : super();
  factory EmojiItem({
    $core.String? key,
    $core.String? name,
    $core.bool? onlyInMic,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (name != null) {
      _result.name = name;
    }
    if (onlyInMic != null) {
      _result.onlyInMic = onlyInMic;
    }
    return _result;
  }
  factory EmojiItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EmojiItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EmojiItem clone() => EmojiItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EmojiItem copyWith(void Function(EmojiItem) updates) =>
      super.copyWith((message) => updates(message as EmojiItem))
          as EmojiItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmojiItem create() => EmojiItem._();
  EmojiItem createEmptyInstance() => create();
  static $pb.PbList<EmojiItem> createRepeated() => $pb.PbList<EmojiItem>();
  @$core.pragma('dart2js:noInline')
  static EmojiItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmojiItem>(create);
  static EmojiItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

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
  $core.bool get onlyInMic => $_getBF(2);
  @$pb.TagNumber(3)
  set onlyInMic($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOnlyInMic() => $_has(2);
  @$pb.TagNumber(3)
  void clearOnlyInMic() => clearField(3);
}

class EmojiPrice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EmojiPrice',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..e<EmojiDurationType>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'durationType',
        $pb.PbFieldType.OE,
        defaultOrMaker: EmojiDurationType.EmojiDurationNone,
        valueOf: EmojiDurationType.valueOf,
        enumValues: EmojiDurationType.values)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'couponCid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'couponCount',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ductionMoney',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  EmojiPrice._() : super();
  factory EmojiPrice({
    EmojiDurationType? durationType,
    $core.int? price,
    $core.int? couponCid,
    $core.int? couponCount,
    $core.int? ductionMoney,
  }) {
    final _result = create();
    if (durationType != null) {
      _result.durationType = durationType;
    }
    if (price != null) {
      _result.price = price;
    }
    if (couponCid != null) {
      _result.couponCid = couponCid;
    }
    if (couponCount != null) {
      _result.couponCount = couponCount;
    }
    if (ductionMoney != null) {
      _result.ductionMoney = ductionMoney;
    }
    return _result;
  }
  factory EmojiPrice.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EmojiPrice.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EmojiPrice clone() => EmojiPrice()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EmojiPrice copyWith(void Function(EmojiPrice) updates) =>
      super.copyWith((message) => updates(message as EmojiPrice))
          as EmojiPrice; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmojiPrice create() => EmojiPrice._();
  EmojiPrice createEmptyInstance() => create();
  static $pb.PbList<EmojiPrice> createRepeated() => $pb.PbList<EmojiPrice>();
  @$core.pragma('dart2js:noInline')
  static EmojiPrice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmojiPrice>(create);
  static EmojiPrice? _defaultInstance;

  @$pb.TagNumber(1)
  EmojiDurationType get durationType => $_getN(0);
  @$pb.TagNumber(1)
  set durationType(EmojiDurationType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDurationType() => $_has(0);
  @$pb.TagNumber(1)
  void clearDurationType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get price => $_getIZ(1);
  @$pb.TagNumber(2)
  set price($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get couponCid => $_getIZ(2);
  @$pb.TagNumber(3)
  set couponCid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCouponCid() => $_has(2);
  @$pb.TagNumber(3)
  void clearCouponCid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get couponCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set couponCount($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCouponCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCouponCount() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get ductionMoney => $_getIZ(4);
  @$pb.TagNumber(5)
  set ductionMoney($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDuctionMoney() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuctionMoney() => clearField(5);
}

class EmojiTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EmojiTab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'iconKey')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabName')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftSeconds',
        $pb.PbFieldType.O3)
    ..pc<EmojiItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: EmojiItem.create)
    ..pc<EmojiPrice>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.PM,
        subBuilder: EmojiPrice.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'esId',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background')
    ..hasRequiredFields = false;

  EmojiTab._() : super();
  factory EmojiTab({
    $core.String? iconKey,
    $core.String? tabName,
    $core.int? leftSeconds,
    $core.Iterable<EmojiItem>? list,
    $core.Iterable<EmojiPrice>? price,
    $core.int? esId,
    $core.String? desc,
    $core.String? background,
  }) {
    final _result = create();
    if (iconKey != null) {
      _result.iconKey = iconKey;
    }
    if (tabName != null) {
      _result.tabName = tabName;
    }
    if (leftSeconds != null) {
      _result.leftSeconds = leftSeconds;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (price != null) {
      _result.price.addAll(price);
    }
    if (esId != null) {
      _result.esId = esId;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (background != null) {
      _result.background = background;
    }
    return _result;
  }
  factory EmojiTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EmojiTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EmojiTab clone() => EmojiTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EmojiTab copyWith(void Function(EmojiTab) updates) =>
      super.copyWith((message) => updates(message as EmojiTab))
          as EmojiTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmojiTab create() => EmojiTab._();
  EmojiTab createEmptyInstance() => create();
  static $pb.PbList<EmojiTab> createRepeated() => $pb.PbList<EmojiTab>();
  @$core.pragma('dart2js:noInline')
  static EmojiTab getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmojiTab>(create);
  static EmojiTab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get iconKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set iconKey($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIconKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearIconKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tabName => $_getSZ(1);
  @$pb.TagNumber(2)
  set tabName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTabName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTabName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get leftSeconds => $_getIZ(2);
  @$pb.TagNumber(3)
  set leftSeconds($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLeftSeconds() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeftSeconds() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<EmojiItem> get list => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<EmojiPrice> get price => $_getList(4);

  @$pb.TagNumber(6)
  $core.int get esId => $_getIZ(5);
  @$pb.TagNumber(6)
  set esId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasEsId() => $_has(5);
  @$pb.TagNumber(6)
  void clearEsId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get desc => $_getSZ(6);
  @$pb.TagNumber(7)
  set desc($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDesc() => $_has(6);
  @$pb.TagNumber(7)
  void clearDesc() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get background => $_getSZ(7);
  @$pb.TagNumber(8)
  set background($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasBackground() => $_has(7);
  @$pb.TagNumber(8)
  void clearBackground() => clearField(8);
}

class BodyEmojiConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BodyEmojiConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<EmojiTab>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'emojiTabList',
        $pb.PbFieldType.PM,
        subBuilder: EmojiTab.create)
    ..hasRequiredFields = false;

  BodyEmojiConfig._() : super();
  factory BodyEmojiConfig({
    $core.Iterable<EmojiTab>? emojiTabList,
  }) {
    final _result = create();
    if (emojiTabList != null) {
      _result.emojiTabList.addAll(emojiTabList);
    }
    return _result;
  }
  factory BodyEmojiConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BodyEmojiConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BodyEmojiConfig clone() => BodyEmojiConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BodyEmojiConfig copyWith(void Function(BodyEmojiConfig) updates) =>
      super.copyWith((message) => updates(message as BodyEmojiConfig))
          as BodyEmojiConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BodyEmojiConfig create() => BodyEmojiConfig._();
  BodyEmojiConfig createEmptyInstance() => create();
  static $pb.PbList<BodyEmojiConfig> createRepeated() =>
      $pb.PbList<BodyEmojiConfig>();
  @$core.pragma('dart2js:noInline')
  static BodyEmojiConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BodyEmojiConfig>(create);
  static BodyEmojiConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<EmojiTab> get emojiTabList => $_getList(0);
}

class ResEmojiConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResEmojiConfig',
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
    ..aOM<BodyEmojiConfig>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BodyEmojiConfig.create)
    ..hasRequiredFields = false;

  ResEmojiConfig._() : super();
  factory ResEmojiConfig({
    $core.bool? success,
    $core.String? msg,
    BodyEmojiConfig? data,
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
  factory ResEmojiConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResEmojiConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResEmojiConfig clone() => ResEmojiConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResEmojiConfig copyWith(void Function(ResEmojiConfig) updates) =>
      super.copyWith((message) => updates(message as ResEmojiConfig))
          as ResEmojiConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResEmojiConfig create() => ResEmojiConfig._();
  ResEmojiConfig createEmptyInstance() => create();
  static $pb.PbList<ResEmojiConfig> createRepeated() =>
      $pb.PbList<ResEmojiConfig>();
  @$core.pragma('dart2js:noInline')
  static ResEmojiConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResEmojiConfig>(create);
  static ResEmojiConfig? _defaultInstance;

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
  BodyEmojiConfig get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BodyEmojiConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BodyEmojiConfig ensureData() => $_ensure(2);
}
