///
//  Generated code. Do not modify.
//  source: accompany.tacit.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class TacitAnswer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TacitAnswer',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'AccompanyTacit'),
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'answer',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  TacitAnswer._() : super();
  factory TacitAnswer({
    $core.int? uid,
    $core.String? icon,
    $core.int? answer,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (answer != null) {
      _result.answer = answer;
    }
    return _result;
  }
  factory TacitAnswer.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TacitAnswer.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TacitAnswer clone() => TacitAnswer()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TacitAnswer copyWith(void Function(TacitAnswer) updates) =>
      super.copyWith((message) => updates(message as TacitAnswer))
          as TacitAnswer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TacitAnswer create() => TacitAnswer._();
  TacitAnswer createEmptyInstance() => create();
  static $pb.PbList<TacitAnswer> createRepeated() => $pb.PbList<TacitAnswer>();
  @$core.pragma('dart2js:noInline')
  static TacitAnswer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TacitAnswer>(create);
  static TacitAnswer? _defaultInstance;

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
  $core.int get answer => $_getIZ(2);
  @$pb.TagNumber(3)
  set answer($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAnswer() => $_has(2);
  @$pb.TagNumber(3)
  void clearAnswer() => clearField(3);
}

class AccompanyTacit_Tacit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccompanyTacit.Tacit',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'AccompanyTacit'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'option')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'origin',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msgId',
        $pb.PbFieldType.OU3)
    ..p<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'include',
        $pb.PbFieldType.PU3)
    ..pc<TacitAnswer>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'answer',
        $pb.PbFieldType.PM,
        subBuilder: TacitAnswer.create)
    ..hasRequiredFields = false;

  AccompanyTacit_Tacit._() : super();
  factory AccompanyTacit_Tacit({
    $core.String? type,
    $core.String? title,
    $core.Iterable<$core.String>? option,
    $core.int? origin,
    $core.int? msgId,
    $core.Iterable<$core.int>? include,
    $core.Iterable<TacitAnswer>? answer,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (title != null) {
      _result.title = title;
    }
    if (option != null) {
      _result.option.addAll(option);
    }
    if (origin != null) {
      _result.origin = origin;
    }
    if (msgId != null) {
      _result.msgId = msgId;
    }
    if (include != null) {
      _result.include.addAll(include);
    }
    if (answer != null) {
      _result.answer.addAll(answer);
    }
    return _result;
  }
  factory AccompanyTacit_Tacit.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccompanyTacit_Tacit.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccompanyTacit_Tacit clone() =>
      AccompanyTacit_Tacit()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccompanyTacit_Tacit copyWith(void Function(AccompanyTacit_Tacit) updates) =>
      super.copyWith((message) => updates(message as AccompanyTacit_Tacit))
          as AccompanyTacit_Tacit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccompanyTacit_Tacit create() => AccompanyTacit_Tacit._();
  AccompanyTacit_Tacit createEmptyInstance() => create();
  static $pb.PbList<AccompanyTacit_Tacit> createRepeated() =>
      $pb.PbList<AccompanyTacit_Tacit>();
  @$core.pragma('dart2js:noInline')
  static AccompanyTacit_Tacit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccompanyTacit_Tacit>(create);
  static AccompanyTacit_Tacit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

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
  $core.List<$core.String> get option => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get origin => $_getIZ(3);
  @$pb.TagNumber(4)
  set origin($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOrigin() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrigin() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get msgId => $_getIZ(4);
  @$pb.TagNumber(5)
  set msgId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMsgId() => $_has(4);
  @$pb.TagNumber(5)
  void clearMsgId() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get include => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<TacitAnswer> get answer => $_getList(6);
}

class AccompanyTacit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccompanyTacit',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'AccompanyTacit'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extra')
    ..aOM<AccompanyTacit_Tacit>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tacit',
        subBuilder: AccompanyTacit_Tacit.create)
    ..hasRequiredFields = false;

  AccompanyTacit._() : super();
  factory AccompanyTacit({
    $core.String? content,
    $core.String? extra,
    AccompanyTacit_Tacit? tacit,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (extra != null) {
      _result.extra = extra;
    }
    if (tacit != null) {
      _result.tacit = tacit;
    }
    return _result;
  }
  factory AccompanyTacit.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccompanyTacit.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccompanyTacit clone() => AccompanyTacit()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccompanyTacit copyWith(void Function(AccompanyTacit) updates) =>
      super.copyWith((message) => updates(message as AccompanyTacit))
          as AccompanyTacit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccompanyTacit create() => AccompanyTacit._();
  AccompanyTacit createEmptyInstance() => create();
  static $pb.PbList<AccompanyTacit> createRepeated() =>
      $pb.PbList<AccompanyTacit>();
  @$core.pragma('dart2js:noInline')
  static AccompanyTacit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccompanyTacit>(create);
  static AccompanyTacit? _defaultInstance;

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
  $core.String get extra => $_getSZ(1);
  @$pb.TagNumber(2)
  set extra($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasExtra() => $_has(1);
  @$pb.TagNumber(2)
  void clearExtra() => clearField(2);

  @$pb.TagNumber(3)
  AccompanyTacit_Tacit get tacit => $_getN(2);
  @$pb.TagNumber(3)
  set tacit(AccompanyTacit_Tacit v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTacit() => $_has(2);
  @$pb.TagNumber(3)
  void clearTacit() => clearField(3);
  @$pb.TagNumber(3)
  AccompanyTacit_Tacit ensureTacit() => $_ensure(2);
}

class TacitQuestion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TacitQuestion',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'AccompanyTacit'),
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
              : 'AccompanyTacit'),
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
              : 'AccompanyTacit'),
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
              : 'AccompanyTacit'),
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
