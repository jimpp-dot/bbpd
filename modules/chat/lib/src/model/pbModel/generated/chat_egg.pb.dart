///
//  Generated code. Do not modify.
//  source: chat_egg.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PopData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PopData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'needPop',
        protoName: 'needPop')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popTitle',
        protoName: 'popTitle')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popContent',
        protoName: 'popContent')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskStep',
        $pb.PbFieldType.OU3,
        protoName: 'taskStep')
    ..pc<TaskGiftReward>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftRewardList',
        $pb.PbFieldType.PM,
        protoName: 'giftRewardList',
        subBuilder: TaskGiftReward.create)
    ..hasRequiredFields = false;

  PopData._() : super();
  factory PopData({
    $core.bool? needPop,
    $core.String? popTitle,
    $core.String? popContent,
    $core.int? taskStep,
    $core.Iterable<TaskGiftReward>? giftRewardList,
  }) {
    final _result = create();
    if (needPop != null) {
      _result.needPop = needPop;
    }
    if (popTitle != null) {
      _result.popTitle = popTitle;
    }
    if (popContent != null) {
      _result.popContent = popContent;
    }
    if (taskStep != null) {
      _result.taskStep = taskStep;
    }
    if (giftRewardList != null) {
      _result.giftRewardList.addAll(giftRewardList);
    }
    return _result;
  }
  factory PopData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PopData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PopData clone() => PopData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PopData copyWith(void Function(PopData) updates) =>
      super.copyWith((message) => updates(message as PopData))
          as PopData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PopData create() => PopData._();
  PopData createEmptyInstance() => create();
  static $pb.PbList<PopData> createRepeated() => $pb.PbList<PopData>();
  @$core.pragma('dart2js:noInline')
  static PopData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PopData>(create);
  static PopData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get needPop => $_getBF(0);
  @$pb.TagNumber(1)
  set needPop($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNeedPop() => $_has(0);
  @$pb.TagNumber(1)
  void clearNeedPop() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get popTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set popTitle($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPopTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearPopTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get popContent => $_getSZ(2);
  @$pb.TagNumber(3)
  set popContent($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPopContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearPopContent() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get taskStep => $_getIZ(3);
  @$pb.TagNumber(4)
  set taskStep($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTaskStep() => $_has(3);
  @$pb.TagNumber(4)
  void clearTaskStep() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<TaskGiftReward> get giftRewardList => $_getList(4);
}

class TaskBar extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TaskBar',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskTitle',
        protoName: 'taskTitle')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskDesc',
        protoName: 'taskDesc')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'curProgress',
        $pb.PbFieldType.OU3,
        protoName: 'curProgress')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalProgress',
        $pb.PbFieldType.OU3,
        protoName: 'totalProgress')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftSecond',
        $pb.PbFieldType.OU3,
        protoName: 'leftSecond')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskStep',
        $pb.PbFieldType.OU3,
        protoName: 'taskStep')
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isShow',
        protoName: 'isShow')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popImg',
        protoName: 'popImg')
    ..hasRequiredFields = false;

  TaskBar._() : super();
  factory TaskBar({
    $core.String? taskTitle,
    $core.String? taskDesc,
    $core.int? curProgress,
    $core.int? totalProgress,
    $core.int? leftSecond,
    $core.int? taskStep,
    $core.bool? isShow,
    $core.String? popImg,
  }) {
    final _result = create();
    if (taskTitle != null) {
      _result.taskTitle = taskTitle;
    }
    if (taskDesc != null) {
      _result.taskDesc = taskDesc;
    }
    if (curProgress != null) {
      _result.curProgress = curProgress;
    }
    if (totalProgress != null) {
      _result.totalProgress = totalProgress;
    }
    if (leftSecond != null) {
      _result.leftSecond = leftSecond;
    }
    if (taskStep != null) {
      _result.taskStep = taskStep;
    }
    if (isShow != null) {
      _result.isShow = isShow;
    }
    if (popImg != null) {
      _result.popImg = popImg;
    }
    return _result;
  }
  factory TaskBar.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TaskBar.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TaskBar clone() => TaskBar()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TaskBar copyWith(void Function(TaskBar) updates) =>
      super.copyWith((message) => updates(message as TaskBar))
          as TaskBar; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TaskBar create() => TaskBar._();
  TaskBar createEmptyInstance() => create();
  static $pb.PbList<TaskBar> createRepeated() => $pb.PbList<TaskBar>();
  @$core.pragma('dart2js:noInline')
  static TaskBar getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskBar>(create);
  static TaskBar? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskTitle => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskTitle($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTaskTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get taskDesc => $_getSZ(1);
  @$pb.TagNumber(2)
  set taskDesc($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTaskDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearTaskDesc() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get curProgress => $_getIZ(2);
  @$pb.TagNumber(3)
  set curProgress($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCurProgress() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurProgress() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalProgress => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalProgress($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTotalProgress() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalProgress() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get leftSecond => $_getIZ(4);
  @$pb.TagNumber(5)
  set leftSecond($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLeftSecond() => $_has(4);
  @$pb.TagNumber(5)
  void clearLeftSecond() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get taskStep => $_getIZ(5);
  @$pb.TagNumber(6)
  set taskStep($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTaskStep() => $_has(5);
  @$pb.TagNumber(6)
  void clearTaskStep() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isShow => $_getBF(6);
  @$pb.TagNumber(7)
  set isShow($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIsShow() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsShow() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get popImg => $_getSZ(7);
  @$pb.TagNumber(8)
  set popImg($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPopImg() => $_has(7);
  @$pb.TagNumber(8)
  void clearPopImg() => clearField(8);
}

class EggTipsData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EggTipsData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<PopData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pop',
        subBuilder: PopData.create)
    ..aOM<TaskBar>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bar',
        subBuilder: TaskBar.create)
    ..hasRequiredFields = false;

  EggTipsData._() : super();
  factory EggTipsData({
    PopData? pop,
    TaskBar? bar,
  }) {
    final _result = create();
    if (pop != null) {
      _result.pop = pop;
    }
    if (bar != null) {
      _result.bar = bar;
    }
    return _result;
  }
  factory EggTipsData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EggTipsData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EggTipsData clone() => EggTipsData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EggTipsData copyWith(void Function(EggTipsData) updates) =>
      super.copyWith((message) => updates(message as EggTipsData))
          as EggTipsData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EggTipsData create() => EggTipsData._();
  EggTipsData createEmptyInstance() => create();
  static $pb.PbList<EggTipsData> createRepeated() => $pb.PbList<EggTipsData>();
  @$core.pragma('dart2js:noInline')
  static EggTipsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EggTipsData>(create);
  static EggTipsData? _defaultInstance;

  @$pb.TagNumber(1)
  PopData get pop => $_getN(0);
  @$pb.TagNumber(1)
  set pop(PopData v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPop() => $_has(0);
  @$pb.TagNumber(1)
  void clearPop() => clearField(1);
  @$pb.TagNumber(1)
  PopData ensurePop() => $_ensure(0);

  @$pb.TagNumber(2)
  TaskBar get bar => $_getN(1);
  @$pb.TagNumber(2)
  set bar(TaskBar v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBar() => $_has(1);
  @$pb.TagNumber(2)
  void clearBar() => clearField(2);
  @$pb.TagNumber(2)
  TaskBar ensureBar() => $_ensure(1);
}

class ResChatEggTips extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResChatEggTips',
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
    ..aOM<EggTipsData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: EggTipsData.create)
    ..hasRequiredFields = false;

  ResChatEggTips._() : super();
  factory ResChatEggTips({
    $core.bool? success,
    $core.String? msg,
    EggTipsData? data,
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
  factory ResChatEggTips.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResChatEggTips.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResChatEggTips clone() => ResChatEggTips()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResChatEggTips copyWith(void Function(ResChatEggTips) updates) =>
      super.copyWith((message) => updates(message as ResChatEggTips))
          as ResChatEggTips; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResChatEggTips create() => ResChatEggTips._();
  ResChatEggTips createEmptyInstance() => create();
  static $pb.PbList<ResChatEggTips> createRepeated() =>
      $pb.PbList<ResChatEggTips>();
  @$core.pragma('dart2js:noInline')
  static ResChatEggTips getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResChatEggTips>(create);
  static ResChatEggTips? _defaultInstance;

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
  EggTipsData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(EggTipsData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  EggTipsData ensureData() => $_ensure(2);
}

class TaskGiftReward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TaskGiftReward',
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
            : 'num',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  TaskGiftReward._() : super();
  factory TaskGiftReward({
    $core.String? icon,
    $core.String? name,
    $core.int? num,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (num != null) {
      _result.num = num;
    }
    return _result;
  }
  factory TaskGiftReward.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TaskGiftReward.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TaskGiftReward clone() => TaskGiftReward()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TaskGiftReward copyWith(void Function(TaskGiftReward) updates) =>
      super.copyWith((message) => updates(message as TaskGiftReward))
          as TaskGiftReward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TaskGiftReward create() => TaskGiftReward._();
  TaskGiftReward createEmptyInstance() => create();
  static $pb.PbList<TaskGiftReward> createRepeated() =>
      $pb.PbList<TaskGiftReward>();
  @$core.pragma('dart2js:noInline')
  static TaskGiftReward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TaskGiftReward>(create);
  static TaskGiftReward? _defaultInstance;

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

class TaskRewardData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TaskRewardData',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chatEggTitle',
        $pb.PbFieldType.OU3,
        protoName: 'chatEggTitle')
    ..pc<TaskGiftReward>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftRewardList',
        $pb.PbFieldType.PM,
        protoName: 'giftRewardList',
        subBuilder: TaskGiftReward.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chatEggTitleName',
        protoName: 'chatEggTitleName')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chatEggTitleColor',
        protoName: 'chatEggTitleColor')
    ..pPS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chatEggTitleBolder',
        protoName: 'chatEggTitleBolder')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  TaskRewardData._() : super();
  factory TaskRewardData({
    $core.String? name,
    $core.int? chatEggTitle,
    $core.Iterable<TaskGiftReward>? giftRewardList,
    $core.String? chatEggTitleName,
    $core.String? chatEggTitleColor,
    $core.Iterable<$core.String>? chatEggTitleBolder,
    $core.String? desc,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (chatEggTitle != null) {
      _result.chatEggTitle = chatEggTitle;
    }
    if (giftRewardList != null) {
      _result.giftRewardList.addAll(giftRewardList);
    }
    if (chatEggTitleName != null) {
      _result.chatEggTitleName = chatEggTitleName;
    }
    if (chatEggTitleColor != null) {
      _result.chatEggTitleColor = chatEggTitleColor;
    }
    if (chatEggTitleBolder != null) {
      _result.chatEggTitleBolder.addAll(chatEggTitleBolder);
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory TaskRewardData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TaskRewardData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TaskRewardData clone() => TaskRewardData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TaskRewardData copyWith(void Function(TaskRewardData) updates) =>
      super.copyWith((message) => updates(message as TaskRewardData))
          as TaskRewardData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TaskRewardData create() => TaskRewardData._();
  TaskRewardData createEmptyInstance() => create();
  static $pb.PbList<TaskRewardData> createRepeated() =>
      $pb.PbList<TaskRewardData>();
  @$core.pragma('dart2js:noInline')
  static TaskRewardData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TaskRewardData>(create);
  static TaskRewardData? _defaultInstance;

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
  $core.int get chatEggTitle => $_getIZ(1);
  @$pb.TagNumber(2)
  set chatEggTitle($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasChatEggTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearChatEggTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<TaskGiftReward> get giftRewardList => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get chatEggTitleName => $_getSZ(3);
  @$pb.TagNumber(4)
  set chatEggTitleName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasChatEggTitleName() => $_has(3);
  @$pb.TagNumber(4)
  void clearChatEggTitleName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get chatEggTitleColor => $_getSZ(4);
  @$pb.TagNumber(5)
  set chatEggTitleColor($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasChatEggTitleColor() => $_has(4);
  @$pb.TagNumber(5)
  void clearChatEggTitleColor() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get chatEggTitleBolder => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get desc => $_getSZ(6);
  @$pb.TagNumber(7)
  set desc($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDesc() => $_has(6);
  @$pb.TagNumber(7)
  void clearDesc() => clearField(7);
}

class DetailData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DetailData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<TaskBar>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bar',
        subBuilder: TaskBar.create)
    ..pc<TaskRewardData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: TaskRewardData.create)
    ..hasRequiredFields = false;

  DetailData._() : super();
  factory DetailData({
    TaskBar? bar,
    $core.Iterable<TaskRewardData>? list,
  }) {
    final _result = create();
    if (bar != null) {
      _result.bar = bar;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory DetailData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DetailData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DetailData clone() => DetailData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DetailData copyWith(void Function(DetailData) updates) =>
      super.copyWith((message) => updates(message as DetailData))
          as DetailData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DetailData create() => DetailData._();
  DetailData createEmptyInstance() => create();
  static $pb.PbList<DetailData> createRepeated() => $pb.PbList<DetailData>();
  @$core.pragma('dart2js:noInline')
  static DetailData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DetailData>(create);
  static DetailData? _defaultInstance;

  @$pb.TagNumber(1)
  TaskBar get bar => $_getN(0);
  @$pb.TagNumber(1)
  set bar(TaskBar v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBar() => $_has(0);
  @$pb.TagNumber(1)
  void clearBar() => clearField(1);
  @$pb.TagNumber(1)
  TaskBar ensureBar() => $_ensure(0);

  @$pb.TagNumber(3)
  $core.List<TaskRewardData> get list => $_getList(1);
}

class ResChatEggDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResChatEggDetail',
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
    ..aOM<DetailData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: DetailData.create)
    ..hasRequiredFields = false;

  ResChatEggDetail._() : super();
  factory ResChatEggDetail({
    $core.bool? success,
    $core.String? msg,
    DetailData? data,
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
  factory ResChatEggDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResChatEggDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResChatEggDetail clone() => ResChatEggDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResChatEggDetail copyWith(void Function(ResChatEggDetail) updates) =>
      super.copyWith((message) => updates(message as ResChatEggDetail))
          as ResChatEggDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResChatEggDetail create() => ResChatEggDetail._();
  ResChatEggDetail createEmptyInstance() => create();
  static $pb.PbList<ResChatEggDetail> createRepeated() =>
      $pb.PbList<ResChatEggDetail>();
  @$core.pragma('dart2js:noInline')
  static ResChatEggDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResChatEggDetail>(create);
  static ResChatEggDetail? _defaultInstance;

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
  DetailData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(DetailData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  DetailData ensureData() => $_ensure(2);
}

class ItemForbidDirtMsgData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ItemForbidDirtMsgData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'needForbidChat')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ItemForbidDirtMsgData._() : super();
  factory ItemForbidDirtMsgData({
    $core.bool? needForbidChat,
    $core.int? endTime,
  }) {
    final _result = create();
    if (needForbidChat != null) {
      _result.needForbidChat = needForbidChat;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    return _result;
  }
  factory ItemForbidDirtMsgData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ItemForbidDirtMsgData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ItemForbidDirtMsgData clone() =>
      ItemForbidDirtMsgData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ItemForbidDirtMsgData copyWith(
          void Function(ItemForbidDirtMsgData) updates) =>
      super.copyWith((message) => updates(message as ItemForbidDirtMsgData))
          as ItemForbidDirtMsgData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ItemForbidDirtMsgData create() => ItemForbidDirtMsgData._();
  ItemForbidDirtMsgData createEmptyInstance() => create();
  static $pb.PbList<ItemForbidDirtMsgData> createRepeated() =>
      $pb.PbList<ItemForbidDirtMsgData>();
  @$core.pragma('dart2js:noInline')
  static ItemForbidDirtMsgData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ItemForbidDirtMsgData>(create);
  static ItemForbidDirtMsgData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get needForbidChat => $_getBF(0);
  @$pb.TagNumber(1)
  set needForbidChat($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNeedForbidChat() => $_has(0);
  @$pb.TagNumber(1)
  void clearNeedForbidChat() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get endTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set endTime($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEndTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndTime() => clearField(2);
}

class ResForbidDirtMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResForbidDirtMsg',
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
    ..aOM<ItemForbidDirtMsgData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ItemForbidDirtMsgData.create)
    ..hasRequiredFields = false;

  ResForbidDirtMsg._() : super();
  factory ResForbidDirtMsg({
    $core.bool? success,
    $core.String? msg,
    ItemForbidDirtMsgData? data,
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
  factory ResForbidDirtMsg.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResForbidDirtMsg.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResForbidDirtMsg clone() => ResForbidDirtMsg()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResForbidDirtMsg copyWith(void Function(ResForbidDirtMsg) updates) =>
      super.copyWith((message) => updates(message as ResForbidDirtMsg))
          as ResForbidDirtMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResForbidDirtMsg create() => ResForbidDirtMsg._();
  ResForbidDirtMsg createEmptyInstance() => create();
  static $pb.PbList<ResForbidDirtMsg> createRepeated() =>
      $pb.PbList<ResForbidDirtMsg>();
  @$core.pragma('dart2js:noInline')
  static ResForbidDirtMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResForbidDirtMsg>(create);
  static ResForbidDirtMsg? _defaultInstance;

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
  ItemForbidDirtMsgData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ItemForbidDirtMsgData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ItemForbidDirtMsgData ensureData() => $_ensure(2);
}
