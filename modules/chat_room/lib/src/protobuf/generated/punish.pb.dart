///
//  Generated code. Do not modify.
//  source: punish.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PunishGua extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PunishGua',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  PunishGua._() : super();
  factory PunishGua({
    $core.String? icon,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory PunishGua.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PunishGua.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PunishGua clone() => PunishGua()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PunishGua copyWith(void Function(PunishGua) updates) =>
      super.copyWith((message) => updates(message as PunishGua))
          as PunishGua; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PunishGua create() => PunishGua._();
  PunishGua createEmptyInstance() => create();
  static $pb.PbList<PunishGua> createRepeated() => $pb.PbList<PunishGua>();
  @$core.pragma('dart2js:noInline')
  static PunishGua getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PunishGua>(create);
  static PunishGua? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => clearField(1);
}

class UserPunishItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserPunishItem',
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
            : 'punishId',
        $pb.PbFieldType.O3,
        protoName: 'punishId')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'paperCount',
        $pb.PbFieldType.O3,
        protoName: 'paperCount')
    ..hasRequiredFields = false;

  UserPunishItem._() : super();
  factory UserPunishItem({
    $core.int? uid,
    $core.int? punishId,
    $core.String? type,
    $core.String? content,
    $core.int? paperCount,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (punishId != null) {
      _result.punishId = punishId;
    }
    if (type != null) {
      _result.type = type;
    }
    if (content != null) {
      _result.content = content;
    }
    if (paperCount != null) {
      _result.paperCount = paperCount;
    }
    return _result;
  }
  factory UserPunishItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserPunishItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserPunishItem clone() => UserPunishItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserPunishItem copyWith(void Function(UserPunishItem) updates) =>
      super.copyWith((message) => updates(message as UserPunishItem))
          as UserPunishItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserPunishItem create() => UserPunishItem._();
  UserPunishItem createEmptyInstance() => create();
  static $pb.PbList<UserPunishItem> createRepeated() =>
      $pb.PbList<UserPunishItem>();
  @$core.pragma('dart2js:noInline')
  static UserPunishItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserPunishItem>(create);
  static UserPunishItem? _defaultInstance;

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
  $core.int get punishId => $_getIZ(1);
  @$pb.TagNumber(2)
  set punishId($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPunishId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPunishId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

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
  $core.int get paperCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set paperCount($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPaperCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearPaperCount() => clearField(5);
}

class UserPunish extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserPunish',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<PunishGua>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gua',
        subBuilder: PunishGua.create)
    ..pc<UserPunishItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Punish',
        $pb.PbFieldType.PM,
        protoName: 'Punish',
        subBuilder: UserPunishItem.create)
    ..hasRequiredFields = false;

  UserPunish._() : super();
  factory UserPunish({
    PunishGua? gua,
    $core.Iterable<UserPunishItem>? punish,
  }) {
    final _result = create();
    if (gua != null) {
      _result.gua = gua;
    }
    if (punish != null) {
      _result.punish.addAll(punish);
    }
    return _result;
  }
  factory UserPunish.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserPunish.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserPunish clone() => UserPunish()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserPunish copyWith(void Function(UserPunish) updates) =>
      super.copyWith((message) => updates(message as UserPunish))
          as UserPunish; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserPunish create() => UserPunish._();
  UserPunish createEmptyInstance() => create();
  static $pb.PbList<UserPunish> createRepeated() => $pb.PbList<UserPunish>();
  @$core.pragma('dart2js:noInline')
  static UserPunish getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserPunish>(create);
  static UserPunish? _defaultInstance;

  @$pb.TagNumber(1)
  PunishGua get gua => $_getN(0);
  @$pb.TagNumber(1)
  set gua(PunishGua v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGua() => $_has(0);
  @$pb.TagNumber(1)
  void clearGua() => clearField(1);
  @$pb.TagNumber(1)
  PunishGua ensureGua() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<UserPunishItem> get punish => $_getList(1);
}

class SystemPunishConfigContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SystemPunishConfigContent',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'strContent',
        protoName: 'strContent')
    ..m<$core.int, $core.String>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'optionContent',
        protoName: 'optionContent',
        entryClassName: 'SystemPunishConfigContent.OptionContentEntry',
        keyFieldType: $pb.PbFieldType.O3,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('pb'))
    ..hasRequiredFields = false;

  SystemPunishConfigContent._() : super();
  factory SystemPunishConfigContent({
    $core.String? strContent,
    $core.Map<$core.int, $core.String>? optionContent,
  }) {
    final _result = create();
    if (strContent != null) {
      _result.strContent = strContent;
    }
    if (optionContent != null) {
      _result.optionContent.addAll(optionContent);
    }
    return _result;
  }
  factory SystemPunishConfigContent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SystemPunishConfigContent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SystemPunishConfigContent clone() =>
      SystemPunishConfigContent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SystemPunishConfigContent copyWith(
          void Function(SystemPunishConfigContent) updates) =>
      super.copyWith((message) => updates(message as SystemPunishConfigContent))
          as SystemPunishConfigContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SystemPunishConfigContent create() => SystemPunishConfigContent._();
  SystemPunishConfigContent createEmptyInstance() => create();
  static $pb.PbList<SystemPunishConfigContent> createRepeated() =>
      $pb.PbList<SystemPunishConfigContent>();
  @$core.pragma('dart2js:noInline')
  static SystemPunishConfigContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SystemPunishConfigContent>(create);
  static SystemPunishConfigContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get strContent => $_getSZ(0);
  @$pb.TagNumber(1)
  set strContent($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStrContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearStrContent() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$core.int, $core.String> get optionContent => $_getMap(1);
}

class SystemPunishConfigItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SystemPunishConfigItem',
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
        $pb.PbFieldType.O3)
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
    ..aOM<SystemPunishConfigContent>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content',
        subBuilder: SystemPunishConfigContent.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.O3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'busiType',
        protoName: 'busiType')
    ..hasRequiredFields = false;

  SystemPunishConfigItem._() : super();
  factory SystemPunishConfigItem({
    $core.int? id,
    $core.String? name,
    $core.String? icon,
    SystemPunishConfigContent? content,
    $core.int? duration,
    $core.int? type,
    $core.String? busiType,
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
    if (content != null) {
      _result.content = content;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (type != null) {
      _result.type = type;
    }
    if (busiType != null) {
      _result.busiType = busiType;
    }
    return _result;
  }
  factory SystemPunishConfigItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SystemPunishConfigItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SystemPunishConfigItem clone() =>
      SystemPunishConfigItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SystemPunishConfigItem copyWith(
          void Function(SystemPunishConfigItem) updates) =>
      super.copyWith((message) => updates(message as SystemPunishConfigItem))
          as SystemPunishConfigItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SystemPunishConfigItem create() => SystemPunishConfigItem._();
  SystemPunishConfigItem createEmptyInstance() => create();
  static $pb.PbList<SystemPunishConfigItem> createRepeated() =>
      $pb.PbList<SystemPunishConfigItem>();
  @$core.pragma('dart2js:noInline')
  static SystemPunishConfigItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SystemPunishConfigItem>(create);
  static SystemPunishConfigItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
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
  SystemPunishConfigContent get content => $_getN(3);
  @$pb.TagNumber(4)
  set content(SystemPunishConfigContent v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);
  @$pb.TagNumber(4)
  SystemPunishConfigContent ensureContent() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get duration => $_getIZ(4);
  @$pb.TagNumber(5)
  set duration($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuration() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get type => $_getIZ(5);
  @$pb.TagNumber(6)
  set type($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get busiType => $_getSZ(6);
  @$pb.TagNumber(7)
  set busiType($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBusiType() => $_has(6);
  @$pb.TagNumber(7)
  void clearBusiType() => clearField(7);
}

class SystemPunishConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SystemPunishConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..m<$core.int, SystemPunishConfigItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'config',
        entryClassName: 'SystemPunishConfig.ConfigEntry',
        keyFieldType: $pb.PbFieldType.O3,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: SystemPunishConfigItem.create,
        packageName: const $pb.PackageName('pb'))
    ..hasRequiredFields = false;

  SystemPunishConfig._() : super();
  factory SystemPunishConfig({
    $core.Map<$core.int, SystemPunishConfigItem>? config,
  }) {
    final _result = create();
    if (config != null) {
      _result.config.addAll(config);
    }
    return _result;
  }
  factory SystemPunishConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SystemPunishConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SystemPunishConfig clone() => SystemPunishConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SystemPunishConfig copyWith(void Function(SystemPunishConfig) updates) =>
      super.copyWith((message) => updates(message as SystemPunishConfig))
          as SystemPunishConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SystemPunishConfig create() => SystemPunishConfig._();
  SystemPunishConfig createEmptyInstance() => create();
  static $pb.PbList<SystemPunishConfig> createRepeated() =>
      $pb.PbList<SystemPunishConfig>();
  @$core.pragma('dart2js:noInline')
  static SystemPunishConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SystemPunishConfig>(create);
  static SystemPunishConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.int, SystemPunishConfigItem> get config => $_getMap(0);
}
