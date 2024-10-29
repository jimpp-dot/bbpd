///
//  Generated code. Do not modify.
//  source: debate_pk.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ApiDebatePkConfigResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiDebatePkConfigResponse',
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
            : 'message')
    ..aOM<DebatePkConfigMessage>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: DebatePkConfigMessage.create)
    ..hasRequiredFields = false;

  ApiDebatePkConfigResponse._() : super();
  factory ApiDebatePkConfigResponse({
    $core.bool? success,
    $core.String? message,
    DebatePkConfigMessage? data,
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
  factory ApiDebatePkConfigResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiDebatePkConfigResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiDebatePkConfigResponse clone() =>
      ApiDebatePkConfigResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiDebatePkConfigResponse copyWith(
          void Function(ApiDebatePkConfigResponse) updates) =>
      super.copyWith((message) => updates(message as ApiDebatePkConfigResponse))
          as ApiDebatePkConfigResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiDebatePkConfigResponse create() => ApiDebatePkConfigResponse._();
  ApiDebatePkConfigResponse createEmptyInstance() => create();
  static $pb.PbList<ApiDebatePkConfigResponse> createRepeated() =>
      $pb.PbList<ApiDebatePkConfigResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiDebatePkConfigResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiDebatePkConfigResponse>(create);
  static ApiDebatePkConfigResponse? _defaultInstance;

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
  DebatePkConfigMessage get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(DebatePkConfigMessage v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  DebatePkConfigMessage ensureData() => $_ensure(2);
}

class DebatePkConfigMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DebatePkConfigMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'option',
        $pb.PbFieldType.OU3)
    ..aOM<DebatePkBase>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pk',
        subBuilder: DebatePkBase.create)
    ..aOM<DebatePkRole>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        subBuilder: DebatePkRole.create)
    ..aOM<DebatePkRank>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        subBuilder: DebatePkRank.create)
    ..aOM<DebatePkUserConfig>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: DebatePkUserConfig.create)
    ..hasRequiredFields = false;

  DebatePkConfigMessage._() : super();
  factory DebatePkConfigMessage({
    $core.int? option,
    DebatePkBase? pk,
    DebatePkRole? role,
    DebatePkRank? rank,
    DebatePkUserConfig? user,
  }) {
    final _result = create();
    if (option != null) {
      _result.option = option;
    }
    if (pk != null) {
      _result.pk = pk;
    }
    if (role != null) {
      _result.role = role;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory DebatePkConfigMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DebatePkConfigMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DebatePkConfigMessage clone() =>
      DebatePkConfigMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DebatePkConfigMessage copyWith(
          void Function(DebatePkConfigMessage) updates) =>
      super.copyWith((message) => updates(message as DebatePkConfigMessage))
          as DebatePkConfigMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DebatePkConfigMessage create() => DebatePkConfigMessage._();
  DebatePkConfigMessage createEmptyInstance() => create();
  static $pb.PbList<DebatePkConfigMessage> createRepeated() =>
      $pb.PbList<DebatePkConfigMessage>();
  @$core.pragma('dart2js:noInline')
  static DebatePkConfigMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DebatePkConfigMessage>(create);
  static DebatePkConfigMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get option => $_getIZ(0);
  @$pb.TagNumber(1)
  set option($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOption() => $_has(0);
  @$pb.TagNumber(1)
  void clearOption() => clearField(1);

  @$pb.TagNumber(2)
  DebatePkBase get pk => $_getN(1);
  @$pb.TagNumber(2)
  set pk(DebatePkBase v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPk() => $_has(1);
  @$pb.TagNumber(2)
  void clearPk() => clearField(2);
  @$pb.TagNumber(2)
  DebatePkBase ensurePk() => $_ensure(1);

  @$pb.TagNumber(3)
  DebatePkRole get role => $_getN(2);
  @$pb.TagNumber(3)
  set role(DebatePkRole v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => clearField(3);
  @$pb.TagNumber(3)
  DebatePkRole ensureRole() => $_ensure(2);

  @$pb.TagNumber(4)
  DebatePkRank get rank => $_getN(3);
  @$pb.TagNumber(4)
  set rank(DebatePkRank v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearRank() => clearField(4);
  @$pb.TagNumber(4)
  DebatePkRank ensureRank() => $_ensure(3);

  @$pb.TagNumber(5)
  DebatePkUserConfig get user => $_getN(4);
  @$pb.TagNumber(5)
  set user(DebatePkUserConfig v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUser() => $_has(4);
  @$pb.TagNumber(5)
  void clearUser() => clearField(5);
  @$pb.TagNumber(5)
  DebatePkUserConfig ensureUser() => $_ensure(4);
}

class DebatePkBase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DebatePkBase',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkId',
        $pb.PbFieldType.OU3,
        protoName: 'pkId')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stage',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentStageTtl',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'win',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  DebatePkBase._() : super();
  factory DebatePkBase({
    $core.int? pkId,
    $core.int? stage,
    $core.int? rid,
    $core.int? currentStageTtl,
    $core.int? win,
    $core.int? version,
  }) {
    final _result = create();
    if (pkId != null) {
      _result.pkId = pkId;
    }
    if (stage != null) {
      _result.stage = stage;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (currentStageTtl != null) {
      _result.currentStageTtl = currentStageTtl;
    }
    if (win != null) {
      _result.win = win;
    }
    if (version != null) {
      _result.version = version;
    }
    return _result;
  }
  factory DebatePkBase.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DebatePkBase.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DebatePkBase clone() => DebatePkBase()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DebatePkBase copyWith(void Function(DebatePkBase) updates) =>
      super.copyWith((message) => updates(message as DebatePkBase))
          as DebatePkBase; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DebatePkBase create() => DebatePkBase._();
  DebatePkBase createEmptyInstance() => create();
  static $pb.PbList<DebatePkBase> createRepeated() =>
      $pb.PbList<DebatePkBase>();
  @$core.pragma('dart2js:noInline')
  static DebatePkBase getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DebatePkBase>(create);
  static DebatePkBase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pkId => $_getIZ(0);
  @$pb.TagNumber(1)
  set pkId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get stage => $_getIZ(1);
  @$pb.TagNumber(2)
  set stage($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStage() => $_has(1);
  @$pb.TagNumber(2)
  void clearStage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rid => $_getIZ(2);
  @$pb.TagNumber(3)
  set rid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get currentStageTtl => $_getIZ(3);
  @$pb.TagNumber(4)
  set currentStageTtl($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCurrentStageTtl() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentStageTtl() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get win => $_getIZ(4);
  @$pb.TagNumber(5)
  set win($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasWin() => $_has(4);
  @$pb.TagNumber(5)
  void clearWin() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get version => $_getIZ(5);
  @$pb.TagNumber(6)
  set version($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearVersion() => clearField(6);
}

class DebatePkRole extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DebatePkRole',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<DebatePkRoleInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'red',
        subBuilder: DebatePkRoleInfo.create)
    ..aOM<DebatePkRoleInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blue',
        subBuilder: DebatePkRoleInfo.create)
    ..hasRequiredFields = false;

  DebatePkRole._() : super();
  factory DebatePkRole({
    DebatePkRoleInfo? red,
    DebatePkRoleInfo? blue,
  }) {
    final _result = create();
    if (red != null) {
      _result.red = red;
    }
    if (blue != null) {
      _result.blue = blue;
    }
    return _result;
  }
  factory DebatePkRole.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DebatePkRole.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DebatePkRole clone() => DebatePkRole()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DebatePkRole copyWith(void Function(DebatePkRole) updates) =>
      super.copyWith((message) => updates(message as DebatePkRole))
          as DebatePkRole; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DebatePkRole create() => DebatePkRole._();
  DebatePkRole createEmptyInstance() => create();
  static $pb.PbList<DebatePkRole> createRepeated() =>
      $pb.PbList<DebatePkRole>();
  @$core.pragma('dart2js:noInline')
  static DebatePkRole getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DebatePkRole>(create);
  static DebatePkRole? _defaultInstance;

  @$pb.TagNumber(1)
  DebatePkRoleInfo get red => $_getN(0);
  @$pb.TagNumber(1)
  set red(DebatePkRoleInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRed() => $_has(0);
  @$pb.TagNumber(1)
  void clearRed() => clearField(1);
  @$pb.TagNumber(1)
  DebatePkRoleInfo ensureRed() => $_ensure(0);

  @$pb.TagNumber(2)
  DebatePkRoleInfo get blue => $_getN(1);
  @$pb.TagNumber(2)
  set blue(DebatePkRoleInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBlue() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlue() => clearField(2);
  @$pb.TagNumber(2)
  DebatePkRoleInfo ensureBlue() => $_ensure(1);
}

class DebatePkRoleInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DebatePkRoleInfo',
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
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
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
            : 'frame')
    ..hasRequiredFields = false;

  DebatePkRoleInfo._() : super();
  factory DebatePkRoleInfo({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
    $core.int? score,
    $core.String? frame,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (score != null) {
      _result.score = score;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    return _result;
  }
  factory DebatePkRoleInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DebatePkRoleInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DebatePkRoleInfo clone() => DebatePkRoleInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DebatePkRoleInfo copyWith(void Function(DebatePkRoleInfo) updates) =>
      super.copyWith((message) => updates(message as DebatePkRoleInfo))
          as DebatePkRoleInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DebatePkRoleInfo create() => DebatePkRoleInfo._();
  DebatePkRoleInfo createEmptyInstance() => create();
  static $pb.PbList<DebatePkRoleInfo> createRepeated() =>
      $pb.PbList<DebatePkRoleInfo>();
  @$core.pragma('dart2js:noInline')
  static DebatePkRoleInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DebatePkRoleInfo>(create);
  static DebatePkRoleInfo? _defaultInstance;

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
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

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
  $core.String get frame => $_getSZ(4);
  @$pb.TagNumber(5)
  set frame($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFrame() => $_has(4);
  @$pb.TagNumber(5)
  void clearFrame() => clearField(5);
}

class DebatePkRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DebatePkRank',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<DebatePkContributionRankItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'red',
        $pb.PbFieldType.PM,
        subBuilder: DebatePkContributionRankItem.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numRedRanker',
        $pb.PbFieldType.OU3,
        protoName: 'numRedRanker')
    ..pc<DebatePkContributionRankItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blue',
        $pb.PbFieldType.PM,
        subBuilder: DebatePkContributionRankItem.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numBlueRanker',
        $pb.PbFieldType.OU3,
        protoName: 'numBlueRanker')
    ..hasRequiredFields = false;

  DebatePkRank._() : super();
  factory DebatePkRank({
    $core.Iterable<DebatePkContributionRankItem>? red,
    $core.int? numRedRanker,
    $core.Iterable<DebatePkContributionRankItem>? blue,
    $core.int? numBlueRanker,
  }) {
    final _result = create();
    if (red != null) {
      _result.red.addAll(red);
    }
    if (numRedRanker != null) {
      _result.numRedRanker = numRedRanker;
    }
    if (blue != null) {
      _result.blue.addAll(blue);
    }
    if (numBlueRanker != null) {
      _result.numBlueRanker = numBlueRanker;
    }
    return _result;
  }
  factory DebatePkRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DebatePkRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DebatePkRank clone() => DebatePkRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DebatePkRank copyWith(void Function(DebatePkRank) updates) =>
      super.copyWith((message) => updates(message as DebatePkRank))
          as DebatePkRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DebatePkRank create() => DebatePkRank._();
  DebatePkRank createEmptyInstance() => create();
  static $pb.PbList<DebatePkRank> createRepeated() =>
      $pb.PbList<DebatePkRank>();
  @$core.pragma('dart2js:noInline')
  static DebatePkRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DebatePkRank>(create);
  static DebatePkRank? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<DebatePkContributionRankItem> get red => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get numRedRanker => $_getIZ(1);
  @$pb.TagNumber(2)
  set numRedRanker($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNumRedRanker() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumRedRanker() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<DebatePkContributionRankItem> get blue => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get numBlueRanker => $_getIZ(3);
  @$pb.TagNumber(4)
  set numBlueRanker($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNumBlueRanker() => $_has(3);
  @$pb.TagNumber(4)
  void clearNumBlueRanker() => clearField(4);
}

class DebatePkContributionRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DebatePkContributionRankItem',
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
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.O3)
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
            : 'vip',
        $pb.PbFieldType.OU3)
    ..aOB(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vipGray')
    ..aOB(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'menegxin')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  DebatePkContributionRankItem._() : super();
  factory DebatePkContributionRankItem({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? score,
    $core.int? rank,
    $core.int? sex,
    $core.int? vip,
    $core.bool? vipGray,
    $core.bool? menegxin,
    $core.int? age,
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
    if (score != null) {
      _result.score = score;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (vipGray != null) {
      _result.vipGray = vipGray;
    }
    if (menegxin != null) {
      _result.menegxin = menegxin;
    }
    if (age != null) {
      _result.age = age;
    }
    return _result;
  }
  factory DebatePkContributionRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DebatePkContributionRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DebatePkContributionRankItem clone() =>
      DebatePkContributionRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DebatePkContributionRankItem copyWith(
          void Function(DebatePkContributionRankItem) updates) =>
      super.copyWith(
              (message) => updates(message as DebatePkContributionRankItem))
          as DebatePkContributionRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DebatePkContributionRankItem create() =>
      DebatePkContributionRankItem._();
  DebatePkContributionRankItem createEmptyInstance() => create();
  static $pb.PbList<DebatePkContributionRankItem> createRepeated() =>
      $pb.PbList<DebatePkContributionRankItem>();
  @$core.pragma('dart2js:noInline')
  static DebatePkContributionRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DebatePkContributionRankItem>(create);
  static DebatePkContributionRankItem? _defaultInstance;

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
  $core.int get vip => $_getIZ(6);
  @$pb.TagNumber(7)
  set vip($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasVip() => $_has(6);
  @$pb.TagNumber(7)
  void clearVip() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get vipGray => $_getBF(7);
  @$pb.TagNumber(8)
  set vipGray($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasVipGray() => $_has(7);
  @$pb.TagNumber(8)
  void clearVipGray() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get menegxin => $_getBF(8);
  @$pb.TagNumber(9)
  set menegxin($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasMenegxin() => $_has(8);
  @$pb.TagNumber(9)
  void clearMenegxin() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get age => $_getIZ(9);
  @$pb.TagNumber(10)
  set age($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasAge() => $_has(9);
  @$pb.TagNumber(10)
  void clearAge() => clearField(10);
}

class DebatePkUserConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DebatePkUserConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redSupported',
        $pb.PbFieldType.OU3,
        protoName: 'redSupported')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blueSupported',
        $pb.PbFieldType.OU3,
        protoName: 'blueSupported')
    ..hasRequiredFields = false;

  DebatePkUserConfig._() : super();
  factory DebatePkUserConfig({
    $core.int? redSupported,
    $core.int? blueSupported,
  }) {
    final _result = create();
    if (redSupported != null) {
      _result.redSupported = redSupported;
    }
    if (blueSupported != null) {
      _result.blueSupported = blueSupported;
    }
    return _result;
  }
  factory DebatePkUserConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DebatePkUserConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DebatePkUserConfig clone() => DebatePkUserConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DebatePkUserConfig copyWith(void Function(DebatePkUserConfig) updates) =>
      super.copyWith((message) => updates(message as DebatePkUserConfig))
          as DebatePkUserConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DebatePkUserConfig create() => DebatePkUserConfig._();
  DebatePkUserConfig createEmptyInstance() => create();
  static $pb.PbList<DebatePkUserConfig> createRepeated() =>
      $pb.PbList<DebatePkUserConfig>();
  @$core.pragma('dart2js:noInline')
  static DebatePkUserConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DebatePkUserConfig>(create);
  static DebatePkUserConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get redSupported => $_getIZ(0);
  @$pb.TagNumber(1)
  set redSupported($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRedSupported() => $_has(0);
  @$pb.TagNumber(1)
  void clearRedSupported() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get blueSupported => $_getIZ(1);
  @$pb.TagNumber(2)
  set blueSupported($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBlueSupported() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlueSupported() => clearField(2);
}

class ApiDebatePkPreferencesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiDebatePkPreferencesResponse',
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
            : 'message')
    ..aOM<DebatePkPreferences>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: DebatePkPreferences.create)
    ..hasRequiredFields = false;

  ApiDebatePkPreferencesResponse._() : super();
  factory ApiDebatePkPreferencesResponse({
    $core.bool? success,
    $core.String? message,
    DebatePkPreferences? data,
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
  factory ApiDebatePkPreferencesResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiDebatePkPreferencesResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiDebatePkPreferencesResponse clone() =>
      ApiDebatePkPreferencesResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiDebatePkPreferencesResponse copyWith(
          void Function(ApiDebatePkPreferencesResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiDebatePkPreferencesResponse))
          as ApiDebatePkPreferencesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiDebatePkPreferencesResponse create() =>
      ApiDebatePkPreferencesResponse._();
  ApiDebatePkPreferencesResponse createEmptyInstance() => create();
  static $pb.PbList<ApiDebatePkPreferencesResponse> createRepeated() =>
      $pb.PbList<ApiDebatePkPreferencesResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiDebatePkPreferencesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiDebatePkPreferencesResponse>(create);
  static ApiDebatePkPreferencesResponse? _defaultInstance;

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
  DebatePkPreferences get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(DebatePkPreferences v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  DebatePkPreferences ensureData() => $_ensure(2);
}

class DebatePkPreferences extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DebatePkPreferences',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<DebatePkDurationRange>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkRange',
        protoName: 'pkRange',
        subBuilder: DebatePkDurationRange.create)
    ..aOM<DebatePkDurationRange>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'delayRange',
        protoName: 'delayRange',
        subBuilder: DebatePkDurationRange.create)
    ..hasRequiredFields = false;

  DebatePkPreferences._() : super();
  factory DebatePkPreferences({
    DebatePkDurationRange? pkRange,
    DebatePkDurationRange? delayRange,
  }) {
    final _result = create();
    if (pkRange != null) {
      _result.pkRange = pkRange;
    }
    if (delayRange != null) {
      _result.delayRange = delayRange;
    }
    return _result;
  }
  factory DebatePkPreferences.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DebatePkPreferences.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DebatePkPreferences clone() => DebatePkPreferences()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DebatePkPreferences copyWith(void Function(DebatePkPreferences) updates) =>
      super.copyWith((message) => updates(message as DebatePkPreferences))
          as DebatePkPreferences; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DebatePkPreferences create() => DebatePkPreferences._();
  DebatePkPreferences createEmptyInstance() => create();
  static $pb.PbList<DebatePkPreferences> createRepeated() =>
      $pb.PbList<DebatePkPreferences>();
  @$core.pragma('dart2js:noInline')
  static DebatePkPreferences getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DebatePkPreferences>(create);
  static DebatePkPreferences? _defaultInstance;

  @$pb.TagNumber(1)
  DebatePkDurationRange get pkRange => $_getN(0);
  @$pb.TagNumber(1)
  set pkRange(DebatePkDurationRange v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPkRange() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkRange() => clearField(1);
  @$pb.TagNumber(1)
  DebatePkDurationRange ensurePkRange() => $_ensure(0);

  @$pb.TagNumber(2)
  DebatePkDurationRange get delayRange => $_getN(1);
  @$pb.TagNumber(2)
  set delayRange(DebatePkDurationRange v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDelayRange() => $_has(1);
  @$pb.TagNumber(2)
  void clearDelayRange() => clearField(2);
  @$pb.TagNumber(2)
  DebatePkDurationRange ensureDelayRange() => $_ensure(1);
}

class DebatePkDurationRange extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DebatePkDurationRange',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'min',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'max',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cur',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  DebatePkDurationRange._() : super();
  factory DebatePkDurationRange({
    $core.int? min,
    $core.int? max,
    $core.int? cur,
  }) {
    final _result = create();
    if (min != null) {
      _result.min = min;
    }
    if (max != null) {
      _result.max = max;
    }
    if (cur != null) {
      _result.cur = cur;
    }
    return _result;
  }
  factory DebatePkDurationRange.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DebatePkDurationRange.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DebatePkDurationRange clone() =>
      DebatePkDurationRange()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DebatePkDurationRange copyWith(
          void Function(DebatePkDurationRange) updates) =>
      super.copyWith((message) => updates(message as DebatePkDurationRange))
          as DebatePkDurationRange; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DebatePkDurationRange create() => DebatePkDurationRange._();
  DebatePkDurationRange createEmptyInstance() => create();
  static $pb.PbList<DebatePkDurationRange> createRepeated() =>
      $pb.PbList<DebatePkDurationRange>();
  @$core.pragma('dart2js:noInline')
  static DebatePkDurationRange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DebatePkDurationRange>(create);
  static DebatePkDurationRange? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get min => $_getIZ(0);
  @$pb.TagNumber(1)
  set min($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMin() => $_has(0);
  @$pb.TagNumber(1)
  void clearMin() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get max => $_getIZ(1);
  @$pb.TagNumber(2)
  set max($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMax() => $_has(1);
  @$pb.TagNumber(2)
  void clearMax() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get cur => $_getIZ(2);
  @$pb.TagNumber(3)
  set cur($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCur() => $_has(2);
  @$pb.TagNumber(3)
  void clearCur() => clearField(3);
}

class ApiDebatePkContributionRankResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiDebatePkContributionRankResponse',
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
            : 'message')
    ..aOM<DebatePkContributionRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: DebatePkContributionRankData.create)
    ..hasRequiredFields = false;

  ApiDebatePkContributionRankResponse._() : super();
  factory ApiDebatePkContributionRankResponse({
    $core.bool? success,
    $core.String? message,
    DebatePkContributionRankData? data,
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
  factory ApiDebatePkContributionRankResponse.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiDebatePkContributionRankResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiDebatePkContributionRankResponse clone() =>
      ApiDebatePkContributionRankResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiDebatePkContributionRankResponse copyWith(
          void Function(ApiDebatePkContributionRankResponse) updates) =>
      super.copyWith((message) =>
              updates(message as ApiDebatePkContributionRankResponse))
          as ApiDebatePkContributionRankResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiDebatePkContributionRankResponse create() =>
      ApiDebatePkContributionRankResponse._();
  ApiDebatePkContributionRankResponse createEmptyInstance() => create();
  static $pb.PbList<ApiDebatePkContributionRankResponse> createRepeated() =>
      $pb.PbList<ApiDebatePkContributionRankResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiDebatePkContributionRankResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ApiDebatePkContributionRankResponse>(create);
  static ApiDebatePkContributionRankResponse? _defaultInstance;

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
  DebatePkContributionRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(DebatePkContributionRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  DebatePkContributionRankData ensureData() => $_ensure(2);
}

class DebatePkContributionRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DebatePkContributionRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<DebatePkContributionRankItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: DebatePkContributionRankItem.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  DebatePkContributionRankData._() : super();
  factory DebatePkContributionRankData({
    $core.Iterable<DebatePkContributionRankItem>? list,
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
  factory DebatePkContributionRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DebatePkContributionRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DebatePkContributionRankData clone() =>
      DebatePkContributionRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DebatePkContributionRankData copyWith(
          void Function(DebatePkContributionRankData) updates) =>
      super.copyWith(
              (message) => updates(message as DebatePkContributionRankData))
          as DebatePkContributionRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DebatePkContributionRankData create() =>
      DebatePkContributionRankData._();
  DebatePkContributionRankData createEmptyInstance() => create();
  static $pb.PbList<DebatePkContributionRankData> createRepeated() =>
      $pb.PbList<DebatePkContributionRankData>();
  @$core.pragma('dart2js:noInline')
  static DebatePkContributionRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DebatePkContributionRankData>(create);
  static DebatePkContributionRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<DebatePkContributionRankItem> get list => $_getList(0);

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

class DebatePkResultMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DebatePkResultMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkId',
        $pb.PbFieldType.OU3,
        protoName: 'pkId')
    ..aOM<DebatePkRoleInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'red',
        subBuilder: DebatePkRoleInfo.create)
    ..aOM<DebatePkRoleInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blue',
        subBuilder: DebatePkRoleInfo.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'win',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'winUrl',
        protoName: 'winUrl')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'winSize',
        $pb.PbFieldType.OU3,
        protoName: 'winSize')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'failUrl',
        protoName: 'failUrl')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'failSize',
        $pb.PbFieldType.OU3,
        protoName: 'failSize')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'drawUrl',
        protoName: 'drawUrl')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'drawSize',
        $pb.PbFieldType.OU3,
        protoName: 'drawSize')
    ..hasRequiredFields = false;

  DebatePkResultMessage._() : super();
  factory DebatePkResultMessage({
    $core.int? pkId,
    DebatePkRoleInfo? red,
    DebatePkRoleInfo? blue,
    $core.int? win,
    $core.String? winUrl,
    $core.int? winSize,
    $core.String? failUrl,
    $core.int? failSize,
    $core.String? drawUrl,
    $core.int? drawSize,
  }) {
    final _result = create();
    if (pkId != null) {
      _result.pkId = pkId;
    }
    if (red != null) {
      _result.red = red;
    }
    if (blue != null) {
      _result.blue = blue;
    }
    if (win != null) {
      _result.win = win;
    }
    if (winUrl != null) {
      _result.winUrl = winUrl;
    }
    if (winSize != null) {
      _result.winSize = winSize;
    }
    if (failUrl != null) {
      _result.failUrl = failUrl;
    }
    if (failSize != null) {
      _result.failSize = failSize;
    }
    if (drawUrl != null) {
      _result.drawUrl = drawUrl;
    }
    if (drawSize != null) {
      _result.drawSize = drawSize;
    }
    return _result;
  }
  factory DebatePkResultMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DebatePkResultMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DebatePkResultMessage clone() =>
      DebatePkResultMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DebatePkResultMessage copyWith(
          void Function(DebatePkResultMessage) updates) =>
      super.copyWith((message) => updates(message as DebatePkResultMessage))
          as DebatePkResultMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DebatePkResultMessage create() => DebatePkResultMessage._();
  DebatePkResultMessage createEmptyInstance() => create();
  static $pb.PbList<DebatePkResultMessage> createRepeated() =>
      $pb.PbList<DebatePkResultMessage>();
  @$core.pragma('dart2js:noInline')
  static DebatePkResultMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DebatePkResultMessage>(create);
  static DebatePkResultMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pkId => $_getIZ(0);
  @$pb.TagNumber(1)
  set pkId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkId() => clearField(1);

  @$pb.TagNumber(2)
  DebatePkRoleInfo get red => $_getN(1);
  @$pb.TagNumber(2)
  set red(DebatePkRoleInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRed() => $_has(1);
  @$pb.TagNumber(2)
  void clearRed() => clearField(2);
  @$pb.TagNumber(2)
  DebatePkRoleInfo ensureRed() => $_ensure(1);

  @$pb.TagNumber(3)
  DebatePkRoleInfo get blue => $_getN(2);
  @$pb.TagNumber(3)
  set blue(DebatePkRoleInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBlue() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlue() => clearField(3);
  @$pb.TagNumber(3)
  DebatePkRoleInfo ensureBlue() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get win => $_getIZ(3);
  @$pb.TagNumber(4)
  set win($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWin() => $_has(3);
  @$pb.TagNumber(4)
  void clearWin() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get winUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set winUrl($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasWinUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearWinUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get winSize => $_getIZ(5);
  @$pb.TagNumber(6)
  set winSize($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWinSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearWinSize() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get failUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set failUrl($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasFailUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearFailUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get failSize => $_getIZ(7);
  @$pb.TagNumber(8)
  set failSize($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasFailSize() => $_has(7);
  @$pb.TagNumber(8)
  void clearFailSize() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get drawUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set drawUrl($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasDrawUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearDrawUrl() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get drawSize => $_getIZ(9);
  @$pb.TagNumber(10)
  set drawSize($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDrawSize() => $_has(9);
  @$pb.TagNumber(10)
  void clearDrawSize() => clearField(10);
}
