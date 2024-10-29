///
//  Generated code. Do not modify.
//  source: room_vip.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetRoomVipRankReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetRoomVipRankReq',
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

  GetRoomVipRankReq._() : super();
  factory GetRoomVipRankReq({
    $core.int? rid,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    return _result;
  }
  factory GetRoomVipRankReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetRoomVipRankReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetRoomVipRankReq clone() => GetRoomVipRankReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetRoomVipRankReq copyWith(void Function(GetRoomVipRankReq) updates) =>
      super.copyWith((message) => updates(message as GetRoomVipRankReq))
          as GetRoomVipRankReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRoomVipRankReq create() => GetRoomVipRankReq._();
  GetRoomVipRankReq createEmptyInstance() => create();
  static $pb.PbList<GetRoomVipRankReq> createRepeated() =>
      $pb.PbList<GetRoomVipRankReq>();
  @$core.pragma('dart2js:noInline')
  static GetRoomVipRankReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRoomVipRankReq>(create);
  static GetRoomVipRankReq? _defaultInstance;

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

class GetRoomVipRankResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetRoomVipRankResp',
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
    ..aOM<RoomVipRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomVipRankData.create)
    ..hasRequiredFields = false;

  GetRoomVipRankResp._() : super();
  factory GetRoomVipRankResp({
    $core.bool? success,
    $core.String? msg,
    RoomVipRankData? data,
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
  factory GetRoomVipRankResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetRoomVipRankResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetRoomVipRankResp clone() => GetRoomVipRankResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetRoomVipRankResp copyWith(void Function(GetRoomVipRankResp) updates) =>
      super.copyWith((message) => updates(message as GetRoomVipRankResp))
          as GetRoomVipRankResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRoomVipRankResp create() => GetRoomVipRankResp._();
  GetRoomVipRankResp createEmptyInstance() => create();
  static $pb.PbList<GetRoomVipRankResp> createRepeated() =>
      $pb.PbList<GetRoomVipRankResp>();
  @$core.pragma('dart2js:noInline')
  static GetRoomVipRankResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRoomVipRankResp>(create);
  static GetRoomVipRankResp? _defaultInstance;

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
  RoomVipRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomVipRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomVipRankData ensureData() => $_ensure(2);
}

class RoomVipRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomVipRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<RoomVipRankItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankList',
        $pb.PbFieldType.PM,
        subBuilder: RoomVipRankItem.create)
    ..aOM<RoomVipRankItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'myCard',
        subBuilder: RoomVipRankItem.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'openCardGiftId',
        $pb.PbFieldType.OU3)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isReachCardsLimit')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'achieveTips')
    ..hasRequiredFields = false;

  RoomVipRankData._() : super();
  factory RoomVipRankData({
    $core.Iterable<RoomVipRankItem>? rankList,
    RoomVipRankItem? myCard,
    $core.int? openCardGiftId,
    $core.bool? isReachCardsLimit,
    $core.String? achieveTips,
  }) {
    final _result = create();
    if (rankList != null) {
      _result.rankList.addAll(rankList);
    }
    if (myCard != null) {
      _result.myCard = myCard;
    }
    if (openCardGiftId != null) {
      _result.openCardGiftId = openCardGiftId;
    }
    if (isReachCardsLimit != null) {
      _result.isReachCardsLimit = isReachCardsLimit;
    }
    if (achieveTips != null) {
      _result.achieveTips = achieveTips;
    }
    return _result;
  }
  factory RoomVipRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomVipRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomVipRankData clone() => RoomVipRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomVipRankData copyWith(void Function(RoomVipRankData) updates) =>
      super.copyWith((message) => updates(message as RoomVipRankData))
          as RoomVipRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomVipRankData create() => RoomVipRankData._();
  RoomVipRankData createEmptyInstance() => create();
  static $pb.PbList<RoomVipRankData> createRepeated() =>
      $pb.PbList<RoomVipRankData>();
  @$core.pragma('dart2js:noInline')
  static RoomVipRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomVipRankData>(create);
  static RoomVipRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomVipRankItem> get rankList => $_getList(0);

  @$pb.TagNumber(2)
  RoomVipRankItem get myCard => $_getN(1);
  @$pb.TagNumber(2)
  set myCard(RoomVipRankItem v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMyCard() => $_has(1);
  @$pb.TagNumber(2)
  void clearMyCard() => clearField(2);
  @$pb.TagNumber(2)
  RoomVipRankItem ensureMyCard() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get openCardGiftId => $_getIZ(2);
  @$pb.TagNumber(3)
  set openCardGiftId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOpenCardGiftId() => $_has(2);
  @$pb.TagNumber(3)
  void clearOpenCardGiftId() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isReachCardsLimit => $_getBF(3);
  @$pb.TagNumber(4)
  set isReachCardsLimit($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsReachCardsLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsReachCardsLimit() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get achieveTips => $_getSZ(4);
  @$pb.TagNumber(5)
  set achieveTips($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAchieveTips() => $_has(4);
  @$pb.TagNumber(5)
  void clearAchieveTips() => clearField(5);
}

class RoomVipRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomVipRankItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOM<RoomVipRankUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: RoomVipRankUser.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'points',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gap',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank')
    ..hasRequiredFields = false;

  RoomVipRankItem._() : super();
  factory RoomVipRankItem({
    $core.int? level,
    RoomVipRankUser? user,
    $core.int? points,
    $core.int? gap,
    $core.String? rank,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (user != null) {
      _result.user = user;
    }
    if (points != null) {
      _result.points = points;
    }
    if (gap != null) {
      _result.gap = gap;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    return _result;
  }
  factory RoomVipRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomVipRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomVipRankItem clone() => RoomVipRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomVipRankItem copyWith(void Function(RoomVipRankItem) updates) =>
      super.copyWith((message) => updates(message as RoomVipRankItem))
          as RoomVipRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomVipRankItem create() => RoomVipRankItem._();
  RoomVipRankItem createEmptyInstance() => create();
  static $pb.PbList<RoomVipRankItem> createRepeated() =>
      $pb.PbList<RoomVipRankItem>();
  @$core.pragma('dart2js:noInline')
  static RoomVipRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomVipRankItem>(create);
  static RoomVipRankItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

  @$pb.TagNumber(2)
  RoomVipRankUser get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(RoomVipRankUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  RoomVipRankUser ensureUser() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get points => $_getIZ(2);
  @$pb.TagNumber(3)
  set points($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPoints() => $_has(2);
  @$pb.TagNumber(3)
  void clearPoints() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get gap => $_getIZ(3);
  @$pb.TagNumber(4)
  set gap($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGap() => $_has(3);
  @$pb.TagNumber(4)
  void clearGap() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get rank => $_getSZ(4);
  @$pb.TagNumber(5)
  set rank($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRank() => $_has(4);
  @$pb.TagNumber(5)
  void clearRank() => clearField(5);
}

class RoomVipRankUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomVipRankUser',
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
            : 'icon')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleNew',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vipLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularityLevel',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomVipRankUser._() : super();
  factory RoomVipRankUser({
    $core.int? uid,
    $core.String? icon,
    $core.int? sex,
    $core.int? title,
    $core.int? titleNew,
    $core.String? name,
    $core.int? vipLevel,
    $core.int? popularityLevel,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (title != null) {
      _result.title = title;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    if (name != null) {
      _result.name = name;
    }
    if (vipLevel != null) {
      _result.vipLevel = vipLevel;
    }
    if (popularityLevel != null) {
      _result.popularityLevel = popularityLevel;
    }
    return _result;
  }
  factory RoomVipRankUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomVipRankUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomVipRankUser clone() => RoomVipRankUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomVipRankUser copyWith(void Function(RoomVipRankUser) updates) =>
      super.copyWith((message) => updates(message as RoomVipRankUser))
          as RoomVipRankUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomVipRankUser create() => RoomVipRankUser._();
  RoomVipRankUser createEmptyInstance() => create();
  static $pb.PbList<RoomVipRankUser> createRepeated() =>
      $pb.PbList<RoomVipRankUser>();
  @$core.pragma('dart2js:noInline')
  static RoomVipRankUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomVipRankUser>(create);
  static RoomVipRankUser? _defaultInstance;

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
  $core.int get sex => $_getIZ(2);
  @$pb.TagNumber(3)
  set sex($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSex() => $_has(2);
  @$pb.TagNumber(3)
  void clearSex() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get title => $_getIZ(3);
  @$pb.TagNumber(4)
  set title($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get titleNew => $_getIZ(4);
  @$pb.TagNumber(5)
  set titleNew($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTitleNew() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitleNew() => clearField(5);

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

  @$pb.TagNumber(7)
  $core.int get vipLevel => $_getIZ(6);
  @$pb.TagNumber(7)
  set vipLevel($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasVipLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearVipLevel() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get popularityLevel => $_getIZ(7);
  @$pb.TagNumber(8)
  set popularityLevel($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPopularityLevel() => $_has(7);
  @$pb.TagNumber(8)
  void clearPopularityLevel() => clearField(8);
}

class RoomVipRankDescResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomVipRankDescResp',
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
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data')
    ..hasRequiredFields = false;

  RoomVipRankDescResp._() : super();
  factory RoomVipRankDescResp({
    $core.bool? success,
    $core.String? msg,
    $core.String? data,
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
  factory RoomVipRankDescResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomVipRankDescResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomVipRankDescResp clone() => RoomVipRankDescResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomVipRankDescResp copyWith(void Function(RoomVipRankDescResp) updates) =>
      super.copyWith((message) => updates(message as RoomVipRankDescResp))
          as RoomVipRankDescResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomVipRankDescResp create() => RoomVipRankDescResp._();
  RoomVipRankDescResp createEmptyInstance() => create();
  static $pb.PbList<RoomVipRankDescResp> createRepeated() =>
      $pb.PbList<RoomVipRankDescResp>();
  @$core.pragma('dart2js:noInline')
  static RoomVipRankDescResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomVipRankDescResp>(create);
  static RoomVipRankDescResp? _defaultInstance;

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
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(3)
  set data($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}

class RoomVipRankDescSetResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomVipRankDescSetResp',
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
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data')
    ..hasRequiredFields = false;

  RoomVipRankDescSetResp._() : super();
  factory RoomVipRankDescSetResp({
    $core.bool? success,
    $core.String? msg,
    $core.String? data,
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
  factory RoomVipRankDescSetResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomVipRankDescSetResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomVipRankDescSetResp clone() =>
      RoomVipRankDescSetResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomVipRankDescSetResp copyWith(
          void Function(RoomVipRankDescSetResp) updates) =>
      super.copyWith((message) => updates(message as RoomVipRankDescSetResp))
          as RoomVipRankDescSetResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomVipRankDescSetResp create() => RoomVipRankDescSetResp._();
  RoomVipRankDescSetResp createEmptyInstance() => create();
  static $pb.PbList<RoomVipRankDescSetResp> createRepeated() =>
      $pb.PbList<RoomVipRankDescSetResp>();
  @$core.pragma('dart2js:noInline')
  static RoomVipRankDescSetResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomVipRankDescSetResp>(create);
  static RoomVipRankDescSetResp? _defaultInstance;

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
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(3)
  set data($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}
