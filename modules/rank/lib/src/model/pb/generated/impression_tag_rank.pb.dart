///
//  Generated code. Do not modify.
//  source: impression_tag_rank.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ImpressionTagsRankReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImpressionTagsRankReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankType',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ImpressionTagsRankReq._() : super();
  factory ImpressionTagsRankReq({
    $core.int? rankType,
    $core.int? tagId,
    $core.int? lastId,
  }) {
    final _result = create();
    if (rankType != null) {
      _result.rankType = rankType;
    }
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (lastId != null) {
      _result.lastId = lastId;
    }
    return _result;
  }
  factory ImpressionTagsRankReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImpressionTagsRankReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImpressionTagsRankReq clone() =>
      ImpressionTagsRankReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImpressionTagsRankReq copyWith(
          void Function(ImpressionTagsRankReq) updates) =>
      super.copyWith((message) => updates(message as ImpressionTagsRankReq))
          as ImpressionTagsRankReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImpressionTagsRankReq create() => ImpressionTagsRankReq._();
  ImpressionTagsRankReq createEmptyInstance() => create();
  static $pb.PbList<ImpressionTagsRankReq> createRepeated() =>
      $pb.PbList<ImpressionTagsRankReq>();
  @$core.pragma('dart2js:noInline')
  static ImpressionTagsRankReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImpressionTagsRankReq>(create);
  static ImpressionTagsRankReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rankType => $_getIZ(0);
  @$pb.TagNumber(1)
  set rankType($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRankType() => $_has(0);
  @$pb.TagNumber(1)
  void clearRankType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get tagId => $_getIZ(1);
  @$pb.TagNumber(2)
  set tagId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTagId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTagId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get lastId => $_getIZ(2);
  @$pb.TagNumber(3)
  set lastId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLastId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastId() => clearField(3);
}

class ImpressionTagsRankRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImpressionTagsRankRsp',
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
    ..aOM<ImpressionTagsRankData>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ImpressionTagsRankData.create)
    ..hasRequiredFields = false;

  ImpressionTagsRankRsp._() : super();
  factory ImpressionTagsRankRsp({
    $core.bool? success,
    $core.String? msg,
    $core.bool? hasMore,
    $core.int? lastId,
    ImpressionTagsRankData? data,
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
  factory ImpressionTagsRankRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImpressionTagsRankRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImpressionTagsRankRsp clone() =>
      ImpressionTagsRankRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImpressionTagsRankRsp copyWith(
          void Function(ImpressionTagsRankRsp) updates) =>
      super.copyWith((message) => updates(message as ImpressionTagsRankRsp))
          as ImpressionTagsRankRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImpressionTagsRankRsp create() => ImpressionTagsRankRsp._();
  ImpressionTagsRankRsp createEmptyInstance() => create();
  static $pb.PbList<ImpressionTagsRankRsp> createRepeated() =>
      $pb.PbList<ImpressionTagsRankRsp>();
  @$core.pragma('dart2js:noInline')
  static ImpressionTagsRankRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImpressionTagsRankRsp>(create);
  static ImpressionTagsRankRsp? _defaultInstance;

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
  ImpressionTagsRankData get data => $_getN(4);
  @$pb.TagNumber(5)
  set data(ImpressionTagsRankData v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasData() => $_has(4);
  @$pb.TagNumber(5)
  void clearData() => clearField(5);
  @$pb.TagNumber(5)
  ImpressionTagsRankData ensureData() => $_ensure(4);
}

class ImpressionTagsRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImpressionTagsRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ImpressionRank>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ImpressionRank.create)
    ..aOM<ImpressionRank>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'my',
        subBuilder: ImpressionRank.create)
    ..pc<ImpressionTag>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tags',
        $pb.PbFieldType.PM,
        subBuilder: ImpressionTag.create)
    ..hasRequiredFields = false;

  ImpressionTagsRankData._() : super();
  factory ImpressionTagsRankData({
    $core.Iterable<ImpressionRank>? list,
    ImpressionRank? my,
    $core.Iterable<ImpressionTag>? tags,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (my != null) {
      _result.my = my;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    return _result;
  }
  factory ImpressionTagsRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImpressionTagsRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImpressionTagsRankData clone() =>
      ImpressionTagsRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImpressionTagsRankData copyWith(
          void Function(ImpressionTagsRankData) updates) =>
      super.copyWith((message) => updates(message as ImpressionTagsRankData))
          as ImpressionTagsRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImpressionTagsRankData create() => ImpressionTagsRankData._();
  ImpressionTagsRankData createEmptyInstance() => create();
  static $pb.PbList<ImpressionTagsRankData> createRepeated() =>
      $pb.PbList<ImpressionTagsRankData>();
  @$core.pragma('dart2js:noInline')
  static ImpressionTagsRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImpressionTagsRankData>(create);
  static ImpressionTagsRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ImpressionRank> get list => $_getList(0);

  @$pb.TagNumber(2)
  ImpressionRank get my => $_getN(1);
  @$pb.TagNumber(2)
  set my(ImpressionRank v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMy() => $_has(1);
  @$pb.TagNumber(2)
  void clearMy() => clearField(2);
  @$pb.TagNumber(2)
  ImpressionRank ensureMy() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<ImpressionTag> get tags => $_getList(2);
}

class ImpressionTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImpressionTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagName')
    ..hasRequiredFields = false;

  ImpressionTag._() : super();
  factory ImpressionTag({
    $core.int? tagId,
    $core.String? tagName,
  }) {
    final _result = create();
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (tagName != null) {
      _result.tagName = tagName;
    }
    return _result;
  }
  factory ImpressionTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImpressionTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImpressionTag clone() => ImpressionTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImpressionTag copyWith(void Function(ImpressionTag) updates) =>
      super.copyWith((message) => updates(message as ImpressionTag))
          as ImpressionTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImpressionTag create() => ImpressionTag._();
  ImpressionTag createEmptyInstance() => create();
  static $pb.PbList<ImpressionTag> createRepeated() =>
      $pb.PbList<ImpressionTag>();
  @$core.pragma('dart2js:noInline')
  static ImpressionTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImpressionTag>(create);
  static ImpressionTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tagName => $_getSZ(1);
  @$pb.TagNumber(2)
  set tagName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTagName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTagName() => clearField(2);
}

class ImpressionRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImpressionRank',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
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
            : 'userName')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagId',
        $pb.PbFieldType.OU3)
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
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularityLevel',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badgeIcon')
    ..hasRequiredFields = false;

  ImpressionRank._() : super();
  factory ImpressionRank({
    $core.int? rank,
    $core.int? uid,
    $core.String? userName,
    $core.String? userIcon,
    $core.int? score,
    $core.int? tagId,
    $core.int? vipLevel,
    $core.int? title,
    $core.int? titleNew,
    $core.int? popularityLevel,
    $core.String? badgeIcon,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank = rank;
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
    if (score != null) {
      _result.score = score;
    }
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (vipLevel != null) {
      _result.vipLevel = vipLevel;
    }
    if (title != null) {
      _result.title = title;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    if (popularityLevel != null) {
      _result.popularityLevel = popularityLevel;
    }
    if (badgeIcon != null) {
      _result.badgeIcon = badgeIcon;
    }
    return _result;
  }
  factory ImpressionRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImpressionRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImpressionRank clone() => ImpressionRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImpressionRank copyWith(void Function(ImpressionRank) updates) =>
      super.copyWith((message) => updates(message as ImpressionRank))
          as ImpressionRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImpressionRank create() => ImpressionRank._();
  ImpressionRank createEmptyInstance() => create();
  static $pb.PbList<ImpressionRank> createRepeated() =>
      $pb.PbList<ImpressionRank>();
  @$core.pragma('dart2js:noInline')
  static ImpressionRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImpressionRank>(create);
  static ImpressionRank? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rank => $_getIZ(0);
  @$pb.TagNumber(1)
  set rank($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearRank() => clearField(1);

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
  $core.String get userName => $_getSZ(2);
  @$pb.TagNumber(3)
  set userName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUserName() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set userIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUserIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get score => $_getIZ(4);
  @$pb.TagNumber(5)
  set score($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearScore() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get tagId => $_getIZ(5);
  @$pb.TagNumber(6)
  set tagId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTagId() => $_has(5);
  @$pb.TagNumber(6)
  void clearTagId() => clearField(6);

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
  $core.int get title => $_getIZ(7);
  @$pb.TagNumber(8)
  set title($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTitle() => $_has(7);
  @$pb.TagNumber(8)
  void clearTitle() => clearField(8);

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

  @$pb.TagNumber(10)
  $core.int get popularityLevel => $_getIZ(9);
  @$pb.TagNumber(10)
  set popularityLevel($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPopularityLevel() => $_has(9);
  @$pb.TagNumber(10)
  void clearPopularityLevel() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get badgeIcon => $_getSZ(10);
  @$pb.TagNumber(11)
  set badgeIcon($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasBadgeIcon() => $_has(10);
  @$pb.TagNumber(11)
  void clearBadgeIcon() => clearField(11);
}
