///
//  Generated code. Do not modify.
//  source: common_title_skills.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResTitleRoomSkill extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResTitleRoomSkill',
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
    ..aOM<TitleRoomSkillData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: TitleRoomSkillData.create)
    ..hasRequiredFields = false;

  ResTitleRoomSkill._() : super();
  factory ResTitleRoomSkill({
    $core.bool? success,
    $core.String? msg,
    TitleRoomSkillData? data,
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
  factory ResTitleRoomSkill.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResTitleRoomSkill.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResTitleRoomSkill clone() => ResTitleRoomSkill()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResTitleRoomSkill copyWith(void Function(ResTitleRoomSkill) updates) =>
      super.copyWith((message) => updates(message as ResTitleRoomSkill))
          as ResTitleRoomSkill; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResTitleRoomSkill create() => ResTitleRoomSkill._();
  ResTitleRoomSkill createEmptyInstance() => create();
  static $pb.PbList<ResTitleRoomSkill> createRepeated() =>
      $pb.PbList<ResTitleRoomSkill>();
  @$core.pragma('dart2js:noInline')
  static ResTitleRoomSkill getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResTitleRoomSkill>(create);
  static ResTitleRoomSkill? _defaultInstance;

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
  TitleRoomSkillData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(TitleRoomSkillData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  TitleRoomSkillData ensureData() => $_ensure(2);
}

class TitleRoomSkillData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TitleRoomSkillData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<TitleRoomSkillItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skills',
        $pb.PbFieldType.PM,
        subBuilder: TitleRoomSkillItem.create)
    ..hasRequiredFields = false;

  TitleRoomSkillData._() : super();
  factory TitleRoomSkillData({
    $core.Iterable<TitleRoomSkillItem>? skills,
  }) {
    final _result = create();
    if (skills != null) {
      _result.skills.addAll(skills);
    }
    return _result;
  }
  factory TitleRoomSkillData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TitleRoomSkillData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TitleRoomSkillData clone() => TitleRoomSkillData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TitleRoomSkillData copyWith(void Function(TitleRoomSkillData) updates) =>
      super.copyWith((message) => updates(message as TitleRoomSkillData))
          as TitleRoomSkillData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TitleRoomSkillData create() => TitleRoomSkillData._();
  TitleRoomSkillData createEmptyInstance() => create();
  static $pb.PbList<TitleRoomSkillData> createRepeated() =>
      $pb.PbList<TitleRoomSkillData>();
  @$core.pragma('dart2js:noInline')
  static TitleRoomSkillData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TitleRoomSkillData>(create);
  static TitleRoomSkillData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TitleRoomSkillItem> get skills => $_getList(0);
}

class TitleRoomSkillItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TitleRoomSkillItem',
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
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'buttonTxt')
    ..hasRequiredFields = false;

  TitleRoomSkillItem._() : super();
  factory TitleRoomSkillItem({
    $core.String? key,
    $core.String? name,
    $core.String? icon,
    $core.String? desc,
    $core.String? buttonTxt,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (buttonTxt != null) {
      _result.buttonTxt = buttonTxt;
    }
    return _result;
  }
  factory TitleRoomSkillItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TitleRoomSkillItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TitleRoomSkillItem clone() => TitleRoomSkillItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TitleRoomSkillItem copyWith(void Function(TitleRoomSkillItem) updates) =>
      super.copyWith((message) => updates(message as TitleRoomSkillItem))
          as TitleRoomSkillItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TitleRoomSkillItem create() => TitleRoomSkillItem._();
  TitleRoomSkillItem createEmptyInstance() => create();
  static $pb.PbList<TitleRoomSkillItem> createRepeated() =>
      $pb.PbList<TitleRoomSkillItem>();
  @$core.pragma('dart2js:noInline')
  static TitleRoomSkillItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TitleRoomSkillItem>(create);
  static TitleRoomSkillItem? _defaultInstance;

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
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get buttonTxt => $_getSZ(4);
  @$pb.TagNumber(5)
  set buttonTxt($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasButtonTxt() => $_has(4);
  @$pb.TagNumber(5)
  void clearButtonTxt() => clearField(5);
}
