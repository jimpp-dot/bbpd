///
//  Generated code. Do not modify.
//  source: party.privity.next.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PartyPrivityNext_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyPrivityNext.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.privity.next'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PartyPrivityNext_Options._() : super();
  factory PartyPrivityNext_Options({
    $core.String? description,
    $core.int? id,
  }) {
    final _result = create();
    if (description != null) {
      _result.description = description;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory PartyPrivityNext_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyPrivityNext_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyPrivityNext_Options clone() =>
      PartyPrivityNext_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyPrivityNext_Options copyWith(
          void Function(PartyPrivityNext_Options) updates) =>
      super.copyWith((message) => updates(message as PartyPrivityNext_Options))
          as PartyPrivityNext_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyPrivityNext_Options create() => PartyPrivityNext_Options._();
  PartyPrivityNext_Options createEmptyInstance() => create();
  static $pb.PbList<PartyPrivityNext_Options> createRepeated() =>
      $pb.PbList<PartyPrivityNext_Options>();
  @$core.pragma('dart2js:noInline')
  static PartyPrivityNext_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyPrivityNext_Options>(create);
  static PartyPrivityNext_Options? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get description => $_getSZ(0);
  @$pb.TagNumber(1)
  set description($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearDescription() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class PartyPrivityNext_Question extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyPrivityNext.Question',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.privity.next'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..pc<PartyPrivityNext_Options>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        $pb.PbFieldType.PM,
        subBuilder: PartyPrivityNext_Options.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'qid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PartyPrivityNext_Question._() : super();
  factory PartyPrivityNext_Question({
    $core.String? description,
    $core.Iterable<PartyPrivityNext_Options>? options,
    $core.int? qid,
  }) {
    final _result = create();
    if (description != null) {
      _result.description = description;
    }
    if (options != null) {
      _result.options.addAll(options);
    }
    if (qid != null) {
      _result.qid = qid;
    }
    return _result;
  }
  factory PartyPrivityNext_Question.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyPrivityNext_Question.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyPrivityNext_Question clone() =>
      PartyPrivityNext_Question()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyPrivityNext_Question copyWith(
          void Function(PartyPrivityNext_Question) updates) =>
      super.copyWith((message) => updates(message as PartyPrivityNext_Question))
          as PartyPrivityNext_Question; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyPrivityNext_Question create() => PartyPrivityNext_Question._();
  PartyPrivityNext_Question createEmptyInstance() => create();
  static $pb.PbList<PartyPrivityNext_Question> createRepeated() =>
      $pb.PbList<PartyPrivityNext_Question>();
  @$core.pragma('dart2js:noInline')
  static PartyPrivityNext_Question getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyPrivityNext_Question>(create);
  static PartyPrivityNext_Question? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get description => $_getSZ(0);
  @$pb.TagNumber(1)
  set description($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearDescription() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<PartyPrivityNext_Options> get options => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get qid => $_getIZ(2);
  @$pb.TagNumber(3)
  set qid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasQid() => $_has(2);
  @$pb.TagNumber(3)
  void clearQid() => clearField(3);
}

class PartyPrivityNext_Privity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyPrivityNext.Privity',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.privity.next'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current',
        $pb.PbFieldType.OU3)
    ..aOM<PartyPrivityNext_Question>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'question',
        subBuilder: PartyPrivityNext_Question.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'surplus_time',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total')
    ..hasRequiredFields = false;

  PartyPrivityNext_Privity._() : super();
  factory PartyPrivityNext_Privity({
    $core.int? current,
    PartyPrivityNext_Question? question,
    $core.String? state,
    $core.int? surplusTime,
    $core.String? total,
  }) {
    final _result = create();
    if (current != null) {
      _result.current = current;
    }
    if (question != null) {
      _result.question = question;
    }
    if (state != null) {
      _result.state = state;
    }
    if (surplusTime != null) {
      _result.surplusTime = surplusTime;
    }
    if (total != null) {
      _result.total = total;
    }
    return _result;
  }
  factory PartyPrivityNext_Privity.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyPrivityNext_Privity.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyPrivityNext_Privity clone() =>
      PartyPrivityNext_Privity()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyPrivityNext_Privity copyWith(
          void Function(PartyPrivityNext_Privity) updates) =>
      super.copyWith((message) => updates(message as PartyPrivityNext_Privity))
          as PartyPrivityNext_Privity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyPrivityNext_Privity create() => PartyPrivityNext_Privity._();
  PartyPrivityNext_Privity createEmptyInstance() => create();
  static $pb.PbList<PartyPrivityNext_Privity> createRepeated() =>
      $pb.PbList<PartyPrivityNext_Privity>();
  @$core.pragma('dart2js:noInline')
  static PartyPrivityNext_Privity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyPrivityNext_Privity>(create);
  static PartyPrivityNext_Privity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get current => $_getIZ(0);
  @$pb.TagNumber(1)
  set current($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrent() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrent() => clearField(1);

  @$pb.TagNumber(2)
  PartyPrivityNext_Question get question => $_getN(1);
  @$pb.TagNumber(2)
  set question(PartyPrivityNext_Question v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasQuestion() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestion() => clearField(2);
  @$pb.TagNumber(2)
  PartyPrivityNext_Question ensureQuestion() => $_ensure(1);

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
  $core.int get surplusTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set surplusTime($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSurplusTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearSurplusTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get total => $_getSZ(4);
  @$pb.TagNumber(5)
  set total($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTotal() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotal() => clearField(5);
}

class PartyPrivityNext extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyPrivityNext',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.privity.next'),
      createEmptyInstance: create)
    ..aOM<PartyPrivityNext_Privity>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privity',
        subBuilder: PartyPrivityNext_Privity.create)
    ..hasRequiredFields = false;

  PartyPrivityNext._() : super();
  factory PartyPrivityNext({
    PartyPrivityNext_Privity? privity,
  }) {
    final _result = create();
    if (privity != null) {
      _result.privity = privity;
    }
    return _result;
  }
  factory PartyPrivityNext.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyPrivityNext.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyPrivityNext clone() => PartyPrivityNext()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyPrivityNext copyWith(void Function(PartyPrivityNext) updates) =>
      super.copyWith((message) => updates(message as PartyPrivityNext))
          as PartyPrivityNext; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyPrivityNext create() => PartyPrivityNext._();
  PartyPrivityNext createEmptyInstance() => create();
  static $pb.PbList<PartyPrivityNext> createRepeated() =>
      $pb.PbList<PartyPrivityNext>();
  @$core.pragma('dart2js:noInline')
  static PartyPrivityNext getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyPrivityNext>(create);
  static PartyPrivityNext? _defaultInstance;

  @$pb.TagNumber(1)
  PartyPrivityNext_Privity get privity => $_getN(0);
  @$pb.TagNumber(1)
  set privity(PartyPrivityNext_Privity v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrivity() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivity() => clearField(1);
  @$pb.TagNumber(1)
  PartyPrivityNext_Privity ensurePrivity() => $_ensure(0);
}
