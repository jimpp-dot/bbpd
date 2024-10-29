///
//  Generated code. Do not modify.
//  source: room_info.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomInfoHidden extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomInfoHidden',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'authed')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ishidden')
    ..hasRequiredFields = false;

  RoomInfoHidden._() : super();
  factory RoomInfoHidden({
    $core.bool? authed,
    $core.bool? ishidden,
  }) {
    final _result = create();
    if (authed != null) {
      _result.authed = authed;
    }
    if (ishidden != null) {
      _result.ishidden = ishidden;
    }
    return _result;
  }
  factory RoomInfoHidden.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomInfoHidden.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomInfoHidden clone() => RoomInfoHidden()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomInfoHidden copyWith(void Function(RoomInfoHidden) updates) =>
      super.copyWith((message) => updates(message as RoomInfoHidden))
          as RoomInfoHidden; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomInfoHidden create() => RoomInfoHidden._();
  RoomInfoHidden createEmptyInstance() => create();
  static $pb.PbList<RoomInfoHidden> createRepeated() =>
      $pb.PbList<RoomInfoHidden>();
  @$core.pragma('dart2js:noInline')
  static RoomInfoHidden getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInfoHidden>(create);
  static RoomInfoHidden? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get authed => $_getBF(0);
  @$pb.TagNumber(1)
  set authed($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAuthed() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthed() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get ishidden => $_getBF(1);
  @$pb.TagNumber(2)
  set ishidden($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIshidden() => $_has(1);
  @$pb.TagNumber(2)
  void clearIshidden() => clearField(2);
}

class RoomInfoSubType extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomInfoSubType',
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
            : 'value')
    ..hasRequiredFields = false;

  RoomInfoSubType._() : super();
  factory RoomInfoSubType({
    $core.String? key,
    $core.String? value,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory RoomInfoSubType.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomInfoSubType.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomInfoSubType clone() => RoomInfoSubType()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomInfoSubType copyWith(void Function(RoomInfoSubType) updates) =>
      super.copyWith((message) => updates(message as RoomInfoSubType))
          as RoomInfoSubType; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomInfoSubType create() => RoomInfoSubType._();
  RoomInfoSubType createEmptyInstance() => create();
  static $pb.PbList<RoomInfoSubType> createRepeated() =>
      $pb.PbList<RoomInfoSubType>();
  @$core.pragma('dart2js:noInline')
  static RoomInfoSubType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInfoSubType>(create);
  static RoomInfoSubType? _defaultInstance;

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
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class RoomInfoMicNumOption extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomInfoMicNumOption',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomFactoryType')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selected')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomPositionNum',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomInfoMicNumOption._() : super();
  factory RoomInfoMicNumOption({
    $core.String? label,
    $core.String? roomFactoryType,
    $core.bool? selected,
    $core.int? roomPositionNum,
  }) {
    final _result = create();
    if (label != null) {
      _result.label = label;
    }
    if (roomFactoryType != null) {
      _result.roomFactoryType = roomFactoryType;
    }
    if (selected != null) {
      _result.selected = selected;
    }
    if (roomPositionNum != null) {
      _result.roomPositionNum = roomPositionNum;
    }
    return _result;
  }
  factory RoomInfoMicNumOption.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomInfoMicNumOption.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomInfoMicNumOption clone() =>
      RoomInfoMicNumOption()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomInfoMicNumOption copyWith(void Function(RoomInfoMicNumOption) updates) =>
      super.copyWith((message) => updates(message as RoomInfoMicNumOption))
          as RoomInfoMicNumOption; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomInfoMicNumOption create() => RoomInfoMicNumOption._();
  RoomInfoMicNumOption createEmptyInstance() => create();
  static $pb.PbList<RoomInfoMicNumOption> createRepeated() =>
      $pb.PbList<RoomInfoMicNumOption>();
  @$core.pragma('dart2js:noInline')
  static RoomInfoMicNumOption getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInfoMicNumOption>(create);
  static RoomInfoMicNumOption? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomFactoryType => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomFactoryType($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoomFactoryType() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomFactoryType() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get selected => $_getBF(2);
  @$pb.TagNumber(3)
  set selected($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSelected() => $_has(2);
  @$pb.TagNumber(3)
  void clearSelected() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get roomPositionNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set roomPositionNum($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRoomPositionNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomPositionNum() => clearField(4);
}

class RoomInfoSpecialMicType extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomInfoSpecialMicType',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..hasRequiredFields = false;

  RoomInfoSpecialMicType._() : super();
  factory RoomInfoSpecialMicType({
    $core.int? type,
    $core.String? title,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory RoomInfoSpecialMicType.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomInfoSpecialMicType.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomInfoSpecialMicType clone() =>
      RoomInfoSpecialMicType()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomInfoSpecialMicType copyWith(
          void Function(RoomInfoSpecialMicType) updates) =>
      super.copyWith((message) => updates(message as RoomInfoSpecialMicType))
          as RoomInfoSpecialMicType; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomInfoSpecialMicType create() => RoomInfoSpecialMicType._();
  RoomInfoSpecialMicType createEmptyInstance() => create();
  static $pb.PbList<RoomInfoSpecialMicType> createRepeated() =>
      $pb.PbList<RoomInfoSpecialMicType>();
  @$core.pragma('dart2js:noInline')
  static RoomInfoSpecialMicType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInfoSpecialMicType>(create);
  static RoomInfoSpecialMicType? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

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

class RoomInfoSpecialMicConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomInfoSpecialMicConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<RoomInfoSpecialMicType>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RoomInfoSpecialMicType.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selectedType',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomInfoSpecialMicConfig._() : super();
  factory RoomInfoSpecialMicConfig({
    $core.Iterable<RoomInfoSpecialMicType>? list,
    $core.int? selectedType,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (selectedType != null) {
      _result.selectedType = selectedType;
    }
    return _result;
  }
  factory RoomInfoSpecialMicConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomInfoSpecialMicConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomInfoSpecialMicConfig clone() =>
      RoomInfoSpecialMicConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomInfoSpecialMicConfig copyWith(
          void Function(RoomInfoSpecialMicConfig) updates) =>
      super.copyWith((message) => updates(message as RoomInfoSpecialMicConfig))
          as RoomInfoSpecialMicConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomInfoSpecialMicConfig create() => RoomInfoSpecialMicConfig._();
  RoomInfoSpecialMicConfig createEmptyInstance() => create();
  static $pb.PbList<RoomInfoSpecialMicConfig> createRepeated() =>
      $pb.PbList<RoomInfoSpecialMicConfig>();
  @$core.pragma('dart2js:noInline')
  static RoomInfoSpecialMicConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInfoSpecialMicConfig>(create);
  static RoomInfoSpecialMicConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomInfoSpecialMicType> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get selectedType => $_getIZ(1);
  @$pb.TagNumber(2)
  set selectedType($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSelectedType() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelectedType() => clearField(2);
}

class RoomInfoRoomType extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomInfoRoomType',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'val')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..pPS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg')
    ..pPS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category')
    ..hasRequiredFields = false;

  RoomInfoRoomType._() : super();
  factory RoomInfoRoomType({
    $core.String? label,
    $core.String? display,
    $core.String? show,
    $core.String? val,
    $core.String? color,
    $core.Iterable<$core.String>? bg,
    $core.Iterable<$core.String>? category,
  }) {
    final _result = create();
    if (label != null) {
      _result.label = label;
    }
    if (display != null) {
      _result.display = display;
    }
    if (show != null) {
      _result.show = show;
    }
    if (val != null) {
      _result.val = val;
    }
    if (color != null) {
      _result.color = color;
    }
    if (bg != null) {
      _result.bg.addAll(bg);
    }
    if (category != null) {
      _result.category.addAll(category);
    }
    return _result;
  }
  factory RoomInfoRoomType.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomInfoRoomType.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomInfoRoomType clone() => RoomInfoRoomType()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomInfoRoomType copyWith(void Function(RoomInfoRoomType) updates) =>
      super.copyWith((message) => updates(message as RoomInfoRoomType))
          as RoomInfoRoomType; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomInfoRoomType create() => RoomInfoRoomType._();
  RoomInfoRoomType createEmptyInstance() => create();
  static $pb.PbList<RoomInfoRoomType> createRepeated() =>
      $pb.PbList<RoomInfoRoomType>();
  @$core.pragma('dart2js:noInline')
  static RoomInfoRoomType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInfoRoomType>(create);
  static RoomInfoRoomType? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get display => $_getSZ(1);
  @$pb.TagNumber(2)
  set display($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDisplay() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplay() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get show => $_getSZ(2);
  @$pb.TagNumber(3)
  set show($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShow() => $_has(2);
  @$pb.TagNumber(3)
  void clearShow() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get val => $_getSZ(3);
  @$pb.TagNumber(4)
  set val($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVal() => $_has(3);
  @$pb.TagNumber(4)
  void clearVal() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get color => $_getSZ(4);
  @$pb.TagNumber(5)
  set color($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasColor() => $_has(4);
  @$pb.TagNumber(5)
  void clearColor() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get bg => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.String> get category => $_getList(6);
}

class RoomInfoInAudit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomInfoInAudit',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomName',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomDescription',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomInfoInAudit._() : super();
  factory RoomInfoInAudit({
    $core.int? roomName,
    $core.int? roomDescription,
  }) {
    final _result = create();
    if (roomName != null) {
      _result.roomName = roomName;
    }
    if (roomDescription != null) {
      _result.roomDescription = roomDescription;
    }
    return _result;
  }
  factory RoomInfoInAudit.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomInfoInAudit.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomInfoInAudit clone() => RoomInfoInAudit()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomInfoInAudit copyWith(void Function(RoomInfoInAudit) updates) =>
      super.copyWith((message) => updates(message as RoomInfoInAudit))
          as RoomInfoInAudit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomInfoInAudit create() => RoomInfoInAudit._();
  RoomInfoInAudit createEmptyInstance() => create();
  static $pb.PbList<RoomInfoInAudit> createRepeated() =>
      $pb.PbList<RoomInfoInAudit>();
  @$core.pragma('dart2js:noInline')
  static RoomInfoInAudit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInfoInAudit>(create);
  static RoomInfoInAudit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get roomName => $_getIZ(0);
  @$pb.TagNumber(1)
  set roomName($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoomName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get roomDescription => $_getIZ(1);
  @$pb.TagNumber(2)
  set roomDescription($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoomDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomDescription() => clearField(2);
}

class RoomInfoData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomInfoData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prefix')
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
            : 'type')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'password')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reception',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'paier',
        $pb.PbFieldType.O3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.O3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'property')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'closeBox',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mode',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'auction',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isAuction',
        $pb.PbFieldType.O3,
        protoName: 'isAuction')
    ..aOM<RoomInfoHidden>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hidden',
        subBuilder: RoomInfoHidden.create)
    ..aOB(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'iconEditable')
    ..aOB(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'displayOpenCard')
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isOpenCard',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftWish',
        $pb.PbFieldType.OU3)
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'coverIcon')
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showNew',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlyNew',
        $pb.PbFieldType.O3)
    ..aOB(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showSubType')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subType')
    ..pc<RoomInfoSubType>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subTypeList',
        $pb.PbFieldType.PM,
        subBuilder: RoomInfoSubType.create)
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defenseVal',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ktvPkMode',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mystery',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wave',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nestEnable',
        $pb.PbFieldType.O3)
    ..pc<RoomInfoMicNumOption>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micNumOption',
        $pb.PbFieldType.PM,
        subBuilder: RoomInfoMicNumOption.create)
    ..aOM<RoomInfoSpecialMicConfig>(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'specialMicConfig',
        subBuilder: RoomInfoSpecialMicConfig.create)
    ..pc<RoomInfoRoomType>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'types',
        $pb.PbFieldType.PM,
        subBuilder: RoomInfoRoomType.create)
    ..aOS(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'welcomeJoinWords',
        protoName: 'welcomeJoinWords')
    ..aOM<RoomInfoInAudit>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inAudit',
        subBuilder: RoomInfoInAudit.create)
    ..aOB(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'esportMateSwitch')
    ..aOB(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'esportMateShow')
    ..aOS(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subtitle')
    ..hasRequiredFields = false;

  RoomInfoData._() : super();
  factory RoomInfoData({
    $core.String? prefix,
    $core.String? name,
    $core.String? icon,
    $core.String? type,
    $core.String? password,
    $core.int? reception,
    $core.int? paier,
    $core.String? description,
    $core.int? num,
    $core.String? property,
    $core.int? closeBox,
    $core.int? mode,
    $core.int? auction,
    $core.int? isAuction,
    RoomInfoHidden? hidden,
    $core.bool? iconEditable,
    $core.bool? displayOpenCard,
    $core.int? isOpenCard,
    $core.int? giftWish,
    $core.String? coverIcon,
    $core.int? showNew,
    $core.int? onlyNew,
    $core.bool? showSubType,
    $core.String? subType,
    $core.Iterable<RoomInfoSubType>? subTypeList,
    $core.int? defenseVal,
    $core.int? ktvPkMode,
    $core.int? mystery,
    $core.int? wave,
    $core.int? nestEnable,
    $core.Iterable<RoomInfoMicNumOption>? micNumOption,
    RoomInfoSpecialMicConfig? specialMicConfig,
    $core.Iterable<RoomInfoRoomType>? types,
    $core.String? welcomeJoinWords,
    RoomInfoInAudit? inAudit,
    $core.bool? esportMateSwitch,
    $core.bool? esportMateShow,
    $core.String? subtitle,
  }) {
    final _result = create();
    if (prefix != null) {
      _result.prefix = prefix;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (type != null) {
      _result.type = type;
    }
    if (password != null) {
      _result.password = password;
    }
    if (reception != null) {
      _result.reception = reception;
    }
    if (paier != null) {
      _result.paier = paier;
    }
    if (description != null) {
      _result.description = description;
    }
    if (num != null) {
      _result.num = num;
    }
    if (property != null) {
      _result.property = property;
    }
    if (closeBox != null) {
      _result.closeBox = closeBox;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (auction != null) {
      _result.auction = auction;
    }
    if (isAuction != null) {
      _result.isAuction = isAuction;
    }
    if (hidden != null) {
      _result.hidden = hidden;
    }
    if (iconEditable != null) {
      _result.iconEditable = iconEditable;
    }
    if (displayOpenCard != null) {
      _result.displayOpenCard = displayOpenCard;
    }
    if (isOpenCard != null) {
      _result.isOpenCard = isOpenCard;
    }
    if (giftWish != null) {
      _result.giftWish = giftWish;
    }
    if (coverIcon != null) {
      _result.coverIcon = coverIcon;
    }
    if (showNew != null) {
      _result.showNew = showNew;
    }
    if (onlyNew != null) {
      _result.onlyNew = onlyNew;
    }
    if (showSubType != null) {
      _result.showSubType = showSubType;
    }
    if (subType != null) {
      _result.subType = subType;
    }
    if (subTypeList != null) {
      _result.subTypeList.addAll(subTypeList);
    }
    if (defenseVal != null) {
      _result.defenseVal = defenseVal;
    }
    if (ktvPkMode != null) {
      _result.ktvPkMode = ktvPkMode;
    }
    if (mystery != null) {
      _result.mystery = mystery;
    }
    if (wave != null) {
      _result.wave = wave;
    }
    if (nestEnable != null) {
      _result.nestEnable = nestEnable;
    }
    if (micNumOption != null) {
      _result.micNumOption.addAll(micNumOption);
    }
    if (specialMicConfig != null) {
      _result.specialMicConfig = specialMicConfig;
    }
    if (types != null) {
      _result.types.addAll(types);
    }
    if (welcomeJoinWords != null) {
      _result.welcomeJoinWords = welcomeJoinWords;
    }
    if (inAudit != null) {
      _result.inAudit = inAudit;
    }
    if (esportMateSwitch != null) {
      _result.esportMateSwitch = esportMateSwitch;
    }
    if (esportMateShow != null) {
      _result.esportMateShow = esportMateShow;
    }
    if (subtitle != null) {
      _result.subtitle = subtitle;
    }
    return _result;
  }
  factory RoomInfoData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomInfoData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomInfoData clone() => RoomInfoData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomInfoData copyWith(void Function(RoomInfoData) updates) =>
      super.copyWith((message) => updates(message as RoomInfoData))
          as RoomInfoData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomInfoData create() => RoomInfoData._();
  RoomInfoData createEmptyInstance() => create();
  static $pb.PbList<RoomInfoData> createRepeated() =>
      $pb.PbList<RoomInfoData>();
  @$core.pragma('dart2js:noInline')
  static RoomInfoData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInfoData>(create);
  static RoomInfoData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get prefix => $_getSZ(0);
  @$pb.TagNumber(1)
  set prefix($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrefix() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrefix() => clearField(1);

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
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get password => $_getSZ(4);
  @$pb.TagNumber(5)
  set password($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassword() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get reception => $_getIZ(5);
  @$pb.TagNumber(6)
  set reception($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasReception() => $_has(5);
  @$pb.TagNumber(6)
  void clearReception() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get paier => $_getIZ(6);
  @$pb.TagNumber(7)
  set paier($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPaier() => $_has(6);
  @$pb.TagNumber(7)
  void clearPaier() => clearField(7);

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
  $core.int get num => $_getIZ(8);
  @$pb.TagNumber(9)
  set num($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearNum() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get property => $_getSZ(9);
  @$pb.TagNumber(10)
  set property($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasProperty() => $_has(9);
  @$pb.TagNumber(10)
  void clearProperty() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get closeBox => $_getIZ(10);
  @$pb.TagNumber(11)
  set closeBox($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasCloseBox() => $_has(10);
  @$pb.TagNumber(11)
  void clearCloseBox() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get mode => $_getIZ(11);
  @$pb.TagNumber(12)
  set mode($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasMode() => $_has(11);
  @$pb.TagNumber(12)
  void clearMode() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get auction => $_getIZ(12);
  @$pb.TagNumber(13)
  set auction($core.int v) {
    $_setSignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasAuction() => $_has(12);
  @$pb.TagNumber(13)
  void clearAuction() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get isAuction => $_getIZ(13);
  @$pb.TagNumber(14)
  set isAuction($core.int v) {
    $_setSignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasIsAuction() => $_has(13);
  @$pb.TagNumber(14)
  void clearIsAuction() => clearField(14);

  @$pb.TagNumber(15)
  RoomInfoHidden get hidden => $_getN(14);
  @$pb.TagNumber(15)
  set hidden(RoomInfoHidden v) {
    setField(15, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasHidden() => $_has(14);
  @$pb.TagNumber(15)
  void clearHidden() => clearField(15);
  @$pb.TagNumber(15)
  RoomInfoHidden ensureHidden() => $_ensure(14);

  @$pb.TagNumber(16)
  $core.bool get iconEditable => $_getBF(15);
  @$pb.TagNumber(16)
  set iconEditable($core.bool v) {
    $_setBool(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasIconEditable() => $_has(15);
  @$pb.TagNumber(16)
  void clearIconEditable() => clearField(16);

  @$pb.TagNumber(17)
  $core.bool get displayOpenCard => $_getBF(16);
  @$pb.TagNumber(17)
  set displayOpenCard($core.bool v) {
    $_setBool(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasDisplayOpenCard() => $_has(16);
  @$pb.TagNumber(17)
  void clearDisplayOpenCard() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get isOpenCard => $_getIZ(17);
  @$pb.TagNumber(18)
  set isOpenCard($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasIsOpenCard() => $_has(17);
  @$pb.TagNumber(18)
  void clearIsOpenCard() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get giftWish => $_getIZ(18);
  @$pb.TagNumber(19)
  set giftWish($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasGiftWish() => $_has(18);
  @$pb.TagNumber(19)
  void clearGiftWish() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get coverIcon => $_getSZ(19);
  @$pb.TagNumber(20)
  set coverIcon($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasCoverIcon() => $_has(19);
  @$pb.TagNumber(20)
  void clearCoverIcon() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get showNew => $_getIZ(20);
  @$pb.TagNumber(21)
  set showNew($core.int v) {
    $_setSignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasShowNew() => $_has(20);
  @$pb.TagNumber(21)
  void clearShowNew() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get onlyNew => $_getIZ(21);
  @$pb.TagNumber(22)
  set onlyNew($core.int v) {
    $_setSignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasOnlyNew() => $_has(21);
  @$pb.TagNumber(22)
  void clearOnlyNew() => clearField(22);

  @$pb.TagNumber(23)
  $core.bool get showSubType => $_getBF(22);
  @$pb.TagNumber(23)
  set showSubType($core.bool v) {
    $_setBool(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasShowSubType() => $_has(22);
  @$pb.TagNumber(23)
  void clearShowSubType() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get subType => $_getSZ(23);
  @$pb.TagNumber(24)
  set subType($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasSubType() => $_has(23);
  @$pb.TagNumber(24)
  void clearSubType() => clearField(24);

  @$pb.TagNumber(25)
  $core.List<RoomInfoSubType> get subTypeList => $_getList(24);

  @$pb.TagNumber(26)
  $core.int get defenseVal => $_getIZ(25);
  @$pb.TagNumber(26)
  set defenseVal($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasDefenseVal() => $_has(25);
  @$pb.TagNumber(26)
  void clearDefenseVal() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get ktvPkMode => $_getIZ(26);
  @$pb.TagNumber(27)
  set ktvPkMode($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasKtvPkMode() => $_has(26);
  @$pb.TagNumber(27)
  void clearKtvPkMode() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get mystery => $_getIZ(27);
  @$pb.TagNumber(28)
  set mystery($core.int v) {
    $_setSignedInt32(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasMystery() => $_has(27);
  @$pb.TagNumber(28)
  void clearMystery() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get wave => $_getIZ(28);
  @$pb.TagNumber(29)
  set wave($core.int v) {
    $_setSignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasWave() => $_has(28);
  @$pb.TagNumber(29)
  void clearWave() => clearField(29);

  @$pb.TagNumber(30)
  $core.int get nestEnable => $_getIZ(29);
  @$pb.TagNumber(30)
  set nestEnable($core.int v) {
    $_setSignedInt32(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasNestEnable() => $_has(29);
  @$pb.TagNumber(30)
  void clearNestEnable() => clearField(30);

  @$pb.TagNumber(31)
  $core.List<RoomInfoMicNumOption> get micNumOption => $_getList(30);

  @$pb.TagNumber(32)
  RoomInfoSpecialMicConfig get specialMicConfig => $_getN(31);
  @$pb.TagNumber(32)
  set specialMicConfig(RoomInfoSpecialMicConfig v) {
    setField(32, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasSpecialMicConfig() => $_has(31);
  @$pb.TagNumber(32)
  void clearSpecialMicConfig() => clearField(32);
  @$pb.TagNumber(32)
  RoomInfoSpecialMicConfig ensureSpecialMicConfig() => $_ensure(31);

  @$pb.TagNumber(33)
  $core.List<RoomInfoRoomType> get types => $_getList(32);

  @$pb.TagNumber(34)
  $core.String get welcomeJoinWords => $_getSZ(33);
  @$pb.TagNumber(34)
  set welcomeJoinWords($core.String v) {
    $_setString(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasWelcomeJoinWords() => $_has(33);
  @$pb.TagNumber(34)
  void clearWelcomeJoinWords() => clearField(34);

  @$pb.TagNumber(35)
  RoomInfoInAudit get inAudit => $_getN(34);
  @$pb.TagNumber(35)
  set inAudit(RoomInfoInAudit v) {
    setField(35, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasInAudit() => $_has(34);
  @$pb.TagNumber(35)
  void clearInAudit() => clearField(35);
  @$pb.TagNumber(35)
  RoomInfoInAudit ensureInAudit() => $_ensure(34);

  @$pb.TagNumber(36)
  $core.bool get esportMateSwitch => $_getBF(35);
  @$pb.TagNumber(36)
  set esportMateSwitch($core.bool v) {
    $_setBool(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasEsportMateSwitch() => $_has(35);
  @$pb.TagNumber(36)
  void clearEsportMateSwitch() => clearField(36);

  @$pb.TagNumber(37)
  $core.bool get esportMateShow => $_getBF(36);
  @$pb.TagNumber(37)
  set esportMateShow($core.bool v) {
    $_setBool(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasEsportMateShow() => $_has(36);
  @$pb.TagNumber(37)
  void clearEsportMateShow() => clearField(37);

  @$pb.TagNumber(39)
  $core.String get subtitle => $_getSZ(37);
  @$pb.TagNumber(39)
  set subtitle($core.String v) {
    $_setString(37, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasSubtitle() => $_has(37);
  @$pb.TagNumber(39)
  void clearSubtitle() => clearField(39);
}

class ResRoomInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomInfo',
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
    ..aOM<RoomInfoData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomInfoData.create)
    ..hasRequiredFields = false;

  ResRoomInfo._() : super();
  factory ResRoomInfo({
    $core.bool? success,
    $core.String? msg,
    RoomInfoData? data,
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
  factory ResRoomInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomInfo clone() => ResRoomInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomInfo copyWith(void Function(ResRoomInfo) updates) =>
      super.copyWith((message) => updates(message as ResRoomInfo))
          as ResRoomInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomInfo create() => ResRoomInfo._();
  ResRoomInfo createEmptyInstance() => create();
  static $pb.PbList<ResRoomInfo> createRepeated() => $pb.PbList<ResRoomInfo>();
  @$core.pragma('dart2js:noInline')
  static ResRoomInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomInfo>(create);
  static ResRoomInfo? _defaultInstance;

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
  RoomInfoData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomInfoData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomInfoData ensureData() => $_ensure(2);
}

class ResGetRoomSetInfo_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGetRoomSetInfo.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isShowRoomSet')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isShowRoomClose')
    ..hasRequiredFields = false;

  ResGetRoomSetInfo_Data._() : super();
  factory ResGetRoomSetInfo_Data({
    $core.bool? isShowRoomSet,
    $core.bool? isShowRoomClose,
  }) {
    final _result = create();
    if (isShowRoomSet != null) {
      _result.isShowRoomSet = isShowRoomSet;
    }
    if (isShowRoomClose != null) {
      _result.isShowRoomClose = isShowRoomClose;
    }
    return _result;
  }
  factory ResGetRoomSetInfo_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGetRoomSetInfo_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGetRoomSetInfo_Data clone() =>
      ResGetRoomSetInfo_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGetRoomSetInfo_Data copyWith(
          void Function(ResGetRoomSetInfo_Data) updates) =>
      super.copyWith((message) => updates(message as ResGetRoomSetInfo_Data))
          as ResGetRoomSetInfo_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGetRoomSetInfo_Data create() => ResGetRoomSetInfo_Data._();
  ResGetRoomSetInfo_Data createEmptyInstance() => create();
  static $pb.PbList<ResGetRoomSetInfo_Data> createRepeated() =>
      $pb.PbList<ResGetRoomSetInfo_Data>();
  @$core.pragma('dart2js:noInline')
  static ResGetRoomSetInfo_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGetRoomSetInfo_Data>(create);
  static ResGetRoomSetInfo_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isShowRoomSet => $_getBF(0);
  @$pb.TagNumber(1)
  set isShowRoomSet($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIsShowRoomSet() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsShowRoomSet() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isShowRoomClose => $_getBF(1);
  @$pb.TagNumber(2)
  set isShowRoomClose($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsShowRoomClose() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsShowRoomClose() => clearField(2);
}

class ResGetRoomSetInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGetRoomSetInfo',
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
    ..aOM<ResGetRoomSetInfo_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResGetRoomSetInfo_Data.create)
    ..hasRequiredFields = false;

  ResGetRoomSetInfo._() : super();
  factory ResGetRoomSetInfo({
    $core.bool? success,
    $core.String? msg,
    ResGetRoomSetInfo_Data? data,
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
  factory ResGetRoomSetInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGetRoomSetInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGetRoomSetInfo clone() => ResGetRoomSetInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGetRoomSetInfo copyWith(void Function(ResGetRoomSetInfo) updates) =>
      super.copyWith((message) => updates(message as ResGetRoomSetInfo))
          as ResGetRoomSetInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGetRoomSetInfo create() => ResGetRoomSetInfo._();
  ResGetRoomSetInfo createEmptyInstance() => create();
  static $pb.PbList<ResGetRoomSetInfo> createRepeated() =>
      $pb.PbList<ResGetRoomSetInfo>();
  @$core.pragma('dart2js:noInline')
  static ResGetRoomSetInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGetRoomSetInfo>(create);
  static ResGetRoomSetInfo? _defaultInstance;

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
  ResGetRoomSetInfo_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ResGetRoomSetInfo_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ResGetRoomSetInfo_Data ensureData() => $_ensure(2);
}

class ResRoomPanel_Data_Tab_RoomItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPanel.Data.Tab.RoomItem',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomCover')
    ..aOM<RoomInfoRoomType>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'types',
        subBuilder: RoomInfoRoomType.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userName')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomState',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ResRoomPanel_Data_Tab_RoomItem._() : super();
  factory ResRoomPanel_Data_Tab_RoomItem({
    $core.int? rid,
    $core.String? roomCover,
    RoomInfoRoomType? types,
    $core.String? title,
    $core.int? uid,
    $core.String? userIcon,
    $core.String? userName,
    $core.int? roomState,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (roomCover != null) {
      _result.roomCover = roomCover;
    }
    if (types != null) {
      _result.types = types;
    }
    if (title != null) {
      _result.title = title;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (roomState != null) {
      _result.roomState = roomState;
    }
    return _result;
  }
  factory ResRoomPanel_Data_Tab_RoomItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPanel_Data_Tab_RoomItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPanel_Data_Tab_RoomItem clone() =>
      ResRoomPanel_Data_Tab_RoomItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPanel_Data_Tab_RoomItem copyWith(
          void Function(ResRoomPanel_Data_Tab_RoomItem) updates) =>
      super.copyWith(
              (message) => updates(message as ResRoomPanel_Data_Tab_RoomItem))
          as ResRoomPanel_Data_Tab_RoomItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPanel_Data_Tab_RoomItem create() =>
      ResRoomPanel_Data_Tab_RoomItem._();
  ResRoomPanel_Data_Tab_RoomItem createEmptyInstance() => create();
  static $pb.PbList<ResRoomPanel_Data_Tab_RoomItem> createRepeated() =>
      $pb.PbList<ResRoomPanel_Data_Tab_RoomItem>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPanel_Data_Tab_RoomItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPanel_Data_Tab_RoomItem>(create);
  static ResRoomPanel_Data_Tab_RoomItem? _defaultInstance;

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
  $core.String get roomCover => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomCover($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoomCover() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomCover() => clearField(2);

  @$pb.TagNumber(3)
  RoomInfoRoomType get types => $_getN(2);
  @$pb.TagNumber(3)
  set types(RoomInfoRoomType v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTypes() => $_has(2);
  @$pb.TagNumber(3)
  void clearTypes() => clearField(3);
  @$pb.TagNumber(3)
  RoomInfoRoomType ensureTypes() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get uid => $_getIZ(4);
  @$pb.TagNumber(5)
  set uid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearUid() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get userIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set userIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUserIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get userName => $_getSZ(6);
  @$pb.TagNumber(7)
  set userName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUserName() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserName() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get roomState => $_getIZ(7);
  @$pb.TagNumber(8)
  set roomState($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRoomState() => $_has(7);
  @$pb.TagNumber(8)
  void clearRoomState() => clearField(8);
}

class ResRoomPanel_Data_Tab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPanel.Data.Tab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..pc<ResRoomPanel_Data_Tab_RoomItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ResRoomPanel_Data_Tab_RoomItem.create)
    ..hasRequiredFields = false;

  ResRoomPanel_Data_Tab._() : super();
  factory ResRoomPanel_Data_Tab({
    $core.String? name,
    $core.Iterable<ResRoomPanel_Data_Tab_RoomItem>? list,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory ResRoomPanel_Data_Tab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPanel_Data_Tab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPanel_Data_Tab clone() =>
      ResRoomPanel_Data_Tab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPanel_Data_Tab copyWith(
          void Function(ResRoomPanel_Data_Tab) updates) =>
      super.copyWith((message) => updates(message as ResRoomPanel_Data_Tab))
          as ResRoomPanel_Data_Tab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPanel_Data_Tab create() => ResRoomPanel_Data_Tab._();
  ResRoomPanel_Data_Tab createEmptyInstance() => create();
  static $pb.PbList<ResRoomPanel_Data_Tab> createRepeated() =>
      $pb.PbList<ResRoomPanel_Data_Tab>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPanel_Data_Tab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPanel_Data_Tab>(create);
  static ResRoomPanel_Data_Tab? _defaultInstance;

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
  $core.List<ResRoomPanel_Data_Tab_RoomItem> get list => $_getList(1);
}

class ResRoomPanel_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPanel.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ResRoomPanel_Data_Tab>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabs',
        $pb.PbFieldType.PM,
        subBuilder: ResRoomPanel_Data_Tab.create)
    ..hasRequiredFields = false;

  ResRoomPanel_Data._() : super();
  factory ResRoomPanel_Data({
    $core.Iterable<ResRoomPanel_Data_Tab>? tabs,
  }) {
    final _result = create();
    if (tabs != null) {
      _result.tabs.addAll(tabs);
    }
    return _result;
  }
  factory ResRoomPanel_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPanel_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPanel_Data clone() => ResRoomPanel_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPanel_Data copyWith(void Function(ResRoomPanel_Data) updates) =>
      super.copyWith((message) => updates(message as ResRoomPanel_Data))
          as ResRoomPanel_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPanel_Data create() => ResRoomPanel_Data._();
  ResRoomPanel_Data createEmptyInstance() => create();
  static $pb.PbList<ResRoomPanel_Data> createRepeated() =>
      $pb.PbList<ResRoomPanel_Data>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPanel_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPanel_Data>(create);
  static ResRoomPanel_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ResRoomPanel_Data_Tab> get tabs => $_getList(0);
}

class ResRoomPanel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPanel',
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
    ..aOM<ResRoomPanel_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResRoomPanel_Data.create)
    ..hasRequiredFields = false;

  ResRoomPanel._() : super();
  factory ResRoomPanel({
    $core.bool? success,
    $core.String? msg,
    ResRoomPanel_Data? data,
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
  factory ResRoomPanel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPanel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPanel clone() => ResRoomPanel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPanel copyWith(void Function(ResRoomPanel) updates) =>
      super.copyWith((message) => updates(message as ResRoomPanel))
          as ResRoomPanel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPanel create() => ResRoomPanel._();
  ResRoomPanel createEmptyInstance() => create();
  static $pb.PbList<ResRoomPanel> createRepeated() =>
      $pb.PbList<ResRoomPanel>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPanel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPanel>(create);
  static ResRoomPanel? _defaultInstance;

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
  ResRoomPanel_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ResRoomPanel_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ResRoomPanel_Data ensureData() => $_ensure(2);
}
