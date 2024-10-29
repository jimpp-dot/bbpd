///
//  Generated code. Do not modify.
//  source: joint_search.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'banban_home.pb.dart' as $0;

import 'joint_search.pbenum.dart';

export 'joint_search.pbenum.dart';

class JointSearchResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JointSearchResp',
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
    ..pc<JointSearchItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: JointSearchItem.create)
    ..hasRequiredFields = false;

  JointSearchResp._() : super();
  factory JointSearchResp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<JointSearchItem>? data,
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
  factory JointSearchResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JointSearchResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JointSearchResp clone() => JointSearchResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JointSearchResp copyWith(void Function(JointSearchResp) updates) =>
      super.copyWith((message) => updates(message as JointSearchResp))
          as JointSearchResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JointSearchResp create() => JointSearchResp._();
  JointSearchResp createEmptyInstance() => create();
  static $pb.PbList<JointSearchResp> createRepeated() =>
      $pb.PbList<JointSearchResp>();
  @$core.pragma('dart2js:noInline')
  static JointSearchResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JointSearchResp>(create);
  static JointSearchResp? _defaultInstance;

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
  $core.List<JointSearchItem> get data => $_getList(2);
}

class JointSearchItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JointSearchItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..e<JointSearchItemType>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OE,
        defaultOrMaker: JointSearchItemType.ItemTypeInvalid,
        valueOf: JointSearchItemType.valueOf,
        enumValues: JointSearchItemType.values)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
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
    ..aOM<JointSearchUserItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: JointSearchUserItem.create)
    ..aOM<JointSearchFleetItem>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fleet',
        subBuilder: JointSearchFleetItem.create)
    ..aOM<JointSearchEggItem>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'egg',
        subBuilder: JointSearchEggItem.create)
    ..aOM<JointSearchBagItem>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bag',
        subBuilder: JointSearchBagItem.create)
    ..aOM<JointSearchGroupItem>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'group',
        subBuilder: JointSearchGroupItem.create)
    ..aOM<JointSearchRoomItem>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room',
        subBuilder: JointSearchRoomItem.create)
    ..aOM<JointSearchUnionItem>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'union',
        subBuilder: JointSearchUnionItem.create)
    ..aOM<JointSearchTourItem>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tour',
        subBuilder: JointSearchTourItem.create)
    ..aOM<JointSearchMusicItem>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'music',
        subBuilder: JointSearchMusicItem.create)
    ..aOM<JointSearchWorkItem>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'work',
        subBuilder: JointSearchWorkItem.create)
    ..aOM<$0.RoomListItem>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'kolRoom',
        subBuilder: $0.RoomListItem.create)
    ..aOM<JointSearchKolBannerItem>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'kolBanner',
        subBuilder: JointSearchKolBannerItem.create)
    ..aOM<JointSearchSingerClub>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singer',
        subBuilder: JointSearchSingerClub.create)
    ..hasRequiredFields = false;

  JointSearchItem._() : super();
  factory JointSearchItem({
    JointSearchItemType? type,
    $core.int? id,
    $core.String? name,
    $core.String? icon,
    JointSearchUserItem? user,
    JointSearchFleetItem? fleet,
    JointSearchEggItem? egg,
    JointSearchBagItem? bag,
    JointSearchGroupItem? group,
    JointSearchRoomItem? room,
    JointSearchUnionItem? union,
    JointSearchTourItem? tour,
    JointSearchMusicItem? music,
    JointSearchWorkItem? work,
    $0.RoomListItem? kolRoom,
    JointSearchKolBannerItem? kolBanner,
    JointSearchSingerClub? singer,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (user != null) {
      _result.user = user;
    }
    if (fleet != null) {
      _result.fleet = fleet;
    }
    if (egg != null) {
      _result.egg = egg;
    }
    if (bag != null) {
      _result.bag = bag;
    }
    if (group != null) {
      _result.group = group;
    }
    if (room != null) {
      _result.room = room;
    }
    if (union != null) {
      _result.union = union;
    }
    if (tour != null) {
      _result.tour = tour;
    }
    if (music != null) {
      _result.music = music;
    }
    if (work != null) {
      _result.work = work;
    }
    if (kolRoom != null) {
      _result.kolRoom = kolRoom;
    }
    if (kolBanner != null) {
      _result.kolBanner = kolBanner;
    }
    if (singer != null) {
      _result.singer = singer;
    }
    return _result;
  }
  factory JointSearchItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JointSearchItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JointSearchItem clone() => JointSearchItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JointSearchItem copyWith(void Function(JointSearchItem) updates) =>
      super.copyWith((message) => updates(message as JointSearchItem))
          as JointSearchItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JointSearchItem create() => JointSearchItem._();
  JointSearchItem createEmptyInstance() => create();
  static $pb.PbList<JointSearchItem> createRepeated() =>
      $pb.PbList<JointSearchItem>();
  @$core.pragma('dart2js:noInline')
  static JointSearchItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JointSearchItem>(create);
  static JointSearchItem? _defaultInstance;

  @$pb.TagNumber(1)
  JointSearchItemType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(JointSearchItemType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

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
  JointSearchUserItem get user => $_getN(4);
  @$pb.TagNumber(5)
  set user(JointSearchUserItem v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUser() => $_has(4);
  @$pb.TagNumber(5)
  void clearUser() => clearField(5);
  @$pb.TagNumber(5)
  JointSearchUserItem ensureUser() => $_ensure(4);

  @$pb.TagNumber(6)
  JointSearchFleetItem get fleet => $_getN(5);
  @$pb.TagNumber(6)
  set fleet(JointSearchFleetItem v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFleet() => $_has(5);
  @$pb.TagNumber(6)
  void clearFleet() => clearField(6);
  @$pb.TagNumber(6)
  JointSearchFleetItem ensureFleet() => $_ensure(5);

  @$pb.TagNumber(7)
  JointSearchEggItem get egg => $_getN(6);
  @$pb.TagNumber(7)
  set egg(JointSearchEggItem v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasEgg() => $_has(6);
  @$pb.TagNumber(7)
  void clearEgg() => clearField(7);
  @$pb.TagNumber(7)
  JointSearchEggItem ensureEgg() => $_ensure(6);

  @$pb.TagNumber(8)
  JointSearchBagItem get bag => $_getN(7);
  @$pb.TagNumber(8)
  set bag(JointSearchBagItem v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasBag() => $_has(7);
  @$pb.TagNumber(8)
  void clearBag() => clearField(8);
  @$pb.TagNumber(8)
  JointSearchBagItem ensureBag() => $_ensure(7);

  @$pb.TagNumber(9)
  JointSearchGroupItem get group => $_getN(8);
  @$pb.TagNumber(9)
  set group(JointSearchGroupItem v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGroup() => $_has(8);
  @$pb.TagNumber(9)
  void clearGroup() => clearField(9);
  @$pb.TagNumber(9)
  JointSearchGroupItem ensureGroup() => $_ensure(8);

  @$pb.TagNumber(10)
  JointSearchRoomItem get room => $_getN(9);
  @$pb.TagNumber(10)
  set room(JointSearchRoomItem v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRoom() => $_has(9);
  @$pb.TagNumber(10)
  void clearRoom() => clearField(10);
  @$pb.TagNumber(10)
  JointSearchRoomItem ensureRoom() => $_ensure(9);

  @$pb.TagNumber(11)
  JointSearchUnionItem get union => $_getN(10);
  @$pb.TagNumber(11)
  set union(JointSearchUnionItem v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasUnion() => $_has(10);
  @$pb.TagNumber(11)
  void clearUnion() => clearField(11);
  @$pb.TagNumber(11)
  JointSearchUnionItem ensureUnion() => $_ensure(10);

  @$pb.TagNumber(12)
  JointSearchTourItem get tour => $_getN(11);
  @$pb.TagNumber(12)
  set tour(JointSearchTourItem v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasTour() => $_has(11);
  @$pb.TagNumber(12)
  void clearTour() => clearField(12);
  @$pb.TagNumber(12)
  JointSearchTourItem ensureTour() => $_ensure(11);

  @$pb.TagNumber(13)
  JointSearchMusicItem get music => $_getN(12);
  @$pb.TagNumber(13)
  set music(JointSearchMusicItem v) {
    setField(13, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasMusic() => $_has(12);
  @$pb.TagNumber(13)
  void clearMusic() => clearField(13);
  @$pb.TagNumber(13)
  JointSearchMusicItem ensureMusic() => $_ensure(12);

  @$pb.TagNumber(14)
  JointSearchWorkItem get work => $_getN(13);
  @$pb.TagNumber(14)
  set work(JointSearchWorkItem v) {
    setField(14, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasWork() => $_has(13);
  @$pb.TagNumber(14)
  void clearWork() => clearField(14);
  @$pb.TagNumber(14)
  JointSearchWorkItem ensureWork() => $_ensure(13);

  @$pb.TagNumber(15)
  $0.RoomListItem get kolRoom => $_getN(14);
  @$pb.TagNumber(15)
  set kolRoom($0.RoomListItem v) {
    setField(15, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasKolRoom() => $_has(14);
  @$pb.TagNumber(15)
  void clearKolRoom() => clearField(15);
  @$pb.TagNumber(15)
  $0.RoomListItem ensureKolRoom() => $_ensure(14);

  @$pb.TagNumber(16)
  JointSearchKolBannerItem get kolBanner => $_getN(15);
  @$pb.TagNumber(16)
  set kolBanner(JointSearchKolBannerItem v) {
    setField(16, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasKolBanner() => $_has(15);
  @$pb.TagNumber(16)
  void clearKolBanner() => clearField(16);
  @$pb.TagNumber(16)
  JointSearchKolBannerItem ensureKolBanner() => $_ensure(15);

  @$pb.TagNumber(17)
  JointSearchSingerClub get singer => $_getN(16);
  @$pb.TagNumber(17)
  set singer(JointSearchSingerClub v) {
    setField(17, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasSinger() => $_has(16);
  @$pb.TagNumber(17)
  void clearSinger() => clearField(17);
  @$pb.TagNumber(17)
  JointSearchSingerClub ensureSinger() => $_ensure(16);
}

class JointSearchUserItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JointSearchUserItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..e<JointSearchFollowType>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'follow',
        $pb.PbFieldType.OE,
        defaultOrMaker: JointSearchFollowType.FollowTypeNotFollow,
        valueOf: JointSearchFollowType.valueOf,
        enumValues: JointSearchFollowType.values)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isHot')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prettyId')
    ..hasRequiredFields = false;

  JointSearchUserItem._() : super();
  factory JointSearchUserItem({
    JointSearchFollowType? follow,
    $core.bool? isHot,
    $core.String? prettyId,
  }) {
    final _result = create();
    if (follow != null) {
      _result.follow = follow;
    }
    if (isHot != null) {
      _result.isHot = isHot;
    }
    if (prettyId != null) {
      _result.prettyId = prettyId;
    }
    return _result;
  }
  factory JointSearchUserItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JointSearchUserItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JointSearchUserItem clone() => JointSearchUserItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JointSearchUserItem copyWith(void Function(JointSearchUserItem) updates) =>
      super.copyWith((message) => updates(message as JointSearchUserItem))
          as JointSearchUserItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JointSearchUserItem create() => JointSearchUserItem._();
  JointSearchUserItem createEmptyInstance() => create();
  static $pb.PbList<JointSearchUserItem> createRepeated() =>
      $pb.PbList<JointSearchUserItem>();
  @$core.pragma('dart2js:noInline')
  static JointSearchUserItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JointSearchUserItem>(create);
  static JointSearchUserItem? _defaultInstance;

  @$pb.TagNumber(1)
  JointSearchFollowType get follow => $_getN(0);
  @$pb.TagNumber(1)
  set follow(JointSearchFollowType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFollow() => $_has(0);
  @$pb.TagNumber(1)
  void clearFollow() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isHot => $_getBF(1);
  @$pb.TagNumber(2)
  set isHot($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsHot() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsHot() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get prettyId => $_getSZ(2);
  @$pb.TagNumber(3)
  set prettyId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrettyId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrettyId() => clearField(3);
}

class JointSearchFleetItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JointSearchFleetItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prefix')
    ..hasRequiredFields = false;

  JointSearchFleetItem._() : super();
  factory JointSearchFleetItem({
    $core.String? state,
    $core.String? prefix,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (prefix != null) {
      _result.prefix = prefix;
    }
    return _result;
  }
  factory JointSearchFleetItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JointSearchFleetItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JointSearchFleetItem clone() =>
      JointSearchFleetItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JointSearchFleetItem copyWith(void Function(JointSearchFleetItem) updates) =>
      super.copyWith((message) => updates(message as JointSearchFleetItem))
          as JointSearchFleetItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JointSearchFleetItem create() => JointSearchFleetItem._();
  JointSearchFleetItem createEmptyInstance() => create();
  static $pb.PbList<JointSearchFleetItem> createRepeated() =>
      $pb.PbList<JointSearchFleetItem>();
  @$core.pragma('dart2js:noInline')
  static JointSearchFleetItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JointSearchFleetItem>(create);
  static JointSearchFleetItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get state => $_getSZ(0);
  @$pb.TagNumber(1)
  set state($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get prefix => $_getSZ(1);
  @$pb.TagNumber(2)
  set prefix($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrefix() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrefix() => clearField(2);
}

class JointSearchEggItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JointSearchEggItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourcePath')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourceText')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourceUserName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourceUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourceSex',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cardText')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cardButtonText')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'objectIcon')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'objectId',
        $pb.PbFieldType.OU3)
    ..e<JointSearchCardDisplayType>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cardDisplayType',
        $pb.PbFieldType.OE,
        defaultOrMaker: JointSearchCardDisplayType.CardDisPlayTypeContinue,
        valueOf: JointSearchCardDisplayType.valueOf,
        enumValues: JointSearchCardDisplayType.values)
    ..e<JointSearchRedirectType>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redirectType',
        $pb.PbFieldType.OE,
        defaultOrMaker: JointSearchRedirectType.RedirectTypePersonalPage,
        valueOf: JointSearchRedirectType.valueOf,
        enumValues: JointSearchRedirectType.values)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subType')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpUrl')
    ..hasRequiredFields = false;

  JointSearchEggItem._() : super();
  factory JointSearchEggItem({
    $core.String? sourcePath,
    $core.String? sourceText,
    $core.String? sourceUserName,
    $core.int? sourceUid,
    $core.int? sourceSex,
    $core.String? cardText,
    $core.String? cardButtonText,
    $core.String? objectIcon,
    $core.int? objectId,
    JointSearchCardDisplayType? cardDisplayType,
    JointSearchRedirectType? redirectType,
    $core.String? subType,
    $core.String? jumpUrl,
  }) {
    final _result = create();
    if (sourcePath != null) {
      _result.sourcePath = sourcePath;
    }
    if (sourceText != null) {
      _result.sourceText = sourceText;
    }
    if (sourceUserName != null) {
      _result.sourceUserName = sourceUserName;
    }
    if (sourceUid != null) {
      _result.sourceUid = sourceUid;
    }
    if (sourceSex != null) {
      _result.sourceSex = sourceSex;
    }
    if (cardText != null) {
      _result.cardText = cardText;
    }
    if (cardButtonText != null) {
      _result.cardButtonText = cardButtonText;
    }
    if (objectIcon != null) {
      _result.objectIcon = objectIcon;
    }
    if (objectId != null) {
      _result.objectId = objectId;
    }
    if (cardDisplayType != null) {
      _result.cardDisplayType = cardDisplayType;
    }
    if (redirectType != null) {
      _result.redirectType = redirectType;
    }
    if (subType != null) {
      _result.subType = subType;
    }
    if (jumpUrl != null) {
      _result.jumpUrl = jumpUrl;
    }
    return _result;
  }
  factory JointSearchEggItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JointSearchEggItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JointSearchEggItem clone() => JointSearchEggItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JointSearchEggItem copyWith(void Function(JointSearchEggItem) updates) =>
      super.copyWith((message) => updates(message as JointSearchEggItem))
          as JointSearchEggItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JointSearchEggItem create() => JointSearchEggItem._();
  JointSearchEggItem createEmptyInstance() => create();
  static $pb.PbList<JointSearchEggItem> createRepeated() =>
      $pb.PbList<JointSearchEggItem>();
  @$core.pragma('dart2js:noInline')
  static JointSearchEggItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JointSearchEggItem>(create);
  static JointSearchEggItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sourcePath => $_getSZ(0);
  @$pb.TagNumber(1)
  set sourcePath($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSourcePath() => $_has(0);
  @$pb.TagNumber(1)
  void clearSourcePath() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sourceText => $_getSZ(1);
  @$pb.TagNumber(2)
  set sourceText($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSourceText() => $_has(1);
  @$pb.TagNumber(2)
  void clearSourceText() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sourceUserName => $_getSZ(2);
  @$pb.TagNumber(3)
  set sourceUserName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSourceUserName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSourceUserName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get sourceUid => $_getIZ(3);
  @$pb.TagNumber(4)
  set sourceUid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSourceUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearSourceUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get sourceSex => $_getIZ(4);
  @$pb.TagNumber(5)
  set sourceSex($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSourceSex() => $_has(4);
  @$pb.TagNumber(5)
  void clearSourceSex() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get cardText => $_getSZ(5);
  @$pb.TagNumber(6)
  set cardText($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCardText() => $_has(5);
  @$pb.TagNumber(6)
  void clearCardText() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get cardButtonText => $_getSZ(6);
  @$pb.TagNumber(7)
  set cardButtonText($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCardButtonText() => $_has(6);
  @$pb.TagNumber(7)
  void clearCardButtonText() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get objectIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set objectIcon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasObjectIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearObjectIcon() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get objectId => $_getIZ(8);
  @$pb.TagNumber(9)
  set objectId($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasObjectId() => $_has(8);
  @$pb.TagNumber(9)
  void clearObjectId() => clearField(9);

  @$pb.TagNumber(10)
  JointSearchCardDisplayType get cardDisplayType => $_getN(9);
  @$pb.TagNumber(10)
  set cardDisplayType(JointSearchCardDisplayType v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCardDisplayType() => $_has(9);
  @$pb.TagNumber(10)
  void clearCardDisplayType() => clearField(10);

  @$pb.TagNumber(11)
  JointSearchRedirectType get redirectType => $_getN(10);
  @$pb.TagNumber(11)
  set redirectType(JointSearchRedirectType v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasRedirectType() => $_has(10);
  @$pb.TagNumber(11)
  void clearRedirectType() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get subType => $_getSZ(11);
  @$pb.TagNumber(12)
  set subType($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasSubType() => $_has(11);
  @$pb.TagNumber(12)
  void clearSubType() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get jumpUrl => $_getSZ(12);
  @$pb.TagNumber(13)
  set jumpUrl($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasJumpUrl() => $_has(12);
  @$pb.TagNumber(13)
  void clearJumpUrl() => clearField(13);
}

class JointSearchBagItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JointSearchBagItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bagPretty')
    ..hasRequiredFields = false;

  JointSearchBagItem._() : super();
  factory JointSearchBagItem({
    $core.String? bagPretty,
  }) {
    final _result = create();
    if (bagPretty != null) {
      _result.bagPretty = bagPretty;
    }
    return _result;
  }
  factory JointSearchBagItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JointSearchBagItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JointSearchBagItem clone() => JointSearchBagItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JointSearchBagItem copyWith(void Function(JointSearchBagItem) updates) =>
      super.copyWith((message) => updates(message as JointSearchBagItem))
          as JointSearchBagItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JointSearchBagItem create() => JointSearchBagItem._();
  JointSearchBagItem createEmptyInstance() => create();
  static $pb.PbList<JointSearchBagItem> createRepeated() =>
      $pb.PbList<JointSearchBagItem>();
  @$core.pragma('dart2js:noInline')
  static JointSearchBagItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JointSearchBagItem>(create);
  static JointSearchBagItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bagPretty => $_getSZ(0);
  @$pb.TagNumber(1)
  set bagPretty($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBagPretty() => $_has(0);
  @$pb.TagNumber(1)
  void clearBagPretty() => clearField(1);
}

class JointSearchGroupItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JointSearchGroupItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isInGroup')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isOfficial')
    ..hasRequiredFields = false;

  JointSearchGroupItem._() : super();
  factory JointSearchGroupItem({
    $core.bool? isInGroup,
    $core.bool? isOfficial,
  }) {
    final _result = create();
    if (isInGroup != null) {
      _result.isInGroup = isInGroup;
    }
    if (isOfficial != null) {
      _result.isOfficial = isOfficial;
    }
    return _result;
  }
  factory JointSearchGroupItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JointSearchGroupItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JointSearchGroupItem clone() =>
      JointSearchGroupItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JointSearchGroupItem copyWith(void Function(JointSearchGroupItem) updates) =>
      super.copyWith((message) => updates(message as JointSearchGroupItem))
          as JointSearchGroupItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JointSearchGroupItem create() => JointSearchGroupItem._();
  JointSearchGroupItem createEmptyInstance() => create();
  static $pb.PbList<JointSearchGroupItem> createRepeated() =>
      $pb.PbList<JointSearchGroupItem>();
  @$core.pragma('dart2js:noInline')
  static JointSearchGroupItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JointSearchGroupItem>(create);
  static JointSearchGroupItem? _defaultInstance;

  @$pb.TagNumber(2)
  $core.bool get isInGroup => $_getBF(0);
  @$pb.TagNumber(2)
  set isInGroup($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsInGroup() => $_has(0);
  @$pb.TagNumber(2)
  void clearIsInGroup() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isOfficial => $_getBF(1);
  @$pb.TagNumber(3)
  set isOfficial($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsOfficial() => $_has(1);
  @$pb.TagNumber(3)
  void clearIsOfficial() => clearField(3);
}

class JointSearchRoomItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JointSearchRoomItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prettyId')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receptionName')
    ..hasRequiredFields = false;

  JointSearchRoomItem._() : super();
  factory JointSearchRoomItem({
    $core.String? prettyId,
    $core.String? receptionName,
  }) {
    final _result = create();
    if (prettyId != null) {
      _result.prettyId = prettyId;
    }
    if (receptionName != null) {
      _result.receptionName = receptionName;
    }
    return _result;
  }
  factory JointSearchRoomItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JointSearchRoomItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JointSearchRoomItem clone() => JointSearchRoomItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JointSearchRoomItem copyWith(void Function(JointSearchRoomItem) updates) =>
      super.copyWith((message) => updates(message as JointSearchRoomItem))
          as JointSearchRoomItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JointSearchRoomItem create() => JointSearchRoomItem._();
  JointSearchRoomItem createEmptyInstance() => create();
  static $pb.PbList<JointSearchRoomItem> createRepeated() =>
      $pb.PbList<JointSearchRoomItem>();
  @$core.pragma('dart2js:noInline')
  static JointSearchRoomItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JointSearchRoomItem>(create);
  static JointSearchRoomItem? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get prettyId => $_getSZ(0);
  @$pb.TagNumber(2)
  set prettyId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrettyId() => $_has(0);
  @$pb.TagNumber(2)
  void clearPrettyId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get receptionName => $_getSZ(1);
  @$pb.TagNumber(3)
  set receptionName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasReceptionName() => $_has(1);
  @$pb.TagNumber(3)
  void clearReceptionName() => clearField(3);
}

class JointSearchUnionItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JointSearchUnionItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'shortName')
    ..hasRequiredFields = false;

  JointSearchUnionItem._() : super();
  factory JointSearchUnionItem({
    $core.String? shortName,
  }) {
    final _result = create();
    if (shortName != null) {
      _result.shortName = shortName;
    }
    return _result;
  }
  factory JointSearchUnionItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JointSearchUnionItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JointSearchUnionItem clone() =>
      JointSearchUnionItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JointSearchUnionItem copyWith(void Function(JointSearchUnionItem) updates) =>
      super.copyWith((message) => updates(message as JointSearchUnionItem))
          as JointSearchUnionItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JointSearchUnionItem create() => JointSearchUnionItem._();
  JointSearchUnionItem createEmptyInstance() => create();
  static $pb.PbList<JointSearchUnionItem> createRepeated() =>
      $pb.PbList<JointSearchUnionItem>();
  @$core.pragma('dart2js:noInline')
  static JointSearchUnionItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JointSearchUnionItem>(create);
  static JointSearchUnionItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get shortName => $_getSZ(0);
  @$pb.TagNumber(1)
  set shortName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShortName() => $_has(0);
  @$pb.TagNumber(1)
  void clearShortName() => clearField(1);
}

class JointSearchTourItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JointSearchTourItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  JointSearchTourItem._() : super();
  factory JointSearchTourItem({
    $core.int? roomId,
    $core.int? groupId,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    return _result;
  }
  factory JointSearchTourItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JointSearchTourItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JointSearchTourItem clone() => JointSearchTourItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JointSearchTourItem copyWith(void Function(JointSearchTourItem) updates) =>
      super.copyWith((message) => updates(message as JointSearchTourItem))
          as JointSearchTourItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JointSearchTourItem create() => JointSearchTourItem._();
  JointSearchTourItem createEmptyInstance() => create();
  static $pb.PbList<JointSearchTourItem> createRepeated() =>
      $pb.PbList<JointSearchTourItem>();
  @$core.pragma('dart2js:noInline')
  static JointSearchTourItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JointSearchTourItem>(create);
  static JointSearchTourItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get roomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set roomId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get groupId => $_getIZ(1);
  @$pb.TagNumber(2)
  set groupId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupId() => clearField(2);
}

class JointSearchMusicItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JointSearchMusicItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songImg')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'artistNames')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  JointSearchMusicItem._() : super();
  factory JointSearchMusicItem({
    $core.int? songId,
    $core.String? songName,
    $core.String? songImg,
    $core.String? artistNames,
    $core.int? duration,
  }) {
    final _result = create();
    if (songId != null) {
      _result.songId = songId;
    }
    if (songName != null) {
      _result.songName = songName;
    }
    if (songImg != null) {
      _result.songImg = songImg;
    }
    if (artistNames != null) {
      _result.artistNames = artistNames;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    return _result;
  }
  factory JointSearchMusicItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JointSearchMusicItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JointSearchMusicItem clone() =>
      JointSearchMusicItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JointSearchMusicItem copyWith(void Function(JointSearchMusicItem) updates) =>
      super.copyWith((message) => updates(message as JointSearchMusicItem))
          as JointSearchMusicItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JointSearchMusicItem create() => JointSearchMusicItem._();
  JointSearchMusicItem createEmptyInstance() => create();
  static $pb.PbList<JointSearchMusicItem> createRepeated() =>
      $pb.PbList<JointSearchMusicItem>();
  @$core.pragma('dart2js:noInline')
  static JointSearchMusicItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JointSearchMusicItem>(create);
  static JointSearchMusicItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get songId => $_getIZ(0);
  @$pb.TagNumber(1)
  set songId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSongId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get songName => $_getSZ(1);
  @$pb.TagNumber(2)
  set songName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSongName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSongName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get songImg => $_getSZ(2);
  @$pb.TagNumber(3)
  set songImg($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSongImg() => $_has(2);
  @$pb.TagNumber(3)
  void clearSongImg() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get artistNames => $_getSZ(3);
  @$pb.TagNumber(4)
  set artistNames($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasArtistNames() => $_has(3);
  @$pb.TagNumber(4)
  void clearArtistNames() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get duration => $_getIZ(4);
  @$pb.TagNumber(5)
  set duration($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuration() => clearField(5);
}

class JointSearchWorkItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JointSearchWorkItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'workId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'workTitle')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userName')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'videoCover')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'likeNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'videoUrl')
    ..a<$fixnum.Int64>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topicId',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  JointSearchWorkItem._() : super();
  factory JointSearchWorkItem({
    $core.int? workId,
    $core.String? workTitle,
    $core.int? uid,
    $core.String? userName,
    $core.String? userIcon,
    $core.String? videoCover,
    $core.int? likeNum,
    $core.String? videoUrl,
    $fixnum.Int64? topicId,
  }) {
    final _result = create();
    if (workId != null) {
      _result.workId = workId;
    }
    if (workTitle != null) {
      _result.workTitle = workTitle;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    if (videoCover != null) {
      _result.videoCover = videoCover;
    }
    if (likeNum != null) {
      _result.likeNum = likeNum;
    }
    if (videoUrl != null) {
      _result.videoUrl = videoUrl;
    }
    if (topicId != null) {
      _result.topicId = topicId;
    }
    return _result;
  }
  factory JointSearchWorkItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JointSearchWorkItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JointSearchWorkItem clone() => JointSearchWorkItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JointSearchWorkItem copyWith(void Function(JointSearchWorkItem) updates) =>
      super.copyWith((message) => updates(message as JointSearchWorkItem))
          as JointSearchWorkItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JointSearchWorkItem create() => JointSearchWorkItem._();
  JointSearchWorkItem createEmptyInstance() => create();
  static $pb.PbList<JointSearchWorkItem> createRepeated() =>
      $pb.PbList<JointSearchWorkItem>();
  @$core.pragma('dart2js:noInline')
  static JointSearchWorkItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JointSearchWorkItem>(create);
  static JointSearchWorkItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get workId => $_getIZ(0);
  @$pb.TagNumber(1)
  set workId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasWorkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get workTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set workTitle($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWorkTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearWorkTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get uid => $_getIZ(2);
  @$pb.TagNumber(3)
  set uid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userName => $_getSZ(3);
  @$pb.TagNumber(4)
  set userName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUserName() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set userIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUserIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserIcon() => clearField(5);

  @$pb.TagNumber(8)
  $core.String get videoCover => $_getSZ(5);
  @$pb.TagNumber(8)
  set videoCover($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasVideoCover() => $_has(5);
  @$pb.TagNumber(8)
  void clearVideoCover() => clearField(8);

  @$pb.TagNumber(12)
  $core.int get likeNum => $_getIZ(6);
  @$pb.TagNumber(12)
  set likeNum($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasLikeNum() => $_has(6);
  @$pb.TagNumber(12)
  void clearLikeNum() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get videoUrl => $_getSZ(7);
  @$pb.TagNumber(13)
  set videoUrl($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasVideoUrl() => $_has(7);
  @$pb.TagNumber(13)
  void clearVideoUrl() => clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get topicId => $_getI64(8);
  @$pb.TagNumber(14)
  set topicId($fixnum.Int64 v) {
    $_setInt64(8, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasTopicId() => $_has(8);
  @$pb.TagNumber(14)
  void clearTopicId() => clearField(14);
}

class JointSearchKolBannerItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JointSearchKolBannerItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'kolBannerUrl')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'second',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpTips')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'keyword')
    ..hasRequiredFields = false;

  JointSearchKolBannerItem._() : super();
  factory JointSearchKolBannerItem({
    $core.String? kolBannerUrl,
    $core.int? rid,
    $core.int? second,
    $core.String? jumpTips,
    $core.String? keyword,
  }) {
    final _result = create();
    if (kolBannerUrl != null) {
      _result.kolBannerUrl = kolBannerUrl;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (second != null) {
      _result.second = second;
    }
    if (jumpTips != null) {
      _result.jumpTips = jumpTips;
    }
    if (keyword != null) {
      _result.keyword = keyword;
    }
    return _result;
  }
  factory JointSearchKolBannerItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JointSearchKolBannerItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JointSearchKolBannerItem clone() =>
      JointSearchKolBannerItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JointSearchKolBannerItem copyWith(
          void Function(JointSearchKolBannerItem) updates) =>
      super.copyWith((message) => updates(message as JointSearchKolBannerItem))
          as JointSearchKolBannerItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JointSearchKolBannerItem create() => JointSearchKolBannerItem._();
  JointSearchKolBannerItem createEmptyInstance() => create();
  static $pb.PbList<JointSearchKolBannerItem> createRepeated() =>
      $pb.PbList<JointSearchKolBannerItem>();
  @$core.pragma('dart2js:noInline')
  static JointSearchKolBannerItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JointSearchKolBannerItem>(create);
  static JointSearchKolBannerItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get kolBannerUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set kolBannerUrl($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKolBannerUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearKolBannerUrl() => clearField(1);

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

  @$pb.TagNumber(3)
  $core.int get second => $_getIZ(2);
  @$pb.TagNumber(3)
  set second($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSecond() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecond() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get jumpTips => $_getSZ(3);
  @$pb.TagNumber(4)
  set jumpTips($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasJumpTips() => $_has(3);
  @$pb.TagNumber(4)
  void clearJumpTips() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get keyword => $_getSZ(4);
  @$pb.TagNumber(5)
  set keyword($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasKeyword() => $_has(4);
  @$pb.TagNumber(5)
  void clearKeyword() => clearField(5);
}

class JointSearchSingerClub extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JointSearchSingerClub',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'clubId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logo')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activeNum',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inClub',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'signNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'positionName')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starTag',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  JointSearchSingerClub._() : super();
  factory JointSearchSingerClub({
    $core.int? clubId,
    $core.int? rankNum,
    $core.String? logo,
    $core.String? name,
    $core.int? level,
    $fixnum.Int64? activeNum,
    $core.int? userNum,
    $core.int? inClub,
    $core.int? signNum,
    $core.int? createUid,
    $core.String? positionName,
    $core.int? starTag,
  }) {
    final _result = create();
    if (clubId != null) {
      _result.clubId = clubId;
    }
    if (rankNum != null) {
      _result.rankNum = rankNum;
    }
    if (logo != null) {
      _result.logo = logo;
    }
    if (name != null) {
      _result.name = name;
    }
    if (level != null) {
      _result.level = level;
    }
    if (activeNum != null) {
      _result.activeNum = activeNum;
    }
    if (userNum != null) {
      _result.userNum = userNum;
    }
    if (inClub != null) {
      _result.inClub = inClub;
    }
    if (signNum != null) {
      _result.signNum = signNum;
    }
    if (createUid != null) {
      _result.createUid = createUid;
    }
    if (positionName != null) {
      _result.positionName = positionName;
    }
    if (starTag != null) {
      _result.starTag = starTag;
    }
    return _result;
  }
  factory JointSearchSingerClub.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JointSearchSingerClub.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JointSearchSingerClub clone() =>
      JointSearchSingerClub()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JointSearchSingerClub copyWith(
          void Function(JointSearchSingerClub) updates) =>
      super.copyWith((message) => updates(message as JointSearchSingerClub))
          as JointSearchSingerClub; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JointSearchSingerClub create() => JointSearchSingerClub._();
  JointSearchSingerClub createEmptyInstance() => create();
  static $pb.PbList<JointSearchSingerClub> createRepeated() =>
      $pb.PbList<JointSearchSingerClub>();
  @$core.pragma('dart2js:noInline')
  static JointSearchSingerClub getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JointSearchSingerClub>(create);
  static JointSearchSingerClub? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get clubId => $_getIZ(0);
  @$pb.TagNumber(1)
  set clubId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasClubId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClubId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rankNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set rankNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRankNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearRankNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get logo => $_getSZ(2);
  @$pb.TagNumber(3)
  set logo($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLogo() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogo() => clearField(3);

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
  $core.int get level => $_getIZ(4);
  @$pb.TagNumber(5)
  set level($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLevel() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get activeNum => $_getI64(5);
  @$pb.TagNumber(6)
  set activeNum($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasActiveNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearActiveNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get userNum => $_getIZ(6);
  @$pb.TagNumber(7)
  set userNum($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUserNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserNum() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get inClub => $_getIZ(7);
  @$pb.TagNumber(8)
  set inClub($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasInClub() => $_has(7);
  @$pb.TagNumber(8)
  void clearInClub() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get signNum => $_getIZ(8);
  @$pb.TagNumber(9)
  set signNum($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSignNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearSignNum() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get createUid => $_getIZ(9);
  @$pb.TagNumber(10)
  set createUid($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCreateUid() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreateUid() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get positionName => $_getSZ(10);
  @$pb.TagNumber(11)
  set positionName($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPositionName() => $_has(10);
  @$pb.TagNumber(11)
  void clearPositionName() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get starTag => $_getIZ(11);
  @$pb.TagNumber(12)
  set starTag($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasStarTag() => $_has(11);
  @$pb.TagNumber(12)
  void clearStarTag() => clearField(12);
}
