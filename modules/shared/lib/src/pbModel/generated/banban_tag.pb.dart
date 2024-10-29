///
//  Generated code. Do not modify.
//  source: banban_tag.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ScreenTagConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenTagConfig',
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
            : 'label')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'property')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onMicShow',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showUserRole',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomFactoryType')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'channel')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'whiteListId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cute',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'whiteListRids')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'textStartPx',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frontStyle',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'profileShow',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fontColor')
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'location',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ScreenTagConfig._() : super();
  factory ScreenTagConfig({
    $core.int? id,
    $core.String? label,
    $core.String? icon,
    $core.String? property,
    $core.int? onMicShow,
    $core.int? showUserRole,
    $core.String? roomFactoryType,
    $core.String? channel,
    $core.int? whiteListId,
    $core.int? cute,
    $core.int? type,
    $core.String? whiteListRids,
    $core.int? textStartPx,
    $core.int? frontStyle,
    $core.int? profileShow,
    $core.String? fontColor,
    $core.int? location,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (label != null) {
      _result.label = label;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (property != null) {
      _result.property = property;
    }
    if (onMicShow != null) {
      _result.onMicShow = onMicShow;
    }
    if (showUserRole != null) {
      _result.showUserRole = showUserRole;
    }
    if (roomFactoryType != null) {
      _result.roomFactoryType = roomFactoryType;
    }
    if (channel != null) {
      _result.channel = channel;
    }
    if (whiteListId != null) {
      _result.whiteListId = whiteListId;
    }
    if (cute != null) {
      _result.cute = cute;
    }
    if (type != null) {
      _result.type = type;
    }
    if (whiteListRids != null) {
      _result.whiteListRids = whiteListRids;
    }
    if (textStartPx != null) {
      _result.textStartPx = textStartPx;
    }
    if (frontStyle != null) {
      _result.frontStyle = frontStyle;
    }
    if (profileShow != null) {
      _result.profileShow = profileShow;
    }
    if (fontColor != null) {
      _result.fontColor = fontColor;
    }
    if (location != null) {
      _result.location = location;
    }
    return _result;
  }
  factory ScreenTagConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenTagConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenTagConfig clone() => ScreenTagConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenTagConfig copyWith(void Function(ScreenTagConfig) updates) =>
      super.copyWith((message) => updates(message as ScreenTagConfig))
          as ScreenTagConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenTagConfig create() => ScreenTagConfig._();
  ScreenTagConfig createEmptyInstance() => create();
  static $pb.PbList<ScreenTagConfig> createRepeated() =>
      $pb.PbList<ScreenTagConfig>();
  @$core.pragma('dart2js:noInline')
  static ScreenTagConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenTagConfig>(create);
  static ScreenTagConfig? _defaultInstance;

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
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(2)
  set label($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLabel() => clearField(2);

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
  $core.String get property => $_getSZ(3);
  @$pb.TagNumber(4)
  set property($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasProperty() => $_has(3);
  @$pb.TagNumber(4)
  void clearProperty() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get onMicShow => $_getIZ(4);
  @$pb.TagNumber(5)
  set onMicShow($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOnMicShow() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnMicShow() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get showUserRole => $_getIZ(5);
  @$pb.TagNumber(6)
  set showUserRole($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasShowUserRole() => $_has(5);
  @$pb.TagNumber(6)
  void clearShowUserRole() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get roomFactoryType => $_getSZ(6);
  @$pb.TagNumber(7)
  set roomFactoryType($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRoomFactoryType() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoomFactoryType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get channel => $_getSZ(7);
  @$pb.TagNumber(8)
  set channel($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasChannel() => $_has(7);
  @$pb.TagNumber(8)
  void clearChannel() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get whiteListId => $_getIZ(8);
  @$pb.TagNumber(9)
  set whiteListId($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasWhiteListId() => $_has(8);
  @$pb.TagNumber(9)
  void clearWhiteListId() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get cute => $_getIZ(9);
  @$pb.TagNumber(10)
  set cute($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCute() => $_has(9);
  @$pb.TagNumber(10)
  void clearCute() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get type => $_getIZ(10);
  @$pb.TagNumber(11)
  set type($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasType() => $_has(10);
  @$pb.TagNumber(11)
  void clearType() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get whiteListRids => $_getSZ(11);
  @$pb.TagNumber(12)
  set whiteListRids($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasWhiteListRids() => $_has(11);
  @$pb.TagNumber(12)
  void clearWhiteListRids() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get textStartPx => $_getIZ(12);
  @$pb.TagNumber(13)
  set textStartPx($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasTextStartPx() => $_has(12);
  @$pb.TagNumber(13)
  void clearTextStartPx() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get frontStyle => $_getIZ(13);
  @$pb.TagNumber(14)
  set frontStyle($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasFrontStyle() => $_has(13);
  @$pb.TagNumber(14)
  void clearFrontStyle() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get profileShow => $_getIZ(14);
  @$pb.TagNumber(15)
  set profileShow($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasProfileShow() => $_has(14);
  @$pb.TagNumber(15)
  void clearProfileShow() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get fontColor => $_getSZ(15);
  @$pb.TagNumber(16)
  set fontColor($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasFontColor() => $_has(15);
  @$pb.TagNumber(16)
  void clearFontColor() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get location => $_getIZ(16);
  @$pb.TagNumber(17)
  set location($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasLocation() => $_has(16);
  @$pb.TagNumber(17)
  void clearLocation() => clearField(17);
}

class RepTagConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RepTagConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..pc<ScreenTagConfig>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'config',
        $pb.PbFieldType.PM,
        subBuilder: ScreenTagConfig.create)
    ..hasRequiredFields = false;

  RepTagConfig._() : super();
  factory RepTagConfig({
    $core.int? version,
    $core.Iterable<ScreenTagConfig>? config,
  }) {
    final _result = create();
    if (version != null) {
      _result.version = version;
    }
    if (config != null) {
      _result.config.addAll(config);
    }
    return _result;
  }
  factory RepTagConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RepTagConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RepTagConfig clone() => RepTagConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RepTagConfig copyWith(void Function(RepTagConfig) updates) =>
      super.copyWith((message) => updates(message as RepTagConfig))
          as RepTagConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RepTagConfig create() => RepTagConfig._();
  RepTagConfig createEmptyInstance() => create();
  static $pb.PbList<RepTagConfig> createRepeated() =>
      $pb.PbList<RepTagConfig>();
  @$core.pragma('dart2js:noInline')
  static RepTagConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RepTagConfig>(create);
  static RepTagConfig? _defaultInstance;

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

  @$pb.TagNumber(2)
  $core.List<ScreenTagConfig> get config => $_getList(1);
}

class ResTagConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResTagConfig',
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
    ..aOM<RepTagConfig>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RepTagConfig.create)
    ..hasRequiredFields = false;

  ResTagConfig._() : super();
  factory ResTagConfig({
    $core.bool? success,
    $core.String? msg,
    RepTagConfig? data,
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
  factory ResTagConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResTagConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResTagConfig clone() => ResTagConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResTagConfig copyWith(void Function(ResTagConfig) updates) =>
      super.copyWith((message) => updates(message as ResTagConfig))
          as ResTagConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResTagConfig create() => ResTagConfig._();
  ResTagConfig createEmptyInstance() => create();
  static $pb.PbList<ResTagConfig> createRepeated() =>
      $pb.PbList<ResTagConfig>();
  @$core.pragma('dart2js:noInline')
  static ResTagConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResTagConfig>(create);
  static ResTagConfig? _defaultInstance;

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
  RepTagConfig get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RepTagConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RepTagConfig ensureData() => $_ensure(2);
}
