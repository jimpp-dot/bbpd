///
//  Generated code. Do not modify.
//  source: games_room_list.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'games_room_type.pb.dart' as $0;

class RespGamesRoomRecommendList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGamesRoomRecommendList',
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
    ..pc<GamesRoomRecommendListItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: GamesRoomRecommendListItem.create)
    ..hasRequiredFields = false;

  RespGamesRoomRecommendList._() : super();
  factory RespGamesRoomRecommendList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GamesRoomRecommendListItem>? data,
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
  factory RespGamesRoomRecommendList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGamesRoomRecommendList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGamesRoomRecommendList clone() =>
      RespGamesRoomRecommendList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGamesRoomRecommendList copyWith(
          void Function(RespGamesRoomRecommendList) updates) =>
      super.copyWith(
              (message) => updates(message as RespGamesRoomRecommendList))
          as RespGamesRoomRecommendList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGamesRoomRecommendList create() => RespGamesRoomRecommendList._();
  RespGamesRoomRecommendList createEmptyInstance() => create();
  static $pb.PbList<RespGamesRoomRecommendList> createRepeated() =>
      $pb.PbList<RespGamesRoomRecommendList>();
  @$core.pragma('dart2js:noInline')
  static RespGamesRoomRecommendList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGamesRoomRecommendList>(create);
  static RespGamesRoomRecommendList? _defaultInstance;

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
  $core.List<GamesRoomRecommendListItem> get data => $_getList(2);
}

class GamesRoomRecommendListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GamesRoomRecommendListItem',
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
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOM<$0.GamesRoomTypeName1>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeName',
        subBuilder: $0.GamesRoomTypeName1.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineNum',
        $pb.PbFieldType.OU3)
    ..pPS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micIcons')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prefix')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userName')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'haveLuckyBag',
        $pb.PbFieldType.O3)
    ..aOM<RcmdDesc>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rcmdDesc',
        subBuilder: RcmdDesc.create)
    ..hasRequiredFields = false;

  GamesRoomRecommendListItem._() : super();
  factory GamesRoomRecommendListItem({
    $core.int? rid,
    $core.String? name,
    $core.String? icon,
    $0.GamesRoomTypeName1? typeName,
    $core.int? onlineNum,
    $core.Iterable<$core.String>? micIcons,
    $core.String? prefix,
    $core.String? userName,
    $core.int? haveLuckyBag,
    RcmdDesc? rcmdDesc,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (typeName != null) {
      _result.typeName = typeName;
    }
    if (onlineNum != null) {
      _result.onlineNum = onlineNum;
    }
    if (micIcons != null) {
      _result.micIcons.addAll(micIcons);
    }
    if (prefix != null) {
      _result.prefix = prefix;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (haveLuckyBag != null) {
      _result.haveLuckyBag = haveLuckyBag;
    }
    if (rcmdDesc != null) {
      _result.rcmdDesc = rcmdDesc;
    }
    return _result;
  }
  factory GamesRoomRecommendListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GamesRoomRecommendListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GamesRoomRecommendListItem clone() =>
      GamesRoomRecommendListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GamesRoomRecommendListItem copyWith(
          void Function(GamesRoomRecommendListItem) updates) =>
      super.copyWith(
              (message) => updates(message as GamesRoomRecommendListItem))
          as GamesRoomRecommendListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GamesRoomRecommendListItem create() => GamesRoomRecommendListItem._();
  GamesRoomRecommendListItem createEmptyInstance() => create();
  static $pb.PbList<GamesRoomRecommendListItem> createRepeated() =>
      $pb.PbList<GamesRoomRecommendListItem>();
  @$core.pragma('dart2js:noInline')
  static GamesRoomRecommendListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GamesRoomRecommendListItem>(create);
  static GamesRoomRecommendListItem? _defaultInstance;

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
  $0.GamesRoomTypeName1 get typeName => $_getN(3);
  @$pb.TagNumber(4)
  set typeName($0.GamesRoomTypeName1 v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTypeName() => $_has(3);
  @$pb.TagNumber(4)
  void clearTypeName() => clearField(4);
  @$pb.TagNumber(4)
  $0.GamesRoomTypeName1 ensureTypeName() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get onlineNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set onlineNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOnlineNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get micIcons => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get prefix => $_getSZ(6);
  @$pb.TagNumber(7)
  set prefix($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPrefix() => $_has(6);
  @$pb.TagNumber(7)
  void clearPrefix() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get userName => $_getSZ(7);
  @$pb.TagNumber(8)
  set userName($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUserName() => $_has(7);
  @$pb.TagNumber(8)
  void clearUserName() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get haveLuckyBag => $_getIZ(8);
  @$pb.TagNumber(9)
  set haveLuckyBag($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasHaveLuckyBag() => $_has(8);
  @$pb.TagNumber(9)
  void clearHaveLuckyBag() => clearField(9);

  @$pb.TagNumber(10)
  RcmdDesc get rcmdDesc => $_getN(9);
  @$pb.TagNumber(10)
  set rcmdDesc(RcmdDesc v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRcmdDesc() => $_has(9);
  @$pb.TagNumber(10)
  void clearRcmdDesc() => clearField(10);
  @$pb.TagNumber(10)
  RcmdDesc ensureRcmdDesc() => $_ensure(9);
}

class RcmdDesc extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RcmdDesc',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  RcmdDesc._() : super();
  factory RcmdDesc({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? desc,
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
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory RcmdDesc.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RcmdDesc.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RcmdDesc clone() => RcmdDesc()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RcmdDesc copyWith(void Function(RcmdDesc) updates) =>
      super.copyWith((message) => updates(message as RcmdDesc))
          as RcmdDesc; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RcmdDesc create() => RcmdDesc._();
  RcmdDesc createEmptyInstance() => create();
  static $pb.PbList<RcmdDesc> createRepeated() => $pb.PbList<RcmdDesc>();
  @$core.pragma('dart2js:noInline')
  static RcmdDesc getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RcmdDesc>(create);
  static RcmdDesc? _defaultInstance;

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
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => clearField(4);
}

class GamesRoomFriendListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GamesRoomFriendListItem',
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
            : 'userName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
    ..aOM<$0.GamesRoomTypeName1>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeName',
        subBuilder: $0.GamesRoomTypeName1.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomDesc')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userDesc')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomIcon')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'haveLuckyBag',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  GamesRoomFriendListItem._() : super();
  factory GamesRoomFriendListItem({
    $core.int? rid,
    $core.String? userName,
    $core.String? userIcon,
    $0.GamesRoomTypeName1? typeName,
    $core.int? onlineNum,
    $core.String? roomDesc,
    $core.String? userDesc,
    $core.String? roomIcon,
    $core.int? haveLuckyBag,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    if (typeName != null) {
      _result.typeName = typeName;
    }
    if (onlineNum != null) {
      _result.onlineNum = onlineNum;
    }
    if (roomDesc != null) {
      _result.roomDesc = roomDesc;
    }
    if (userDesc != null) {
      _result.userDesc = userDesc;
    }
    if (roomIcon != null) {
      _result.roomIcon = roomIcon;
    }
    if (haveLuckyBag != null) {
      _result.haveLuckyBag = haveLuckyBag;
    }
    return _result;
  }
  factory GamesRoomFriendListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GamesRoomFriendListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GamesRoomFriendListItem clone() =>
      GamesRoomFriendListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GamesRoomFriendListItem copyWith(
          void Function(GamesRoomFriendListItem) updates) =>
      super.copyWith((message) => updates(message as GamesRoomFriendListItem))
          as GamesRoomFriendListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GamesRoomFriendListItem create() => GamesRoomFriendListItem._();
  GamesRoomFriendListItem createEmptyInstance() => create();
  static $pb.PbList<GamesRoomFriendListItem> createRepeated() =>
      $pb.PbList<GamesRoomFriendListItem>();
  @$core.pragma('dart2js:noInline')
  static GamesRoomFriendListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GamesRoomFriendListItem>(create);
  static GamesRoomFriendListItem? _defaultInstance;

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
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set userIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUserIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserIcon() => clearField(3);

  @$pb.TagNumber(4)
  $0.GamesRoomTypeName1 get typeName => $_getN(3);
  @$pb.TagNumber(4)
  set typeName($0.GamesRoomTypeName1 v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTypeName() => $_has(3);
  @$pb.TagNumber(4)
  void clearTypeName() => clearField(4);
  @$pb.TagNumber(4)
  $0.GamesRoomTypeName1 ensureTypeName() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get onlineNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set onlineNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOnlineNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get roomDesc => $_getSZ(5);
  @$pb.TagNumber(6)
  set roomDesc($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRoomDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomDesc() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get userDesc => $_getSZ(6);
  @$pb.TagNumber(7)
  set userDesc($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUserDesc() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserDesc() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get roomIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set roomIcon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRoomIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearRoomIcon() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get haveLuckyBag => $_getIZ(8);
  @$pb.TagNumber(9)
  set haveLuckyBag($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasHaveLuckyBag() => $_has(8);
  @$pb.TagNumber(9)
  void clearHaveLuckyBag() => clearField(9);
}

class ResponseGamesRoomFriendList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResponseGamesRoomFriendList',
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
    ..pc<GamesRoomFriendListItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: GamesRoomFriendListItem.create)
    ..hasRequiredFields = false;

  ResponseGamesRoomFriendList._() : super();
  factory ResponseGamesRoomFriendList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GamesRoomFriendListItem>? data,
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
  factory ResponseGamesRoomFriendList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResponseGamesRoomFriendList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResponseGamesRoomFriendList clone() =>
      ResponseGamesRoomFriendList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResponseGamesRoomFriendList copyWith(
          void Function(ResponseGamesRoomFriendList) updates) =>
      super.copyWith(
              (message) => updates(message as ResponseGamesRoomFriendList))
          as ResponseGamesRoomFriendList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseGamesRoomFriendList create() =>
      ResponseGamesRoomFriendList._();
  ResponseGamesRoomFriendList createEmptyInstance() => create();
  static $pb.PbList<ResponseGamesRoomFriendList> createRepeated() =>
      $pb.PbList<ResponseGamesRoomFriendList>();
  @$core.pragma('dart2js:noInline')
  static ResponseGamesRoomFriendList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResponseGamesRoomFriendList>(create);
  static ResponseGamesRoomFriendList? _defaultInstance;

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
  $core.List<GamesRoomFriendListItem> get data => $_getList(2);
}
