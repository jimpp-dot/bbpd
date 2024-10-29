///
//  Generated code. Do not modify.
//  source: group_setting.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GroupSettingDataRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GroupSettingDataRsp',
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
    ..aOM<BodySettingsData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BodySettingsData.create)
    ..hasRequiredFields = false;

  GroupSettingDataRsp._() : super();
  factory GroupSettingDataRsp({
    $core.bool? success,
    $core.String? msg,
    BodySettingsData? data,
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
  factory GroupSettingDataRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GroupSettingDataRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GroupSettingDataRsp clone() => GroupSettingDataRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GroupSettingDataRsp copyWith(void Function(GroupSettingDataRsp) updates) =>
      super.copyWith((message) => updates(message as GroupSettingDataRsp))
          as GroupSettingDataRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GroupSettingDataRsp create() => GroupSettingDataRsp._();
  GroupSettingDataRsp createEmptyInstance() => create();
  static $pb.PbList<GroupSettingDataRsp> createRepeated() =>
      $pb.PbList<GroupSettingDataRsp>();
  @$core.pragma('dart2js:noInline')
  static GroupSettingDataRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupSettingDataRsp>(create);
  static GroupSettingDataRsp? _defaultInstance;

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
  BodySettingsData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BodySettingsData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BodySettingsData ensureData() => $_ensure(2);
}

class BodySettingsData_StarshipConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BodySettingsData.StarshipConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'modifyIconTime',
        $pb.PbFieldType.OU3,
        protoName: 'modifyIconTime')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bouleuterionLv',
        $pb.PbFieldType.OU3,
        protoName: 'bouleuterionLv')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cycle',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'minLv',
        $pb.PbFieldType.OU3,
        protoName: 'minLv')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        $pb.PbFieldType.OU3)
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canDynamic',
        protoName: 'canDynamic')
    ..aOB(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canStatic',
        protoName: 'canStatic')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxNum',
        $pb.PbFieldType.OU3,
        protoName: 'maxNum')
    ..hasRequiredFields = false;

  BodySettingsData_StarshipConfig._() : super();
  factory BodySettingsData_StarshipConfig({
    $core.int? modifyIconTime,
    $core.int? bouleuterionLv,
    $core.int? cycle,
    $core.String? desc,
    $core.int? minLv,
    $core.int? role,
    $core.bool? canDynamic,
    $core.bool? canStatic,
    $core.int? maxNum,
  }) {
    final _result = create();
    if (modifyIconTime != null) {
      _result.modifyIconTime = modifyIconTime;
    }
    if (bouleuterionLv != null) {
      _result.bouleuterionLv = bouleuterionLv;
    }
    if (cycle != null) {
      _result.cycle = cycle;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (minLv != null) {
      _result.minLv = minLv;
    }
    if (role != null) {
      _result.role = role;
    }
    if (canDynamic != null) {
      _result.canDynamic = canDynamic;
    }
    if (canStatic != null) {
      _result.canStatic = canStatic;
    }
    if (maxNum != null) {
      _result.maxNum = maxNum;
    }
    return _result;
  }
  factory BodySettingsData_StarshipConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BodySettingsData_StarshipConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BodySettingsData_StarshipConfig clone() =>
      BodySettingsData_StarshipConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BodySettingsData_StarshipConfig copyWith(
          void Function(BodySettingsData_StarshipConfig) updates) =>
      super.copyWith(
              (message) => updates(message as BodySettingsData_StarshipConfig))
          as BodySettingsData_StarshipConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BodySettingsData_StarshipConfig create() =>
      BodySettingsData_StarshipConfig._();
  BodySettingsData_StarshipConfig createEmptyInstance() => create();
  static $pb.PbList<BodySettingsData_StarshipConfig> createRepeated() =>
      $pb.PbList<BodySettingsData_StarshipConfig>();
  @$core.pragma('dart2js:noInline')
  static BodySettingsData_StarshipConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BodySettingsData_StarshipConfig>(
          create);
  static BodySettingsData_StarshipConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get modifyIconTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set modifyIconTime($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasModifyIconTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearModifyIconTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get bouleuterionLv => $_getIZ(1);
  @$pb.TagNumber(2)
  set bouleuterionLv($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBouleuterionLv() => $_has(1);
  @$pb.TagNumber(2)
  void clearBouleuterionLv() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get cycle => $_getIZ(2);
  @$pb.TagNumber(3)
  set cycle($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCycle() => $_has(2);
  @$pb.TagNumber(3)
  void clearCycle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get minLv => $_getIZ(4);
  @$pb.TagNumber(5)
  set minLv($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMinLv() => $_has(4);
  @$pb.TagNumber(5)
  void clearMinLv() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get role => $_getIZ(5);
  @$pb.TagNumber(6)
  set role($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRole() => $_has(5);
  @$pb.TagNumber(6)
  void clearRole() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get canDynamic => $_getBF(6);
  @$pb.TagNumber(7)
  set canDynamic($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCanDynamic() => $_has(6);
  @$pb.TagNumber(7)
  void clearCanDynamic() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get canStatic => $_getBF(7);
  @$pb.TagNumber(8)
  set canStatic($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCanStatic() => $_has(7);
  @$pb.TagNumber(8)
  void clearCanStatic() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get maxNum => $_getIZ(8);
  @$pb.TagNumber(9)
  set maxNum($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasMaxNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearMaxNum() => clearField(9);
}

class BodySettingsData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BodySettingsData',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'creator',
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
            : 'cover')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'notice')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'applyNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'allowInvite',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'allowSearch',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'needAudit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'forbidden',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isManager',
        $pb.PbFieldType.OU3)
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nickname')
    ..pc<GroupMembers>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'members',
        $pb.PbFieldType.PM,
        subBuilder: GroupMembers.create)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chatOnlyMember',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nameAudit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'coverAudit',
        $pb.PbFieldType.OU3)
    ..aOM<BodySettingsData_StarshipConfig>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starship',
        subBuilder: BodySettingsData_StarshipConfig.create)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'descAudit',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BodySettingsData._() : super();
  factory BodySettingsData({
    $core.int? id,
    $core.int? creator,
    $core.String? name,
    $core.String? cover,
    $core.String? notice,
    $core.String? type,
    $core.int? applyNum,
    $core.int? allowInvite,
    $core.int? allowSearch,
    $core.int? needAudit,
    $core.int? forbidden,
    $core.int? isManager,
    $core.String? nickname,
    $core.Iterable<GroupMembers>? members,
    $core.int? chatOnlyMember,
    $core.int? nameAudit,
    $core.int? coverAudit,
    BodySettingsData_StarshipConfig? starship,
    $core.int? descAudit,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (creator != null) {
      _result.creator = creator;
    }
    if (name != null) {
      _result.name = name;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (notice != null) {
      _result.notice = notice;
    }
    if (type != null) {
      _result.type = type;
    }
    if (applyNum != null) {
      _result.applyNum = applyNum;
    }
    if (allowInvite != null) {
      _result.allowInvite = allowInvite;
    }
    if (allowSearch != null) {
      _result.allowSearch = allowSearch;
    }
    if (needAudit != null) {
      _result.needAudit = needAudit;
    }
    if (forbidden != null) {
      _result.forbidden = forbidden;
    }
    if (isManager != null) {
      _result.isManager = isManager;
    }
    if (nickname != null) {
      _result.nickname = nickname;
    }
    if (members != null) {
      _result.members.addAll(members);
    }
    if (chatOnlyMember != null) {
      _result.chatOnlyMember = chatOnlyMember;
    }
    if (nameAudit != null) {
      _result.nameAudit = nameAudit;
    }
    if (coverAudit != null) {
      _result.coverAudit = coverAudit;
    }
    if (starship != null) {
      _result.starship = starship;
    }
    if (descAudit != null) {
      _result.descAudit = descAudit;
    }
    return _result;
  }
  factory BodySettingsData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BodySettingsData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BodySettingsData clone() => BodySettingsData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BodySettingsData copyWith(void Function(BodySettingsData) updates) =>
      super.copyWith((message) => updates(message as BodySettingsData))
          as BodySettingsData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BodySettingsData create() => BodySettingsData._();
  BodySettingsData createEmptyInstance() => create();
  static $pb.PbList<BodySettingsData> createRepeated() =>
      $pb.PbList<BodySettingsData>();
  @$core.pragma('dart2js:noInline')
  static BodySettingsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BodySettingsData>(create);
  static BodySettingsData? _defaultInstance;

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
  $core.int get creator => $_getIZ(1);
  @$pb.TagNumber(2)
  set creator($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCreator() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreator() => clearField(2);

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
  $core.String get cover => $_getSZ(3);
  @$pb.TagNumber(4)
  set cover($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCover() => $_has(3);
  @$pb.TagNumber(4)
  void clearCover() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get notice => $_getSZ(4);
  @$pb.TagNumber(5)
  set notice($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNotice() => $_has(4);
  @$pb.TagNumber(5)
  void clearNotice() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get type => $_getSZ(5);
  @$pb.TagNumber(6)
  set type($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get applyNum => $_getIZ(6);
  @$pb.TagNumber(7)
  set applyNum($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasApplyNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearApplyNum() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get allowInvite => $_getIZ(7);
  @$pb.TagNumber(8)
  set allowInvite($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAllowInvite() => $_has(7);
  @$pb.TagNumber(8)
  void clearAllowInvite() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get allowSearch => $_getIZ(8);
  @$pb.TagNumber(9)
  set allowSearch($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAllowSearch() => $_has(8);
  @$pb.TagNumber(9)
  void clearAllowSearch() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get needAudit => $_getIZ(9);
  @$pb.TagNumber(10)
  set needAudit($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasNeedAudit() => $_has(9);
  @$pb.TagNumber(10)
  void clearNeedAudit() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get forbidden => $_getIZ(10);
  @$pb.TagNumber(11)
  set forbidden($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasForbidden() => $_has(10);
  @$pb.TagNumber(11)
  void clearForbidden() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get isManager => $_getIZ(11);
  @$pb.TagNumber(12)
  set isManager($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasIsManager() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsManager() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get nickname => $_getSZ(12);
  @$pb.TagNumber(13)
  set nickname($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasNickname() => $_has(12);
  @$pb.TagNumber(13)
  void clearNickname() => clearField(13);

  @$pb.TagNumber(14)
  $core.List<GroupMembers> get members => $_getList(13);

  @$pb.TagNumber(15)
  $core.int get chatOnlyMember => $_getIZ(14);
  @$pb.TagNumber(15)
  set chatOnlyMember($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasChatOnlyMember() => $_has(14);
  @$pb.TagNumber(15)
  void clearChatOnlyMember() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get nameAudit => $_getIZ(15);
  @$pb.TagNumber(16)
  set nameAudit($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasNameAudit() => $_has(15);
  @$pb.TagNumber(16)
  void clearNameAudit() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get coverAudit => $_getIZ(16);
  @$pb.TagNumber(17)
  set coverAudit($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasCoverAudit() => $_has(16);
  @$pb.TagNumber(17)
  void clearCoverAudit() => clearField(17);

  @$pb.TagNumber(19)
  BodySettingsData_StarshipConfig get starship => $_getN(17);
  @$pb.TagNumber(19)
  set starship(BodySettingsData_StarshipConfig v) {
    setField(19, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasStarship() => $_has(17);
  @$pb.TagNumber(19)
  void clearStarship() => clearField(19);
  @$pb.TagNumber(19)
  BodySettingsData_StarshipConfig ensureStarship() => $_ensure(17);

  @$pb.TagNumber(20)
  $core.int get descAudit => $_getIZ(18);
  @$pb.TagNumber(20)
  set descAudit($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasDescAudit() => $_has(18);
  @$pb.TagNumber(20)
  void clearDescAudit() => clearField(20);
}

class GroupMembers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GroupMembers',
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
            : 'isCreator',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isManager',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GroupMembers._() : super();
  factory GroupMembers({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? isCreator,
    $core.int? isManager,
    $core.int? score,
    $core.int? role,
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
    if (isCreator != null) {
      _result.isCreator = isCreator;
    }
    if (isManager != null) {
      _result.isManager = isManager;
    }
    if (score != null) {
      _result.score = score;
    }
    if (role != null) {
      _result.role = role;
    }
    return _result;
  }
  factory GroupMembers.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GroupMembers.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GroupMembers clone() => GroupMembers()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GroupMembers copyWith(void Function(GroupMembers) updates) =>
      super.copyWith((message) => updates(message as GroupMembers))
          as GroupMembers; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GroupMembers create() => GroupMembers._();
  GroupMembers createEmptyInstance() => create();
  static $pb.PbList<GroupMembers> createRepeated() =>
      $pb.PbList<GroupMembers>();
  @$core.pragma('dart2js:noInline')
  static GroupMembers getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupMembers>(create);
  static GroupMembers? _defaultInstance;

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
  $core.int get isCreator => $_getIZ(3);
  @$pb.TagNumber(4)
  set isCreator($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsCreator() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsCreator() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get isManager => $_getIZ(4);
  @$pb.TagNumber(5)
  set isManager($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsManager() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsManager() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get score => $_getIZ(5);
  @$pb.TagNumber(6)
  set score($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasScore() => $_has(5);
  @$pb.TagNumber(6)
  void clearScore() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get role => $_getIZ(6);
  @$pb.TagNumber(7)
  set role($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRole() => $_has(6);
  @$pb.TagNumber(7)
  void clearRole() => clearField(7);
}

class RespStarshipGetNameCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespStarshipGetNameCard',
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
    ..aOM<StarshipGetNameCardData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: StarshipGetNameCardData.create)
    ..hasRequiredFields = false;

  RespStarshipGetNameCard._() : super();
  factory RespStarshipGetNameCard({
    $core.bool? success,
    $core.String? msg,
    StarshipGetNameCardData? data,
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
  factory RespStarshipGetNameCard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespStarshipGetNameCard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespStarshipGetNameCard clone() =>
      RespStarshipGetNameCard()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespStarshipGetNameCard copyWith(
          void Function(RespStarshipGetNameCard) updates) =>
      super.copyWith((message) => updates(message as RespStarshipGetNameCard))
          as RespStarshipGetNameCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespStarshipGetNameCard create() => RespStarshipGetNameCard._();
  RespStarshipGetNameCard createEmptyInstance() => create();
  static $pb.PbList<RespStarshipGetNameCard> createRepeated() =>
      $pb.PbList<RespStarshipGetNameCard>();
  @$core.pragma('dart2js:noInline')
  static RespStarshipGetNameCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespStarshipGetNameCard>(create);
  static RespStarshipGetNameCard? _defaultInstance;

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
  StarshipGetNameCardData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(StarshipGetNameCardData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  StarshipGetNameCardData ensureData() => $_ensure(2);
}

class StarshipGetNameCardData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StarshipGetNameCardData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasNum',
        $pb.PbFieldType.OU3,
        protoName: 'hasNum')
    ..hasRequiredFields = false;

  StarshipGetNameCardData._() : super();
  factory StarshipGetNameCardData({
    $core.int? cid,
    $core.int? price,
    $core.int? hasNum,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (price != null) {
      _result.price = price;
    }
    if (hasNum != null) {
      _result.hasNum = hasNum;
    }
    return _result;
  }
  factory StarshipGetNameCardData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StarshipGetNameCardData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StarshipGetNameCardData clone() =>
      StarshipGetNameCardData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StarshipGetNameCardData copyWith(
          void Function(StarshipGetNameCardData) updates) =>
      super.copyWith((message) => updates(message as StarshipGetNameCardData))
          as StarshipGetNameCardData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StarshipGetNameCardData create() => StarshipGetNameCardData._();
  StarshipGetNameCardData createEmptyInstance() => create();
  static $pb.PbList<StarshipGetNameCardData> createRepeated() =>
      $pb.PbList<StarshipGetNameCardData>();
  @$core.pragma('dart2js:noInline')
  static StarshipGetNameCardData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StarshipGetNameCardData>(create);
  static StarshipGetNameCardData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get price => $_getIZ(1);
  @$pb.TagNumber(2)
  set price($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get hasNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set hasNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearHasNum() => clearField(3);
}
