///
//  Generated code. Do not modify.
//  source: friend.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class FriendFamiliarData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FriendFamiliarData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..p<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'familiar',
        $pb.PbFieldType.PU3)
    ..p<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tmpgroup',
        $pb.PbFieldType.PU3)
    ..hasRequiredFields = false;

  FriendFamiliarData._() : super();
  factory FriendFamiliarData({
    $core.Iterable<$core.int>? familiar,
    $core.Iterable<$core.int>? tmpgroup,
  }) {
    final _result = create();
    if (familiar != null) {
      _result.familiar.addAll(familiar);
    }
    if (tmpgroup != null) {
      _result.tmpgroup.addAll(tmpgroup);
    }
    return _result;
  }
  factory FriendFamiliarData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FriendFamiliarData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FriendFamiliarData clone() => FriendFamiliarData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FriendFamiliarData copyWith(void Function(FriendFamiliarData) updates) =>
      super.copyWith((message) => updates(message as FriendFamiliarData))
          as FriendFamiliarData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FriendFamiliarData create() => FriendFamiliarData._();
  FriendFamiliarData createEmptyInstance() => create();
  static $pb.PbList<FriendFamiliarData> createRepeated() =>
      $pb.PbList<FriendFamiliarData>();
  @$core.pragma('dart2js:noInline')
  static FriendFamiliarData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FriendFamiliarData>(create);
  static FriendFamiliarData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get familiar => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get tmpgroup => $_getList(1);
}

class ResFriendFamiliar extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResFriendFamiliar',
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
    ..aOM<FriendFamiliarData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: FriendFamiliarData.create)
    ..hasRequiredFields = false;

  ResFriendFamiliar._() : super();
  factory ResFriendFamiliar({
    $core.bool? success,
    $core.String? msg,
    FriendFamiliarData? data,
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
  factory ResFriendFamiliar.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResFriendFamiliar.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResFriendFamiliar clone() => ResFriendFamiliar()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResFriendFamiliar copyWith(void Function(ResFriendFamiliar) updates) =>
      super.copyWith((message) => updates(message as ResFriendFamiliar))
          as ResFriendFamiliar; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResFriendFamiliar create() => ResFriendFamiliar._();
  ResFriendFamiliar createEmptyInstance() => create();
  static $pb.PbList<ResFriendFamiliar> createRepeated() =>
      $pb.PbList<ResFriendFamiliar>();
  @$core.pragma('dart2js:noInline')
  static ResFriendFamiliar getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResFriendFamiliar>(create);
  static ResFriendFamiliar? _defaultInstance;

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
  FriendFamiliarData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(FriendFamiliarData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  FriendFamiliarData ensureData() => $_ensure(2);
}

class FriendGroupMember extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FriendGroupMember',
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
            : 'isManager',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nickname')
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
            : 'title',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  FriendGroupMember._() : super();
  factory FriendGroupMember({
    $core.int? uid,
    $core.int? isManager,
    $core.String? nickname,
    $core.String? name,
    $core.String? icon,
    $core.int? title,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (isManager != null) {
      _result.isManager = isManager;
    }
    if (nickname != null) {
      _result.nickname = nickname;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory FriendGroupMember.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FriendGroupMember.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FriendGroupMember clone() => FriendGroupMember()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FriendGroupMember copyWith(void Function(FriendGroupMember) updates) =>
      super.copyWith((message) => updates(message as FriendGroupMember))
          as FriendGroupMember; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FriendGroupMember create() => FriendGroupMember._();
  FriendGroupMember createEmptyInstance() => create();
  static $pb.PbList<FriendGroupMember> createRepeated() =>
      $pb.PbList<FriendGroupMember>();
  @$core.pragma('dart2js:noInline')
  static FriendGroupMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FriendGroupMember>(create);
  static FriendGroupMember? _defaultInstance;

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
  $core.int get isManager => $_getIZ(1);
  @$pb.TagNumber(2)
  set isManager($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsManager() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsManager() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickname($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickname() => clearField(3);

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
  $core.int get title => $_getIZ(5);
  @$pb.TagNumber(6)
  set title($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);
}

class FriendGroupItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FriendGroupItem',
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
            : 'version',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'joinTime',
        $pb.PbFieldType.OU3)
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'official')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createor',
        $pb.PbFieldType.OU3)
    ..pc<FriendGroupMember>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'members',
        $pb.PbFieldType.PM,
        subBuilder: FriendGroupMember.create)
    ..hasRequiredFields = false;

  FriendGroupItem._() : super();
  factory FriendGroupItem({
    $core.int? uid,
    $core.int? version,
    $core.String? name,
    $core.String? icon,
    $core.String? type,
    $core.int? joinTime,
    $core.bool? official,
    $core.int? createor,
    $core.Iterable<FriendGroupMember>? members,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (version != null) {
      _result.version = version;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (type != null) {
      _result.type = type;
    }
    if (joinTime != null) {
      _result.joinTime = joinTime;
    }
    if (official != null) {
      _result.official = official;
    }
    if (createor != null) {
      _result.createor = createor;
    }
    if (members != null) {
      _result.members.addAll(members);
    }
    return _result;
  }
  factory FriendGroupItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FriendGroupItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FriendGroupItem clone() => FriendGroupItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FriendGroupItem copyWith(void Function(FriendGroupItem) updates) =>
      super.copyWith((message) => updates(message as FriendGroupItem))
          as FriendGroupItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FriendGroupItem create() => FriendGroupItem._();
  FriendGroupItem createEmptyInstance() => create();
  static $pb.PbList<FriendGroupItem> createRepeated() =>
      $pb.PbList<FriendGroupItem>();
  @$core.pragma('dart2js:noInline')
  static FriendGroupItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FriendGroupItem>(create);
  static FriendGroupItem? _defaultInstance;

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
  $core.int get version => $_getIZ(1);
  @$pb.TagNumber(2)
  set version($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);

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
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get type => $_getSZ(4);
  @$pb.TagNumber(5)
  set type($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get joinTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set joinTime($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasJoinTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearJoinTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get official => $_getBF(6);
  @$pb.TagNumber(7)
  set official($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOfficial() => $_has(6);
  @$pb.TagNumber(7)
  void clearOfficial() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get createor => $_getIZ(7);
  @$pb.TagNumber(8)
  set createor($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCreateor() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreateor() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<FriendGroupMember> get members => $_getList(8);
}

class ResFriendGroup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResFriendGroup',
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
    ..pc<FriendGroupItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: FriendGroupItem.create)
    ..hasRequiredFields = false;

  ResFriendGroup._() : super();
  factory ResFriendGroup({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<FriendGroupItem>? data,
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
    return _result;
  }
  factory ResFriendGroup.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResFriendGroup.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResFriendGroup clone() => ResFriendGroup()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResFriendGroup copyWith(void Function(ResFriendGroup) updates) =>
      super.copyWith((message) => updates(message as ResFriendGroup))
          as ResFriendGroup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResFriendGroup create() => ResFriendGroup._();
  ResFriendGroup createEmptyInstance() => create();
  static $pb.PbList<ResFriendGroup> createRepeated() =>
      $pb.PbList<ResFriendGroup>();
  @$core.pragma('dart2js:noInline')
  static ResFriendGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResFriendGroup>(create);
  static ResFriendGroup? _defaultInstance;

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
  $core.List<FriendGroupItem> get data => $_getList(2);
}

class Visitor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Visitor',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'new',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  Visitor._() : super();
  factory Visitor({
    $core.int? new_1,
    $core.int? time,
    $core.int? total,
  }) {
    final _result = create();
    if (new_1 != null) {
      _result.new_1 = new_1;
    }
    if (time != null) {
      _result.time = time;
    }
    if (total != null) {
      _result.total = total;
    }
    return _result;
  }
  factory Visitor.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Visitor.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Visitor clone() => Visitor()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Visitor copyWith(void Function(Visitor) updates) =>
      super.copyWith((message) => updates(message as Visitor))
          as Visitor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Visitor create() => Visitor._();
  Visitor createEmptyInstance() => create();
  static $pb.PbList<Visitor> createRepeated() => $pb.PbList<Visitor>();
  @$core.pragma('dart2js:noInline')
  static Visitor getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Visitor>(create);
  static Visitor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get new_1 => $_getIZ(0);
  @$pb.TagNumber(1)
  set new_1($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNew_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearNew_1() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get time => $_getIZ(1);
  @$pb.TagNumber(2)
  set time($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get total => $_getIZ(2);
  @$pb.TagNumber(3)
  set total($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotal() => clearField(3);
}

class Popularity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Popularity',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularity',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diffPopularity',
        $pb.PbFieldType.OU3,
        protoName: 'diffPopularity')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'beforePopularity',
        $pb.PbFieldType.OU3,
        protoName: 'beforePopularity')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextPopularity',
        $pb.PbFieldType.OU3,
        protoName: 'nextPopularity')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'link')
    ..hasRequiredFields = false;

  Popularity._() : super();
  factory Popularity({
    $core.int? level,
    $core.int? popularity,
    $core.int? diffPopularity,
    $core.int? beforePopularity,
    $core.int? nextPopularity,
    $core.String? link,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (popularity != null) {
      _result.popularity = popularity;
    }
    if (diffPopularity != null) {
      _result.diffPopularity = diffPopularity;
    }
    if (beforePopularity != null) {
      _result.beforePopularity = beforePopularity;
    }
    if (nextPopularity != null) {
      _result.nextPopularity = nextPopularity;
    }
    if (link != null) {
      _result.link = link;
    }
    return _result;
  }
  factory Popularity.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Popularity.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Popularity clone() => Popularity()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Popularity copyWith(void Function(Popularity) updates) =>
      super.copyWith((message) => updates(message as Popularity))
          as Popularity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Popularity create() => Popularity._();
  Popularity createEmptyInstance() => create();
  static $pb.PbList<Popularity> createRepeated() => $pb.PbList<Popularity>();
  @$core.pragma('dart2js:noInline')
  static Popularity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Popularity>(create);
  static Popularity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get popularity => $_getIZ(1);
  @$pb.TagNumber(2)
  set popularity($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPopularity() => $_has(1);
  @$pb.TagNumber(2)
  void clearPopularity() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get diffPopularity => $_getIZ(2);
  @$pb.TagNumber(3)
  set diffPopularity($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDiffPopularity() => $_has(2);
  @$pb.TagNumber(3)
  void clearDiffPopularity() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get beforePopularity => $_getIZ(3);
  @$pb.TagNumber(4)
  set beforePopularity($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBeforePopularity() => $_has(3);
  @$pb.TagNumber(4)
  void clearBeforePopularity() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get nextPopularity => $_getIZ(4);
  @$pb.TagNumber(5)
  set nextPopularity($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNextPopularity() => $_has(4);
  @$pb.TagNumber(5)
  void clearNextPopularity() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get link => $_getSZ(5);
  @$pb.TagNumber(6)
  set link($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLink() => $_has(5);
  @$pb.TagNumber(6)
  void clearLink() => clearField(6);
}

class ResFriendsNum extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResFriendsNum',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'follow',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fans',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friends',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fansIncre',
        $pb.PbFieldType.OU3,
        protoName: 'fansIncre')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'group',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accompanyNum',
        $pb.PbFieldType.OU3,
        protoName: 'accompanyNum')
    ..aOM<Visitor>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'visitor',
        subBuilder: Visitor.create)
    ..aOM<Popularity>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularity',
        subBuilder: Popularity.create)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contactsNew',
        $pb.PbFieldType.OU3,
        protoName: 'contactsNew')
    ..hasRequiredFields = false;

  ResFriendsNum._() : super();
  factory ResFriendsNum({
    $core.bool? success,
    $core.String? msg,
    $core.int? follow,
    $core.int? fans,
    $core.int? friends,
    $core.int? fansIncre,
    $core.int? group,
    $core.int? accompanyNum,
    Visitor? visitor,
    Popularity? popularity,
    $core.int? contactsNew,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (follow != null) {
      _result.follow = follow;
    }
    if (fans != null) {
      _result.fans = fans;
    }
    if (friends != null) {
      _result.friends = friends;
    }
    if (fansIncre != null) {
      _result.fansIncre = fansIncre;
    }
    if (group != null) {
      _result.group = group;
    }
    if (accompanyNum != null) {
      _result.accompanyNum = accompanyNum;
    }
    if (visitor != null) {
      _result.visitor = visitor;
    }
    if (popularity != null) {
      _result.popularity = popularity;
    }
    if (contactsNew != null) {
      _result.contactsNew = contactsNew;
    }
    return _result;
  }
  factory ResFriendsNum.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResFriendsNum.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResFriendsNum clone() => ResFriendsNum()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResFriendsNum copyWith(void Function(ResFriendsNum) updates) =>
      super.copyWith((message) => updates(message as ResFriendsNum))
          as ResFriendsNum; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResFriendsNum create() => ResFriendsNum._();
  ResFriendsNum createEmptyInstance() => create();
  static $pb.PbList<ResFriendsNum> createRepeated() =>
      $pb.PbList<ResFriendsNum>();
  @$core.pragma('dart2js:noInline')
  static ResFriendsNum getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResFriendsNum>(create);
  static ResFriendsNum? _defaultInstance;

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
  $core.int get follow => $_getIZ(2);
  @$pb.TagNumber(3)
  set follow($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFollow() => $_has(2);
  @$pb.TagNumber(3)
  void clearFollow() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get fans => $_getIZ(3);
  @$pb.TagNumber(4)
  set fans($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFans() => $_has(3);
  @$pb.TagNumber(4)
  void clearFans() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get friends => $_getIZ(4);
  @$pb.TagNumber(5)
  set friends($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFriends() => $_has(4);
  @$pb.TagNumber(5)
  void clearFriends() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get fansIncre => $_getIZ(5);
  @$pb.TagNumber(6)
  set fansIncre($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFansIncre() => $_has(5);
  @$pb.TagNumber(6)
  void clearFansIncre() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get group => $_getIZ(6);
  @$pb.TagNumber(7)
  set group($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGroup() => $_has(6);
  @$pb.TagNumber(7)
  void clearGroup() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get accompanyNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set accompanyNum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAccompanyNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearAccompanyNum() => clearField(8);

  @$pb.TagNumber(9)
  Visitor get visitor => $_getN(8);
  @$pb.TagNumber(9)
  set visitor(Visitor v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasVisitor() => $_has(8);
  @$pb.TagNumber(9)
  void clearVisitor() => clearField(9);
  @$pb.TagNumber(9)
  Visitor ensureVisitor() => $_ensure(8);

  @$pb.TagNumber(10)
  Popularity get popularity => $_getN(9);
  @$pb.TagNumber(10)
  set popularity(Popularity v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPopularity() => $_has(9);
  @$pb.TagNumber(10)
  void clearPopularity() => clearField(10);
  @$pb.TagNumber(10)
  Popularity ensurePopularity() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.int get contactsNew => $_getIZ(10);
  @$pb.TagNumber(11)
  set contactsNew($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasContactsNew() => $_has(10);
  @$pb.TagNumber(11)
  void clearContactsNew() => clearField(11);
}

class FriendKAStewardData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FriendKAStewardData',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stewardId',
        $pb.PbFieldType.OU3,
        protoName: 'stewardId')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'qrUrl',
        protoName: 'qrUrl')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'programPath',
        protoName: 'programPath')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'programName',
        protoName: 'programName')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  FriendKAStewardData._() : super();
  factory FriendKAStewardData({
    $core.String? title,
    $core.String? desc,
    $core.int? stewardId,
    $core.String? qrUrl,
    $core.String? programPath,
    $core.String? programName,
    $core.int? type,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (stewardId != null) {
      _result.stewardId = stewardId;
    }
    if (qrUrl != null) {
      _result.qrUrl = qrUrl;
    }
    if (programPath != null) {
      _result.programPath = programPath;
    }
    if (programName != null) {
      _result.programName = programName;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory FriendKAStewardData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FriendKAStewardData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FriendKAStewardData clone() => FriendKAStewardData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FriendKAStewardData copyWith(void Function(FriendKAStewardData) updates) =>
      super.copyWith((message) => updates(message as FriendKAStewardData))
          as FriendKAStewardData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FriendKAStewardData create() => FriendKAStewardData._();
  FriendKAStewardData createEmptyInstance() => create();
  static $pb.PbList<FriendKAStewardData> createRepeated() =>
      $pb.PbList<FriendKAStewardData>();
  @$core.pragma('dart2js:noInline')
  static FriendKAStewardData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FriendKAStewardData>(create);
  static FriendKAStewardData? _defaultInstance;

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
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get stewardId => $_getIZ(2);
  @$pb.TagNumber(3)
  set stewardId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStewardId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStewardId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get qrUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set qrUrl($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasQrUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearQrUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get programPath => $_getSZ(4);
  @$pb.TagNumber(5)
  set programPath($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasProgramPath() => $_has(4);
  @$pb.TagNumber(5)
  void clearProgramPath() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get programName => $_getSZ(5);
  @$pb.TagNumber(6)
  set programName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasProgramName() => $_has(5);
  @$pb.TagNumber(6)
  void clearProgramName() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get type => $_getIZ(6);
  @$pb.TagNumber(7)
  set type($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => clearField(7);
}

class ResFriendKASteward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResFriendKASteward',
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
    ..aOM<FriendKAStewardData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: FriendKAStewardData.create)
    ..hasRequiredFields = false;

  ResFriendKASteward._() : super();
  factory ResFriendKASteward({
    $core.bool? success,
    $core.String? message,
    FriendKAStewardData? data,
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
  factory ResFriendKASteward.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResFriendKASteward.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResFriendKASteward clone() => ResFriendKASteward()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResFriendKASteward copyWith(void Function(ResFriendKASteward) updates) =>
      super.copyWith((message) => updates(message as ResFriendKASteward))
          as ResFriendKASteward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResFriendKASteward create() => ResFriendKASteward._();
  ResFriendKASteward createEmptyInstance() => create();
  static $pb.PbList<ResFriendKASteward> createRepeated() =>
      $pb.PbList<ResFriendKASteward>();
  @$core.pragma('dart2js:noInline')
  static ResFriendKASteward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResFriendKASteward>(create);
  static ResFriendKASteward? _defaultInstance;

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
  FriendKAStewardData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(FriendKAStewardData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  FriendKAStewardData ensureData() => $_ensure(2);
}
