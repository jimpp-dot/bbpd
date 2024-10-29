///
//  Generated code. Do not modify.
//  source: super.voice.stage.config.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SuperVoiceStageConfig_Config_BuyerRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuperVoiceStageConfig.Config.BuyerRank',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'super.voice.stage.config'),
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
            : 'pay_price',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SuperVoiceStageConfig_Config_BuyerRank._() : super();
  factory SuperVoiceStageConfig_Config_BuyerRank({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
    $core.int? payPrice,
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
    if (payPrice != null) {
      _result.payPrice = payPrice;
    }
    return _result;
  }
  factory SuperVoiceStageConfig_Config_BuyerRank.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuperVoiceStageConfig_Config_BuyerRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig_Config_BuyerRank clone() =>
      SuperVoiceStageConfig_Config_BuyerRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig_Config_BuyerRank copyWith(
          void Function(SuperVoiceStageConfig_Config_BuyerRank) updates) =>
      super.copyWith((message) =>
              updates(message as SuperVoiceStageConfig_Config_BuyerRank))
          as SuperVoiceStageConfig_Config_BuyerRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig_Config_BuyerRank create() =>
      SuperVoiceStageConfig_Config_BuyerRank._();
  SuperVoiceStageConfig_Config_BuyerRank createEmptyInstance() => create();
  static $pb.PbList<SuperVoiceStageConfig_Config_BuyerRank> createRepeated() =>
      $pb.PbList<SuperVoiceStageConfig_Config_BuyerRank>();
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig_Config_BuyerRank getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SuperVoiceStageConfig_Config_BuyerRank>(create);
  static SuperVoiceStageConfig_Config_BuyerRank? _defaultInstance;

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
  $core.int get payPrice => $_getIZ(3);
  @$pb.TagNumber(4)
  set payPrice($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPayPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayPrice() => clearField(4);
}

class SuperVoiceStageConfig_Config_Gift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuperVoiceStageConfig.Config.Gift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'super.voice.stage.config'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_type')
    ..hasRequiredFields = false;

  SuperVoiceStageConfig_Config_Gift._() : super();
  factory SuperVoiceStageConfig_Config_Gift({
    $core.String? id,
    $core.String? name,
    $core.String? price,
    $core.String? giftType,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (price != null) {
      _result.price = price;
    }
    if (giftType != null) {
      _result.giftType = giftType;
    }
    return _result;
  }
  factory SuperVoiceStageConfig_Config_Gift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuperVoiceStageConfig_Config_Gift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig_Config_Gift clone() =>
      SuperVoiceStageConfig_Config_Gift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig_Config_Gift copyWith(
          void Function(SuperVoiceStageConfig_Config_Gift) updates) =>
      super.copyWith((message) =>
              updates(message as SuperVoiceStageConfig_Config_Gift))
          as SuperVoiceStageConfig_Config_Gift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig_Config_Gift create() =>
      SuperVoiceStageConfig_Config_Gift._();
  SuperVoiceStageConfig_Config_Gift createEmptyInstance() => create();
  static $pb.PbList<SuperVoiceStageConfig_Config_Gift> createRepeated() =>
      $pb.PbList<SuperVoiceStageConfig_Config_Gift>();
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig_Config_Gift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuperVoiceStageConfig_Config_Gift>(
          create);
  static SuperVoiceStageConfig_Config_Gift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
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
  $core.String get price => $_getSZ(2);
  @$pb.TagNumber(3)
  set price($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get giftType => $_getSZ(3);
  @$pb.TagNumber(4)
  set giftType($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftType() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftType() => clearField(4);
}

class SuperVoiceStageConfig_Config_ReceptorBtnInfo
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuperVoiceStageConfig.Config.ReceptorBtnInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'super.voice.stage.config'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  SuperVoiceStageConfig_Config_ReceptorBtnInfo._() : super();
  factory SuperVoiceStageConfig_Config_ReceptorBtnInfo({
    $core.String? color,
    $core.String? name,
  }) {
    final _result = create();
    if (color != null) {
      _result.color = color;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory SuperVoiceStageConfig_Config_ReceptorBtnInfo.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuperVoiceStageConfig_Config_ReceptorBtnInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig_Config_ReceptorBtnInfo clone() =>
      SuperVoiceStageConfig_Config_ReceptorBtnInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig_Config_ReceptorBtnInfo copyWith(
          void Function(SuperVoiceStageConfig_Config_ReceptorBtnInfo)
              updates) =>
      super.copyWith((message) =>
              updates(message as SuperVoiceStageConfig_Config_ReceptorBtnInfo))
          as SuperVoiceStageConfig_Config_ReceptorBtnInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig_Config_ReceptorBtnInfo create() =>
      SuperVoiceStageConfig_Config_ReceptorBtnInfo._();
  SuperVoiceStageConfig_Config_ReceptorBtnInfo createEmptyInstance() =>
      create();
  static $pb.PbList<SuperVoiceStageConfig_Config_ReceptorBtnInfo>
      createRepeated() =>
          $pb.PbList<SuperVoiceStageConfig_Config_ReceptorBtnInfo>();
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig_Config_ReceptorBtnInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SuperVoiceStageConfig_Config_ReceptorBtnInfo>(create);
  static SuperVoiceStageConfig_Config_ReceptorBtnInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get color => $_getSZ(0);
  @$pb.TagNumber(1)
  set color($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasColor() => $_has(0);
  @$pb.TagNumber(1)
  void clearColor() => clearField(1);

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
}

class SuperVoiceStageConfig_Config_ShowerStageInfo
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuperVoiceStageConfig.Config.ShowerStageInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'super.voice.stage.config'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'can_open_mic')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'counter_type',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expire_time',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stage_id')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stage_name')
    ..hasRequiredFields = false;

  SuperVoiceStageConfig_Config_ShowerStageInfo._() : super();
  factory SuperVoiceStageConfig_Config_ShowerStageInfo({
    $core.bool? canOpenMic,
    $core.int? counterType,
    $core.int? expireTime,
    $core.String? stageId,
    $core.String? stageName,
  }) {
    final _result = create();
    if (canOpenMic != null) {
      _result.canOpenMic = canOpenMic;
    }
    if (counterType != null) {
      _result.counterType = counterType;
    }
    if (expireTime != null) {
      _result.expireTime = expireTime;
    }
    if (stageId != null) {
      _result.stageId = stageId;
    }
    if (stageName != null) {
      _result.stageName = stageName;
    }
    return _result;
  }
  factory SuperVoiceStageConfig_Config_ShowerStageInfo.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuperVoiceStageConfig_Config_ShowerStageInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig_Config_ShowerStageInfo clone() =>
      SuperVoiceStageConfig_Config_ShowerStageInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig_Config_ShowerStageInfo copyWith(
          void Function(SuperVoiceStageConfig_Config_ShowerStageInfo)
              updates) =>
      super.copyWith((message) =>
              updates(message as SuperVoiceStageConfig_Config_ShowerStageInfo))
          as SuperVoiceStageConfig_Config_ShowerStageInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig_Config_ShowerStageInfo create() =>
      SuperVoiceStageConfig_Config_ShowerStageInfo._();
  SuperVoiceStageConfig_Config_ShowerStageInfo createEmptyInstance() =>
      create();
  static $pb.PbList<SuperVoiceStageConfig_Config_ShowerStageInfo>
      createRepeated() =>
          $pb.PbList<SuperVoiceStageConfig_Config_ShowerStageInfo>();
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig_Config_ShowerStageInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SuperVoiceStageConfig_Config_ShowerStageInfo>(create);
  static SuperVoiceStageConfig_Config_ShowerStageInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get canOpenMic => $_getBF(0);
  @$pb.TagNumber(1)
  set canOpenMic($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCanOpenMic() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanOpenMic() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get counterType => $_getIZ(1);
  @$pb.TagNumber(2)
  set counterType($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCounterType() => $_has(1);
  @$pb.TagNumber(2)
  void clearCounterType() => clearField(2);

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
  $core.String get stageId => $_getSZ(3);
  @$pb.TagNumber(4)
  set stageId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStageId() => $_has(3);
  @$pb.TagNumber(4)
  void clearStageId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get stageName => $_getSZ(4);
  @$pb.TagNumber(5)
  set stageName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStageName() => $_has(4);
  @$pb.TagNumber(5)
  void clearStageName() => clearField(5);
}

class SuperVoiceStageConfig_Config_ShowerInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuperVoiceStageConfig.Config.ShowerInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'super.voice.stage.config'),
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex')
    ..a<$core.double>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'start_price',
        $pb.PbFieldType.OD)
    ..aOM<SuperVoiceStageConfig_Config_AgentInfo>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'agent_info',
        subBuilder: SuperVoiceStageConfig_Config_AgentInfo.create)
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_new_shower')
    ..aOB(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'can_order_music')
    ..aOB(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'can_order_pay')
    ..hasRequiredFields = false;

  SuperVoiceStageConfig_Config_ShowerInfo._() : super();
  factory SuperVoiceStageConfig_Config_ShowerInfo({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
    $core.String? sex,
    $core.double? startPrice,
    SuperVoiceStageConfig_Config_AgentInfo? agentInfo,
    $core.bool? isNewShower,
    $core.bool? canOrderMusic,
    $core.bool? canOrderPay,
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
    if (startPrice != null) {
      _result.startPrice = startPrice;
    }
    if (agentInfo != null) {
      _result.agentInfo = agentInfo;
    }
    if (isNewShower != null) {
      _result.isNewShower = isNewShower;
    }
    if (canOrderMusic != null) {
      _result.canOrderMusic = canOrderMusic;
    }
    if (canOrderPay != null) {
      _result.canOrderPay = canOrderPay;
    }
    return _result;
  }
  factory SuperVoiceStageConfig_Config_ShowerInfo.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuperVoiceStageConfig_Config_ShowerInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig_Config_ShowerInfo clone() =>
      SuperVoiceStageConfig_Config_ShowerInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig_Config_ShowerInfo copyWith(
          void Function(SuperVoiceStageConfig_Config_ShowerInfo) updates) =>
      super.copyWith((message) =>
              updates(message as SuperVoiceStageConfig_Config_ShowerInfo))
          as SuperVoiceStageConfig_Config_ShowerInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig_Config_ShowerInfo create() =>
      SuperVoiceStageConfig_Config_ShowerInfo._();
  SuperVoiceStageConfig_Config_ShowerInfo createEmptyInstance() => create();
  static $pb.PbList<SuperVoiceStageConfig_Config_ShowerInfo> createRepeated() =>
      $pb.PbList<SuperVoiceStageConfig_Config_ShowerInfo>();
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig_Config_ShowerInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SuperVoiceStageConfig_Config_ShowerInfo>(create);
  static SuperVoiceStageConfig_Config_ShowerInfo? _defaultInstance;

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
  $core.String get sex => $_getSZ(3);
  @$pb.TagNumber(4)
  set sex($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get startPrice => $_getN(4);
  @$pb.TagNumber(5)
  set startPrice($core.double v) {
    $_setDouble(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStartPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearStartPrice() => clearField(5);

  @$pb.TagNumber(6)
  SuperVoiceStageConfig_Config_AgentInfo get agentInfo => $_getN(5);
  @$pb.TagNumber(6)
  set agentInfo(SuperVoiceStageConfig_Config_AgentInfo v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAgentInfo() => $_has(5);
  @$pb.TagNumber(6)
  void clearAgentInfo() => clearField(6);
  @$pb.TagNumber(6)
  SuperVoiceStageConfig_Config_AgentInfo ensureAgentInfo() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.bool get isNewShower => $_getBF(6);
  @$pb.TagNumber(7)
  set isNewShower($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIsNewShower() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsNewShower() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get canOrderMusic => $_getBF(7);
  @$pb.TagNumber(8)
  set canOrderMusic($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCanOrderMusic() => $_has(7);
  @$pb.TagNumber(8)
  void clearCanOrderMusic() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get canOrderPay => $_getBF(8);
  @$pb.TagNumber(9)
  set canOrderPay($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasCanOrderPay() => $_has(8);
  @$pb.TagNumber(9)
  void clearCanOrderPay() => clearField(9);
}

class SuperVoiceStageConfig_Config_AgentInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuperVoiceStageConfig.Config.AgentInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'super.voice.stage.config'),
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

  SuperVoiceStageConfig_Config_AgentInfo._() : super();
  factory SuperVoiceStageConfig_Config_AgentInfo({
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
  factory SuperVoiceStageConfig_Config_AgentInfo.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuperVoiceStageConfig_Config_AgentInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig_Config_AgentInfo clone() =>
      SuperVoiceStageConfig_Config_AgentInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig_Config_AgentInfo copyWith(
          void Function(SuperVoiceStageConfig_Config_AgentInfo) updates) =>
      super.copyWith((message) =>
              updates(message as SuperVoiceStageConfig_Config_AgentInfo))
          as SuperVoiceStageConfig_Config_AgentInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig_Config_AgentInfo create() =>
      SuperVoiceStageConfig_Config_AgentInfo._();
  SuperVoiceStageConfig_Config_AgentInfo createEmptyInstance() => create();
  static $pb.PbList<SuperVoiceStageConfig_Config_AgentInfo> createRepeated() =>
      $pb.PbList<SuperVoiceStageConfig_Config_AgentInfo>();
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig_Config_AgentInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SuperVoiceStageConfig_Config_AgentInfo>(create);
  static SuperVoiceStageConfig_Config_AgentInfo? _defaultInstance;

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

class SuperVoiceStageConfig_Config extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuperVoiceStageConfig.Config',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'super.voice.stage.config'),
      createEmptyInstance: create)
    ..pc<SuperVoiceStageConfig_Config_BuyerRank>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'buyer_rank',
        $pb.PbFieldType.PM,
        subBuilder: SuperVoiceStageConfig_Config_BuyerRank.create)
    ..pc<SuperVoiceStageConfig_Config_Gift>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        $pb.PbFieldType.PM,
        subBuilder: SuperVoiceStageConfig_Config_Gift.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'now_shower_position')
    ..aOM<SuperVoiceStageConfig_Config_ReceptorBtnInfo>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receptor_btn_info',
        subBuilder: SuperVoiceStageConfig_Config_ReceptorBtnInfo.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOM<SuperVoiceStageConfig_Config_ShowerInfo>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'shower_info',
        subBuilder: SuperVoiceStageConfig_Config_ShowerInfo.create)
    ..aOM<SuperVoiceStageConfig_Config_ShowerStageInfo>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'shower_stage_info',
        subBuilder: SuperVoiceStageConfig_Config_ShowerStageInfo.create)
    ..hasRequiredFields = false;

  SuperVoiceStageConfig_Config._() : super();
  factory SuperVoiceStageConfig_Config({
    $core.Iterable<SuperVoiceStageConfig_Config_BuyerRank>? buyerRank,
    $core.Iterable<SuperVoiceStageConfig_Config_Gift>? gift,
    $core.String? nowShowerPosition,
    SuperVoiceStageConfig_Config_ReceptorBtnInfo? receptorBtnInfo,
    $core.int? rid,
    SuperVoiceStageConfig_Config_ShowerInfo? showerInfo,
    SuperVoiceStageConfig_Config_ShowerStageInfo? showerStageInfo,
  }) {
    final _result = create();
    if (buyerRank != null) {
      _result.buyerRank.addAll(buyerRank);
    }
    if (gift != null) {
      _result.gift.addAll(gift);
    }
    if (nowShowerPosition != null) {
      _result.nowShowerPosition = nowShowerPosition;
    }
    if (receptorBtnInfo != null) {
      _result.receptorBtnInfo = receptorBtnInfo;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (showerInfo != null) {
      _result.showerInfo = showerInfo;
    }
    if (showerStageInfo != null) {
      _result.showerStageInfo = showerStageInfo;
    }
    return _result;
  }
  factory SuperVoiceStageConfig_Config.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuperVoiceStageConfig_Config.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig_Config clone() =>
      SuperVoiceStageConfig_Config()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig_Config copyWith(
          void Function(SuperVoiceStageConfig_Config) updates) =>
      super.copyWith(
              (message) => updates(message as SuperVoiceStageConfig_Config))
          as SuperVoiceStageConfig_Config; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig_Config create() =>
      SuperVoiceStageConfig_Config._();
  SuperVoiceStageConfig_Config createEmptyInstance() => create();
  static $pb.PbList<SuperVoiceStageConfig_Config> createRepeated() =>
      $pb.PbList<SuperVoiceStageConfig_Config>();
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig_Config getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuperVoiceStageConfig_Config>(create);
  static SuperVoiceStageConfig_Config? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SuperVoiceStageConfig_Config_BuyerRank> get buyerRank =>
      $_getList(0);

  @$pb.TagNumber(2)
  $core.List<SuperVoiceStageConfig_Config_Gift> get gift => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get nowShowerPosition => $_getSZ(2);
  @$pb.TagNumber(3)
  set nowShowerPosition($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNowShowerPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearNowShowerPosition() => clearField(3);

  @$pb.TagNumber(4)
  SuperVoiceStageConfig_Config_ReceptorBtnInfo get receptorBtnInfo => $_getN(3);
  @$pb.TagNumber(4)
  set receptorBtnInfo(SuperVoiceStageConfig_Config_ReceptorBtnInfo v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasReceptorBtnInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearReceptorBtnInfo() => clearField(4);
  @$pb.TagNumber(4)
  SuperVoiceStageConfig_Config_ReceptorBtnInfo ensureReceptorBtnInfo() =>
      $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get rid => $_getIZ(4);
  @$pb.TagNumber(5)
  set rid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRid() => $_has(4);
  @$pb.TagNumber(5)
  void clearRid() => clearField(5);

  @$pb.TagNumber(6)
  SuperVoiceStageConfig_Config_ShowerInfo get showerInfo => $_getN(5);
  @$pb.TagNumber(6)
  set showerInfo(SuperVoiceStageConfig_Config_ShowerInfo v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasShowerInfo() => $_has(5);
  @$pb.TagNumber(6)
  void clearShowerInfo() => clearField(6);
  @$pb.TagNumber(6)
  SuperVoiceStageConfig_Config_ShowerInfo ensureShowerInfo() => $_ensure(5);

  @$pb.TagNumber(7)
  SuperVoiceStageConfig_Config_ShowerStageInfo get showerStageInfo => $_getN(6);
  @$pb.TagNumber(7)
  set showerStageInfo(SuperVoiceStageConfig_Config_ShowerStageInfo v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasShowerStageInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearShowerStageInfo() => clearField(7);
  @$pb.TagNumber(7)
  SuperVoiceStageConfig_Config_ShowerStageInfo ensureShowerStageInfo() =>
      $_ensure(6);
}

class SuperVoiceStageConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuperVoiceStageConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'super.voice.stage.config'),
      createEmptyInstance: create)
    ..aOM<SuperVoiceStageConfig_Config>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'config',
        subBuilder: SuperVoiceStageConfig_Config.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SuperVoiceStageConfig._() : super();
  factory SuperVoiceStageConfig({
    SuperVoiceStageConfig_Config? config,
    $core.int? rid,
  }) {
    final _result = create();
    if (config != null) {
      _result.config = config;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    return _result;
  }
  factory SuperVoiceStageConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuperVoiceStageConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig clone() =>
      SuperVoiceStageConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuperVoiceStageConfig copyWith(
          void Function(SuperVoiceStageConfig) updates) =>
      super.copyWith((message) => updates(message as SuperVoiceStageConfig))
          as SuperVoiceStageConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig create() => SuperVoiceStageConfig._();
  SuperVoiceStageConfig createEmptyInstance() => create();
  static $pb.PbList<SuperVoiceStageConfig> createRepeated() =>
      $pb.PbList<SuperVoiceStageConfig>();
  @$core.pragma('dart2js:noInline')
  static SuperVoiceStageConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuperVoiceStageConfig>(create);
  static SuperVoiceStageConfig? _defaultInstance;

  @$pb.TagNumber(1)
  SuperVoiceStageConfig_Config get config => $_getN(0);
  @$pb.TagNumber(1)
  set config(SuperVoiceStageConfig_Config v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConfig() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfig() => clearField(1);
  @$pb.TagNumber(1)
  SuperVoiceStageConfig_Config ensureConfig() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get rid => $_getIZ(1);
  @$pb.TagNumber(2)
  set rid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => clearField(2);
}
