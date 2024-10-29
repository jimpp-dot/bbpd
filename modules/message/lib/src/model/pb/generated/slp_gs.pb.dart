///
//  Generated code. Do not modify.
//  source: slp_gs.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class GsAutoChatStrategy extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsAutoChatStrategy',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'strategyId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grade',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'openRate')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'replyRate')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'answerRate')
    ..p<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msgTypeList',
        $pb.PbFieldType.PU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  GsAutoChatStrategy._() : super();
  factory GsAutoChatStrategy({
    $core.int? strategyId,
    $core.int? state,
    $core.int? grade,
    $core.String? openRate,
    $core.String? replyRate,
    $core.String? answerRate,
    $core.Iterable<$core.int>? msgTypeList,
    $core.String? name,
  }) {
    final _result = create();
    if (strategyId != null) {
      _result.strategyId = strategyId;
    }
    if (state != null) {
      _result.state = state;
    }
    if (grade != null) {
      _result.grade = grade;
    }
    if (openRate != null) {
      _result.openRate = openRate;
    }
    if (replyRate != null) {
      _result.replyRate = replyRate;
    }
    if (answerRate != null) {
      _result.answerRate = answerRate;
    }
    if (msgTypeList != null) {
      _result.msgTypeList.addAll(msgTypeList);
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory GsAutoChatStrategy.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsAutoChatStrategy.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsAutoChatStrategy clone() => GsAutoChatStrategy()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsAutoChatStrategy copyWith(void Function(GsAutoChatStrategy) updates) =>
      super.copyWith((message) => updates(message as GsAutoChatStrategy))
          as GsAutoChatStrategy; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsAutoChatStrategy create() => GsAutoChatStrategy._();
  GsAutoChatStrategy createEmptyInstance() => create();
  static $pb.PbList<GsAutoChatStrategy> createRepeated() =>
      $pb.PbList<GsAutoChatStrategy>();
  @$core.pragma('dart2js:noInline')
  static GsAutoChatStrategy getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsAutoChatStrategy>(create);
  static GsAutoChatStrategy? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get strategyId => $_getIZ(0);
  @$pb.TagNumber(1)
  set strategyId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStrategyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStrategyId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get state => $_getIZ(1);
  @$pb.TagNumber(2)
  set state($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get grade => $_getIZ(2);
  @$pb.TagNumber(3)
  set grade($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGrade() => $_has(2);
  @$pb.TagNumber(3)
  void clearGrade() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get openRate => $_getSZ(3);
  @$pb.TagNumber(4)
  set openRate($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOpenRate() => $_has(3);
  @$pb.TagNumber(4)
  void clearOpenRate() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get replyRate => $_getSZ(4);
  @$pb.TagNumber(5)
  set replyRate($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasReplyRate() => $_has(4);
  @$pb.TagNumber(5)
  void clearReplyRate() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get answerRate => $_getSZ(5);
  @$pb.TagNumber(6)
  set answerRate($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAnswerRate() => $_has(5);
  @$pb.TagNumber(6)
  void clearAnswerRate() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get msgTypeList => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get name => $_getSZ(7);
  @$pb.TagNumber(8)
  set name($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasName() => $_has(7);
  @$pb.TagNumber(8)
  void clearName() => clearField(8);
}

class GsAutoChatData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsAutoChatData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chatNumToday',
        $pb.PbFieldType.OU3)
    ..pc<GsAutoChatStrategy>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'strategies',
        $pb.PbFieldType.PM,
        subBuilder: GsAutoChatStrategy.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selectedStrategyId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GsAutoChatData._() : super();
  factory GsAutoChatData({
    $core.int? chatNumToday,
    $core.Iterable<GsAutoChatStrategy>? strategies,
    $core.int? selectedStrategyId,
  }) {
    final _result = create();
    if (chatNumToday != null) {
      _result.chatNumToday = chatNumToday;
    }
    if (strategies != null) {
      _result.strategies.addAll(strategies);
    }
    if (selectedStrategyId != null) {
      _result.selectedStrategyId = selectedStrategyId;
    }
    return _result;
  }
  factory GsAutoChatData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsAutoChatData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsAutoChatData clone() => GsAutoChatData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsAutoChatData copyWith(void Function(GsAutoChatData) updates) =>
      super.copyWith((message) => updates(message as GsAutoChatData))
          as GsAutoChatData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsAutoChatData create() => GsAutoChatData._();
  GsAutoChatData createEmptyInstance() => create();
  static $pb.PbList<GsAutoChatData> createRepeated() =>
      $pb.PbList<GsAutoChatData>();
  @$core.pragma('dart2js:noInline')
  static GsAutoChatData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsAutoChatData>(create);
  static GsAutoChatData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get chatNumToday => $_getIZ(0);
  @$pb.TagNumber(1)
  set chatNumToday($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasChatNumToday() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatNumToday() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<GsAutoChatStrategy> get strategies => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get selectedStrategyId => $_getIZ(2);
  @$pb.TagNumber(3)
  set selectedStrategyId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSelectedStrategyId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSelectedStrategyId() => clearField(3);
}

class ResGsAutoChat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGsAutoChat',
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
    ..aOM<GsAutoChatData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GsAutoChatData.create)
    ..hasRequiredFields = false;

  ResGsAutoChat._() : super();
  factory ResGsAutoChat({
    $core.bool? success,
    $core.String? msg,
    GsAutoChatData? data,
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
  factory ResGsAutoChat.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGsAutoChat.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGsAutoChat clone() => ResGsAutoChat()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGsAutoChat copyWith(void Function(ResGsAutoChat) updates) =>
      super.copyWith((message) => updates(message as ResGsAutoChat))
          as ResGsAutoChat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGsAutoChat create() => ResGsAutoChat._();
  ResGsAutoChat createEmptyInstance() => create();
  static $pb.PbList<ResGsAutoChat> createRepeated() =>
      $pb.PbList<ResGsAutoChat>();
  @$core.pragma('dart2js:noInline')
  static ResGsAutoChat getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGsAutoChat>(create);
  static ResGsAutoChat? _defaultInstance;

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
  GsAutoChatData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GsAutoChatData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GsAutoChatData ensureData() => $_ensure(2);
}

class GsChatMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsChatMsg',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msgId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GsChatMsg._() : super();
  factory GsChatMsg({
    $core.int? msgId,
    $core.int? type,
    $core.String? content,
    $core.int? state,
  }) {
    final _result = create();
    if (msgId != null) {
      _result.msgId = msgId;
    }
    if (type != null) {
      _result.type = type;
    }
    if (content != null) {
      _result.content = content;
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory GsChatMsg.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsChatMsg.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsChatMsg clone() => GsChatMsg()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsChatMsg copyWith(void Function(GsChatMsg) updates) =>
      super.copyWith((message) => updates(message as GsChatMsg))
          as GsChatMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsChatMsg create() => GsChatMsg._();
  GsChatMsg createEmptyInstance() => create();
  static $pb.PbList<GsChatMsg> createRepeated() => $pb.PbList<GsChatMsg>();
  @$core.pragma('dart2js:noInline')
  static GsChatMsg getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GsChatMsg>(create);
  static GsChatMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get msgId => $_getIZ(0);
  @$pb.TagNumber(1)
  set msgId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMsgId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsgId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get state => $_getIZ(3);
  @$pb.TagNumber(4)
  set state($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);
}

class GsChatMsgListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsChatMsgListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'strategyName')
    ..pc<GsChatMsg>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msgList',
        $pb.PbFieldType.PM,
        subBuilder: GsChatMsg.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nearest',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GsChatMsgListData._() : super();
  factory GsChatMsgListData({
    $core.String? strategyName,
    $core.Iterable<GsChatMsg>? msgList,
    $core.int? nearest,
  }) {
    final _result = create();
    if (strategyName != null) {
      _result.strategyName = strategyName;
    }
    if (msgList != null) {
      _result.msgList.addAll(msgList);
    }
    if (nearest != null) {
      _result.nearest = nearest;
    }
    return _result;
  }
  factory GsChatMsgListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsChatMsgListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsChatMsgListData clone() => GsChatMsgListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsChatMsgListData copyWith(void Function(GsChatMsgListData) updates) =>
      super.copyWith((message) => updates(message as GsChatMsgListData))
          as GsChatMsgListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsChatMsgListData create() => GsChatMsgListData._();
  GsChatMsgListData createEmptyInstance() => create();
  static $pb.PbList<GsChatMsgListData> createRepeated() =>
      $pb.PbList<GsChatMsgListData>();
  @$core.pragma('dart2js:noInline')
  static GsChatMsgListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsChatMsgListData>(create);
  static GsChatMsgListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get strategyName => $_getSZ(0);
  @$pb.TagNumber(1)
  set strategyName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStrategyName() => $_has(0);
  @$pb.TagNumber(1)
  void clearStrategyName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<GsChatMsg> get msgList => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get nearest => $_getIZ(2);
  @$pb.TagNumber(3)
  set nearest($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNearest() => $_has(2);
  @$pb.TagNumber(3)
  void clearNearest() => clearField(3);
}

class ResGsChatMsgList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGsChatMsgList',
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
    ..aOM<GsChatMsgListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GsChatMsgListData.create)
    ..hasRequiredFields = false;

  ResGsChatMsgList._() : super();
  factory ResGsChatMsgList({
    $core.bool? success,
    $core.String? msg,
    GsChatMsgListData? data,
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
  factory ResGsChatMsgList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGsChatMsgList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGsChatMsgList clone() => ResGsChatMsgList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGsChatMsgList copyWith(void Function(ResGsChatMsgList) updates) =>
      super.copyWith((message) => updates(message as ResGsChatMsgList))
          as ResGsChatMsgList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGsChatMsgList create() => ResGsChatMsgList._();
  ResGsChatMsgList createEmptyInstance() => create();
  static $pb.PbList<ResGsChatMsgList> createRepeated() =>
      $pb.PbList<ResGsChatMsgList>();
  @$core.pragma('dart2js:noInline')
  static ResGsChatMsgList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGsChatMsgList>(create);
  static ResGsChatMsgList? _defaultInstance;

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
  GsChatMsgListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GsChatMsgListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GsChatMsgListData ensureData() => $_ensure(2);
}

class CacheUint32List extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CacheUint32List',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..p<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'idLst',
        $pb.PbFieldType.PU3)
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastChanged')
    ..hasRequiredFields = false;

  CacheUint32List._() : super();
  factory CacheUint32List({
    $core.Iterable<$core.int>? idLst,
    $fixnum.Int64? lastChanged,
  }) {
    final _result = create();
    if (idLst != null) {
      _result.idLst.addAll(idLst);
    }
    if (lastChanged != null) {
      _result.lastChanged = lastChanged;
    }
    return _result;
  }
  factory CacheUint32List.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CacheUint32List.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CacheUint32List clone() => CacheUint32List()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CacheUint32List copyWith(void Function(CacheUint32List) updates) =>
      super.copyWith((message) => updates(message as CacheUint32List))
          as CacheUint32List; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CacheUint32List create() => CacheUint32List._();
  CacheUint32List createEmptyInstance() => create();
  static $pb.PbList<CacheUint32List> createRepeated() =>
      $pb.PbList<CacheUint32List>();
  @$core.pragma('dart2js:noInline')
  static CacheUint32List getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CacheUint32List>(create);
  static CacheUint32List? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get idLst => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastChanged => $_getI64(1);
  @$pb.TagNumber(2)
  set lastChanged($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLastChanged() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastChanged() => clearField(2);
}

class CacheInt32List extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CacheInt32List',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..p<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'idLst',
        $pb.PbFieldType.P3)
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastChanged')
    ..hasRequiredFields = false;

  CacheInt32List._() : super();
  factory CacheInt32List({
    $core.Iterable<$core.int>? idLst,
    $fixnum.Int64? lastChanged,
  }) {
    final _result = create();
    if (idLst != null) {
      _result.idLst.addAll(idLst);
    }
    if (lastChanged != null) {
      _result.lastChanged = lastChanged;
    }
    return _result;
  }
  factory CacheInt32List.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CacheInt32List.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CacheInt32List clone() => CacheInt32List()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CacheInt32List copyWith(void Function(CacheInt32List) updates) =>
      super.copyWith((message) => updates(message as CacheInt32List))
          as CacheInt32List; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CacheInt32List create() => CacheInt32List._();
  CacheInt32List createEmptyInstance() => create();
  static $pb.PbList<CacheInt32List> createRepeated() =>
      $pb.PbList<CacheInt32List>();
  @$core.pragma('dart2js:noInline')
  static CacheInt32List getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CacheInt32List>(create);
  static CacheInt32List? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get idLst => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastChanged => $_getI64(1);
  @$pb.TagNumber(2)
  set lastChanged($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLastChanged() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastChanged() => clearField(2);
}

class ResGsNull extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGsNull',
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

  ResGsNull._() : super();
  factory ResGsNull({
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
  factory ResGsNull.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGsNull.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGsNull clone() => ResGsNull()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGsNull copyWith(void Function(ResGsNull) updates) =>
      super.copyWith((message) => updates(message as ResGsNull))
          as ResGsNull; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGsNull create() => ResGsNull._();
  ResGsNull createEmptyInstance() => create();
  static $pb.PbList<ResGsNull> createRepeated() => $pb.PbList<ResGsNull>();
  @$core.pragma('dart2js:noInline')
  static ResGsNull getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResGsNull>(create);
  static ResGsNull? _defaultInstance;

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

class FriendMsgGroupData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FriendMsgGroupData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..p<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gsList',
        $pb.PbFieldType.PU3)
    ..p<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bossList',
        $pb.PbFieldType.PU3)
    ..hasRequiredFields = false;

  FriendMsgGroupData._() : super();
  factory FriendMsgGroupData({
    $core.Iterable<$core.int>? gsList,
    $core.Iterable<$core.int>? bossList,
  }) {
    final _result = create();
    if (gsList != null) {
      _result.gsList.addAll(gsList);
    }
    if (bossList != null) {
      _result.bossList.addAll(bossList);
    }
    return _result;
  }
  factory FriendMsgGroupData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FriendMsgGroupData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FriendMsgGroupData clone() => FriendMsgGroupData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FriendMsgGroupData copyWith(void Function(FriendMsgGroupData) updates) =>
      super.copyWith((message) => updates(message as FriendMsgGroupData))
          as FriendMsgGroupData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FriendMsgGroupData create() => FriendMsgGroupData._();
  FriendMsgGroupData createEmptyInstance() => create();
  static $pb.PbList<FriendMsgGroupData> createRepeated() =>
      $pb.PbList<FriendMsgGroupData>();
  @$core.pragma('dart2js:noInline')
  static FriendMsgGroupData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FriendMsgGroupData>(create);
  static FriendMsgGroupData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get gsList => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get bossList => $_getList(1);
}

class ResFriendMsgGroup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResFriendMsgGroup',
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
    ..aOM<FriendMsgGroupData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: FriendMsgGroupData.create)
    ..hasRequiredFields = false;

  ResFriendMsgGroup._() : super();
  factory ResFriendMsgGroup({
    $core.bool? success,
    $core.String? msg,
    FriendMsgGroupData? data,
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
  factory ResFriendMsgGroup.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResFriendMsgGroup.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResFriendMsgGroup clone() => ResFriendMsgGroup()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResFriendMsgGroup copyWith(void Function(ResFriendMsgGroup) updates) =>
      super.copyWith((message) => updates(message as ResFriendMsgGroup))
          as ResFriendMsgGroup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResFriendMsgGroup create() => ResFriendMsgGroup._();
  ResFriendMsgGroup createEmptyInstance() => create();
  static $pb.PbList<ResFriendMsgGroup> createRepeated() =>
      $pb.PbList<ResFriendMsgGroup>();
  @$core.pragma('dart2js:noInline')
  static ResFriendMsgGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResFriendMsgGroup>(create);
  static ResFriendMsgGroup? _defaultInstance;

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
  FriendMsgGroupData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(FriendMsgGroupData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  FriendMsgGroupData ensureData() => $_ensure(2);
}

class StrategyCategory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StrategyCategory',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'categoryId',
        $pb.PbFieldType.OU3,
        protoName: 'categoryId')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'categoryName',
        protoName: 'categoryName')
    ..hasRequiredFields = false;

  StrategyCategory._() : super();
  factory StrategyCategory({
    $core.int? categoryId,
    $core.String? categoryName,
  }) {
    final _result = create();
    if (categoryId != null) {
      _result.categoryId = categoryId;
    }
    if (categoryName != null) {
      _result.categoryName = categoryName;
    }
    return _result;
  }
  factory StrategyCategory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StrategyCategory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StrategyCategory clone() => StrategyCategory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StrategyCategory copyWith(void Function(StrategyCategory) updates) =>
      super.copyWith((message) => updates(message as StrategyCategory))
          as StrategyCategory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StrategyCategory create() => StrategyCategory._();
  StrategyCategory createEmptyInstance() => create();
  static $pb.PbList<StrategyCategory> createRepeated() =>
      $pb.PbList<StrategyCategory>();
  @$core.pragma('dart2js:noInline')
  static StrategyCategory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StrategyCategory>(create);
  static StrategyCategory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get categoryId => $_getIZ(0);
  @$pb.TagNumber(1)
  set categoryId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCategoryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategoryId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get categoryName => $_getSZ(1);
  @$pb.TagNumber(2)
  set categoryName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCategoryName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategoryName() => clearField(2);
}

class ResAutoChatCategory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAutoChatCategory',
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
    ..pc<StrategyCategory>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: StrategyCategory.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'help')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cdLeftSecond',
        $pb.PbFieldType.OU3,
        protoName: 'cdLeftSecond')
    ..hasRequiredFields = false;

  ResAutoChatCategory._() : super();
  factory ResAutoChatCategory({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<StrategyCategory>? list,
    $core.String? help,
    $core.int? cdLeftSecond,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (help != null) {
      _result.help = help;
    }
    if (cdLeftSecond != null) {
      _result.cdLeftSecond = cdLeftSecond;
    }
    return _result;
  }
  factory ResAutoChatCategory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAutoChatCategory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAutoChatCategory clone() => ResAutoChatCategory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAutoChatCategory copyWith(void Function(ResAutoChatCategory) updates) =>
      super.copyWith((message) => updates(message as ResAutoChatCategory))
          as ResAutoChatCategory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAutoChatCategory create() => ResAutoChatCategory._();
  ResAutoChatCategory createEmptyInstance() => create();
  static $pb.PbList<ResAutoChatCategory> createRepeated() =>
      $pb.PbList<ResAutoChatCategory>();
  @$core.pragma('dart2js:noInline')
  static ResAutoChatCategory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAutoChatCategory>(create);
  static ResAutoChatCategory? _defaultInstance;

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
  $core.List<StrategyCategory> get list => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get help => $_getSZ(3);
  @$pb.TagNumber(4)
  set help($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHelp() => $_has(3);
  @$pb.TagNumber(4)
  void clearHelp() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get cdLeftSecond => $_getIZ(4);
  @$pb.TagNumber(5)
  set cdLeftSecond($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCdLeftSecond() => $_has(4);
  @$pb.TagNumber(5)
  void clearCdLeftSecond() => clearField(5);
}

class ResAccostSampleList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAccostSampleList',
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
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data')
    ..hasRequiredFields = false;

  ResAccostSampleList._() : super();
  factory ResAccostSampleList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<$core.String>? data,
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
  factory ResAccostSampleList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAccostSampleList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAccostSampleList clone() => ResAccostSampleList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAccostSampleList copyWith(void Function(ResAccostSampleList) updates) =>
      super.copyWith((message) => updates(message as ResAccostSampleList))
          as ResAccostSampleList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAccostSampleList create() => ResAccostSampleList._();
  ResAccostSampleList createEmptyInstance() => create();
  static $pb.PbList<ResAccostSampleList> createRepeated() =>
      $pb.PbList<ResAccostSampleList>();
  @$core.pragma('dart2js:noInline')
  static ResAccostSampleList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAccostSampleList>(create);
  static ResAccostSampleList? _defaultInstance;

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
  $core.List<$core.String> get data => $_getList(2);
}

class AccostPermissionHelpItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccostPermissionHelpItem',
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
            : 'annotation')
    ..hasRequiredFields = false;

  AccostPermissionHelpItem._() : super();
  factory AccostPermissionHelpItem({
    $core.String? title,
    $core.String? annotation,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (annotation != null) {
      _result.annotation = annotation;
    }
    return _result;
  }
  factory AccostPermissionHelpItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccostPermissionHelpItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccostPermissionHelpItem clone() =>
      AccostPermissionHelpItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccostPermissionHelpItem copyWith(
          void Function(AccostPermissionHelpItem) updates) =>
      super.copyWith((message) => updates(message as AccostPermissionHelpItem))
          as AccostPermissionHelpItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccostPermissionHelpItem create() => AccostPermissionHelpItem._();
  AccostPermissionHelpItem createEmptyInstance() => create();
  static $pb.PbList<AccostPermissionHelpItem> createRepeated() =>
      $pb.PbList<AccostPermissionHelpItem>();
  @$core.pragma('dart2js:noInline')
  static AccostPermissionHelpItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccostPermissionHelpItem>(create);
  static AccostPermissionHelpItem? _defaultInstance;

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
  $core.String get annotation => $_getSZ(1);
  @$pb.TagNumber(2)
  set annotation($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAnnotation() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnnotation() => clearField(2);
}

class ResAccostGsPermissions extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAccostGsPermissions',
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
    ..pc<AccostPermissionHelpItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: AccostPermissionHelpItem.create)
    ..hasRequiredFields = false;

  ResAccostGsPermissions._() : super();
  factory ResAccostGsPermissions({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<AccostPermissionHelpItem>? data,
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
  factory ResAccostGsPermissions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAccostGsPermissions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAccostGsPermissions clone() =>
      ResAccostGsPermissions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAccostGsPermissions copyWith(
          void Function(ResAccostGsPermissions) updates) =>
      super.copyWith((message) => updates(message as ResAccostGsPermissions))
          as ResAccostGsPermissions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAccostGsPermissions create() => ResAccostGsPermissions._();
  ResAccostGsPermissions createEmptyInstance() => create();
  static $pb.PbList<ResAccostGsPermissions> createRepeated() =>
      $pb.PbList<ResAccostGsPermissions>();
  @$core.pragma('dart2js:noInline')
  static ResAccostGsPermissions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAccostGsPermissions>(create);
  static ResAccostGsPermissions? _defaultInstance;

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
  $core.List<AccostPermissionHelpItem> get data => $_getList(2);
}

class ResAccostGsRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAccostGsRank',
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
    ..aOM<AccostGsRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AccostGsRankData.create)
    ..hasRequiredFields = false;

  ResAccostGsRank._() : super();
  factory ResAccostGsRank({
    $core.bool? success,
    $core.String? msg,
    AccostGsRankData? data,
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
  factory ResAccostGsRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAccostGsRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAccostGsRank clone() => ResAccostGsRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAccostGsRank copyWith(void Function(ResAccostGsRank) updates) =>
      super.copyWith((message) => updates(message as ResAccostGsRank))
          as ResAccostGsRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAccostGsRank create() => ResAccostGsRank._();
  ResAccostGsRank createEmptyInstance() => create();
  static $pb.PbList<ResAccostGsRank> createRepeated() =>
      $pb.PbList<ResAccostGsRank>();
  @$core.pragma('dart2js:noInline')
  static ResAccostGsRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAccostGsRank>(create);
  static ResAccostGsRank? _defaultInstance;

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
  AccostGsRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AccostGsRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AccostGsRankData ensureData() => $_ensure(2);
}

class AccostGsRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccostGsRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<AccostGsRankItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: AccostGsRankItem.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextId',
        $pb.PbFieldType.O3)
    ..aOM<AccostGsRankItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'me',
        subBuilder: AccostGsRankItem.create)
    ..hasRequiredFields = false;

  AccostGsRankData._() : super();
  factory AccostGsRankData({
    $core.Iterable<AccostGsRankItem>? list,
    $core.bool? hasMore,
    $core.int? nextId,
    AccostGsRankItem? me,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    if (nextId != null) {
      _result.nextId = nextId;
    }
    if (me != null) {
      _result.me = me;
    }
    return _result;
  }
  factory AccostGsRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccostGsRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccostGsRankData clone() => AccostGsRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccostGsRankData copyWith(void Function(AccostGsRankData) updates) =>
      super.copyWith((message) => updates(message as AccostGsRankData))
          as AccostGsRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccostGsRankData create() => AccostGsRankData._();
  AccostGsRankData createEmptyInstance() => create();
  static $pb.PbList<AccostGsRankData> createRepeated() =>
      $pb.PbList<AccostGsRankData>();
  @$core.pragma('dart2js:noInline')
  static AccostGsRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccostGsRankData>(create);
  static AccostGsRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AccostGsRankItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get hasMore => $_getBF(1);
  @$pb.TagNumber(2)
  set hasMore($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasMore() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get nextId => $_getIZ(2);
  @$pb.TagNumber(3)
  set nextId($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNextId() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextId() => clearField(3);

  @$pb.TagNumber(4)
  AccostGsRankItem get me => $_getN(3);
  @$pb.TagNumber(4)
  set me(AccostGsRankItem v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMe() => $_has(3);
  @$pb.TagNumber(4)
  void clearMe() => clearField(4);
  @$pb.TagNumber(4)
  AccostGsRankItem ensureMe() => $_ensure(3);
}

class AccostGsRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccostGsRankItem',
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
    ..a<$core.double>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OD)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AccostGsRankItem._() : super();
  factory AccostGsRankItem({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
    $core.double? score,
    $core.int? rank,
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
    if (rank != null) {
      _result.rank = rank;
    }
    return _result;
  }
  factory AccostGsRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccostGsRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccostGsRankItem clone() => AccostGsRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccostGsRankItem copyWith(void Function(AccostGsRankItem) updates) =>
      super.copyWith((message) => updates(message as AccostGsRankItem))
          as AccostGsRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccostGsRankItem create() => AccostGsRankItem._();
  AccostGsRankItem createEmptyInstance() => create();
  static $pb.PbList<AccostGsRankItem> createRepeated() =>
      $pb.PbList<AccostGsRankItem>();
  @$core.pragma('dart2js:noInline')
  static AccostGsRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccostGsRankItem>(create);
  static AccostGsRankItem? _defaultInstance;

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
  $core.double get score => $_getN(3);
  @$pb.TagNumber(4)
  set score($core.double v) {
    $_setDouble(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get rank => $_getIZ(4);
  @$pb.TagNumber(5)
  set rank($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRank() => $_has(4);
  @$pb.TagNumber(5)
  void clearRank() => clearField(5);
}
