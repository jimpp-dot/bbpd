///
//  Generated code. Do not modify.
//  source: business_wedding.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class BusinessWeddingConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BusinessWeddingConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<BusinessWeddingBase>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wedding',
        subBuilder: BusinessWeddingBase.create)
    ..aOM<BusinessWeddingEffectConfig>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effect',
        subBuilder: BusinessWeddingEffectConfig.create)
    ..hasRequiredFields = false;

  BusinessWeddingConfig._() : super();
  factory BusinessWeddingConfig({
    BusinessWeddingBase? wedding,
    BusinessWeddingEffectConfig? effect,
  }) {
    final _result = create();
    if (wedding != null) {
      _result.wedding = wedding;
    }
    if (effect != null) {
      _result.effect = effect;
    }
    return _result;
  }
  factory BusinessWeddingConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BusinessWeddingConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BusinessWeddingConfig clone() =>
      BusinessWeddingConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BusinessWeddingConfig copyWith(
          void Function(BusinessWeddingConfig) updates) =>
      super.copyWith((message) => updates(message as BusinessWeddingConfig))
          as BusinessWeddingConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BusinessWeddingConfig create() => BusinessWeddingConfig._();
  BusinessWeddingConfig createEmptyInstance() => create();
  static $pb.PbList<BusinessWeddingConfig> createRepeated() =>
      $pb.PbList<BusinessWeddingConfig>();
  @$core.pragma('dart2js:noInline')
  static BusinessWeddingConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BusinessWeddingConfig>(create);
  static BusinessWeddingConfig? _defaultInstance;

  @$pb.TagNumber(1)
  BusinessWeddingBase get wedding => $_getN(0);
  @$pb.TagNumber(1)
  set wedding(BusinessWeddingBase v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasWedding() => $_has(0);
  @$pb.TagNumber(1)
  void clearWedding() => clearField(1);
  @$pb.TagNumber(1)
  BusinessWeddingBase ensureWedding() => $_ensure(0);

  @$pb.TagNumber(2)
  BusinessWeddingEffectConfig get effect => $_getN(1);
  @$pb.TagNumber(2)
  set effect(BusinessWeddingEffectConfig v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEffect() => $_has(1);
  @$pb.TagNumber(2)
  void clearEffect() => clearField(2);
  @$pb.TagNumber(2)
  BusinessWeddingEffectConfig ensureEffect() => $_ensure(1);
}

class BusinessWeddingEffectConfig_BusinessWeddingEffectItem
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BusinessWeddingEffectConfig.BusinessWeddingEffectItem',
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
            : 'size',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BusinessWeddingEffectConfig_BusinessWeddingEffectItem._() : super();
  factory BusinessWeddingEffectConfig_BusinessWeddingEffectItem({
    $core.String? url,
    $core.int? size,
  }) {
    final _result = create();
    if (url != null) {
      _result.url = url;
    }
    if (size != null) {
      _result.size = size;
    }
    return _result;
  }
  factory BusinessWeddingEffectConfig_BusinessWeddingEffectItem.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BusinessWeddingEffectConfig_BusinessWeddingEffectItem.fromJson(
          $core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BusinessWeddingEffectConfig_BusinessWeddingEffectItem clone() =>
      BusinessWeddingEffectConfig_BusinessWeddingEffectItem()
        ..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BusinessWeddingEffectConfig_BusinessWeddingEffectItem copyWith(
          void Function(BusinessWeddingEffectConfig_BusinessWeddingEffectItem)
              updates) =>
      super.copyWith((message) => updates(
              message as BusinessWeddingEffectConfig_BusinessWeddingEffectItem))
          as BusinessWeddingEffectConfig_BusinessWeddingEffectItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BusinessWeddingEffectConfig_BusinessWeddingEffectItem create() =>
      BusinessWeddingEffectConfig_BusinessWeddingEffectItem._();
  BusinessWeddingEffectConfig_BusinessWeddingEffectItem createEmptyInstance() =>
      create();
  static $pb.PbList<BusinessWeddingEffectConfig_BusinessWeddingEffectItem>
      createRepeated() =>
          $pb.PbList<BusinessWeddingEffectConfig_BusinessWeddingEffectItem>();
  @$core.pragma('dart2js:noInline')
  static BusinessWeddingEffectConfig_BusinessWeddingEffectItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          BusinessWeddingEffectConfig_BusinessWeddingEffectItem>(create);
  static BusinessWeddingEffectConfig_BusinessWeddingEffectItem?
      _defaultInstance;

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
  $core.int get size => $_getIZ(1);
  @$pb.TagNumber(2)
  set size($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => clearField(2);
}

class BusinessWeddingEffectConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BusinessWeddingEffectConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<BusinessWeddingEffectConfig_BusinessWeddingEffectItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'opening',
        subBuilder:
            BusinessWeddingEffectConfig_BusinessWeddingEffectItem.create)
    ..aOM<BusinessWeddingEffectConfig_BusinessWeddingEffectItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ringExchange',
        protoName: 'ringExchange',
        subBuilder:
            BusinessWeddingEffectConfig_BusinessWeddingEffectItem.create)
    ..aOM<BusinessWeddingEffectConfig_BusinessWeddingEffectItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ending',
        subBuilder:
            BusinessWeddingEffectConfig_BusinessWeddingEffectItem.create)
    ..hasRequiredFields = false;

  BusinessWeddingEffectConfig._() : super();
  factory BusinessWeddingEffectConfig({
    BusinessWeddingEffectConfig_BusinessWeddingEffectItem? opening,
    BusinessWeddingEffectConfig_BusinessWeddingEffectItem? ringExchange,
    BusinessWeddingEffectConfig_BusinessWeddingEffectItem? ending,
  }) {
    final _result = create();
    if (opening != null) {
      _result.opening = opening;
    }
    if (ringExchange != null) {
      _result.ringExchange = ringExchange;
    }
    if (ending != null) {
      _result.ending = ending;
    }
    return _result;
  }
  factory BusinessWeddingEffectConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BusinessWeddingEffectConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BusinessWeddingEffectConfig clone() =>
      BusinessWeddingEffectConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BusinessWeddingEffectConfig copyWith(
          void Function(BusinessWeddingEffectConfig) updates) =>
      super.copyWith(
              (message) => updates(message as BusinessWeddingEffectConfig))
          as BusinessWeddingEffectConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BusinessWeddingEffectConfig create() =>
      BusinessWeddingEffectConfig._();
  BusinessWeddingEffectConfig createEmptyInstance() => create();
  static $pb.PbList<BusinessWeddingEffectConfig> createRepeated() =>
      $pb.PbList<BusinessWeddingEffectConfig>();
  @$core.pragma('dart2js:noInline')
  static BusinessWeddingEffectConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BusinessWeddingEffectConfig>(create);
  static BusinessWeddingEffectConfig? _defaultInstance;

  @$pb.TagNumber(1)
  BusinessWeddingEffectConfig_BusinessWeddingEffectItem get opening =>
      $_getN(0);
  @$pb.TagNumber(1)
  set opening(BusinessWeddingEffectConfig_BusinessWeddingEffectItem v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOpening() => $_has(0);
  @$pb.TagNumber(1)
  void clearOpening() => clearField(1);
  @$pb.TagNumber(1)
  BusinessWeddingEffectConfig_BusinessWeddingEffectItem ensureOpening() =>
      $_ensure(0);

  @$pb.TagNumber(2)
  BusinessWeddingEffectConfig_BusinessWeddingEffectItem get ringExchange =>
      $_getN(1);
  @$pb.TagNumber(2)
  set ringExchange(BusinessWeddingEffectConfig_BusinessWeddingEffectItem v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRingExchange() => $_has(1);
  @$pb.TagNumber(2)
  void clearRingExchange() => clearField(2);
  @$pb.TagNumber(2)
  BusinessWeddingEffectConfig_BusinessWeddingEffectItem ensureRingExchange() =>
      $_ensure(1);

  @$pb.TagNumber(3)
  BusinessWeddingEffectConfig_BusinessWeddingEffectItem get ending => $_getN(2);
  @$pb.TagNumber(3)
  set ending(BusinessWeddingEffectConfig_BusinessWeddingEffectItem v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEnding() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnding() => clearField(3);
  @$pb.TagNumber(3)
  BusinessWeddingEffectConfig_BusinessWeddingEffectItem ensureEnding() =>
      $_ensure(2);
}

class BusinessWeddingBase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BusinessWeddingBase',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  BusinessWeddingBase._() : super();
  factory BusinessWeddingBase({
    $core.int? state,
    $fixnum.Int64? score,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory BusinessWeddingBase.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BusinessWeddingBase.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BusinessWeddingBase clone() => BusinessWeddingBase()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BusinessWeddingBase copyWith(void Function(BusinessWeddingBase) updates) =>
      super.copyWith((message) => updates(message as BusinessWeddingBase))
          as BusinessWeddingBase; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BusinessWeddingBase create() => BusinessWeddingBase._();
  BusinessWeddingBase createEmptyInstance() => create();
  static $pb.PbList<BusinessWeddingBase> createRepeated() =>
      $pb.PbList<BusinessWeddingBase>();
  @$core.pragma('dart2js:noInline')
  static BusinessWeddingBase getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BusinessWeddingBase>(create);
  static BusinessWeddingBase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get state => $_getIZ(0);
  @$pb.TagNumber(1)
  set state($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get score => $_getI64(1);
  @$pb.TagNumber(2)
  set score($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => clearField(2);
}

class BusinessWeddingConfigResponseApi extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BusinessWeddingConfigResponseApi',
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
    ..aOM<BusinessWeddingConfig>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BusinessWeddingConfig.create)
    ..hasRequiredFields = false;

  BusinessWeddingConfigResponseApi._() : super();
  factory BusinessWeddingConfigResponseApi({
    $core.bool? success,
    $core.String? message,
    BusinessWeddingConfig? data,
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
  factory BusinessWeddingConfigResponseApi.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BusinessWeddingConfigResponseApi.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BusinessWeddingConfigResponseApi clone() =>
      BusinessWeddingConfigResponseApi()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BusinessWeddingConfigResponseApi copyWith(
          void Function(BusinessWeddingConfigResponseApi) updates) =>
      super.copyWith(
              (message) => updates(message as BusinessWeddingConfigResponseApi))
          as BusinessWeddingConfigResponseApi; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BusinessWeddingConfigResponseApi create() =>
      BusinessWeddingConfigResponseApi._();
  BusinessWeddingConfigResponseApi createEmptyInstance() => create();
  static $pb.PbList<BusinessWeddingConfigResponseApi> createRepeated() =>
      $pb.PbList<BusinessWeddingConfigResponseApi>();
  @$core.pragma('dart2js:noInline')
  static BusinessWeddingConfigResponseApi getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BusinessWeddingConfigResponseApi>(
          create);
  static BusinessWeddingConfigResponseApi? _defaultInstance;

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
  BusinessWeddingConfig get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BusinessWeddingConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BusinessWeddingConfig ensureData() => $_ensure(2);
}
