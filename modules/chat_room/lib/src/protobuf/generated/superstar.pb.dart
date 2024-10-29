///
//  Generated code. Do not modify.
//  source: superstar.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Banner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Banner',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'link')
    ..hasRequiredFields = false;

  Banner._() : super();
  factory Banner({
    $core.String? image,
    $core.String? link,
  }) {
    final _result = create();
    if (image != null) {
      _result.image = image;
    }
    if (link != null) {
      _result.link = link;
    }
    return _result;
  }
  factory Banner.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Banner.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Banner clone() => Banner()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Banner copyWith(void Function(Banner) updates) =>
      super.copyWith((message) => updates(message as Banner))
          as Banner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Banner create() => Banner._();
  Banner createEmptyInstance() => create();
  static $pb.PbList<Banner> createRepeated() => $pb.PbList<Banner>();
  @$core.pragma('dart2js:noInline')
  static Banner getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Banner>(create);
  static Banner? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get image => $_getSZ(0);
  @$pb.TagNumber(1)
  set image($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get link => $_getSZ(1);
  @$pb.TagNumber(2)
  set link($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLink() => $_has(1);
  @$pb.TagNumber(2)
  void clearLink() => clearField(2);
}

class Task extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Task',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'enableStatus')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardCommodityName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardCommodityIcon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stageStartTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sectionTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  Task._() : super();
  factory Task({
    $core.bool? enableStatus,
    $core.String? rewardCommodityName,
    $core.String? rewardCommodityIcon,
    $core.int? stageStartTime,
    $core.int? sectionTime,
  }) {
    final _result = create();
    if (enableStatus != null) {
      _result.enableStatus = enableStatus;
    }
    if (rewardCommodityName != null) {
      _result.rewardCommodityName = rewardCommodityName;
    }
    if (rewardCommodityIcon != null) {
      _result.rewardCommodityIcon = rewardCommodityIcon;
    }
    if (stageStartTime != null) {
      _result.stageStartTime = stageStartTime;
    }
    if (sectionTime != null) {
      _result.sectionTime = sectionTime;
    }
    return _result;
  }
  factory Task.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Task.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Task clone() => Task()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Task copyWith(void Function(Task) updates) =>
      super.copyWith((message) => updates(message as Task))
          as Task; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Task create() => Task._();
  Task createEmptyInstance() => create();
  static $pb.PbList<Task> createRepeated() => $pb.PbList<Task>();
  @$core.pragma('dart2js:noInline')
  static Task getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Task>(create);
  static Task? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enableStatus => $_getBF(0);
  @$pb.TagNumber(1)
  set enableStatus($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEnableStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnableStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get rewardCommodityName => $_getSZ(1);
  @$pb.TagNumber(2)
  set rewardCommodityName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRewardCommodityName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRewardCommodityName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get rewardCommodityIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set rewardCommodityIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRewardCommodityIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearRewardCommodityIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get stageStartTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set stageStartTime($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStageStartTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearStageStartTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get sectionTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set sectionTime($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSectionTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearSectionTime() => clearField(5);
}

class SuperstarInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuperstarInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<Banner>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'banner',
        subBuilder: Banner.create)
    ..aOM<Task>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineTask',
        subBuilder: Task.create)
    ..hasRequiredFields = false;

  SuperstarInfo._() : super();
  factory SuperstarInfo({
    Banner? banner,
    Task? onlineTask,
  }) {
    final _result = create();
    if (banner != null) {
      _result.banner = banner;
    }
    if (onlineTask != null) {
      _result.onlineTask = onlineTask;
    }
    return _result;
  }
  factory SuperstarInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuperstarInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuperstarInfo clone() => SuperstarInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuperstarInfo copyWith(void Function(SuperstarInfo) updates) =>
      super.copyWith((message) => updates(message as SuperstarInfo))
          as SuperstarInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuperstarInfo create() => SuperstarInfo._();
  SuperstarInfo createEmptyInstance() => create();
  static $pb.PbList<SuperstarInfo> createRepeated() =>
      $pb.PbList<SuperstarInfo>();
  @$core.pragma('dart2js:noInline')
  static SuperstarInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuperstarInfo>(create);
  static SuperstarInfo? _defaultInstance;

  @$pb.TagNumber(1)
  Banner get banner => $_getN(0);
  @$pb.TagNumber(1)
  set banner(Banner v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBanner() => $_has(0);
  @$pb.TagNumber(1)
  void clearBanner() => clearField(1);
  @$pb.TagNumber(1)
  Banner ensureBanner() => $_ensure(0);

  @$pb.TagNumber(2)
  Task get onlineTask => $_getN(1);
  @$pb.TagNumber(2)
  set onlineTask(Task v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOnlineTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearOnlineTask() => clearField(2);
  @$pb.TagNumber(2)
  Task ensureOnlineTask() => $_ensure(1);
}

class RewardInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RewardInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RewardInfo._() : super();
  factory RewardInfo({
    $core.String? name,
    $core.String? icon,
    $core.int? num,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (num != null) {
      _result.num = num;
    }
    return _result;
  }
  factory RewardInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RewardInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RewardInfo clone() => RewardInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RewardInfo copyWith(void Function(RewardInfo) updates) =>
      super.copyWith((message) => updates(message as RewardInfo))
          as RewardInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RewardInfo create() => RewardInfo._();
  RewardInfo createEmptyInstance() => create();
  static $pb.PbList<RewardInfo> createRepeated() => $pb.PbList<RewardInfo>();
  @$core.pragma('dart2js:noInline')
  static RewardInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RewardInfo>(create);
  static RewardInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

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
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => clearField(3);
}

class RewardData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RewardData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<RewardInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardInfo',
        subBuilder: RewardInfo.create)
    ..hasRequiredFields = false;

  RewardData._() : super();
  factory RewardData({
    RewardInfo? rewardInfo,
  }) {
    final _result = create();
    if (rewardInfo != null) {
      _result.rewardInfo = rewardInfo;
    }
    return _result;
  }
  factory RewardData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RewardData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RewardData clone() => RewardData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RewardData copyWith(void Function(RewardData) updates) =>
      super.copyWith((message) => updates(message as RewardData))
          as RewardData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RewardData create() => RewardData._();
  RewardData createEmptyInstance() => create();
  static $pb.PbList<RewardData> createRepeated() => $pb.PbList<RewardData>();
  @$core.pragma('dart2js:noInline')
  static RewardData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RewardData>(create);
  static RewardData? _defaultInstance;

  @$pb.TagNumber(1)
  RewardInfo get rewardInfo => $_getN(0);
  @$pb.TagNumber(1)
  set rewardInfo(RewardInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRewardInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearRewardInfo() => clearField(1);
  @$pb.TagNumber(1)
  RewardInfo ensureRewardInfo() => $_ensure(0);
}

class ResSuperstarInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuperstarInfo',
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
    ..aOM<SuperstarInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SuperstarInfo.create)
    ..hasRequiredFields = false;

  ResSuperstarInfo._() : super();
  factory ResSuperstarInfo({
    $core.bool? success,
    $core.String? msg,
    SuperstarInfo? data,
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
  factory ResSuperstarInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuperstarInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuperstarInfo clone() => ResSuperstarInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuperstarInfo copyWith(void Function(ResSuperstarInfo) updates) =>
      super.copyWith((message) => updates(message as ResSuperstarInfo))
          as ResSuperstarInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuperstarInfo create() => ResSuperstarInfo._();
  ResSuperstarInfo createEmptyInstance() => create();
  static $pb.PbList<ResSuperstarInfo> createRepeated() =>
      $pb.PbList<ResSuperstarInfo>();
  @$core.pragma('dart2js:noInline')
  static ResSuperstarInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuperstarInfo>(create);
  static ResSuperstarInfo? _defaultInstance;

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
  SuperstarInfo get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SuperstarInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SuperstarInfo ensureData() => $_ensure(2);
}

class ResSuperstarGetReward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuperstarGetReward',
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
    ..aOM<RewardData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RewardData.create)
    ..hasRequiredFields = false;

  ResSuperstarGetReward._() : super();
  factory ResSuperstarGetReward({
    $core.bool? success,
    $core.String? msg,
    RewardData? data,
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
  factory ResSuperstarGetReward.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuperstarGetReward.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuperstarGetReward clone() =>
      ResSuperstarGetReward()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuperstarGetReward copyWith(
          void Function(ResSuperstarGetReward) updates) =>
      super.copyWith((message) => updates(message as ResSuperstarGetReward))
          as ResSuperstarGetReward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuperstarGetReward create() => ResSuperstarGetReward._();
  ResSuperstarGetReward createEmptyInstance() => create();
  static $pb.PbList<ResSuperstarGetReward> createRepeated() =>
      $pb.PbList<ResSuperstarGetReward>();
  @$core.pragma('dart2js:noInline')
  static ResSuperstarGetReward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuperstarGetReward>(create);
  static ResSuperstarGetReward? _defaultInstance;

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
  RewardData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RewardData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RewardData ensureData() => $_ensure(2);
}
