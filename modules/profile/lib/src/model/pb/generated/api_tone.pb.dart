///
//  Generated code. Do not modify.
//  source: api_tone.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResToneGroupList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResToneGroupList',
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
    ..aOM<ToneGroupListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ToneGroupListData.create)
    ..hasRequiredFields = false;

  ResToneGroupList._() : super();
  factory ResToneGroupList({
    $core.bool? success,
    $core.String? msg,
    ToneGroupListData? data,
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
  factory ResToneGroupList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResToneGroupList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResToneGroupList clone() => ResToneGroupList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResToneGroupList copyWith(void Function(ResToneGroupList) updates) =>
      super.copyWith((message) => updates(message as ResToneGroupList))
          as ResToneGroupList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResToneGroupList create() => ResToneGroupList._();
  ResToneGroupList createEmptyInstance() => create();
  static $pb.PbList<ResToneGroupList> createRepeated() =>
      $pb.PbList<ResToneGroupList>();
  @$core.pragma('dart2js:noInline')
  static ResToneGroupList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResToneGroupList>(create);
  static ResToneGroupList? _defaultInstance;

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
  ToneGroupListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ToneGroupListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ToneGroupListData ensureData() => $_ensure(2);
}

class ToneGroupListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ToneGroupListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ToneGroup>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'male',
        $pb.PbFieldType.PM,
        subBuilder: ToneGroup.create)
    ..pc<ToneGroup>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'female',
        $pb.PbFieldType.PM,
        subBuilder: ToneGroup.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defaultSex',
        $pb.PbFieldType.OU3)
    ..aOM<ToneAudio>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'usingAudio',
        subBuilder: ToneAudio.create)
    ..hasRequiredFields = false;

  ToneGroupListData._() : super();
  factory ToneGroupListData({
    $core.Iterable<ToneGroup>? male,
    $core.Iterable<ToneGroup>? female,
    $core.int? defaultSex,
    ToneAudio? usingAudio,
  }) {
    final _result = create();
    if (male != null) {
      _result.male.addAll(male);
    }
    if (female != null) {
      _result.female.addAll(female);
    }
    if (defaultSex != null) {
      _result.defaultSex = defaultSex;
    }
    if (usingAudio != null) {
      _result.usingAudio = usingAudio;
    }
    return _result;
  }
  factory ToneGroupListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ToneGroupListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ToneGroupListData clone() => ToneGroupListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ToneGroupListData copyWith(void Function(ToneGroupListData) updates) =>
      super.copyWith((message) => updates(message as ToneGroupListData))
          as ToneGroupListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ToneGroupListData create() => ToneGroupListData._();
  ToneGroupListData createEmptyInstance() => create();
  static $pb.PbList<ToneGroupListData> createRepeated() =>
      $pb.PbList<ToneGroupListData>();
  @$core.pragma('dart2js:noInline')
  static ToneGroupListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ToneGroupListData>(create);
  static ToneGroupListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ToneGroup> get male => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<ToneGroup> get female => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get defaultSex => $_getIZ(2);
  @$pb.TagNumber(3)
  set defaultSex($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDefaultSex() => $_has(2);
  @$pb.TagNumber(3)
  void clearDefaultSex() => clearField(3);

  @$pb.TagNumber(4)
  ToneAudio get usingAudio => $_getN(3);
  @$pb.TagNumber(4)
  set usingAudio(ToneAudio v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUsingAudio() => $_has(3);
  @$pb.TagNumber(4)
  void clearUsingAudio() => clearField(4);
  @$pb.TagNumber(4)
  ToneAudio ensureUsingAudio() => $_ensure(3);
}

class ToneGroup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ToneGroup',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..aOM<ToneGroupTag>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tTag',
        subBuilder: ToneGroupTag.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageUrl')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sort',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ToneGroup._() : super();
  factory ToneGroup({
    $core.int? groupId,
    ToneGroupTag? tTag,
    $core.String? imageUrl,
    $core.String? name,
    $core.String? desc,
    $core.int? sex,
    $core.int? sort,
  }) {
    final _result = create();
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (tTag != null) {
      _result.tTag = tTag;
    }
    if (imageUrl != null) {
      _result.imageUrl = imageUrl;
    }
    if (name != null) {
      _result.name = name;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (sort != null) {
      _result.sort = sort;
    }
    return _result;
  }
  factory ToneGroup.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ToneGroup.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ToneGroup clone() => ToneGroup()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ToneGroup copyWith(void Function(ToneGroup) updates) =>
      super.copyWith((message) => updates(message as ToneGroup))
          as ToneGroup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ToneGroup create() => ToneGroup._();
  ToneGroup createEmptyInstance() => create();
  static $pb.PbList<ToneGroup> createRepeated() => $pb.PbList<ToneGroup>();
  @$core.pragma('dart2js:noInline')
  static ToneGroup getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ToneGroup>(create);
  static ToneGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get groupId => $_getIZ(0);
  @$pb.TagNumber(1)
  set groupId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  ToneGroupTag get tTag => $_getN(1);
  @$pb.TagNumber(2)
  set tTag(ToneGroupTag v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTTag() => $_has(1);
  @$pb.TagNumber(2)
  void clearTTag() => clearField(2);
  @$pb.TagNumber(2)
  ToneGroupTag ensureTTag() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get imageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set imageUrl($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageUrl() => clearField(3);

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
  $core.String get desc => $_getSZ(4);
  @$pb.TagNumber(5)
  set desc($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDesc() => $_has(4);
  @$pb.TagNumber(5)
  void clearDesc() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get sex => $_getIZ(5);
  @$pb.TagNumber(6)
  set sex($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSex() => $_has(5);
  @$pb.TagNumber(6)
  void clearSex() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get sort => $_getIZ(6);
  @$pb.TagNumber(7)
  set sort($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSort() => $_has(6);
  @$pb.TagNumber(7)
  void clearSort() => clearField(7);
}

class ToneGroupTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ToneGroupTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tTag')
    ..pPS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..hasRequiredFields = false;

  ToneGroupTag._() : super();
  factory ToneGroupTag({
    $core.String? tTag,
    $core.Iterable<$core.String>? color,
  }) {
    final _result = create();
    if (tTag != null) {
      _result.tTag = tTag;
    }
    if (color != null) {
      _result.color.addAll(color);
    }
    return _result;
  }
  factory ToneGroupTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ToneGroupTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ToneGroupTag clone() => ToneGroupTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ToneGroupTag copyWith(void Function(ToneGroupTag) updates) =>
      super.copyWith((message) => updates(message as ToneGroupTag))
          as ToneGroupTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ToneGroupTag create() => ToneGroupTag._();
  ToneGroupTag createEmptyInstance() => create();
  static $pb.PbList<ToneGroupTag> createRepeated() =>
      $pb.PbList<ToneGroupTag>();
  @$core.pragma('dart2js:noInline')
  static ToneGroupTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ToneGroupTag>(create);
  static ToneGroupTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tTag => $_getSZ(0);
  @$pb.TagNumber(1)
  set tTag($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearTTag() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get color => $_getList(1);
}

class ResToneAudioList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResToneAudioList',
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
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more')
    ..aOM<ToneAudioListData>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ToneAudioListData.create)
    ..hasRequiredFields = false;

  ResToneAudioList._() : super();
  factory ResToneAudioList({
    $core.bool? success,
    $core.String? msg,
    $core.bool? more,
    ToneAudioListData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (more != null) {
      _result.more = more;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ResToneAudioList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResToneAudioList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResToneAudioList clone() => ResToneAudioList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResToneAudioList copyWith(void Function(ResToneAudioList) updates) =>
      super.copyWith((message) => updates(message as ResToneAudioList))
          as ResToneAudioList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResToneAudioList create() => ResToneAudioList._();
  ResToneAudioList createEmptyInstance() => create();
  static $pb.PbList<ResToneAudioList> createRepeated() =>
      $pb.PbList<ResToneAudioList>();
  @$core.pragma('dart2js:noInline')
  static ResToneAudioList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResToneAudioList>(create);
  static ResToneAudioList? _defaultInstance;

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
  $core.bool get more => $_getBF(2);
  @$pb.TagNumber(3)
  set more($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMore() => $_has(2);
  @$pb.TagNumber(3)
  void clearMore() => clearField(3);

  @$pb.TagNumber(4)
  ToneAudioListData get data => $_getN(3);
  @$pb.TagNumber(4)
  set data(ToneAudioListData v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);
  @$pb.TagNumber(4)
  ToneAudioListData ensureData() => $_ensure(3);
}

class ToneAudioListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ToneAudioListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ToneAudio>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audios',
        $pb.PbFieldType.PM,
        subBuilder: ToneAudio.create)
    ..hasRequiredFields = false;

  ToneAudioListData._() : super();
  factory ToneAudioListData({
    $core.Iterable<ToneAudio>? audios,
  }) {
    final _result = create();
    if (audios != null) {
      _result.audios.addAll(audios);
    }
    return _result;
  }
  factory ToneAudioListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ToneAudioListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ToneAudioListData clone() => ToneAudioListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ToneAudioListData copyWith(void Function(ToneAudioListData) updates) =>
      super.copyWith((message) => updates(message as ToneAudioListData))
          as ToneAudioListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ToneAudioListData create() => ToneAudioListData._();
  ToneAudioListData createEmptyInstance() => create();
  static $pb.PbList<ToneAudioListData> createRepeated() =>
      $pb.PbList<ToneAudioListData>();
  @$core.pragma('dart2js:noInline')
  static ToneAudioListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ToneAudioListData>(create);
  static ToneAudioListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ToneAudio> get audios => $_getList(0);
}

class ToneAudio extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ToneAudio',
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
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nickname')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hotWord')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audioDuration',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOB(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isUse')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ToneAudio._() : super();
  factory ToneAudio({
    $core.int? id,
    $core.int? uid,
    $core.String? icon,
    $core.String? nickname,
    $core.String? hotWord,
    $core.int? audioDuration,
    $core.String? url,
    $core.bool? isUse,
    $core.int? groupId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (nickname != null) {
      _result.nickname = nickname;
    }
    if (hotWord != null) {
      _result.hotWord = hotWord;
    }
    if (audioDuration != null) {
      _result.audioDuration = audioDuration;
    }
    if (url != null) {
      _result.url = url;
    }
    if (isUse != null) {
      _result.isUse = isUse;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    return _result;
  }
  factory ToneAudio.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ToneAudio.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ToneAudio clone() => ToneAudio()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ToneAudio copyWith(void Function(ToneAudio) updates) =>
      super.copyWith((message) => updates(message as ToneAudio))
          as ToneAudio; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ToneAudio create() => ToneAudio._();
  ToneAudio createEmptyInstance() => create();
  static $pb.PbList<ToneAudio> createRepeated() => $pb.PbList<ToneAudio>();
  @$core.pragma('dart2js:noInline')
  static ToneAudio getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ToneAudio>(create);
  static ToneAudio? _defaultInstance;

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
  $core.String get nickname => $_getSZ(3);
  @$pb.TagNumber(4)
  set nickname($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNickname() => $_has(3);
  @$pb.TagNumber(4)
  void clearNickname() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get hotWord => $_getSZ(4);
  @$pb.TagNumber(5)
  set hotWord($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHotWord() => $_has(4);
  @$pb.TagNumber(5)
  void clearHotWord() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get audioDuration => $_getIZ(5);
  @$pb.TagNumber(6)
  set audioDuration($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAudioDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearAudioDuration() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get url => $_getSZ(6);
  @$pb.TagNumber(7)
  set url($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isUse => $_getBF(7);
  @$pb.TagNumber(8)
  set isUse($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIsUse() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsUse() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get groupId => $_getIZ(8);
  @$pb.TagNumber(9)
  set groupId($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGroupId() => $_has(8);
  @$pb.TagNumber(9)
  void clearGroupId() => clearField(9);
}

class ResToneChange extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResToneChange',
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
    ..hasRequiredFields = false;

  ResToneChange._() : super();
  factory ResToneChange({
    $core.bool? success,
    $core.String? msg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory ResToneChange.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResToneChange.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResToneChange clone() => ResToneChange()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResToneChange copyWith(void Function(ResToneChange) updates) =>
      super.copyWith((message) => updates(message as ResToneChange))
          as ResToneChange; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResToneChange create() => ResToneChange._();
  ResToneChange createEmptyInstance() => create();
  static $pb.PbList<ResToneChange> createRepeated() =>
      $pb.PbList<ResToneChange>();
  @$core.pragma('dart2js:noInline')
  static ResToneChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResToneChange>(create);
  static ResToneChange? _defaultInstance;

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
}
