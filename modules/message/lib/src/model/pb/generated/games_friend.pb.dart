///
//  Generated code. Do not modify.
//  source: games_friend.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'room.pb.dart' as $0;

class ResGamesTogetherPlayUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGamesTogetherPlayUser',
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
    ..pc<GamesTogetherPlayUserItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: GamesTogetherPlayUserItem.create)
    ..hasRequiredFields = false;

  ResGamesTogetherPlayUser._() : super();
  factory ResGamesTogetherPlayUser({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GamesTogetherPlayUserItem>? data,
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
  factory ResGamesTogetherPlayUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGamesTogetherPlayUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGamesTogetherPlayUser clone() =>
      ResGamesTogetherPlayUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGamesTogetherPlayUser copyWith(
          void Function(ResGamesTogetherPlayUser) updates) =>
      super.copyWith((message) => updates(message as ResGamesTogetherPlayUser))
          as ResGamesTogetherPlayUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGamesTogetherPlayUser create() => ResGamesTogetherPlayUser._();
  ResGamesTogetherPlayUser createEmptyInstance() => create();
  static $pb.PbList<ResGamesTogetherPlayUser> createRepeated() =>
      $pb.PbList<ResGamesTogetherPlayUser>();
  @$core.pragma('dart2js:noInline')
  static ResGamesTogetherPlayUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGamesTogetherPlayUser>(create);
  static ResGamesTogetherPlayUser? _defaultInstance;

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
  $core.List<GamesTogetherPlayUserItem> get data => $_getList(2);
}

class GamesTogetherPlayUserItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GamesTogetherPlayUserItem',
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
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isOnline')
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inRoom')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOM<$0.RoomTypeName>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeName',
        subBuilder: $0.RoomTypeName.create)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleNew',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GamesTogetherPlayUserItem._() : super();
  factory GamesTogetherPlayUserItem({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.bool? isOnline,
    $core.bool? inRoom,
    $core.int? rid,
    $0.RoomTypeName? typeName,
    $core.String? desc,
    $core.int? titleNew,
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
    if (isOnline != null) {
      _result.isOnline = isOnline;
    }
    if (inRoom != null) {
      _result.inRoom = inRoom;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (typeName != null) {
      _result.typeName = typeName;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    return _result;
  }
  factory GamesTogetherPlayUserItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GamesTogetherPlayUserItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GamesTogetherPlayUserItem clone() =>
      GamesTogetherPlayUserItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GamesTogetherPlayUserItem copyWith(
          void Function(GamesTogetherPlayUserItem) updates) =>
      super.copyWith((message) => updates(message as GamesTogetherPlayUserItem))
          as GamesTogetherPlayUserItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GamesTogetherPlayUserItem create() => GamesTogetherPlayUserItem._();
  GamesTogetherPlayUserItem createEmptyInstance() => create();
  static $pb.PbList<GamesTogetherPlayUserItem> createRepeated() =>
      $pb.PbList<GamesTogetherPlayUserItem>();
  @$core.pragma('dart2js:noInline')
  static GamesTogetherPlayUserItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GamesTogetherPlayUserItem>(create);
  static GamesTogetherPlayUserItem? _defaultInstance;

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
  $core.bool get isOnline => $_getBF(3);
  @$pb.TagNumber(4)
  set isOnline($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsOnline() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsOnline() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get inRoom => $_getBF(4);
  @$pb.TagNumber(5)
  set inRoom($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasInRoom() => $_has(4);
  @$pb.TagNumber(5)
  void clearInRoom() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get rid => $_getIZ(5);
  @$pb.TagNumber(6)
  set rid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRid() => $_has(5);
  @$pb.TagNumber(6)
  void clearRid() => clearField(6);

  @$pb.TagNumber(7)
  $0.RoomTypeName get typeName => $_getN(6);
  @$pb.TagNumber(7)
  set typeName($0.RoomTypeName v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTypeName() => $_has(6);
  @$pb.TagNumber(7)
  void clearTypeName() => clearField(7);
  @$pb.TagNumber(7)
  $0.RoomTypeName ensureTypeName() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get desc => $_getSZ(7);
  @$pb.TagNumber(8)
  set desc($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDesc() => $_has(7);
  @$pb.TagNumber(8)
  void clearDesc() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get titleNew => $_getIZ(8);
  @$pb.TagNumber(9)
  set titleNew($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTitleNew() => $_has(8);
  @$pb.TagNumber(9)
  void clearTitleNew() => clearField(9);
}
