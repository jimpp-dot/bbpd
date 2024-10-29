///
//  Generated code. Do not modify.
//  source: room_cross_pk.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'punish.pb.dart' as $0;

import 'room_cross_pk.pbenum.dart';

export 'room_cross_pk.pbenum.dart';

class RoomCrossPkSettingMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkSettingMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'acceptInvite',
        $pb.PbFieldType.OU3,
        protoName: 'acceptInvite')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'acceptSpecialInvite',
        $pb.PbFieldType.OU3,
        protoName: 'acceptSpecialInvite')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'coinEnable',
        $pb.PbFieldType.OU3,
        protoName: 'coinEnable')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish',
        $pb.PbFieldType.O3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punishment')
    ..hasRequiredFields = false;

  RoomCrossPkSettingMessage._() : super();
  factory RoomCrossPkSettingMessage({
    $core.int? acceptInvite,
    $core.int? acceptSpecialInvite,
    $core.int? coinEnable,
    $core.int? duration,
    $core.int? punish,
    $core.String? punishment,
  }) {
    final _result = create();
    if (acceptInvite != null) {
      _result.acceptInvite = acceptInvite;
    }
    if (acceptSpecialInvite != null) {
      _result.acceptSpecialInvite = acceptSpecialInvite;
    }
    if (coinEnable != null) {
      _result.coinEnable = coinEnable;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (punish != null) {
      _result.punish = punish;
    }
    if (punishment != null) {
      _result.punishment = punishment;
    }
    return _result;
  }
  factory RoomCrossPkSettingMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkSettingMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkSettingMessage clone() =>
      RoomCrossPkSettingMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkSettingMessage copyWith(
          void Function(RoomCrossPkSettingMessage) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkSettingMessage))
          as RoomCrossPkSettingMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSettingMessage create() => RoomCrossPkSettingMessage._();
  RoomCrossPkSettingMessage createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkSettingMessage> createRepeated() =>
      $pb.PbList<RoomCrossPkSettingMessage>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSettingMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkSettingMessage>(create);
  static RoomCrossPkSettingMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get acceptInvite => $_getIZ(0);
  @$pb.TagNumber(1)
  set acceptInvite($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAcceptInvite() => $_has(0);
  @$pb.TagNumber(1)
  void clearAcceptInvite() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get acceptSpecialInvite => $_getIZ(1);
  @$pb.TagNumber(2)
  set acceptSpecialInvite($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAcceptSpecialInvite() => $_has(1);
  @$pb.TagNumber(2)
  void clearAcceptSpecialInvite() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get coinEnable => $_getIZ(2);
  @$pb.TagNumber(3)
  set coinEnable($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCoinEnable() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoinEnable() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get duration => $_getIZ(3);
  @$pb.TagNumber(4)
  set duration($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get punish => $_getIZ(4);
  @$pb.TagNumber(5)
  set punish($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPunish() => $_has(4);
  @$pb.TagNumber(5)
  void clearPunish() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get punishment => $_getSZ(5);
  @$pb.TagNumber(6)
  set punishment($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPunishment() => $_has(5);
  @$pb.TagNumber(6)
  void clearPunishment() => clearField(6);
}

class RoomCrossPkSettingData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkSettingData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..aOM<RoomCrossPkSettingMessage>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'setting',
        subBuilder: RoomCrossPkSettingMessage.create)
    ..aOM<$0.SystemPunishConfig>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punishments',
        subBuilder: $0.SystemPunishConfig.create)
    ..hasRequiredFields = false;

  RoomCrossPkSettingData._() : super();
  factory RoomCrossPkSettingData({
    RoomCrossPkSettingMessage? setting,
    $0.SystemPunishConfig? punishments,
  }) {
    final _result = create();
    if (setting != null) {
      _result.setting = setting;
    }
    if (punishments != null) {
      _result.punishments = punishments;
    }
    return _result;
  }
  factory RoomCrossPkSettingData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkSettingData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkSettingData clone() =>
      RoomCrossPkSettingData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkSettingData copyWith(
          void Function(RoomCrossPkSettingData) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkSettingData))
          as RoomCrossPkSettingData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSettingData create() => RoomCrossPkSettingData._();
  RoomCrossPkSettingData createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkSettingData> createRepeated() =>
      $pb.PbList<RoomCrossPkSettingData>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSettingData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkSettingData>(create);
  static RoomCrossPkSettingData? _defaultInstance;

  @$pb.TagNumber(4)
  RoomCrossPkSettingMessage get setting => $_getN(0);
  @$pb.TagNumber(4)
  set setting(RoomCrossPkSettingMessage v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSetting() => $_has(0);
  @$pb.TagNumber(4)
  void clearSetting() => clearField(4);
  @$pb.TagNumber(4)
  RoomCrossPkSettingMessage ensureSetting() => $_ensure(0);

  @$pb.TagNumber(5)
  $0.SystemPunishConfig get punishments => $_getN(1);
  @$pb.TagNumber(5)
  set punishments($0.SystemPunishConfig v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPunishments() => $_has(1);
  @$pb.TagNumber(5)
  void clearPunishments() => clearField(5);
  @$pb.TagNumber(5)
  $0.SystemPunishConfig ensurePunishments() => $_ensure(1);
}

class RespRoomCrossPkSetting extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespRoomCrossPkSetting',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
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
    ..aOM<RoomCrossPkSettingData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomCrossPkSettingData.create)
    ..hasRequiredFields = false;

  RespRoomCrossPkSetting._() : super();
  factory RespRoomCrossPkSetting({
    $core.bool? success,
    $core.String? msg,
    RoomCrossPkSettingData? data,
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
  factory RespRoomCrossPkSetting.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespRoomCrossPkSetting.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespRoomCrossPkSetting clone() =>
      RespRoomCrossPkSetting()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespRoomCrossPkSetting copyWith(
          void Function(RespRoomCrossPkSetting) updates) =>
      super.copyWith((message) => updates(message as RespRoomCrossPkSetting))
          as RespRoomCrossPkSetting; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespRoomCrossPkSetting create() => RespRoomCrossPkSetting._();
  RespRoomCrossPkSetting createEmptyInstance() => create();
  static $pb.PbList<RespRoomCrossPkSetting> createRepeated() =>
      $pb.PbList<RespRoomCrossPkSetting>();
  @$core.pragma('dart2js:noInline')
  static RespRoomCrossPkSetting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespRoomCrossPkSetting>(create);
  static RespRoomCrossPkSetting? _defaultInstance;

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
  RoomCrossPkSettingData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomCrossPkSettingData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomCrossPkSettingData ensureData() => $_ensure(2);
}

class RoomCrossPkRole extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkRole',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'real',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audience',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  RoomCrossPkRole._() : super();
  factory RoomCrossPkRole({
    $core.int? rid,
    $core.int? uid,
    $core.int? sex,
    $core.int? age,
    $core.int? real,
    $core.int? audience,
    $core.int? state,
    $core.String? name,
    $core.String? icon,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (age != null) {
      _result.age = age;
    }
    if (real != null) {
      _result.real = real;
    }
    if (audience != null) {
      _result.audience = audience;
    }
    if (state != null) {
      _result.state = state;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory RoomCrossPkRole.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkRole.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkRole clone() => RoomCrossPkRole()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkRole copyWith(void Function(RoomCrossPkRole) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkRole))
          as RoomCrossPkRole; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkRole create() => RoomCrossPkRole._();
  RoomCrossPkRole createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkRole> createRepeated() =>
      $pb.PbList<RoomCrossPkRole>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkRole getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkRole>(create);
  static RoomCrossPkRole? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

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
  $core.int get sex => $_getIZ(2);
  @$pb.TagNumber(3)
  set sex($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSex() => $_has(2);
  @$pb.TagNumber(3)
  void clearSex() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get age => $_getIZ(3);
  @$pb.TagNumber(4)
  set age($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAge() => $_has(3);
  @$pb.TagNumber(4)
  void clearAge() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get real => $_getIZ(4);
  @$pb.TagNumber(5)
  set real($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasReal() => $_has(4);
  @$pb.TagNumber(5)
  void clearReal() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get audience => $_getIZ(5);
  @$pb.TagNumber(6)
  set audience($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAudience() => $_has(5);
  @$pb.TagNumber(6)
  void clearAudience() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get state => $_getIZ(6);
  @$pb.TagNumber(7)
  set state($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasState() => $_has(6);
  @$pb.TagNumber(7)
  void clearState() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get name => $_getSZ(7);
  @$pb.TagNumber(8)
  set name($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasName() => $_has(7);
  @$pb.TagNumber(8)
  void clearName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get icon => $_getSZ(8);
  @$pb.TagNumber(9)
  set icon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearIcon() => clearField(9);
}

class RespRoomCrossPkSearchData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespRoomCrossPkSearchData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hitMode',
        $pb.PbFieldType.O3,
        protoName: 'hitMode')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.O3)
    ..pc<RoomCrossPkRole>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RoomCrossPkRole.create)
    ..hasRequiredFields = false;

  RespRoomCrossPkSearchData._() : super();
  factory RespRoomCrossPkSearchData({
    $core.int? hitMode,
    $core.int? total,
    $core.Iterable<RoomCrossPkRole>? list,
  }) {
    final _result = create();
    if (hitMode != null) {
      _result.hitMode = hitMode;
    }
    if (total != null) {
      _result.total = total;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory RespRoomCrossPkSearchData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespRoomCrossPkSearchData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespRoomCrossPkSearchData clone() =>
      RespRoomCrossPkSearchData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespRoomCrossPkSearchData copyWith(
          void Function(RespRoomCrossPkSearchData) updates) =>
      super.copyWith((message) => updates(message as RespRoomCrossPkSearchData))
          as RespRoomCrossPkSearchData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespRoomCrossPkSearchData create() => RespRoomCrossPkSearchData._();
  RespRoomCrossPkSearchData createEmptyInstance() => create();
  static $pb.PbList<RespRoomCrossPkSearchData> createRepeated() =>
      $pb.PbList<RespRoomCrossPkSearchData>();
  @$core.pragma('dart2js:noInline')
  static RespRoomCrossPkSearchData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespRoomCrossPkSearchData>(create);
  static RespRoomCrossPkSearchData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get hitMode => $_getIZ(0);
  @$pb.TagNumber(1)
  set hitMode($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHitMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearHitMode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<RoomCrossPkRole> get list => $_getList(2);
}

class RespRoomCrossPkSearch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespRoomCrossPkSearch',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
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
    ..aOM<RespRoomCrossPkSearchData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RespRoomCrossPkSearchData.create)
    ..hasRequiredFields = false;

  RespRoomCrossPkSearch._() : super();
  factory RespRoomCrossPkSearch({
    $core.bool? success,
    $core.String? msg,
    RespRoomCrossPkSearchData? data,
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
  factory RespRoomCrossPkSearch.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespRoomCrossPkSearch.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespRoomCrossPkSearch clone() =>
      RespRoomCrossPkSearch()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespRoomCrossPkSearch copyWith(
          void Function(RespRoomCrossPkSearch) updates) =>
      super.copyWith((message) => updates(message as RespRoomCrossPkSearch))
          as RespRoomCrossPkSearch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespRoomCrossPkSearch create() => RespRoomCrossPkSearch._();
  RespRoomCrossPkSearch createEmptyInstance() => create();
  static $pb.PbList<RespRoomCrossPkSearch> createRepeated() =>
      $pb.PbList<RespRoomCrossPkSearch>();
  @$core.pragma('dart2js:noInline')
  static RespRoomCrossPkSearch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespRoomCrossPkSearch>(create);
  static RespRoomCrossPkSearch? _defaultInstance;

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
  RespRoomCrossPkSearchData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RespRoomCrossPkSearchData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RespRoomCrossPkSearchData ensureData() => $_ensure(2);
}

class RespRoomCrossPkListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespRoomCrossPkListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.O3)
    ..pc<RoomCrossPkRole>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RoomCrossPkRole.create)
    ..hasRequiredFields = false;

  RespRoomCrossPkListData._() : super();
  factory RespRoomCrossPkListData({
    $core.int? total,
    $core.Iterable<RoomCrossPkRole>? list,
  }) {
    final _result = create();
    if (total != null) {
      _result.total = total;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory RespRoomCrossPkListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespRoomCrossPkListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespRoomCrossPkListData clone() =>
      RespRoomCrossPkListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespRoomCrossPkListData copyWith(
          void Function(RespRoomCrossPkListData) updates) =>
      super.copyWith((message) => updates(message as RespRoomCrossPkListData))
          as RespRoomCrossPkListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespRoomCrossPkListData create() => RespRoomCrossPkListData._();
  RespRoomCrossPkListData createEmptyInstance() => create();
  static $pb.PbList<RespRoomCrossPkListData> createRepeated() =>
      $pb.PbList<RespRoomCrossPkListData>();
  @$core.pragma('dart2js:noInline')
  static RespRoomCrossPkListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespRoomCrossPkListData>(create);
  static RespRoomCrossPkListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get total => $_getIZ(0);
  @$pb.TagNumber(1)
  set total($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => clearField(1);

  @$pb.TagNumber(3)
  $core.List<RoomCrossPkRole> get list => $_getList(1);
}

class RespRoomCrossPkList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespRoomCrossPkList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
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
    ..aOM<RespRoomCrossPkListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RespRoomCrossPkListData.create)
    ..hasRequiredFields = false;

  RespRoomCrossPkList._() : super();
  factory RespRoomCrossPkList({
    $core.bool? success,
    $core.String? msg,
    RespRoomCrossPkListData? data,
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
  factory RespRoomCrossPkList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespRoomCrossPkList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespRoomCrossPkList clone() => RespRoomCrossPkList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespRoomCrossPkList copyWith(void Function(RespRoomCrossPkList) updates) =>
      super.copyWith((message) => updates(message as RespRoomCrossPkList))
          as RespRoomCrossPkList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespRoomCrossPkList create() => RespRoomCrossPkList._();
  RespRoomCrossPkList createEmptyInstance() => create();
  static $pb.PbList<RespRoomCrossPkList> createRepeated() =>
      $pb.PbList<RespRoomCrossPkList>();
  @$core.pragma('dart2js:noInline')
  static RespRoomCrossPkList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespRoomCrossPkList>(create);
  static RespRoomCrossPkList? _defaultInstance;

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
  RespRoomCrossPkListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RespRoomCrossPkListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RespRoomCrossPkListData ensureData() => $_ensure(2);
}

class ReqRoomCrossPkInvite extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqRoomCrossPkInvite',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..p<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'targetRid',
        $pb.PbFieldType.PU3,
        protoName: 'targetRid')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'source',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ReqRoomCrossPkInvite._() : super();
  factory ReqRoomCrossPkInvite({
    $core.int? rid,
    $core.Iterable<$core.int>? targetRid,
    $core.int? source,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (targetRid != null) {
      _result.targetRid.addAll(targetRid);
    }
    if (source != null) {
      _result.source = source;
    }
    return _result;
  }
  factory ReqRoomCrossPkInvite.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqRoomCrossPkInvite.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqRoomCrossPkInvite clone() =>
      ReqRoomCrossPkInvite()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqRoomCrossPkInvite copyWith(void Function(ReqRoomCrossPkInvite) updates) =>
      super.copyWith((message) => updates(message as ReqRoomCrossPkInvite))
          as ReqRoomCrossPkInvite; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqRoomCrossPkInvite create() => ReqRoomCrossPkInvite._();
  ReqRoomCrossPkInvite createEmptyInstance() => create();
  static $pb.PbList<ReqRoomCrossPkInvite> createRepeated() =>
      $pb.PbList<ReqRoomCrossPkInvite>();
  @$core.pragma('dart2js:noInline')
  static ReqRoomCrossPkInvite getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqRoomCrossPkInvite>(create);
  static ReqRoomCrossPkInvite? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get targetRid => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get source => $_getIZ(2);
  @$pb.TagNumber(3)
  set source($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSource() => $_has(2);
  @$pb.TagNumber(3)
  void clearSource() => clearField(3);
}

class RoomCrossPkDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkDetails',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkId',
        $pb.PbFieldType.O3,
        protoName: 'pkId')
    ..e<RoomCrossPKMode>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mode',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomCrossPKMode.ROOM_CROSS_PK_MODE_UNKNOWN,
        valueOf: RoomCrossPKMode.valueOf,
        enumValues: RoomCrossPKMode.values)
    ..e<RoomCrossPKStatus>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_UNKONWN,
        valueOf: RoomCrossPKStatus.valueOf,
        enumValues: RoomCrossPKStatus.values)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stageEndLine',
        $pb.PbFieldType.O3,
        protoName: 'stageEndLine')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'winner',
        $pb.PbFieldType.OU3)
    ..e<RoomCrossPkWin>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'win',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomCrossPkWin.ROOM_CROSS_PK_WIN_UNKNOWN,
        valueOf: RoomCrossPkWin.valueOf,
        enumValues: RoomCrossPkWin.values)
    ..aOM<RoomCrossPkSettingMessage>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'setting',
        subBuilder: RoomCrossPkSettingMessage.create)
    ..hasRequiredFields = false;

  RoomCrossPkDetails._() : super();
  factory RoomCrossPkDetails({
    $core.int? pkId,
    RoomCrossPKMode? mode,
    RoomCrossPKStatus? status,
    $core.int? stageEndLine,
    $core.int? winner,
    RoomCrossPkWin? win,
    RoomCrossPkSettingMessage? setting,
  }) {
    final _result = create();
    if (pkId != null) {
      _result.pkId = pkId;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (status != null) {
      _result.status = status;
    }
    if (stageEndLine != null) {
      _result.stageEndLine = stageEndLine;
    }
    if (winner != null) {
      _result.winner = winner;
    }
    if (win != null) {
      _result.win = win;
    }
    if (setting != null) {
      _result.setting = setting;
    }
    return _result;
  }
  factory RoomCrossPkDetails.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkDetails.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkDetails clone() => RoomCrossPkDetails()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkDetails copyWith(void Function(RoomCrossPkDetails) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkDetails))
          as RoomCrossPkDetails; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkDetails create() => RoomCrossPkDetails._();
  RoomCrossPkDetails createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkDetails> createRepeated() =>
      $pb.PbList<RoomCrossPkDetails>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkDetails getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkDetails>(create);
  static RoomCrossPkDetails? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pkId => $_getIZ(0);
  @$pb.TagNumber(1)
  set pkId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkId() => clearField(1);

  @$pb.TagNumber(2)
  RoomCrossPKMode get mode => $_getN(1);
  @$pb.TagNumber(2)
  set mode(RoomCrossPKMode v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearMode() => clearField(2);

  @$pb.TagNumber(3)
  RoomCrossPKStatus get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(RoomCrossPKStatus v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get stageEndLine => $_getIZ(3);
  @$pb.TagNumber(4)
  set stageEndLine($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStageEndLine() => $_has(3);
  @$pb.TagNumber(4)
  void clearStageEndLine() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get winner => $_getIZ(4);
  @$pb.TagNumber(5)
  set winner($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasWinner() => $_has(4);
  @$pb.TagNumber(5)
  void clearWinner() => clearField(5);

  @$pb.TagNumber(6)
  RoomCrossPkWin get win => $_getN(5);
  @$pb.TagNumber(6)
  set win(RoomCrossPkWin v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWin() => $_has(5);
  @$pb.TagNumber(6)
  void clearWin() => clearField(6);

  @$pb.TagNumber(7)
  RoomCrossPkSettingMessage get setting => $_getN(6);
  @$pb.TagNumber(7)
  set setting(RoomCrossPkSettingMessage v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSetting() => $_has(6);
  @$pb.TagNumber(7)
  void clearSetting() => clearField(7);
  @$pb.TagNumber(7)
  RoomCrossPkSettingMessage ensureSetting() => $_ensure(6);
}

class RoomCrossPkMember extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkMember',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
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
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomCrossPkMember._() : super();
  factory RoomCrossPkMember({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.int? age,
    $core.int? score,
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
    if (sex != null) {
      _result.sex = sex;
    }
    if (age != null) {
      _result.age = age;
    }
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory RoomCrossPkMember.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkMember.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkMember clone() => RoomCrossPkMember()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkMember copyWith(void Function(RoomCrossPkMember) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkMember))
          as RoomCrossPkMember; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkMember create() => RoomCrossPkMember._();
  RoomCrossPkMember createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkMember> createRepeated() =>
      $pb.PbList<RoomCrossPkMember>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkMember>(create);
  static RoomCrossPkMember? _defaultInstance;

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

  @$pb.TagNumber(5)
  $core.int get age => $_getIZ(4);
  @$pb.TagNumber(5)
  set age($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAge() => $_has(4);
  @$pb.TagNumber(5)
  void clearAge() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get score => $_getIZ(5);
  @$pb.TagNumber(6)
  set score($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasScore() => $_has(5);
  @$pb.TagNumber(6)
  void clearScore() => clearField(6);
}

class RoomCrossPkRoleInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkRoleInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
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
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalScore',
        $pb.PbFieldType.O3,
        protoName: 'totalScore')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seq',
        $pb.PbFieldType.OU3)
    ..pc<RoomCrossPkMember>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'members',
        $pb.PbFieldType.PM,
        subBuilder: RoomCrossPkMember.create)
    ..aOM<RoomCrossPkMember>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bestReceiver',
        protoName: 'bestReceiver',
        subBuilder: RoomCrossPkMember.create)
    ..aOM<RoomCrossPkMember>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bestSender',
        protoName: 'bestSender',
        subBuilder: RoomCrossPkMember.create)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micStatus',
        $pb.PbFieldType.OU3,
        protoName: 'micStatus')
    ..hasRequiredFields = false;

  RoomCrossPkRoleInfo._() : super();
  factory RoomCrossPkRoleInfo({
    $core.int? rid,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? totalScore,
    $core.int? seq,
    $core.Iterable<RoomCrossPkMember>? members,
    RoomCrossPkMember? bestReceiver,
    RoomCrossPkMember? bestSender,
    $core.int? micStatus,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (totalScore != null) {
      _result.totalScore = totalScore;
    }
    if (seq != null) {
      _result.seq = seq;
    }
    if (members != null) {
      _result.members.addAll(members);
    }
    if (bestReceiver != null) {
      _result.bestReceiver = bestReceiver;
    }
    if (bestSender != null) {
      _result.bestSender = bestSender;
    }
    if (micStatus != null) {
      _result.micStatus = micStatus;
    }
    return _result;
  }
  factory RoomCrossPkRoleInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkRoleInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkRoleInfo clone() => RoomCrossPkRoleInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkRoleInfo copyWith(void Function(RoomCrossPkRoleInfo) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkRoleInfo))
          as RoomCrossPkRoleInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkRoleInfo create() => RoomCrossPkRoleInfo._();
  RoomCrossPkRoleInfo createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkRoleInfo> createRepeated() =>
      $pb.PbList<RoomCrossPkRoleInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkRoleInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkRoleInfo>(create);
  static RoomCrossPkRoleInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

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
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get totalScore => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalScore($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTotalScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalScore() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get seq => $_getIZ(5);
  @$pb.TagNumber(6)
  set seq($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSeq() => $_has(5);
  @$pb.TagNumber(6)
  void clearSeq() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<RoomCrossPkMember> get members => $_getList(6);

  @$pb.TagNumber(8)
  RoomCrossPkMember get bestReceiver => $_getN(7);
  @$pb.TagNumber(8)
  set bestReceiver(RoomCrossPkMember v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasBestReceiver() => $_has(7);
  @$pb.TagNumber(8)
  void clearBestReceiver() => clearField(8);
  @$pb.TagNumber(8)
  RoomCrossPkMember ensureBestReceiver() => $_ensure(7);

  @$pb.TagNumber(9)
  RoomCrossPkMember get bestSender => $_getN(8);
  @$pb.TagNumber(9)
  set bestSender(RoomCrossPkMember v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasBestSender() => $_has(8);
  @$pb.TagNumber(9)
  void clearBestSender() => clearField(9);
  @$pb.TagNumber(9)
  RoomCrossPkMember ensureBestSender() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.int get micStatus => $_getIZ(9);
  @$pb.TagNumber(10)
  set micStatus($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasMicStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearMicStatus() => clearField(10);
}

class RoomCrossPkMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..pc<RoomCrossPkRoleInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roles',
        $pb.PbFieldType.PM,
        subBuilder: RoomCrossPkRoleInfo.create)
    ..aOM<RoomCrossPkDetails>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pk',
        subBuilder: RoomCrossPkDetails.create)
    ..aOM<$0.UserPunish>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish',
        subBuilder: $0.UserPunish.create)
    ..hasRequiredFields = false;

  RoomCrossPkMessage._() : super();
  factory RoomCrossPkMessage({
    $core.Iterable<RoomCrossPkRoleInfo>? roles,
    RoomCrossPkDetails? pk,
    $0.UserPunish? punish,
  }) {
    final _result = create();
    if (roles != null) {
      _result.roles.addAll(roles);
    }
    if (pk != null) {
      _result.pk = pk;
    }
    if (punish != null) {
      _result.punish = punish;
    }
    return _result;
  }
  factory RoomCrossPkMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkMessage clone() => RoomCrossPkMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkMessage copyWith(void Function(RoomCrossPkMessage) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkMessage))
          as RoomCrossPkMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkMessage create() => RoomCrossPkMessage._();
  RoomCrossPkMessage createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkMessage> createRepeated() =>
      $pb.PbList<RoomCrossPkMessage>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkMessage>(create);
  static RoomCrossPkMessage? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<RoomCrossPkRoleInfo> get roles => $_getList(0);

  @$pb.TagNumber(3)
  RoomCrossPkDetails get pk => $_getN(1);
  @$pb.TagNumber(3)
  set pk(RoomCrossPkDetails v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPk() => $_has(1);
  @$pb.TagNumber(3)
  void clearPk() => clearField(3);
  @$pb.TagNumber(3)
  RoomCrossPkDetails ensurePk() => $_ensure(1);

  @$pb.TagNumber(4)
  $0.UserPunish get punish => $_getN(2);
  @$pb.TagNumber(4)
  set punish($0.UserPunish v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPunish() => $_has(2);
  @$pb.TagNumber(4)
  void clearPunish() => clearField(4);
  @$pb.TagNumber(4)
  $0.UserPunish ensurePunish() => $_ensure(2);
}

class RespRoomCrossPkConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespRoomCrossPkConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
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
    ..aOM<RoomCrossPkMessage>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomCrossPkMessage.create)
    ..hasRequiredFields = false;

  RespRoomCrossPkConfig._() : super();
  factory RespRoomCrossPkConfig({
    $core.bool? success,
    $core.String? msg,
    RoomCrossPkMessage? data,
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
  factory RespRoomCrossPkConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespRoomCrossPkConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespRoomCrossPkConfig clone() =>
      RespRoomCrossPkConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespRoomCrossPkConfig copyWith(
          void Function(RespRoomCrossPkConfig) updates) =>
      super.copyWith((message) => updates(message as RespRoomCrossPkConfig))
          as RespRoomCrossPkConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespRoomCrossPkConfig create() => RespRoomCrossPkConfig._();
  RespRoomCrossPkConfig createEmptyInstance() => create();
  static $pb.PbList<RespRoomCrossPkConfig> createRepeated() =>
      $pb.PbList<RespRoomCrossPkConfig>();
  @$core.pragma('dart2js:noInline')
  static RespRoomCrossPkConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespRoomCrossPkConfig>(create);
  static RespRoomCrossPkConfig? _defaultInstance;

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
  RoomCrossPkMessage get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomCrossPkMessage v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomCrossPkMessage ensureData() => $_ensure(2);
}

class RoomCrossPkInviteMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkInviteMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..e<RoomCrossPKMode>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mode',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomCrossPKMode.ROOM_CROSS_PK_MODE_UNKNOWN,
        valueOf: RoomCrossPKMode.valueOf,
        enumValues: RoomCrossPKMode.values)
    ..aOM<RoomCrossPkRole>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inviter',
        subBuilder: RoomCrossPkRole.create)
    ..pc<RoomCrossPkRole>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'target',
        $pb.PbFieldType.PM,
        subBuilder: RoomCrossPkRole.create)
    ..aOM<RoomCrossPkSettingMessage>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'setting',
        subBuilder: RoomCrossPkSettingMessage.create)
    ..e<RoomCrossPkInviteMode>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inviteMode',
        $pb.PbFieldType.OE,
        protoName: 'inviteMode',
        defaultOrMaker: RoomCrossPkInviteMode.UNKNOWN_MODE,
        valueOf: RoomCrossPkInviteMode.valueOf,
        enumValues: RoomCrossPkInviteMode.values)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'actionWhenTimeout',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCrossPkInviteMessage._() : super();
  factory RoomCrossPkInviteMessage({
    $core.int? version,
    RoomCrossPKMode? mode,
    RoomCrossPkRole? inviter,
    $core.Iterable<RoomCrossPkRole>? target,
    RoomCrossPkSettingMessage? setting,
    RoomCrossPkInviteMode? inviteMode,
    $core.int? actionWhenTimeout,
  }) {
    final _result = create();
    if (version != null) {
      _result.version = version;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (inviter != null) {
      _result.inviter = inviter;
    }
    if (target != null) {
      _result.target.addAll(target);
    }
    if (setting != null) {
      _result.setting = setting;
    }
    if (inviteMode != null) {
      _result.inviteMode = inviteMode;
    }
    if (actionWhenTimeout != null) {
      _result.actionWhenTimeout = actionWhenTimeout;
    }
    return _result;
  }
  factory RoomCrossPkInviteMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkInviteMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkInviteMessage clone() =>
      RoomCrossPkInviteMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkInviteMessage copyWith(
          void Function(RoomCrossPkInviteMessage) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkInviteMessage))
          as RoomCrossPkInviteMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkInviteMessage create() => RoomCrossPkInviteMessage._();
  RoomCrossPkInviteMessage createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkInviteMessage> createRepeated() =>
      $pb.PbList<RoomCrossPkInviteMessage>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkInviteMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkInviteMessage>(create);
  static RoomCrossPkInviteMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(3)
  RoomCrossPKMode get mode => $_getN(1);
  @$pb.TagNumber(3)
  set mode(RoomCrossPKMode v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMode() => $_has(1);
  @$pb.TagNumber(3)
  void clearMode() => clearField(3);

  @$pb.TagNumber(4)
  RoomCrossPkRole get inviter => $_getN(2);
  @$pb.TagNumber(4)
  set inviter(RoomCrossPkRole v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasInviter() => $_has(2);
  @$pb.TagNumber(4)
  void clearInviter() => clearField(4);
  @$pb.TagNumber(4)
  RoomCrossPkRole ensureInviter() => $_ensure(2);

  @$pb.TagNumber(5)
  $core.List<RoomCrossPkRole> get target => $_getList(3);

  @$pb.TagNumber(6)
  RoomCrossPkSettingMessage get setting => $_getN(4);
  @$pb.TagNumber(6)
  set setting(RoomCrossPkSettingMessage v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSetting() => $_has(4);
  @$pb.TagNumber(6)
  void clearSetting() => clearField(6);
  @$pb.TagNumber(6)
  RoomCrossPkSettingMessage ensureSetting() => $_ensure(4);

  @$pb.TagNumber(7)
  RoomCrossPkInviteMode get inviteMode => $_getN(5);
  @$pb.TagNumber(7)
  set inviteMode(RoomCrossPkInviteMode v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasInviteMode() => $_has(5);
  @$pb.TagNumber(7)
  void clearInviteMode() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get actionWhenTimeout => $_getIZ(6);
  @$pb.TagNumber(8)
  set actionWhenTimeout($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasActionWhenTimeout() => $_has(6);
  @$pb.TagNumber(8)
  void clearActionWhenTimeout() => clearField(8);
}

class RoomCrossPkResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkResult',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..e<RoomCrossPkWin>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomCrossPkWin.ROOM_CROSS_PK_WIN_UNKNOWN,
        valueOf: RoomCrossPkWin.valueOf,
        enumValues: RoomCrossPkWin.values)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seq',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
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
            : 'icon')
    ..pc<RoomCrossPkMember>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receiverRank',
        $pb.PbFieldType.PM,
        protoName: 'receiverRank',
        subBuilder: RoomCrossPkMember.create)
    ..pc<RoomCrossPkMember>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'senderRank',
        $pb.PbFieldType.PM,
        protoName: 'senderRank',
        subBuilder: RoomCrossPkMember.create)
    ..hasRequiredFields = false;

  RoomCrossPkResult._() : super();
  factory RoomCrossPkResult({
    RoomCrossPkWin? result,
    $core.int? seq,
    $core.int? rid,
    $core.String? name,
    $core.String? icon,
    $core.Iterable<RoomCrossPkMember>? receiverRank,
    $core.Iterable<RoomCrossPkMember>? senderRank,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (seq != null) {
      _result.seq = seq;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (receiverRank != null) {
      _result.receiverRank.addAll(receiverRank);
    }
    if (senderRank != null) {
      _result.senderRank.addAll(senderRank);
    }
    return _result;
  }
  factory RoomCrossPkResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkResult clone() => RoomCrossPkResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkResult copyWith(void Function(RoomCrossPkResult) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkResult))
          as RoomCrossPkResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkResult create() => RoomCrossPkResult._();
  RoomCrossPkResult createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkResult> createRepeated() =>
      $pb.PbList<RoomCrossPkResult>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkResult>(create);
  static RoomCrossPkResult? _defaultInstance;

  @$pb.TagNumber(1)
  RoomCrossPkWin get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(RoomCrossPkWin v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get seq => $_getIZ(1);
  @$pb.TagNumber(2)
  set seq($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSeq() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeq() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rid => $_getIZ(2);
  @$pb.TagNumber(3)
  set rid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRid() => clearField(3);

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
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<RoomCrossPkMember> get receiverRank => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<RoomCrossPkMember> get senderRank => $_getList(6);
}

class RoomCrossPkResultV2 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkResultV2',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..e<RoomCrossPkWinState>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomCrossPkWinState.CROSSPK_UNKNOWN,
        valueOf: RoomCrossPkWinState.valueOf,
        enumValues: RoomCrossPkWinState.values)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seq',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
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
            : 'icon')
    ..pc<RoomCrossPkMember>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receiverRank',
        $pb.PbFieldType.PM,
        protoName: 'receiverRank',
        subBuilder: RoomCrossPkMember.create)
    ..pc<RoomCrossPkMember>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'senderRank',
        $pb.PbFieldType.PM,
        protoName: 'senderRank',
        subBuilder: RoomCrossPkMember.create)
    ..hasRequiredFields = false;

  RoomCrossPkResultV2._() : super();
  factory RoomCrossPkResultV2({
    RoomCrossPkWinState? result,
    $core.int? seq,
    $core.int? rid,
    $core.String? name,
    $core.String? icon,
    $core.Iterable<RoomCrossPkMember>? receiverRank,
    $core.Iterable<RoomCrossPkMember>? senderRank,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (seq != null) {
      _result.seq = seq;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (receiverRank != null) {
      _result.receiverRank.addAll(receiverRank);
    }
    if (senderRank != null) {
      _result.senderRank.addAll(senderRank);
    }
    return _result;
  }
  factory RoomCrossPkResultV2.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkResultV2.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkResultV2 clone() => RoomCrossPkResultV2()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkResultV2 copyWith(void Function(RoomCrossPkResultV2) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkResultV2))
          as RoomCrossPkResultV2; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkResultV2 create() => RoomCrossPkResultV2._();
  RoomCrossPkResultV2 createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkResultV2> createRepeated() =>
      $pb.PbList<RoomCrossPkResultV2>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkResultV2 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkResultV2>(create);
  static RoomCrossPkResultV2? _defaultInstance;

  @$pb.TagNumber(1)
  RoomCrossPkWinState get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(RoomCrossPkWinState v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get seq => $_getIZ(1);
  @$pb.TagNumber(2)
  set seq($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSeq() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeq() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rid => $_getIZ(2);
  @$pb.TagNumber(3)
  set rid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRid() => clearField(3);

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
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<RoomCrossPkMember> get receiverRank => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<RoomCrossPkMember> get senderRank => $_getList(6);
}

class ReqRoomCrossPkLiveStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqRoomCrossPkLiveStatus',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'language')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'settlement')
    ..hasRequiredFields = false;

  ReqRoomCrossPkLiveStatus._() : super();
  factory ReqRoomCrossPkLiveStatus({
    $core.int? rid,
    $core.int? appId,
    $core.String? language,
    $core.String? settlement,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (language != null) {
      _result.language = language;
    }
    if (settlement != null) {
      _result.settlement = settlement;
    }
    return _result;
  }
  factory ReqRoomCrossPkLiveStatus.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqRoomCrossPkLiveStatus.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqRoomCrossPkLiveStatus clone() =>
      ReqRoomCrossPkLiveStatus()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqRoomCrossPkLiveStatus copyWith(
          void Function(ReqRoomCrossPkLiveStatus) updates) =>
      super.copyWith((message) => updates(message as ReqRoomCrossPkLiveStatus))
          as ReqRoomCrossPkLiveStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqRoomCrossPkLiveStatus create() => ReqRoomCrossPkLiveStatus._();
  ReqRoomCrossPkLiveStatus createEmptyInstance() => create();
  static $pb.PbList<ReqRoomCrossPkLiveStatus> createRepeated() =>
      $pb.PbList<ReqRoomCrossPkLiveStatus>();
  @$core.pragma('dart2js:noInline')
  static ReqRoomCrossPkLiveStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqRoomCrossPkLiveStatus>(create);
  static ReqRoomCrossPkLiveStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get appId => $_getIZ(1);
  @$pb.TagNumber(2)
  set appId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAppId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAppId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get language => $_getSZ(2);
  @$pb.TagNumber(3)
  set language($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLanguage() => $_has(2);
  @$pb.TagNumber(3)
  void clearLanguage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get settlement => $_getSZ(3);
  @$pb.TagNumber(4)
  set settlement($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSettlement() => $_has(3);
  @$pb.TagNumber(4)
  void clearSettlement() => clearField(4);
}

class RespRoomCrossPkLiveStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespRoomCrossPkLiveStatus',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RespRoomCrossPkLiveStatus._() : super();
  factory RespRoomCrossPkLiveStatus({
    $core.int? status,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory RespRoomCrossPkLiveStatus.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespRoomCrossPkLiveStatus.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespRoomCrossPkLiveStatus clone() =>
      RespRoomCrossPkLiveStatus()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespRoomCrossPkLiveStatus copyWith(
          void Function(RespRoomCrossPkLiveStatus) updates) =>
      super.copyWith((message) => updates(message as RespRoomCrossPkLiveStatus))
          as RespRoomCrossPkLiveStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespRoomCrossPkLiveStatus create() => RespRoomCrossPkLiveStatus._();
  RespRoomCrossPkLiveStatus createEmptyInstance() => create();
  static $pb.PbList<RespRoomCrossPkLiveStatus> createRepeated() =>
      $pb.PbList<RespRoomCrossPkLiveStatus>();
  @$core.pragma('dart2js:noInline')
  static RespRoomCrossPkLiveStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespRoomCrossPkLiveStatus>(create);
  static RespRoomCrossPkLiveStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class RoomCrossPkQualifyingAffirmMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkQualifyingAffirmMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkId',
        $pb.PbFieldType.OU3)
    ..e<RoomCrossPKMode>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mode',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomCrossPKMode.ROOM_CROSS_PK_MODE_UNKNOWN,
        valueOf: RoomCrossPKMode.valueOf,
        enumValues: RoomCrossPKMode.values)
    ..e<RoomCrossPkInviteMode>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inviteMode',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomCrossPkInviteMode.UNKNOWN_MODE,
        valueOf: RoomCrossPkInviteMode.valueOf,
        enumValues: RoomCrossPkInviteMode.values)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'actionWhenTimeout',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCrossPkQualifyingAffirmMessage._() : super();
  factory RoomCrossPkQualifyingAffirmMessage({
    $core.int? pkId,
    RoomCrossPKMode? mode,
    RoomCrossPkInviteMode? inviteMode,
    $core.int? actionWhenTimeout,
  }) {
    final _result = create();
    if (pkId != null) {
      _result.pkId = pkId;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (inviteMode != null) {
      _result.inviteMode = inviteMode;
    }
    if (actionWhenTimeout != null) {
      _result.actionWhenTimeout = actionWhenTimeout;
    }
    return _result;
  }
  factory RoomCrossPkQualifyingAffirmMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkQualifyingAffirmMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkQualifyingAffirmMessage clone() =>
      RoomCrossPkQualifyingAffirmMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkQualifyingAffirmMessage copyWith(
          void Function(RoomCrossPkQualifyingAffirmMessage) updates) =>
      super.copyWith((message) =>
              updates(message as RoomCrossPkQualifyingAffirmMessage))
          as RoomCrossPkQualifyingAffirmMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkQualifyingAffirmMessage create() =>
      RoomCrossPkQualifyingAffirmMessage._();
  RoomCrossPkQualifyingAffirmMessage createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkQualifyingAffirmMessage> createRepeated() =>
      $pb.PbList<RoomCrossPkQualifyingAffirmMessage>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkQualifyingAffirmMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkQualifyingAffirmMessage>(
          create);
  static RoomCrossPkQualifyingAffirmMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pkId => $_getIZ(0);
  @$pb.TagNumber(1)
  set pkId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkId() => clearField(1);

  @$pb.TagNumber(2)
  RoomCrossPKMode get mode => $_getN(1);
  @$pb.TagNumber(2)
  set mode(RoomCrossPKMode v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearMode() => clearField(2);

  @$pb.TagNumber(3)
  RoomCrossPkInviteMode get inviteMode => $_getN(2);
  @$pb.TagNumber(3)
  set inviteMode(RoomCrossPkInviteMode v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasInviteMode() => $_has(2);
  @$pb.TagNumber(3)
  void clearInviteMode() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get actionWhenTimeout => $_getIZ(3);
  @$pb.TagNumber(4)
  set actionWhenTimeout($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasActionWhenTimeout() => $_has(3);
  @$pb.TagNumber(4)
  void clearActionWhenTimeout() => clearField(4);
}

class RoomCrossPkSegmentMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkSegmentMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..aOM<RoomCrossPkSegmentItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'curSegment',
        protoName: 'curSegment',
        subBuilder: RoomCrossPkSegmentItem.create)
    ..e<RoomCrossPkWinState>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomCrossPkWinState.CROSSPK_UNKNOWN,
        valueOf: RoomCrossPkWinState.valueOf,
        enumValues: RoomCrossPkWinState.values)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tips')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapUrl')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapSize',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCrossPkSegmentMessage._() : super();
  factory RoomCrossPkSegmentMessage({
    RoomCrossPkSegmentItem? curSegment,
    RoomCrossPkWinState? result,
    $core.String? tips,
    $core.String? vapUrl,
    $core.int? vapSize,
  }) {
    final _result = create();
    if (curSegment != null) {
      _result.curSegment = curSegment;
    }
    if (result != null) {
      _result.result = result;
    }
    if (tips != null) {
      _result.tips = tips;
    }
    if (vapUrl != null) {
      _result.vapUrl = vapUrl;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    return _result;
  }
  factory RoomCrossPkSegmentMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkSegmentMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkSegmentMessage clone() =>
      RoomCrossPkSegmentMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkSegmentMessage copyWith(
          void Function(RoomCrossPkSegmentMessage) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkSegmentMessage))
          as RoomCrossPkSegmentMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSegmentMessage create() => RoomCrossPkSegmentMessage._();
  RoomCrossPkSegmentMessage createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkSegmentMessage> createRepeated() =>
      $pb.PbList<RoomCrossPkSegmentMessage>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSegmentMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkSegmentMessage>(create);
  static RoomCrossPkSegmentMessage? _defaultInstance;

  @$pb.TagNumber(1)
  RoomCrossPkSegmentItem get curSegment => $_getN(0);
  @$pb.TagNumber(1)
  set curSegment(RoomCrossPkSegmentItem v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurSegment() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurSegment() => clearField(1);
  @$pb.TagNumber(1)
  RoomCrossPkSegmentItem ensureCurSegment() => $_ensure(0);

  @$pb.TagNumber(2)
  RoomCrossPkWinState get result => $_getN(1);
  @$pb.TagNumber(2)
  set result(RoomCrossPkWinState v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tips => $_getSZ(2);
  @$pb.TagNumber(3)
  set tips($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTips() => $_has(2);
  @$pb.TagNumber(3)
  void clearTips() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get vapUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set vapUrl($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVapUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearVapUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get vapSize => $_getIZ(4);
  @$pb.TagNumber(5)
  set vapSize($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasVapSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearVapSize() => clearField(5);
}

class RoomCrossPkSegmentItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkSegmentItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'segment',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'segmentUrl')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'segmentName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subSegment',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalStar',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCrossPkSegmentItem._() : super();
  factory RoomCrossPkSegmentItem({
    $core.int? segment,
    $core.String? segmentUrl,
    $core.String? segmentName,
    $core.int? subSegment,
    $core.int? star,
    $core.int? totalStar,
  }) {
    final _result = create();
    if (segment != null) {
      _result.segment = segment;
    }
    if (segmentUrl != null) {
      _result.segmentUrl = segmentUrl;
    }
    if (segmentName != null) {
      _result.segmentName = segmentName;
    }
    if (subSegment != null) {
      _result.subSegment = subSegment;
    }
    if (star != null) {
      _result.star = star;
    }
    if (totalStar != null) {
      _result.totalStar = totalStar;
    }
    return _result;
  }
  factory RoomCrossPkSegmentItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkSegmentItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkSegmentItem clone() =>
      RoomCrossPkSegmentItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkSegmentItem copyWith(
          void Function(RoomCrossPkSegmentItem) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkSegmentItem))
          as RoomCrossPkSegmentItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSegmentItem create() => RoomCrossPkSegmentItem._();
  RoomCrossPkSegmentItem createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkSegmentItem> createRepeated() =>
      $pb.PbList<RoomCrossPkSegmentItem>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSegmentItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkSegmentItem>(create);
  static RoomCrossPkSegmentItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get segment => $_getIZ(0);
  @$pb.TagNumber(1)
  set segment($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSegment() => $_has(0);
  @$pb.TagNumber(1)
  void clearSegment() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get segmentUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set segmentUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSegmentUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearSegmentUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get segmentName => $_getSZ(2);
  @$pb.TagNumber(3)
  set segmentName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSegmentName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSegmentName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get subSegment => $_getIZ(3);
  @$pb.TagNumber(4)
  set subSegment($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSubSegment() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubSegment() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get star => $_getIZ(4);
  @$pb.TagNumber(5)
  set star($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStar() => $_has(4);
  @$pb.TagNumber(5)
  void clearStar() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get totalStar => $_getIZ(5);
  @$pb.TagNumber(6)
  set totalStar($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTotalStar() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalStar() => clearField(6);
}

class MessageOvertimePoll extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MessageOvertimePoll',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..aOM<RoomCrossPkMember>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sender',
        subBuilder: RoomCrossPkMember.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MessageOvertimePoll._() : super();
  factory MessageOvertimePoll({
    RoomCrossPkMember? sender,
    $core.String? content,
    $core.int? duration,
  }) {
    final _result = create();
    if (sender != null) {
      _result.sender = sender;
    }
    if (content != null) {
      _result.content = content;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    return _result;
  }
  factory MessageOvertimePoll.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MessageOvertimePoll.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MessageOvertimePoll clone() => MessageOvertimePoll()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MessageOvertimePoll copyWith(void Function(MessageOvertimePoll) updates) =>
      super.copyWith((message) => updates(message as MessageOvertimePoll))
          as MessageOvertimePoll; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageOvertimePoll create() => MessageOvertimePoll._();
  MessageOvertimePoll createEmptyInstance() => create();
  static $pb.PbList<MessageOvertimePoll> createRepeated() =>
      $pb.PbList<MessageOvertimePoll>();
  @$core.pragma('dart2js:noInline')
  static MessageOvertimePoll getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageOvertimePoll>(create);
  static MessageOvertimePoll? _defaultInstance;

  @$pb.TagNumber(1)
  RoomCrossPkMember get sender => $_getN(0);
  @$pb.TagNumber(1)
  set sender(RoomCrossPkMember v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);
  @$pb.TagNumber(1)
  RoomCrossPkMember ensureSender() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get duration => $_getIZ(2);
  @$pb.TagNumber(3)
  set duration($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => clearField(3);
}

class RoomCrossPkEndVoteMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkEndVoteMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..aOM<RoomCrossPkRole>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sender',
        subBuilder: RoomCrossPkRole.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defaultMode',
        $pb.PbFieldType.OU3,
        protoName: 'defaultMode')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'versionCode',
        $pb.PbFieldType.OU3,
        protoName: 'versionCode')
    ..hasRequiredFields = false;

  RoomCrossPkEndVoteMessage._() : super();
  factory RoomCrossPkEndVoteMessage({
    RoomCrossPkRole? sender,
    $core.int? duration,
    $core.int? defaultMode,
    $core.String? content,
    $core.int? versionCode,
  }) {
    final _result = create();
    if (sender != null) {
      _result.sender = sender;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (defaultMode != null) {
      _result.defaultMode = defaultMode;
    }
    if (content != null) {
      _result.content = content;
    }
    if (versionCode != null) {
      _result.versionCode = versionCode;
    }
    return _result;
  }
  factory RoomCrossPkEndVoteMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkEndVoteMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkEndVoteMessage clone() =>
      RoomCrossPkEndVoteMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkEndVoteMessage copyWith(
          void Function(RoomCrossPkEndVoteMessage) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkEndVoteMessage))
          as RoomCrossPkEndVoteMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkEndVoteMessage create() => RoomCrossPkEndVoteMessage._();
  RoomCrossPkEndVoteMessage createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkEndVoteMessage> createRepeated() =>
      $pb.PbList<RoomCrossPkEndVoteMessage>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkEndVoteMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkEndVoteMessage>(create);
  static RoomCrossPkEndVoteMessage? _defaultInstance;

  @$pb.TagNumber(1)
  RoomCrossPkRole get sender => $_getN(0);
  @$pb.TagNumber(1)
  set sender(RoomCrossPkRole v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);
  @$pb.TagNumber(1)
  RoomCrossPkRole ensureSender() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get duration => $_getIZ(1);
  @$pb.TagNumber(2)
  set duration($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get defaultMode => $_getIZ(2);
  @$pb.TagNumber(3)
  set defaultMode($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDefaultMode() => $_has(2);
  @$pb.TagNumber(3)
  void clearDefaultMode() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get versionCode => $_getIZ(4);
  @$pb.TagNumber(5)
  set versionCode($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasVersionCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearVersionCode() => clearField(5);
}

class RoomCrossPkModeInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkModeInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..e<RoomCrossPKMode>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mode',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomCrossPKMode.ROOM_CROSS_PK_MODE_UNKNOWN,
        valueOf: RoomCrossPKMode.valueOf,
        enumValues: RoomCrossPKMode.values)
    ..pc<RoomCrossPkModeInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'children',
        $pb.PbFieldType.PM,
        subBuilder: RoomCrossPkModeInfo.create)
    ..hasRequiredFields = false;

  RoomCrossPkModeInfo._() : super();
  factory RoomCrossPkModeInfo({
    $core.String? name,
    RoomCrossPKMode? mode,
    $core.Iterable<RoomCrossPkModeInfo>? children,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (children != null) {
      _result.children.addAll(children);
    }
    return _result;
  }
  factory RoomCrossPkModeInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkModeInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkModeInfo clone() => RoomCrossPkModeInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkModeInfo copyWith(void Function(RoomCrossPkModeInfo) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkModeInfo))
          as RoomCrossPkModeInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkModeInfo create() => RoomCrossPkModeInfo._();
  RoomCrossPkModeInfo createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkModeInfo> createRepeated() =>
      $pb.PbList<RoomCrossPkModeInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkModeInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkModeInfo>(create);
  static RoomCrossPkModeInfo? _defaultInstance;

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
  RoomCrossPKMode get mode => $_getN(1);
  @$pb.TagNumber(2)
  set mode(RoomCrossPKMode v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearMode() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<RoomCrossPkModeInfo> get children => $_getList(2);
}

class ApiCrossPkTabResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiCrossPkTabResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
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
    ..aOM<RoomCrossPkTabResponse>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tab',
        subBuilder: RoomCrossPkTabResponse.create)
    ..hasRequiredFields = false;

  ApiCrossPkTabResponse._() : super();
  factory ApiCrossPkTabResponse({
    $core.bool? success,
    $core.String? message,
    RoomCrossPkTabResponse? tab,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (tab != null) {
      _result.tab = tab;
    }
    return _result;
  }
  factory ApiCrossPkTabResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiCrossPkTabResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiCrossPkTabResponse clone() =>
      ApiCrossPkTabResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiCrossPkTabResponse copyWith(
          void Function(ApiCrossPkTabResponse) updates) =>
      super.copyWith((message) => updates(message as ApiCrossPkTabResponse))
          as ApiCrossPkTabResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiCrossPkTabResponse create() => ApiCrossPkTabResponse._();
  ApiCrossPkTabResponse createEmptyInstance() => create();
  static $pb.PbList<ApiCrossPkTabResponse> createRepeated() =>
      $pb.PbList<ApiCrossPkTabResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiCrossPkTabResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiCrossPkTabResponse>(create);
  static ApiCrossPkTabResponse? _defaultInstance;

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
  RoomCrossPkTabResponse get tab => $_getN(2);
  @$pb.TagNumber(3)
  set tab(RoomCrossPkTabResponse v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTab() => $_has(2);
  @$pb.TagNumber(3)
  void clearTab() => clearField(3);
  @$pb.TagNumber(3)
  RoomCrossPkTabResponse ensureTab() => $_ensure(2);
}

class RoomCrossPkTabResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkTabResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..pc<RoomCrossPkModeInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabs',
        $pb.PbFieldType.PM,
        subBuilder: RoomCrossPkModeInfo.create)
    ..hasRequiredFields = false;

  RoomCrossPkTabResponse._() : super();
  factory RoomCrossPkTabResponse({
    $core.Iterable<RoomCrossPkModeInfo>? tabs,
  }) {
    final _result = create();
    if (tabs != null) {
      _result.tabs.addAll(tabs);
    }
    return _result;
  }
  factory RoomCrossPkTabResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkTabResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkTabResponse clone() =>
      RoomCrossPkTabResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkTabResponse copyWith(
          void Function(RoomCrossPkTabResponse) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkTabResponse))
          as RoomCrossPkTabResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkTabResponse create() => RoomCrossPkTabResponse._();
  RoomCrossPkTabResponse createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkTabResponse> createRepeated() =>
      $pb.PbList<RoomCrossPkTabResponse>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkTabResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkTabResponse>(create);
  static RoomCrossPkTabResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomCrossPkModeInfo> get tabs => $_getList(0);
}

class ApiRoomCrossPkExploitsDetailsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiRoomCrossPkExploitsDetailsResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
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
    ..aOM<RoomCrossPkExploitsDetailsData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomCrossPkExploitsDetailsData.create)
    ..hasRequiredFields = false;

  ApiRoomCrossPkExploitsDetailsResponse._() : super();
  factory ApiRoomCrossPkExploitsDetailsResponse({
    $core.bool? success,
    $core.String? message,
    RoomCrossPkExploitsDetailsData? data,
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
  factory ApiRoomCrossPkExploitsDetailsResponse.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiRoomCrossPkExploitsDetailsResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiRoomCrossPkExploitsDetailsResponse clone() =>
      ApiRoomCrossPkExploitsDetailsResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiRoomCrossPkExploitsDetailsResponse copyWith(
          void Function(ApiRoomCrossPkExploitsDetailsResponse) updates) =>
      super.copyWith((message) =>
              updates(message as ApiRoomCrossPkExploitsDetailsResponse))
          as ApiRoomCrossPkExploitsDetailsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiRoomCrossPkExploitsDetailsResponse create() =>
      ApiRoomCrossPkExploitsDetailsResponse._();
  ApiRoomCrossPkExploitsDetailsResponse createEmptyInstance() => create();
  static $pb.PbList<ApiRoomCrossPkExploitsDetailsResponse> createRepeated() =>
      $pb.PbList<ApiRoomCrossPkExploitsDetailsResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiRoomCrossPkExploitsDetailsResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ApiRoomCrossPkExploitsDetailsResponse>(create);
  static ApiRoomCrossPkExploitsDetailsResponse? _defaultInstance;

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
  RoomCrossPkExploitsDetailsData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomCrossPkExploitsDetailsData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomCrossPkExploitsDetailsData ensureData() => $_ensure(2);
}

class RoomCrossPkExploitsDetailsData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkExploitsDetailsData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.room.cross.pk'),
      createEmptyInstance: create)
    ..aOM<RoomCrossPkResultV2>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result',
        subBuilder: RoomCrossPkResultV2.create)
    ..hasRequiredFields = false;

  RoomCrossPkExploitsDetailsData._() : super();
  factory RoomCrossPkExploitsDetailsData({
    RoomCrossPkResultV2? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory RoomCrossPkExploitsDetailsData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkExploitsDetailsData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkExploitsDetailsData clone() =>
      RoomCrossPkExploitsDetailsData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkExploitsDetailsData copyWith(
          void Function(RoomCrossPkExploitsDetailsData) updates) =>
      super.copyWith(
              (message) => updates(message as RoomCrossPkExploitsDetailsData))
          as RoomCrossPkExploitsDetailsData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkExploitsDetailsData create() =>
      RoomCrossPkExploitsDetailsData._();
  RoomCrossPkExploitsDetailsData createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkExploitsDetailsData> createRepeated() =>
      $pb.PbList<RoomCrossPkExploitsDetailsData>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkExploitsDetailsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkExploitsDetailsData>(create);
  static RoomCrossPkExploitsDetailsData? _defaultInstance;

  @$pb.TagNumber(1)
  RoomCrossPkResultV2 get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(RoomCrossPkResultV2 v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
  @$pb.TagNumber(1)
  RoomCrossPkResultV2 ensureResult() => $_ensure(0);
}

class RPCCrossPkAnchorApi {
  $pb.RpcClient _client;
  RPCCrossPkAnchorApi(this._client);

  $async.Future<RespRoomCrossPkLiveStatus> livingStatus(
      $pb.ClientContext? ctx, ReqRoomCrossPkLiveStatus request) {
    var emptyResponse = RespRoomCrossPkLiveStatus();
    return _client.invoke<RespRoomCrossPkLiveStatus>(
        ctx, 'RPCCrossPkAnchor', 'LivingStatus', request, emptyResponse);
  }
}
