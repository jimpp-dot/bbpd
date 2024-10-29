///
//  Generated code. Do not modify.
//  source: god_recommend.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BodyGodRecommendTab_LevelConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BodyGodRecommendTab.LevelConfig',
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
            : 'title')
    ..hasRequiredFields = false;

  BodyGodRecommendTab_LevelConfig._() : super();
  factory BodyGodRecommendTab_LevelConfig({
    $core.int? id,
    $core.String? title,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory BodyGodRecommendTab_LevelConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BodyGodRecommendTab_LevelConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BodyGodRecommendTab_LevelConfig clone() =>
      BodyGodRecommendTab_LevelConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BodyGodRecommendTab_LevelConfig copyWith(
          void Function(BodyGodRecommendTab_LevelConfig) updates) =>
      super.copyWith(
              (message) => updates(message as BodyGodRecommendTab_LevelConfig))
          as BodyGodRecommendTab_LevelConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BodyGodRecommendTab_LevelConfig create() =>
      BodyGodRecommendTab_LevelConfig._();
  BodyGodRecommendTab_LevelConfig createEmptyInstance() => create();
  static $pb.PbList<BodyGodRecommendTab_LevelConfig> createRepeated() =>
      $pb.PbList<BodyGodRecommendTab_LevelConfig>();
  @$core.pragma('dart2js:noInline')
  static BodyGodRecommendTab_LevelConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BodyGodRecommendTab_LevelConfig>(
          create);
  static BodyGodRecommendTab_LevelConfig? _defaultInstance;

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
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);
}

class BodyGodRecommendTab_TabItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BodyGodRecommendTab.TabItem',
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
            : 'icon')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gradientColors')
    ..pc<BodyGodRecommendTab_LevelConfig>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelConfig',
        $pb.PbFieldType.PM,
        subBuilder: BodyGodRecommendTab_LevelConfig.create)
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..hasRequiredFields = false;

  BodyGodRecommendTab_TabItem._() : super();
  factory BodyGodRecommendTab_TabItem({
    $core.String? title,
    $core.String? icon,
    $core.int? cid,
    $core.Iterable<$core.String>? gradientColors,
    $core.Iterable<BodyGodRecommendTab_LevelConfig>? levelConfig,
    $core.bool? show,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (gradientColors != null) {
      _result.gradientColors.addAll(gradientColors);
    }
    if (levelConfig != null) {
      _result.levelConfig.addAll(levelConfig);
    }
    if (show != null) {
      _result.show = show;
    }
    return _result;
  }
  factory BodyGodRecommendTab_TabItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BodyGodRecommendTab_TabItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BodyGodRecommendTab_TabItem clone() =>
      BodyGodRecommendTab_TabItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BodyGodRecommendTab_TabItem copyWith(
          void Function(BodyGodRecommendTab_TabItem) updates) =>
      super.copyWith(
              (message) => updates(message as BodyGodRecommendTab_TabItem))
          as BodyGodRecommendTab_TabItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BodyGodRecommendTab_TabItem create() =>
      BodyGodRecommendTab_TabItem._();
  BodyGodRecommendTab_TabItem createEmptyInstance() => create();
  static $pb.PbList<BodyGodRecommendTab_TabItem> createRepeated() =>
      $pb.PbList<BodyGodRecommendTab_TabItem>();
  @$core.pragma('dart2js:noInline')
  static BodyGodRecommendTab_TabItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BodyGodRecommendTab_TabItem>(create);
  static BodyGodRecommendTab_TabItem? _defaultInstance;

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
  $core.int get cid => $_getIZ(2);
  @$pb.TagNumber(3)
  set cid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCid() => $_has(2);
  @$pb.TagNumber(3)
  void clearCid() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get gradientColors => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<BodyGodRecommendTab_LevelConfig> get levelConfig => $_getList(4);

  @$pb.TagNumber(6)
  $core.bool get show => $_getBF(5);
  @$pb.TagNumber(6)
  set show($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasShow() => $_has(5);
  @$pb.TagNumber(6)
  void clearShow() => clearField(6);
}

class BodyGodRecommendTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BodyGodRecommendTab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<BodyGodRecommendTab_TabItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabList',
        $pb.PbFieldType.PM,
        subBuilder: BodyGodRecommendTab_TabItem.create)
    ..hasRequiredFields = false;

  BodyGodRecommendTab._() : super();
  factory BodyGodRecommendTab({
    $core.Iterable<BodyGodRecommendTab_TabItem>? tabList,
  }) {
    final _result = create();
    if (tabList != null) {
      _result.tabList.addAll(tabList);
    }
    return _result;
  }
  factory BodyGodRecommendTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BodyGodRecommendTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BodyGodRecommendTab clone() => BodyGodRecommendTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BodyGodRecommendTab copyWith(void Function(BodyGodRecommendTab) updates) =>
      super.copyWith((message) => updates(message as BodyGodRecommendTab))
          as BodyGodRecommendTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BodyGodRecommendTab create() => BodyGodRecommendTab._();
  BodyGodRecommendTab createEmptyInstance() => create();
  static $pb.PbList<BodyGodRecommendTab> createRepeated() =>
      $pb.PbList<BodyGodRecommendTab>();
  @$core.pragma('dart2js:noInline')
  static BodyGodRecommendTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BodyGodRecommendTab>(create);
  static BodyGodRecommendTab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BodyGodRecommendTab_TabItem> get tabList => $_getList(0);
}

class RspGodRecommendTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspGodRecommendTab',
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
    ..aOM<BodyGodRecommendTab>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BodyGodRecommendTab.create)
    ..hasRequiredFields = false;

  RspGodRecommendTab._() : super();
  factory RspGodRecommendTab({
    $core.bool? success,
    $core.String? msg,
    BodyGodRecommendTab? data,
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
  factory RspGodRecommendTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspGodRecommendTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspGodRecommendTab clone() => RspGodRecommendTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspGodRecommendTab copyWith(void Function(RspGodRecommendTab) updates) =>
      super.copyWith((message) => updates(message as RspGodRecommendTab))
          as RspGodRecommendTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspGodRecommendTab create() => RspGodRecommendTab._();
  RspGodRecommendTab createEmptyInstance() => create();
  static $pb.PbList<RspGodRecommendTab> createRepeated() =>
      $pb.PbList<RspGodRecommendTab>();
  @$core.pragma('dart2js:noInline')
  static RspGodRecommendTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RspGodRecommendTab>(create);
  static RspGodRecommendTab? _defaultInstance;

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
  BodyGodRecommendTab get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BodyGodRecommendTab v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BodyGodRecommendTab ensureData() => $_ensure(2);
}

class BodyGodRecommendList_Item extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BodyGodRecommendList.Item',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
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
            : 'gender',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audio')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomDesc')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..pc<GodCertInfo>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'certList',
        $pb.PbFieldType.PM,
        subBuilder: GodCertInfo.create)
    ..hasRequiredFields = false;

  BodyGodRecommendList_Item._() : super();
  factory BodyGodRecommendList_Item({
    $core.int? rid,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? gender,
    $core.int? cid,
    $core.int? level,
    $core.String? description,
    $core.String? audio,
    $core.String? roomDesc,
    $core.int? money,
    $core.int? age,
    $core.Iterable<GodCertInfo>? certList,
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
    if (gender != null) {
      _result.gender = gender;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (level != null) {
      _result.level = level;
    }
    if (description != null) {
      _result.description = description;
    }
    if (audio != null) {
      _result.audio = audio;
    }
    if (roomDesc != null) {
      _result.roomDesc = roomDesc;
    }
    if (money != null) {
      _result.money = money;
    }
    if (age != null) {
      _result.age = age;
    }
    if (certList != null) {
      _result.certList.addAll(certList);
    }
    return _result;
  }
  factory BodyGodRecommendList_Item.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BodyGodRecommendList_Item.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BodyGodRecommendList_Item clone() =>
      BodyGodRecommendList_Item()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BodyGodRecommendList_Item copyWith(
          void Function(BodyGodRecommendList_Item) updates) =>
      super.copyWith((message) => updates(message as BodyGodRecommendList_Item))
          as BodyGodRecommendList_Item; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BodyGodRecommendList_Item create() => BodyGodRecommendList_Item._();
  BodyGodRecommendList_Item createEmptyInstance() => create();
  static $pb.PbList<BodyGodRecommendList_Item> createRepeated() =>
      $pb.PbList<BodyGodRecommendList_Item>();
  @$core.pragma('dart2js:noInline')
  static BodyGodRecommendList_Item getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BodyGodRecommendList_Item>(create);
  static BodyGodRecommendList_Item? _defaultInstance;

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
  $core.int get gender => $_getIZ(4);
  @$pb.TagNumber(5)
  set gender($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGender() => $_has(4);
  @$pb.TagNumber(5)
  void clearGender() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get cid => $_getIZ(5);
  @$pb.TagNumber(6)
  set cid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCid() => $_has(5);
  @$pb.TagNumber(6)
  void clearCid() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get level => $_getIZ(6);
  @$pb.TagNumber(7)
  set level($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearLevel() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get description => $_getSZ(7);
  @$pb.TagNumber(8)
  set description($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDescription() => $_has(7);
  @$pb.TagNumber(8)
  void clearDescription() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get audio => $_getSZ(8);
  @$pb.TagNumber(9)
  set audio($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAudio() => $_has(8);
  @$pb.TagNumber(9)
  void clearAudio() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get roomDesc => $_getSZ(9);
  @$pb.TagNumber(10)
  set roomDesc($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRoomDesc() => $_has(9);
  @$pb.TagNumber(10)
  void clearRoomDesc() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get money => $_getIZ(10);
  @$pb.TagNumber(11)
  set money($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasMoney() => $_has(10);
  @$pb.TagNumber(11)
  void clearMoney() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get age => $_getIZ(11);
  @$pb.TagNumber(12)
  set age($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasAge() => $_has(11);
  @$pb.TagNumber(12)
  void clearAge() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<GodCertInfo> get certList => $_getList(12);
}

class BodyGodRecommendList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BodyGodRecommendList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<BodyGodRecommendList_Item>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: BodyGodRecommendList_Item.create)
    ..hasRequiredFields = false;

  BodyGodRecommendList._() : super();
  factory BodyGodRecommendList({
    $core.Iterable<BodyGodRecommendList_Item>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory BodyGodRecommendList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BodyGodRecommendList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BodyGodRecommendList clone() =>
      BodyGodRecommendList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BodyGodRecommendList copyWith(void Function(BodyGodRecommendList) updates) =>
      super.copyWith((message) => updates(message as BodyGodRecommendList))
          as BodyGodRecommendList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BodyGodRecommendList create() => BodyGodRecommendList._();
  BodyGodRecommendList createEmptyInstance() => create();
  static $pb.PbList<BodyGodRecommendList> createRepeated() =>
      $pb.PbList<BodyGodRecommendList>();
  @$core.pragma('dart2js:noInline')
  static BodyGodRecommendList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BodyGodRecommendList>(create);
  static BodyGodRecommendList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BodyGodRecommendList_Item> get list => $_getList(0);
}

class GodCertInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GodCertInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GodCertInfo._() : super();
  factory GodCertInfo({
    $core.int? cid,
    $core.int? level,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (level != null) {
      _result.level = level;
    }
    return _result;
  }
  factory GodCertInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GodCertInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GodCertInfo clone() => GodCertInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GodCertInfo copyWith(void Function(GodCertInfo) updates) =>
      super.copyWith((message) => updates(message as GodCertInfo))
          as GodCertInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GodCertInfo create() => GodCertInfo._();
  GodCertInfo createEmptyInstance() => create();
  static $pb.PbList<GodCertInfo> createRepeated() => $pb.PbList<GodCertInfo>();
  @$core.pragma('dart2js:noInline')
  static GodCertInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GodCertInfo>(create);
  static GodCertInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get level => $_getIZ(1);
  @$pb.TagNumber(2)
  set level($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => clearField(2);
}

class RspGodRecommendList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspGodRecommendList',
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
    ..aOM<BodyGodRecommendList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BodyGodRecommendList.create)
    ..hasRequiredFields = false;

  RspGodRecommendList._() : super();
  factory RspGodRecommendList({
    $core.bool? success,
    $core.String? msg,
    BodyGodRecommendList? data,
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
  factory RspGodRecommendList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspGodRecommendList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspGodRecommendList clone() => RspGodRecommendList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspGodRecommendList copyWith(void Function(RspGodRecommendList) updates) =>
      super.copyWith((message) => updates(message as RspGodRecommendList))
          as RspGodRecommendList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspGodRecommendList create() => RspGodRecommendList._();
  RspGodRecommendList createEmptyInstance() => create();
  static $pb.PbList<RspGodRecommendList> createRepeated() =>
      $pb.PbList<RspGodRecommendList>();
  @$core.pragma('dart2js:noInline')
  static RspGodRecommendList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RspGodRecommendList>(create);
  static RspGodRecommendList? _defaultInstance;

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
  BodyGodRecommendList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BodyGodRecommendList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BodyGodRecommendList ensureData() => $_ensure(2);
}

class RspGodRecommendGangUp_BodyGodRecommendGangUp
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspGodRecommendGangUp.BodyGodRecommendGangUp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RspGodRecommendGangUp_BodyGodRecommendGangUp._() : super();
  factory RspGodRecommendGangUp_BodyGodRecommendGangUp({
    $core.int? rid,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    return _result;
  }
  factory RspGodRecommendGangUp_BodyGodRecommendGangUp.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspGodRecommendGangUp_BodyGodRecommendGangUp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspGodRecommendGangUp_BodyGodRecommendGangUp clone() =>
      RspGodRecommendGangUp_BodyGodRecommendGangUp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspGodRecommendGangUp_BodyGodRecommendGangUp copyWith(
          void Function(RspGodRecommendGangUp_BodyGodRecommendGangUp)
              updates) =>
      super.copyWith((message) =>
              updates(message as RspGodRecommendGangUp_BodyGodRecommendGangUp))
          as RspGodRecommendGangUp_BodyGodRecommendGangUp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspGodRecommendGangUp_BodyGodRecommendGangUp create() =>
      RspGodRecommendGangUp_BodyGodRecommendGangUp._();
  RspGodRecommendGangUp_BodyGodRecommendGangUp createEmptyInstance() =>
      create();
  static $pb.PbList<RspGodRecommendGangUp_BodyGodRecommendGangUp>
      createRepeated() =>
          $pb.PbList<RspGodRecommendGangUp_BodyGodRecommendGangUp>();
  @$core.pragma('dart2js:noInline')
  static RspGodRecommendGangUp_BodyGodRecommendGangUp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RspGodRecommendGangUp_BodyGodRecommendGangUp>(create);
  static RspGodRecommendGangUp_BodyGodRecommendGangUp? _defaultInstance;

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
}

class RspGodRecommendGangUp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspGodRecommendGangUp',
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
    ..aOM<RspGodRecommendGangUp_BodyGodRecommendGangUp>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RspGodRecommendGangUp_BodyGodRecommendGangUp.create)
    ..hasRequiredFields = false;

  RspGodRecommendGangUp._() : super();
  factory RspGodRecommendGangUp({
    $core.bool? success,
    $core.String? msg,
    RspGodRecommendGangUp_BodyGodRecommendGangUp? data,
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
  factory RspGodRecommendGangUp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspGodRecommendGangUp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspGodRecommendGangUp clone() =>
      RspGodRecommendGangUp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspGodRecommendGangUp copyWith(
          void Function(RspGodRecommendGangUp) updates) =>
      super.copyWith((message) => updates(message as RspGodRecommendGangUp))
          as RspGodRecommendGangUp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspGodRecommendGangUp create() => RspGodRecommendGangUp._();
  RspGodRecommendGangUp createEmptyInstance() => create();
  static $pb.PbList<RspGodRecommendGangUp> createRepeated() =>
      $pb.PbList<RspGodRecommendGangUp>();
  @$core.pragma('dart2js:noInline')
  static RspGodRecommendGangUp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RspGodRecommendGangUp>(create);
  static RspGodRecommendGangUp? _defaultInstance;

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
  RspGodRecommendGangUp_BodyGodRecommendGangUp get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RspGodRecommendGangUp_BodyGodRecommendGangUp v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RspGodRecommendGangUp_BodyGodRecommendGangUp ensureData() => $_ensure(2);
}
