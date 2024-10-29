///
//  Generated code. Do not modify.
//  source: listen.music.robot.sync.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ListenMusicRobotSync_FromUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListenMusicRobotSync.FromUser',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'listen.music.robot.sync'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..hasRequiredFields = false;

  ListenMusicRobotSync_FromUser._() : super();
  factory ListenMusicRobotSync_FromUser({
    $core.String? icon,
    $core.String? name,
    $core.String? uid,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory ListenMusicRobotSync_FromUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListenMusicRobotSync_FromUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListenMusicRobotSync_FromUser clone() =>
      ListenMusicRobotSync_FromUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListenMusicRobotSync_FromUser copyWith(
          void Function(ListenMusicRobotSync_FromUser) updates) =>
      super.copyWith(
              (message) => updates(message as ListenMusicRobotSync_FromUser))
          as ListenMusicRobotSync_FromUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListenMusicRobotSync_FromUser create() =>
      ListenMusicRobotSync_FromUser._();
  ListenMusicRobotSync_FromUser createEmptyInstance() => create();
  static $pb.PbList<ListenMusicRobotSync_FromUser> createRepeated() =>
      $pb.PbList<ListenMusicRobotSync_FromUser>();
  @$core.pragma('dart2js:noInline')
  static ListenMusicRobotSync_FromUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListenMusicRobotSync_FromUser>(create);
  static ListenMusicRobotSync_FromUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => clearField(1);

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
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);
}

class ListenMusicRobotSync_CurrentSongConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListenMusicRobotSync.CurrentSongConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'listen.music.robot.sync'),
      createEmptyInstance: create)
    ..aOM<ListenMusicRobotSync_FromUser>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from_user',
        subBuilder: ListenMusicRobotSync_FromUser.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'resource_path')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sid',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ListenMusicRobotSync_CurrentSongConfig._() : super();
  factory ListenMusicRobotSync_CurrentSongConfig({
    ListenMusicRobotSync_FromUser? fromUser,
    $core.String? name,
    $core.String? resourcePath,
    $core.int? sid,
    $core.String? state,
    $core.int? type,
  }) {
    final _result = create();
    if (fromUser != null) {
      _result.fromUser = fromUser;
    }
    if (name != null) {
      _result.name = name;
    }
    if (resourcePath != null) {
      _result.resourcePath = resourcePath;
    }
    if (sid != null) {
      _result.sid = sid;
    }
    if (state != null) {
      _result.state = state;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory ListenMusicRobotSync_CurrentSongConfig.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListenMusicRobotSync_CurrentSongConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListenMusicRobotSync_CurrentSongConfig clone() =>
      ListenMusicRobotSync_CurrentSongConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListenMusicRobotSync_CurrentSongConfig copyWith(
          void Function(ListenMusicRobotSync_CurrentSongConfig) updates) =>
      super.copyWith((message) =>
              updates(message as ListenMusicRobotSync_CurrentSongConfig))
          as ListenMusicRobotSync_CurrentSongConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListenMusicRobotSync_CurrentSongConfig create() =>
      ListenMusicRobotSync_CurrentSongConfig._();
  ListenMusicRobotSync_CurrentSongConfig createEmptyInstance() => create();
  static $pb.PbList<ListenMusicRobotSync_CurrentSongConfig> createRepeated() =>
      $pb.PbList<ListenMusicRobotSync_CurrentSongConfig>();
  @$core.pragma('dart2js:noInline')
  static ListenMusicRobotSync_CurrentSongConfig getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ListenMusicRobotSync_CurrentSongConfig>(create);
  static ListenMusicRobotSync_CurrentSongConfig? _defaultInstance;

  @$pb.TagNumber(1)
  ListenMusicRobotSync_FromUser get fromUser => $_getN(0);
  @$pb.TagNumber(1)
  set fromUser(ListenMusicRobotSync_FromUser v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFromUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromUser() => clearField(1);
  @$pb.TagNumber(1)
  ListenMusicRobotSync_FromUser ensureFromUser() => $_ensure(0);

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
  $core.String get resourcePath => $_getSZ(2);
  @$pb.TagNumber(3)
  set resourcePath($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasResourcePath() => $_has(2);
  @$pb.TagNumber(3)
  void clearResourcePath() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get sid => $_getIZ(3);
  @$pb.TagNumber(4)
  set sid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSid() => $_has(3);
  @$pb.TagNumber(4)
  void clearSid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get state => $_getSZ(4);
  @$pb.TagNumber(5)
  set state($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get type => $_getIZ(5);
  @$pb.TagNumber(6)
  set type($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);
}

class ListenMusicRobotSync extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListenMusicRobotSync',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'listen.music.robot.sync'),
      createEmptyInstance: create)
    ..aOM<ListenMusicRobotSync_CurrentSongConfig>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'CurrentSong',
        protoName: 'CurrentSong',
        subBuilder: ListenMusicRobotSync_CurrentSongConfig.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'PlayMode',
        protoName: 'PlayMode')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'RobotUid',
        protoName: 'RobotUid')
    ..hasRequiredFields = false;

  ListenMusicRobotSync._() : super();
  factory ListenMusicRobotSync({
    ListenMusicRobotSync_CurrentSongConfig? currentSong,
    $core.String? playMode,
    $core.String? robotUid,
  }) {
    final _result = create();
    if (currentSong != null) {
      _result.currentSong = currentSong;
    }
    if (playMode != null) {
      _result.playMode = playMode;
    }
    if (robotUid != null) {
      _result.robotUid = robotUid;
    }
    return _result;
  }
  factory ListenMusicRobotSync.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListenMusicRobotSync.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListenMusicRobotSync clone() =>
      ListenMusicRobotSync()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListenMusicRobotSync copyWith(void Function(ListenMusicRobotSync) updates) =>
      super.copyWith((message) => updates(message as ListenMusicRobotSync))
          as ListenMusicRobotSync; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListenMusicRobotSync create() => ListenMusicRobotSync._();
  ListenMusicRobotSync createEmptyInstance() => create();
  static $pb.PbList<ListenMusicRobotSync> createRepeated() =>
      $pb.PbList<ListenMusicRobotSync>();
  @$core.pragma('dart2js:noInline')
  static ListenMusicRobotSync getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListenMusicRobotSync>(create);
  static ListenMusicRobotSync? _defaultInstance;

  @$pb.TagNumber(1)
  ListenMusicRobotSync_CurrentSongConfig get currentSong => $_getN(0);
  @$pb.TagNumber(1)
  set currentSong(ListenMusicRobotSync_CurrentSongConfig v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrentSong() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentSong() => clearField(1);
  @$pb.TagNumber(1)
  ListenMusicRobotSync_CurrentSongConfig ensureCurrentSong() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get playMode => $_getSZ(1);
  @$pb.TagNumber(2)
  set playMode($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPlayMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayMode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get robotUid => $_getSZ(2);
  @$pb.TagNumber(3)
  set robotUid($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRobotUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRobotUid() => clearField(3);
}
