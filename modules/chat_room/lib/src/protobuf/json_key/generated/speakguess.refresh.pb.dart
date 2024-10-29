///
//  Generated code. Do not modify.
//  source: speakguess.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SpeakguessRefresh_Current extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SpeakguessRefresh.Current',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'speakguess.refresh'),
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
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SpeakguessRefresh_Current._() : super();
  factory SpeakguessRefresh_Current({
    $core.String? icon,
    $core.String? name,
    $core.int? uid,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory SpeakguessRefresh_Current.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SpeakguessRefresh_Current.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SpeakguessRefresh_Current clone() =>
      SpeakguessRefresh_Current()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SpeakguessRefresh_Current copyWith(
          void Function(SpeakguessRefresh_Current) updates) =>
      super.copyWith((message) => updates(message as SpeakguessRefresh_Current))
          as SpeakguessRefresh_Current; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpeakguessRefresh_Current create() => SpeakguessRefresh_Current._();
  SpeakguessRefresh_Current createEmptyInstance() => create();
  static $pb.PbList<SpeakguessRefresh_Current> createRepeated() =>
      $pb.PbList<SpeakguessRefresh_Current>();
  @$core.pragma('dart2js:noInline')
  static SpeakguessRefresh_Current getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeakguessRefresh_Current>(create);
  static SpeakguessRefresh_Current? _defaultInstance;

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

class SpeakguessRefresh_WordInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SpeakguessRefresh.WordInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'speakguess.refresh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..pPS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hot_word_answer')
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hot_word_describer')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..pPS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'key_word_answer')
    ..pPS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'key_word_describer')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prompt')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'word')
    ..hasRequiredFields = false;

  SpeakguessRefresh_WordInfo._() : super();
  factory SpeakguessRefresh_WordInfo({
    $core.int? duration,
    $core.Iterable<$core.String>? hotWordAnswer,
    $core.Iterable<$core.String>? hotWordDescriber,
    $core.int? id,
    $core.Iterable<$core.String>? keyWordAnswer,
    $core.Iterable<$core.String>? keyWordDescriber,
    $core.String? prompt,
    $core.String? word,
  }) {
    final _result = create();
    if (duration != null) {
      _result.duration = duration;
    }
    if (hotWordAnswer != null) {
      _result.hotWordAnswer.addAll(hotWordAnswer);
    }
    if (hotWordDescriber != null) {
      _result.hotWordDescriber.addAll(hotWordDescriber);
    }
    if (id != null) {
      _result.id = id;
    }
    if (keyWordAnswer != null) {
      _result.keyWordAnswer.addAll(keyWordAnswer);
    }
    if (keyWordDescriber != null) {
      _result.keyWordDescriber.addAll(keyWordDescriber);
    }
    if (prompt != null) {
      _result.prompt = prompt;
    }
    if (word != null) {
      _result.word = word;
    }
    return _result;
  }
  factory SpeakguessRefresh_WordInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SpeakguessRefresh_WordInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SpeakguessRefresh_WordInfo clone() =>
      SpeakguessRefresh_WordInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SpeakguessRefresh_WordInfo copyWith(
          void Function(SpeakguessRefresh_WordInfo) updates) =>
      super.copyWith(
              (message) => updates(message as SpeakguessRefresh_WordInfo))
          as SpeakguessRefresh_WordInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpeakguessRefresh_WordInfo create() => SpeakguessRefresh_WordInfo._();
  SpeakguessRefresh_WordInfo createEmptyInstance() => create();
  static $pb.PbList<SpeakguessRefresh_WordInfo> createRepeated() =>
      $pb.PbList<SpeakguessRefresh_WordInfo>();
  @$core.pragma('dart2js:noInline')
  static SpeakguessRefresh_WordInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeakguessRefresh_WordInfo>(create);
  static SpeakguessRefresh_WordInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get duration => $_getIZ(0);
  @$pb.TagNumber(1)
  set duration($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDuration() => $_has(0);
  @$pb.TagNumber(1)
  void clearDuration() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get hotWordAnswer => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.String> get hotWordDescriber => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get id => $_getIZ(3);
  @$pb.TagNumber(4)
  set id($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get keyWordAnswer => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get keyWordDescriber => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get prompt => $_getSZ(6);
  @$pb.TagNumber(7)
  set prompt($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPrompt() => $_has(6);
  @$pb.TagNumber(7)
  void clearPrompt() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get word => $_getSZ(7);
  @$pb.TagNumber(8)
  set word($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasWord() => $_has(7);
  @$pb.TagNumber(8)
  void clearWord() => clearField(8);
}

class SpeakguessRefresh_Content_RankList_User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SpeakguessRefresh.Content.RankList.User',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'speakguess.refresh'),
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

  SpeakguessRefresh_Content_RankList_User._() : super();
  factory SpeakguessRefresh_Content_RankList_User({
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
  factory SpeakguessRefresh_Content_RankList_User.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SpeakguessRefresh_Content_RankList_User.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SpeakguessRefresh_Content_RankList_User clone() =>
      SpeakguessRefresh_Content_RankList_User()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SpeakguessRefresh_Content_RankList_User copyWith(
          void Function(SpeakguessRefresh_Content_RankList_User) updates) =>
      super.copyWith((message) =>
              updates(message as SpeakguessRefresh_Content_RankList_User))
          as SpeakguessRefresh_Content_RankList_User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpeakguessRefresh_Content_RankList_User create() =>
      SpeakguessRefresh_Content_RankList_User._();
  SpeakguessRefresh_Content_RankList_User createEmptyInstance() => create();
  static $pb.PbList<SpeakguessRefresh_Content_RankList_User> createRepeated() =>
      $pb.PbList<SpeakguessRefresh_Content_RankList_User>();
  @$core.pragma('dart2js:noInline')
  static SpeakguessRefresh_Content_RankList_User getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SpeakguessRefresh_Content_RankList_User>(create);
  static SpeakguessRefresh_Content_RankList_User? _defaultInstance;

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

class SpeakguessRefresh_Content_RankList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SpeakguessRefresh.Content.RankList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'speakguess.refresh'),
      createEmptyInstance: create)
    ..aOM<SpeakguessRefresh_Content_RankList_User>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: SpeakguessRefresh_Content_RankList_User.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SpeakguessRefresh_Content_RankList._() : super();
  factory SpeakguessRefresh_Content_RankList({
    SpeakguessRefresh_Content_RankList_User? user,
    $core.int? score,
    $core.int? rank,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (score != null) {
      _result.score = score;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    return _result;
  }
  factory SpeakguessRefresh_Content_RankList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SpeakguessRefresh_Content_RankList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SpeakguessRefresh_Content_RankList clone() =>
      SpeakguessRefresh_Content_RankList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SpeakguessRefresh_Content_RankList copyWith(
          void Function(SpeakguessRefresh_Content_RankList) updates) =>
      super.copyWith((message) =>
              updates(message as SpeakguessRefresh_Content_RankList))
          as SpeakguessRefresh_Content_RankList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpeakguessRefresh_Content_RankList create() =>
      SpeakguessRefresh_Content_RankList._();
  SpeakguessRefresh_Content_RankList createEmptyInstance() => create();
  static $pb.PbList<SpeakguessRefresh_Content_RankList> createRepeated() =>
      $pb.PbList<SpeakguessRefresh_Content_RankList>();
  @$core.pragma('dart2js:noInline')
  static SpeakguessRefresh_Content_RankList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeakguessRefresh_Content_RankList>(
          create);
  static SpeakguessRefresh_Content_RankList? _defaultInstance;

  @$pb.TagNumber(1)
  SpeakguessRefresh_Content_RankList_User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(SpeakguessRefresh_Content_RankList_User v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  SpeakguessRefresh_Content_RankList_User ensureUser() => $_ensure(0);

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
  $core.int get rank => $_getIZ(2);
  @$pb.TagNumber(3)
  set rank($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRank() => $_has(2);
  @$pb.TagNumber(3)
  void clearRank() => clearField(3);
}

class SpeakguessRefresh_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SpeakguessRefresh.Content',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'speakguess.refresh'),
      createEmptyInstance: create)
    ..aOM<SpeakguessRefresh_Current>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current',
        subBuilder: SpeakguessRefresh_Current.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'surplus_duration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'timestamp',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total_duration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'turn_start',
        $pb.PbFieldType.OU3)
    ..aOM<SpeakguessRefresh_WordInfo>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'word_info',
        subBuilder: SpeakguessRefresh_WordInfo.create)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'change_type')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guess_success',
        $pb.PbFieldType.OU3)
    ..pc<SpeakguessRefresh_Content_RankList>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank_list',
        $pb.PbFieldType.PM,
        subBuilder: SpeakguessRefresh_Content_RankList.create)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effect')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'winner',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'winner_score',
        $pb.PbFieldType.OU3)
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'next_word')
    ..hasRequiredFields = false;

  SpeakguessRefresh_Content._() : super();
  factory SpeakguessRefresh_Content({
    SpeakguessRefresh_Current? current,
    $core.int? position,
    $core.int? surplusDuration,
    $core.int? timestamp,
    $core.int? totalDuration,
    $core.int? turnStart,
    SpeakguessRefresh_WordInfo? wordInfo,
    $core.String? changeType,
    $core.int? guessSuccess,
    $core.Iterable<SpeakguessRefresh_Content_RankList>? rankList,
    $core.String? effect,
    $core.int? winner,
    $core.int? winnerScore,
    $core.String? nextWord,
  }) {
    final _result = create();
    if (current != null) {
      _result.current = current;
    }
    if (position != null) {
      _result.position = position;
    }
    if (surplusDuration != null) {
      _result.surplusDuration = surplusDuration;
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (totalDuration != null) {
      _result.totalDuration = totalDuration;
    }
    if (turnStart != null) {
      _result.turnStart = turnStart;
    }
    if (wordInfo != null) {
      _result.wordInfo = wordInfo;
    }
    if (changeType != null) {
      _result.changeType = changeType;
    }
    if (guessSuccess != null) {
      _result.guessSuccess = guessSuccess;
    }
    if (rankList != null) {
      _result.rankList.addAll(rankList);
    }
    if (effect != null) {
      _result.effect = effect;
    }
    if (winner != null) {
      _result.winner = winner;
    }
    if (winnerScore != null) {
      _result.winnerScore = winnerScore;
    }
    if (nextWord != null) {
      _result.nextWord = nextWord;
    }
    return _result;
  }
  factory SpeakguessRefresh_Content.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SpeakguessRefresh_Content.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SpeakguessRefresh_Content clone() =>
      SpeakguessRefresh_Content()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SpeakguessRefresh_Content copyWith(
          void Function(SpeakguessRefresh_Content) updates) =>
      super.copyWith((message) => updates(message as SpeakguessRefresh_Content))
          as SpeakguessRefresh_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpeakguessRefresh_Content create() => SpeakguessRefresh_Content._();
  SpeakguessRefresh_Content createEmptyInstance() => create();
  static $pb.PbList<SpeakguessRefresh_Content> createRepeated() =>
      $pb.PbList<SpeakguessRefresh_Content>();
  @$core.pragma('dart2js:noInline')
  static SpeakguessRefresh_Content getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeakguessRefresh_Content>(create);
  static SpeakguessRefresh_Content? _defaultInstance;

  @$pb.TagNumber(1)
  SpeakguessRefresh_Current get current => $_getN(0);
  @$pb.TagNumber(1)
  set current(SpeakguessRefresh_Current v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrent() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrent() => clearField(1);
  @$pb.TagNumber(1)
  SpeakguessRefresh_Current ensureCurrent() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get position => $_getIZ(1);
  @$pb.TagNumber(2)
  set position($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get surplusDuration => $_getIZ(2);
  @$pb.TagNumber(3)
  set surplusDuration($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSurplusDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearSurplusDuration() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get timestamp => $_getIZ(3);
  @$pb.TagNumber(4)
  set timestamp($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get totalDuration => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalDuration($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTotalDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalDuration() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get turnStart => $_getIZ(5);
  @$pb.TagNumber(6)
  set turnStart($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTurnStart() => $_has(5);
  @$pb.TagNumber(6)
  void clearTurnStart() => clearField(6);

  @$pb.TagNumber(7)
  SpeakguessRefresh_WordInfo get wordInfo => $_getN(6);
  @$pb.TagNumber(7)
  set wordInfo(SpeakguessRefresh_WordInfo v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasWordInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearWordInfo() => clearField(7);
  @$pb.TagNumber(7)
  SpeakguessRefresh_WordInfo ensureWordInfo() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get changeType => $_getSZ(7);
  @$pb.TagNumber(8)
  set changeType($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasChangeType() => $_has(7);
  @$pb.TagNumber(8)
  void clearChangeType() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get guessSuccess => $_getIZ(8);
  @$pb.TagNumber(9)
  set guessSuccess($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGuessSuccess() => $_has(8);
  @$pb.TagNumber(9)
  void clearGuessSuccess() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<SpeakguessRefresh_Content_RankList> get rankList => $_getList(9);

  @$pb.TagNumber(11)
  $core.String get effect => $_getSZ(10);
  @$pb.TagNumber(11)
  set effect($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasEffect() => $_has(10);
  @$pb.TagNumber(11)
  void clearEffect() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get winner => $_getIZ(11);
  @$pb.TagNumber(12)
  set winner($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasWinner() => $_has(11);
  @$pb.TagNumber(12)
  void clearWinner() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get winnerScore => $_getIZ(12);
  @$pb.TagNumber(13)
  set winnerScore($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasWinnerScore() => $_has(12);
  @$pb.TagNumber(13)
  void clearWinnerScore() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get nextWord => $_getSZ(13);
  @$pb.TagNumber(14)
  set nextWord($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasNextWord() => $_has(13);
  @$pb.TagNumber(14)
  void clearNextWord() => clearField(14);
}

class SpeakguessRefresh_List extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SpeakguessRefresh.List',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'speakguess.refresh'),
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
            : 'is_offline',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SpeakguessRefresh_List._() : super();
  factory SpeakguessRefresh_List({
    $core.String? icon,
    $core.int? isOffline,
    $core.String? name,
    $core.int? position,
    $core.String? role,
    $core.int? score,
    $core.int? uid,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (isOffline != null) {
      _result.isOffline = isOffline;
    }
    if (name != null) {
      _result.name = name;
    }
    if (position != null) {
      _result.position = position;
    }
    if (role != null) {
      _result.role = role;
    }
    if (score != null) {
      _result.score = score;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory SpeakguessRefresh_List.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SpeakguessRefresh_List.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SpeakguessRefresh_List clone() =>
      SpeakguessRefresh_List()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SpeakguessRefresh_List copyWith(
          void Function(SpeakguessRefresh_List) updates) =>
      super.copyWith((message) => updates(message as SpeakguessRefresh_List))
          as SpeakguessRefresh_List; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpeakguessRefresh_List create() => SpeakguessRefresh_List._();
  SpeakguessRefresh_List createEmptyInstance() => create();
  static $pb.PbList<SpeakguessRefresh_List> createRepeated() =>
      $pb.PbList<SpeakguessRefresh_List>();
  @$core.pragma('dart2js:noInline')
  static SpeakguessRefresh_List getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeakguessRefresh_List>(create);
  static SpeakguessRefresh_List? _defaultInstance;

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
  $core.int get isOffline => $_getIZ(1);
  @$pb.TagNumber(2)
  set isOffline($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsOffline() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsOffline() => clearField(2);

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
  $core.int get position => $_getIZ(3);
  @$pb.TagNumber(4)
  set position($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearPosition() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get role => $_getSZ(4);
  @$pb.TagNumber(5)
  set role($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRole() => $_has(4);
  @$pb.TagNumber(5)
  void clearRole() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get score => $_getIZ(5);
  @$pb.TagNumber(6)
  set score($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasScore() => $_has(5);
  @$pb.TagNumber(6)
  void clearScore() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get uid => $_getIZ(6);
  @$pb.TagNumber(7)
  set uid($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUid() => $_has(6);
  @$pb.TagNumber(7)
  void clearUid() => clearField(7);
}

class SpeakguessRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SpeakguessRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'speakguess.refresh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'change_word_price',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'change_word_price_type')
    ..aOM<SpeakguessRefresh_Content>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content',
        subBuilder: SpeakguessRefresh_Content.create)
    ..pc<SpeakguessRefresh_List>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: SpeakguessRefresh_List.create)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..hasRequiredFields = false;

  SpeakguessRefresh._() : super();
  factory SpeakguessRefresh({
    $core.int? changeWordPrice,
    $core.String? changeWordPriceType,
    SpeakguessRefresh_Content? content,
    $core.Iterable<SpeakguessRefresh_List>? list,
    $core.String? state,
  }) {
    final _result = create();
    if (changeWordPrice != null) {
      _result.changeWordPrice = changeWordPrice;
    }
    if (changeWordPriceType != null) {
      _result.changeWordPriceType = changeWordPriceType;
    }
    if (content != null) {
      _result.content = content;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory SpeakguessRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SpeakguessRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SpeakguessRefresh clone() => SpeakguessRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SpeakguessRefresh copyWith(void Function(SpeakguessRefresh) updates) =>
      super.copyWith((message) => updates(message as SpeakguessRefresh))
          as SpeakguessRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpeakguessRefresh create() => SpeakguessRefresh._();
  SpeakguessRefresh createEmptyInstance() => create();
  static $pb.PbList<SpeakguessRefresh> createRepeated() =>
      $pb.PbList<SpeakguessRefresh>();
  @$core.pragma('dart2js:noInline')
  static SpeakguessRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeakguessRefresh>(create);
  static SpeakguessRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get changeWordPrice => $_getIZ(0);
  @$pb.TagNumber(1)
  set changeWordPrice($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasChangeWordPrice() => $_has(0);
  @$pb.TagNumber(1)
  void clearChangeWordPrice() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get changeWordPriceType => $_getSZ(1);
  @$pb.TagNumber(2)
  set changeWordPriceType($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasChangeWordPriceType() => $_has(1);
  @$pb.TagNumber(2)
  void clearChangeWordPriceType() => clearField(2);

  @$pb.TagNumber(3)
  SpeakguessRefresh_Content get content => $_getN(2);
  @$pb.TagNumber(3)
  set content(SpeakguessRefresh_Content v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);
  @$pb.TagNumber(3)
  SpeakguessRefresh_Content ensureContent() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<SpeakguessRefresh_List> get list => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get state => $_getSZ(4);
  @$pb.TagNumber(5)
  set state($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => clearField(5);
}
