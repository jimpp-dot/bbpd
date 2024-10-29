///
//  Generated code. Do not modify.
//  source: room_barrage.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BarrageColor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BarrageColor',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'mate.barrage'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..pPS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..hasRequiredFields = false;

  BarrageColor._() : super();
  factory BarrageColor({
    $core.String? desc,
    $core.Iterable<$core.String>? color,
  }) {
    final _result = create();
    if (desc != null) {
      _result.desc = desc;
    }
    if (color != null) {
      _result.color.addAll(color);
    }
    return _result;
  }
  factory BarrageColor.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BarrageColor.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BarrageColor clone() => BarrageColor()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BarrageColor copyWith(void Function(BarrageColor) updates) =>
      super.copyWith((message) => updates(message as BarrageColor))
          as BarrageColor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BarrageColor create() => BarrageColor._();
  BarrageColor createEmptyInstance() => create();
  static $pb.PbList<BarrageColor> createRepeated() =>
      $pb.PbList<BarrageColor>();
  @$core.pragma('dart2js:noInline')
  static BarrageColor getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BarrageColor>(create);
  static BarrageColor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get desc => $_getSZ(0);
  @$pb.TagNumber(1)
  set desc($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearDesc() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get color => $_getList(1);
}

class BarrageEffect extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BarrageEffect',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'mate.barrage'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background')
    ..hasRequiredFields = false;

  BarrageEffect._() : super();
  factory BarrageEffect({
    $core.String? desc,
    $core.String? background,
  }) {
    final _result = create();
    if (desc != null) {
      _result.desc = desc;
    }
    if (background != null) {
      _result.background = background;
    }
    return _result;
  }
  factory BarrageEffect.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BarrageEffect.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BarrageEffect clone() => BarrageEffect()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BarrageEffect copyWith(void Function(BarrageEffect) updates) =>
      super.copyWith((message) => updates(message as BarrageEffect))
          as BarrageEffect; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BarrageEffect create() => BarrageEffect._();
  BarrageEffect createEmptyInstance() => create();
  static $pb.PbList<BarrageEffect> createRepeated() =>
      $pb.PbList<BarrageEffect>();
  @$core.pragma('dart2js:noInline')
  static BarrageEffect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BarrageEffect>(create);
  static BarrageEffect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get desc => $_getSZ(0);
  @$pb.TagNumber(1)
  set desc($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearDesc() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get background => $_getSZ(1);
  @$pb.TagNumber(2)
  set background($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBackground() => $_has(1);
  @$pb.TagNumber(2)
  void clearBackground() => clearField(2);
}

class BarrageData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BarrageData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'mate.barrage'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
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
            : 'value',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defaultColorDesc')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defaultEffectDesc')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxLength',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cycleTimes',
        $pb.PbFieldType.OU3)
    ..pc<BarrageColor>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'barrageColor',
        $pb.PbFieldType.PM,
        subBuilder: BarrageColor.create)
    ..pc<BarrageEffect>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'barrageEffect',
        $pb.PbFieldType.PM,
        subBuilder: BarrageEffect.create)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
    ..hasRequiredFields = false;

  BarrageData._() : super();
  factory BarrageData({
    $core.int? type,
    $core.String? name,
    $core.String? icon,
    $core.int? value,
    $core.String? defaultColorDesc,
    $core.String? defaultEffectDesc,
    $core.String? msg,
    $core.int? maxLength,
    $core.int? cycleTimes,
    $core.Iterable<BarrageColor>? barrageColor,
    $core.Iterable<BarrageEffect>? barrageEffect,
    $core.String? userIcon,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (value != null) {
      _result.value = value;
    }
    if (defaultColorDesc != null) {
      _result.defaultColorDesc = defaultColorDesc;
    }
    if (defaultEffectDesc != null) {
      _result.defaultEffectDesc = defaultEffectDesc;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (maxLength != null) {
      _result.maxLength = maxLength;
    }
    if (cycleTimes != null) {
      _result.cycleTimes = cycleTimes;
    }
    if (barrageColor != null) {
      _result.barrageColor.addAll(barrageColor);
    }
    if (barrageEffect != null) {
      _result.barrageEffect.addAll(barrageEffect);
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    return _result;
  }
  factory BarrageData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BarrageData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BarrageData clone() => BarrageData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BarrageData copyWith(void Function(BarrageData) updates) =>
      super.copyWith((message) => updates(message as BarrageData))
          as BarrageData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BarrageData create() => BarrageData._();
  BarrageData createEmptyInstance() => create();
  static $pb.PbList<BarrageData> createRepeated() => $pb.PbList<BarrageData>();
  @$core.pragma('dart2js:noInline')
  static BarrageData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BarrageData>(create);
  static BarrageData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

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
  $core.int get value => $_getIZ(3);
  @$pb.TagNumber(4)
  set value($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearValue() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get defaultColorDesc => $_getSZ(4);
  @$pb.TagNumber(5)
  set defaultColorDesc($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDefaultColorDesc() => $_has(4);
  @$pb.TagNumber(5)
  void clearDefaultColorDesc() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get defaultEffectDesc => $_getSZ(5);
  @$pb.TagNumber(6)
  set defaultEffectDesc($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDefaultEffectDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDefaultEffectDesc() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get msg => $_getSZ(6);
  @$pb.TagNumber(7)
  set msg($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMsg() => $_has(6);
  @$pb.TagNumber(7)
  void clearMsg() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get maxLength => $_getIZ(7);
  @$pb.TagNumber(8)
  set maxLength($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMaxLength() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaxLength() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get cycleTimes => $_getIZ(8);
  @$pb.TagNumber(9)
  set cycleTimes($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasCycleTimes() => $_has(8);
  @$pb.TagNumber(9)
  void clearCycleTimes() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<BarrageColor> get barrageColor => $_getList(9);

  @$pb.TagNumber(11)
  $core.List<BarrageEffect> get barrageEffect => $_getList(10);

  @$pb.TagNumber(12)
  $core.String get userIcon => $_getSZ(11);
  @$pb.TagNumber(12)
  set userIcon($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasUserIcon() => $_has(11);
  @$pb.TagNumber(12)
  void clearUserIcon() => clearField(12);
}

class BarrageRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BarrageRes',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'mate.barrage'),
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
    ..pc<BarrageData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: BarrageData.create)
    ..hasRequiredFields = false;

  BarrageRes._() : super();
  factory BarrageRes({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<BarrageData>? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory BarrageRes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BarrageRes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BarrageRes clone() => BarrageRes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BarrageRes copyWith(void Function(BarrageRes) updates) =>
      super.copyWith((message) => updates(message as BarrageRes))
          as BarrageRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BarrageRes create() => BarrageRes._();
  BarrageRes createEmptyInstance() => create();
  static $pb.PbList<BarrageRes> createRepeated() => $pb.PbList<BarrageRes>();
  @$core.pragma('dart2js:noInline')
  static BarrageRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BarrageRes>(create);
  static BarrageRes? _defaultInstance;

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
  $core.List<BarrageData> get data => $_getList(2);
}
