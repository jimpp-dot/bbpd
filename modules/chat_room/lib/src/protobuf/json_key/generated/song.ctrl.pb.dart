///
//  Generated code. Do not modify.
//  source: song.ctrl.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SongCtrl_FromUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SongCtrl.FromUser',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'song.ctrl'),
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SongCtrl_FromUser._() : super();
  factory SongCtrl_FromUser({
    $core.String? icon,
    $core.String? name,
    $core.int? uid,
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
  factory SongCtrl_FromUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SongCtrl_FromUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SongCtrl_FromUser clone() => SongCtrl_FromUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SongCtrl_FromUser copyWith(void Function(SongCtrl_FromUser) updates) =>
      super.copyWith((message) => updates(message as SongCtrl_FromUser))
          as SongCtrl_FromUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongCtrl_FromUser create() => SongCtrl_FromUser._();
  SongCtrl_FromUser createEmptyInstance() => create();
  static $pb.PbList<SongCtrl_FromUser> createRepeated() =>
      $pb.PbList<SongCtrl_FromUser>();
  @$core.pragma('dart2js:noInline')
  static SongCtrl_FromUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SongCtrl_FromUser>(create);
  static SongCtrl_FromUser? _defaultInstance;

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
  $core.int get uid => $_getIZ(2);
  @$pb.TagNumber(3)
  set uid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);
}

class SongCtrl_CurrentSong extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SongCtrl.CurrentSong',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'song.ctrl'),
      createEmptyInstance: create)
    ..aOM<SongCtrl_FromUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from_user',
        subBuilder: SongCtrl_FromUser.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'resource_path')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sid',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SongCtrl_CurrentSong._() : super();
  factory SongCtrl_CurrentSong({
    SongCtrl_FromUser? fromUser,
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
  factory SongCtrl_CurrentSong.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SongCtrl_CurrentSong.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SongCtrl_CurrentSong clone() =>
      SongCtrl_CurrentSong()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SongCtrl_CurrentSong copyWith(void Function(SongCtrl_CurrentSong) updates) =>
      super.copyWith((message) => updates(message as SongCtrl_CurrentSong))
          as SongCtrl_CurrentSong; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongCtrl_CurrentSong create() => SongCtrl_CurrentSong._();
  SongCtrl_CurrentSong createEmptyInstance() => create();
  static $pb.PbList<SongCtrl_CurrentSong> createRepeated() =>
      $pb.PbList<SongCtrl_CurrentSong>();
  @$core.pragma('dart2js:noInline')
  static SongCtrl_CurrentSong getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SongCtrl_CurrentSong>(create);
  static SongCtrl_CurrentSong? _defaultInstance;

  @$pb.TagNumber(2)
  SongCtrl_FromUser get fromUser => $_getN(0);
  @$pb.TagNumber(2)
  set fromUser(SongCtrl_FromUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFromUser() => $_has(0);
  @$pb.TagNumber(2)
  void clearFromUser() => clearField(2);
  @$pb.TagNumber(2)
  SongCtrl_FromUser ensureFromUser() => $_ensure(0);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get resourcePath => $_getSZ(2);
  @$pb.TagNumber(4)
  set resourcePath($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasResourcePath() => $_has(2);
  @$pb.TagNumber(4)
  void clearResourcePath() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get sid => $_getIZ(3);
  @$pb.TagNumber(5)
  set sid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSid() => $_has(3);
  @$pb.TagNumber(5)
  void clearSid() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get state => $_getSZ(4);
  @$pb.TagNumber(6)
  set state($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(6)
  void clearState() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get type => $_getIZ(5);
  @$pb.TagNumber(7)
  set type($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(7)
  void clearType() => clearField(7);
}

class SongCtrl extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SongCtrl',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'song.ctrl'),
      createEmptyInstance: create)
    ..aOM<SongCtrl_CurrentSong>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current_song',
        subBuilder: SongCtrl_CurrentSong.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..hasRequiredFields = false;

  SongCtrl._() : super();
  factory SongCtrl({
    SongCtrl_CurrentSong? currentSong,
    $core.String? type,
    $core.String? state,
  }) {
    final _result = create();
    if (currentSong != null) {
      _result.currentSong = currentSong;
    }
    if (type != null) {
      _result.type = type;
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory SongCtrl.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SongCtrl.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SongCtrl clone() => SongCtrl()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SongCtrl copyWith(void Function(SongCtrl) updates) =>
      super.copyWith((message) => updates(message as SongCtrl))
          as SongCtrl; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongCtrl create() => SongCtrl._();
  SongCtrl createEmptyInstance() => create();
  static $pb.PbList<SongCtrl> createRepeated() => $pb.PbList<SongCtrl>();
  @$core.pragma('dart2js:noInline')
  static SongCtrl getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SongCtrl>(create);
  static SongCtrl? _defaultInstance;

  @$pb.TagNumber(1)
  SongCtrl_CurrentSong get currentSong => $_getN(0);
  @$pb.TagNumber(1)
  set currentSong(SongCtrl_CurrentSong v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrentSong() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentSong() => clearField(1);
  @$pb.TagNumber(1)
  SongCtrl_CurrentSong ensureCurrentSong() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get state => $_getSZ(2);
  @$pb.TagNumber(3)
  set state($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);
}
