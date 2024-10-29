///
//  Generated code. Do not modify.
//  source: general_setting.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResGetGeneralSetting extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGetGeneralSetting',
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
    ..aOM<GeneralSettingData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GeneralSettingData.create)
    ..hasRequiredFields = false;

  ResGetGeneralSetting._() : super();
  factory ResGetGeneralSetting({
    $core.bool? success,
    $core.String? msg,
    GeneralSettingData? data,
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
  factory ResGetGeneralSetting.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGetGeneralSetting.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGetGeneralSetting clone() =>
      ResGetGeneralSetting()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGetGeneralSetting copyWith(void Function(ResGetGeneralSetting) updates) =>
      super.copyWith((message) => updates(message as ResGetGeneralSetting))
          as ResGetGeneralSetting; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGetGeneralSetting create() => ResGetGeneralSetting._();
  ResGetGeneralSetting createEmptyInstance() => create();
  static $pb.PbList<ResGetGeneralSetting> createRepeated() =>
      $pb.PbList<ResGetGeneralSetting>();
  @$core.pragma('dart2js:noInline')
  static ResGetGeneralSetting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGetGeneralSetting>(create);
  static ResGetGeneralSetting? _defaultInstance;

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
  GeneralSettingData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GeneralSettingData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GeneralSettingData ensureData() => $_ensure(2);
}

class GeneralSettingData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GeneralSettingData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'closeSpecialEffectsScene',
        $pb.PbFieldType.OU3,
        protoName: 'closeSpecialEffectsScene')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'oneKeyProtection',
        $pb.PbFieldType.OU3,
        protoName: 'oneKeyProtection')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privateMessageNoti',
        $pb.PbFieldType.OU3,
        protoName: 'privateMessageNoti')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'closeGloryDisplay',
        $pb.PbFieldType.OU3,
        protoName: 'closeGloryDisplay')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'closeBirthdayRemind',
        $pb.PbFieldType.OU3,
        protoName: 'closeBirthdayRemind')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'closeAutoGreet',
        $pb.PbFieldType.OU3,
        protoName: 'closeAutoGreet')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'closeTopicChatRcm',
        $pb.PbFieldType.OU3,
        protoName: 'closeTopicChatRcm')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'openTitleExclusiveMic',
        $pb.PbFieldType.OU3,
        protoName: 'openTitleExclusiveMic')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'closeBootRoomRecommend',
        $pb.PbFieldType.OU3,
        protoName: 'closeBootRoomRecommend')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'closeReceiveGameOrder',
        $pb.PbFieldType.OU3,
        protoName: 'closeReceiveGameOrder')
    ..hasRequiredFields = false;

  GeneralSettingData._() : super();
  factory GeneralSettingData({
    $core.int? closeSpecialEffectsScene,
    $core.int? oneKeyProtection,
    $core.int? privateMessageNoti,
    $core.int? closeGloryDisplay,
    $core.int? closeBirthdayRemind,
    $core.int? closeAutoGreet,
    $core.int? closeTopicChatRcm,
    $core.int? openTitleExclusiveMic,
    $core.int? closeBootRoomRecommend,
    $core.int? closeReceiveGameOrder,
  }) {
    final _result = create();
    if (closeSpecialEffectsScene != null) {
      _result.closeSpecialEffectsScene = closeSpecialEffectsScene;
    }
    if (oneKeyProtection != null) {
      _result.oneKeyProtection = oneKeyProtection;
    }
    if (privateMessageNoti != null) {
      _result.privateMessageNoti = privateMessageNoti;
    }
    if (closeGloryDisplay != null) {
      _result.closeGloryDisplay = closeGloryDisplay;
    }
    if (closeBirthdayRemind != null) {
      _result.closeBirthdayRemind = closeBirthdayRemind;
    }
    if (closeAutoGreet != null) {
      _result.closeAutoGreet = closeAutoGreet;
    }
    if (closeTopicChatRcm != null) {
      _result.closeTopicChatRcm = closeTopicChatRcm;
    }
    if (openTitleExclusiveMic != null) {
      _result.openTitleExclusiveMic = openTitleExclusiveMic;
    }
    if (closeBootRoomRecommend != null) {
      _result.closeBootRoomRecommend = closeBootRoomRecommend;
    }
    if (closeReceiveGameOrder != null) {
      _result.closeReceiveGameOrder = closeReceiveGameOrder;
    }
    return _result;
  }
  factory GeneralSettingData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GeneralSettingData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GeneralSettingData clone() => GeneralSettingData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GeneralSettingData copyWith(void Function(GeneralSettingData) updates) =>
      super.copyWith((message) => updates(message as GeneralSettingData))
          as GeneralSettingData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GeneralSettingData create() => GeneralSettingData._();
  GeneralSettingData createEmptyInstance() => create();
  static $pb.PbList<GeneralSettingData> createRepeated() =>
      $pb.PbList<GeneralSettingData>();
  @$core.pragma('dart2js:noInline')
  static GeneralSettingData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GeneralSettingData>(create);
  static GeneralSettingData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get closeSpecialEffectsScene => $_getIZ(0);
  @$pb.TagNumber(1)
  set closeSpecialEffectsScene($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCloseSpecialEffectsScene() => $_has(0);
  @$pb.TagNumber(1)
  void clearCloseSpecialEffectsScene() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get oneKeyProtection => $_getIZ(1);
  @$pb.TagNumber(2)
  set oneKeyProtection($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOneKeyProtection() => $_has(1);
  @$pb.TagNumber(2)
  void clearOneKeyProtection() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get privateMessageNoti => $_getIZ(2);
  @$pb.TagNumber(3)
  set privateMessageNoti($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrivateMessageNoti() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrivateMessageNoti() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get closeGloryDisplay => $_getIZ(3);
  @$pb.TagNumber(4)
  set closeGloryDisplay($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCloseGloryDisplay() => $_has(3);
  @$pb.TagNumber(4)
  void clearCloseGloryDisplay() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get closeBirthdayRemind => $_getIZ(4);
  @$pb.TagNumber(5)
  set closeBirthdayRemind($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCloseBirthdayRemind() => $_has(4);
  @$pb.TagNumber(5)
  void clearCloseBirthdayRemind() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get closeAutoGreet => $_getIZ(5);
  @$pb.TagNumber(6)
  set closeAutoGreet($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCloseAutoGreet() => $_has(5);
  @$pb.TagNumber(6)
  void clearCloseAutoGreet() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get closeTopicChatRcm => $_getIZ(6);
  @$pb.TagNumber(7)
  set closeTopicChatRcm($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCloseTopicChatRcm() => $_has(6);
  @$pb.TagNumber(7)
  void clearCloseTopicChatRcm() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get openTitleExclusiveMic => $_getIZ(7);
  @$pb.TagNumber(8)
  set openTitleExclusiveMic($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasOpenTitleExclusiveMic() => $_has(7);
  @$pb.TagNumber(8)
  void clearOpenTitleExclusiveMic() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get closeBootRoomRecommend => $_getIZ(8);
  @$pb.TagNumber(9)
  set closeBootRoomRecommend($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasCloseBootRoomRecommend() => $_has(8);
  @$pb.TagNumber(9)
  void clearCloseBootRoomRecommend() => clearField(9);

  @$pb.TagNumber(11)
  $core.int get closeReceiveGameOrder => $_getIZ(9);
  @$pb.TagNumber(11)
  set closeReceiveGameOrder($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasCloseReceiveGameOrder() => $_has(9);
  @$pb.TagNumber(11)
  void clearCloseReceiveGameOrder() => clearField(11);
}
