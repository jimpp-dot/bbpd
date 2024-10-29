///
//  Generated code. Do not modify.
//  source: juke_music.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Song extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Song',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerName')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerIcon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songName')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'language')
    ..a<$fixnum.Int64>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'updateline',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'orderCount',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playCount',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'index',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'flag',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  Song._() : super();
  factory Song({
    $core.int? id,
    $core.int? singerUid,
    $core.String? singerName,
    $core.String? singerIcon,
    $core.String? songName,
    $core.String? language,
    $fixnum.Int64? dateline,
    $fixnum.Int64? updateline,
    $core.int? orderCount,
    $core.int? playCount,
    $core.int? index,
    $core.int? flag,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (singerUid != null) {
      _result.singerUid = singerUid;
    }
    if (singerName != null) {
      _result.singerName = singerName;
    }
    if (singerIcon != null) {
      _result.singerIcon = singerIcon;
    }
    if (songName != null) {
      _result.songName = songName;
    }
    if (language != null) {
      _result.language = language;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (updateline != null) {
      _result.updateline = updateline;
    }
    if (orderCount != null) {
      _result.orderCount = orderCount;
    }
    if (playCount != null) {
      _result.playCount = playCount;
    }
    if (index != null) {
      _result.index = index;
    }
    if (flag != null) {
      _result.flag = flag;
    }
    return _result;
  }
  factory Song.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Song.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Song clone() => Song()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Song copyWith(void Function(Song) updates) =>
      super.copyWith((message) => updates(message as Song))
          as Song; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Song create() => Song._();
  Song createEmptyInstance() => create();
  static $pb.PbList<Song> createRepeated() => $pb.PbList<Song>();
  @$core.pragma('dart2js:noInline')
  static Song getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Song>(create);
  static Song? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get singerUid => $_getIZ(1);
  @$pb.TagNumber(2)
  set singerUid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSingerUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearSingerUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get singerName => $_getSZ(2);
  @$pb.TagNumber(3)
  set singerName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSingerName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSingerName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get singerIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set singerIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSingerIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearSingerIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get songName => $_getSZ(4);
  @$pb.TagNumber(5)
  set songName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSongName() => $_has(4);
  @$pb.TagNumber(5)
  void clearSongName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get language => $_getSZ(5);
  @$pb.TagNumber(6)
  set language($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLanguage() => $_has(5);
  @$pb.TagNumber(6)
  void clearLanguage() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get dateline => $_getI64(6);
  @$pb.TagNumber(7)
  set dateline($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDateline() => $_has(6);
  @$pb.TagNumber(7)
  void clearDateline() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get updateline => $_getI64(7);
  @$pb.TagNumber(8)
  set updateline($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUpdateline() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdateline() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get orderCount => $_getIZ(8);
  @$pb.TagNumber(9)
  set orderCount($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasOrderCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearOrderCount() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get playCount => $_getIZ(9);
  @$pb.TagNumber(10)
  set playCount($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPlayCount() => $_has(9);
  @$pb.TagNumber(10)
  void clearPlayCount() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get index => $_getIZ(10);
  @$pb.TagNumber(11)
  set index($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasIndex() => $_has(10);
  @$pb.TagNumber(11)
  void clearIndex() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get flag => $_getIZ(11);
  @$pb.TagNumber(12)
  set flag($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasFlag() => $_has(11);
  @$pb.TagNumber(12)
  void clearFlag() => clearField(12);
}

class SongConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SongConfig',
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
            : 'giftId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftCount',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftPrice',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SongConfig._() : super();
  factory SongConfig({
    $core.int? uid,
    $core.int? giftId,
    $core.int? giftCount,
    $core.int? giftPrice,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftCount != null) {
      _result.giftCount = giftCount;
    }
    if (giftPrice != null) {
      _result.giftPrice = giftPrice;
    }
    return _result;
  }
  factory SongConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SongConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SongConfig clone() => SongConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SongConfig copyWith(void Function(SongConfig) updates) =>
      super.copyWith((message) => updates(message as SongConfig))
          as SongConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongConfig create() => SongConfig._();
  SongConfig createEmptyInstance() => create();
  static $pb.PbList<SongConfig> createRepeated() => $pb.PbList<SongConfig>();
  @$core.pragma('dart2js:noInline')
  static SongConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SongConfig>(create);
  static SongConfig? _defaultInstance;

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
  $core.int get giftId => $_getIZ(1);
  @$pb.TagNumber(2)
  set giftId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get giftCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set giftCount($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get giftPrice => $_getIZ(3);
  @$pb.TagNumber(4)
  set giftPrice($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftPrice() => clearField(4);
}

class SongsData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SongsData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<Song>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songs',
        $pb.PbFieldType.PM,
        subBuilder: Song.create)
    ..aOM<SongConfig>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'config',
        subBuilder: SongConfig.create)
    ..hasRequiredFields = false;

  SongsData._() : super();
  factory SongsData({
    $core.Iterable<Song>? songs,
    SongConfig? config,
  }) {
    final _result = create();
    if (songs != null) {
      _result.songs.addAll(songs);
    }
    if (config != null) {
      _result.config = config;
    }
    return _result;
  }
  factory SongsData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SongsData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SongsData clone() => SongsData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SongsData copyWith(void Function(SongsData) updates) =>
      super.copyWith((message) => updates(message as SongsData))
          as SongsData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongsData create() => SongsData._();
  SongsData createEmptyInstance() => create();
  static $pb.PbList<SongsData> createRepeated() => $pb.PbList<SongsData>();
  @$core.pragma('dart2js:noInline')
  static SongsData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SongsData>(create);
  static SongsData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Song> get songs => $_getList(0);

  @$pb.TagNumber(2)
  SongConfig get config => $_getN(1);
  @$pb.TagNumber(2)
  set config(SongConfig v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConfig() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfig() => clearField(2);
  @$pb.TagNumber(2)
  SongConfig ensureConfig() => $_ensure(1);
}

class RespQuerySongs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespQuerySongs',
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
    ..aOM<SongsData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SongsData.create)
    ..hasRequiredFields = false;

  RespQuerySongs._() : super();
  factory RespQuerySongs({
    $core.bool? success,
    $core.String? msg,
    SongsData? data,
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
  factory RespQuerySongs.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespQuerySongs.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespQuerySongs clone() => RespQuerySongs()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespQuerySongs copyWith(void Function(RespQuerySongs) updates) =>
      super.copyWith((message) => updates(message as RespQuerySongs))
          as RespQuerySongs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespQuerySongs create() => RespQuerySongs._();
  RespQuerySongs createEmptyInstance() => create();
  static $pb.PbList<RespQuerySongs> createRepeated() =>
      $pb.PbList<RespQuerySongs>();
  @$core.pragma('dart2js:noInline')
  static RespQuerySongs getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespQuerySongs>(create);
  static RespQuerySongs? _defaultInstance;

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
  SongsData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SongsData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SongsData ensureData() => $_ensure(2);
}

class OrderSong extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OrderSong',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerName')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerIcon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songName')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftCount',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftPrice',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'index',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'flag',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  OrderSong._() : super();
  factory OrderSong({
    $core.int? id,
    $core.int? singerUid,
    $core.String? singerName,
    $core.String? singerIcon,
    $core.String? songName,
    $core.int? giftId,
    $core.int? giftCount,
    $core.int? giftPrice,
    $core.String? state,
    $core.int? index,
    $core.int? flag,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (singerUid != null) {
      _result.singerUid = singerUid;
    }
    if (singerName != null) {
      _result.singerName = singerName;
    }
    if (singerIcon != null) {
      _result.singerIcon = singerIcon;
    }
    if (songName != null) {
      _result.songName = songName;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftCount != null) {
      _result.giftCount = giftCount;
    }
    if (giftPrice != null) {
      _result.giftPrice = giftPrice;
    }
    if (state != null) {
      _result.state = state;
    }
    if (index != null) {
      _result.index = index;
    }
    if (flag != null) {
      _result.flag = flag;
    }
    return _result;
  }
  factory OrderSong.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OrderSong.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OrderSong clone() => OrderSong()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OrderSong copyWith(void Function(OrderSong) updates) =>
      super.copyWith((message) => updates(message as OrderSong))
          as OrderSong; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OrderSong create() => OrderSong._();
  OrderSong createEmptyInstance() => create();
  static $pb.PbList<OrderSong> createRepeated() => $pb.PbList<OrderSong>();
  @$core.pragma('dart2js:noInline')
  static OrderSong getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrderSong>(create);
  static OrderSong? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get singerUid => $_getIZ(1);
  @$pb.TagNumber(2)
  set singerUid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSingerUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearSingerUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get singerName => $_getSZ(2);
  @$pb.TagNumber(3)
  set singerName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSingerName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSingerName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get singerIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set singerIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSingerIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearSingerIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get songName => $_getSZ(4);
  @$pb.TagNumber(5)
  set songName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSongName() => $_has(4);
  @$pb.TagNumber(5)
  void clearSongName() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get giftId => $_getIZ(5);
  @$pb.TagNumber(6)
  set giftId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGiftId() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftId() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get giftCount => $_getIZ(6);
  @$pb.TagNumber(7)
  set giftCount($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGiftCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearGiftCount() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get giftPrice => $_getIZ(7);
  @$pb.TagNumber(8)
  set giftPrice($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGiftPrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearGiftPrice() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get state => $_getSZ(8);
  @$pb.TagNumber(9)
  set state($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasState() => $_has(8);
  @$pb.TagNumber(9)
  void clearState() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get index => $_getIZ(9);
  @$pb.TagNumber(10)
  set index($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasIndex() => $_has(9);
  @$pb.TagNumber(10)
  void clearIndex() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get flag => $_getIZ(10);
  @$pb.TagNumber(11)
  set flag($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasFlag() => $_has(10);
  @$pb.TagNumber(11)
  void clearFlag() => clearField(11);
}

class RespMyOrderSongs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespMyOrderSongs',
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
    ..pc<OrderSong>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songs',
        $pb.PbFieldType.PM,
        subBuilder: OrderSong.create)
    ..hasRequiredFields = false;

  RespMyOrderSongs._() : super();
  factory RespMyOrderSongs({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<OrderSong>? songs,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (songs != null) {
      _result.songs.addAll(songs);
    }
    return _result;
  }
  factory RespMyOrderSongs.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespMyOrderSongs.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespMyOrderSongs clone() => RespMyOrderSongs()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespMyOrderSongs copyWith(void Function(RespMyOrderSongs) updates) =>
      super.copyWith((message) => updates(message as RespMyOrderSongs))
          as RespMyOrderSongs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespMyOrderSongs create() => RespMyOrderSongs._();
  RespMyOrderSongs createEmptyInstance() => create();
  static $pb.PbList<RespMyOrderSongs> createRepeated() =>
      $pb.PbList<RespMyOrderSongs>();
  @$core.pragma('dart2js:noInline')
  static RespMyOrderSongs getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespMyOrderSongs>(create);
  static RespMyOrderSongs? _defaultInstance;

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
  $core.List<OrderSong> get songs => $_getList(2);
}

class RespQuerySingers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespQuerySingers',
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
    ..pc<SingerData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singers',
        $pb.PbFieldType.PM,
        subBuilder: SingerData.create)
    ..hasRequiredFields = false;

  RespQuerySingers._() : super();
  factory RespQuerySingers({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<SingerData>? singers,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (singers != null) {
      _result.singers.addAll(singers);
    }
    return _result;
  }
  factory RespQuerySingers.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespQuerySingers.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespQuerySingers clone() => RespQuerySingers()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespQuerySingers copyWith(void Function(RespQuerySingers) updates) =>
      super.copyWith((message) => updates(message as RespQuerySingers))
          as RespQuerySingers; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespQuerySingers create() => RespQuerySingers._();
  RespQuerySingers createEmptyInstance() => create();
  static $pb.PbList<RespQuerySingers> createRepeated() =>
      $pb.PbList<RespQuerySingers>();
  @$core.pragma('dart2js:noInline')
  static RespQuerySingers getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespQuerySingers>(create);
  static RespQuerySingers? _defaultInstance;

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
  $core.List<SingerData> get singers => $_getList(2);
}

class SingerData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SingerData',
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
        $pb.PbFieldType.O3)
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
            : 'sex',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  SingerData._() : super();
  factory SingerData({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.int? position,
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
    if (sex != null) {
      _result.sex = sex;
    }
    if (position != null) {
      _result.position = position;
    }
    return _result;
  }
  factory SingerData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SingerData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SingerData clone() => SingerData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SingerData copyWith(void Function(SingerData) updates) =>
      super.copyWith((message) => updates(message as SingerData))
          as SingerData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SingerData create() => SingerData._();
  SingerData createEmptyInstance() => create();
  static $pb.PbList<SingerData> createRepeated() => $pb.PbList<SingerData>();
  @$core.pragma('dart2js:noInline')
  static SingerData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SingerData>(create);
  static SingerData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setSignedInt32(0, v);
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
  $core.int get sex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sex($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get position => $_getIZ(4);
  @$pb.TagNumber(5)
  set position($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPosition() => $_has(4);
  @$pb.TagNumber(5)
  void clearPosition() => clearField(5);
}
