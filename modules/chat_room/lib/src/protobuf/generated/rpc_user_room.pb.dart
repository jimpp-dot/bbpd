///
//  Generated code. Do not modify.
//  source: rpc_user_room.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'rpc_user_room.pbenum.dart';

export 'rpc_user_room.pbenum.dart';

class ReqHalfScreenOfVCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqHalfScreenOfVCard',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vuid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ReqHalfScreenOfVCard._() : super();
  factory ReqHalfScreenOfVCard({
    $core.int? vuid,
    $core.int? rid,
  }) {
    final _result = create();
    if (vuid != null) {
      _result.vuid = vuid;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    return _result;
  }
  factory ReqHalfScreenOfVCard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqHalfScreenOfVCard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqHalfScreenOfVCard clone() =>
      ReqHalfScreenOfVCard()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqHalfScreenOfVCard copyWith(void Function(ReqHalfScreenOfVCard) updates) =>
      super.copyWith((message) => updates(message as ReqHalfScreenOfVCard))
          as ReqHalfScreenOfVCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqHalfScreenOfVCard create() => ReqHalfScreenOfVCard._();
  ReqHalfScreenOfVCard createEmptyInstance() => create();
  static $pb.PbList<ReqHalfScreenOfVCard> createRepeated() =>
      $pb.PbList<ReqHalfScreenOfVCard>();
  @$core.pragma('dart2js:noInline')
  static ReqHalfScreenOfVCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqHalfScreenOfVCard>(create);
  static ReqHalfScreenOfVCard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get vuid => $_getIZ(0);
  @$pb.TagNumber(1)
  set vuid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearVuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rid => $_getIZ(1);
  @$pb.TagNumber(2)
  set rid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => clearField(2);
}

class ResHalfScreenOfVCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHalfScreenOfVCard',
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
    ..aOM<VCardInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: VCardInfo.create)
    ..hasRequiredFields = false;

  ResHalfScreenOfVCard._() : super();
  factory ResHalfScreenOfVCard({
    $core.bool? success,
    $core.String? msg,
    VCardInfo? data,
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
  factory ResHalfScreenOfVCard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHalfScreenOfVCard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHalfScreenOfVCard clone() =>
      ResHalfScreenOfVCard()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHalfScreenOfVCard copyWith(void Function(ResHalfScreenOfVCard) updates) =>
      super.copyWith((message) => updates(message as ResHalfScreenOfVCard))
          as ResHalfScreenOfVCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHalfScreenOfVCard create() => ResHalfScreenOfVCard._();
  ResHalfScreenOfVCard createEmptyInstance() => create();
  static $pb.PbList<ResHalfScreenOfVCard> createRepeated() =>
      $pb.PbList<ResHalfScreenOfVCard>();
  @$core.pragma('dart2js:noInline')
  static ResHalfScreenOfVCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHalfScreenOfVCard>(create);
  static ResHalfScreenOfVCard? _defaultInstance;

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
  VCardInfo get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(VCardInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  VCardInfo ensureData() => $_ensure(2);
}

class VCardInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VCardInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vuid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countryCode')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countryIcon')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micPosition',
        $pb.PbFieldType.OU3)
    ..aOB(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isFollow')
    ..pc<RoomOperateCardBehavior>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'behaviors',
        $pb.PbFieldType.PM,
        subBuilder: RoomOperateCardBehavior.create)
    ..hasRequiredFields = false;

  VCardInfo._() : super();
  factory VCardInfo({
    $core.int? vuid,
    $core.String? name,
    $core.int? age,
    $core.String? icon,
    $core.int? sex,
    $core.String? countryCode,
    $core.String? countryIcon,
    $core.int? micPosition,
    $core.bool? isFollow,
    $core.Iterable<RoomOperateCardBehavior>? behaviors,
  }) {
    final _result = create();
    if (vuid != null) {
      _result.vuid = vuid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (age != null) {
      _result.age = age;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (countryCode != null) {
      _result.countryCode = countryCode;
    }
    if (countryIcon != null) {
      _result.countryIcon = countryIcon;
    }
    if (micPosition != null) {
      _result.micPosition = micPosition;
    }
    if (isFollow != null) {
      _result.isFollow = isFollow;
    }
    if (behaviors != null) {
      _result.behaviors.addAll(behaviors);
    }
    return _result;
  }
  factory VCardInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VCardInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VCardInfo clone() => VCardInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VCardInfo copyWith(void Function(VCardInfo) updates) =>
      super.copyWith((message) => updates(message as VCardInfo))
          as VCardInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VCardInfo create() => VCardInfo._();
  VCardInfo createEmptyInstance() => create();
  static $pb.PbList<VCardInfo> createRepeated() => $pb.PbList<VCardInfo>();
  @$core.pragma('dart2js:noInline')
  static VCardInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VCardInfo>(create);
  static VCardInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get vuid => $_getIZ(0);
  @$pb.TagNumber(1)
  set vuid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearVuid() => clearField(1);

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
  $core.int get age => $_getIZ(2);
  @$pb.TagNumber(3)
  set age($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearAge() => clearField(3);

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
  $core.int get sex => $_getIZ(4);
  @$pb.TagNumber(5)
  set sex($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSex() => $_has(4);
  @$pb.TagNumber(5)
  void clearSex() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get countryCode => $_getSZ(5);
  @$pb.TagNumber(6)
  set countryCode($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCountryCode() => $_has(5);
  @$pb.TagNumber(6)
  void clearCountryCode() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get countryIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set countryIcon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCountryIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearCountryIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get micPosition => $_getIZ(7);
  @$pb.TagNumber(8)
  set micPosition($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMicPosition() => $_has(7);
  @$pb.TagNumber(8)
  void clearMicPosition() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isFollow => $_getBF(8);
  @$pb.TagNumber(9)
  set isFollow($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasIsFollow() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsFollow() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<RoomOperateCardBehavior> get behaviors => $_getList(9);
}

class RoomOperateCardBehavior extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomOperateCardBehavior',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..e<RoomOperateCardBehaviorType>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomOperateCardBehaviorType.INVALID,
        valueOf: RoomOperateCardBehaviorType.valueOf,
        enumValues: RoomOperateCardBehaviorType.values)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  RoomOperateCardBehavior._() : super();
  factory RoomOperateCardBehavior({
    RoomOperateCardBehaviorType? type,
    $core.String? name,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory RoomOperateCardBehavior.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomOperateCardBehavior.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomOperateCardBehavior clone() =>
      RoomOperateCardBehavior()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomOperateCardBehavior copyWith(
          void Function(RoomOperateCardBehavior) updates) =>
      super.copyWith((message) => updates(message as RoomOperateCardBehavior))
          as RoomOperateCardBehavior; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomOperateCardBehavior create() => RoomOperateCardBehavior._();
  RoomOperateCardBehavior createEmptyInstance() => create();
  static $pb.PbList<RoomOperateCardBehavior> createRepeated() =>
      $pb.PbList<RoomOperateCardBehavior>();
  @$core.pragma('dart2js:noInline')
  static RoomOperateCardBehavior getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomOperateCardBehavior>(create);
  static RoomOperateCardBehavior? _defaultInstance;

  @$pb.TagNumber(1)
  RoomOperateCardBehaviorType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(RoomOperateCardBehaviorType v) {
    setField(1, v);
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
}

class ReqRoomOperateCardBehaviorTypes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqRoomOperateCardBehaviorTypes',
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
            : 'vuid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ReqRoomOperateCardBehaviorTypes._() : super();
  factory ReqRoomOperateCardBehaviorTypes({
    $core.int? uid,
    $core.int? vuid,
    $core.int? rid,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (vuid != null) {
      _result.vuid = vuid;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    return _result;
  }
  factory ReqRoomOperateCardBehaviorTypes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqRoomOperateCardBehaviorTypes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqRoomOperateCardBehaviorTypes clone() =>
      ReqRoomOperateCardBehaviorTypes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqRoomOperateCardBehaviorTypes copyWith(
          void Function(ReqRoomOperateCardBehaviorTypes) updates) =>
      super.copyWith(
              (message) => updates(message as ReqRoomOperateCardBehaviorTypes))
          as ReqRoomOperateCardBehaviorTypes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqRoomOperateCardBehaviorTypes create() =>
      ReqRoomOperateCardBehaviorTypes._();
  ReqRoomOperateCardBehaviorTypes createEmptyInstance() => create();
  static $pb.PbList<ReqRoomOperateCardBehaviorTypes> createRepeated() =>
      $pb.PbList<ReqRoomOperateCardBehaviorTypes>();
  @$core.pragma('dart2js:noInline')
  static ReqRoomOperateCardBehaviorTypes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqRoomOperateCardBehaviorTypes>(
          create);
  static ReqRoomOperateCardBehaviorTypes? _defaultInstance;

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
  $core.int get vuid => $_getIZ(1);
  @$pb.TagNumber(2)
  set vuid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearVuid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rid => $_getIZ(2);
  @$pb.TagNumber(3)
  set rid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRid() => clearField(3);
}

class ResRoomOperateCardBehaviorTypes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomOperateCardBehaviorTypes',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<RoomOperateCardBehaviorType>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'behaviorTypes',
        $pb.PbFieldType.PE,
        valueOf: RoomOperateCardBehaviorType.valueOf,
        enumValues: RoomOperateCardBehaviorType.values)
    ..hasRequiredFields = false;

  ResRoomOperateCardBehaviorTypes._() : super();
  factory ResRoomOperateCardBehaviorTypes({
    $core.Iterable<RoomOperateCardBehaviorType>? behaviorTypes,
  }) {
    final _result = create();
    if (behaviorTypes != null) {
      _result.behaviorTypes.addAll(behaviorTypes);
    }
    return _result;
  }
  factory ResRoomOperateCardBehaviorTypes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomOperateCardBehaviorTypes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomOperateCardBehaviorTypes clone() =>
      ResRoomOperateCardBehaviorTypes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomOperateCardBehaviorTypes copyWith(
          void Function(ResRoomOperateCardBehaviorTypes) updates) =>
      super.copyWith(
              (message) => updates(message as ResRoomOperateCardBehaviorTypes))
          as ResRoomOperateCardBehaviorTypes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomOperateCardBehaviorTypes create() =>
      ResRoomOperateCardBehaviorTypes._();
  ResRoomOperateCardBehaviorTypes createEmptyInstance() => create();
  static $pb.PbList<ResRoomOperateCardBehaviorTypes> createRepeated() =>
      $pb.PbList<ResRoomOperateCardBehaviorTypes>();
  @$core.pragma('dart2js:noInline')
  static ResRoomOperateCardBehaviorTypes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomOperateCardBehaviorTypes>(
          create);
  static ResRoomOperateCardBehaviorTypes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomOperateCardBehaviorType> get behaviorTypes => $_getList(0);
}
