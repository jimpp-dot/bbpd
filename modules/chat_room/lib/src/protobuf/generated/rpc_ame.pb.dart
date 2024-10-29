///
//  Generated code. Do not modify.
//  source: rpc_ame.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ReqAmeConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqAmeConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'requestId',
        protoName: 'requestId')
    ..hasRequiredFields = false;

  ReqAmeConfig._() : super();
  factory ReqAmeConfig({
    $fixnum.Int64? requestId,
  }) {
    final _result = create();
    if (requestId != null) {
      _result.requestId = requestId;
    }
    return _result;
  }
  factory ReqAmeConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqAmeConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqAmeConfig clone() => ReqAmeConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqAmeConfig copyWith(void Function(ReqAmeConfig) updates) =>
      super.copyWith((message) => updates(message as ReqAmeConfig))
          as ReqAmeConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqAmeConfig create() => ReqAmeConfig._();
  ReqAmeConfig createEmptyInstance() => create();
  static $pb.PbList<ReqAmeConfig> createRepeated() =>
      $pb.PbList<ReqAmeConfig>();
  @$core.pragma('dart2js:noInline')
  static ReqAmeConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqAmeConfig>(create);
  static ReqAmeConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get requestId => $_getI64(0);
  @$pb.TagNumber(1)
  set requestId($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => clearField(1);
}

class RepAmeConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RepAmeConfig',
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
            : 'licenceUrl',
        protoName: 'licenceUrl')
    ..hasRequiredFields = false;

  RepAmeConfig._() : super();
  factory RepAmeConfig({
    $core.String? key,
    $core.String? licenceUrl,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (licenceUrl != null) {
      _result.licenceUrl = licenceUrl;
    }
    return _result;
  }
  factory RepAmeConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RepAmeConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RepAmeConfig clone() => RepAmeConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RepAmeConfig copyWith(void Function(RepAmeConfig) updates) =>
      super.copyWith((message) => updates(message as RepAmeConfig))
          as RepAmeConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RepAmeConfig create() => RepAmeConfig._();
  RepAmeConfig createEmptyInstance() => create();
  static $pb.PbList<RepAmeConfig> createRepeated() =>
      $pb.PbList<RepAmeConfig>();
  @$core.pragma('dart2js:noInline')
  static RepAmeConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RepAmeConfig>(create);
  static RepAmeConfig? _defaultInstance;

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
  $core.String get licenceUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set licenceUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLicenceUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearLicenceUrl() => clearField(2);
}

class ReqDescribeKTVPlaylists extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqDescribeKTVPlaylists',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Offset',
        protoName: 'Offset')
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Limit',
        protoName: 'Limit')
    ..hasRequiredFields = false;

  ReqDescribeKTVPlaylists._() : super();
  factory ReqDescribeKTVPlaylists({
    $fixnum.Int64? offset,
    $fixnum.Int64? limit,
  }) {
    final _result = create();
    if (offset != null) {
      _result.offset = offset;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    return _result;
  }
  factory ReqDescribeKTVPlaylists.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqDescribeKTVPlaylists.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqDescribeKTVPlaylists clone() =>
      ReqDescribeKTVPlaylists()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqDescribeKTVPlaylists copyWith(
          void Function(ReqDescribeKTVPlaylists) updates) =>
      super.copyWith((message) => updates(message as ReqDescribeKTVPlaylists))
          as ReqDescribeKTVPlaylists; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqDescribeKTVPlaylists create() => ReqDescribeKTVPlaylists._();
  ReqDescribeKTVPlaylists createEmptyInstance() => create();
  static $pb.PbList<ReqDescribeKTVPlaylists> createRepeated() =>
      $pb.PbList<ReqDescribeKTVPlaylists>();
  @$core.pragma('dart2js:noInline')
  static ReqDescribeKTVPlaylists getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqDescribeKTVPlaylists>(create);
  static ReqDescribeKTVPlaylists? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get offset => $_getI64(0);
  @$pb.TagNumber(1)
  set offset($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get limit => $_getI64(1);
  @$pb.TagNumber(2)
  set limit($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);
}

class PlaylistBaseInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PlaylistBaseInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Description',
        protoName: 'Description')
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'MusicNum',
        protoName: 'MusicNum')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'PlaylistId',
        protoName: 'PlaylistId')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Title',
        protoName: 'Title')
    ..hasRequiredFields = false;

  PlaylistBaseInfo._() : super();
  factory PlaylistBaseInfo({
    $core.String? description,
    $fixnum.Int64? musicNum,
    $core.String? playlistId,
    $core.String? title,
  }) {
    final _result = create();
    if (description != null) {
      _result.description = description;
    }
    if (musicNum != null) {
      _result.musicNum = musicNum;
    }
    if (playlistId != null) {
      _result.playlistId = playlistId;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory PlaylistBaseInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PlaylistBaseInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PlaylistBaseInfo clone() => PlaylistBaseInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PlaylistBaseInfo copyWith(void Function(PlaylistBaseInfo) updates) =>
      super.copyWith((message) => updates(message as PlaylistBaseInfo))
          as PlaylistBaseInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlaylistBaseInfo create() => PlaylistBaseInfo._();
  PlaylistBaseInfo createEmptyInstance() => create();
  static $pb.PbList<PlaylistBaseInfo> createRepeated() =>
      $pb.PbList<PlaylistBaseInfo>();
  @$core.pragma('dart2js:noInline')
  static PlaylistBaseInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PlaylistBaseInfo>(create);
  static PlaylistBaseInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get description => $_getSZ(0);
  @$pb.TagNumber(1)
  set description($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearDescription() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get musicNum => $_getI64(1);
  @$pb.TagNumber(2)
  set musicNum($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMusicNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearMusicNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get playlistId => $_getSZ(2);
  @$pb.TagNumber(3)
  set playlistId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPlaylistId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlaylistId() => clearField(3);

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
}

class DescribeKTVPlaylists extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DescribeKTVPlaylists',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'TotalCount',
        protoName: 'TotalCount')
    ..pc<PlaylistBaseInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'info',
        $pb.PbFieldType.PM,
        subBuilder: PlaylistBaseInfo.create)
    ..hasRequiredFields = false;

  DescribeKTVPlaylists._() : super();
  factory DescribeKTVPlaylists({
    $fixnum.Int64? totalCount,
    $core.Iterable<PlaylistBaseInfo>? info,
  }) {
    final _result = create();
    if (totalCount != null) {
      _result.totalCount = totalCount;
    }
    if (info != null) {
      _result.info.addAll(info);
    }
    return _result;
  }
  factory DescribeKTVPlaylists.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DescribeKTVPlaylists.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DescribeKTVPlaylists clone() =>
      DescribeKTVPlaylists()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DescribeKTVPlaylists copyWith(void Function(DescribeKTVPlaylists) updates) =>
      super.copyWith((message) => updates(message as DescribeKTVPlaylists))
          as DescribeKTVPlaylists; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DescribeKTVPlaylists create() => DescribeKTVPlaylists._();
  DescribeKTVPlaylists createEmptyInstance() => create();
  static $pb.PbList<DescribeKTVPlaylists> createRepeated() =>
      $pb.PbList<DescribeKTVPlaylists>();
  @$core.pragma('dart2js:noInline')
  static DescribeKTVPlaylists getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DescribeKTVPlaylists>(create);
  static DescribeKTVPlaylists? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalCount => $_getI64(0);
  @$pb.TagNumber(1)
  set totalCount($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTotalCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<PlaylistBaseInfo> get info => $_getList(1);
}

class RepDescribeKTVPlaylists extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RepDescribeKTVPlaylists',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Success',
        protoName: 'Success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Message',
        protoName: 'Message')
    ..aOM<DescribeKTVPlaylists>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: DescribeKTVPlaylists.create)
    ..hasRequiredFields = false;

  RepDescribeKTVPlaylists._() : super();
  factory RepDescribeKTVPlaylists({
    $core.bool? success,
    $core.String? message,
    DescribeKTVPlaylists? data,
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
  factory RepDescribeKTVPlaylists.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RepDescribeKTVPlaylists.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RepDescribeKTVPlaylists clone() =>
      RepDescribeKTVPlaylists()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RepDescribeKTVPlaylists copyWith(
          void Function(RepDescribeKTVPlaylists) updates) =>
      super.copyWith((message) => updates(message as RepDescribeKTVPlaylists))
          as RepDescribeKTVPlaylists; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RepDescribeKTVPlaylists create() => RepDescribeKTVPlaylists._();
  RepDescribeKTVPlaylists createEmptyInstance() => create();
  static $pb.PbList<RepDescribeKTVPlaylists> createRepeated() =>
      $pb.PbList<RepDescribeKTVPlaylists>();
  @$core.pragma('dart2js:noInline')
  static RepDescribeKTVPlaylists getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RepDescribeKTVPlaylists>(create);
  static RepDescribeKTVPlaylists? _defaultInstance;

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
  DescribeKTVPlaylists get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(DescribeKTVPlaylists v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  DescribeKTVPlaylists ensureData() => $_ensure(2);
}

class ReqDescribeKTVPlaylistDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqDescribeKTVPlaylistDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'PlaylistId',
        protoName: 'PlaylistId')
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Offset',
        protoName: 'Offset')
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Limit',
        protoName: 'Limit')
    ..hasRequiredFields = false;

  ReqDescribeKTVPlaylistDetail._() : super();
  factory ReqDescribeKTVPlaylistDetail({
    $core.String? playlistId,
    $fixnum.Int64? offset,
    $fixnum.Int64? limit,
  }) {
    final _result = create();
    if (playlistId != null) {
      _result.playlistId = playlistId;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    return _result;
  }
  factory ReqDescribeKTVPlaylistDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqDescribeKTVPlaylistDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqDescribeKTVPlaylistDetail clone() =>
      ReqDescribeKTVPlaylistDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqDescribeKTVPlaylistDetail copyWith(
          void Function(ReqDescribeKTVPlaylistDetail) updates) =>
      super.copyWith(
              (message) => updates(message as ReqDescribeKTVPlaylistDetail))
          as ReqDescribeKTVPlaylistDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqDescribeKTVPlaylistDetail create() =>
      ReqDescribeKTVPlaylistDetail._();
  ReqDescribeKTVPlaylistDetail createEmptyInstance() => create();
  static $pb.PbList<ReqDescribeKTVPlaylistDetail> createRepeated() =>
      $pb.PbList<ReqDescribeKTVPlaylistDetail>();
  @$core.pragma('dart2js:noInline')
  static ReqDescribeKTVPlaylistDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqDescribeKTVPlaylistDetail>(create);
  static ReqDescribeKTVPlaylistDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playlistId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playlistId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlaylistId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaylistId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get limit => $_getI64(2);
  @$pb.TagNumber(3)
  set limit($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => clearField(3);
}

class KTVMusicInfoSet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KTVMusicInfoSet',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pPS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ComposerSet',
        protoName: 'ComposerSet')
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Duration',
        protoName: 'Duration')
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'LyricistSet',
        protoName: 'LyricistSet')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'MusicId',
        protoName: 'MusicId')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Name',
        protoName: 'Name')
    ..pPS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'SingerSet',
        protoName: 'SingerSet')
    ..pPS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'TagSet',
        protoName: 'TagSet')
    ..aOB(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'choosed')
    ..hasRequiredFields = false;

  KTVMusicInfoSet._() : super();
  factory KTVMusicInfoSet({
    $core.Iterable<$core.String>? composerSet,
    $fixnum.Int64? duration,
    $core.Iterable<$core.String>? lyricistSet,
    $core.String? musicId,
    $core.String? name,
    $core.Iterable<$core.String>? singerSet,
    $core.Iterable<$core.String>? tagSet,
    $core.bool? choosed,
  }) {
    final _result = create();
    if (composerSet != null) {
      _result.composerSet.addAll(composerSet);
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (lyricistSet != null) {
      _result.lyricistSet.addAll(lyricistSet);
    }
    if (musicId != null) {
      _result.musicId = musicId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (singerSet != null) {
      _result.singerSet.addAll(singerSet);
    }
    if (tagSet != null) {
      _result.tagSet.addAll(tagSet);
    }
    if (choosed != null) {
      _result.choosed = choosed;
    }
    return _result;
  }
  factory KTVMusicInfoSet.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KTVMusicInfoSet.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KTVMusicInfoSet clone() => KTVMusicInfoSet()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KTVMusicInfoSet copyWith(void Function(KTVMusicInfoSet) updates) =>
      super.copyWith((message) => updates(message as KTVMusicInfoSet))
          as KTVMusicInfoSet; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KTVMusicInfoSet create() => KTVMusicInfoSet._();
  KTVMusicInfoSet createEmptyInstance() => create();
  static $pb.PbList<KTVMusicInfoSet> createRepeated() =>
      $pb.PbList<KTVMusicInfoSet>();
  @$core.pragma('dart2js:noInline')
  static KTVMusicInfoSet getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KTVMusicInfoSet>(create);
  static KTVMusicInfoSet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get composerSet => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get duration => $_getI64(1);
  @$pb.TagNumber(2)
  set duration($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get lyricistSet => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get musicId => $_getSZ(3);
  @$pb.TagNumber(4)
  set musicId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMusicId() => $_has(3);
  @$pb.TagNumber(4)
  void clearMusicId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get singerSet => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.String> get tagSet => $_getList(6);

  @$pb.TagNumber(8)
  $core.bool get choosed => $_getBF(7);
  @$pb.TagNumber(8)
  set choosed($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasChoosed() => $_has(7);
  @$pb.TagNumber(8)
  void clearChoosed() => clearField(8);
}

class DescribeKTVPlaylistDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DescribeKTVPlaylistDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<KTVMusicInfoSet>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'info',
        $pb.PbFieldType.PM,
        subBuilder: KTVMusicInfoSet.create)
    ..aOM<PlaylistBaseInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'base',
        subBuilder: PlaylistBaseInfo.create)
    ..hasRequiredFields = false;

  DescribeKTVPlaylistDetail._() : super();
  factory DescribeKTVPlaylistDetail({
    $core.Iterable<KTVMusicInfoSet>? info,
    PlaylistBaseInfo? base,
  }) {
    final _result = create();
    if (info != null) {
      _result.info.addAll(info);
    }
    if (base != null) {
      _result.base = base;
    }
    return _result;
  }
  factory DescribeKTVPlaylistDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DescribeKTVPlaylistDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DescribeKTVPlaylistDetail clone() =>
      DescribeKTVPlaylistDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DescribeKTVPlaylistDetail copyWith(
          void Function(DescribeKTVPlaylistDetail) updates) =>
      super.copyWith((message) => updates(message as DescribeKTVPlaylistDetail))
          as DescribeKTVPlaylistDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DescribeKTVPlaylistDetail create() => DescribeKTVPlaylistDetail._();
  DescribeKTVPlaylistDetail createEmptyInstance() => create();
  static $pb.PbList<DescribeKTVPlaylistDetail> createRepeated() =>
      $pb.PbList<DescribeKTVPlaylistDetail>();
  @$core.pragma('dart2js:noInline')
  static DescribeKTVPlaylistDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DescribeKTVPlaylistDetail>(create);
  static DescribeKTVPlaylistDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<KTVMusicInfoSet> get info => $_getList(0);

  @$pb.TagNumber(2)
  PlaylistBaseInfo get base => $_getN(1);
  @$pb.TagNumber(2)
  set base(PlaylistBaseInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBase() => $_has(1);
  @$pb.TagNumber(2)
  void clearBase() => clearField(2);
  @$pb.TagNumber(2)
  PlaylistBaseInfo ensureBase() => $_ensure(1);
}

class RepDescribeKTVPlaylistDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RepDescribeKTVPlaylistDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Success',
        protoName: 'Success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Message',
        protoName: 'Message')
    ..aOM<DescribeKTVPlaylistDetail>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: DescribeKTVPlaylistDetail.create)
    ..hasRequiredFields = false;

  RepDescribeKTVPlaylistDetail._() : super();
  factory RepDescribeKTVPlaylistDetail({
    $core.bool? success,
    $core.String? message,
    DescribeKTVPlaylistDetail? data,
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
  factory RepDescribeKTVPlaylistDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RepDescribeKTVPlaylistDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RepDescribeKTVPlaylistDetail clone() =>
      RepDescribeKTVPlaylistDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RepDescribeKTVPlaylistDetail copyWith(
          void Function(RepDescribeKTVPlaylistDetail) updates) =>
      super.copyWith(
              (message) => updates(message as RepDescribeKTVPlaylistDetail))
          as RepDescribeKTVPlaylistDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RepDescribeKTVPlaylistDetail create() =>
      RepDescribeKTVPlaylistDetail._();
  RepDescribeKTVPlaylistDetail createEmptyInstance() => create();
  static $pb.PbList<RepDescribeKTVPlaylistDetail> createRepeated() =>
      $pb.PbList<RepDescribeKTVPlaylistDetail>();
  @$core.pragma('dart2js:noInline')
  static RepDescribeKTVPlaylistDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RepDescribeKTVPlaylistDetail>(create);
  static RepDescribeKTVPlaylistDetail? _defaultInstance;

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
  DescribeKTVPlaylistDetail get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(DescribeKTVPlaylistDetail v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  DescribeKTVPlaylistDetail ensureData() => $_ensure(2);
}

class ReqSearchKTVMusics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqSearchKTVMusics',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'KeyWord',
        protoName: 'KeyWord')
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Offset',
        protoName: 'Offset')
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Limit',
        protoName: 'Limit')
    ..hasRequiredFields = false;

  ReqSearchKTVMusics._() : super();
  factory ReqSearchKTVMusics({
    $core.String? keyWord,
    $fixnum.Int64? offset,
    $fixnum.Int64? limit,
  }) {
    final _result = create();
    if (keyWord != null) {
      _result.keyWord = keyWord;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    return _result;
  }
  factory ReqSearchKTVMusics.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqSearchKTVMusics.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqSearchKTVMusics clone() => ReqSearchKTVMusics()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqSearchKTVMusics copyWith(void Function(ReqSearchKTVMusics) updates) =>
      super.copyWith((message) => updates(message as ReqSearchKTVMusics))
          as ReqSearchKTVMusics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqSearchKTVMusics create() => ReqSearchKTVMusics._();
  ReqSearchKTVMusics createEmptyInstance() => create();
  static $pb.PbList<ReqSearchKTVMusics> createRepeated() =>
      $pb.PbList<ReqSearchKTVMusics>();
  @$core.pragma('dart2js:noInline')
  static ReqSearchKTVMusics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqSearchKTVMusics>(create);
  static ReqSearchKTVMusics? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get keyWord => $_getSZ(0);
  @$pb.TagNumber(1)
  set keyWord($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKeyWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeyWord() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get limit => $_getI64(2);
  @$pb.TagNumber(3)
  set limit($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => clearField(3);
}

class SearchKTVMusics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SearchKTVMusics',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<KTVMusicInfoSet>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'info',
        $pb.PbFieldType.PM,
        subBuilder: KTVMusicInfoSet.create)
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'TotalCount',
        protoName: 'TotalCount')
    ..hasRequiredFields = false;

  SearchKTVMusics._() : super();
  factory SearchKTVMusics({
    $core.Iterable<KTVMusicInfoSet>? info,
    $fixnum.Int64? totalCount,
  }) {
    final _result = create();
    if (info != null) {
      _result.info.addAll(info);
    }
    if (totalCount != null) {
      _result.totalCount = totalCount;
    }
    return _result;
  }
  factory SearchKTVMusics.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SearchKTVMusics.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SearchKTVMusics clone() => SearchKTVMusics()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SearchKTVMusics copyWith(void Function(SearchKTVMusics) updates) =>
      super.copyWith((message) => updates(message as SearchKTVMusics))
          as SearchKTVMusics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchKTVMusics create() => SearchKTVMusics._();
  SearchKTVMusics createEmptyInstance() => create();
  static $pb.PbList<SearchKTVMusics> createRepeated() =>
      $pb.PbList<SearchKTVMusics>();
  @$core.pragma('dart2js:noInline')
  static SearchKTVMusics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchKTVMusics>(create);
  static SearchKTVMusics? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<KTVMusicInfoSet> get info => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalCount => $_getI64(1);
  @$pb.TagNumber(2)
  set totalCount($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => clearField(2);
}

class RepSearchKTVMusics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RepSearchKTVMusics',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Success',
        protoName: 'Success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Message',
        protoName: 'Message')
    ..aOM<SearchKTVMusics>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SearchKTVMusics.create)
    ..hasRequiredFields = false;

  RepSearchKTVMusics._() : super();
  factory RepSearchKTVMusics({
    $core.bool? success,
    $core.String? message,
    SearchKTVMusics? data,
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
  factory RepSearchKTVMusics.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RepSearchKTVMusics.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RepSearchKTVMusics clone() => RepSearchKTVMusics()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RepSearchKTVMusics copyWith(void Function(RepSearchKTVMusics) updates) =>
      super.copyWith((message) => updates(message as RepSearchKTVMusics))
          as RepSearchKTVMusics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RepSearchKTVMusics create() => RepSearchKTVMusics._();
  RepSearchKTVMusics createEmptyInstance() => create();
  static $pb.PbList<RepSearchKTVMusics> createRepeated() =>
      $pb.PbList<RepSearchKTVMusics>();
  @$core.pragma('dart2js:noInline')
  static RepSearchKTVMusics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RepSearchKTVMusics>(create);
  static RepSearchKTVMusics? _defaultInstance;

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
  SearchKTVMusics get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SearchKTVMusics v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SearchKTVMusics ensureData() => $_ensure(2);
}

class ReqDescribeKTVMusicDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReqDescribeKTVMusicDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'MusicId',
        protoName: 'MusicId')
    ..hasRequiredFields = false;

  ReqDescribeKTVMusicDetail._() : super();
  factory ReqDescribeKTVMusicDetail({
    $core.String? musicId,
  }) {
    final _result = create();
    if (musicId != null) {
      _result.musicId = musicId;
    }
    return _result;
  }
  factory ReqDescribeKTVMusicDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReqDescribeKTVMusicDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReqDescribeKTVMusicDetail clone() =>
      ReqDescribeKTVMusicDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReqDescribeKTVMusicDetail copyWith(
          void Function(ReqDescribeKTVMusicDetail) updates) =>
      super.copyWith((message) => updates(message as ReqDescribeKTVMusicDetail))
          as ReqDescribeKTVMusicDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqDescribeKTVMusicDetail create() => ReqDescribeKTVMusicDetail._();
  ReqDescribeKTVMusicDetail createEmptyInstance() => create();
  static $pb.PbList<ReqDescribeKTVMusicDetail> createRepeated() =>
      $pb.PbList<ReqDescribeKTVMusicDetail>();
  @$core.pragma('dart2js:noInline')
  static ReqDescribeKTVMusicDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqDescribeKTVMusicDetail>(create);
  static ReqDescribeKTVMusicDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get musicId => $_getSZ(0);
  @$pb.TagNumber(1)
  set musicId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMusicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMusicId() => clearField(1);
}

class DescribeKTVMusicDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DescribeKTVMusicDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<KTVMusicInfoSet>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'base',
        subBuilder: KTVMusicInfoSet.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'LyricsUrl',
        protoName: 'LyricsUrl')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'PlayToken',
        protoName: 'PlayToken')
    ..hasRequiredFields = false;

  DescribeKTVMusicDetail._() : super();
  factory DescribeKTVMusicDetail({
    KTVMusicInfoSet? base,
    $core.String? lyricsUrl,
    $core.String? playToken,
  }) {
    final _result = create();
    if (base != null) {
      _result.base = base;
    }
    if (lyricsUrl != null) {
      _result.lyricsUrl = lyricsUrl;
    }
    if (playToken != null) {
      _result.playToken = playToken;
    }
    return _result;
  }
  factory DescribeKTVMusicDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DescribeKTVMusicDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DescribeKTVMusicDetail clone() =>
      DescribeKTVMusicDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DescribeKTVMusicDetail copyWith(
          void Function(DescribeKTVMusicDetail) updates) =>
      super.copyWith((message) => updates(message as DescribeKTVMusicDetail))
          as DescribeKTVMusicDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DescribeKTVMusicDetail create() => DescribeKTVMusicDetail._();
  DescribeKTVMusicDetail createEmptyInstance() => create();
  static $pb.PbList<DescribeKTVMusicDetail> createRepeated() =>
      $pb.PbList<DescribeKTVMusicDetail>();
  @$core.pragma('dart2js:noInline')
  static DescribeKTVMusicDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DescribeKTVMusicDetail>(create);
  static DescribeKTVMusicDetail? _defaultInstance;

  @$pb.TagNumber(1)
  KTVMusicInfoSet get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(KTVMusicInfoSet v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  KTVMusicInfoSet ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get lyricsUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set lyricsUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLyricsUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearLyricsUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get playToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set playToken($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPlayToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlayToken() => clearField(3);
}

class RepDescribeKTVMusicDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RepDescribeKTVMusicDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Success',
        protoName: 'Success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Message',
        protoName: 'Message')
    ..aOM<DescribeKTVMusicDetail>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: DescribeKTVMusicDetail.create)
    ..hasRequiredFields = false;

  RepDescribeKTVMusicDetail._() : super();
  factory RepDescribeKTVMusicDetail({
    $core.bool? success,
    $core.String? message,
    DescribeKTVMusicDetail? data,
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
  factory RepDescribeKTVMusicDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RepDescribeKTVMusicDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RepDescribeKTVMusicDetail clone() =>
      RepDescribeKTVMusicDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RepDescribeKTVMusicDetail copyWith(
          void Function(RepDescribeKTVMusicDetail) updates) =>
      super.copyWith((message) => updates(message as RepDescribeKTVMusicDetail))
          as RepDescribeKTVMusicDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RepDescribeKTVMusicDetail create() => RepDescribeKTVMusicDetail._();
  RepDescribeKTVMusicDetail createEmptyInstance() => create();
  static $pb.PbList<RepDescribeKTVMusicDetail> createRepeated() =>
      $pb.PbList<RepDescribeKTVMusicDetail>();
  @$core.pragma('dart2js:noInline')
  static RepDescribeKTVMusicDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RepDescribeKTVMusicDetail>(create);
  static RepDescribeKTVMusicDetail? _defaultInstance;

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
  DescribeKTVMusicDetail get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(DescribeKTVMusicDetail v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  DescribeKTVMusicDetail ensureData() => $_ensure(2);
}

class RPCAmeApi {
  $pb.RpcClient _client;
  RPCAmeApi(this._client);

  $async.Future<RepAmeConfig> getConfig(
      $pb.ClientContext? ctx, ReqAmeConfig request) {
    var emptyResponse = RepAmeConfig();
    return _client.invoke<RepAmeConfig>(
        ctx, 'RPCAme', 'GetConfig', request, emptyResponse);
  }

  $async.Future<RepDescribeKTVPlaylists> describeKTVPlaylists(
      $pb.ClientContext? ctx, ReqDescribeKTVPlaylists request) {
    var emptyResponse = RepDescribeKTVPlaylists();
    return _client.invoke<RepDescribeKTVPlaylists>(
        ctx, 'RPCAme', 'DescribeKTVPlaylists', request, emptyResponse);
  }

  $async.Future<RepDescribeKTVPlaylistDetail> describeKTVPlaylistDetail(
      $pb.ClientContext? ctx, ReqDescribeKTVPlaylistDetail request) {
    var emptyResponse = RepDescribeKTVPlaylistDetail();
    return _client.invoke<RepDescribeKTVPlaylistDetail>(
        ctx, 'RPCAme', 'DescribeKTVPlaylistDetail', request, emptyResponse);
  }

  $async.Future<RepSearchKTVMusics> searchKTVMusics(
      $pb.ClientContext? ctx, ReqSearchKTVMusics request) {
    var emptyResponse = RepSearchKTVMusics();
    return _client.invoke<RepSearchKTVMusics>(
        ctx, 'RPCAme', 'SearchKTVMusics', request, emptyResponse);
  }

  $async.Future<RepDescribeKTVMusicDetail> describeKTVMusicDetail(
      $pb.ClientContext? ctx, ReqDescribeKTVMusicDetail request) {
    var emptyResponse = RepDescribeKTVMusicDetail();
    return _client.invoke<RepDescribeKTVMusicDetail>(
        ctx, 'RPCAme', 'DescribeKTVMusicDetail', request, emptyResponse);
  }
}
