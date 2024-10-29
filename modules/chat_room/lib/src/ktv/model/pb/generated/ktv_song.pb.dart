///
//  Generated code. Do not modify.
//  source: ktv_song.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResKtvSongList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResKtvSongList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'slp'),
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
    ..aOM<KtvSongListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: KtvSongListData.create)
    ..hasRequiredFields = false;

  ResKtvSongList._() : super();
  factory ResKtvSongList({
    $core.bool? success,
    $core.String? msg,
    KtvSongListData? data,
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
  factory ResKtvSongList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResKtvSongList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResKtvSongList clone() => ResKtvSongList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResKtvSongList copyWith(void Function(ResKtvSongList) updates) =>
      super.copyWith((message) => updates(message as ResKtvSongList))
          as ResKtvSongList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResKtvSongList create() => ResKtvSongList._();
  ResKtvSongList createEmptyInstance() => create();
  static $pb.PbList<ResKtvSongList> createRepeated() =>
      $pb.PbList<ResKtvSongList>();
  @$core.pragma('dart2js:noInline')
  static ResKtvSongList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResKtvSongList>(create);
  static ResKtvSongList? _defaultInstance;

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
  KtvSongListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(KtvSongListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  KtvSongListData ensureData() => $_ensure(2);
}

class KtvSongListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvSongListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'slp'),
      createEmptyInstance: create)
    ..pc<KtvSongItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: KtvSongItem.create)
    ..pc<KtvSongListTab>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabs',
        $pb.PbFieldType.PM,
        subBuilder: KtvSongListTab.create)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showSearch')
    ..hasRequiredFields = false;

  KtvSongListData._() : super();
  factory KtvSongListData({
    $core.Iterable<KtvSongItem>? list,
    $core.Iterable<KtvSongListTab>? tabs,
    $core.bool? showSearch,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (tabs != null) {
      _result.tabs.addAll(tabs);
    }
    if (showSearch != null) {
      _result.showSearch = showSearch;
    }
    return _result;
  }
  factory KtvSongListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvSongListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvSongListData clone() => KtvSongListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvSongListData copyWith(void Function(KtvSongListData) updates) =>
      super.copyWith((message) => updates(message as KtvSongListData))
          as KtvSongListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvSongListData create() => KtvSongListData._();
  KtvSongListData createEmptyInstance() => create();
  static $pb.PbList<KtvSongListData> createRepeated() =>
      $pb.PbList<KtvSongListData>();
  @$core.pragma('dart2js:noInline')
  static KtvSongListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvSongListData>(create);
  static KtvSongListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<KtvSongItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<KtvSongListTab> get tabs => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get showSearch => $_getBF(2);
  @$pb.TagNumber(3)
  set showSearch($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShowSearch() => $_has(2);
  @$pb.TagNumber(3)
  void clearShowSearch() => clearField(3);
}

class KtvSongListTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvSongListTab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'slp'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  KtvSongListTab._() : super();
  factory KtvSongListTab({
    $core.String? title,
    $core.int? type,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory KtvSongListTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvSongListTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvSongListTab clone() => KtvSongListTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvSongListTab copyWith(void Function(KtvSongListTab) updates) =>
      super.copyWith((message) => updates(message as KtvSongListTab))
          as KtvSongListTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvSongListTab create() => KtvSongListTab._();
  KtvSongListTab createEmptyInstance() => create();
  static $pb.PbList<KtvSongListTab> createRepeated() =>
      $pb.PbList<KtvSongListTab>();
  @$core.pragma('dart2js:noInline')
  static KtvSongListTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvSongListTab>(create);
  static KtvSongListTab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);
}

class KtvSongItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KtvSongItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'slp'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Id',
        $pb.PbFieldType.OU3,
        protoName: 'Id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Name',
        protoName: 'Name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Photo',
        protoName: 'Photo')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'SingerId',
        $pb.PbFieldType.OU3,
        protoName: 'SingerId')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'SingerName',
        protoName: 'SingerName')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'OriginalMp3',
        protoName: 'OriginalMp3')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Size',
        $pb.PbFieldType.OU3,
        protoName: 'Size')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Playtime',
        $pb.PbFieldType.OU3,
        protoName: 'Playtime')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'HqMusic',
        protoName: 'HqMusic')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'HqSize',
        $pb.PbFieldType.OU3,
        protoName: 'HqSize')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'HqPlaytime',
        $pb.PbFieldType.OU3,
        protoName: 'HqPlaytime')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Brc',
        protoName: 'Brc')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'UploaderUid',
        $pb.PbFieldType.OU3,
        protoName: 'UploaderUid')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'UploaderName',
        protoName: 'UploaderName')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Tag',
        protoName: 'Tag')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Type',
        protoName: 'Type')
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Status',
        $pb.PbFieldType.O3,
        protoName: 'Status')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Language',
        protoName: 'Language')
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'HqStatus',
        $pb.PbFieldType.O3,
        protoName: 'HqStatus')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Dateline',
        $pb.PbFieldType.OU3,
        protoName: 'Dateline')
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Updateline',
        $pb.PbFieldType.OU3,
        protoName: 'Updateline')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Platform',
        protoName: 'Platform')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'PlatformSongId',
        protoName: 'PlatformSongId')
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'PlatformRankId',
        $pb.PbFieldType.O3,
        protoName: 'PlatformRankId')
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'OrderedCount',
        $pb.PbFieldType.O3,
        protoName: 'OrderedCount')
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'SingCount',
        $pb.PbFieldType.O3,
        protoName: 'SingCount')
    ..aOS(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'musicId')
    ..aOS(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'orderUname')
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'choosed',
        $pb.PbFieldType.O3)
    ..aOS(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'statusDescription')
    ..hasRequiredFields = false;

  KtvSongItem._() : super();
  factory KtvSongItem({
    $core.int? id,
    $core.String? name,
    $core.String? photo,
    $core.int? singerId,
    $core.String? singerName,
    $core.String? originalMp3,
    $core.int? size,
    $core.int? playtime,
    $core.String? hqMusic,
    $core.int? hqSize,
    $core.int? hqPlaytime,
    $core.String? brc,
    $core.int? uploaderUid,
    $core.String? uploaderName,
    $core.String? tag,
    $core.String? type,
    $core.int? status,
    $core.String? language,
    $core.int? hqStatus,
    $core.int? dateline,
    $core.int? updateline,
    $core.String? platform,
    $core.String? platformSongId,
    $core.int? platformRankId,
    $core.int? orderedCount,
    $core.int? singCount,
    $core.String? musicId,
    $core.String? orderUname,
    $core.int? choosed,
    $core.String? statusDescription,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (photo != null) {
      _result.photo = photo;
    }
    if (singerId != null) {
      _result.singerId = singerId;
    }
    if (singerName != null) {
      _result.singerName = singerName;
    }
    if (originalMp3 != null) {
      _result.originalMp3 = originalMp3;
    }
    if (size != null) {
      _result.size = size;
    }
    if (playtime != null) {
      _result.playtime = playtime;
    }
    if (hqMusic != null) {
      _result.hqMusic = hqMusic;
    }
    if (hqSize != null) {
      _result.hqSize = hqSize;
    }
    if (hqPlaytime != null) {
      _result.hqPlaytime = hqPlaytime;
    }
    if (brc != null) {
      _result.brc = brc;
    }
    if (uploaderUid != null) {
      _result.uploaderUid = uploaderUid;
    }
    if (uploaderName != null) {
      _result.uploaderName = uploaderName;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (type != null) {
      _result.type = type;
    }
    if (status != null) {
      _result.status = status;
    }
    if (language != null) {
      _result.language = language;
    }
    if (hqStatus != null) {
      _result.hqStatus = hqStatus;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (updateline != null) {
      _result.updateline = updateline;
    }
    if (platform != null) {
      _result.platform = platform;
    }
    if (platformSongId != null) {
      _result.platformSongId = platformSongId;
    }
    if (platformRankId != null) {
      _result.platformRankId = platformRankId;
    }
    if (orderedCount != null) {
      _result.orderedCount = orderedCount;
    }
    if (singCount != null) {
      _result.singCount = singCount;
    }
    if (musicId != null) {
      _result.musicId = musicId;
    }
    if (orderUname != null) {
      _result.orderUname = orderUname;
    }
    if (choosed != null) {
      _result.choosed = choosed;
    }
    if (statusDescription != null) {
      _result.statusDescription = statusDescription;
    }
    return _result;
  }
  factory KtvSongItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KtvSongItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KtvSongItem clone() => KtvSongItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KtvSongItem copyWith(void Function(KtvSongItem) updates) =>
      super.copyWith((message) => updates(message as KtvSongItem))
          as KtvSongItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KtvSongItem create() => KtvSongItem._();
  KtvSongItem createEmptyInstance() => create();
  static $pb.PbList<KtvSongItem> createRepeated() => $pb.PbList<KtvSongItem>();
  @$core.pragma('dart2js:noInline')
  static KtvSongItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvSongItem>(create);
  static KtvSongItem? _defaultInstance;

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
  $core.String get photo => $_getSZ(2);
  @$pb.TagNumber(3)
  set photo($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPhoto() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhoto() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get singerId => $_getIZ(3);
  @$pb.TagNumber(4)
  set singerId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSingerId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSingerId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get singerName => $_getSZ(4);
  @$pb.TagNumber(5)
  set singerName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSingerName() => $_has(4);
  @$pb.TagNumber(5)
  void clearSingerName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get originalMp3 => $_getSZ(5);
  @$pb.TagNumber(6)
  set originalMp3($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOriginalMp3() => $_has(5);
  @$pb.TagNumber(6)
  void clearOriginalMp3() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get size => $_getIZ(6);
  @$pb.TagNumber(7)
  set size($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSize() => $_has(6);
  @$pb.TagNumber(7)
  void clearSize() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get playtime => $_getIZ(7);
  @$pb.TagNumber(8)
  set playtime($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPlaytime() => $_has(7);
  @$pb.TagNumber(8)
  void clearPlaytime() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get hqMusic => $_getSZ(8);
  @$pb.TagNumber(9)
  set hqMusic($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasHqMusic() => $_has(8);
  @$pb.TagNumber(9)
  void clearHqMusic() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get hqSize => $_getIZ(9);
  @$pb.TagNumber(10)
  set hqSize($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasHqSize() => $_has(9);
  @$pb.TagNumber(10)
  void clearHqSize() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get hqPlaytime => $_getIZ(10);
  @$pb.TagNumber(11)
  set hqPlaytime($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasHqPlaytime() => $_has(10);
  @$pb.TagNumber(11)
  void clearHqPlaytime() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get brc => $_getSZ(11);
  @$pb.TagNumber(12)
  set brc($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasBrc() => $_has(11);
  @$pb.TagNumber(12)
  void clearBrc() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get uploaderUid => $_getIZ(12);
  @$pb.TagNumber(13)
  set uploaderUid($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasUploaderUid() => $_has(12);
  @$pb.TagNumber(13)
  void clearUploaderUid() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get uploaderName => $_getSZ(13);
  @$pb.TagNumber(14)
  set uploaderName($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasUploaderName() => $_has(13);
  @$pb.TagNumber(14)
  void clearUploaderName() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get tag => $_getSZ(14);
  @$pb.TagNumber(15)
  set tag($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasTag() => $_has(14);
  @$pb.TagNumber(15)
  void clearTag() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get type => $_getSZ(15);
  @$pb.TagNumber(16)
  set type($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasType() => $_has(15);
  @$pb.TagNumber(16)
  void clearType() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get status => $_getIZ(16);
  @$pb.TagNumber(17)
  set status($core.int v) {
    $_setSignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasStatus() => $_has(16);
  @$pb.TagNumber(17)
  void clearStatus() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get language => $_getSZ(17);
  @$pb.TagNumber(18)
  set language($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasLanguage() => $_has(17);
  @$pb.TagNumber(18)
  void clearLanguage() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get hqStatus => $_getIZ(18);
  @$pb.TagNumber(19)
  set hqStatus($core.int v) {
    $_setSignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasHqStatus() => $_has(18);
  @$pb.TagNumber(19)
  void clearHqStatus() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get dateline => $_getIZ(19);
  @$pb.TagNumber(20)
  set dateline($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasDateline() => $_has(19);
  @$pb.TagNumber(20)
  void clearDateline() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get updateline => $_getIZ(20);
  @$pb.TagNumber(21)
  set updateline($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasUpdateline() => $_has(20);
  @$pb.TagNumber(21)
  void clearUpdateline() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get platform => $_getSZ(21);
  @$pb.TagNumber(22)
  set platform($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasPlatform() => $_has(21);
  @$pb.TagNumber(22)
  void clearPlatform() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get platformSongId => $_getSZ(22);
  @$pb.TagNumber(23)
  set platformSongId($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasPlatformSongId() => $_has(22);
  @$pb.TagNumber(23)
  void clearPlatformSongId() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get platformRankId => $_getIZ(23);
  @$pb.TagNumber(24)
  set platformRankId($core.int v) {
    $_setSignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasPlatformRankId() => $_has(23);
  @$pb.TagNumber(24)
  void clearPlatformRankId() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get orderedCount => $_getIZ(24);
  @$pb.TagNumber(25)
  set orderedCount($core.int v) {
    $_setSignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasOrderedCount() => $_has(24);
  @$pb.TagNumber(25)
  void clearOrderedCount() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get singCount => $_getIZ(25);
  @$pb.TagNumber(26)
  set singCount($core.int v) {
    $_setSignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasSingCount() => $_has(25);
  @$pb.TagNumber(26)
  void clearSingCount() => clearField(26);

  @$pb.TagNumber(27)
  $core.String get musicId => $_getSZ(26);
  @$pb.TagNumber(27)
  set musicId($core.String v) {
    $_setString(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasMusicId() => $_has(26);
  @$pb.TagNumber(27)
  void clearMusicId() => clearField(27);

  @$pb.TagNumber(28)
  $core.String get orderUname => $_getSZ(27);
  @$pb.TagNumber(28)
  set orderUname($core.String v) {
    $_setString(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasOrderUname() => $_has(27);
  @$pb.TagNumber(28)
  void clearOrderUname() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get choosed => $_getIZ(28);
  @$pb.TagNumber(29)
  set choosed($core.int v) {
    $_setSignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasChoosed() => $_has(28);
  @$pb.TagNumber(29)
  void clearChoosed() => clearField(29);

  @$pb.TagNumber(30)
  $core.String get statusDescription => $_getSZ(29);
  @$pb.TagNumber(30)
  set statusDescription($core.String v) {
    $_setString(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasStatusDescription() => $_has(29);
  @$pb.TagNumber(30)
  void clearStatusDescription() => clearField(30);
}
