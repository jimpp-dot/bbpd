///
//  Generated code. Do not modify.
//  source: nest.created.notify.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NestCreatedNotify_Gs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestCreatedNotify.Gs',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'nest.created.notify'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  NestCreatedNotify_Gs._() : super();
  factory NestCreatedNotify_Gs({
    $core.String? uid,
    $core.String? name,
    $core.String? sex,
    $core.String? icon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory NestCreatedNotify_Gs.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestCreatedNotify_Gs.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestCreatedNotify_Gs clone() =>
      NestCreatedNotify_Gs()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestCreatedNotify_Gs copyWith(void Function(NestCreatedNotify_Gs) updates) =>
      super.copyWith((message) => updates(message as NestCreatedNotify_Gs))
          as NestCreatedNotify_Gs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestCreatedNotify_Gs create() => NestCreatedNotify_Gs._();
  NestCreatedNotify_Gs createEmptyInstance() => create();
  static $pb.PbList<NestCreatedNotify_Gs> createRepeated() =>
      $pb.PbList<NestCreatedNotify_Gs>();
  @$core.pragma('dart2js:noInline')
  static NestCreatedNotify_Gs getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestCreatedNotify_Gs>(create);
  static NestCreatedNotify_Gs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) {
    $_setString(0, v);
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
  $core.String get sex => $_getSZ(2);
  @$pb.TagNumber(3)
  set sex($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSex() => $_has(2);
  @$pb.TagNumber(3)
  void clearSex() => clearField(3);

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

class NestCreatedNotify_Boss extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestCreatedNotify.Boss',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'nest.created.notify'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  NestCreatedNotify_Boss._() : super();
  factory NestCreatedNotify_Boss({
    $core.String? uid,
    $core.String? name,
    $core.String? sex,
    $core.String? icon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory NestCreatedNotify_Boss.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestCreatedNotify_Boss.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestCreatedNotify_Boss clone() =>
      NestCreatedNotify_Boss()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestCreatedNotify_Boss copyWith(
          void Function(NestCreatedNotify_Boss) updates) =>
      super.copyWith((message) => updates(message as NestCreatedNotify_Boss))
          as NestCreatedNotify_Boss; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestCreatedNotify_Boss create() => NestCreatedNotify_Boss._();
  NestCreatedNotify_Boss createEmptyInstance() => create();
  static $pb.PbList<NestCreatedNotify_Boss> createRepeated() =>
      $pb.PbList<NestCreatedNotify_Boss>();
  @$core.pragma('dart2js:noInline')
  static NestCreatedNotify_Boss getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestCreatedNotify_Boss>(create);
  static NestCreatedNotify_Boss? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) {
    $_setString(0, v);
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
  $core.String get sex => $_getSZ(2);
  @$pb.TagNumber(3)
  set sex($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSex() => $_has(2);
  @$pb.TagNumber(3)
  void clearSex() => clearField(3);

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

class NestCreatedNotify extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NestCreatedNotify',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'nest.created.notify'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uuid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_url')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_size',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid')
    ..aOM<NestCreatedNotify_Gs>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gs',
        subBuilder: NestCreatedNotify_Gs.create)
    ..aOM<NestCreatedNotify_Boss>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boss',
        subBuilder: NestCreatedNotify_Boss.create)
    ..hasRequiredFields = false;

  NestCreatedNotify._() : super();
  factory NestCreatedNotify({
    $core.String? uuid,
    $core.String? vapUrl,
    $core.int? vapSize,
    $core.String? rid,
    NestCreatedNotify_Gs? gs,
    NestCreatedNotify_Boss? boss,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (vapUrl != null) {
      _result.vapUrl = vapUrl;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (gs != null) {
      _result.gs = gs;
    }
    if (boss != null) {
      _result.boss = boss;
    }
    return _result;
  }
  factory NestCreatedNotify.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NestCreatedNotify.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NestCreatedNotify clone() => NestCreatedNotify()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NestCreatedNotify copyWith(void Function(NestCreatedNotify) updates) =>
      super.copyWith((message) => updates(message as NestCreatedNotify))
          as NestCreatedNotify; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NestCreatedNotify create() => NestCreatedNotify._();
  NestCreatedNotify createEmptyInstance() => create();
  static $pb.PbList<NestCreatedNotify> createRepeated() =>
      $pb.PbList<NestCreatedNotify>();
  @$core.pragma('dart2js:noInline')
  static NestCreatedNotify getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestCreatedNotify>(create);
  static NestCreatedNotify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get vapUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set vapUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVapUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearVapUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get vapSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set vapSize($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVapSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearVapSize() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rid => $_getSZ(3);
  @$pb.TagNumber(4)
  set rid($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRid() => $_has(3);
  @$pb.TagNumber(4)
  void clearRid() => clearField(4);

  @$pb.TagNumber(5)
  NestCreatedNotify_Gs get gs => $_getN(4);
  @$pb.TagNumber(5)
  set gs(NestCreatedNotify_Gs v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGs() => $_has(4);
  @$pb.TagNumber(5)
  void clearGs() => clearField(5);
  @$pb.TagNumber(5)
  NestCreatedNotify_Gs ensureGs() => $_ensure(4);

  @$pb.TagNumber(6)
  NestCreatedNotify_Boss get boss => $_getN(5);
  @$pb.TagNumber(6)
  set boss(NestCreatedNotify_Boss v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasBoss() => $_has(5);
  @$pb.TagNumber(6)
  void clearBoss() => clearField(6);
  @$pb.TagNumber(6)
  NestCreatedNotify_Boss ensureBoss() => $_ensure(5);
}
