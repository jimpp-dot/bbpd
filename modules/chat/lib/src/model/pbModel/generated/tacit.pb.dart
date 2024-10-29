///
//  Generated code. Do not modify.
//  source: tacit.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class TacitQuestion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TacitQuestion',
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
            : 'question')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'answer1')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'answer2')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'answer3')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'answer4')
    ..hasRequiredFields = false;

  TacitQuestion._() : super();
  factory TacitQuestion({
    $core.int? id,
    $core.String? question,
    $core.String? answer1,
    $core.String? answer2,
    $core.String? answer3,
    $core.String? answer4,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (question != null) {
      _result.question = question;
    }
    if (answer1 != null) {
      _result.answer1 = answer1;
    }
    if (answer2 != null) {
      _result.answer2 = answer2;
    }
    if (answer3 != null) {
      _result.answer3 = answer3;
    }
    if (answer4 != null) {
      _result.answer4 = answer4;
    }
    return _result;
  }
  factory TacitQuestion.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TacitQuestion.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TacitQuestion clone() => TacitQuestion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TacitQuestion copyWith(void Function(TacitQuestion) updates) =>
      super.copyWith((message) => updates(message as TacitQuestion))
          as TacitQuestion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TacitQuestion create() => TacitQuestion._();
  TacitQuestion createEmptyInstance() => create();
  static $pb.PbList<TacitQuestion> createRepeated() =>
      $pb.PbList<TacitQuestion>();
  @$core.pragma('dart2js:noInline')
  static TacitQuestion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TacitQuestion>(create);
  static TacitQuestion? _defaultInstance;

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
  $core.String get answer1 => $_getSZ(2);
  @$pb.TagNumber(3)
  set answer1($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAnswer1() => $_has(2);
  @$pb.TagNumber(3)
  void clearAnswer1() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get answer2 => $_getSZ(3);
  @$pb.TagNumber(4)
  set answer2($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAnswer2() => $_has(3);
  @$pb.TagNumber(4)
  void clearAnswer2() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get answer3 => $_getSZ(4);
  @$pb.TagNumber(5)
  set answer3($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAnswer3() => $_has(4);
  @$pb.TagNumber(5)
  void clearAnswer3() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get answer4 => $_getSZ(5);
  @$pb.TagNumber(6)
  set answer4($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAnswer4() => $_has(5);
  @$pb.TagNumber(6)
  void clearAnswer4() => clearField(6);
}

class ResTacitQuestion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResTacitQuestion',
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
    ..aOM<TacitQuestion>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'question',
        subBuilder: TacitQuestion.create)
    ..hasRequiredFields = false;

  ResTacitQuestion._() : super();
  factory ResTacitQuestion({
    $core.bool? success,
    $core.String? msg,
    TacitQuestion? question,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (question != null) {
      _result.question = question;
    }
    return _result;
  }
  factory ResTacitQuestion.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResTacitQuestion.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResTacitQuestion clone() => ResTacitQuestion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResTacitQuestion copyWith(void Function(ResTacitQuestion) updates) =>
      super.copyWith((message) => updates(message as ResTacitQuestion))
          as ResTacitQuestion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResTacitQuestion create() => ResTacitQuestion._();
  ResTacitQuestion createEmptyInstance() => create();
  static $pb.PbList<ResTacitQuestion> createRepeated() =>
      $pb.PbList<ResTacitQuestion>();
  @$core.pragma('dart2js:noInline')
  static ResTacitQuestion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResTacitQuestion>(create);
  static ResTacitQuestion? _defaultInstance;

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
  TacitQuestion get question => $_getN(2);
  @$pb.TagNumber(3)
  set question(TacitQuestion v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasQuestion() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuestion() => clearField(3);
  @$pb.TagNumber(3)
  TacitQuestion ensureQuestion() => $_ensure(2);
}

class ResSendTacitQuestion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSendTacitQuestion',
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
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msgId')
    ..hasRequiredFields = false;

  ResSendTacitQuestion._() : super();
  factory ResSendTacitQuestion({
    $core.bool? success,
    $core.String? msg,
    $fixnum.Int64? msgId,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (msgId != null) {
      _result.msgId = msgId;
    }
    return _result;
  }
  factory ResSendTacitQuestion.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSendTacitQuestion.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSendTacitQuestion clone() =>
      ResSendTacitQuestion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSendTacitQuestion copyWith(void Function(ResSendTacitQuestion) updates) =>
      super.copyWith((message) => updates(message as ResSendTacitQuestion))
          as ResSendTacitQuestion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSendTacitQuestion create() => ResSendTacitQuestion._();
  ResSendTacitQuestion createEmptyInstance() => create();
  static $pb.PbList<ResSendTacitQuestion> createRepeated() =>
      $pb.PbList<ResSendTacitQuestion>();
  @$core.pragma('dart2js:noInline')
  static ResSendTacitQuestion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSendTacitQuestion>(create);
  static ResSendTacitQuestion? _defaultInstance;

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
  $fixnum.Int64 get msgId => $_getI64(2);
  @$pb.TagNumber(3)
  set msgId($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMsgId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsgId() => clearField(3);
}

class ResAnswerTacitQuestion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAnswerTacitQuestion',
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

  ResAnswerTacitQuestion._() : super();
  factory ResAnswerTacitQuestion({
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
  factory ResAnswerTacitQuestion.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAnswerTacitQuestion.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAnswerTacitQuestion clone() =>
      ResAnswerTacitQuestion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAnswerTacitQuestion copyWith(
          void Function(ResAnswerTacitQuestion) updates) =>
      super.copyWith((message) => updates(message as ResAnswerTacitQuestion))
          as ResAnswerTacitQuestion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAnswerTacitQuestion create() => ResAnswerTacitQuestion._();
  ResAnswerTacitQuestion createEmptyInstance() => create();
  static $pb.PbList<ResAnswerTacitQuestion> createRepeated() =>
      $pb.PbList<ResAnswerTacitQuestion>();
  @$core.pragma('dart2js:noInline')
  static ResAnswerTacitQuestion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAnswerTacitQuestion>(create);
  static ResAnswerTacitQuestion? _defaultInstance;

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

class ResQueryTacitQuestion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResQueryTacitQuestion',
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
            : 'answer',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ResQueryTacitQuestion._() : super();
  factory ResQueryTacitQuestion({
    $core.bool? success,
    $core.String? msg,
    $core.int? answer,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (answer != null) {
      _result.answer = answer;
    }
    return _result;
  }
  factory ResQueryTacitQuestion.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResQueryTacitQuestion.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResQueryTacitQuestion clone() =>
      ResQueryTacitQuestion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResQueryTacitQuestion copyWith(
          void Function(ResQueryTacitQuestion) updates) =>
      super.copyWith((message) => updates(message as ResQueryTacitQuestion))
          as ResQueryTacitQuestion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResQueryTacitQuestion create() => ResQueryTacitQuestion._();
  ResQueryTacitQuestion createEmptyInstance() => create();
  static $pb.PbList<ResQueryTacitQuestion> createRepeated() =>
      $pb.PbList<ResQueryTacitQuestion>();
  @$core.pragma('dart2js:noInline')
  static ResQueryTacitQuestion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResQueryTacitQuestion>(create);
  static ResQueryTacitQuestion? _defaultInstance;

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
  $core.int get answer => $_getIZ(2);
  @$pb.TagNumber(3)
  set answer($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAnswer() => $_has(2);
  @$pb.TagNumber(3)
  void clearAnswer() => clearField(3);
}

class ResSendHeartFlipAnswer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSendHeartFlipAnswer',
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
    ..aOM<AnswerHeartFlipData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AnswerHeartFlipData.create)
    ..hasRequiredFields = false;

  ResSendHeartFlipAnswer._() : super();
  factory ResSendHeartFlipAnswer({
    $core.bool? success,
    $core.String? msg,
    AnswerHeartFlipData? data,
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
  factory ResSendHeartFlipAnswer.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSendHeartFlipAnswer.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSendHeartFlipAnswer clone() =>
      ResSendHeartFlipAnswer()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSendHeartFlipAnswer copyWith(
          void Function(ResSendHeartFlipAnswer) updates) =>
      super.copyWith((message) => updates(message as ResSendHeartFlipAnswer))
          as ResSendHeartFlipAnswer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSendHeartFlipAnswer create() => ResSendHeartFlipAnswer._();
  ResSendHeartFlipAnswer createEmptyInstance() => create();
  static $pb.PbList<ResSendHeartFlipAnswer> createRepeated() =>
      $pb.PbList<ResSendHeartFlipAnswer>();
  @$core.pragma('dart2js:noInline')
  static ResSendHeartFlipAnswer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSendHeartFlipAnswer>(create);
  static ResSendHeartFlipAnswer? _defaultInstance;

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
  AnswerHeartFlipData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AnswerHeartFlipData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AnswerHeartFlipData ensureData() => $_ensure(2);
}

class AnswerHeartFlipData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnswerHeartFlipData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toolate')
    ..aOM<AnswerHeartFlipGift>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        subBuilder: AnswerHeartFlipGift.create)
    ..hasRequiredFields = false;

  AnswerHeartFlipData._() : super();
  factory AnswerHeartFlipData({
    $core.bool? toolate,
    AnswerHeartFlipGift? gift,
  }) {
    final _result = create();
    if (toolate != null) {
      _result.toolate = toolate;
    }
    if (gift != null) {
      _result.gift = gift;
    }
    return _result;
  }
  factory AnswerHeartFlipData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnswerHeartFlipData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnswerHeartFlipData clone() => AnswerHeartFlipData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnswerHeartFlipData copyWith(void Function(AnswerHeartFlipData) updates) =>
      super.copyWith((message) => updates(message as AnswerHeartFlipData))
          as AnswerHeartFlipData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnswerHeartFlipData create() => AnswerHeartFlipData._();
  AnswerHeartFlipData createEmptyInstance() => create();
  static $pb.PbList<AnswerHeartFlipData> createRepeated() =>
      $pb.PbList<AnswerHeartFlipData>();
  @$core.pragma('dart2js:noInline')
  static AnswerHeartFlipData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnswerHeartFlipData>(create);
  static AnswerHeartFlipData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get toolate => $_getBF(0);
  @$pb.TagNumber(1)
  set toolate($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasToolate() => $_has(0);
  @$pb.TagNumber(1)
  void clearToolate() => clearField(1);

  @$pb.TagNumber(2)
  AnswerHeartFlipGift get gift => $_getN(1);
  @$pb.TagNumber(2)
  set gift(AnswerHeartFlipGift v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGift() => $_has(1);
  @$pb.TagNumber(2)
  void clearGift() => clearField(2);
  @$pb.TagNumber(2)
  AnswerHeartFlipGift ensureGift() => $_ensure(1);
}

class AnswerHeartFlipGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnswerHeartFlipGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftIcon')
    ..hasRequiredFields = false;

  AnswerHeartFlipGift._() : super();
  factory AnswerHeartFlipGift({
    $core.int? giftId,
    $core.String? giftName,
    $core.int? giftNum,
    $core.String? giftIcon,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (giftNum != null) {
      _result.giftNum = giftNum;
    }
    if (giftIcon != null) {
      _result.giftIcon = giftIcon;
    }
    return _result;
  }
  factory AnswerHeartFlipGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnswerHeartFlipGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnswerHeartFlipGift clone() => AnswerHeartFlipGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnswerHeartFlipGift copyWith(void Function(AnswerHeartFlipGift) updates) =>
      super.copyWith((message) => updates(message as AnswerHeartFlipGift))
          as AnswerHeartFlipGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnswerHeartFlipGift create() => AnswerHeartFlipGift._();
  AnswerHeartFlipGift createEmptyInstance() => create();
  static $pb.PbList<AnswerHeartFlipGift> createRepeated() =>
      $pb.PbList<AnswerHeartFlipGift>();
  @$core.pragma('dart2js:noInline')
  static AnswerHeartFlipGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnswerHeartFlipGift>(create);
  static AnswerHeartFlipGift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get giftName => $_getSZ(1);
  @$pb.TagNumber(2)
  set giftName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get giftNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set giftNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get giftIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set giftIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftIcon() => clearField(4);
}
