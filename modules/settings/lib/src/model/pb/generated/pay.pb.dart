///
//  Generated code. Do not modify.
//  source: pay.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResPayTimeLimitProduct extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResPayTimeLimitProduct',
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
    ..aOM<PayTimeLimitProductData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PayTimeLimitProductData.create)
    ..hasRequiredFields = false;

  ResPayTimeLimitProduct._() : super();
  factory ResPayTimeLimitProduct({
    $core.bool? success,
    $core.String? msg,
    PayTimeLimitProductData? data,
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
  factory ResPayTimeLimitProduct.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResPayTimeLimitProduct.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResPayTimeLimitProduct clone() =>
      ResPayTimeLimitProduct()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResPayTimeLimitProduct copyWith(
          void Function(ResPayTimeLimitProduct) updates) =>
      super.copyWith((message) => updates(message as ResPayTimeLimitProduct))
          as ResPayTimeLimitProduct; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResPayTimeLimitProduct create() => ResPayTimeLimitProduct._();
  ResPayTimeLimitProduct createEmptyInstance() => create();
  static $pb.PbList<ResPayTimeLimitProduct> createRepeated() =>
      $pb.PbList<ResPayTimeLimitProduct>();
  @$core.pragma('dart2js:noInline')
  static ResPayTimeLimitProduct getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResPayTimeLimitProduct>(create);
  static ResPayTimeLimitProduct? _defaultInstance;

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
  PayTimeLimitProductData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(PayTimeLimitProductData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  PayTimeLimitProductData ensureData() => $_ensure(2);
}

class PayTimeLimitProductData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PayTimeLimitProductData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PayTimeLimitProduct>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: PayTimeLimitProduct.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftTime',
        $pb.PbFieldType.OU3)
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platforms')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selectIndex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PayTimeLimitProductData._() : super();
  factory PayTimeLimitProductData({
    $core.Iterable<PayTimeLimitProduct>? list,
    $core.int? leftTime,
    $core.Iterable<$core.String>? platforms,
    $core.int? selectIndex,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (leftTime != null) {
      _result.leftTime = leftTime;
    }
    if (platforms != null) {
      _result.platforms.addAll(platforms);
    }
    if (selectIndex != null) {
      _result.selectIndex = selectIndex;
    }
    return _result;
  }
  factory PayTimeLimitProductData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PayTimeLimitProductData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PayTimeLimitProductData clone() =>
      PayTimeLimitProductData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PayTimeLimitProductData copyWith(
          void Function(PayTimeLimitProductData) updates) =>
      super.copyWith((message) => updates(message as PayTimeLimitProductData))
          as PayTimeLimitProductData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PayTimeLimitProductData create() => PayTimeLimitProductData._();
  PayTimeLimitProductData createEmptyInstance() => create();
  static $pb.PbList<PayTimeLimitProductData> createRepeated() =>
      $pb.PbList<PayTimeLimitProductData>();
  @$core.pragma('dart2js:noInline')
  static PayTimeLimitProductData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayTimeLimitProductData>(create);
  static PayTimeLimitProductData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PayTimeLimitProduct> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get leftTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set leftTime($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLeftTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeftTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get platforms => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get selectIndex => $_getIZ(3);
  @$pb.TagNumber(4)
  set selectIndex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSelectIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSelectIndex() => clearField(4);
}

class PayTimeLimitProduct extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PayTimeLimitProduct',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'real',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giveMoney',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..pc<PayTimeLimitProductAward>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awards',
        $pb.PbFieldType.PM,
        subBuilder: PayTimeLimitProductAward.create)
    ..hasRequiredFields = false;

  PayTimeLimitProduct._() : super();
  factory PayTimeLimitProduct({
    $core.int? id,
    $core.int? money,
    $core.int? real,
    $core.int? giveMoney,
    $core.String? name,
    $core.Iterable<PayTimeLimitProductAward>? awards,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (money != null) {
      _result.money = money;
    }
    if (real != null) {
      _result.real = real;
    }
    if (giveMoney != null) {
      _result.giveMoney = giveMoney;
    }
    if (name != null) {
      _result.name = name;
    }
    if (awards != null) {
      _result.awards.addAll(awards);
    }
    return _result;
  }
  factory PayTimeLimitProduct.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PayTimeLimitProduct.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PayTimeLimitProduct clone() => PayTimeLimitProduct()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PayTimeLimitProduct copyWith(void Function(PayTimeLimitProduct) updates) =>
      super.copyWith((message) => updates(message as PayTimeLimitProduct))
          as PayTimeLimitProduct; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PayTimeLimitProduct create() => PayTimeLimitProduct._();
  PayTimeLimitProduct createEmptyInstance() => create();
  static $pb.PbList<PayTimeLimitProduct> createRepeated() =>
      $pb.PbList<PayTimeLimitProduct>();
  @$core.pragma('dart2js:noInline')
  static PayTimeLimitProduct getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayTimeLimitProduct>(create);
  static PayTimeLimitProduct? _defaultInstance;

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
  $core.int get money => $_getIZ(1);
  @$pb.TagNumber(2)
  set money($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMoney() => $_has(1);
  @$pb.TagNumber(2)
  void clearMoney() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get real => $_getIZ(2);
  @$pb.TagNumber(3)
  set real($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasReal() => $_has(2);
  @$pb.TagNumber(3)
  void clearReal() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get giveMoney => $_getIZ(3);
  @$pb.TagNumber(4)
  set giveMoney($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiveMoney() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiveMoney() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<PayTimeLimitProductAward> get awards => $_getList(5);
}

class PayTimeLimitProductAward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PayTimeLimitProductAward',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
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
            : 'type',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PayTimeLimitProductAward._() : super();
  factory PayTimeLimitProductAward({
    $core.String? title,
    $core.String? name,
    $core.String? icon,
    $core.int? type,
    $core.int? money,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (type != null) {
      _result.type = type;
    }
    if (money != null) {
      _result.money = money;
    }
    return _result;
  }
  factory PayTimeLimitProductAward.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PayTimeLimitProductAward.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PayTimeLimitProductAward clone() =>
      PayTimeLimitProductAward()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PayTimeLimitProductAward copyWith(
          void Function(PayTimeLimitProductAward) updates) =>
      super.copyWith((message) => updates(message as PayTimeLimitProductAward))
          as PayTimeLimitProductAward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PayTimeLimitProductAward create() => PayTimeLimitProductAward._();
  PayTimeLimitProductAward createEmptyInstance() => create();
  static $pb.PbList<PayTimeLimitProductAward> createRepeated() =>
      $pb.PbList<PayTimeLimitProductAward>();
  @$core.pragma('dart2js:noInline')
  static PayTimeLimitProductAward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayTimeLimitProductAward>(create);
  static PayTimeLimitProductAward? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

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
  $core.int get type => $_getIZ(3);
  @$pb.TagNumber(4)
  set type($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get money => $_getIZ(4);
  @$pb.TagNumber(5)
  set money($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMoney() => $_has(4);
  @$pb.TagNumber(5)
  void clearMoney() => clearField(5);
}
