///
//  Generated code. Do not modify.
//  source: rank_cross_pk.proto.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomCrossPkSegmentItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkSegmentItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.rank.cross.pk'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'segment',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'segmentUrl')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'segmentName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subSegment',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalStart',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCrossPkSegmentItem._() : super();
  factory RoomCrossPkSegmentItem({
    $core.int? segment,
    $core.String? segmentUrl,
    $core.String? segmentName,
    $core.int? subSegment,
    $core.int? star,
    $core.int? totalStart,
  }) {
    final _result = create();
    if (segment != null) {
      _result.segment = segment;
    }
    if (segmentUrl != null) {
      _result.segmentUrl = segmentUrl;
    }
    if (segmentName != null) {
      _result.segmentName = segmentName;
    }
    if (subSegment != null) {
      _result.subSegment = subSegment;
    }
    if (star != null) {
      _result.star = star;
    }
    if (totalStart != null) {
      _result.totalStart = totalStart;
    }
    return _result;
  }
  factory RoomCrossPkSegmentItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkSegmentItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkSegmentItem clone() =>
      RoomCrossPkSegmentItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkSegmentItem copyWith(
          void Function(RoomCrossPkSegmentItem) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkSegmentItem))
          as RoomCrossPkSegmentItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSegmentItem create() => RoomCrossPkSegmentItem._();
  RoomCrossPkSegmentItem createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkSegmentItem> createRepeated() =>
      $pb.PbList<RoomCrossPkSegmentItem>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSegmentItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkSegmentItem>(create);
  static RoomCrossPkSegmentItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get segment => $_getIZ(0);
  @$pb.TagNumber(1)
  set segment($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSegment() => $_has(0);
  @$pb.TagNumber(1)
  void clearSegment() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get segmentUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set segmentUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSegmentUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearSegmentUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get segmentName => $_getSZ(2);
  @$pb.TagNumber(3)
  set segmentName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSegmentName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSegmentName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get subSegment => $_getIZ(3);
  @$pb.TagNumber(4)
  set subSegment($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSubSegment() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubSegment() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get star => $_getIZ(4);
  @$pb.TagNumber(5)
  set star($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStar() => $_has(4);
  @$pb.TagNumber(5)
  void clearStar() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get totalStart => $_getIZ(5);
  @$pb.TagNumber(6)
  set totalStart($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTotalStart() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalStart() => clearField(6);
}

class ApiRoomCrossPkSegmentRankResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiRoomCrossPkSegmentRankResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.rank.cross.pk'),
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
    ..aOM<RoomCrossPkSegmentRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomCrossPkSegmentRankData.create)
    ..hasRequiredFields = false;

  ApiRoomCrossPkSegmentRankResponse._() : super();
  factory ApiRoomCrossPkSegmentRankResponse({
    $core.bool? success,
    $core.String? message,
    RoomCrossPkSegmentRankData? data,
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
  factory ApiRoomCrossPkSegmentRankResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiRoomCrossPkSegmentRankResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiRoomCrossPkSegmentRankResponse clone() =>
      ApiRoomCrossPkSegmentRankResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiRoomCrossPkSegmentRankResponse copyWith(
          void Function(ApiRoomCrossPkSegmentRankResponse) updates) =>
      super.copyWith((message) =>
              updates(message as ApiRoomCrossPkSegmentRankResponse))
          as ApiRoomCrossPkSegmentRankResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiRoomCrossPkSegmentRankResponse create() =>
      ApiRoomCrossPkSegmentRankResponse._();
  ApiRoomCrossPkSegmentRankResponse createEmptyInstance() => create();
  static $pb.PbList<ApiRoomCrossPkSegmentRankResponse> createRepeated() =>
      $pb.PbList<ApiRoomCrossPkSegmentRankResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiRoomCrossPkSegmentRankResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiRoomCrossPkSegmentRankResponse>(
          create);
  static ApiRoomCrossPkSegmentRankResponse? _defaultInstance;

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
  RoomCrossPkSegmentRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomCrossPkSegmentRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomCrossPkSegmentRankData ensureData() => $_ensure(2);
}

class RoomCrossPkSegmentRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkSegmentRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.rank.cross.pk'),
      createEmptyInstance: create)
    ..pc<RoomCrossPkSegmentRankItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RoomCrossPkSegmentRankItem.create)
    ..aOM<RoomCrossPkSegmentRankItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'me',
        subBuilder: RoomCrossPkSegmentRankItem.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCrossPkSegmentRankData._() : super();
  factory RoomCrossPkSegmentRankData({
    $core.Iterable<RoomCrossPkSegmentRankItem>? list,
    RoomCrossPkSegmentRankItem? me,
    $core.int? more,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (me != null) {
      _result.me = me;
    }
    if (more != null) {
      _result.more = more;
    }
    return _result;
  }
  factory RoomCrossPkSegmentRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkSegmentRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkSegmentRankData clone() =>
      RoomCrossPkSegmentRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkSegmentRankData copyWith(
          void Function(RoomCrossPkSegmentRankData) updates) =>
      super.copyWith(
              (message) => updates(message as RoomCrossPkSegmentRankData))
          as RoomCrossPkSegmentRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSegmentRankData create() => RoomCrossPkSegmentRankData._();
  RoomCrossPkSegmentRankData createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkSegmentRankData> createRepeated() =>
      $pb.PbList<RoomCrossPkSegmentRankData>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSegmentRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkSegmentRankData>(create);
  static RoomCrossPkSegmentRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomCrossPkSegmentRankItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  RoomCrossPkSegmentRankItem get me => $_getN(1);
  @$pb.TagNumber(2)
  set me(RoomCrossPkSegmentRankItem v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMe() => $_has(1);
  @$pb.TagNumber(2)
  void clearMe() => clearField(2);
  @$pb.TagNumber(2)
  RoomCrossPkSegmentRankItem ensureMe() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get more => $_getIZ(2);
  @$pb.TagNumber(3)
  set more($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMore() => $_has(2);
  @$pb.TagNumber(3)
  void clearMore() => clearField(3);
}

class RoomCrossPkSegmentRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkSegmentRankItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.rank.cross.pk'),
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
    ..aOM<RoomCrossPkSegmentItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'curSegment',
        subBuilder: RoomCrossPkSegmentItem.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.O3)
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isFollow')
    ..hasRequiredFields = false;

  RoomCrossPkSegmentRankItem._() : super();
  factory RoomCrossPkSegmentRankItem({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    RoomCrossPkSegmentItem? curSegment,
    $core.int? rank,
    $core.bool? isFollow,
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
    if (curSegment != null) {
      _result.curSegment = curSegment;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (isFollow != null) {
      _result.isFollow = isFollow;
    }
    return _result;
  }
  factory RoomCrossPkSegmentRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkSegmentRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkSegmentRankItem clone() =>
      RoomCrossPkSegmentRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkSegmentRankItem copyWith(
          void Function(RoomCrossPkSegmentRankItem) updates) =>
      super.copyWith(
              (message) => updates(message as RoomCrossPkSegmentRankItem))
          as RoomCrossPkSegmentRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSegmentRankItem create() => RoomCrossPkSegmentRankItem._();
  RoomCrossPkSegmentRankItem createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkSegmentRankItem> createRepeated() =>
      $pb.PbList<RoomCrossPkSegmentRankItem>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkSegmentRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkSegmentRankItem>(create);
  static RoomCrossPkSegmentRankItem? _defaultInstance;

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
  RoomCrossPkSegmentItem get curSegment => $_getN(3);
  @$pb.TagNumber(4)
  set curSegment(RoomCrossPkSegmentItem v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCurSegment() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurSegment() => clearField(4);
  @$pb.TagNumber(4)
  RoomCrossPkSegmentItem ensureCurSegment() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get rank => $_getIZ(4);
  @$pb.TagNumber(5)
  set rank($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRank() => $_has(4);
  @$pb.TagNumber(5)
  void clearRank() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isFollow => $_getBF(5);
  @$pb.TagNumber(6)
  set isFollow($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIsFollow() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsFollow() => clearField(6);
}

class ApiRoomCrossPkLivingRankResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiRoomCrossPkLivingRankResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.rank.cross.pk'),
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
    ..aOM<RoomCrossPkLivingRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomCrossPkLivingRankData.create)
    ..hasRequiredFields = false;

  ApiRoomCrossPkLivingRankResponse._() : super();
  factory ApiRoomCrossPkLivingRankResponse({
    $core.bool? success,
    $core.String? message,
    RoomCrossPkLivingRankData? data,
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
  factory ApiRoomCrossPkLivingRankResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiRoomCrossPkLivingRankResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiRoomCrossPkLivingRankResponse clone() =>
      ApiRoomCrossPkLivingRankResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiRoomCrossPkLivingRankResponse copyWith(
          void Function(ApiRoomCrossPkLivingRankResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiRoomCrossPkLivingRankResponse))
          as ApiRoomCrossPkLivingRankResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiRoomCrossPkLivingRankResponse create() =>
      ApiRoomCrossPkLivingRankResponse._();
  ApiRoomCrossPkLivingRankResponse createEmptyInstance() => create();
  static $pb.PbList<ApiRoomCrossPkLivingRankResponse> createRepeated() =>
      $pb.PbList<ApiRoomCrossPkLivingRankResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiRoomCrossPkLivingRankResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiRoomCrossPkLivingRankResponse>(
          create);
  static ApiRoomCrossPkLivingRankResponse? _defaultInstance;

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
  RoomCrossPkLivingRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomCrossPkLivingRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomCrossPkLivingRankData ensureData() => $_ensure(2);
}

class RoomCrossPkLivingRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkLivingRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.rank.cross.pk'),
      createEmptyInstance: create)
    ..pc<RoomCrossPkLivingRankItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RoomCrossPkLivingRankItem.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCrossPkLivingRankData._() : super();
  factory RoomCrossPkLivingRankData({
    $core.Iterable<RoomCrossPkLivingRankItem>? list,
    $core.int? more,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (more != null) {
      _result.more = more;
    }
    return _result;
  }
  factory RoomCrossPkLivingRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkLivingRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkLivingRankData clone() =>
      RoomCrossPkLivingRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkLivingRankData copyWith(
          void Function(RoomCrossPkLivingRankData) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkLivingRankData))
          as RoomCrossPkLivingRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkLivingRankData create() => RoomCrossPkLivingRankData._();
  RoomCrossPkLivingRankData createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkLivingRankData> createRepeated() =>
      $pb.PbList<RoomCrossPkLivingRankData>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkLivingRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkLivingRankData>(create);
  static RoomCrossPkLivingRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomCrossPkLivingRankItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get more => $_getIZ(1);
  @$pb.TagNumber(2)
  set more($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearMore() => clearField(2);
}

class RoomCrossPkLivingRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkLivingRankItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.rank.cross.pk'),
      createEmptyInstance: create)
    ..aOM<RoomCrossPkLivingRankRole>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'red',
        subBuilder: RoomCrossPkLivingRankRole.create)
    ..aOM<RoomCrossPkLivingRankRole>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blue',
        subBuilder: RoomCrossPkLivingRankRole.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomCrossPkLivingRankItem._() : super();
  factory RoomCrossPkLivingRankItem({
    RoomCrossPkLivingRankRole? red,
    RoomCrossPkLivingRankRole? blue,
    $core.int? rank,
  }) {
    final _result = create();
    if (red != null) {
      _result.red = red;
    }
    if (blue != null) {
      _result.blue = blue;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    return _result;
  }
  factory RoomCrossPkLivingRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkLivingRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkLivingRankItem clone() =>
      RoomCrossPkLivingRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkLivingRankItem copyWith(
          void Function(RoomCrossPkLivingRankItem) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkLivingRankItem))
          as RoomCrossPkLivingRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkLivingRankItem create() => RoomCrossPkLivingRankItem._();
  RoomCrossPkLivingRankItem createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkLivingRankItem> createRepeated() =>
      $pb.PbList<RoomCrossPkLivingRankItem>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkLivingRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkLivingRankItem>(create);
  static RoomCrossPkLivingRankItem? _defaultInstance;

  @$pb.TagNumber(1)
  RoomCrossPkLivingRankRole get red => $_getN(0);
  @$pb.TagNumber(1)
  set red(RoomCrossPkLivingRankRole v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRed() => $_has(0);
  @$pb.TagNumber(1)
  void clearRed() => clearField(1);
  @$pb.TagNumber(1)
  RoomCrossPkLivingRankRole ensureRed() => $_ensure(0);

  @$pb.TagNumber(2)
  RoomCrossPkLivingRankRole get blue => $_getN(1);
  @$pb.TagNumber(2)
  set blue(RoomCrossPkLivingRankRole v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBlue() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlue() => clearField(2);
  @$pb.TagNumber(2)
  RoomCrossPkLivingRankRole ensureBlue() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get rank => $_getIZ(2);
  @$pb.TagNumber(3)
  set rank($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRank() => $_has(2);
  @$pb.TagNumber(3)
  void clearRank() => clearField(3);
}

class RoomCrossPkLivingRankRole extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCrossPkLivingRankRole',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb.rank.cross.pk'),
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
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'charm',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  RoomCrossPkLivingRankRole._() : super();
  factory RoomCrossPkLivingRankRole({
    $core.int? uid,
    $core.int? rid,
    $core.int? charm,
    $core.String? icon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (charm != null) {
      _result.charm = charm;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory RoomCrossPkLivingRankRole.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCrossPkLivingRankRole.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCrossPkLivingRankRole clone() =>
      RoomCrossPkLivingRankRole()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCrossPkLivingRankRole copyWith(
          void Function(RoomCrossPkLivingRankRole) updates) =>
      super.copyWith((message) => updates(message as RoomCrossPkLivingRankRole))
          as RoomCrossPkLivingRankRole; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkLivingRankRole create() => RoomCrossPkLivingRankRole._();
  RoomCrossPkLivingRankRole createEmptyInstance() => create();
  static $pb.PbList<RoomCrossPkLivingRankRole> createRepeated() =>
      $pb.PbList<RoomCrossPkLivingRankRole>();
  @$core.pragma('dart2js:noInline')
  static RoomCrossPkLivingRankRole getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCrossPkLivingRankRole>(create);
  static RoomCrossPkLivingRankRole? _defaultInstance;

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
  $core.int get charm => $_getIZ(2);
  @$pb.TagNumber(3)
  set charm($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCharm() => $_has(2);
  @$pb.TagNumber(3)
  void clearCharm() => clearField(3);

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
}
