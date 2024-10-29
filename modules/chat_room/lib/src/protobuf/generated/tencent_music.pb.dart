///
//  Generated code. Do not modify.
//  source: tencent_music.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TemUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TemUserInfo',
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
            : 'temPid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'temSp')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'temUid')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'temToken')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tokenExpireTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vipExpireTime',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deviceId')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'clientIp')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'temRoomId')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkg')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'anchorid')
    ..hasRequiredFields = false;

  TemUserInfo._() : super();
  factory TemUserInfo({
    $core.int? uid,
    $core.String? temPid,
    $core.String? temSp,
    $core.String? temUid,
    $core.String? temToken,
    $core.int? tokenExpireTime,
    $core.int? vipExpireTime,
    $core.String? deviceId,
    $core.String? clientIp,
    $core.String? temRoomId,
    $core.String? pkg,
    $core.String? anchorid,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (temPid != null) {
      _result.temPid = temPid;
    }
    if (temSp != null) {
      _result.temSp = temSp;
    }
    if (temUid != null) {
      _result.temUid = temUid;
    }
    if (temToken != null) {
      _result.temToken = temToken;
    }
    if (tokenExpireTime != null) {
      _result.tokenExpireTime = tokenExpireTime;
    }
    if (vipExpireTime != null) {
      _result.vipExpireTime = vipExpireTime;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (clientIp != null) {
      _result.clientIp = clientIp;
    }
    if (temRoomId != null) {
      _result.temRoomId = temRoomId;
    }
    if (pkg != null) {
      _result.pkg = pkg;
    }
    if (anchorid != null) {
      _result.anchorid = anchorid;
    }
    return _result;
  }
  factory TemUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TemUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TemUserInfo clone() => TemUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TemUserInfo copyWith(void Function(TemUserInfo) updates) =>
      super.copyWith((message) => updates(message as TemUserInfo))
          as TemUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TemUserInfo create() => TemUserInfo._();
  TemUserInfo createEmptyInstance() => create();
  static $pb.PbList<TemUserInfo> createRepeated() => $pb.PbList<TemUserInfo>();
  @$core.pragma('dart2js:noInline')
  static TemUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TemUserInfo>(create);
  static TemUserInfo? _defaultInstance;

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
  $core.String get temPid => $_getSZ(1);
  @$pb.TagNumber(2)
  set temPid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTemPid() => $_has(1);
  @$pb.TagNumber(2)
  void clearTemPid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get temSp => $_getSZ(2);
  @$pb.TagNumber(3)
  set temSp($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTemSp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTemSp() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get temUid => $_getSZ(3);
  @$pb.TagNumber(4)
  set temUid($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTemUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearTemUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get temToken => $_getSZ(4);
  @$pb.TagNumber(5)
  set temToken($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTemToken() => $_has(4);
  @$pb.TagNumber(5)
  void clearTemToken() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get tokenExpireTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set tokenExpireTime($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTokenExpireTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearTokenExpireTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get vipExpireTime => $_getIZ(6);
  @$pb.TagNumber(7)
  set vipExpireTime($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasVipExpireTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearVipExpireTime() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get deviceId => $_getSZ(7);
  @$pb.TagNumber(8)
  set deviceId($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDeviceId() => $_has(7);
  @$pb.TagNumber(8)
  void clearDeviceId() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get clientIp => $_getSZ(8);
  @$pb.TagNumber(9)
  set clientIp($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasClientIp() => $_has(8);
  @$pb.TagNumber(9)
  void clearClientIp() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get temRoomId => $_getSZ(9);
  @$pb.TagNumber(10)
  set temRoomId($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTemRoomId() => $_has(9);
  @$pb.TagNumber(10)
  void clearTemRoomId() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get pkg => $_getSZ(10);
  @$pb.TagNumber(11)
  set pkg($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPkg() => $_has(10);
  @$pb.TagNumber(11)
  void clearPkg() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get anchorid => $_getSZ(11);
  @$pb.TagNumber(12)
  set anchorid($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasAnchorid() => $_has(11);
  @$pb.TagNumber(12)
  void clearAnchorid() => clearField(12);
}

class RepTemUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RepTemUserInfo',
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
    ..aOM<TemUserInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'temUserInfo',
        subBuilder: TemUserInfo.create)
    ..hasRequiredFields = false;

  RepTemUserInfo._() : super();
  factory RepTemUserInfo({
    $core.bool? success,
    $core.String? msg,
    TemUserInfo? temUserInfo,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (temUserInfo != null) {
      _result.temUserInfo = temUserInfo;
    }
    return _result;
  }
  factory RepTemUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RepTemUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RepTemUserInfo clone() => RepTemUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RepTemUserInfo copyWith(void Function(RepTemUserInfo) updates) =>
      super.copyWith((message) => updates(message as RepTemUserInfo))
          as RepTemUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RepTemUserInfo create() => RepTemUserInfo._();
  RepTemUserInfo createEmptyInstance() => create();
  static $pb.PbList<RepTemUserInfo> createRepeated() =>
      $pb.PbList<RepTemUserInfo>();
  @$core.pragma('dart2js:noInline')
  static RepTemUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RepTemUserInfo>(create);
  static RepTemUserInfo? _defaultInstance;

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
  TemUserInfo get temUserInfo => $_getN(2);
  @$pb.TagNumber(3)
  set temUserInfo(TemUserInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTemUserInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTemUserInfo() => clearField(3);
  @$pb.TagNumber(3)
  TemUserInfo ensureTemUserInfo() => $_ensure(2);
}

class SongTapItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SongTapItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
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
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platform')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playlistId',
        protoName: 'playlistId')
    ..hasRequiredFields = false;

  SongTapItem._() : super();
  factory SongTapItem({
    $core.String? title,
    $core.int? type,
    $core.String? platform,
    $core.String? playlistId,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (type != null) {
      _result.type = type;
    }
    if (platform != null) {
      _result.platform = platform;
    }
    if (playlistId != null) {
      _result.playlistId = playlistId;
    }
    return _result;
  }
  factory SongTapItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SongTapItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SongTapItem clone() => SongTapItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SongTapItem copyWith(void Function(SongTapItem) updates) =>
      super.copyWith((message) => updates(message as SongTapItem))
          as SongTapItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongTapItem create() => SongTapItem._();
  SongTapItem createEmptyInstance() => create();
  static $pb.PbList<SongTapItem> createRepeated() => $pb.PbList<SongTapItem>();
  @$core.pragma('dart2js:noInline')
  static SongTapItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SongTapItem>(create);
  static SongTapItem? _defaultInstance;

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
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get platform => $_getSZ(2);
  @$pb.TagNumber(3)
  set platform($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPlatform() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlatform() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get playlistId => $_getSZ(3);
  @$pb.TagNumber(4)
  set playlistId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPlaylistId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlaylistId() => clearField(4);
}

class RepSongTap extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RepSongTap',
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
    ..pc<SongTapItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: SongTapItem.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'searchType')
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showSearch')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pid')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appkey')
    ..hasRequiredFields = false;

  RepSongTap._() : super();
  factory RepSongTap({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<SongTapItem>? data,
    $core.String? searchType,
    $core.bool? showSearch,
    $core.String? pid,
    $core.String? appkey,
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
    if (searchType != null) {
      _result.searchType = searchType;
    }
    if (showSearch != null) {
      _result.showSearch = showSearch;
    }
    if (pid != null) {
      _result.pid = pid;
    }
    if (appkey != null) {
      _result.appkey = appkey;
    }
    return _result;
  }
  factory RepSongTap.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RepSongTap.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RepSongTap clone() => RepSongTap()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RepSongTap copyWith(void Function(RepSongTap) updates) =>
      super.copyWith((message) => updates(message as RepSongTap))
          as RepSongTap; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RepSongTap create() => RepSongTap._();
  RepSongTap createEmptyInstance() => create();
  static $pb.PbList<RepSongTap> createRepeated() => $pb.PbList<RepSongTap>();
  @$core.pragma('dart2js:noInline')
  static RepSongTap getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RepSongTap>(create);
  static RepSongTap? _defaultInstance;

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
  $core.List<SongTapItem> get data => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get searchType => $_getSZ(3);
  @$pb.TagNumber(4)
  set searchType($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSearchType() => $_has(3);
  @$pb.TagNumber(4)
  void clearSearchType() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get showSearch => $_getBF(4);
  @$pb.TagNumber(5)
  set showSearch($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasShowSearch() => $_has(4);
  @$pb.TagNumber(5)
  void clearShowSearch() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get pid => $_getSZ(5);
  @$pb.TagNumber(6)
  set pid($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPid() => $_has(5);
  @$pb.TagNumber(6)
  void clearPid() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get appkey => $_getSZ(6);
  @$pb.TagNumber(7)
  set appkey($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAppkey() => $_has(6);
  @$pb.TagNumber(7)
  void clearAppkey() => clearField(7);
}
