///
//  Generated code. Do not modify.
//  source: slp_hot_topic.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResGetTagSquare extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGetTagSquare',
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
    ..aOM<TagSquareData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagSquareData',
        protoName: 'tagSquareData',
        subBuilder: TagSquareData.create)
    ..hasRequiredFields = false;

  ResGetTagSquare._() : super();
  factory ResGetTagSquare({
    $core.bool? success,
    $core.String? msg,
    TagSquareData? tagSquareData,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (tagSquareData != null) {
      _result.tagSquareData = tagSquareData;
    }
    return _result;
  }
  factory ResGetTagSquare.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGetTagSquare.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGetTagSquare clone() => ResGetTagSquare()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGetTagSquare copyWith(void Function(ResGetTagSquare) updates) =>
      super.copyWith((message) => updates(message as ResGetTagSquare))
          as ResGetTagSquare; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGetTagSquare create() => ResGetTagSquare._();
  ResGetTagSquare createEmptyInstance() => create();
  static $pb.PbList<ResGetTagSquare> createRepeated() =>
      $pb.PbList<ResGetTagSquare>();
  @$core.pragma('dart2js:noInline')
  static ResGetTagSquare getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGetTagSquare>(create);
  static ResGetTagSquare? _defaultInstance;

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
  TagSquareData get tagSquareData => $_getN(2);
  @$pb.TagNumber(3)
  set tagSquareData(TagSquareData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTagSquareData() => $_has(2);
  @$pb.TagNumber(3)
  void clearTagSquareData() => clearField(3);
  @$pb.TagNumber(3)
  TagSquareData ensureTagSquareData() => $_ensure(2);
}

class TagSquareData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TagSquareData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<SquareTag>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'squareTags',
        $pb.PbFieldType.PM,
        protoName: 'squareTags',
        subBuilder: SquareTag.create)
    ..hasRequiredFields = false;

  TagSquareData._() : super();
  factory TagSquareData({
    $core.Iterable<SquareTag>? squareTags,
  }) {
    final _result = create();
    if (squareTags != null) {
      _result.squareTags.addAll(squareTags);
    }
    return _result;
  }
  factory TagSquareData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TagSquareData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TagSquareData clone() => TagSquareData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TagSquareData copyWith(void Function(TagSquareData) updates) =>
      super.copyWith((message) => updates(message as TagSquareData))
          as TagSquareData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TagSquareData create() => TagSquareData._();
  TagSquareData createEmptyInstance() => create();
  static $pb.PbList<TagSquareData> createRepeated() =>
      $pb.PbList<TagSquareData>();
  @$core.pragma('dart2js:noInline')
  static TagSquareData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TagSquareData>(create);
  static TagSquareData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SquareTag> get squareTags => $_getList(0);
}

class SquareTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquareTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rcmdName',
        protoName: 'rcmdName')
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
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prefix')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..hasRequiredFields = false;

  SquareTag._() : super();
  factory SquareTag({
    $core.String? rcmdName,
    $core.String? icon,
    $core.String? name,
    $core.int? id,
    $core.String? prefix,
    $core.String? content,
  }) {
    final _result = create();
    if (rcmdName != null) {
      _result.rcmdName = rcmdName;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (id != null) {
      _result.id = id;
    }
    if (prefix != null) {
      _result.prefix = prefix;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory SquareTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquareTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquareTag clone() => SquareTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquareTag copyWith(void Function(SquareTag) updates) =>
      super.copyWith((message) => updates(message as SquareTag))
          as SquareTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquareTag create() => SquareTag._();
  SquareTag createEmptyInstance() => create();
  static $pb.PbList<SquareTag> createRepeated() => $pb.PbList<SquareTag>();
  @$core.pragma('dart2js:noInline')
  static SquareTag getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SquareTag>(create);
  static SquareTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rcmdName => $_getSZ(0);
  @$pb.TagNumber(1)
  set rcmdName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRcmdName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRcmdName() => clearField(1);

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
  $core.int get id => $_getIZ(3);
  @$pb.TagNumber(4)
  set id($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get prefix => $_getSZ(4);
  @$pb.TagNumber(5)
  set prefix($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPrefix() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrefix() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get content => $_getSZ(5);
  @$pb.TagNumber(6)
  set content($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasContent() => $_has(5);
  @$pb.TagNumber(6)
  void clearContent() => clearField(6);
}
