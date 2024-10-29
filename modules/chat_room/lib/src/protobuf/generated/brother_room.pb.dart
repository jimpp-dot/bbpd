///
//  Generated code. Do not modify.
//  source: brother_room.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ApiBrotherConfigResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiBrotherConfigResponse',
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
            : 'message')
    ..aOM<BrotherConfigMessage>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BrotherConfigMessage.create)
    ..hasRequiredFields = false;

  ApiBrotherConfigResponse._() : super();
  factory ApiBrotherConfigResponse({
    $core.bool? success,
    $core.String? message,
    BrotherConfigMessage? data,
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
  factory ApiBrotherConfigResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiBrotherConfigResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiBrotherConfigResponse clone() =>
      ApiBrotherConfigResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiBrotherConfigResponse copyWith(
          void Function(ApiBrotherConfigResponse) updates) =>
      super.copyWith((message) => updates(message as ApiBrotherConfigResponse))
          as ApiBrotherConfigResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiBrotherConfigResponse create() => ApiBrotherConfigResponse._();
  ApiBrotherConfigResponse createEmptyInstance() => create();
  static $pb.PbList<ApiBrotherConfigResponse> createRepeated() =>
      $pb.PbList<ApiBrotherConfigResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiBrotherConfigResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiBrotherConfigResponse>(create);
  static ApiBrotherConfigResponse? _defaultInstance;

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
  BrotherConfigMessage get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BrotherConfigMessage v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BrotherConfigMessage ensureData() => $_ensure(2);
}

class BrotherConfigMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BrotherConfigMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'option',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<BrotherUserInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'master',
        subBuilder: BrotherUserInfo.create)
    ..aOM<BrotherRoomBase>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room',
        subBuilder: BrotherRoomBase.create)
    ..pc<BrotherDecorateLayoutItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'layout',
        $pb.PbFieldType.PM,
        subBuilder: BrotherDecorateLayoutItem.create)
    ..aOM<BrotherUpgradeMessage>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message',
        subBuilder: BrotherUpgradeMessage.create)
    ..hasRequiredFields = false;

  BrotherConfigMessage._() : super();
  factory BrotherConfigMessage({
    $fixnum.Int64? option,
    BrotherUserInfo? master,
    BrotherRoomBase? room,
    $core.Iterable<BrotherDecorateLayoutItem>? layout,
    BrotherUpgradeMessage? message,
  }) {
    final _result = create();
    if (option != null) {
      _result.option = option;
    }
    if (master != null) {
      _result.master = master;
    }
    if (room != null) {
      _result.room = room;
    }
    if (layout != null) {
      _result.layout.addAll(layout);
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory BrotherConfigMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BrotherConfigMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BrotherConfigMessage clone() =>
      BrotherConfigMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BrotherConfigMessage copyWith(void Function(BrotherConfigMessage) updates) =>
      super.copyWith((message) => updates(message as BrotherConfigMessage))
          as BrotherConfigMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BrotherConfigMessage create() => BrotherConfigMessage._();
  BrotherConfigMessage createEmptyInstance() => create();
  static $pb.PbList<BrotherConfigMessage> createRepeated() =>
      $pb.PbList<BrotherConfigMessage>();
  @$core.pragma('dart2js:noInline')
  static BrotherConfigMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BrotherConfigMessage>(create);
  static BrotherConfigMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get option => $_getI64(0);
  @$pb.TagNumber(1)
  set option($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOption() => $_has(0);
  @$pb.TagNumber(1)
  void clearOption() => clearField(1);

  @$pb.TagNumber(2)
  BrotherUserInfo get master => $_getN(1);
  @$pb.TagNumber(2)
  set master(BrotherUserInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMaster() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaster() => clearField(2);
  @$pb.TagNumber(2)
  BrotherUserInfo ensureMaster() => $_ensure(1);

  @$pb.TagNumber(3)
  BrotherRoomBase get room => $_getN(2);
  @$pb.TagNumber(3)
  set room(BrotherRoomBase v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoom() => clearField(3);
  @$pb.TagNumber(3)
  BrotherRoomBase ensureRoom() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<BrotherDecorateLayoutItem> get layout => $_getList(3);

  @$pb.TagNumber(5)
  BrotherUpgradeMessage get message => $_getN(4);
  @$pb.TagNumber(5)
  set message(BrotherUpgradeMessage v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessage() => clearField(5);
  @$pb.TagNumber(5)
  BrotherUpgradeMessage ensureMessage() => $_ensure(4);
}

class BrotherRoomBase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BrotherRoomBase',
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
            : 'exp',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextLevelGap',
        $pb.PbFieldType.OU3)
    ..aOM<BrotherDecorateLayoutItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background',
        subBuilder: BrotherDecorateLayoutItem.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'initViewOffset',
        $pb.PbFieldType.OU3,
        protoName: 'initViewOffset')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelInfo')
    ..hasRequiredFields = false;

  BrotherRoomBase._() : super();
  factory BrotherRoomBase({
    $core.int? rid,
    $core.int? exp,
    $core.int? level,
    $core.int? nextLevelGap,
    BrotherDecorateLayoutItem? background,
    $core.int? initViewOffset,
    $core.String? levelInfo,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (exp != null) {
      _result.exp = exp;
    }
    if (level != null) {
      _result.level = level;
    }
    if (nextLevelGap != null) {
      _result.nextLevelGap = nextLevelGap;
    }
    if (background != null) {
      _result.background = background;
    }
    if (initViewOffset != null) {
      _result.initViewOffset = initViewOffset;
    }
    if (levelInfo != null) {
      _result.levelInfo = levelInfo;
    }
    return _result;
  }
  factory BrotherRoomBase.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BrotherRoomBase.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BrotherRoomBase clone() => BrotherRoomBase()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BrotherRoomBase copyWith(void Function(BrotherRoomBase) updates) =>
      super.copyWith((message) => updates(message as BrotherRoomBase))
          as BrotherRoomBase; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BrotherRoomBase create() => BrotherRoomBase._();
  BrotherRoomBase createEmptyInstance() => create();
  static $pb.PbList<BrotherRoomBase> createRepeated() =>
      $pb.PbList<BrotherRoomBase>();
  @$core.pragma('dart2js:noInline')
  static BrotherRoomBase getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BrotherRoomBase>(create);
  static BrotherRoomBase? _defaultInstance;

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
  $core.int get exp => $_getIZ(1);
  @$pb.TagNumber(2)
  set exp($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasExp() => $_has(1);
  @$pb.TagNumber(2)
  void clearExp() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get nextLevelGap => $_getIZ(3);
  @$pb.TagNumber(4)
  set nextLevelGap($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNextLevelGap() => $_has(3);
  @$pb.TagNumber(4)
  void clearNextLevelGap() => clearField(4);

  @$pb.TagNumber(5)
  BrotherDecorateLayoutItem get background => $_getN(4);
  @$pb.TagNumber(5)
  set background(BrotherDecorateLayoutItem v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBackground() => $_has(4);
  @$pb.TagNumber(5)
  void clearBackground() => clearField(5);
  @$pb.TagNumber(5)
  BrotherDecorateLayoutItem ensureBackground() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get initViewOffset => $_getIZ(5);
  @$pb.TagNumber(6)
  set initViewOffset($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasInitViewOffset() => $_has(5);
  @$pb.TagNumber(6)
  void clearInitViewOffset() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get levelInfo => $_getSZ(6);
  @$pb.TagNumber(7)
  set levelInfo($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLevelInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearLevelInfo() => clearField(7);
}

class BrotherUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BrotherUserInfo',
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
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BrotherUserInfo._() : super();
  factory BrotherUserInfo({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? age,
    $core.int? sex,
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
    if (age != null) {
      _result.age = age;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    return _result;
  }
  factory BrotherUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BrotherUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BrotherUserInfo clone() => BrotherUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BrotherUserInfo copyWith(void Function(BrotherUserInfo) updates) =>
      super.copyWith((message) => updates(message as BrotherUserInfo))
          as BrotherUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BrotherUserInfo create() => BrotherUserInfo._();
  BrotherUserInfo createEmptyInstance() => create();
  static $pb.PbList<BrotherUserInfo> createRepeated() =>
      $pb.PbList<BrotherUserInfo>();
  @$core.pragma('dart2js:noInline')
  static BrotherUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BrotherUserInfo>(create);
  static BrotherUserInfo? _defaultInstance;

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
  $core.int get sex => $_getIZ(4);
  @$pb.TagNumber(5)
  set sex($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSex() => $_has(4);
  @$pb.TagNumber(5)
  void clearSex() => clearField(5);
}

class BrotherDecorateLayoutItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BrotherDecorateLayoutItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'elementId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'x',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'y',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width',
        $pb.PbFieldType.O3)
    ..aOM<BrotherDecorateExtra>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extra',
        subBuilder: BrotherDecorateExtra.create)
    ..hasRequiredFields = false;

  BrotherDecorateLayoutItem._() : super();
  factory BrotherDecorateLayoutItem({
    $core.int? elementId,
    $core.String? url,
    $core.int? x,
    $core.int? y,
    $core.int? height,
    $core.int? width,
    BrotherDecorateExtra? extra,
  }) {
    final _result = create();
    if (elementId != null) {
      _result.elementId = elementId;
    }
    if (url != null) {
      _result.url = url;
    }
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    if (height != null) {
      _result.height = height;
    }
    if (width != null) {
      _result.width = width;
    }
    if (extra != null) {
      _result.extra = extra;
    }
    return _result;
  }
  factory BrotherDecorateLayoutItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BrotherDecorateLayoutItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BrotherDecorateLayoutItem clone() =>
      BrotherDecorateLayoutItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BrotherDecorateLayoutItem copyWith(
          void Function(BrotherDecorateLayoutItem) updates) =>
      super.copyWith((message) => updates(message as BrotherDecorateLayoutItem))
          as BrotherDecorateLayoutItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BrotherDecorateLayoutItem create() => BrotherDecorateLayoutItem._();
  BrotherDecorateLayoutItem createEmptyInstance() => create();
  static $pb.PbList<BrotherDecorateLayoutItem> createRepeated() =>
      $pb.PbList<BrotherDecorateLayoutItem>();
  @$core.pragma('dart2js:noInline')
  static BrotherDecorateLayoutItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BrotherDecorateLayoutItem>(create);
  static BrotherDecorateLayoutItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get elementId => $_getIZ(0);
  @$pb.TagNumber(1)
  set elementId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasElementId() => $_has(0);
  @$pb.TagNumber(1)
  void clearElementId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get x => $_getIZ(2);
  @$pb.TagNumber(3)
  set x($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasX() => $_has(2);
  @$pb.TagNumber(3)
  void clearX() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get y => $_getIZ(3);
  @$pb.TagNumber(4)
  set y($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasY() => $_has(3);
  @$pb.TagNumber(4)
  void clearY() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get height => $_getIZ(4);
  @$pb.TagNumber(5)
  set height($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get width => $_getIZ(5);
  @$pb.TagNumber(6)
  set width($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWidth() => $_has(5);
  @$pb.TagNumber(6)
  void clearWidth() => clearField(6);

  @$pb.TagNumber(7)
  BrotherDecorateExtra get extra => $_getN(6);
  @$pb.TagNumber(7)
  set extra(BrotherDecorateExtra v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasExtra() => $_has(6);
  @$pb.TagNumber(7)
  void clearExtra() => clearField(7);
  @$pb.TagNumber(7)
  BrotherDecorateExtra ensureExtra() => $_ensure(6);
}

enum BrotherDecorateExtra_Data { calender, notSet }

class BrotherDecorateExtra extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, BrotherDecorateExtra_Data>
      _BrotherDecorateExtra_DataByTag = {
    1: BrotherDecorateExtra_Data.calender,
    0: BrotherDecorateExtra_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BrotherDecorateExtra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<BrotherDecorateCalenderExtra>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'calender',
        subBuilder: BrotherDecorateCalenderExtra.create)
    ..hasRequiredFields = false;

  BrotherDecorateExtra._() : super();
  factory BrotherDecorateExtra({
    BrotherDecorateCalenderExtra? calender,
  }) {
    final _result = create();
    if (calender != null) {
      _result.calender = calender;
    }
    return _result;
  }
  factory BrotherDecorateExtra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BrotherDecorateExtra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BrotherDecorateExtra clone() =>
      BrotherDecorateExtra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BrotherDecorateExtra copyWith(void Function(BrotherDecorateExtra) updates) =>
      super.copyWith((message) => updates(message as BrotherDecorateExtra))
          as BrotherDecorateExtra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BrotherDecorateExtra create() => BrotherDecorateExtra._();
  BrotherDecorateExtra createEmptyInstance() => create();
  static $pb.PbList<BrotherDecorateExtra> createRepeated() =>
      $pb.PbList<BrotherDecorateExtra>();
  @$core.pragma('dart2js:noInline')
  static BrotherDecorateExtra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BrotherDecorateExtra>(create);
  static BrotherDecorateExtra? _defaultInstance;

  BrotherDecorateExtra_Data whichData() =>
      _BrotherDecorateExtra_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  BrotherDecorateCalenderExtra get calender => $_getN(0);
  @$pb.TagNumber(1)
  set calender(BrotherDecorateCalenderExtra v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCalender() => $_has(0);
  @$pb.TagNumber(1)
  void clearCalender() => clearField(1);
  @$pb.TagNumber(1)
  BrotherDecorateCalenderExtra ensureCalender() => $_ensure(0);
}

class BrotherDecorateCalenderExtra extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BrotherDecorateCalenderExtra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextBirthdayDays',
        $pb.PbFieldType.OU3,
        protoName: 'nextBirthdayDays')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'w',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'h',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'x',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'y',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  BrotherDecorateCalenderExtra._() : super();
  factory BrotherDecorateCalenderExtra({
    $core.int? birthday,
    $core.int? nextBirthdayDays,
    $core.int? w,
    $core.int? h,
    $core.int? x,
    $core.int? y,
  }) {
    final _result = create();
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (nextBirthdayDays != null) {
      _result.nextBirthdayDays = nextBirthdayDays;
    }
    if (w != null) {
      _result.w = w;
    }
    if (h != null) {
      _result.h = h;
    }
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    return _result;
  }
  factory BrotherDecorateCalenderExtra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BrotherDecorateCalenderExtra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BrotherDecorateCalenderExtra clone() =>
      BrotherDecorateCalenderExtra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BrotherDecorateCalenderExtra copyWith(
          void Function(BrotherDecorateCalenderExtra) updates) =>
      super.copyWith(
              (message) => updates(message as BrotherDecorateCalenderExtra))
          as BrotherDecorateCalenderExtra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BrotherDecorateCalenderExtra create() =>
      BrotherDecorateCalenderExtra._();
  BrotherDecorateCalenderExtra createEmptyInstance() => create();
  static $pb.PbList<BrotherDecorateCalenderExtra> createRepeated() =>
      $pb.PbList<BrotherDecorateCalenderExtra>();
  @$core.pragma('dart2js:noInline')
  static BrotherDecorateCalenderExtra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BrotherDecorateCalenderExtra>(create);
  static BrotherDecorateCalenderExtra? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get birthday => $_getIZ(0);
  @$pb.TagNumber(1)
  set birthday($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBirthday() => $_has(0);
  @$pb.TagNumber(1)
  void clearBirthday() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get nextBirthdayDays => $_getIZ(1);
  @$pb.TagNumber(2)
  set nextBirthdayDays($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNextBirthdayDays() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextBirthdayDays() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get w => $_getIZ(2);
  @$pb.TagNumber(3)
  set w($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasW() => $_has(2);
  @$pb.TagNumber(3)
  void clearW() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get h => $_getIZ(3);
  @$pb.TagNumber(4)
  set h($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasH() => $_has(3);
  @$pb.TagNumber(4)
  void clearH() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get x => $_getIZ(4);
  @$pb.TagNumber(5)
  set x($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasX() => $_has(4);
  @$pb.TagNumber(5)
  void clearX() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get y => $_getIZ(5);
  @$pb.TagNumber(6)
  set y($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasY() => $_has(5);
  @$pb.TagNumber(6)
  void clearY() => clearField(6);
}

class ApiBrotherPreferencesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiBrotherPreferencesResponse',
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
            : 'message')
    ..aOM<BrotherPreferencesData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BrotherPreferencesData.create)
    ..hasRequiredFields = false;

  ApiBrotherPreferencesResponse._() : super();
  factory ApiBrotherPreferencesResponse({
    $core.bool? success,
    $core.String? message,
    BrotherPreferencesData? data,
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
  factory ApiBrotherPreferencesResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiBrotherPreferencesResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiBrotherPreferencesResponse clone() =>
      ApiBrotherPreferencesResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiBrotherPreferencesResponse copyWith(
          void Function(ApiBrotherPreferencesResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiBrotherPreferencesResponse))
          as ApiBrotherPreferencesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiBrotherPreferencesResponse create() =>
      ApiBrotherPreferencesResponse._();
  ApiBrotherPreferencesResponse createEmptyInstance() => create();
  static $pb.PbList<ApiBrotherPreferencesResponse> createRepeated() =>
      $pb.PbList<ApiBrotherPreferencesResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiBrotherPreferencesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiBrotherPreferencesResponse>(create);
  static ApiBrotherPreferencesResponse? _defaultInstance;

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
  BrotherPreferencesData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BrotherPreferencesData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BrotherPreferencesData ensureData() => $_ensure(2);
}

class BrotherPreferencesData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BrotherPreferencesData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<BrotherDecorateItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'decorates',
        $pb.PbFieldType.PM,
        subBuilder: BrotherDecorateItem.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'annotation')
    ..hasRequiredFields = false;

  BrotherPreferencesData._() : super();
  factory BrotherPreferencesData({
    $core.Iterable<BrotherDecorateItem>? decorates,
    $core.String? annotation,
  }) {
    final _result = create();
    if (decorates != null) {
      _result.decorates.addAll(decorates);
    }
    if (annotation != null) {
      _result.annotation = annotation;
    }
    return _result;
  }
  factory BrotherPreferencesData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BrotherPreferencesData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BrotherPreferencesData clone() =>
      BrotherPreferencesData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BrotherPreferencesData copyWith(
          void Function(BrotherPreferencesData) updates) =>
      super.copyWith((message) => updates(message as BrotherPreferencesData))
          as BrotherPreferencesData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BrotherPreferencesData create() => BrotherPreferencesData._();
  BrotherPreferencesData createEmptyInstance() => create();
  static $pb.PbList<BrotherPreferencesData> createRepeated() =>
      $pb.PbList<BrotherPreferencesData>();
  @$core.pragma('dart2js:noInline')
  static BrotherPreferencesData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BrotherPreferencesData>(create);
  static BrotherPreferencesData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BrotherDecorateItem> get decorates => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get annotation => $_getSZ(1);
  @$pb.TagNumber(2)
  set annotation($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAnnotation() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnnotation() => clearField(2);
}

class BrotherDecorateItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BrotherDecorateItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'elementId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'power',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'baseLevel',
        $pb.PbFieldType.OU3,
        protoName: 'baseLevel')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  BrotherDecorateItem._() : super();
  factory BrotherDecorateItem({
    $core.int? elementId,
    $core.String? url,
    $core.int? power,
    $core.int? display,
    $core.int? baseLevel,
    $core.String? name,
  }) {
    final _result = create();
    if (elementId != null) {
      _result.elementId = elementId;
    }
    if (url != null) {
      _result.url = url;
    }
    if (power != null) {
      _result.power = power;
    }
    if (display != null) {
      _result.display = display;
    }
    if (baseLevel != null) {
      _result.baseLevel = baseLevel;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory BrotherDecorateItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BrotherDecorateItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BrotherDecorateItem clone() => BrotherDecorateItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BrotherDecorateItem copyWith(void Function(BrotherDecorateItem) updates) =>
      super.copyWith((message) => updates(message as BrotherDecorateItem))
          as BrotherDecorateItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BrotherDecorateItem create() => BrotherDecorateItem._();
  BrotherDecorateItem createEmptyInstance() => create();
  static $pb.PbList<BrotherDecorateItem> createRepeated() =>
      $pb.PbList<BrotherDecorateItem>();
  @$core.pragma('dart2js:noInline')
  static BrotherDecorateItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BrotherDecorateItem>(create);
  static BrotherDecorateItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get elementId => $_getIZ(0);
  @$pb.TagNumber(1)
  set elementId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasElementId() => $_has(0);
  @$pb.TagNumber(1)
  void clearElementId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get power => $_getIZ(2);
  @$pb.TagNumber(3)
  set power($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPower() => $_has(2);
  @$pb.TagNumber(3)
  void clearPower() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get display => $_getIZ(3);
  @$pb.TagNumber(4)
  set display($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDisplay() => $_has(3);
  @$pb.TagNumber(4)
  void clearDisplay() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get baseLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set baseLevel($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBaseLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearBaseLevel() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);
}

class BrotherUpgradeMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BrotherUpgradeMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newLevel',
        $pb.PbFieldType.OU3,
        protoName: 'newLevel')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'decorateName',
        protoName: 'decorateName')
    ..hasRequiredFields = false;

  BrotherUpgradeMessage._() : super();
  factory BrotherUpgradeMessage({
    $core.int? newLevel,
    $core.String? decorateName,
  }) {
    final _result = create();
    if (newLevel != null) {
      _result.newLevel = newLevel;
    }
    if (decorateName != null) {
      _result.decorateName = decorateName;
    }
    return _result;
  }
  factory BrotherUpgradeMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BrotherUpgradeMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BrotherUpgradeMessage clone() =>
      BrotherUpgradeMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BrotherUpgradeMessage copyWith(
          void Function(BrotherUpgradeMessage) updates) =>
      super.copyWith((message) => updates(message as BrotherUpgradeMessage))
          as BrotherUpgradeMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BrotherUpgradeMessage create() => BrotherUpgradeMessage._();
  BrotherUpgradeMessage createEmptyInstance() => create();
  static $pb.PbList<BrotherUpgradeMessage> createRepeated() =>
      $pb.PbList<BrotherUpgradeMessage>();
  @$core.pragma('dart2js:noInline')
  static BrotherUpgradeMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BrotherUpgradeMessage>(create);
  static BrotherUpgradeMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get newLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set newLevel($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNewLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get decorateName => $_getSZ(1);
  @$pb.TagNumber(2)
  set decorateName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDecorateName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDecorateName() => clearField(2);
}
