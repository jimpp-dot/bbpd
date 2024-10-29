///
//  Generated code. Do not modify.
//  source: live.pk.v2.sync.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LivePkV2Sync_Pk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LivePkV2Sync.Pk',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'live.pk.v2.sync'),
      createEmptyInstance: create)
    ..aOM<LivePkV2Sync_Profile>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'compete',
        subBuilder: LivePkV2Sync_Profile.create)
    ..aOM<LivePkV2Sync_Profile>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'main',
        subBuilder: LivePkV2Sync_Profile.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'win',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  LivePkV2Sync_Pk._() : super();
  factory LivePkV2Sync_Pk({
    LivePkV2Sync_Profile? compete,
    LivePkV2Sync_Profile? main,
    $core.String? punish,
    $core.String? state,
    $core.int? status,
    $core.int? win,
  }) {
    final _result = create();
    if (compete != null) {
      _result.compete = compete;
    }
    if (main != null) {
      _result.main = main;
    }
    if (punish != null) {
      _result.punish = punish;
    }
    if (state != null) {
      _result.state = state;
    }
    if (status != null) {
      _result.status = status;
    }
    if (win != null) {
      _result.win = win;
    }
    return _result;
  }
  factory LivePkV2Sync_Pk.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LivePkV2Sync_Pk.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LivePkV2Sync_Pk clone() => LivePkV2Sync_Pk()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LivePkV2Sync_Pk copyWith(void Function(LivePkV2Sync_Pk) updates) =>
      super.copyWith((message) => updates(message as LivePkV2Sync_Pk))
          as LivePkV2Sync_Pk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LivePkV2Sync_Pk create() => LivePkV2Sync_Pk._();
  LivePkV2Sync_Pk createEmptyInstance() => create();
  static $pb.PbList<LivePkV2Sync_Pk> createRepeated() =>
      $pb.PbList<LivePkV2Sync_Pk>();
  @$core.pragma('dart2js:noInline')
  static LivePkV2Sync_Pk getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LivePkV2Sync_Pk>(create);
  static LivePkV2Sync_Pk? _defaultInstance;

  @$pb.TagNumber(1)
  LivePkV2Sync_Profile get compete => $_getN(0);
  @$pb.TagNumber(1)
  set compete(LivePkV2Sync_Profile v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCompete() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompete() => clearField(1);
  @$pb.TagNumber(1)
  LivePkV2Sync_Profile ensureCompete() => $_ensure(0);

  @$pb.TagNumber(2)
  LivePkV2Sync_Profile get main => $_getN(1);
  @$pb.TagNumber(2)
  set main(LivePkV2Sync_Profile v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMain() => $_has(1);
  @$pb.TagNumber(2)
  void clearMain() => clearField(2);
  @$pb.TagNumber(2)
  LivePkV2Sync_Profile ensureMain() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get punish => $_getSZ(2);
  @$pb.TagNumber(3)
  set punish($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPunish() => $_has(2);
  @$pb.TagNumber(3)
  void clearPunish() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get state => $_getSZ(3);
  @$pb.TagNumber(4)
  set state($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get status => $_getIZ(4);
  @$pb.TagNumber(5)
  set status($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get win => $_getIZ(5);
  @$pb.TagNumber(6)
  set win($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWin() => $_has(5);
  @$pb.TagNumber(6)
  void clearWin() => clearField(6);
}

class LivePkV2Sync_Profile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LivePkV2Sync.Profile',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'live.pk.v2.sync'),
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
            : 'origin')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'main_rid',
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
            : 'icon')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic')
    ..hasRequiredFields = false;

  LivePkV2Sync_Profile._() : super();
  factory LivePkV2Sync_Profile({
    $core.int? uid,
    $core.String? origin,
    $core.int? mainRid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.int? score,
    $core.String? mic,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (origin != null) {
      _result.origin = origin;
    }
    if (mainRid != null) {
      _result.mainRid = mainRid;
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
    if (score != null) {
      _result.score = score;
    }
    if (mic != null) {
      _result.mic = mic;
    }
    return _result;
  }
  factory LivePkV2Sync_Profile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LivePkV2Sync_Profile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LivePkV2Sync_Profile clone() =>
      LivePkV2Sync_Profile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LivePkV2Sync_Profile copyWith(void Function(LivePkV2Sync_Profile) updates) =>
      super.copyWith((message) => updates(message as LivePkV2Sync_Profile))
          as LivePkV2Sync_Profile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LivePkV2Sync_Profile create() => LivePkV2Sync_Profile._();
  LivePkV2Sync_Profile createEmptyInstance() => create();
  static $pb.PbList<LivePkV2Sync_Profile> createRepeated() =>
      $pb.PbList<LivePkV2Sync_Profile>();
  @$core.pragma('dart2js:noInline')
  static LivePkV2Sync_Profile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LivePkV2Sync_Profile>(create);
  static LivePkV2Sync_Profile? _defaultInstance;

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
  $core.String get origin => $_getSZ(1);
  @$pb.TagNumber(2)
  set origin($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOrigin() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrigin() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get mainRid => $_getIZ(2);
  @$pb.TagNumber(3)
  set mainRid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMainRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearMainRid() => clearField(3);

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
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get sex => $_getIZ(5);
  @$pb.TagNumber(6)
  set sex($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSex() => $_has(5);
  @$pb.TagNumber(6)
  void clearSex() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get score => $_getIZ(6);
  @$pb.TagNumber(7)
  set score($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasScore() => $_has(6);
  @$pb.TagNumber(7)
  void clearScore() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get mic => $_getSZ(7);
  @$pb.TagNumber(8)
  set mic($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMic() => $_has(7);
  @$pb.TagNumber(8)
  void clearMic() => clearField(8);
}

class LivePkV2Sync extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LivePkV2Sync',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'live.pk.v2.sync'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isUse',
        $pb.PbFieldType.OU3,
        protoName: 'isUse')
    ..aOM<LivePkV2Sync_Pk>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pk',
        subBuilder: LivePkV2Sync_Pk.create)
    ..hasRequiredFields = false;

  LivePkV2Sync._() : super();
  factory LivePkV2Sync({
    $core.int? isUse,
    LivePkV2Sync_Pk? pk,
  }) {
    final _result = create();
    if (isUse != null) {
      _result.isUse = isUse;
    }
    if (pk != null) {
      _result.pk = pk;
    }
    return _result;
  }
  factory LivePkV2Sync.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LivePkV2Sync.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LivePkV2Sync clone() => LivePkV2Sync()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LivePkV2Sync copyWith(void Function(LivePkV2Sync) updates) =>
      super.copyWith((message) => updates(message as LivePkV2Sync))
          as LivePkV2Sync; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LivePkV2Sync create() => LivePkV2Sync._();
  LivePkV2Sync createEmptyInstance() => create();
  static $pb.PbList<LivePkV2Sync> createRepeated() =>
      $pb.PbList<LivePkV2Sync>();
  @$core.pragma('dart2js:noInline')
  static LivePkV2Sync getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LivePkV2Sync>(create);
  static LivePkV2Sync? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get isUse => $_getIZ(0);
  @$pb.TagNumber(1)
  set isUse($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIsUse() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsUse() => clearField(1);

  @$pb.TagNumber(2)
  LivePkV2Sync_Pk get pk => $_getN(1);
  @$pb.TagNumber(2)
  set pk(LivePkV2Sync_Pk v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPk() => $_has(1);
  @$pb.TagNumber(2)
  void clearPk() => clearField(2);
  @$pb.TagNumber(2)
  LivePkV2Sync_Pk ensurePk() => $_ensure(1);
}
