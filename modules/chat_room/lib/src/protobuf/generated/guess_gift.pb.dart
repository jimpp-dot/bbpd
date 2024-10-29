///
//  Generated code. Do not modify.
//  source: guess_gift.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ApiGuessGiftPreferencesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiGuessGiftPreferencesResponse',
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
            : 'message')
    ..aOM<GuessGiftPreferences>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GuessGiftPreferences.create)
    ..hasRequiredFields = false;

  ApiGuessGiftPreferencesResponse._() : super();
  factory ApiGuessGiftPreferencesResponse({
    $core.bool? success,
    $core.String? message,
    GuessGiftPreferences? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiGuessGiftPreferencesResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiGuessGiftPreferencesResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiGuessGiftPreferencesResponse clone() =>
      ApiGuessGiftPreferencesResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiGuessGiftPreferencesResponse copyWith(
          void Function(ApiGuessGiftPreferencesResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiGuessGiftPreferencesResponse))
          as ApiGuessGiftPreferencesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiGuessGiftPreferencesResponse create() =>
      ApiGuessGiftPreferencesResponse._();
  ApiGuessGiftPreferencesResponse createEmptyInstance() => create();
  static $pb.PbList<ApiGuessGiftPreferencesResponse> createRepeated() =>
      $pb.PbList<ApiGuessGiftPreferencesResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiGuessGiftPreferencesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiGuessGiftPreferencesResponse>(
          create);
  static ApiGuessGiftPreferencesResponse? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  GuessGiftPreferences get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GuessGiftPreferences v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GuessGiftPreferences ensureData() => $_ensure(2);
}

class GuessGiftPreferences extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessGiftPreferences',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<GuessGiftPreferencesSettings>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'settings',
        subBuilder: GuessGiftPreferencesSettings.create)
    ..aOM<GuessGiftRankItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topOne',
        subBuilder: GuessGiftRankItem.create)
    ..hasRequiredFields = false;

  GuessGiftPreferences._() : super();
  factory GuessGiftPreferences({
    GuessGiftPreferencesSettings? settings,
    GuessGiftRankItem? topOne,
  }) {
    final _result = create();
    if (settings != null) {
      _result.settings = settings;
    }
    if (topOne != null) {
      _result.topOne = topOne;
    }
    return _result;
  }
  factory GuessGiftPreferences.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessGiftPreferences.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessGiftPreferences clone() =>
      GuessGiftPreferences()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessGiftPreferences copyWith(void Function(GuessGiftPreferences) updates) =>
      super.copyWith((message) => updates(message as GuessGiftPreferences))
          as GuessGiftPreferences; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessGiftPreferences create() => GuessGiftPreferences._();
  GuessGiftPreferences createEmptyInstance() => create();
  static $pb.PbList<GuessGiftPreferences> createRepeated() =>
      $pb.PbList<GuessGiftPreferences>();
  @$core.pragma('dart2js:noInline')
  static GuessGiftPreferences getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessGiftPreferences>(create);
  static GuessGiftPreferences? _defaultInstance;

  @$pb.TagNumber(1)
  GuessGiftPreferencesSettings get settings => $_getN(0);
  @$pb.TagNumber(1)
  set settings(GuessGiftPreferencesSettings v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSettings() => $_has(0);
  @$pb.TagNumber(1)
  void clearSettings() => clearField(1);
  @$pb.TagNumber(1)
  GuessGiftPreferencesSettings ensureSettings() => $_ensure(0);

  @$pb.TagNumber(2)
  GuessGiftRankItem get topOne => $_getN(1);
  @$pb.TagNumber(2)
  set topOne(GuessGiftRankItem v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTopOne() => $_has(1);
  @$pb.TagNumber(2)
  void clearTopOne() => clearField(2);
  @$pb.TagNumber(2)
  GuessGiftRankItem ensureTopOne() => $_ensure(1);
}

class GuessGiftPreferencesSettings extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessGiftPreferencesSettings',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<GuessGiftPreferencesConfig>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'config',
        subBuilder: GuessGiftPreferencesConfig.create)
    ..pc<GuessGiftBoxGiftItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gifts',
        $pb.PbFieldType.PM,
        subBuilder: GuessGiftBoxGiftItem.create)
    ..hasRequiredFields = false;

  GuessGiftPreferencesSettings._() : super();
  factory GuessGiftPreferencesSettings({
    GuessGiftPreferencesConfig? config,
    $core.Iterable<GuessGiftBoxGiftItem>? gifts,
  }) {
    final _result = create();
    if (config != null) {
      _result.config = config;
    }
    if (gifts != null) {
      _result.gifts.addAll(gifts);
    }
    return _result;
  }
  factory GuessGiftPreferencesSettings.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessGiftPreferencesSettings.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessGiftPreferencesSettings clone() =>
      GuessGiftPreferencesSettings()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessGiftPreferencesSettings copyWith(
          void Function(GuessGiftPreferencesSettings) updates) =>
      super.copyWith(
              (message) => updates(message as GuessGiftPreferencesSettings))
          as GuessGiftPreferencesSettings; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessGiftPreferencesSettings create() =>
      GuessGiftPreferencesSettings._();
  GuessGiftPreferencesSettings createEmptyInstance() => create();
  static $pb.PbList<GuessGiftPreferencesSettings> createRepeated() =>
      $pb.PbList<GuessGiftPreferencesSettings>();
  @$core.pragma('dart2js:noInline')
  static GuessGiftPreferencesSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessGiftPreferencesSettings>(create);
  static GuessGiftPreferencesSettings? _defaultInstance;

  @$pb.TagNumber(1)
  GuessGiftPreferencesConfig get config => $_getN(0);
  @$pb.TagNumber(1)
  set config(GuessGiftPreferencesConfig v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConfig() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfig() => clearField(1);
  @$pb.TagNumber(1)
  GuessGiftPreferencesConfig ensureConfig() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<GuessGiftBoxGiftItem> get gifts => $_getList(1);
}

class ApiGuessGiftRankResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiGuessGiftRankResponse',
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
            : 'message')
    ..aOM<GuessGiftRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GuessGiftRankData.create)
    ..hasRequiredFields = false;

  ApiGuessGiftRankResponse._() : super();
  factory ApiGuessGiftRankResponse({
    $core.bool? success,
    $core.String? message,
    GuessGiftRankData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiGuessGiftRankResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiGuessGiftRankResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiGuessGiftRankResponse clone() =>
      ApiGuessGiftRankResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiGuessGiftRankResponse copyWith(
          void Function(ApiGuessGiftRankResponse) updates) =>
      super.copyWith((message) => updates(message as ApiGuessGiftRankResponse))
          as ApiGuessGiftRankResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiGuessGiftRankResponse create() => ApiGuessGiftRankResponse._();
  ApiGuessGiftRankResponse createEmptyInstance() => create();
  static $pb.PbList<ApiGuessGiftRankResponse> createRepeated() =>
      $pb.PbList<ApiGuessGiftRankResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiGuessGiftRankResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiGuessGiftRankResponse>(create);
  static ApiGuessGiftRankResponse? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  GuessGiftRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GuessGiftRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GuessGiftRankData ensureData() => $_ensure(2);
}

class GuessGiftRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessGiftRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more',
        $pb.PbFieldType.OU3)
    ..pc<GuessGiftRankItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: GuessGiftRankItem.create)
    ..aOM<GuessGiftRankItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'my',
        subBuilder: GuessGiftRankItem.create)
    ..hasRequiredFields = false;

  GuessGiftRankData._() : super();
  factory GuessGiftRankData({
    $core.int? more,
    $core.Iterable<GuessGiftRankItem>? list,
    GuessGiftRankItem? my,
  }) {
    final _result = create();
    if (more != null) {
      _result.more = more;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (my != null) {
      _result.my = my;
    }
    return _result;
  }
  factory GuessGiftRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessGiftRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessGiftRankData clone() => GuessGiftRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessGiftRankData copyWith(void Function(GuessGiftRankData) updates) =>
      super.copyWith((message) => updates(message as GuessGiftRankData))
          as GuessGiftRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessGiftRankData create() => GuessGiftRankData._();
  GuessGiftRankData createEmptyInstance() => create();
  static $pb.PbList<GuessGiftRankData> createRepeated() =>
      $pb.PbList<GuessGiftRankData>();
  @$core.pragma('dart2js:noInline')
  static GuessGiftRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessGiftRankData>(create);
  static GuessGiftRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get more => $_getIZ(0);
  @$pb.TagNumber(1)
  set more($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMore() => $_has(0);
  @$pb.TagNumber(1)
  void clearMore() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<GuessGiftRankItem> get list => $_getList(1);

  @$pb.TagNumber(3)
  GuessGiftRankItem get my => $_getN(2);
  @$pb.TagNumber(3)
  set my(GuessGiftRankItem v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMy() => $_has(2);
  @$pb.TagNumber(3)
  void clearMy() => clearField(3);
  @$pb.TagNumber(3)
  GuessGiftRankItem ensureMy() => $_ensure(2);
}

class GuessGiftRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessGiftRankItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.O3)
    ..aOM<GuessGiftUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user1',
        subBuilder: GuessGiftUser.create)
    ..aOM<GuessGiftUser>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user2',
        subBuilder: GuessGiftUser.create)
    ..a<$fixnum.Int64>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  GuessGiftRankItem._() : super();
  factory GuessGiftRankItem({
    $core.int? rank,
    GuessGiftUser? user1,
    GuessGiftUser? user2,
    $fixnum.Int64? score,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank = rank;
    }
    if (user1 != null) {
      _result.user1 = user1;
    }
    if (user2 != null) {
      _result.user2 = user2;
    }
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory GuessGiftRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessGiftRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessGiftRankItem clone() => GuessGiftRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessGiftRankItem copyWith(void Function(GuessGiftRankItem) updates) =>
      super.copyWith((message) => updates(message as GuessGiftRankItem))
          as GuessGiftRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessGiftRankItem create() => GuessGiftRankItem._();
  GuessGiftRankItem createEmptyInstance() => create();
  static $pb.PbList<GuessGiftRankItem> createRepeated() =>
      $pb.PbList<GuessGiftRankItem>();
  @$core.pragma('dart2js:noInline')
  static GuessGiftRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessGiftRankItem>(create);
  static GuessGiftRankItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rank => $_getIZ(0);
  @$pb.TagNumber(1)
  set rank($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearRank() => clearField(1);

  @$pb.TagNumber(2)
  GuessGiftUser get user1 => $_getN(1);
  @$pb.TagNumber(2)
  set user1(GuessGiftUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUser1() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser1() => clearField(2);
  @$pb.TagNumber(2)
  GuessGiftUser ensureUser1() => $_ensure(1);

  @$pb.TagNumber(3)
  GuessGiftUser get user2 => $_getN(2);
  @$pb.TagNumber(3)
  set user2(GuessGiftUser v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUser2() => $_has(2);
  @$pb.TagNumber(3)
  void clearUser2() => clearField(3);
  @$pb.TagNumber(3)
  GuessGiftUser ensureUser2() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get score => $_getI64(3);
  @$pb.TagNumber(4)
  set score($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);
}

class GuessGiftUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessGiftUser',
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GuessGiftUser._() : super();
  factory GuessGiftUser({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
    $core.int? sex,
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
    if (sex != null) {
      _result.sex = sex;
    }
    return _result;
  }
  factory GuessGiftUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessGiftUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessGiftUser clone() => GuessGiftUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessGiftUser copyWith(void Function(GuessGiftUser) updates) =>
      super.copyWith((message) => updates(message as GuessGiftUser))
          as GuessGiftUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessGiftUser create() => GuessGiftUser._();
  GuessGiftUser createEmptyInstance() => create();
  static $pb.PbList<GuessGiftUser> createRepeated() =>
      $pb.PbList<GuessGiftUser>();
  @$core.pragma('dart2js:noInline')
  static GuessGiftUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessGiftUser>(create);
  static GuessGiftUser? _defaultInstance;

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
  $core.int get sex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);
}

class GuessGiftPreferencesMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessGiftPreferencesMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guessId',
        $pb.PbFieldType.OU3)
    ..aOM<GuessGiftUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sender',
        subBuilder: GuessGiftUser.create)
    ..aOM<GuessGiftUser>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receiver',
        subBuilder: GuessGiftUser.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..pc<GuessGiftBox>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boxes',
        $pb.PbFieldType.PM,
        subBuilder: GuessGiftBox.create)
    ..hasRequiredFields = false;

  GuessGiftPreferencesMessage._() : super();
  factory GuessGiftPreferencesMessage({
    $core.int? guessId,
    GuessGiftUser? sender,
    GuessGiftUser? receiver,
    $core.int? duration,
    $core.Iterable<GuessGiftBox>? boxes,
  }) {
    final _result = create();
    if (guessId != null) {
      _result.guessId = guessId;
    }
    if (sender != null) {
      _result.sender = sender;
    }
    if (receiver != null) {
      _result.receiver = receiver;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (boxes != null) {
      _result.boxes.addAll(boxes);
    }
    return _result;
  }
  factory GuessGiftPreferencesMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessGiftPreferencesMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessGiftPreferencesMessage clone() =>
      GuessGiftPreferencesMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessGiftPreferencesMessage copyWith(
          void Function(GuessGiftPreferencesMessage) updates) =>
      super.copyWith(
              (message) => updates(message as GuessGiftPreferencesMessage))
          as GuessGiftPreferencesMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessGiftPreferencesMessage create() =>
      GuessGiftPreferencesMessage._();
  GuessGiftPreferencesMessage createEmptyInstance() => create();
  static $pb.PbList<GuessGiftPreferencesMessage> createRepeated() =>
      $pb.PbList<GuessGiftPreferencesMessage>();
  @$core.pragma('dart2js:noInline')
  static GuessGiftPreferencesMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessGiftPreferencesMessage>(create);
  static GuessGiftPreferencesMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get guessId => $_getIZ(0);
  @$pb.TagNumber(1)
  set guessId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGuessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuessId() => clearField(1);

  @$pb.TagNumber(2)
  GuessGiftUser get sender => $_getN(1);
  @$pb.TagNumber(2)
  set sender(GuessGiftUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSender() => $_has(1);
  @$pb.TagNumber(2)
  void clearSender() => clearField(2);
  @$pb.TagNumber(2)
  GuessGiftUser ensureSender() => $_ensure(1);

  @$pb.TagNumber(3)
  GuessGiftUser get receiver => $_getN(2);
  @$pb.TagNumber(3)
  set receiver(GuessGiftUser v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasReceiver() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiver() => clearField(3);
  @$pb.TagNumber(3)
  GuessGiftUser ensureReceiver() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get duration => $_getIZ(3);
  @$pb.TagNumber(4)
  set duration($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<GuessGiftBox> get boxes => $_getList(4);
}

class GuessGiftBox extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessGiftBox',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boxId',
        $pb.PbFieldType.OU3)
    ..pc<GuessGiftBoxGiftItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: GuessGiftBoxGiftItem.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxBox',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boxTacit',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GuessGiftBox._() : super();
  factory GuessGiftBox({
    $core.int? boxId,
    $core.Iterable<GuessGiftBoxGiftItem>? list,
    $core.int? maxBox,
    $core.int? boxTacit,
  }) {
    final _result = create();
    if (boxId != null) {
      _result.boxId = boxId;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (maxBox != null) {
      _result.maxBox = maxBox;
    }
    if (boxTacit != null) {
      _result.boxTacit = boxTacit;
    }
    return _result;
  }
  factory GuessGiftBox.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessGiftBox.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessGiftBox clone() => GuessGiftBox()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessGiftBox copyWith(void Function(GuessGiftBox) updates) =>
      super.copyWith((message) => updates(message as GuessGiftBox))
          as GuessGiftBox; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessGiftBox create() => GuessGiftBox._();
  GuessGiftBox createEmptyInstance() => create();
  static $pb.PbList<GuessGiftBox> createRepeated() =>
      $pb.PbList<GuessGiftBox>();
  @$core.pragma('dart2js:noInline')
  static GuessGiftBox getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessGiftBox>(create);
  static GuessGiftBox? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get boxId => $_getIZ(0);
  @$pb.TagNumber(1)
  set boxId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBoxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoxId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<GuessGiftBoxGiftItem> get list => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get maxBox => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxBox($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMaxBox() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxBox() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get boxTacit => $_getIZ(3);
  @$pb.TagNumber(4)
  set boxTacit($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBoxTacit() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoxTacit() => clearField(4);
}

class GuessGiftBoxGiftItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessGiftBoxGiftItem',
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
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numInBag',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GuessGiftBoxGiftItem._() : super();
  factory GuessGiftBoxGiftItem({
    $core.int? giftId,
    $core.int? giftNum,
    $core.int? price,
    $core.String? name,
    $core.String? url,
    $core.int? cid,
    $core.int? numInBag,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftNum != null) {
      _result.giftNum = giftNum;
    }
    if (price != null) {
      _result.price = price;
    }
    if (name != null) {
      _result.name = name;
    }
    if (url != null) {
      _result.url = url;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (numInBag != null) {
      _result.numInBag = numInBag;
    }
    return _result;
  }
  factory GuessGiftBoxGiftItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessGiftBoxGiftItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessGiftBoxGiftItem clone() =>
      GuessGiftBoxGiftItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessGiftBoxGiftItem copyWith(void Function(GuessGiftBoxGiftItem) updates) =>
      super.copyWith((message) => updates(message as GuessGiftBoxGiftItem))
          as GuessGiftBoxGiftItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessGiftBoxGiftItem create() => GuessGiftBoxGiftItem._();
  GuessGiftBoxGiftItem createEmptyInstance() => create();
  static $pb.PbList<GuessGiftBoxGiftItem> createRepeated() =>
      $pb.PbList<GuessGiftBoxGiftItem>();
  @$core.pragma('dart2js:noInline')
  static GuessGiftBoxGiftItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessGiftBoxGiftItem>(create);
  static GuessGiftBoxGiftItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get giftNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set giftNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get price => $_getIZ(2);
  @$pb.TagNumber(3)
  set price($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get url => $_getSZ(4);
  @$pb.TagNumber(5)
  set url($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get cid => $_getIZ(5);
  @$pb.TagNumber(6)
  set cid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCid() => $_has(5);
  @$pb.TagNumber(6)
  void clearCid() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get numInBag => $_getIZ(6);
  @$pb.TagNumber(7)
  set numInBag($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasNumInBag() => $_has(6);
  @$pb.TagNumber(7)
  void clearNumInBag() => clearField(7);
}

class GuessGiftPreferencesConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessGiftPreferencesConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numBox',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxGiftCategories',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxGiftNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GuessGiftPreferencesConfig._() : super();
  factory GuessGiftPreferencesConfig({
    $core.int? numBox,
    $core.int? maxGiftCategories,
    $core.int? maxGiftNum,
  }) {
    final _result = create();
    if (numBox != null) {
      _result.numBox = numBox;
    }
    if (maxGiftCategories != null) {
      _result.maxGiftCategories = maxGiftCategories;
    }
    if (maxGiftNum != null) {
      _result.maxGiftNum = maxGiftNum;
    }
    return _result;
  }
  factory GuessGiftPreferencesConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessGiftPreferencesConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessGiftPreferencesConfig clone() =>
      GuessGiftPreferencesConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessGiftPreferencesConfig copyWith(
          void Function(GuessGiftPreferencesConfig) updates) =>
      super.copyWith(
              (message) => updates(message as GuessGiftPreferencesConfig))
          as GuessGiftPreferencesConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessGiftPreferencesConfig create() => GuessGiftPreferencesConfig._();
  GuessGiftPreferencesConfig createEmptyInstance() => create();
  static $pb.PbList<GuessGiftPreferencesConfig> createRepeated() =>
      $pb.PbList<GuessGiftPreferencesConfig>();
  @$core.pragma('dart2js:noInline')
  static GuessGiftPreferencesConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessGiftPreferencesConfig>(create);
  static GuessGiftPreferencesConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get numBox => $_getIZ(0);
  @$pb.TagNumber(1)
  set numBox($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNumBox() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumBox() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get maxGiftCategories => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxGiftCategories($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMaxGiftCategories() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxGiftCategories() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get maxGiftNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxGiftNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMaxGiftNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxGiftNum() => clearField(3);
}

class GuessGiftFlyRole extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessGiftFlyRole',
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

  GuessGiftFlyRole._() : super();
  factory GuessGiftFlyRole({
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
  factory GuessGiftFlyRole.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessGiftFlyRole.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessGiftFlyRole clone() => GuessGiftFlyRole()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessGiftFlyRole copyWith(void Function(GuessGiftFlyRole) updates) =>
      super.copyWith((message) => updates(message as GuessGiftFlyRole))
          as GuessGiftFlyRole; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessGiftFlyRole create() => GuessGiftFlyRole._();
  GuessGiftFlyRole createEmptyInstance() => create();
  static $pb.PbList<GuessGiftFlyRole> createRepeated() =>
      $pb.PbList<GuessGiftFlyRole>();
  @$core.pragma('dart2js:noInline')
  static GuessGiftFlyRole getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessGiftFlyRole>(create);
  static GuessGiftFlyRole? _defaultInstance;

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

class GuessGiftFlyMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessGiftFlyMessage',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOM<GuessGiftFlyRole>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role1',
        subBuilder: GuessGiftFlyRole.create)
    ..aOM<GuessGiftFlyRole>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role2',
        subBuilder: GuessGiftFlyRole.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tacit',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GuessGiftFlyMessage._() : super();
  factory GuessGiftFlyMessage({
    $core.String? type,
    $core.int? rid,
    GuessGiftFlyRole? role1,
    GuessGiftFlyRole? role2,
    $core.int? tacit,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (role1 != null) {
      _result.role1 = role1;
    }
    if (role2 != null) {
      _result.role2 = role2;
    }
    if (tacit != null) {
      _result.tacit = tacit;
    }
    return _result;
  }
  factory GuessGiftFlyMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessGiftFlyMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessGiftFlyMessage clone() => GuessGiftFlyMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessGiftFlyMessage copyWith(void Function(GuessGiftFlyMessage) updates) =>
      super.copyWith((message) => updates(message as GuessGiftFlyMessage))
          as GuessGiftFlyMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessGiftFlyMessage create() => GuessGiftFlyMessage._();
  GuessGiftFlyMessage createEmptyInstance() => create();
  static $pb.PbList<GuessGiftFlyMessage> createRepeated() =>
      $pb.PbList<GuessGiftFlyMessage>();
  @$core.pragma('dart2js:noInline')
  static GuessGiftFlyMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessGiftFlyMessage>(create);
  static GuessGiftFlyMessage? _defaultInstance;

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
  $core.int get rid => $_getIZ(1);
  @$pb.TagNumber(2)
  set rid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => clearField(2);

  @$pb.TagNumber(3)
  GuessGiftFlyRole get role1 => $_getN(2);
  @$pb.TagNumber(3)
  set role1(GuessGiftFlyRole v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRole1() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole1() => clearField(3);
  @$pb.TagNumber(3)
  GuessGiftFlyRole ensureRole1() => $_ensure(2);

  @$pb.TagNumber(4)
  GuessGiftFlyRole get role2 => $_getN(3);
  @$pb.TagNumber(4)
  set role2(GuessGiftFlyRole v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRole2() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole2() => clearField(4);
  @$pb.TagNumber(4)
  GuessGiftFlyRole ensureRole2() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get tacit => $_getIZ(4);
  @$pb.TagNumber(5)
  set tacit($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTacit() => $_has(4);
  @$pb.TagNumber(5)
  void clearTacit() => clearField(5);
}
