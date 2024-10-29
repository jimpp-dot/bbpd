///
//  Generated code. Do not modify.
//  source: grab_mic.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GrabMicSong extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicSong',
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
            : 'singerName')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'brc')
    ..hasRequiredFields = false;

  GrabMicSong._() : super();
  factory GrabMicSong({
    $core.int? songId,
    $core.String? songName,
    $core.String? singerName,
    $core.String? brc,
  }) {
    final _result = create();
    if (songId != null) {
      _result.songId = songId;
    }
    if (songName != null) {
      _result.songName = songName;
    }
    if (singerName != null) {
      _result.singerName = singerName;
    }
    if (brc != null) {
      _result.brc = brc;
    }
    return _result;
  }
  factory GrabMicSong.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicSong.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicSong clone() => GrabMicSong()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicSong copyWith(void Function(GrabMicSong) updates) =>
      super.copyWith((message) => updates(message as GrabMicSong))
          as GrabMicSong; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicSong create() => GrabMicSong._();
  GrabMicSong createEmptyInstance() => create();
  static $pb.PbList<GrabMicSong> createRepeated() => $pb.PbList<GrabMicSong>();
  @$core.pragma('dart2js:noInline')
  static GrabMicSong getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicSong>(create);
  static GrabMicSong? _defaultInstance;

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
  $core.String get brc => $_getSZ(3);
  @$pb.TagNumber(4)
  set brc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBrc() => $_has(3);
  @$pb.TagNumber(4)
  void clearBrc() => clearField(4);
}

class GrabMicSongs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicSongs',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GrabMicSong>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: GrabMicSong.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'limit',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GrabMicSongs._() : super();
  factory GrabMicSongs({
    $core.Iterable<GrabMicSong>? list,
    $core.int? limit,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (limit != null) {
      _result.limit = limit;
    }
    return _result;
  }
  factory GrabMicSongs.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicSongs.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicSongs clone() => GrabMicSongs()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicSongs copyWith(void Function(GrabMicSongs) updates) =>
      super.copyWith((message) => updates(message as GrabMicSongs))
          as GrabMicSongs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicSongs create() => GrabMicSongs._();
  GrabMicSongs createEmptyInstance() => create();
  static $pb.PbList<GrabMicSongs> createRepeated() =>
      $pb.PbList<GrabMicSongs>();
  @$core.pragma('dart2js:noInline')
  static GrabMicSongs getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicSongs>(create);
  static GrabMicSongs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GrabMicSong> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);
}

class ResGrabMicSongSearch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGrabMicSongSearch',
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
    ..aOM<GrabMicSongs>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GrabMicSongs.create)
    ..hasRequiredFields = false;

  ResGrabMicSongSearch._() : super();
  factory ResGrabMicSongSearch({
    $core.bool? success,
    $core.String? msg,
    GrabMicSongs? data,
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
  factory ResGrabMicSongSearch.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGrabMicSongSearch.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGrabMicSongSearch clone() =>
      ResGrabMicSongSearch()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGrabMicSongSearch copyWith(void Function(ResGrabMicSongSearch) updates) =>
      super.copyWith((message) => updates(message as ResGrabMicSongSearch))
          as ResGrabMicSongSearch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGrabMicSongSearch create() => ResGrabMicSongSearch._();
  ResGrabMicSongSearch createEmptyInstance() => create();
  static $pb.PbList<ResGrabMicSongSearch> createRepeated() =>
      $pb.PbList<ResGrabMicSongSearch>();
  @$core.pragma('dart2js:noInline')
  static ResGrabMicSongSearch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGrabMicSongSearch>(create);
  static ResGrabMicSongSearch? _defaultInstance;

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
  GrabMicSongs get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GrabMicSongs v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GrabMicSongs ensureData() => $_ensure(2);
}

class ResMySongDel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMySongDel',
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
    ..hasRequiredFields = false;

  ResMySongDel._() : super();
  factory ResMySongDel({
    $core.bool? success,
    $core.String? msg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory ResMySongDel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMySongDel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMySongDel clone() => ResMySongDel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMySongDel copyWith(void Function(ResMySongDel) updates) =>
      super.copyWith((message) => updates(message as ResMySongDel))
          as ResMySongDel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMySongDel create() => ResMySongDel._();
  ResMySongDel createEmptyInstance() => create();
  static $pb.PbList<ResMySongDel> createRepeated() =>
      $pb.PbList<ResMySongDel>();
  @$core.pragma('dart2js:noInline')
  static ResMySongDel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMySongDel>(create);
  static ResMySongDel? _defaultInstance;

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
}

class ResMyAlbumAdd extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMyAlbumAdd',
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
    ..hasRequiredFields = false;

  ResMyAlbumAdd._() : super();
  factory ResMyAlbumAdd({
    $core.bool? success,
    $core.String? msg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory ResMyAlbumAdd.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMyAlbumAdd.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMyAlbumAdd clone() => ResMyAlbumAdd()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMyAlbumAdd copyWith(void Function(ResMyAlbumAdd) updates) =>
      super.copyWith((message) => updates(message as ResMyAlbumAdd))
          as ResMyAlbumAdd; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMyAlbumAdd create() => ResMyAlbumAdd._();
  ResMyAlbumAdd createEmptyInstance() => create();
  static $pb.PbList<ResMyAlbumAdd> createRepeated() =>
      $pb.PbList<ResMyAlbumAdd>();
  @$core.pragma('dart2js:noInline')
  static ResMyAlbumAdd getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMyAlbumAdd>(create);
  static ResMyAlbumAdd? _defaultInstance;

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
}

class ResMyAlbumDel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMyAlbumDel',
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
    ..hasRequiredFields = false;

  ResMyAlbumDel._() : super();
  factory ResMyAlbumDel({
    $core.bool? success,
    $core.String? msg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory ResMyAlbumDel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMyAlbumDel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMyAlbumDel clone() => ResMyAlbumDel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMyAlbumDel copyWith(void Function(ResMyAlbumDel) updates) =>
      super.copyWith((message) => updates(message as ResMyAlbumDel))
          as ResMyAlbumDel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMyAlbumDel create() => ResMyAlbumDel._();
  ResMyAlbumDel createEmptyInstance() => create();
  static $pb.PbList<ResMyAlbumDel> createRepeated() =>
      $pb.PbList<ResMyAlbumDel>();
  @$core.pragma('dart2js:noInline')
  static ResMyAlbumDel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMyAlbumDel>(create);
  static ResMyAlbumDel? _defaultInstance;

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
}

class MyAlbumList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MyAlbumList',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'albumName')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MyAlbumList._() : super();
  factory MyAlbumList({
    $core.int? id,
    $core.String? albumName,
    $core.int? count,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (albumName != null) {
      _result.albumName = albumName;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory MyAlbumList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MyAlbumList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MyAlbumList clone() => MyAlbumList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MyAlbumList copyWith(void Function(MyAlbumList) updates) =>
      super.copyWith((message) => updates(message as MyAlbumList))
          as MyAlbumList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MyAlbumList create() => MyAlbumList._();
  MyAlbumList createEmptyInstance() => create();
  static $pb.PbList<MyAlbumList> createRepeated() => $pb.PbList<MyAlbumList>();
  @$core.pragma('dart2js:noInline')
  static MyAlbumList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MyAlbumList>(create);
  static MyAlbumList? _defaultInstance;

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
  $core.String get albumName => $_getSZ(1);
  @$pb.TagNumber(2)
  set albumName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAlbumName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAlbumName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => clearField(3);
}

class MyAlbums extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MyAlbums',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<MyAlbumList>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: MyAlbumList.create)
    ..hasRequiredFields = false;

  MyAlbums._() : super();
  factory MyAlbums({
    $core.Iterable<MyAlbumList>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory MyAlbums.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MyAlbums.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MyAlbums clone() => MyAlbums()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MyAlbums copyWith(void Function(MyAlbums) updates) =>
      super.copyWith((message) => updates(message as MyAlbums))
          as MyAlbums; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MyAlbums create() => MyAlbums._();
  MyAlbums createEmptyInstance() => create();
  static $pb.PbList<MyAlbums> createRepeated() => $pb.PbList<MyAlbums>();
  @$core.pragma('dart2js:noInline')
  static MyAlbums getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MyAlbums>(create);
  static MyAlbums? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MyAlbumList> get list => $_getList(0);
}

class ResMyAlbumList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMyAlbumList',
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
    ..aOM<MyAlbums>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: MyAlbums.create)
    ..hasRequiredFields = false;

  ResMyAlbumList._() : super();
  factory ResMyAlbumList({
    $core.bool? success,
    $core.String? msg,
    MyAlbums? data,
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
  factory ResMyAlbumList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMyAlbumList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMyAlbumList clone() => ResMyAlbumList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMyAlbumList copyWith(void Function(ResMyAlbumList) updates) =>
      super.copyWith((message) => updates(message as ResMyAlbumList))
          as ResMyAlbumList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMyAlbumList create() => ResMyAlbumList._();
  ResMyAlbumList createEmptyInstance() => create();
  static $pb.PbList<ResMyAlbumList> createRepeated() =>
      $pb.PbList<ResMyAlbumList>();
  @$core.pragma('dart2js:noInline')
  static ResMyAlbumList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMyAlbumList>(create);
  static ResMyAlbumList? _defaultInstance;

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
  MyAlbums get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(MyAlbums v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  MyAlbums ensureData() => $_ensure(2);
}

class ResMyAlbumAddSong extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMyAlbumAddSong',
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
    ..hasRequiredFields = false;

  ResMyAlbumAddSong._() : super();
  factory ResMyAlbumAddSong({
    $core.bool? success,
    $core.String? msg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory ResMyAlbumAddSong.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMyAlbumAddSong.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMyAlbumAddSong clone() => ResMyAlbumAddSong()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMyAlbumAddSong copyWith(void Function(ResMyAlbumAddSong) updates) =>
      super.copyWith((message) => updates(message as ResMyAlbumAddSong))
          as ResMyAlbumAddSong; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMyAlbumAddSong create() => ResMyAlbumAddSong._();
  ResMyAlbumAddSong createEmptyInstance() => create();
  static $pb.PbList<ResMyAlbumAddSong> createRepeated() =>
      $pb.PbList<ResMyAlbumAddSong>();
  @$core.pragma('dart2js:noInline')
  static ResMyAlbumAddSong getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMyAlbumAddSong>(create);
  static ResMyAlbumAddSong? _defaultInstance;

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
}

class ResMyAlbumDelSong extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMyAlbumDelSong',
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
    ..hasRequiredFields = false;

  ResMyAlbumDelSong._() : super();
  factory ResMyAlbumDelSong({
    $core.bool? success,
    $core.String? msg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory ResMyAlbumDelSong.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMyAlbumDelSong.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMyAlbumDelSong clone() => ResMyAlbumDelSong()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMyAlbumDelSong copyWith(void Function(ResMyAlbumDelSong) updates) =>
      super.copyWith((message) => updates(message as ResMyAlbumDelSong))
          as ResMyAlbumDelSong; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMyAlbumDelSong create() => ResMyAlbumDelSong._();
  ResMyAlbumDelSong createEmptyInstance() => create();
  static $pb.PbList<ResMyAlbumDelSong> createRepeated() =>
      $pb.PbList<ResMyAlbumDelSong>();
  @$core.pragma('dart2js:noInline')
  static ResMyAlbumDelSong getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMyAlbumDelSong>(create);
  static ResMyAlbumDelSong? _defaultInstance;

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
}

class MySongList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MySongList',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songName')
    ..hasRequiredFields = false;

  MySongList._() : super();
  factory MySongList({
    $core.int? id,
    $core.String? songName,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (songName != null) {
      _result.songName = songName;
    }
    return _result;
  }
  factory MySongList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MySongList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MySongList clone() => MySongList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MySongList copyWith(void Function(MySongList) updates) =>
      super.copyWith((message) => updates(message as MySongList))
          as MySongList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MySongList create() => MySongList._();
  MySongList createEmptyInstance() => create();
  static $pb.PbList<MySongList> createRepeated() => $pb.PbList<MySongList>();
  @$core.pragma('dart2js:noInline')
  static MySongList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MySongList>(create);
  static MySongList? _defaultInstance;

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
  $core.String get songName => $_getSZ(1);
  @$pb.TagNumber(2)
  set songName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSongName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSongName() => clearField(2);
}

class MySongs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MySongs',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<MySongList>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: MySongList.create)
    ..hasRequiredFields = false;

  MySongs._() : super();
  factory MySongs({
    $core.Iterable<MySongList>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory MySongs.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MySongs.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MySongs clone() => MySongs()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MySongs copyWith(void Function(MySongs) updates) =>
      super.copyWith((message) => updates(message as MySongs))
          as MySongs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MySongs create() => MySongs._();
  MySongs createEmptyInstance() => create();
  static $pb.PbList<MySongs> createRepeated() => $pb.PbList<MySongs>();
  @$core.pragma('dart2js:noInline')
  static MySongs getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MySongs>(create);
  static MySongs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MySongList> get list => $_getList(0);
}

class ResMyAlbumSongList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMyAlbumSongList',
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
    ..aOM<MySongs>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: MySongs.create)
    ..hasRequiredFields = false;

  ResMyAlbumSongList._() : super();
  factory ResMyAlbumSongList({
    $core.bool? success,
    $core.String? msg,
    MySongs? data,
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
  factory ResMyAlbumSongList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMyAlbumSongList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMyAlbumSongList clone() => ResMyAlbumSongList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMyAlbumSongList copyWith(void Function(ResMyAlbumSongList) updates) =>
      super.copyWith((message) => updates(message as ResMyAlbumSongList))
          as ResMyAlbumSongList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMyAlbumSongList create() => ResMyAlbumSongList._();
  ResMyAlbumSongList createEmptyInstance() => create();
  static $pb.PbList<ResMyAlbumSongList> createRepeated() =>
      $pb.PbList<ResMyAlbumSongList>();
  @$core.pragma('dart2js:noInline')
  static ResMyAlbumSongList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMyAlbumSongList>(create);
  static ResMyAlbumSongList? _defaultInstance;

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
  MySongs get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(MySongs v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  MySongs ensureData() => $_ensure(2);
}

class MusicCategory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MusicCategory',
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
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  MusicCategory._() : super();
  factory MusicCategory({
    $core.int? type,
    $core.int? id,
    $core.String? name,
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
    return _result;
  }
  factory MusicCategory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MusicCategory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MusicCategory clone() => MusicCategory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MusicCategory copyWith(void Function(MusicCategory) updates) =>
      super.copyWith((message) => updates(message as MusicCategory))
          as MusicCategory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MusicCategory create() => MusicCategory._();
  MusicCategory createEmptyInstance() => create();
  static $pb.PbList<MusicCategory> createRepeated() =>
      $pb.PbList<MusicCategory>();
  @$core.pragma('dart2js:noInline')
  static MusicCategory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MusicCategory>(create);
  static MusicCategory? _defaultInstance;

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
}

class MusicCategorys extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MusicCategorys',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<MusicCategory>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: MusicCategory.create)
    ..hasRequiredFields = false;

  MusicCategorys._() : super();
  factory MusicCategorys({
    $core.Iterable<MusicCategory>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory MusicCategorys.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MusicCategorys.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MusicCategorys clone() => MusicCategorys()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MusicCategorys copyWith(void Function(MusicCategorys) updates) =>
      super.copyWith((message) => updates(message as MusicCategorys))
          as MusicCategorys; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MusicCategorys create() => MusicCategorys._();
  MusicCategorys createEmptyInstance() => create();
  static $pb.PbList<MusicCategorys> createRepeated() =>
      $pb.PbList<MusicCategorys>();
  @$core.pragma('dart2js:noInline')
  static MusicCategorys getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MusicCategorys>(create);
  static MusicCategorys? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MusicCategory> get list => $_getList(0);
}

class ResReqMusicCategory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResReqMusicCategory',
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
    ..aOM<MusicCategorys>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: MusicCategorys.create)
    ..hasRequiredFields = false;

  ResReqMusicCategory._() : super();
  factory ResReqMusicCategory({
    $core.bool? success,
    $core.String? msg,
    MusicCategorys? data,
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
  factory ResReqMusicCategory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResReqMusicCategory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResReqMusicCategory clone() => ResReqMusicCategory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResReqMusicCategory copyWith(void Function(ResReqMusicCategory) updates) =>
      super.copyWith((message) => updates(message as ResReqMusicCategory))
          as ResReqMusicCategory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResReqMusicCategory create() => ResReqMusicCategory._();
  ResReqMusicCategory createEmptyInstance() => create();
  static $pb.PbList<ResReqMusicCategory> createRepeated() =>
      $pb.PbList<ResReqMusicCategory>();
  @$core.pragma('dart2js:noInline')
  static ResReqMusicCategory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResReqMusicCategory>(create);
  static ResReqMusicCategory? _defaultInstance;

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
  MusicCategorys get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(MusicCategorys v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  MusicCategorys ensureData() => $_ensure(2);
}

class SongCount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SongCount',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'realCount',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'setCount',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SongCount._() : super();
  factory SongCount({
    $core.int? realCount,
    $core.int? setCount,
  }) {
    final _result = create();
    if (realCount != null) {
      _result.realCount = realCount;
    }
    if (setCount != null) {
      _result.setCount = setCount;
    }
    return _result;
  }
  factory SongCount.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SongCount.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SongCount clone() => SongCount()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SongCount copyWith(void Function(SongCount) updates) =>
      super.copyWith((message) => updates(message as SongCount))
          as SongCount; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongCount create() => SongCount._();
  SongCount createEmptyInstance() => create();
  static $pb.PbList<SongCount> createRepeated() => $pb.PbList<SongCount>();
  @$core.pragma('dart2js:noInline')
  static SongCount getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SongCount>(create);
  static SongCount? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get realCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set realCount($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRealCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearRealCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get setCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set setCount($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSetCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearSetCount() => clearField(2);
}

class ResSongCount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSongCount',
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
    ..aOM<SongCount>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SongCount.create)
    ..hasRequiredFields = false;

  ResSongCount._() : super();
  factory ResSongCount({
    $core.bool? success,
    $core.String? msg,
    SongCount? data,
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
  factory ResSongCount.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSongCount.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSongCount clone() => ResSongCount()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSongCount copyWith(void Function(ResSongCount) updates) =>
      super.copyWith((message) => updates(message as ResSongCount))
          as ResSongCount; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSongCount create() => ResSongCount._();
  ResSongCount createEmptyInstance() => create();
  static $pb.PbList<ResSongCount> createRepeated() =>
      $pb.PbList<ResSongCount>();
  @$core.pragma('dart2js:noInline')
  static ResSongCount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSongCount>(create);
  static ResSongCount? _defaultInstance;

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
  SongCount get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SongCount v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SongCount ensureData() => $_ensure(2);
}

class ScoreStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScoreStatus',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ScoreStatus._() : super();
  factory ScoreStatus({
    $core.int? status,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory ScoreStatus.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScoreStatus.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScoreStatus clone() => ScoreStatus()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScoreStatus copyWith(void Function(ScoreStatus) updates) =>
      super.copyWith((message) => updates(message as ScoreStatus))
          as ScoreStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScoreStatus create() => ScoreStatus._();
  ScoreStatus createEmptyInstance() => create();
  static $pb.PbList<ScoreStatus> createRepeated() => $pb.PbList<ScoreStatus>();
  @$core.pragma('dart2js:noInline')
  static ScoreStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScoreStatus>(create);
  static ScoreStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class ResScoreStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResScoreStatus',
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
    ..aOM<ScoreStatus>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ScoreStatus.create)
    ..hasRequiredFields = false;

  ResScoreStatus._() : super();
  factory ResScoreStatus({
    $core.bool? success,
    $core.String? msg,
    ScoreStatus? data,
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
  factory ResScoreStatus.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResScoreStatus.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResScoreStatus clone() => ResScoreStatus()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResScoreStatus copyWith(void Function(ResScoreStatus) updates) =>
      super.copyWith((message) => updates(message as ResScoreStatus))
          as ResScoreStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResScoreStatus create() => ResScoreStatus._();
  ResScoreStatus createEmptyInstance() => create();
  static $pb.PbList<ResScoreStatus> createRepeated() =>
      $pb.PbList<ResScoreStatus>();
  @$core.pragma('dart2js:noInline')
  static ResScoreStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResScoreStatus>(create);
  static ResScoreStatus? _defaultInstance;

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
  ScoreStatus get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ScoreStatus v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ScoreStatus ensureData() => $_ensure(2);
}

class ResReqMakeScore extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResReqMakeScore',
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
    ..hasRequiredFields = false;

  ResReqMakeScore._() : super();
  factory ResReqMakeScore({
    $core.bool? success,
    $core.String? msg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory ResReqMakeScore.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResReqMakeScore.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResReqMakeScore clone() => ResReqMakeScore()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResReqMakeScore copyWith(void Function(ResReqMakeScore) updates) =>
      super.copyWith((message) => updates(message as ResReqMakeScore))
          as ResReqMakeScore; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResReqMakeScore create() => ResReqMakeScore._();
  ResReqMakeScore createEmptyInstance() => create();
  static $pb.PbList<ResReqMakeScore> createRepeated() =>
      $pb.PbList<ResReqMakeScore>();
  @$core.pragma('dart2js:noInline')
  static ResReqMakeScore getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResReqMakeScore>(create);
  static ResReqMakeScore? _defaultInstance;

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
}

class GrabmicScore extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabmicScore',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  GrabmicScore._() : super();
  factory GrabmicScore({
    $core.String? description,
    $core.int? score,
    $core.String? icon,
  }) {
    final _result = create();
    if (description != null) {
      _result.description = description;
    }
    if (score != null) {
      _result.score = score;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory GrabmicScore.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabmicScore.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabmicScore clone() => GrabmicScore()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabmicScore copyWith(void Function(GrabmicScore) updates) =>
      super.copyWith((message) => updates(message as GrabmicScore))
          as GrabmicScore; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabmicScore create() => GrabmicScore._();
  GrabmicScore createEmptyInstance() => create();
  static $pb.PbList<GrabmicScore> createRepeated() =>
      $pb.PbList<GrabmicScore>();
  @$core.pragma('dart2js:noInline')
  static GrabmicScore getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabmicScore>(create);
  static GrabmicScore? _defaultInstance;

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
  $core.int get score => $_getIZ(1);
  @$pb.TagNumber(2)
  set score($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => clearField(2);

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
}

class GrabmicScores extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabmicScores',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GrabmicScore>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: GrabmicScore.create)
    ..hasRequiredFields = false;

  GrabmicScores._() : super();
  factory GrabmicScores({
    $core.Iterable<GrabmicScore>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory GrabmicScores.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabmicScores.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabmicScores clone() => GrabmicScores()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabmicScores copyWith(void Function(GrabmicScores) updates) =>
      super.copyWith((message) => updates(message as GrabmicScores))
          as GrabmicScores; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabmicScores create() => GrabmicScores._();
  GrabmicScores createEmptyInstance() => create();
  static $pb.PbList<GrabmicScores> createRepeated() =>
      $pb.PbList<GrabmicScores>();
  @$core.pragma('dart2js:noInline')
  static GrabmicScores getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabmicScores>(create);
  static GrabmicScores? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GrabmicScore> get list => $_getList(0);
}

class ResScoreList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResScoreList',
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
    ..aOM<GrabmicScores>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GrabmicScores.create)
    ..hasRequiredFields = false;

  ResScoreList._() : super();
  factory ResScoreList({
    $core.bool? success,
    $core.String? msg,
    GrabmicScores? data,
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
  factory ResScoreList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResScoreList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResScoreList clone() => ResScoreList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResScoreList copyWith(void Function(ResScoreList) updates) =>
      super.copyWith((message) => updates(message as ResScoreList))
          as ResScoreList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResScoreList create() => ResScoreList._();
  ResScoreList createEmptyInstance() => create();
  static $pb.PbList<ResScoreList> createRepeated() =>
      $pb.PbList<ResScoreList>();
  @$core.pragma('dart2js:noInline')
  static ResScoreList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResScoreList>(create);
  static ResScoreList? _defaultInstance;

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
  GrabmicScores get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GrabmicScores v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GrabmicScores ensureData() => $_ensure(2);
}

class PowerListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PowerListData',
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
            : 'powerData',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'week',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'day',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PowerListData._() : super();
  factory PowerListData({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? powerData,
    $core.int? week,
    $core.int? day,
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
    if (powerData != null) {
      _result.powerData = powerData;
    }
    if (week != null) {
      _result.week = week;
    }
    if (day != null) {
      _result.day = day;
    }
    return _result;
  }
  factory PowerListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PowerListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PowerListData clone() => PowerListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PowerListData copyWith(void Function(PowerListData) updates) =>
      super.copyWith((message) => updates(message as PowerListData))
          as PowerListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PowerListData create() => PowerListData._();
  PowerListData createEmptyInstance() => create();
  static $pb.PbList<PowerListData> createRepeated() =>
      $pb.PbList<PowerListData>();
  @$core.pragma('dart2js:noInline')
  static PowerListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PowerListData>(create);
  static PowerListData? _defaultInstance;

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
  $core.int get powerData => $_getIZ(3);
  @$pb.TagNumber(4)
  set powerData($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPowerData() => $_has(3);
  @$pb.TagNumber(4)
  void clearPowerData() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get week => $_getIZ(4);
  @$pb.TagNumber(5)
  set week($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasWeek() => $_has(4);
  @$pb.TagNumber(5)
  void clearWeek() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get day => $_getIZ(5);
  @$pb.TagNumber(6)
  set day($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDay() => $_has(5);
  @$pb.TagNumber(6)
  void clearDay() => clearField(6);
}

class GrabmicPowerData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabmicPowerData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PowerListData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: PowerListData.create)
    ..hasRequiredFields = false;

  GrabmicPowerData._() : super();
  factory GrabmicPowerData({
    $core.Iterable<PowerListData>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory GrabmicPowerData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabmicPowerData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabmicPowerData clone() => GrabmicPowerData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabmicPowerData copyWith(void Function(GrabmicPowerData) updates) =>
      super.copyWith((message) => updates(message as GrabmicPowerData))
          as GrabmicPowerData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabmicPowerData create() => GrabmicPowerData._();
  GrabmicPowerData createEmptyInstance() => create();
  static $pb.PbList<GrabmicPowerData> createRepeated() =>
      $pb.PbList<GrabmicPowerData>();
  @$core.pragma('dart2js:noInline')
  static GrabmicPowerData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabmicPowerData>(create);
  static GrabmicPowerData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PowerListData> get list => $_getList(0);
}

class ResPowerList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResPowerList',
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
    ..aOM<GrabmicPowerData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GrabmicPowerData.create)
    ..hasRequiredFields = false;

  ResPowerList._() : super();
  factory ResPowerList({
    $core.bool? success,
    $core.String? msg,
    GrabmicPowerData? data,
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
  factory ResPowerList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResPowerList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResPowerList clone() => ResPowerList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResPowerList copyWith(void Function(ResPowerList) updates) =>
      super.copyWith((message) => updates(message as ResPowerList))
          as ResPowerList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResPowerList create() => ResPowerList._();
  ResPowerList createEmptyInstance() => create();
  static $pb.PbList<ResPowerList> createRepeated() =>
      $pb.PbList<ResPowerList>();
  @$core.pragma('dart2js:noInline')
  static ResPowerList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResPowerList>(create);
  static ResPowerList? _defaultInstance;

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
  GrabmicPowerData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GrabmicPowerData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GrabmicPowerData ensureData() => $_ensure(2);
}

class LeadSingerListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LeadSingerListData',
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
            : 'leadData',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  LeadSingerListData._() : super();
  factory LeadSingerListData({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? leadData,
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
    if (leadData != null) {
      _result.leadData = leadData;
    }
    return _result;
  }
  factory LeadSingerListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LeadSingerListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LeadSingerListData clone() => LeadSingerListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LeadSingerListData copyWith(void Function(LeadSingerListData) updates) =>
      super.copyWith((message) => updates(message as LeadSingerListData))
          as LeadSingerListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LeadSingerListData create() => LeadSingerListData._();
  LeadSingerListData createEmptyInstance() => create();
  static $pb.PbList<LeadSingerListData> createRepeated() =>
      $pb.PbList<LeadSingerListData>();
  @$core.pragma('dart2js:noInline')
  static LeadSingerListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeadSingerListData>(create);
  static LeadSingerListData? _defaultInstance;

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
  $core.int get leadData => $_getIZ(3);
  @$pb.TagNumber(4)
  set leadData($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLeadData() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeadData() => clearField(4);
}

class GrabmicLeadSingerData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabmicLeadSingerData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<LeadSingerListData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: LeadSingerListData.create)
    ..hasRequiredFields = false;

  GrabmicLeadSingerData._() : super();
  factory GrabmicLeadSingerData({
    $core.Iterable<LeadSingerListData>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory GrabmicLeadSingerData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabmicLeadSingerData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabmicLeadSingerData clone() =>
      GrabmicLeadSingerData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabmicLeadSingerData copyWith(
          void Function(GrabmicLeadSingerData) updates) =>
      super.copyWith((message) => updates(message as GrabmicLeadSingerData))
          as GrabmicLeadSingerData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabmicLeadSingerData create() => GrabmicLeadSingerData._();
  GrabmicLeadSingerData createEmptyInstance() => create();
  static $pb.PbList<GrabmicLeadSingerData> createRepeated() =>
      $pb.PbList<GrabmicLeadSingerData>();
  @$core.pragma('dart2js:noInline')
  static GrabmicLeadSingerData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabmicLeadSingerData>(create);
  static GrabmicLeadSingerData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<LeadSingerListData> get list => $_getList(0);
}

class ResLeadSingerList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResLeadSingerList',
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
    ..aOM<GrabmicLeadSingerData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GrabmicLeadSingerData.create)
    ..hasRequiredFields = false;

  ResLeadSingerList._() : super();
  factory ResLeadSingerList({
    $core.bool? success,
    $core.String? msg,
    GrabmicLeadSingerData? data,
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
  factory ResLeadSingerList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResLeadSingerList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResLeadSingerList clone() => ResLeadSingerList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResLeadSingerList copyWith(void Function(ResLeadSingerList) updates) =>
      super.copyWith((message) => updates(message as ResLeadSingerList))
          as ResLeadSingerList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResLeadSingerList create() => ResLeadSingerList._();
  ResLeadSingerList createEmptyInstance() => create();
  static $pb.PbList<ResLeadSingerList> createRepeated() =>
      $pb.PbList<ResLeadSingerList>();
  @$core.pragma('dart2js:noInline')
  static ResLeadSingerList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResLeadSingerList>(create);
  static ResLeadSingerList? _defaultInstance;

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
  GrabmicLeadSingerData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GrabmicLeadSingerData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GrabmicLeadSingerData ensureData() => $_ensure(2);
}

class GrabMicMakeScoreMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicMakeScoreMessage',
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
            : 'singerUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scoreIcon',
        protoName: 'scoreIcon')
    ..hasRequiredFields = false;

  GrabMicMakeScoreMessage._() : super();
  factory GrabMicMakeScoreMessage({
    $core.int? uid,
    $core.String? icon,
    $core.int? singerUid,
    $core.int? score,
    $core.String? description,
    $core.String? scoreIcon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (singerUid != null) {
      _result.singerUid = singerUid;
    }
    if (score != null) {
      _result.score = score;
    }
    if (description != null) {
      _result.description = description;
    }
    if (scoreIcon != null) {
      _result.scoreIcon = scoreIcon;
    }
    return _result;
  }
  factory GrabMicMakeScoreMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicMakeScoreMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicMakeScoreMessage clone() =>
      GrabMicMakeScoreMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicMakeScoreMessage copyWith(
          void Function(GrabMicMakeScoreMessage) updates) =>
      super.copyWith((message) => updates(message as GrabMicMakeScoreMessage))
          as GrabMicMakeScoreMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicMakeScoreMessage create() => GrabMicMakeScoreMessage._();
  GrabMicMakeScoreMessage createEmptyInstance() => create();
  static $pb.PbList<GrabMicMakeScoreMessage> createRepeated() =>
      $pb.PbList<GrabMicMakeScoreMessage>();
  @$core.pragma('dart2js:noInline')
  static GrabMicMakeScoreMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicMakeScoreMessage>(create);
  static GrabMicMakeScoreMessage? _defaultInstance;

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
  $core.int get singerUid => $_getIZ(2);
  @$pb.TagNumber(3)
  set singerUid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSingerUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearSingerUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get score => $_getIZ(3);
  @$pb.TagNumber(4)
  set score($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get scoreIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set scoreIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasScoreIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearScoreIcon() => clearField(6);
}

class GrabMicAlbumAuth extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicAlbumAuth',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'albumAuth')
    ..hasRequiredFields = false;

  GrabMicAlbumAuth._() : super();
  factory GrabMicAlbumAuth({
    $core.bool? albumAuth,
  }) {
    final _result = create();
    if (albumAuth != null) {
      _result.albumAuth = albumAuth;
    }
    return _result;
  }
  factory GrabMicAlbumAuth.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicAlbumAuth.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicAlbumAuth clone() => GrabMicAlbumAuth()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicAlbumAuth copyWith(void Function(GrabMicAlbumAuth) updates) =>
      super.copyWith((message) => updates(message as GrabMicAlbumAuth))
          as GrabMicAlbumAuth; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicAlbumAuth create() => GrabMicAlbumAuth._();
  GrabMicAlbumAuth createEmptyInstance() => create();
  static $pb.PbList<GrabMicAlbumAuth> createRepeated() =>
      $pb.PbList<GrabMicAlbumAuth>();
  @$core.pragma('dart2js:noInline')
  static GrabMicAlbumAuth getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicAlbumAuth>(create);
  static GrabMicAlbumAuth? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get albumAuth => $_getBF(0);
  @$pb.TagNumber(1)
  set albumAuth($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAlbumAuth() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlbumAuth() => clearField(1);
}

class ResGrabMicAlbumAuth extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGrabMicAlbumAuth',
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
    ..aOM<GrabMicAlbumAuth>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GrabMicAlbumAuth.create)
    ..hasRequiredFields = false;

  ResGrabMicAlbumAuth._() : super();
  factory ResGrabMicAlbumAuth({
    $core.bool? success,
    $core.String? msg,
    GrabMicAlbumAuth? data,
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
  factory ResGrabMicAlbumAuth.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGrabMicAlbumAuth.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGrabMicAlbumAuth clone() => ResGrabMicAlbumAuth()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGrabMicAlbumAuth copyWith(void Function(ResGrabMicAlbumAuth) updates) =>
      super.copyWith((message) => updates(message as ResGrabMicAlbumAuth))
          as ResGrabMicAlbumAuth; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGrabMicAlbumAuth create() => ResGrabMicAlbumAuth._();
  ResGrabMicAlbumAuth createEmptyInstance() => create();
  static $pb.PbList<ResGrabMicAlbumAuth> createRepeated() =>
      $pb.PbList<ResGrabMicAlbumAuth>();
  @$core.pragma('dart2js:noInline')
  static ResGrabMicAlbumAuth getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGrabMicAlbumAuth>(create);
  static ResGrabMicAlbumAuth? _defaultInstance;

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
  GrabMicAlbumAuth get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GrabMicAlbumAuth v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GrabMicAlbumAuth ensureData() => $_ensure(2);
}

class IdolSingerListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'IdolSingerListData',
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
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftValue',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'distanceOnList',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'week',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'day',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  IdolSingerListData._() : super();
  factory IdolSingerListData({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.int? age,
    $core.int? giftValue,
    $core.int? rank,
    $core.int? distanceOnList,
    $core.int? week,
    $core.int? day,
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
    if (age != null) {
      _result.age = age;
    }
    if (giftValue != null) {
      _result.giftValue = giftValue;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (distanceOnList != null) {
      _result.distanceOnList = distanceOnList;
    }
    if (week != null) {
      _result.week = week;
    }
    if (day != null) {
      _result.day = day;
    }
    return _result;
  }
  factory IdolSingerListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IdolSingerListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IdolSingerListData clone() => IdolSingerListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IdolSingerListData copyWith(void Function(IdolSingerListData) updates) =>
      super.copyWith((message) => updates(message as IdolSingerListData))
          as IdolSingerListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IdolSingerListData create() => IdolSingerListData._();
  IdolSingerListData createEmptyInstance() => create();
  static $pb.PbList<IdolSingerListData> createRepeated() =>
      $pb.PbList<IdolSingerListData>();
  @$core.pragma('dart2js:noInline')
  static IdolSingerListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IdolSingerListData>(create);
  static IdolSingerListData? _defaultInstance;

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
  $core.int get sex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get age => $_getIZ(4);
  @$pb.TagNumber(5)
  set age($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAge() => $_has(4);
  @$pb.TagNumber(5)
  void clearAge() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get giftValue => $_getIZ(5);
  @$pb.TagNumber(6)
  set giftValue($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGiftValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftValue() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get rank => $_getIZ(6);
  @$pb.TagNumber(7)
  set rank($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRank() => $_has(6);
  @$pb.TagNumber(7)
  void clearRank() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get distanceOnList => $_getIZ(7);
  @$pb.TagNumber(8)
  set distanceOnList($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDistanceOnList() => $_has(7);
  @$pb.TagNumber(8)
  void clearDistanceOnList() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get week => $_getIZ(8);
  @$pb.TagNumber(9)
  set week($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasWeek() => $_has(8);
  @$pb.TagNumber(9)
  void clearWeek() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get day => $_getIZ(9);
  @$pb.TagNumber(10)
  set day($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDay() => $_has(9);
  @$pb.TagNumber(10)
  void clearDay() => clearField(10);
}

class GrabmicIdolSingerData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabmicIdolSingerData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<IdolSingerListData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: IdolSingerListData.create)
    ..aOM<IdolSingerListData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'myself',
        subBuilder: IdolSingerListData.create)
    ..hasRequiredFields = false;

  GrabmicIdolSingerData._() : super();
  factory GrabmicIdolSingerData({
    $core.Iterable<IdolSingerListData>? list,
    IdolSingerListData? myself,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (myself != null) {
      _result.myself = myself;
    }
    return _result;
  }
  factory GrabmicIdolSingerData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabmicIdolSingerData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabmicIdolSingerData clone() =>
      GrabmicIdolSingerData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabmicIdolSingerData copyWith(
          void Function(GrabmicIdolSingerData) updates) =>
      super.copyWith((message) => updates(message as GrabmicIdolSingerData))
          as GrabmicIdolSingerData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabmicIdolSingerData create() => GrabmicIdolSingerData._();
  GrabmicIdolSingerData createEmptyInstance() => create();
  static $pb.PbList<GrabmicIdolSingerData> createRepeated() =>
      $pb.PbList<GrabmicIdolSingerData>();
  @$core.pragma('dart2js:noInline')
  static GrabmicIdolSingerData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabmicIdolSingerData>(create);
  static GrabmicIdolSingerData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<IdolSingerListData> get list => $_getList(0);

  @$pb.TagNumber(2)
  IdolSingerListData get myself => $_getN(1);
  @$pb.TagNumber(2)
  set myself(IdolSingerListData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMyself() => $_has(1);
  @$pb.TagNumber(2)
  void clearMyself() => clearField(2);
  @$pb.TagNumber(2)
  IdolSingerListData ensureMyself() => $_ensure(1);
}

class ResIdolSingerList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResIdolSingerList',
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
    ..aOM<GrabmicIdolSingerData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GrabmicIdolSingerData.create)
    ..hasRequiredFields = false;

  ResIdolSingerList._() : super();
  factory ResIdolSingerList({
    $core.bool? success,
    $core.String? msg,
    GrabmicIdolSingerData? data,
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
  factory ResIdolSingerList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResIdolSingerList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResIdolSingerList clone() => ResIdolSingerList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResIdolSingerList copyWith(void Function(ResIdolSingerList) updates) =>
      super.copyWith((message) => updates(message as ResIdolSingerList))
          as ResIdolSingerList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResIdolSingerList create() => ResIdolSingerList._();
  ResIdolSingerList createEmptyInstance() => create();
  static $pb.PbList<ResIdolSingerList> createRepeated() =>
      $pb.PbList<ResIdolSingerList>();
  @$core.pragma('dart2js:noInline')
  static ResIdolSingerList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResIdolSingerList>(create);
  static ResIdolSingerList? _defaultInstance;

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
  GrabmicIdolSingerData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GrabmicIdolSingerData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GrabmicIdolSingerData ensureData() => $_ensure(2);
}
