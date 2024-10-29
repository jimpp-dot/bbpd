///
//  Generated code. Do not modify.
//  source: awake_rank.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AwakenHandbookReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwakenHandbookReq',
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
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AwakenHandbookReq._() : super();
  factory AwakenHandbookReq({
    $core.int? type,
    $core.int? lastId,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (lastId != null) {
      _result.lastId = lastId;
    }
    return _result;
  }
  factory AwakenHandbookReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwakenHandbookReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwakenHandbookReq clone() => AwakenHandbookReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwakenHandbookReq copyWith(void Function(AwakenHandbookReq) updates) =>
      super.copyWith((message) => updates(message as AwakenHandbookReq))
          as AwakenHandbookReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwakenHandbookReq create() => AwakenHandbookReq._();
  AwakenHandbookReq createEmptyInstance() => create();
  static $pb.PbList<AwakenHandbookReq> createRepeated() =>
      $pb.PbList<AwakenHandbookReq>();
  @$core.pragma('dart2js:noInline')
  static AwakenHandbookReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwakenHandbookReq>(create);
  static AwakenHandbookReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get lastId => $_getIZ(1);
  @$pb.TagNumber(2)
  set lastId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLastId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastId() => clearField(2);
}

class AwakenHandbookRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwakenHandbookRes',
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
            : 'hasMore')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastId',
        $pb.PbFieldType.OU3)
    ..aOM<AwakenHandbookData>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AwakenHandbookData.create)
    ..hasRequiredFields = false;

  AwakenHandbookRes._() : super();
  factory AwakenHandbookRes({
    $core.bool? success,
    $core.String? msg,
    $core.bool? hasMore,
    $core.int? lastId,
    AwakenHandbookData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    if (lastId != null) {
      _result.lastId = lastId;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory AwakenHandbookRes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwakenHandbookRes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwakenHandbookRes clone() => AwakenHandbookRes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwakenHandbookRes copyWith(void Function(AwakenHandbookRes) updates) =>
      super.copyWith((message) => updates(message as AwakenHandbookRes))
          as AwakenHandbookRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwakenHandbookRes create() => AwakenHandbookRes._();
  AwakenHandbookRes createEmptyInstance() => create();
  static $pb.PbList<AwakenHandbookRes> createRepeated() =>
      $pb.PbList<AwakenHandbookRes>();
  @$core.pragma('dart2js:noInline')
  static AwakenHandbookRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwakenHandbookRes>(create);
  static AwakenHandbookRes? _defaultInstance;

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
  $core.bool get hasMore => $_getBF(2);
  @$pb.TagNumber(3)
  set hasMore($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHasMore() => $_has(2);
  @$pb.TagNumber(3)
  void clearHasMore() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get lastId => $_getIZ(3);
  @$pb.TagNumber(4)
  set lastId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLastId() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastId() => clearField(4);

  @$pb.TagNumber(5)
  AwakenHandbookData get data => $_getN(4);
  @$pb.TagNumber(5)
  set data(AwakenHandbookData v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasData() => $_has(4);
  @$pb.TagNumber(5)
  void clearData() => clearField(5);
  @$pb.TagNumber(5)
  AwakenHandbookData ensureData() => $_ensure(4);
}

class AwakenHandbookData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwakenHandbookData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<RankDatas>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RankDatas.create)
    ..pc<AwardsData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awards',
        $pb.PbFieldType.PM,
        subBuilder: AwardsData.create)
    ..aOM<RankDatas>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'my',
        subBuilder: RankDatas.create)
    ..hasRequiredFields = false;

  AwakenHandbookData._() : super();
  factory AwakenHandbookData({
    $core.Iterable<RankDatas>? list,
    $core.Iterable<AwardsData>? awards,
    RankDatas? my,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (awards != null) {
      _result.awards.addAll(awards);
    }
    if (my != null) {
      _result.my = my;
    }
    return _result;
  }
  factory AwakenHandbookData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwakenHandbookData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwakenHandbookData clone() => AwakenHandbookData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwakenHandbookData copyWith(void Function(AwakenHandbookData) updates) =>
      super.copyWith((message) => updates(message as AwakenHandbookData))
          as AwakenHandbookData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwakenHandbookData create() => AwakenHandbookData._();
  AwakenHandbookData createEmptyInstance() => create();
  static $pb.PbList<AwakenHandbookData> createRepeated() =>
      $pb.PbList<AwakenHandbookData>();
  @$core.pragma('dart2js:noInline')
  static AwakenHandbookData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwakenHandbookData>(create);
  static AwakenHandbookData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RankDatas> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<AwardsData> get awards => $_getList(1);

  @$pb.TagNumber(3)
  RankDatas get my => $_getN(2);
  @$pb.TagNumber(3)
  set my(RankDatas v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMy() => $_has(2);
  @$pb.TagNumber(3)
  void clearMy() => clearField(3);
  @$pb.TagNumber(3)
  RankDatas ensureMy() => $_ensure(2);
}

class RankDatas extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RankDatas',
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
            : 'nickname')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'xp',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftLevel')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftLevelIcon')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vipLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularityLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleNew',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RankDatas._() : super();
  factory RankDatas({
    $core.int? uid,
    $core.String? nickname,
    $core.String? icon,
    $core.int? xp,
    $core.String? giftLevel,
    $core.String? giftLevelIcon,
    $core.int? title,
    $core.int? vipLevel,
    $core.int? popularityLevel,
    $core.int? rank,
    $core.int? titleNew,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (nickname != null) {
      _result.nickname = nickname;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (xp != null) {
      _result.xp = xp;
    }
    if (giftLevel != null) {
      _result.giftLevel = giftLevel;
    }
    if (giftLevelIcon != null) {
      _result.giftLevelIcon = giftLevelIcon;
    }
    if (title != null) {
      _result.title = title;
    }
    if (vipLevel != null) {
      _result.vipLevel = vipLevel;
    }
    if (popularityLevel != null) {
      _result.popularityLevel = popularityLevel;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    return _result;
  }
  factory RankDatas.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RankDatas.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RankDatas clone() => RankDatas()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RankDatas copyWith(void Function(RankDatas) updates) =>
      super.copyWith((message) => updates(message as RankDatas))
          as RankDatas; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RankDatas create() => RankDatas._();
  RankDatas createEmptyInstance() => create();
  static $pb.PbList<RankDatas> createRepeated() => $pb.PbList<RankDatas>();
  @$core.pragma('dart2js:noInline')
  static RankDatas getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RankDatas>(create);
  static RankDatas? _defaultInstance;

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
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => clearField(2);

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
  $core.int get xp => $_getIZ(3);
  @$pb.TagNumber(4)
  set xp($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasXp() => $_has(3);
  @$pb.TagNumber(4)
  void clearXp() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get giftLevel => $_getSZ(4);
  @$pb.TagNumber(5)
  set giftLevel($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftLevel() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get giftLevelIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set giftLevelIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGiftLevelIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftLevelIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get title => $_getIZ(6);
  @$pb.TagNumber(7)
  set title($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTitle() => $_has(6);
  @$pb.TagNumber(7)
  void clearTitle() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get vipLevel => $_getIZ(7);
  @$pb.TagNumber(8)
  set vipLevel($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasVipLevel() => $_has(7);
  @$pb.TagNumber(8)
  void clearVipLevel() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get popularityLevel => $_getIZ(8);
  @$pb.TagNumber(9)
  set popularityLevel($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPopularityLevel() => $_has(8);
  @$pb.TagNumber(9)
  void clearPopularityLevel() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get rank => $_getIZ(9);
  @$pb.TagNumber(10)
  set rank($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRank() => $_has(9);
  @$pb.TagNumber(10)
  void clearRank() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get titleNew => $_getIZ(10);
  @$pb.TagNumber(11)
  set titleNew($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTitleNew() => $_has(10);
  @$pb.TagNumber(11)
  void clearTitleNew() => clearField(11);
}

class AwardsData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwardsData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
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
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageBg')
    ..hasRequiredFields = false;

  AwardsData._() : super();
  factory AwardsData({
    $core.String? type,
    $core.int? cid,
    $core.int? num,
    $core.String? name,
    $core.String? desc,
    $core.String? image,
    $core.String? imageBg,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (num != null) {
      _result.num = num;
    }
    if (name != null) {
      _result.name = name;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (image != null) {
      _result.image = image;
    }
    if (imageBg != null) {
      _result.imageBg = imageBg;
    }
    return _result;
  }
  factory AwardsData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwardsData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwardsData clone() => AwardsData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwardsData copyWith(void Function(AwardsData) updates) =>
      super.copyWith((message) => updates(message as AwardsData))
          as AwardsData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwardsData create() => AwardsData._();
  AwardsData createEmptyInstance() => create();
  static $pb.PbList<AwardsData> createRepeated() => $pb.PbList<AwardsData>();
  @$core.pragma('dart2js:noInline')
  static AwardsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwardsData>(create);
  static AwardsData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get cid => $_getIZ(1);
  @$pb.TagNumber(2)
  set cid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => clearField(3);

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

  @$pb.TagNumber(7)
  $core.String get image => $_getSZ(5);
  @$pb.TagNumber(7)
  set image($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasImage() => $_has(5);
  @$pb.TagNumber(7)
  void clearImage() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get imageBg => $_getSZ(6);
  @$pb.TagNumber(8)
  set imageBg($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasImageBg() => $_has(6);
  @$pb.TagNumber(8)
  void clearImageBg() => clearField(8);
}

class AwakeTimeRankRsp_Data_Item extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwakeTimeRankRsp.Data.Item',
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
            : 'gid',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background')
    ..hasRequiredFields = false;

  AwakeTimeRankRsp_Data_Item._() : super();
  factory AwakeTimeRankRsp_Data_Item({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? gid,
    $core.String? giftName,
    $core.String? background,
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
    if (gid != null) {
      _result.gid = gid;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (background != null) {
      _result.background = background;
    }
    return _result;
  }
  factory AwakeTimeRankRsp_Data_Item.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwakeTimeRankRsp_Data_Item.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwakeTimeRankRsp_Data_Item clone() =>
      AwakeTimeRankRsp_Data_Item()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwakeTimeRankRsp_Data_Item copyWith(
          void Function(AwakeTimeRankRsp_Data_Item) updates) =>
      super.copyWith(
              (message) => updates(message as AwakeTimeRankRsp_Data_Item))
          as AwakeTimeRankRsp_Data_Item; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwakeTimeRankRsp_Data_Item create() => AwakeTimeRankRsp_Data_Item._();
  AwakeTimeRankRsp_Data_Item createEmptyInstance() => create();
  static $pb.PbList<AwakeTimeRankRsp_Data_Item> createRepeated() =>
      $pb.PbList<AwakeTimeRankRsp_Data_Item>();
  @$core.pragma('dart2js:noInline')
  static AwakeTimeRankRsp_Data_Item getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwakeTimeRankRsp_Data_Item>(create);
  static AwakeTimeRankRsp_Data_Item? _defaultInstance;

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
  $core.int get gid => $_getIZ(3);
  @$pb.TagNumber(4)
  set gid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGid() => $_has(3);
  @$pb.TagNumber(4)
  void clearGid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get giftName => $_getSZ(4);
  @$pb.TagNumber(5)
  set giftName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftName() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get background => $_getSZ(5);
  @$pb.TagNumber(6)
  set background($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasBackground() => $_has(5);
  @$pb.TagNumber(6)
  void clearBackground() => clearField(6);
}

class AwakeTimeRankRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwakeTimeRankRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<AwakeTimeRankRsp_Data_Item>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankList',
        $pb.PbFieldType.PM,
        subBuilder: AwakeTimeRankRsp_Data_Item.create)
    ..hasRequiredFields = false;

  AwakeTimeRankRsp_Data._() : super();
  factory AwakeTimeRankRsp_Data({
    $core.Iterable<AwakeTimeRankRsp_Data_Item>? rankList,
  }) {
    final _result = create();
    if (rankList != null) {
      _result.rankList.addAll(rankList);
    }
    return _result;
  }
  factory AwakeTimeRankRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwakeTimeRankRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwakeTimeRankRsp_Data clone() =>
      AwakeTimeRankRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwakeTimeRankRsp_Data copyWith(
          void Function(AwakeTimeRankRsp_Data) updates) =>
      super.copyWith((message) => updates(message as AwakeTimeRankRsp_Data))
          as AwakeTimeRankRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwakeTimeRankRsp_Data create() => AwakeTimeRankRsp_Data._();
  AwakeTimeRankRsp_Data createEmptyInstance() => create();
  static $pb.PbList<AwakeTimeRankRsp_Data> createRepeated() =>
      $pb.PbList<AwakeTimeRankRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static AwakeTimeRankRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwakeTimeRankRsp_Data>(create);
  static AwakeTimeRankRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AwakeTimeRankRsp_Data_Item> get rankList => $_getList(0);
}

class AwakeTimeRankRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwakeTimeRankRsp',
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
    ..aOM<AwakeTimeRankRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AwakeTimeRankRsp_Data.create)
    ..hasRequiredFields = false;

  AwakeTimeRankRsp._() : super();
  factory AwakeTimeRankRsp({
    $core.bool? success,
    $core.String? msg,
    AwakeTimeRankRsp_Data? data,
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
  factory AwakeTimeRankRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwakeTimeRankRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwakeTimeRankRsp clone() => AwakeTimeRankRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwakeTimeRankRsp copyWith(void Function(AwakeTimeRankRsp) updates) =>
      super.copyWith((message) => updates(message as AwakeTimeRankRsp))
          as AwakeTimeRankRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwakeTimeRankRsp create() => AwakeTimeRankRsp._();
  AwakeTimeRankRsp createEmptyInstance() => create();
  static $pb.PbList<AwakeTimeRankRsp> createRepeated() =>
      $pb.PbList<AwakeTimeRankRsp>();
  @$core.pragma('dart2js:noInline')
  static AwakeTimeRankRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwakeTimeRankRsp>(create);
  static AwakeTimeRankRsp? _defaultInstance;

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
  AwakeTimeRankRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AwakeTimeRankRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AwakeTimeRankRsp_Data ensureData() => $_ensure(2);
}
