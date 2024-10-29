///
//  Generated code. Do not modify.
//  source: plugin_vote.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class OptionUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OptionUser',
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
    ..hasRequiredFields = false;

  OptionUser._() : super();
  factory OptionUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
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
    return _result;
  }
  factory OptionUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OptionUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OptionUser clone() => OptionUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OptionUser copyWith(void Function(OptionUser) updates) =>
      super.copyWith((message) => updates(message as OptionUser))
          as OptionUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OptionUser create() => OptionUser._();
  OptionUser createEmptyInstance() => create();
  static $pb.PbList<OptionUser> createRepeated() => $pb.PbList<OptionUser>();
  @$core.pragma('dart2js:noInline')
  static OptionUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OptionUser>(create);
  static OptionUser? _defaultInstance;

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
}

class OptionText extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OptionText',
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
            : 'content')
    ..hasRequiredFields = false;

  OptionText._() : super();
  factory OptionText({
    $core.String? title,
    $core.String? content,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory OptionText.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OptionText.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OptionText clone() => OptionText()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OptionText copyWith(void Function(OptionText) updates) =>
      super.copyWith((message) => updates(message as OptionText))
          as OptionText; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OptionText create() => OptionText._();
  OptionText createEmptyInstance() => create();
  static $pb.PbList<OptionText> createRepeated() => $pb.PbList<OptionText>();
  @$core.pragma('dart2js:noInline')
  static OptionText getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OptionText>(create);
  static OptionText? _defaultInstance;

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
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
}

enum VoteOptions_Data { user, text, notSet }

class VoteOptions extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, VoteOptions_Data> _VoteOptions_DataByTag = {
    2: VoteOptions_Data.user,
    3: VoteOptions_Data.text,
    0: VoteOptions_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VoteOptions',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.O3)
    ..aOM<OptionUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: OptionUser.create)
    ..aOM<OptionText>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'text',
        subBuilder: OptionText.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isVote')
    ..hasRequiredFields = false;

  VoteOptions._() : super();
  factory VoteOptions({
    $core.int? id,
    OptionUser? user,
    OptionText? text,
    $core.bool? isVote,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (user != null) {
      _result.user = user;
    }
    if (text != null) {
      _result.text = text;
    }
    if (isVote != null) {
      _result.isVote = isVote;
    }
    return _result;
  }
  factory VoteOptions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VoteOptions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VoteOptions clone() => VoteOptions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VoteOptions copyWith(void Function(VoteOptions) updates) =>
      super.copyWith((message) => updates(message as VoteOptions))
          as VoteOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoteOptions create() => VoteOptions._();
  VoteOptions createEmptyInstance() => create();
  static $pb.PbList<VoteOptions> createRepeated() => $pb.PbList<VoteOptions>();
  @$core.pragma('dart2js:noInline')
  static VoteOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoteOptions>(create);
  static VoteOptions? _defaultInstance;

  VoteOptions_Data whichData() => _VoteOptions_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  OptionUser get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(OptionUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  OptionUser ensureUser() => $_ensure(1);

  @$pb.TagNumber(3)
  OptionText get text => $_getN(2);
  @$pb.TagNumber(3)
  set text(OptionText v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => clearField(3);
  @$pb.TagNumber(3)
  OptionText ensureText() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get isVote => $_getBF(3);
  @$pb.TagNumber(4)
  set isVote($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsVote() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsVote() => clearField(4);
}

class VoteBase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VoteBase',
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
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selectType',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'resultShow',
        $pb.PbFieldType.O3)
    ..pc<VoteOptions>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        $pb.PbFieldType.PM,
        subBuilder: VoteOptions.create)
    ..hasRequiredFields = false;

  VoteBase._() : super();
  factory VoteBase({
    $core.int? id,
    $core.String? title,
    $core.String? type,
    $core.int? duration,
    $core.int? selectType,
    $core.int? resultShow,
    $core.Iterable<VoteOptions>? options,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (type != null) {
      _result.type = type;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (selectType != null) {
      _result.selectType = selectType;
    }
    if (resultShow != null) {
      _result.resultShow = resultShow;
    }
    if (options != null) {
      _result.options.addAll(options);
    }
    return _result;
  }
  factory VoteBase.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VoteBase.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VoteBase clone() => VoteBase()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VoteBase copyWith(void Function(VoteBase) updates) =>
      super.copyWith((message) => updates(message as VoteBase))
          as VoteBase; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoteBase create() => VoteBase._();
  VoteBase createEmptyInstance() => create();
  static $pb.PbList<VoteBase> createRepeated() => $pb.PbList<VoteBase>();
  @$core.pragma('dart2js:noInline')
  static VoteBase getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoteBase>(create);
  static VoteBase? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

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
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get duration => $_getIZ(3);
  @$pb.TagNumber(4)
  set duration($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get selectType => $_getIZ(4);
  @$pb.TagNumber(5)
  set selectType($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSelectType() => $_has(4);
  @$pb.TagNumber(5)
  void clearSelectType() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get resultShow => $_getIZ(5);
  @$pb.TagNumber(6)
  set resultShow($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasResultShow() => $_has(5);
  @$pb.TagNumber(6)
  void clearResultShow() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<VoteOptions> get options => $_getList(6);
}

class VoteDynamic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VoteDynamic',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'oId',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.O3)
    ..a<$core.double>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rate',
        $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  VoteDynamic._() : super();
  factory VoteDynamic({
    $core.int? oId,
    $core.int? score,
    $core.double? rate,
  }) {
    final _result = create();
    if (oId != null) {
      _result.oId = oId;
    }
    if (score != null) {
      _result.score = score;
    }
    if (rate != null) {
      _result.rate = rate;
    }
    return _result;
  }
  factory VoteDynamic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VoteDynamic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VoteDynamic clone() => VoteDynamic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VoteDynamic copyWith(void Function(VoteDynamic) updates) =>
      super.copyWith((message) => updates(message as VoteDynamic))
          as VoteDynamic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoteDynamic create() => VoteDynamic._();
  VoteDynamic createEmptyInstance() => create();
  static $pb.PbList<VoteDynamic> createRepeated() => $pb.PbList<VoteDynamic>();
  @$core.pragma('dart2js:noInline')
  static VoteDynamic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoteDynamic>(create);
  static VoteDynamic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get oId => $_getIZ(0);
  @$pb.TagNumber(1)
  set oId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOId() => clearField(1);

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

  @$pb.TagNumber(3)
  $core.double get rate => $_getN(2);
  @$pb.TagNumber(3)
  set rate($core.double v) {
    $_setDouble(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRate() => $_has(2);
  @$pb.TagNumber(3)
  void clearRate() => clearField(3);
}

class Vote extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Vote',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<VoteBase>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'base',
        subBuilder: VoteBase.create)
    ..pc<VoteDynamic>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dynamic',
        $pb.PbFieldType.PM,
        subBuilder: VoteDynamic.create)
    ..hasRequiredFields = false;

  Vote._() : super();
  factory Vote({
    VoteBase? base,
    $core.Iterable<VoteDynamic>? dynamic,
  }) {
    final _result = create();
    if (base != null) {
      _result.base = base;
    }
    if (dynamic != null) {
      _result.dynamic.addAll(dynamic);
    }
    return _result;
  }
  factory Vote.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Vote.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Vote clone() => Vote()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Vote copyWith(void Function(Vote) updates) =>
      super.copyWith((message) => updates(message as Vote))
          as Vote; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Vote create() => Vote._();
  Vote createEmptyInstance() => create();
  static $pb.PbList<Vote> createRepeated() => $pb.PbList<Vote>();
  @$core.pragma('dart2js:noInline')
  static Vote getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Vote>(create);
  static Vote? _defaultInstance;

  @$pb.TagNumber(1)
  VoteBase get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(VoteBase v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  VoteBase ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<VoteDynamic> get dynamic => $_getList(1);
}

class ResPluginVoteInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResPluginVoteInfo',
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
    ..aOM<Vote>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: Vote.create)
    ..hasRequiredFields = false;

  ResPluginVoteInfo._() : super();
  factory ResPluginVoteInfo({
    $core.bool? success,
    $core.String? msg,
    Vote? data,
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
  factory ResPluginVoteInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResPluginVoteInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResPluginVoteInfo clone() => ResPluginVoteInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResPluginVoteInfo copyWith(void Function(ResPluginVoteInfo) updates) =>
      super.copyWith((message) => updates(message as ResPluginVoteInfo))
          as ResPluginVoteInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResPluginVoteInfo create() => ResPluginVoteInfo._();
  ResPluginVoteInfo createEmptyInstance() => create();
  static $pb.PbList<ResPluginVoteInfo> createRepeated() =>
      $pb.PbList<ResPluginVoteInfo>();
  @$core.pragma('dart2js:noInline')
  static ResPluginVoteInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResPluginVoteInfo>(create);
  static ResPluginVoteInfo? _defaultInstance;

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
  Vote get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(Vote v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  Vote ensureData() => $_ensure(2);
}

class VoteSettingRule extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VoteSettingRule',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
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
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'optionMaxNum',
        $pb.PbFieldType.O3)
    ..aOM<VoteSettingTime>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        subBuilder: VoteSettingTime.create)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'enableSelect')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defaultSelect')
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'enableResultShow')
    ..aOB(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defaultResultShow')
    ..hasRequiredFields = false;

  VoteSettingRule._() : super();
  factory VoteSettingRule({
    $core.String? type,
    $core.String? name,
    $core.int? optionMaxNum,
    VoteSettingTime? time,
    $core.bool? enableSelect,
    $core.bool? defaultSelect,
    $core.bool? enableResultShow,
    $core.bool? defaultResultShow,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (name != null) {
      _result.name = name;
    }
    if (optionMaxNum != null) {
      _result.optionMaxNum = optionMaxNum;
    }
    if (time != null) {
      _result.time = time;
    }
    if (enableSelect != null) {
      _result.enableSelect = enableSelect;
    }
    if (defaultSelect != null) {
      _result.defaultSelect = defaultSelect;
    }
    if (enableResultShow != null) {
      _result.enableResultShow = enableResultShow;
    }
    if (defaultResultShow != null) {
      _result.defaultResultShow = defaultResultShow;
    }
    return _result;
  }
  factory VoteSettingRule.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VoteSettingRule.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VoteSettingRule clone() => VoteSettingRule()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VoteSettingRule copyWith(void Function(VoteSettingRule) updates) =>
      super.copyWith((message) => updates(message as VoteSettingRule))
          as VoteSettingRule; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoteSettingRule create() => VoteSettingRule._();
  VoteSettingRule createEmptyInstance() => create();
  static $pb.PbList<VoteSettingRule> createRepeated() =>
      $pb.PbList<VoteSettingRule>();
  @$core.pragma('dart2js:noInline')
  static VoteSettingRule getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoteSettingRule>(create);
  static VoteSettingRule? _defaultInstance;

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
  $core.int get optionMaxNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set optionMaxNum($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOptionMaxNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearOptionMaxNum() => clearField(3);

  @$pb.TagNumber(4)
  VoteSettingTime get time => $_getN(3);
  @$pb.TagNumber(4)
  set time(VoteSettingTime v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearTime() => clearField(4);
  @$pb.TagNumber(4)
  VoteSettingTime ensureTime() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get enableSelect => $_getBF(4);
  @$pb.TagNumber(5)
  set enableSelect($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasEnableSelect() => $_has(4);
  @$pb.TagNumber(5)
  void clearEnableSelect() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get defaultSelect => $_getBF(5);
  @$pb.TagNumber(6)
  set defaultSelect($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDefaultSelect() => $_has(5);
  @$pb.TagNumber(6)
  void clearDefaultSelect() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get enableResultShow => $_getBF(6);
  @$pb.TagNumber(7)
  set enableResultShow($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasEnableResultShow() => $_has(6);
  @$pb.TagNumber(7)
  void clearEnableResultShow() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get defaultResultShow => $_getBF(7);
  @$pb.TagNumber(8)
  set defaultResultShow($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDefaultResultShow() => $_has(7);
  @$pb.TagNumber(8)
  void clearDefaultResultShow() => clearField(8);
}

class VoteSettingTime extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VoteSettingTime',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'min',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'max',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'step',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'default',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  VoteSettingTime._() : super();
  factory VoteSettingTime({
    $core.int? min,
    $core.int? max,
    $core.int? step,
    $core.int? default_4,
  }) {
    final _result = create();
    if (min != null) {
      _result.min = min;
    }
    if (max != null) {
      _result.max = max;
    }
    if (step != null) {
      _result.step = step;
    }
    if (default_4 != null) {
      _result.default_4 = default_4;
    }
    return _result;
  }
  factory VoteSettingTime.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VoteSettingTime.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VoteSettingTime clone() => VoteSettingTime()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VoteSettingTime copyWith(void Function(VoteSettingTime) updates) =>
      super.copyWith((message) => updates(message as VoteSettingTime))
          as VoteSettingTime; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoteSettingTime create() => VoteSettingTime._();
  VoteSettingTime createEmptyInstance() => create();
  static $pb.PbList<VoteSettingTime> createRepeated() =>
      $pb.PbList<VoteSettingTime>();
  @$core.pragma('dart2js:noInline')
  static VoteSettingTime getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoteSettingTime>(create);
  static VoteSettingTime? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get min => $_getIZ(0);
  @$pb.TagNumber(1)
  set min($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMin() => $_has(0);
  @$pb.TagNumber(1)
  void clearMin() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get max => $_getIZ(1);
  @$pb.TagNumber(2)
  set max($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMax() => $_has(1);
  @$pb.TagNumber(2)
  void clearMax() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get step => $_getIZ(2);
  @$pb.TagNumber(3)
  set step($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStep() => $_has(2);
  @$pb.TagNumber(3)
  void clearStep() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get default_4 => $_getIZ(3);
  @$pb.TagNumber(4)
  set default_4($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDefault_4() => $_has(3);
  @$pb.TagNumber(4)
  void clearDefault_4() => clearField(4);
}

class ResVoteConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResVoteConfig',
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
            : 'defaultRuleType')
    ..pc<VoteSettingRule>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: VoteSettingRule.create)
    ..hasRequiredFields = false;

  ResVoteConfig._() : super();
  factory ResVoteConfig({
    $core.bool? success,
    $core.String? msg,
    $core.String? defaultRuleType,
    $core.Iterable<VoteSettingRule>? list,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (defaultRuleType != null) {
      _result.defaultRuleType = defaultRuleType;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory ResVoteConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResVoteConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResVoteConfig clone() => ResVoteConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResVoteConfig copyWith(void Function(ResVoteConfig) updates) =>
      super.copyWith((message) => updates(message as ResVoteConfig))
          as ResVoteConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResVoteConfig create() => ResVoteConfig._();
  ResVoteConfig createEmptyInstance() => create();
  static $pb.PbList<ResVoteConfig> createRepeated() =>
      $pb.PbList<ResVoteConfig>();
  @$core.pragma('dart2js:noInline')
  static ResVoteConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResVoteConfig>(create);
  static ResVoteConfig? _defaultInstance;

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
  $core.String get defaultRuleType => $_getSZ(2);
  @$pb.TagNumber(3)
  set defaultRuleType($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDefaultRuleType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDefaultRuleType() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<VoteSettingRule> get list => $_getList(3);
}
