///
//  Generated code. Do not modify.
//  source: api_room_challenge.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResChallengeData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResChallengeData',
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
    ..aOM<ChallengeData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ChallengeData.create)
    ..hasRequiredFields = false;

  ResChallengeData._() : super();
  factory ResChallengeData({
    $core.bool? success,
    $core.String? msg,
    ChallengeData? data,
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
  factory ResChallengeData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResChallengeData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResChallengeData clone() => ResChallengeData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResChallengeData copyWith(void Function(ResChallengeData) updates) =>
      super.copyWith((message) => updates(message as ResChallengeData))
          as ResChallengeData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResChallengeData create() => ResChallengeData._();
  ResChallengeData createEmptyInstance() => create();
  static $pb.PbList<ResChallengeData> createRepeated() =>
      $pb.PbList<ResChallengeData>();
  @$core.pragma('dart2js:noInline')
  static ResChallengeData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResChallengeData>(create);
  static ResChallengeData? _defaultInstance;

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
  ChallengeData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ChallengeData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ChallengeData ensureData() => $_ensure(2);
}

class ChallengeData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ChallengeData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskName')
    ..aOM<ChallengeDataUserInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userInfo',
        subBuilder: ChallengeDataUserInfo.create)
    ..pc<ChallengeDataTaskData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskData',
        $pb.PbFieldType.PM,
        subBuilder: ChallengeDataTaskData.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'helpTxt')
    ..hasRequiredFields = false;

  ChallengeData._() : super();
  factory ChallengeData({
    $core.String? taskName,
    ChallengeDataUserInfo? userInfo,
    $core.Iterable<ChallengeDataTaskData>? taskData,
    $core.String? helpTxt,
  }) {
    final _result = create();
    if (taskName != null) {
      _result.taskName = taskName;
    }
    if (userInfo != null) {
      _result.userInfo = userInfo;
    }
    if (taskData != null) {
      _result.taskData.addAll(taskData);
    }
    if (helpTxt != null) {
      _result.helpTxt = helpTxt;
    }
    return _result;
  }
  factory ChallengeData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChallengeData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChallengeData clone() => ChallengeData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChallengeData copyWith(void Function(ChallengeData) updates) =>
      super.copyWith((message) => updates(message as ChallengeData))
          as ChallengeData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChallengeData create() => ChallengeData._();
  ChallengeData createEmptyInstance() => create();
  static $pb.PbList<ChallengeData> createRepeated() =>
      $pb.PbList<ChallengeData>();
  @$core.pragma('dart2js:noInline')
  static ChallengeData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChallengeData>(create);
  static ChallengeData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskName => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTaskName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskName() => clearField(1);

  @$pb.TagNumber(2)
  ChallengeDataUserInfo get userInfo => $_getN(1);
  @$pb.TagNumber(2)
  set userInfo(ChallengeDataUserInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserInfo() => clearField(2);
  @$pb.TagNumber(2)
  ChallengeDataUserInfo ensureUserInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<ChallengeDataTaskData> get taskData => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get helpTxt => $_getSZ(3);
  @$pb.TagNumber(4)
  set helpTxt($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHelpTxt() => $_has(3);
  @$pb.TagNumber(4)
  void clearHelpTxt() => clearField(4);
}

class ChallengeDataUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ChallengeDataUserInfo',
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
            : 'popularity',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starsCount',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fansNum',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ChallengeDataUserInfo._() : super();
  factory ChallengeDataUserInfo({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? popularity,
    $core.int? starsCount,
    $core.int? fansNum,
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
    if (popularity != null) {
      _result.popularity = popularity;
    }
    if (starsCount != null) {
      _result.starsCount = starsCount;
    }
    if (fansNum != null) {
      _result.fansNum = fansNum;
    }
    return _result;
  }
  factory ChallengeDataUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChallengeDataUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChallengeDataUserInfo clone() =>
      ChallengeDataUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChallengeDataUserInfo copyWith(
          void Function(ChallengeDataUserInfo) updates) =>
      super.copyWith((message) => updates(message as ChallengeDataUserInfo))
          as ChallengeDataUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChallengeDataUserInfo create() => ChallengeDataUserInfo._();
  ChallengeDataUserInfo createEmptyInstance() => create();
  static $pb.PbList<ChallengeDataUserInfo> createRepeated() =>
      $pb.PbList<ChallengeDataUserInfo>();
  @$core.pragma('dart2js:noInline')
  static ChallengeDataUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChallengeDataUserInfo>(create);
  static ChallengeDataUserInfo? _defaultInstance;

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
  $core.int get popularity => $_getIZ(3);
  @$pb.TagNumber(4)
  set popularity($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPopularity() => $_has(3);
  @$pb.TagNumber(4)
  void clearPopularity() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get starsCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set starsCount($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStarsCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearStarsCount() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get fansNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set fansNum($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFansNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearFansNum() => clearField(6);
}

class ChallengeDataTaskData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ChallengeDataTaskData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'percent',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardPopularity',
        $pb.PbFieldType.O3)
    ..pc<ChallengeDataTaskList>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskList',
        $pb.PbFieldType.PM,
        subBuilder: ChallengeDataTaskList.create)
    ..pc<ChallengeDataRewardItem>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardShow',
        $pb.PbFieldType.PM,
        subBuilder: ChallengeDataRewardItem.create)
    ..hasRequiredFields = false;

  ChallengeDataTaskData._() : super();
  factory ChallengeDataTaskData({
    $core.int? status,
    $core.int? percent,
    $core.int? awardPopularity,
    $core.Iterable<ChallengeDataTaskList>? taskList,
    $core.Iterable<ChallengeDataRewardItem>? rewardShow,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (percent != null) {
      _result.percent = percent;
    }
    if (awardPopularity != null) {
      _result.awardPopularity = awardPopularity;
    }
    if (taskList != null) {
      _result.taskList.addAll(taskList);
    }
    if (rewardShow != null) {
      _result.rewardShow.addAll(rewardShow);
    }
    return _result;
  }
  factory ChallengeDataTaskData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChallengeDataTaskData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChallengeDataTaskData clone() =>
      ChallengeDataTaskData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChallengeDataTaskData copyWith(
          void Function(ChallengeDataTaskData) updates) =>
      super.copyWith((message) => updates(message as ChallengeDataTaskData))
          as ChallengeDataTaskData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChallengeDataTaskData create() => ChallengeDataTaskData._();
  ChallengeDataTaskData createEmptyInstance() => create();
  static $pb.PbList<ChallengeDataTaskData> createRepeated() =>
      $pb.PbList<ChallengeDataTaskData>();
  @$core.pragma('dart2js:noInline')
  static ChallengeDataTaskData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChallengeDataTaskData>(create);
  static ChallengeDataTaskData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get percent => $_getIZ(1);
  @$pb.TagNumber(2)
  set percent($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPercent() => $_has(1);
  @$pb.TagNumber(2)
  void clearPercent() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get awardPopularity => $_getIZ(2);
  @$pb.TagNumber(3)
  set awardPopularity($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAwardPopularity() => $_has(2);
  @$pb.TagNumber(3)
  void clearAwardPopularity() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<ChallengeDataTaskList> get taskList => $_getList(3);

  @$pb.TagNumber(7)
  $core.List<ChallengeDataRewardItem> get rewardShow => $_getList(4);
}

class ChallengeDataTaskList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ChallengeDataTaskList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
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
            : 'completeNum',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxNum',
        $pb.PbFieldType.O3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'process')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'percent',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ChallengeDataTaskList._() : super();
  factory ChallengeDataTaskList({
    $core.String? icon,
    $core.String? name,
    $core.int? completeNum,
    $core.int? maxNum,
    $core.String? process,
    $core.int? percent,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (completeNum != null) {
      _result.completeNum = completeNum;
    }
    if (maxNum != null) {
      _result.maxNum = maxNum;
    }
    if (process != null) {
      _result.process = process;
    }
    if (percent != null) {
      _result.percent = percent;
    }
    return _result;
  }
  factory ChallengeDataTaskList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChallengeDataTaskList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChallengeDataTaskList clone() =>
      ChallengeDataTaskList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChallengeDataTaskList copyWith(
          void Function(ChallengeDataTaskList) updates) =>
      super.copyWith((message) => updates(message as ChallengeDataTaskList))
          as ChallengeDataTaskList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChallengeDataTaskList create() => ChallengeDataTaskList._();
  ChallengeDataTaskList createEmptyInstance() => create();
  static $pb.PbList<ChallengeDataTaskList> createRepeated() =>
      $pb.PbList<ChallengeDataTaskList>();
  @$core.pragma('dart2js:noInline')
  static ChallengeDataTaskList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChallengeDataTaskList>(create);
  static ChallengeDataTaskList? _defaultInstance;

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
  $core.int get completeNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set completeNum($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCompleteNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearCompleteNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get maxNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxNum($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMaxNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get process => $_getSZ(4);
  @$pb.TagNumber(5)
  set process($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasProcess() => $_has(4);
  @$pb.TagNumber(5)
  void clearProcess() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get percent => $_getIZ(5);
  @$pb.TagNumber(6)
  set percent($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPercent() => $_has(5);
  @$pb.TagNumber(6)
  void clearPercent() => clearField(6);
}

class ChallengeDataRewardItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ChallengeDataRewardItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
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
            : 'title')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'smallIconDesc')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'remark')
    ..hasRequiredFields = false;

  ChallengeDataRewardItem._() : super();
  factory ChallengeDataRewardItem({
    $core.String? icon,
    $core.String? title,
    $core.String? desc,
    $core.String? smallIconDesc,
    $core.String? remark,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (title != null) {
      _result.title = title;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (smallIconDesc != null) {
      _result.smallIconDesc = smallIconDesc;
    }
    if (remark != null) {
      _result.remark = remark;
    }
    return _result;
  }
  factory ChallengeDataRewardItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChallengeDataRewardItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChallengeDataRewardItem clone() =>
      ChallengeDataRewardItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChallengeDataRewardItem copyWith(
          void Function(ChallengeDataRewardItem) updates) =>
      super.copyWith((message) => updates(message as ChallengeDataRewardItem))
          as ChallengeDataRewardItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChallengeDataRewardItem create() => ChallengeDataRewardItem._();
  ChallengeDataRewardItem createEmptyInstance() => create();
  static $pb.PbList<ChallengeDataRewardItem> createRepeated() =>
      $pb.PbList<ChallengeDataRewardItem>();
  @$core.pragma('dart2js:noInline')
  static ChallengeDataRewardItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChallengeDataRewardItem>(create);
  static ChallengeDataRewardItem? _defaultInstance;

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
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get smallIconDesc => $_getSZ(3);
  @$pb.TagNumber(4)
  set smallIconDesc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSmallIconDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearSmallIconDesc() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get remark => $_getSZ(4);
  @$pb.TagNumber(5)
  set remark($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRemark() => $_has(4);
  @$pb.TagNumber(5)
  void clearRemark() => clearField(5);
}
