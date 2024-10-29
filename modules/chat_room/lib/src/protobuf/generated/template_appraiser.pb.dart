///
//  Generated code. Do not modify.
//  source: template_appraiser.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'entity_xs_appraiser_category.pb.dart' as $0;
import 'entity_xs_appraiser_tag.pb.dart' as $1;

class ResAppraiser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAppraiser',
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
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data')
    ..hasRequiredFields = false;

  ResAppraiser._() : super();
  factory ResAppraiser({
    $core.bool? success,
    $core.String? msg,
    $core.String? data,
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
  factory ResAppraiser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAppraiser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAppraiser clone() => ResAppraiser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAppraiser copyWith(void Function(ResAppraiser) updates) =>
      super.copyWith((message) => updates(message as ResAppraiser))
          as ResAppraiser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAppraiser create() => ResAppraiser._();
  ResAppraiser createEmptyInstance() => create();
  static $pb.PbList<ResAppraiser> createRepeated() =>
      $pb.PbList<ResAppraiser>();
  @$core.pragma('dart2js:noInline')
  static ResAppraiser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAppraiser>(create);
  static ResAppraiser? _defaultInstance;

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
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(3)
  set data($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}

class ResAppraiserBase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAppraiserBase',
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
    ..aOM<ResAppraiserBaseData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResAppraiserBaseData.create)
    ..hasRequiredFields = false;

  ResAppraiserBase._() : super();
  factory ResAppraiserBase({
    $core.bool? success,
    $core.String? msg,
    ResAppraiserBaseData? data,
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
  factory ResAppraiserBase.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAppraiserBase.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAppraiserBase clone() => ResAppraiserBase()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAppraiserBase copyWith(void Function(ResAppraiserBase) updates) =>
      super.copyWith((message) => updates(message as ResAppraiserBase))
          as ResAppraiserBase; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAppraiserBase create() => ResAppraiserBase._();
  ResAppraiserBase createEmptyInstance() => create();
  static $pb.PbList<ResAppraiserBase> createRepeated() =>
      $pb.PbList<ResAppraiserBase>();
  @$core.pragma('dart2js:noInline')
  static ResAppraiserBase getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAppraiserBase>(create);
  static ResAppraiserBase? _defaultInstance;

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
  ResAppraiserBaseData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ResAppraiserBaseData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ResAppraiserBaseData ensureData() => $_ensure(2);
}

class ResAppraiserBaseData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAppraiserBaseData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'storyId',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..p<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startQids',
        $pb.PbFieldType.PU3)
    ..aOM<ResAppraiserBaseMap>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'map',
        subBuilder: ResAppraiserBaseMap.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'counter',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ResAppraiserBaseData._() : super();
  factory ResAppraiserBaseData({
    $core.int? rid,
    $core.int? storyId,
    $core.String? state,
    $core.Iterable<$core.int>? startQids,
    ResAppraiserBaseMap? map,
    $core.int? counter,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (storyId != null) {
      _result.storyId = storyId;
    }
    if (state != null) {
      _result.state = state;
    }
    if (startQids != null) {
      _result.startQids.addAll(startQids);
    }
    if (map != null) {
      _result.map = map;
    }
    if (counter != null) {
      _result.counter = counter;
    }
    return _result;
  }
  factory ResAppraiserBaseData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAppraiserBaseData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAppraiserBaseData clone() =>
      ResAppraiserBaseData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAppraiserBaseData copyWith(void Function(ResAppraiserBaseData) updates) =>
      super.copyWith((message) => updates(message as ResAppraiserBaseData))
          as ResAppraiserBaseData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAppraiserBaseData create() => ResAppraiserBaseData._();
  ResAppraiserBaseData createEmptyInstance() => create();
  static $pb.PbList<ResAppraiserBaseData> createRepeated() =>
      $pb.PbList<ResAppraiserBaseData>();
  @$core.pragma('dart2js:noInline')
  static ResAppraiserBaseData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAppraiserBaseData>(create);
  static ResAppraiserBaseData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get storyId => $_getIZ(1);
  @$pb.TagNumber(2)
  set storyId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStoryId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoryId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get state => $_getSZ(2);
  @$pb.TagNumber(3)
  set state($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get startQids => $_getList(3);

  @$pb.TagNumber(5)
  ResAppraiserBaseMap get map => $_getN(4);
  @$pb.TagNumber(5)
  set map(ResAppraiserBaseMap v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMap() => $_has(4);
  @$pb.TagNumber(5)
  void clearMap() => clearField(5);
  @$pb.TagNumber(5)
  ResAppraiserBaseMap ensureMap() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get counter => $_getIZ(5);
  @$pb.TagNumber(6)
  set counter($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCounter() => $_has(5);
  @$pb.TagNumber(6)
  void clearCounter() => clearField(6);
}

class ResAppraiserBaseMap extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAppraiserBaseMap',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ResAppraiserBaseQuestion>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'question',
        $pb.PbFieldType.PM,
        subBuilder: ResAppraiserBaseQuestion.create)
    ..hasRequiredFields = false;

  ResAppraiserBaseMap._() : super();
  factory ResAppraiserBaseMap({
    $core.Iterable<ResAppraiserBaseQuestion>? question,
  }) {
    final _result = create();
    if (question != null) {
      _result.question.addAll(question);
    }
    return _result;
  }
  factory ResAppraiserBaseMap.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAppraiserBaseMap.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAppraiserBaseMap clone() => ResAppraiserBaseMap()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAppraiserBaseMap copyWith(void Function(ResAppraiserBaseMap) updates) =>
      super.copyWith((message) => updates(message as ResAppraiserBaseMap))
          as ResAppraiserBaseMap; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAppraiserBaseMap create() => ResAppraiserBaseMap._();
  ResAppraiserBaseMap createEmptyInstance() => create();
  static $pb.PbList<ResAppraiserBaseMap> createRepeated() =>
      $pb.PbList<ResAppraiserBaseMap>();
  @$core.pragma('dart2js:noInline')
  static ResAppraiserBaseMap getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAppraiserBaseMap>(create);
  static ResAppraiserBaseMap? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ResAppraiserBaseQuestion> get question => $_getList(0);
}

class UserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Uid',
        $pb.PbFieldType.OU3,
        protoName: 'Uid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Icon',
        protoName: 'Icon')
    ..hasRequiredFields = false;

  UserInfo._() : super();
  factory UserInfo({
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
  factory UserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserInfo clone() => UserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserInfo copyWith(void Function(UserInfo) updates) =>
      super.copyWith((message) => updates(message as UserInfo))
          as UserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserInfo create() => UserInfo._();
  UserInfo createEmptyInstance() => create();
  static $pb.PbList<UserInfo> createRepeated() => $pb.PbList<UserInfo>();
  @$core.pragma('dart2js:noInline')
  static UserInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfo>(create);
  static UserInfo? _defaultInstance;

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

class ResAppraiserBaseQuestion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAppraiserBaseQuestion',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'qid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'question')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'voteUserNum',
        $pb.PbFieldType.OU3)
    ..pc<UserInfo>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'voteUserList',
        $pb.PbFieldType.PM,
        subBuilder: UserInfo.create)
    ..pc<ResAppraiserBaseQuestionOption>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'optionList',
        $pb.PbFieldType.PM,
        subBuilder: ResAppraiserBaseQuestionOption.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'haveNextQuestion',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ResAppraiserBaseQuestion._() : super();
  factory ResAppraiserBaseQuestion({
    $core.int? qid,
    $core.String? question,
    $core.int? voteUserNum,
    $core.Iterable<UserInfo>? voteUserList,
    $core.Iterable<ResAppraiserBaseQuestionOption>? optionList,
    $core.int? haveNextQuestion,
  }) {
    final _result = create();
    if (qid != null) {
      _result.qid = qid;
    }
    if (question != null) {
      _result.question = question;
    }
    if (voteUserNum != null) {
      _result.voteUserNum = voteUserNum;
    }
    if (voteUserList != null) {
      _result.voteUserList.addAll(voteUserList);
    }
    if (optionList != null) {
      _result.optionList.addAll(optionList);
    }
    if (haveNextQuestion != null) {
      _result.haveNextQuestion = haveNextQuestion;
    }
    return _result;
  }
  factory ResAppraiserBaseQuestion.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAppraiserBaseQuestion.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAppraiserBaseQuestion clone() =>
      ResAppraiserBaseQuestion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAppraiserBaseQuestion copyWith(
          void Function(ResAppraiserBaseQuestion) updates) =>
      super.copyWith((message) => updates(message as ResAppraiserBaseQuestion))
          as ResAppraiserBaseQuestion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAppraiserBaseQuestion create() => ResAppraiserBaseQuestion._();
  ResAppraiserBaseQuestion createEmptyInstance() => create();
  static $pb.PbList<ResAppraiserBaseQuestion> createRepeated() =>
      $pb.PbList<ResAppraiserBaseQuestion>();
  @$core.pragma('dart2js:noInline')
  static ResAppraiserBaseQuestion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAppraiserBaseQuestion>(create);
  static ResAppraiserBaseQuestion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get qid => $_getIZ(0);
  @$pb.TagNumber(1)
  set qid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasQid() => $_has(0);
  @$pb.TagNumber(1)
  void clearQid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get question => $_getSZ(1);
  @$pb.TagNumber(2)
  set question($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasQuestion() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestion() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get voteUserNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set voteUserNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVoteUserNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearVoteUserNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<UserInfo> get voteUserList => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<ResAppraiserBaseQuestionOption> get optionList => $_getList(4);

  @$pb.TagNumber(6)
  $core.int get haveNextQuestion => $_getIZ(5);
  @$pb.TagNumber(6)
  set haveNextQuestion($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHaveNextQuestion() => $_has(5);
  @$pb.TagNumber(6)
  void clearHaveNextQuestion() => clearField(6);
}

class ResAppraiserBaseQuestionOption extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAppraiserBaseQuestionOption',
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
            : 'qid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'option',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'optionName')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'optionValue')
    ..p<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'choosenUids',
        $pb.PbFieldType.PU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'choosenPercent',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ResAppraiserBaseQuestionOption._() : super();
  factory ResAppraiserBaseQuestionOption({
    $core.int? id,
    $core.int? qid,
    $core.int? option,
    $core.String? optionName,
    $core.String? optionValue,
    $core.Iterable<$core.int>? choosenUids,
    $core.int? choosenPercent,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (qid != null) {
      _result.qid = qid;
    }
    if (option != null) {
      _result.option = option;
    }
    if (optionName != null) {
      _result.optionName = optionName;
    }
    if (optionValue != null) {
      _result.optionValue = optionValue;
    }
    if (choosenUids != null) {
      _result.choosenUids.addAll(choosenUids);
    }
    if (choosenPercent != null) {
      _result.choosenPercent = choosenPercent;
    }
    return _result;
  }
  factory ResAppraiserBaseQuestionOption.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAppraiserBaseQuestionOption.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAppraiserBaseQuestionOption clone() =>
      ResAppraiserBaseQuestionOption()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAppraiserBaseQuestionOption copyWith(
          void Function(ResAppraiserBaseQuestionOption) updates) =>
      super.copyWith(
              (message) => updates(message as ResAppraiserBaseQuestionOption))
          as ResAppraiserBaseQuestionOption; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAppraiserBaseQuestionOption create() =>
      ResAppraiserBaseQuestionOption._();
  ResAppraiserBaseQuestionOption createEmptyInstance() => create();
  static $pb.PbList<ResAppraiserBaseQuestionOption> createRepeated() =>
      $pb.PbList<ResAppraiserBaseQuestionOption>();
  @$core.pragma('dart2js:noInline')
  static ResAppraiserBaseQuestionOption getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAppraiserBaseQuestionOption>(create);
  static ResAppraiserBaseQuestionOption? _defaultInstance;

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
  $core.int get qid => $_getIZ(1);
  @$pb.TagNumber(2)
  set qid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasQid() => $_has(1);
  @$pb.TagNumber(2)
  void clearQid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get option => $_getIZ(2);
  @$pb.TagNumber(3)
  set option($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOption() => $_has(2);
  @$pb.TagNumber(3)
  void clearOption() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get optionName => $_getSZ(3);
  @$pb.TagNumber(4)
  set optionName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOptionName() => $_has(3);
  @$pb.TagNumber(4)
  void clearOptionName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get optionValue => $_getSZ(4);
  @$pb.TagNumber(5)
  set optionValue($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOptionValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearOptionValue() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get choosenUids => $_getList(5);

  @$pb.TagNumber(7)
  $core.int get choosenPercent => $_getIZ(6);
  @$pb.TagNumber(7)
  set choosenPercent($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasChoosenPercent() => $_has(6);
  @$pb.TagNumber(7)
  void clearChoosenPercent() => clearField(7);
}

class ResAppraiserStory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAppraiserStory',
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
    ..aOM<ResAppraiserStoryDetailData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResAppraiserStoryDetailData.create)
    ..hasRequiredFields = false;

  ResAppraiserStory._() : super();
  factory ResAppraiserStory({
    $core.bool? success,
    $core.String? msg,
    ResAppraiserStoryDetailData? data,
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
  factory ResAppraiserStory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAppraiserStory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAppraiserStory clone() => ResAppraiserStory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAppraiserStory copyWith(void Function(ResAppraiserStory) updates) =>
      super.copyWith((message) => updates(message as ResAppraiserStory))
          as ResAppraiserStory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAppraiserStory create() => ResAppraiserStory._();
  ResAppraiserStory createEmptyInstance() => create();
  static $pb.PbList<ResAppraiserStory> createRepeated() =>
      $pb.PbList<ResAppraiserStory>();
  @$core.pragma('dart2js:noInline')
  static ResAppraiserStory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAppraiserStory>(create);
  static ResAppraiserStory? _defaultInstance;

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
  ResAppraiserStoryDetailData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ResAppraiserStoryDetailData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ResAppraiserStoryDetailData ensureData() => $_ensure(2);
}

class ResAppraiserStoryDetailData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAppraiserStoryDetailData',
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
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userName',
        protoName: 'userName')
    ..aOM<$0.EntityXsAppraiserCategory>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cidInfo',
        protoName: 'cidInfo',
        subBuilder: $0.EntityXsAppraiserCategory.create)
    ..pc<$1.EntityXsAppraiserTag>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagInfo',
        $pb.PbFieldType.PM,
        protoName: 'tagInfo',
        subBuilder: $1.EntityXsAppraiserTag.create)
    ..pc<QuestionList>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'questionList',
        $pb.PbFieldType.PM,
        protoName: 'questionList',
        subBuilder: QuestionList.create)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topicContent')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'likeNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createTime',
        $pb.PbFieldType.OU3,
        protoName: 'createTime')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userLikeStatus',
        $pb.PbFieldType.OU3,
        protoName: 'userLikeStatus')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topicNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'brows',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ResAppraiserStoryDetailData._() : super();
  factory ResAppraiserStoryDetailData({
    $core.int? id,
    $core.int? uid,
    $core.String? icon,
    $core.String? userName,
    $0.EntityXsAppraiserCategory? cidInfo,
    $core.Iterable<$1.EntityXsAppraiserTag>? tagInfo,
    $core.Iterable<QuestionList>? questionList,
    $core.String? title,
    $core.String? content,
    $core.String? topicContent,
    $core.int? likeNum,
    $core.int? status,
    $core.int? createTime,
    $core.int? userLikeStatus,
    $core.int? topicNum,
    $core.int? brows,
    $core.int? deleted,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (cidInfo != null) {
      _result.cidInfo = cidInfo;
    }
    if (tagInfo != null) {
      _result.tagInfo.addAll(tagInfo);
    }
    if (questionList != null) {
      _result.questionList.addAll(questionList);
    }
    if (title != null) {
      _result.title = title;
    }
    if (content != null) {
      _result.content = content;
    }
    if (topicContent != null) {
      _result.topicContent = topicContent;
    }
    if (likeNum != null) {
      _result.likeNum = likeNum;
    }
    if (status != null) {
      _result.status = status;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (userLikeStatus != null) {
      _result.userLikeStatus = userLikeStatus;
    }
    if (topicNum != null) {
      _result.topicNum = topicNum;
    }
    if (brows != null) {
      _result.brows = brows;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    return _result;
  }
  factory ResAppraiserStoryDetailData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAppraiserStoryDetailData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAppraiserStoryDetailData clone() =>
      ResAppraiserStoryDetailData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAppraiserStoryDetailData copyWith(
          void Function(ResAppraiserStoryDetailData) updates) =>
      super.copyWith(
              (message) => updates(message as ResAppraiserStoryDetailData))
          as ResAppraiserStoryDetailData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAppraiserStoryDetailData create() =>
      ResAppraiserStoryDetailData._();
  ResAppraiserStoryDetailData createEmptyInstance() => create();
  static $pb.PbList<ResAppraiserStoryDetailData> createRepeated() =>
      $pb.PbList<ResAppraiserStoryDetailData>();
  @$core.pragma('dart2js:noInline')
  static ResAppraiserStoryDetailData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAppraiserStoryDetailData>(create);
  static ResAppraiserStoryDetailData? _defaultInstance;

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
  $core.int get uid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

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
  $core.String get userName => $_getSZ(3);
  @$pb.TagNumber(4)
  set userName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUserName() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserName() => clearField(4);

  @$pb.TagNumber(5)
  $0.EntityXsAppraiserCategory get cidInfo => $_getN(4);
  @$pb.TagNumber(5)
  set cidInfo($0.EntityXsAppraiserCategory v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCidInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearCidInfo() => clearField(5);
  @$pb.TagNumber(5)
  $0.EntityXsAppraiserCategory ensureCidInfo() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<$1.EntityXsAppraiserTag> get tagInfo => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<QuestionList> get questionList => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get title => $_getSZ(7);
  @$pb.TagNumber(8)
  set title($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTitle() => $_has(7);
  @$pb.TagNumber(8)
  void clearTitle() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get content => $_getSZ(8);
  @$pb.TagNumber(9)
  set content($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasContent() => $_has(8);
  @$pb.TagNumber(9)
  void clearContent() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get topicContent => $_getSZ(9);
  @$pb.TagNumber(10)
  set topicContent($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTopicContent() => $_has(9);
  @$pb.TagNumber(10)
  void clearTopicContent() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get likeNum => $_getIZ(10);
  @$pb.TagNumber(11)
  set likeNum($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasLikeNum() => $_has(10);
  @$pb.TagNumber(11)
  void clearLikeNum() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get status => $_getIZ(11);
  @$pb.TagNumber(12)
  set status($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasStatus() => $_has(11);
  @$pb.TagNumber(12)
  void clearStatus() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get createTime => $_getIZ(12);
  @$pb.TagNumber(13)
  set createTime($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasCreateTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearCreateTime() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get userLikeStatus => $_getIZ(13);
  @$pb.TagNumber(14)
  set userLikeStatus($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasUserLikeStatus() => $_has(13);
  @$pb.TagNumber(14)
  void clearUserLikeStatus() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get topicNum => $_getIZ(14);
  @$pb.TagNumber(15)
  set topicNum($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasTopicNum() => $_has(14);
  @$pb.TagNumber(15)
  void clearTopicNum() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get brows => $_getIZ(15);
  @$pb.TagNumber(16)
  set brows($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasBrows() => $_has(15);
  @$pb.TagNumber(16)
  void clearBrows() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get deleted => $_getIZ(16);
  @$pb.TagNumber(17)
  set deleted($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasDeleted() => $_has(16);
  @$pb.TagNumber(17)
  void clearDeleted() => clearField(17);
}

class QuestionList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'QuestionList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'qid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'question')
    ..pc<QuesAnswer>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'answer',
        $pb.PbFieldType.PM,
        subBuilder: QuesAnswer.create)
    ..hasRequiredFields = false;

  QuestionList._() : super();
  factory QuestionList({
    $core.int? qid,
    $core.String? question,
    $core.Iterable<QuesAnswer>? answer,
  }) {
    final _result = create();
    if (qid != null) {
      _result.qid = qid;
    }
    if (question != null) {
      _result.question = question;
    }
    if (answer != null) {
      _result.answer.addAll(answer);
    }
    return _result;
  }
  factory QuestionList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory QuestionList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  QuestionList clone() => QuestionList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  QuestionList copyWith(void Function(QuestionList) updates) =>
      super.copyWith((message) => updates(message as QuestionList))
          as QuestionList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QuestionList create() => QuestionList._();
  QuestionList createEmptyInstance() => create();
  static $pb.PbList<QuestionList> createRepeated() =>
      $pb.PbList<QuestionList>();
  @$core.pragma('dart2js:noInline')
  static QuestionList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuestionList>(create);
  static QuestionList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get qid => $_getIZ(0);
  @$pb.TagNumber(1)
  set qid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasQid() => $_has(0);
  @$pb.TagNumber(1)
  void clearQid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get question => $_getSZ(1);
  @$pb.TagNumber(2)
  set question($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasQuestion() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestion() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<QuesAnswer> get answer => $_getList(2);
}

class QuesAnswer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'QuesAnswer',
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
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'option',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'optionName')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'optionValue')
    ..hasRequiredFields = false;

  QuesAnswer._() : super();
  factory QuesAnswer({
    $core.int? id,
    $core.int? option,
    $core.String? optionName,
    $core.String? optionValue,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (option != null) {
      _result.option = option;
    }
    if (optionName != null) {
      _result.optionName = optionName;
    }
    if (optionValue != null) {
      _result.optionValue = optionValue;
    }
    return _result;
  }
  factory QuesAnswer.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory QuesAnswer.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  QuesAnswer clone() => QuesAnswer()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  QuesAnswer copyWith(void Function(QuesAnswer) updates) =>
      super.copyWith((message) => updates(message as QuesAnswer))
          as QuesAnswer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QuesAnswer create() => QuesAnswer._();
  QuesAnswer createEmptyInstance() => create();
  static $pb.PbList<QuesAnswer> createRepeated() => $pb.PbList<QuesAnswer>();
  @$core.pragma('dart2js:noInline')
  static QuesAnswer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuesAnswer>(create);
  static QuesAnswer? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.int get option => $_getIZ(1);
  @$pb.TagNumber(3)
  set option($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOption() => $_has(1);
  @$pb.TagNumber(3)
  void clearOption() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get optionName => $_getSZ(2);
  @$pb.TagNumber(4)
  set optionName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOptionName() => $_has(2);
  @$pb.TagNumber(4)
  void clearOptionName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get optionValue => $_getSZ(3);
  @$pb.TagNumber(5)
  set optionValue($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOptionValue() => $_has(3);
  @$pb.TagNumber(5)
  void clearOptionValue() => clearField(5);
}

class ResAppraiserStoryList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAppraiserStoryList',
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
    ..pc<ResAppraiserStoryData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: ResAppraiserStoryData.create)
    ..hasRequiredFields = false;

  ResAppraiserStoryList._() : super();
  factory ResAppraiserStoryList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<ResAppraiserStoryData>? data,
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
  factory ResAppraiserStoryList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAppraiserStoryList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAppraiserStoryList clone() =>
      ResAppraiserStoryList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAppraiserStoryList copyWith(
          void Function(ResAppraiserStoryList) updates) =>
      super.copyWith((message) => updates(message as ResAppraiserStoryList))
          as ResAppraiserStoryList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAppraiserStoryList create() => ResAppraiserStoryList._();
  ResAppraiserStoryList createEmptyInstance() => create();
  static $pb.PbList<ResAppraiserStoryList> createRepeated() =>
      $pb.PbList<ResAppraiserStoryList>();
  @$core.pragma('dart2js:noInline')
  static ResAppraiserStoryList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAppraiserStoryList>(create);
  static ResAppraiserStoryList? _defaultInstance;

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
  $core.List<ResAppraiserStoryData> get data => $_getList(2);
}

class ResAppraiserStoryData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAppraiserStoryData',
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
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..pc<$1.EntityXsAppraiserTag>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagInfo',
        $pb.PbFieldType.PM,
        protoName: 'tagInfo',
        subBuilder: $1.EntityXsAppraiserTag.create)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'qid')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topicContent')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'likeNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'brows',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topicNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createTime',
        $pb.PbFieldType.OU3,
        protoName: 'createTime')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userLikeStatus',
        $pb.PbFieldType.OU3,
        protoName: 'userLikeStatus')
    ..hasRequiredFields = false;

  ResAppraiserStoryData._() : super();
  factory ResAppraiserStoryData({
    $core.int? id,
    $core.int? uid,
    $core.int? cid,
    $core.Iterable<$1.EntityXsAppraiserTag>? tagInfo,
    $core.String? qid,
    $core.String? title,
    $core.String? content,
    $core.String? topicContent,
    $core.int? likeNum,
    $core.int? brows,
    $core.int? topicNum,
    $core.int? status,
    $core.int? createTime,
    $core.int? userLikeStatus,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (tagInfo != null) {
      _result.tagInfo.addAll(tagInfo);
    }
    if (qid != null) {
      _result.qid = qid;
    }
    if (title != null) {
      _result.title = title;
    }
    if (content != null) {
      _result.content = content;
    }
    if (topicContent != null) {
      _result.topicContent = topicContent;
    }
    if (likeNum != null) {
      _result.likeNum = likeNum;
    }
    if (brows != null) {
      _result.brows = brows;
    }
    if (topicNum != null) {
      _result.topicNum = topicNum;
    }
    if (status != null) {
      _result.status = status;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (userLikeStatus != null) {
      _result.userLikeStatus = userLikeStatus;
    }
    return _result;
  }
  factory ResAppraiserStoryData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAppraiserStoryData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAppraiserStoryData clone() =>
      ResAppraiserStoryData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAppraiserStoryData copyWith(
          void Function(ResAppraiserStoryData) updates) =>
      super.copyWith((message) => updates(message as ResAppraiserStoryData))
          as ResAppraiserStoryData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAppraiserStoryData create() => ResAppraiserStoryData._();
  ResAppraiserStoryData createEmptyInstance() => create();
  static $pb.PbList<ResAppraiserStoryData> createRepeated() =>
      $pb.PbList<ResAppraiserStoryData>();
  @$core.pragma('dart2js:noInline')
  static ResAppraiserStoryData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAppraiserStoryData>(create);
  static ResAppraiserStoryData? _defaultInstance;

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
  $core.int get uid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get cid => $_getIZ(2);
  @$pb.TagNumber(3)
  set cid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCid() => $_has(2);
  @$pb.TagNumber(3)
  void clearCid() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$1.EntityXsAppraiserTag> get tagInfo => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get qid => $_getSZ(4);
  @$pb.TagNumber(5)
  set qid($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasQid() => $_has(4);
  @$pb.TagNumber(5)
  void clearQid() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(5);
  @$pb.TagNumber(6)
  set title($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get content => $_getSZ(6);
  @$pb.TagNumber(7)
  set content($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasContent() => $_has(6);
  @$pb.TagNumber(7)
  void clearContent() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get topicContent => $_getSZ(7);
  @$pb.TagNumber(8)
  set topicContent($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTopicContent() => $_has(7);
  @$pb.TagNumber(8)
  void clearTopicContent() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get likeNum => $_getIZ(8);
  @$pb.TagNumber(9)
  set likeNum($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasLikeNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearLikeNum() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get brows => $_getIZ(9);
  @$pb.TagNumber(10)
  set brows($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasBrows() => $_has(9);
  @$pb.TagNumber(10)
  void clearBrows() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get topicNum => $_getIZ(10);
  @$pb.TagNumber(11)
  set topicNum($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTopicNum() => $_has(10);
  @$pb.TagNumber(11)
  void clearTopicNum() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get status => $_getIZ(11);
  @$pb.TagNumber(12)
  set status($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasStatus() => $_has(11);
  @$pb.TagNumber(12)
  void clearStatus() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get createTime => $_getIZ(12);
  @$pb.TagNumber(13)
  set createTime($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasCreateTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearCreateTime() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get userLikeStatus => $_getIZ(13);
  @$pb.TagNumber(14)
  set userLikeStatus($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasUserLikeStatus() => $_has(13);
  @$pb.TagNumber(14)
  void clearUserLikeStatus() => clearField(14);
}

class StoryListPageInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoryListPageInfo',
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
    ..aOM<StoryListPage>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: StoryListPage.create)
    ..hasRequiredFields = false;

  StoryListPageInfo._() : super();
  factory StoryListPageInfo({
    $core.bool? success,
    $core.String? msg,
    StoryListPage? data,
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
  factory StoryListPageInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoryListPageInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoryListPageInfo clone() => StoryListPageInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoryListPageInfo copyWith(void Function(StoryListPageInfo) updates) =>
      super.copyWith((message) => updates(message as StoryListPageInfo))
          as StoryListPageInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoryListPageInfo create() => StoryListPageInfo._();
  StoryListPageInfo createEmptyInstance() => create();
  static $pb.PbList<StoryListPageInfo> createRepeated() =>
      $pb.PbList<StoryListPageInfo>();
  @$core.pragma('dart2js:noInline')
  static StoryListPageInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoryListPageInfo>(create);
  static StoryListPageInfo? _defaultInstance;

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
  StoryListPage get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(StoryListPage v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  StoryListPage ensureData() => $_ensure(2);
}

class StoryListPage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StoryListPage',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..pc<PlayInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playInfo',
        $pb.PbFieldType.PM,
        protoName: 'playInfo',
        subBuilder: PlayInfo.create)
    ..pc<$1.EntityXsAppraiserTag>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagInfo',
        $pb.PbFieldType.PM,
        protoName: 'tagInfo',
        subBuilder: $1.EntityXsAppraiserTag.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagId',
        $pb.PbFieldType.OU3,
        protoName: 'tagId')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filterKey',
        $pb.PbFieldType.OU3,
        protoName: 'filterKey')
    ..hasRequiredFields = false;

  StoryListPage._() : super();
  factory StoryListPage({
    $core.String? icon,
    $core.int? score,
    $core.Iterable<PlayInfo>? playInfo,
    $core.Iterable<$1.EntityXsAppraiserTag>? tagInfo,
    $core.int? tagId,
    $core.int? filterKey,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (score != null) {
      _result.score = score;
    }
    if (playInfo != null) {
      _result.playInfo.addAll(playInfo);
    }
    if (tagInfo != null) {
      _result.tagInfo.addAll(tagInfo);
    }
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (filterKey != null) {
      _result.filterKey = filterKey;
    }
    return _result;
  }
  factory StoryListPage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StoryListPage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StoryListPage clone() => StoryListPage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StoryListPage copyWith(void Function(StoryListPage) updates) =>
      super.copyWith((message) => updates(message as StoryListPage))
          as StoryListPage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoryListPage create() => StoryListPage._();
  StoryListPage createEmptyInstance() => create();
  static $pb.PbList<StoryListPage> createRepeated() =>
      $pb.PbList<StoryListPage>();
  @$core.pragma('dart2js:noInline')
  static StoryListPage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoryListPage>(create);
  static StoryListPage? _defaultInstance;

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
  $core.int get score => $_getIZ(1);
  @$pb.TagNumber(2)
  set score($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<PlayInfo> get playInfo => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$1.EntityXsAppraiserTag> get tagInfo => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get tagId => $_getIZ(4);
  @$pb.TagNumber(5)
  set tagId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTagId() => $_has(4);
  @$pb.TagNumber(5)
  void clearTagId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get filterKey => $_getIZ(5);
  @$pb.TagNumber(6)
  set filterKey($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFilterKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearFilterKey() => clearField(6);
}

class PlayInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PlayInfo',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isCheckbox',
        $pb.PbFieldType.OU3,
        protoName: 'isCheckbox')
    ..hasRequiredFields = false;

  PlayInfo._() : super();
  factory PlayInfo({
    $core.int? id,
    $core.String? name,
    $core.int? isCheckbox,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (isCheckbox != null) {
      _result.isCheckbox = isCheckbox;
    }
    return _result;
  }
  factory PlayInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PlayInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PlayInfo clone() => PlayInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PlayInfo copyWith(void Function(PlayInfo) updates) =>
      super.copyWith((message) => updates(message as PlayInfo))
          as PlayInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlayInfo create() => PlayInfo._();
  PlayInfo createEmptyInstance() => create();
  static $pb.PbList<PlayInfo> createRepeated() => $pb.PbList<PlayInfo>();
  @$core.pragma('dart2js:noInline')
  static PlayInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayInfo>(create);
  static PlayInfo? _defaultInstance;

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
  $core.int get isCheckbox => $_getIZ(2);
  @$pb.TagNumber(3)
  set isCheckbox($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsCheckbox() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsCheckbox() => clearField(3);
}

class LikeResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LikeResp',
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
    ..aOM<LikeData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: LikeData.create)
    ..hasRequiredFields = false;

  LikeResp._() : super();
  factory LikeResp({
    $core.bool? success,
    $core.String? msg,
    LikeData? data,
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
  factory LikeResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LikeResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LikeResp clone() => LikeResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LikeResp copyWith(void Function(LikeResp) updates) =>
      super.copyWith((message) => updates(message as LikeResp))
          as LikeResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LikeResp create() => LikeResp._();
  LikeResp createEmptyInstance() => create();
  static $pb.PbList<LikeResp> createRepeated() => $pb.PbList<LikeResp>();
  @$core.pragma('dart2js:noInline')
  static LikeResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LikeResp>(create);
  static LikeResp? _defaultInstance;

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
  LikeData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(LikeData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  LikeData ensureData() => $_ensure(2);
}

class LikeData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LikeData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'likeNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  LikeData._() : super();
  factory LikeData({
    $core.int? likeNum,
    $core.int? state,
  }) {
    final _result = create();
    if (likeNum != null) {
      _result.likeNum = likeNum;
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory LikeData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LikeData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LikeData clone() => LikeData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LikeData copyWith(void Function(LikeData) updates) =>
      super.copyWith((message) => updates(message as LikeData))
          as LikeData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LikeData create() => LikeData._();
  LikeData createEmptyInstance() => create();
  static $pb.PbList<LikeData> createRepeated() => $pb.PbList<LikeData>();
  @$core.pragma('dart2js:noInline')
  static LikeData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LikeData>(create);
  static LikeData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get likeNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set likeNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLikeNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearLikeNum() => clearField(1);

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
}

class GameIngResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GameIngResp',
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
    ..pc<GameIngRoomListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: GameIngRoomListData.create)
    ..hasRequiredFields = false;

  GameIngResp._() : super();
  factory GameIngResp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GameIngRoomListData>? data,
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
  factory GameIngResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GameIngResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GameIngResp clone() => GameIngResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GameIngResp copyWith(void Function(GameIngResp) updates) =>
      super.copyWith((message) => updates(message as GameIngResp))
          as GameIngResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameIngResp create() => GameIngResp._();
  GameIngResp createEmptyInstance() => create();
  static $pb.PbList<GameIngResp> createRepeated() => $pb.PbList<GameIngResp>();
  @$core.pragma('dart2js:noInline')
  static GameIngResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GameIngResp>(create);
  static GameIngResp? _defaultInstance;

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
  $core.List<GameIngRoomListData> get data => $_getList(2);
}

class GameIngRoomListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GameIngRoomListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'HouseUserIcon',
        protoName: 'HouseUserIcon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Title',
        protoName: 'Title')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'MicOnlineCount',
        $pb.PbFieldType.OU3,
        protoName: 'MicOnlineCount')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'HouseUserCount',
        $pb.PbFieldType.OU3,
        protoName: 'HouseUserCount')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Rid',
        $pb.PbFieldType.OU3,
        protoName: 'Rid')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'StoryId',
        $pb.PbFieldType.OU3,
        protoName: 'StoryId')
    ..pc<UserInfo>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'UserList',
        $pb.PbFieldType.PM,
        protoName: 'UserList',
        subBuilder: UserInfo.create)
    ..hasRequiredFields = false;

  GameIngRoomListData._() : super();
  factory GameIngRoomListData({
    $core.String? houseUserIcon,
    $core.String? title,
    $core.int? micOnlineCount,
    $core.int? houseUserCount,
    $core.int? rid,
    $core.int? storyId,
    $core.Iterable<UserInfo>? userList,
  }) {
    final _result = create();
    if (houseUserIcon != null) {
      _result.houseUserIcon = houseUserIcon;
    }
    if (title != null) {
      _result.title = title;
    }
    if (micOnlineCount != null) {
      _result.micOnlineCount = micOnlineCount;
    }
    if (houseUserCount != null) {
      _result.houseUserCount = houseUserCount;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (storyId != null) {
      _result.storyId = storyId;
    }
    if (userList != null) {
      _result.userList.addAll(userList);
    }
    return _result;
  }
  factory GameIngRoomListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GameIngRoomListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GameIngRoomListData clone() => GameIngRoomListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GameIngRoomListData copyWith(void Function(GameIngRoomListData) updates) =>
      super.copyWith((message) => updates(message as GameIngRoomListData))
          as GameIngRoomListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameIngRoomListData create() => GameIngRoomListData._();
  GameIngRoomListData createEmptyInstance() => create();
  static $pb.PbList<GameIngRoomListData> createRepeated() =>
      $pb.PbList<GameIngRoomListData>();
  @$core.pragma('dart2js:noInline')
  static GameIngRoomListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GameIngRoomListData>(create);
  static GameIngRoomListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get houseUserIcon => $_getSZ(0);
  @$pb.TagNumber(1)
  set houseUserIcon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHouseUserIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearHouseUserIcon() => clearField(1);

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
  $core.int get micOnlineCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set micOnlineCount($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMicOnlineCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearMicOnlineCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get houseUserCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set houseUserCount($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHouseUserCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearHouseUserCount() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get rid => $_getIZ(4);
  @$pb.TagNumber(5)
  set rid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRid() => $_has(4);
  @$pb.TagNumber(5)
  void clearRid() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get storyId => $_getIZ(5);
  @$pb.TagNumber(6)
  set storyId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStoryId() => $_has(5);
  @$pb.TagNumber(6)
  void clearStoryId() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<UserInfo> get userList => $_getList(6);
}

class UserScoreStatic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserScoreStatic',
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
    ..aOM<ScoreStatic>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ScoreStatic.create)
    ..hasRequiredFields = false;

  UserScoreStatic._() : super();
  factory UserScoreStatic({
    $core.bool? success,
    $core.String? msg,
    ScoreStatic? data,
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
  factory UserScoreStatic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserScoreStatic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserScoreStatic clone() => UserScoreStatic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserScoreStatic copyWith(void Function(UserScoreStatic) updates) =>
      super.copyWith((message) => updates(message as UserScoreStatic))
          as UserScoreStatic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserScoreStatic create() => UserScoreStatic._();
  UserScoreStatic createEmptyInstance() => create();
  static $pb.PbList<UserScoreStatic> createRepeated() =>
      $pb.PbList<UserScoreStatic>();
  @$core.pragma('dart2js:noInline')
  static UserScoreStatic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserScoreStatic>(create);
  static UserScoreStatic? _defaultInstance;

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
  ScoreStatic get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ScoreStatic v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ScoreStatic ensureData() => $_ensure(2);
}

class ScoreStatic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScoreStatic',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<UserStaticInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Mine',
        protoName: 'Mine',
        subBuilder: UserStaticInfo.create)
    ..pc<UserStaticInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'UserList',
        $pb.PbFieldType.PM,
        protoName: 'UserList',
        subBuilder: UserStaticInfo.create)
    ..hasRequiredFields = false;

  ScoreStatic._() : super();
  factory ScoreStatic({
    UserStaticInfo? mine,
    $core.Iterable<UserStaticInfo>? userList,
  }) {
    final _result = create();
    if (mine != null) {
      _result.mine = mine;
    }
    if (userList != null) {
      _result.userList.addAll(userList);
    }
    return _result;
  }
  factory ScoreStatic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScoreStatic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScoreStatic clone() => ScoreStatic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScoreStatic copyWith(void Function(ScoreStatic) updates) =>
      super.copyWith((message) => updates(message as ScoreStatic))
          as ScoreStatic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScoreStatic create() => ScoreStatic._();
  ScoreStatic createEmptyInstance() => create();
  static $pb.PbList<ScoreStatic> createRepeated() => $pb.PbList<ScoreStatic>();
  @$core.pragma('dart2js:noInline')
  static ScoreStatic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScoreStatic>(create);
  static ScoreStatic? _defaultInstance;

  @$pb.TagNumber(1)
  UserStaticInfo get mine => $_getN(0);
  @$pb.TagNumber(1)
  set mine(UserStaticInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMine() => $_has(0);
  @$pb.TagNumber(1)
  void clearMine() => clearField(1);
  @$pb.TagNumber(1)
  UserStaticInfo ensureMine() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<UserStaticInfo> get userList => $_getList(1);
}

class UserStaticInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserStaticInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Uid',
        $pb.PbFieldType.OU3,
        protoName: 'Uid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Name',
        protoName: 'Name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Icon',
        protoName: 'Icon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Score',
        $pb.PbFieldType.OU3,
        protoName: 'Score')
    ..hasRequiredFields = false;

  UserStaticInfo._() : super();
  factory UserStaticInfo({
    $core.int? uid,
    $core.String? name,
    $core.int? rank,
    $core.String? icon,
    $core.int? score,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory UserStaticInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserStaticInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserStaticInfo clone() => UserStaticInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserStaticInfo copyWith(void Function(UserStaticInfo) updates) =>
      super.copyWith((message) => updates(message as UserStaticInfo))
          as UserStaticInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserStaticInfo create() => UserStaticInfo._();
  UserStaticInfo createEmptyInstance() => create();
  static $pb.PbList<UserStaticInfo> createRepeated() =>
      $pb.PbList<UserStaticInfo>();
  @$core.pragma('dart2js:noInline')
  static UserStaticInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserStaticInfo>(create);
  static UserStaticInfo? _defaultInstance;

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
  $core.int get rank => $_getIZ(2);
  @$pb.TagNumber(3)
  set rank($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRank() => $_has(2);
  @$pb.TagNumber(3)
  void clearRank() => clearField(3);

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
  $core.int get score => $_getIZ(4);
  @$pb.TagNumber(5)
  set score($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearScore() => clearField(5);
}
