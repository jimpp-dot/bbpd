///
//  Generated code. Do not modify.
//  source: party.wheel.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PartyWheelRefresh_Wheel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyWheelRefresh.Wheel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.wheel.refresh'),
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
            : 'is_started',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish_id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rotating',
        $pb.PbFieldType.OU3)
    ..aOM<PartyWheelRefresh_User>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: PartyWheelRefresh_User.create)
    ..hasRequiredFields = false;

  PartyWheelRefresh_Wheel._() : super();
  factory PartyWheelRefresh_Wheel({
    $core.int? id,
    $core.int? isStarted,
    $core.String? name,
    $core.int? punishId,
    $core.int? rotating,
    PartyWheelRefresh_User? user,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (isStarted != null) {
      _result.isStarted = isStarted;
    }
    if (name != null) {
      _result.name = name;
    }
    if (punishId != null) {
      _result.punishId = punishId;
    }
    if (rotating != null) {
      _result.rotating = rotating;
    }
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory PartyWheelRefresh_Wheel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyWheelRefresh_Wheel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyWheelRefresh_Wheel clone() =>
      PartyWheelRefresh_Wheel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyWheelRefresh_Wheel copyWith(
          void Function(PartyWheelRefresh_Wheel) updates) =>
      super.copyWith((message) => updates(message as PartyWheelRefresh_Wheel))
          as PartyWheelRefresh_Wheel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyWheelRefresh_Wheel create() => PartyWheelRefresh_Wheel._();
  PartyWheelRefresh_Wheel createEmptyInstance() => create();
  static $pb.PbList<PartyWheelRefresh_Wheel> createRepeated() =>
      $pb.PbList<PartyWheelRefresh_Wheel>();
  @$core.pragma('dart2js:noInline')
  static PartyWheelRefresh_Wheel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyWheelRefresh_Wheel>(create);
  static PartyWheelRefresh_Wheel? _defaultInstance;

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
  $core.int get isStarted => $_getIZ(1);
  @$pb.TagNumber(2)
  set isStarted($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsStarted() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsStarted() => clearField(2);

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
  $core.int get punishId => $_getIZ(3);
  @$pb.TagNumber(4)
  set punishId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPunishId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPunishId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get rotating => $_getIZ(4);
  @$pb.TagNumber(5)
  set rotating($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRotating() => $_has(4);
  @$pb.TagNumber(5)
  void clearRotating() => clearField(5);

  @$pb.TagNumber(6)
  PartyWheelRefresh_User get user => $_getN(5);
  @$pb.TagNumber(6)
  set user(PartyWheelRefresh_User v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUser() => $_has(5);
  @$pb.TagNumber(6)
  void clearUser() => clearField(6);
  @$pb.TagNumber(6)
  PartyWheelRefresh_User ensureUser() => $_ensure(5);
}

class PartyWheelRefresh_User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyWheelRefresh.User',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.wheel.refresh'),
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
    ..hasRequiredFields = false;

  PartyWheelRefresh_User._() : super();
  factory PartyWheelRefresh_User({
    $core.int? uid,
    $core.String? icon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory PartyWheelRefresh_User.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyWheelRefresh_User.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyWheelRefresh_User clone() =>
      PartyWheelRefresh_User()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyWheelRefresh_User copyWith(
          void Function(PartyWheelRefresh_User) updates) =>
      super.copyWith((message) => updates(message as PartyWheelRefresh_User))
          as PartyWheelRefresh_User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyWheelRefresh_User create() => PartyWheelRefresh_User._();
  PartyWheelRefresh_User createEmptyInstance() => create();
  static $pb.PbList<PartyWheelRefresh_User> createRepeated() =>
      $pb.PbList<PartyWheelRefresh_User>();
  @$core.pragma('dart2js:noInline')
  static PartyWheelRefresh_User getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyWheelRefresh_User>(create);
  static PartyWheelRefresh_User? _defaultInstance;

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
}

class PartyWheelRefresh_List extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyWheelRefresh.List',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.wheel.refresh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'system_id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PartyWheelRefresh_List._() : super();
  factory PartyWheelRefresh_List({
    $core.String? desc,
    $core.int? id,
    $core.String? name,
    $core.int? systemId,
    $core.int? uid,
  }) {
    final _result = create();
    if (desc != null) {
      _result.desc = desc;
    }
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (systemId != null) {
      _result.systemId = systemId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PartyWheelRefresh_List.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyWheelRefresh_List.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyWheelRefresh_List clone() =>
      PartyWheelRefresh_List()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyWheelRefresh_List copyWith(
          void Function(PartyWheelRefresh_List) updates) =>
      super.copyWith((message) => updates(message as PartyWheelRefresh_List))
          as PartyWheelRefresh_List; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyWheelRefresh_List create() => PartyWheelRefresh_List._();
  PartyWheelRefresh_List createEmptyInstance() => create();
  static $pb.PbList<PartyWheelRefresh_List> createRepeated() =>
      $pb.PbList<PartyWheelRefresh_List>();
  @$core.pragma('dart2js:noInline')
  static PartyWheelRefresh_List getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyWheelRefresh_List>(create);
  static PartyWheelRefresh_List? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get desc => $_getSZ(0);
  @$pb.TagNumber(1)
  set desc($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearDesc() => clearField(1);

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

  @$pb.TagNumber(4)
  $core.int get systemId => $_getIZ(3);
  @$pb.TagNumber(4)
  set systemId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSystemId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSystemId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get uid => $_getIZ(4);
  @$pb.TagNumber(5)
  set uid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearUid() => clearField(5);
}

class PartyWheelRefresh_Punish extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyWheelRefresh.Punish',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.wheel.refresh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'paper_count',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'system_changename_id')
    ..p<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'system_ids',
        $pb.PbFieldType.PU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'system_voice_id')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PartyWheelRefresh_Punish._() : super();
  factory PartyWheelRefresh_Punish({
    $core.int? paperCount,
    $core.String? systemChangenameId,
    $core.Iterable<$core.int>? systemIds,
    $core.String? systemVoiceId,
    $core.int? uid,
  }) {
    final _result = create();
    if (paperCount != null) {
      _result.paperCount = paperCount;
    }
    if (systemChangenameId != null) {
      _result.systemChangenameId = systemChangenameId;
    }
    if (systemIds != null) {
      _result.systemIds.addAll(systemIds);
    }
    if (systemVoiceId != null) {
      _result.systemVoiceId = systemVoiceId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PartyWheelRefresh_Punish.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyWheelRefresh_Punish.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyWheelRefresh_Punish clone() =>
      PartyWheelRefresh_Punish()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyWheelRefresh_Punish copyWith(
          void Function(PartyWheelRefresh_Punish) updates) =>
      super.copyWith((message) => updates(message as PartyWheelRefresh_Punish))
          as PartyWheelRefresh_Punish; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyWheelRefresh_Punish create() => PartyWheelRefresh_Punish._();
  PartyWheelRefresh_Punish createEmptyInstance() => create();
  static $pb.PbList<PartyWheelRefresh_Punish> createRepeated() =>
      $pb.PbList<PartyWheelRefresh_Punish>();
  @$core.pragma('dart2js:noInline')
  static PartyWheelRefresh_Punish getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyWheelRefresh_Punish>(create);
  static PartyWheelRefresh_Punish? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get paperCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set paperCount($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPaperCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaperCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get systemChangenameId => $_getSZ(1);
  @$pb.TagNumber(2)
  set systemChangenameId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSystemChangenameId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSystemChangenameId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get systemIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get systemVoiceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set systemVoiceId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSystemVoiceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSystemVoiceId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get uid => $_getIZ(4);
  @$pb.TagNumber(5)
  set uid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearUid() => clearField(5);
}

class PartyWheelRefresh_Punlist extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyWheelRefresh.Punlist',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.wheel.refresh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
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
            : 'type')
    ..hasRequiredFields = false;

  PartyWheelRefresh_Punlist._() : super();
  factory PartyWheelRefresh_Punlist({
    $core.String? content,
    $core.int? id,
    $core.String? type,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory PartyWheelRefresh_Punlist.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyWheelRefresh_Punlist.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyWheelRefresh_Punlist clone() =>
      PartyWheelRefresh_Punlist()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyWheelRefresh_Punlist copyWith(
          void Function(PartyWheelRefresh_Punlist) updates) =>
      super.copyWith((message) => updates(message as PartyWheelRefresh_Punlist))
          as PartyWheelRefresh_Punlist; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyWheelRefresh_Punlist create() => PartyWheelRefresh_Punlist._();
  PartyWheelRefresh_Punlist createEmptyInstance() => create();
  static $pb.PbList<PartyWheelRefresh_Punlist> createRepeated() =>
      $pb.PbList<PartyWheelRefresh_Punlist>();
  @$core.pragma('dart2js:noInline')
  static PartyWheelRefresh_Punlist getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyWheelRefresh_Punlist>(create);
  static PartyWheelRefresh_Punlist? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);

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
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}

class PartyWheelRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyWheelRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.wheel.refresh'),
      createEmptyInstance: create)
    ..aOM<PartyWheelRefresh_Wheel>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wheel',
        subBuilder: PartyWheelRefresh_Wheel.create)
    ..pc<PartyWheelRefresh_List>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: PartyWheelRefresh_List.create)
    ..pc<PartyWheelRefresh_User>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        $pb.PbFieldType.PM,
        subBuilder: PartyWheelRefresh_User.create)
    ..pc<PartyWheelRefresh_Punish>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish',
        $pb.PbFieldType.PM,
        subBuilder: PartyWheelRefresh_Punish.create)
    ..pc<PartyWheelRefresh_Punlist>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punlist',
        $pb.PbFieldType.PM,
        subBuilder: PartyWheelRefresh_Punlist.create)
    ..hasRequiredFields = false;

  PartyWheelRefresh._() : super();
  factory PartyWheelRefresh({
    PartyWheelRefresh_Wheel? wheel,
    $core.Iterable<PartyWheelRefresh_List>? list,
    $core.Iterable<PartyWheelRefresh_User>? user,
    $core.Iterable<PartyWheelRefresh_Punish>? punish,
    $core.Iterable<PartyWheelRefresh_Punlist>? punlist,
  }) {
    final _result = create();
    if (wheel != null) {
      _result.wheel = wheel;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (user != null) {
      _result.user.addAll(user);
    }
    if (punish != null) {
      _result.punish.addAll(punish);
    }
    if (punlist != null) {
      _result.punlist.addAll(punlist);
    }
    return _result;
  }
  factory PartyWheelRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyWheelRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyWheelRefresh clone() => PartyWheelRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyWheelRefresh copyWith(void Function(PartyWheelRefresh) updates) =>
      super.copyWith((message) => updates(message as PartyWheelRefresh))
          as PartyWheelRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyWheelRefresh create() => PartyWheelRefresh._();
  PartyWheelRefresh createEmptyInstance() => create();
  static $pb.PbList<PartyWheelRefresh> createRepeated() =>
      $pb.PbList<PartyWheelRefresh>();
  @$core.pragma('dart2js:noInline')
  static PartyWheelRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyWheelRefresh>(create);
  static PartyWheelRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  PartyWheelRefresh_Wheel get wheel => $_getN(0);
  @$pb.TagNumber(1)
  set wheel(PartyWheelRefresh_Wheel v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasWheel() => $_has(0);
  @$pb.TagNumber(1)
  void clearWheel() => clearField(1);
  @$pb.TagNumber(1)
  PartyWheelRefresh_Wheel ensureWheel() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<PartyWheelRefresh_List> get list => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<PartyWheelRefresh_User> get user => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<PartyWheelRefresh_Punish> get punish => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<PartyWheelRefresh_Punlist> get punlist => $_getList(4);
}
