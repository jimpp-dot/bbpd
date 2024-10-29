///
//  Generated code. Do not modify.
//  source: square.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SquareTaskInfo_scoreItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquareTaskInfo.scoreItem',
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
            : 'score',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  SquareTaskInfo_scoreItem._() : super();
  factory SquareTaskInfo_scoreItem({
    $core.String? name,
    $core.int? score,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory SquareTaskInfo_scoreItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquareTaskInfo_scoreItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquareTaskInfo_scoreItem clone() =>
      SquareTaskInfo_scoreItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquareTaskInfo_scoreItem copyWith(
          void Function(SquareTaskInfo_scoreItem) updates) =>
      super.copyWith((message) => updates(message as SquareTaskInfo_scoreItem))
          as SquareTaskInfo_scoreItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquareTaskInfo_scoreItem create() => SquareTaskInfo_scoreItem._();
  SquareTaskInfo_scoreItem createEmptyInstance() => create();
  static $pb.PbList<SquareTaskInfo_scoreItem> createRepeated() =>
      $pb.PbList<SquareTaskInfo_scoreItem>();
  @$core.pragma('dart2js:noInline')
  static SquareTaskInfo_scoreItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SquareTaskInfo_scoreItem>(create);
  static SquareTaskInfo_scoreItem? _defaultInstance;

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
  $core.int get score => $_getIZ(1);
  @$pb.TagNumber(2)
  set score($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => clearField(2);
}

class SquareTaskInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquareTaskInfo',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..pc<SquareTaskInfo_scoreItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scoreList',
        $pb.PbFieldType.PM,
        subBuilder: SquareTaskInfo_scoreItem.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.O3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hint')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'doneNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SquareTaskInfo._() : super();
  factory SquareTaskInfo({
    $core.int? id,
    $core.String? name,
    $core.String? icon,
    $core.String? type,
    $core.Iterable<SquareTaskInfo_scoreItem>? scoreList,
    $core.int? status,
    $core.String? hint,
    $core.int? doneNum,
    $core.int? totalNum,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
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
    if (scoreList != null) {
      _result.scoreList.addAll(scoreList);
    }
    if (status != null) {
      _result.status = status;
    }
    if (hint != null) {
      _result.hint = hint;
    }
    if (doneNum != null) {
      _result.doneNum = doneNum;
    }
    if (totalNum != null) {
      _result.totalNum = totalNum;
    }
    return _result;
  }
  factory SquareTaskInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquareTaskInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquareTaskInfo clone() => SquareTaskInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquareTaskInfo copyWith(void Function(SquareTaskInfo) updates) =>
      super.copyWith((message) => updates(message as SquareTaskInfo))
          as SquareTaskInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquareTaskInfo create() => SquareTaskInfo._();
  SquareTaskInfo createEmptyInstance() => create();
  static $pb.PbList<SquareTaskInfo> createRepeated() =>
      $pb.PbList<SquareTaskInfo>();
  @$core.pragma('dart2js:noInline')
  static SquareTaskInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SquareTaskInfo>(create);
  static SquareTaskInfo? _defaultInstance;

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
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<SquareTaskInfo_scoreItem> get scoreList => $_getList(4);

  @$pb.TagNumber(6)
  $core.int get status => $_getIZ(5);
  @$pb.TagNumber(6)
  set status($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get hint => $_getSZ(6);
  @$pb.TagNumber(7)
  set hint($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasHint() => $_has(6);
  @$pb.TagNumber(7)
  void clearHint() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get doneNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set doneNum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDoneNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearDoneNum() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get totalNum => $_getIZ(8);
  @$pb.TagNumber(9)
  set totalNum($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTotalNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalNum() => clearField(9);
}

class SquareTopicInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquareTopicInfo',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subTitle')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effectTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SquareTopicInfo._() : super();
  factory SquareTopicInfo({
    $core.int? id,
    $core.String? name,
    $core.String? icon,
    $core.String? subTitle,
    $core.int? effectTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (subTitle != null) {
      _result.subTitle = subTitle;
    }
    if (effectTime != null) {
      _result.effectTime = effectTime;
    }
    return _result;
  }
  factory SquareTopicInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquareTopicInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquareTopicInfo clone() => SquareTopicInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquareTopicInfo copyWith(void Function(SquareTopicInfo) updates) =>
      super.copyWith((message) => updates(message as SquareTopicInfo))
          as SquareTopicInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquareTopicInfo create() => SquareTopicInfo._();
  SquareTopicInfo createEmptyInstance() => create();
  static $pb.PbList<SquareTopicInfo> createRepeated() =>
      $pb.PbList<SquareTopicInfo>();
  @$core.pragma('dart2js:noInline')
  static SquareTopicInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SquareTopicInfo>(create);
  static SquareTopicInfo? _defaultInstance;

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
  $core.String get subTitle => $_getSZ(3);
  @$pb.TagNumber(4)
  set subTitle($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSubTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubTitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get effectTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set effectTime($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasEffectTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearEffectTime() => clearField(5);
}

class SquareCircleExample extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquareCircleExample',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SquareCircleExample._() : super();
  factory SquareCircleExample({
    $core.int? id,
    $core.String? icon,
    $core.int? uid,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory SquareCircleExample.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquareCircleExample.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquareCircleExample clone() => SquareCircleExample()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquareCircleExample copyWith(void Function(SquareCircleExample) updates) =>
      super.copyWith((message) => updates(message as SquareCircleExample))
          as SquareCircleExample; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquareCircleExample create() => SquareCircleExample._();
  SquareCircleExample createEmptyInstance() => create();
  static $pb.PbList<SquareCircleExample> createRepeated() =>
      $pb.PbList<SquareCircleExample>();
  @$core.pragma('dart2js:noInline')
  static SquareCircleExample getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SquareCircleExample>(create);
  static SquareCircleExample? _defaultInstance;

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

class SquareHomeRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquareHomeRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<SquareTaskInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskList',
        $pb.PbFieldType.PM,
        subBuilder: SquareTaskInfo.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..pc<SquareTopicInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topicList',
        $pb.PbFieldType.PM,
        subBuilder: SquareTopicInfo.create)
    ..pc<SquareCircleExample>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'exampleList',
        $pb.PbFieldType.PM,
        subBuilder: SquareCircleExample.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'helperUid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SquareHomeRsp_Data._() : super();
  factory SquareHomeRsp_Data({
    $core.Iterable<SquareTaskInfo>? taskList,
    $core.String? type,
    $core.Iterable<SquareTopicInfo>? topicList,
    $core.Iterable<SquareCircleExample>? exampleList,
    $core.int? helperUid,
  }) {
    final _result = create();
    if (taskList != null) {
      _result.taskList.addAll(taskList);
    }
    if (type != null) {
      _result.type = type;
    }
    if (topicList != null) {
      _result.topicList.addAll(topicList);
    }
    if (exampleList != null) {
      _result.exampleList.addAll(exampleList);
    }
    if (helperUid != null) {
      _result.helperUid = helperUid;
    }
    return _result;
  }
  factory SquareHomeRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquareHomeRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquareHomeRsp_Data clone() => SquareHomeRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquareHomeRsp_Data copyWith(void Function(SquareHomeRsp_Data) updates) =>
      super.copyWith((message) => updates(message as SquareHomeRsp_Data))
          as SquareHomeRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquareHomeRsp_Data create() => SquareHomeRsp_Data._();
  SquareHomeRsp_Data createEmptyInstance() => create();
  static $pb.PbList<SquareHomeRsp_Data> createRepeated() =>
      $pb.PbList<SquareHomeRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static SquareHomeRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SquareHomeRsp_Data>(create);
  static SquareHomeRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SquareTaskInfo> get taskList => $_getList(0);

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
  $core.List<SquareTopicInfo> get topicList => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<SquareCircleExample> get exampleList => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get helperUid => $_getIZ(4);
  @$pb.TagNumber(5)
  set helperUid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHelperUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearHelperUid() => clearField(5);
}

class SquareHomeRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquareHomeRsp',
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
    ..aOM<SquareHomeRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SquareHomeRsp_Data.create)
    ..hasRequiredFields = false;

  SquareHomeRsp._() : super();
  factory SquareHomeRsp({
    $core.bool? success,
    $core.String? msg,
    SquareHomeRsp_Data? data,
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
  factory SquareHomeRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquareHomeRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquareHomeRsp clone() => SquareHomeRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquareHomeRsp copyWith(void Function(SquareHomeRsp) updates) =>
      super.copyWith((message) => updates(message as SquareHomeRsp))
          as SquareHomeRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquareHomeRsp create() => SquareHomeRsp._();
  SquareHomeRsp createEmptyInstance() => create();
  static $pb.PbList<SquareHomeRsp> createRepeated() =>
      $pb.PbList<SquareHomeRsp>();
  @$core.pragma('dart2js:noInline')
  static SquareHomeRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SquareHomeRsp>(create);
  static SquareHomeRsp? _defaultInstance;

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
  SquareHomeRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SquareHomeRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SquareHomeRsp_Data ensureData() => $_ensure(2);
}

class SquareTaskLogInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquareTaskLogInfo',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
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
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SquareTaskLogInfo._() : super();
  factory SquareTaskLogInfo({
    $core.int? id,
    $core.String? type,
    $core.String? name,
    $core.int? score,
    $core.int? time,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    if (name != null) {
      _result.name = name;
    }
    if (score != null) {
      _result.score = score;
    }
    if (time != null) {
      _result.time = time;
    }
    return _result;
  }
  factory SquareTaskLogInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquareTaskLogInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquareTaskLogInfo clone() => SquareTaskLogInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquareTaskLogInfo copyWith(void Function(SquareTaskLogInfo) updates) =>
      super.copyWith((message) => updates(message as SquareTaskLogInfo))
          as SquareTaskLogInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquareTaskLogInfo create() => SquareTaskLogInfo._();
  SquareTaskLogInfo createEmptyInstance() => create();
  static $pb.PbList<SquareTaskLogInfo> createRepeated() =>
      $pb.PbList<SquareTaskLogInfo>();
  @$core.pragma('dart2js:noInline')
  static SquareTaskLogInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SquareTaskLogInfo>(create);
  static SquareTaskLogInfo? _defaultInstance;

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
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get time => $_getIZ(4);
  @$pb.TagNumber(5)
  set time($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => clearField(5);
}

class SquareTaskLogRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquareTaskLogRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<SquareTaskLogInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: SquareTaskLogInfo.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SquareTaskLogRsp_Data._() : super();
  factory SquareTaskLogRsp_Data({
    $core.Iterable<SquareTaskLogInfo>? list,
    $core.int? nextId,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (nextId != null) {
      _result.nextId = nextId;
    }
    return _result;
  }
  factory SquareTaskLogRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquareTaskLogRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquareTaskLogRsp_Data clone() =>
      SquareTaskLogRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquareTaskLogRsp_Data copyWith(
          void Function(SquareTaskLogRsp_Data) updates) =>
      super.copyWith((message) => updates(message as SquareTaskLogRsp_Data))
          as SquareTaskLogRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquareTaskLogRsp_Data create() => SquareTaskLogRsp_Data._();
  SquareTaskLogRsp_Data createEmptyInstance() => create();
  static $pb.PbList<SquareTaskLogRsp_Data> createRepeated() =>
      $pb.PbList<SquareTaskLogRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static SquareTaskLogRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SquareTaskLogRsp_Data>(create);
  static SquareTaskLogRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SquareTaskLogInfo> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get nextId => $_getIZ(1);
  @$pb.TagNumber(2)
  set nextId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNextId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextId() => clearField(2);
}

class SquareTaskLogRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquareTaskLogRsp',
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
    ..aOM<SquareTaskLogRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SquareTaskLogRsp_Data.create)
    ..hasRequiredFields = false;

  SquareTaskLogRsp._() : super();
  factory SquareTaskLogRsp({
    $core.bool? success,
    $core.String? msg,
    SquareTaskLogRsp_Data? data,
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
  factory SquareTaskLogRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquareTaskLogRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquareTaskLogRsp clone() => SquareTaskLogRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquareTaskLogRsp copyWith(void Function(SquareTaskLogRsp) updates) =>
      super.copyWith((message) => updates(message as SquareTaskLogRsp))
          as SquareTaskLogRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquareTaskLogRsp create() => SquareTaskLogRsp._();
  SquareTaskLogRsp createEmptyInstance() => create();
  static $pb.PbList<SquareTaskLogRsp> createRepeated() =>
      $pb.PbList<SquareTaskLogRsp>();
  @$core.pragma('dart2js:noInline')
  static SquareTaskLogRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SquareTaskLogRsp>(create);
  static SquareTaskLogRsp? _defaultInstance;

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
  SquareTaskLogRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SquareTaskLogRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SquareTaskLogRsp_Data ensureData() => $_ensure(2);
}

class SquareRankUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquareRankUserInfo',
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
            : 'rank',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SquareRankUserInfo._() : super();
  factory SquareRankUserInfo({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? rank,
    $core.int? score,
    $core.int? rid,
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
    if (rank != null) {
      _result.rank = rank;
    }
    if (score != null) {
      _result.score = score;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    return _result;
  }
  factory SquareRankUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquareRankUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquareRankUserInfo clone() => SquareRankUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquareRankUserInfo copyWith(void Function(SquareRankUserInfo) updates) =>
      super.copyWith((message) => updates(message as SquareRankUserInfo))
          as SquareRankUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquareRankUserInfo create() => SquareRankUserInfo._();
  SquareRankUserInfo createEmptyInstance() => create();
  static $pb.PbList<SquareRankUserInfo> createRepeated() =>
      $pb.PbList<SquareRankUserInfo>();
  @$core.pragma('dart2js:noInline')
  static SquareRankUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SquareRankUserInfo>(create);
  static SquareRankUserInfo? _defaultInstance;

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
  $core.int get rank => $_getIZ(3);
  @$pb.TagNumber(4)
  set rank($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearRank() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get score => $_getIZ(4);
  @$pb.TagNumber(5)
  set score($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearScore() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get rid => $_getIZ(5);
  @$pb.TagNumber(6)
  set rid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRid() => $_has(5);
  @$pb.TagNumber(6)
  void clearRid() => clearField(6);
}

class SquareRankRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquareRankRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<SquareRankUserInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: SquareRankUserInfo.create)
    ..aOM<SquareRankUserInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'me',
        subBuilder: SquareRankUserInfo.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..hasRequiredFields = false;

  SquareRankRsp_Data._() : super();
  factory SquareRankRsp_Data({
    $core.Iterable<SquareRankUserInfo>? list,
    SquareRankUserInfo? me,
    $core.String? type,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (me != null) {
      _result.me = me;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory SquareRankRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquareRankRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquareRankRsp_Data clone() => SquareRankRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquareRankRsp_Data copyWith(void Function(SquareRankRsp_Data) updates) =>
      super.copyWith((message) => updates(message as SquareRankRsp_Data))
          as SquareRankRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquareRankRsp_Data create() => SquareRankRsp_Data._();
  SquareRankRsp_Data createEmptyInstance() => create();
  static $pb.PbList<SquareRankRsp_Data> createRepeated() =>
      $pb.PbList<SquareRankRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static SquareRankRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SquareRankRsp_Data>(create);
  static SquareRankRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SquareRankUserInfo> get list => $_getList(0);

  @$pb.TagNumber(2)
  SquareRankUserInfo get me => $_getN(1);
  @$pb.TagNumber(2)
  set me(SquareRankUserInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMe() => $_has(1);
  @$pb.TagNumber(2)
  void clearMe() => clearField(2);
  @$pb.TagNumber(2)
  SquareRankUserInfo ensureMe() => $_ensure(1);

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

class SquareRankRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquareRankRsp',
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
    ..aOM<SquareRankRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SquareRankRsp_Data.create)
    ..hasRequiredFields = false;

  SquareRankRsp._() : super();
  factory SquareRankRsp({
    $core.bool? success,
    $core.String? msg,
    SquareRankRsp_Data? data,
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
  factory SquareRankRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquareRankRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquareRankRsp clone() => SquareRankRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquareRankRsp copyWith(void Function(SquareRankRsp) updates) =>
      super.copyWith((message) => updates(message as SquareRankRsp))
          as SquareRankRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquareRankRsp create() => SquareRankRsp._();
  SquareRankRsp createEmptyInstance() => create();
  static $pb.PbList<SquareRankRsp> createRepeated() =>
      $pb.PbList<SquareRankRsp>();
  @$core.pragma('dart2js:noInline')
  static SquareRankRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SquareRankRsp>(create);
  static SquareRankRsp? _defaultInstance;

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
  SquareRankRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SquareRankRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SquareRankRsp_Data ensureData() => $_ensure(2);
}

class SquareShop extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquareShop',
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
            : 'goodsId',
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
            : 'sourceUrl')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.double>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'days',
        $pb.PbFieldType.OF)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cateName')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goodsType',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SquareShop._() : super();
  factory SquareShop({
    $core.int? id,
    $core.int? goodsId,
    $core.String? name,
    $core.String? sourceUrl,
    $core.int? score,
    $core.double? days,
    $core.String? cateName,
    $core.int? goodsType,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (goodsId != null) {
      _result.goodsId = goodsId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sourceUrl != null) {
      _result.sourceUrl = sourceUrl;
    }
    if (score != null) {
      _result.score = score;
    }
    if (days != null) {
      _result.days = days;
    }
    if (cateName != null) {
      _result.cateName = cateName;
    }
    if (goodsType != null) {
      _result.goodsType = goodsType;
    }
    return _result;
  }
  factory SquareShop.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquareShop.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquareShop clone() => SquareShop()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquareShop copyWith(void Function(SquareShop) updates) =>
      super.copyWith((message) => updates(message as SquareShop))
          as SquareShop; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquareShop create() => SquareShop._();
  SquareShop createEmptyInstance() => create();
  static $pb.PbList<SquareShop> createRepeated() => $pb.PbList<SquareShop>();
  @$core.pragma('dart2js:noInline')
  static SquareShop getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SquareShop>(create);
  static SquareShop? _defaultInstance;

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
  $core.int get goodsId => $_getIZ(1);
  @$pb.TagNumber(2)
  set goodsId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGoodsId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGoodsId() => clearField(2);

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
  $core.String get sourceUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set sourceUrl($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSourceUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearSourceUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get score => $_getIZ(4);
  @$pb.TagNumber(5)
  set score($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearScore() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get days => $_getN(5);
  @$pb.TagNumber(6)
  set days($core.double v) {
    $_setFloat(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDays() => $_has(5);
  @$pb.TagNumber(6)
  void clearDays() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get cateName => $_getSZ(6);
  @$pb.TagNumber(7)
  set cateName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCateName() => $_has(6);
  @$pb.TagNumber(7)
  void clearCateName() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get goodsType => $_getIZ(7);
  @$pb.TagNumber(8)
  set goodsType($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGoodsType() => $_has(7);
  @$pb.TagNumber(8)
  void clearGoodsType() => clearField(8);
}

class SquarePopupRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SquarePopupRsp',
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
    ..aOM<SquareTopicInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topic',
        subBuilder: SquareTopicInfo.create)
    ..pc<SquareShop>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goods',
        $pb.PbFieldType.PM,
        subBuilder: SquareShop.create)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activityUrl')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scene',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'days',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SquarePopupRsp._() : super();
  factory SquarePopupRsp({
    $core.bool? success,
    $core.String? msg,
    SquareTopicInfo? topic,
    $core.Iterable<SquareShop>? goods,
    $core.String? activityUrl,
    $core.int? scene,
    $core.int? days,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (topic != null) {
      _result.topic = topic;
    }
    if (goods != null) {
      _result.goods.addAll(goods);
    }
    if (activityUrl != null) {
      _result.activityUrl = activityUrl;
    }
    if (scene != null) {
      _result.scene = scene;
    }
    if (days != null) {
      _result.days = days;
    }
    return _result;
  }
  factory SquarePopupRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SquarePopupRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SquarePopupRsp clone() => SquarePopupRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SquarePopupRsp copyWith(void Function(SquarePopupRsp) updates) =>
      super.copyWith((message) => updates(message as SquarePopupRsp))
          as SquarePopupRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SquarePopupRsp create() => SquarePopupRsp._();
  SquarePopupRsp createEmptyInstance() => create();
  static $pb.PbList<SquarePopupRsp> createRepeated() =>
      $pb.PbList<SquarePopupRsp>();
  @$core.pragma('dart2js:noInline')
  static SquarePopupRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SquarePopupRsp>(create);
  static SquarePopupRsp? _defaultInstance;

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
  SquareTopicInfo get topic => $_getN(2);
  @$pb.TagNumber(3)
  set topic(SquareTopicInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTopic() => $_has(2);
  @$pb.TagNumber(3)
  void clearTopic() => clearField(3);
  @$pb.TagNumber(3)
  SquareTopicInfo ensureTopic() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<SquareShop> get goods => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get activityUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set activityUrl($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasActivityUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearActivityUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get scene => $_getIZ(5);
  @$pb.TagNumber(6)
  set scene($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasScene() => $_has(5);
  @$pb.TagNumber(6)
  void clearScene() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get days => $_getIZ(6);
  @$pb.TagNumber(7)
  set days($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDays() => $_has(6);
  @$pb.TagNumber(7)
  void clearDays() => clearField(7);
}

class BroadcastMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcastMsg',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..hasRequiredFields = false;

  BroadcastMsg._() : super();
  factory BroadcastMsg({
    $core.String? content,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory BroadcastMsg.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcastMsg.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcastMsg clone() => BroadcastMsg()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcastMsg copyWith(void Function(BroadcastMsg) updates) =>
      super.copyWith((message) => updates(message as BroadcastMsg))
          as BroadcastMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcastMsg create() => BroadcastMsg._();
  BroadcastMsg createEmptyInstance() => create();
  static $pb.PbList<BroadcastMsg> createRepeated() =>
      $pb.PbList<BroadcastMsg>();
  @$core.pragma('dart2js:noInline')
  static BroadcastMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastMsg>(create);
  static BroadcastMsg? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(2)
  set content($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
}

class ConvertLog extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertLog',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fmtTime')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'convertPretend')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'convertScore',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ConvertLog._() : super();
  factory ConvertLog({
    $core.String? fmtTime,
    $core.String? convertPretend,
    $core.int? convertScore,
  }) {
    final _result = create();
    if (fmtTime != null) {
      _result.fmtTime = fmtTime;
    }
    if (convertPretend != null) {
      _result.convertPretend = convertPretend;
    }
    if (convertScore != null) {
      _result.convertScore = convertScore;
    }
    return _result;
  }
  factory ConvertLog.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertLog.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertLog clone() => ConvertLog()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertLog copyWith(void Function(ConvertLog) updates) =>
      super.copyWith((message) => updates(message as ConvertLog))
          as ConvertLog; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertLog create() => ConvertLog._();
  ConvertLog createEmptyInstance() => create();
  static $pb.PbList<ConvertLog> createRepeated() => $pb.PbList<ConvertLog>();
  @$core.pragma('dart2js:noInline')
  static ConvertLog getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertLog>(create);
  static ConvertLog? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fmtTime => $_getSZ(0);
  @$pb.TagNumber(1)
  set fmtTime($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFmtTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearFmtTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get convertPretend => $_getSZ(1);
  @$pb.TagNumber(2)
  set convertPretend($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConvertPretend() => $_has(1);
  @$pb.TagNumber(2)
  void clearConvertPretend() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get convertScore => $_getIZ(2);
  @$pb.TagNumber(3)
  set convertScore($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasConvertScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearConvertScore() => clearField(3);
}

class BroadcastDataRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcastDataRsp',
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
    ..pc<SquareShop>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goods',
        $pb.PbFieldType.PM,
        subBuilder: SquareShop.create)
    ..pc<BroadcastMsg>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'broadcastMsg',
        $pb.PbFieldType.PM,
        subBuilder: BroadcastMsg.create)
    ..hasRequiredFields = false;

  BroadcastDataRsp._() : super();
  factory BroadcastDataRsp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<SquareShop>? goods,
    $core.Iterable<BroadcastMsg>? broadcastMsg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (goods != null) {
      _result.goods.addAll(goods);
    }
    if (broadcastMsg != null) {
      _result.broadcastMsg.addAll(broadcastMsg);
    }
    return _result;
  }
  factory BroadcastDataRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcastDataRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcastDataRsp clone() => BroadcastDataRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcastDataRsp copyWith(void Function(BroadcastDataRsp) updates) =>
      super.copyWith((message) => updates(message as BroadcastDataRsp))
          as BroadcastDataRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcastDataRsp create() => BroadcastDataRsp._();
  BroadcastDataRsp createEmptyInstance() => create();
  static $pb.PbList<BroadcastDataRsp> createRepeated() =>
      $pb.PbList<BroadcastDataRsp>();
  @$core.pragma('dart2js:noInline')
  static BroadcastDataRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastDataRsp>(create);
  static BroadcastDataRsp? _defaultInstance;

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
  $core.List<SquareShop> get goods => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<BroadcastMsg> get broadcastMsg => $_getList(3);
}

class MySquareRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MySquareRsp',
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
            : 'squareScore',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hSquareScore',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MySquareRsp._() : super();
  factory MySquareRsp({
    $core.bool? success,
    $core.String? msg,
    $core.int? squareScore,
    $core.int? hSquareScore,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (squareScore != null) {
      _result.squareScore = squareScore;
    }
    if (hSquareScore != null) {
      _result.hSquareScore = hSquareScore;
    }
    return _result;
  }
  factory MySquareRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MySquareRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MySquareRsp clone() => MySquareRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MySquareRsp copyWith(void Function(MySquareRsp) updates) =>
      super.copyWith((message) => updates(message as MySquareRsp))
          as MySquareRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MySquareRsp create() => MySquareRsp._();
  MySquareRsp createEmptyInstance() => create();
  static $pb.PbList<MySquareRsp> createRepeated() => $pb.PbList<MySquareRsp>();
  @$core.pragma('dart2js:noInline')
  static MySquareRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MySquareRsp>(create);
  static MySquareRsp? _defaultInstance;

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
  $core.int get squareScore => $_getIZ(2);
  @$pb.TagNumber(3)
  set squareScore($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSquareScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearSquareScore() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get hSquareScore => $_getIZ(3);
  @$pb.TagNumber(4)
  set hSquareScore($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHSquareScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearHSquareScore() => clearField(4);
}

class ConvertListRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertListRsp',
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
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isMore')
    ..pc<SquareShop>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: SquareShop.create)
    ..hasRequiredFields = false;

  ConvertListRsp._() : super();
  factory ConvertListRsp({
    $core.bool? success,
    $core.String? msg,
    $core.bool? isMore,
    $core.Iterable<SquareShop>? list,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (isMore != null) {
      _result.isMore = isMore;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory ConvertListRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertListRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertListRsp clone() => ConvertListRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertListRsp copyWith(void Function(ConvertListRsp) updates) =>
      super.copyWith((message) => updates(message as ConvertListRsp))
          as ConvertListRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertListRsp create() => ConvertListRsp._();
  ConvertListRsp createEmptyInstance() => create();
  static $pb.PbList<ConvertListRsp> createRepeated() =>
      $pb.PbList<ConvertListRsp>();
  @$core.pragma('dart2js:noInline')
  static ConvertListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertListRsp>(create);
  static ConvertListRsp? _defaultInstance;

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
  $core.bool get isMore => $_getBF(2);
  @$pb.TagNumber(3)
  set isMore($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsMore() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsMore() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<SquareShop> get list => $_getList(3);
}

class ConvertGoodsLogRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertGoodsLogRsp',
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
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isMore')
    ..pc<ConvertLog>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ConvertLog.create)
    ..hasRequiredFields = false;

  ConvertGoodsLogRsp._() : super();
  factory ConvertGoodsLogRsp({
    $core.bool? success,
    $core.String? msg,
    $core.bool? isMore,
    $core.Iterable<ConvertLog>? list,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (isMore != null) {
      _result.isMore = isMore;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory ConvertGoodsLogRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertGoodsLogRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertGoodsLogRsp clone() => ConvertGoodsLogRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertGoodsLogRsp copyWith(void Function(ConvertGoodsLogRsp) updates) =>
      super.copyWith((message) => updates(message as ConvertGoodsLogRsp))
          as ConvertGoodsLogRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertGoodsLogRsp create() => ConvertGoodsLogRsp._();
  ConvertGoodsLogRsp createEmptyInstance() => create();
  static $pb.PbList<ConvertGoodsLogRsp> createRepeated() =>
      $pb.PbList<ConvertGoodsLogRsp>();
  @$core.pragma('dart2js:noInline')
  static ConvertGoodsLogRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertGoodsLogRsp>(create);
  static ConvertGoodsLogRsp? _defaultInstance;

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
  $core.bool get isMore => $_getBF(2);
  @$pb.TagNumber(3)
  set isMore($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsMore() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsMore() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<ConvertLog> get list => $_getList(3);
}

class ConvertGoodsRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertGoodsRsp',
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
    ..hasRequiredFields = false;

  ConvertGoodsRsp._() : super();
  factory ConvertGoodsRsp({
    $core.bool? success,
    $core.String? msg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory ConvertGoodsRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertGoodsRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertGoodsRsp clone() => ConvertGoodsRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertGoodsRsp copyWith(void Function(ConvertGoodsRsp) updates) =>
      super.copyWith((message) => updates(message as ConvertGoodsRsp))
          as ConvertGoodsRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertGoodsRsp create() => ConvertGoodsRsp._();
  ConvertGoodsRsp createEmptyInstance() => create();
  static $pb.PbList<ConvertGoodsRsp> createRepeated() =>
      $pb.PbList<ConvertGoodsRsp>();
  @$core.pragma('dart2js:noInline')
  static ConvertGoodsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertGoodsRsp>(create);
  static ConvertGoodsRsp? _defaultInstance;

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
}
