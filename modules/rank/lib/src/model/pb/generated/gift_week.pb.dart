///
//  Generated code. Do not modify.
//  source: gift_week.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GiftRankConfigRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftRankConfigRes',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOM<GiftRankConfig>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftRankConfig.create)
    ..hasRequiredFields = false;

  GiftRankConfigRes._() : super();
  factory GiftRankConfigRes({
    $core.String? msg,
    $core.bool? success,
    GiftRankConfig? data,
  }) {
    final _result = create();
    if (msg != null) {
      _result.msg = msg;
    }
    if (success != null) {
      _result.success = success;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory GiftRankConfigRes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftRankConfigRes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftRankConfigRes clone() => GiftRankConfigRes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftRankConfigRes copyWith(void Function(GiftRankConfigRes) updates) =>
      super.copyWith((message) => updates(message as GiftRankConfigRes))
          as GiftRankConfigRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftRankConfigRes create() => GiftRankConfigRes._();
  GiftRankConfigRes createEmptyInstance() => create();
  static $pb.PbList<GiftRankConfigRes> createRepeated() =>
      $pb.PbList<GiftRankConfigRes>();
  @$core.pragma('dart2js:noInline')
  static GiftRankConfigRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftRankConfigRes>(create);
  static GiftRankConfigRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msg => $_getSZ(0);
  @$pb.TagNumber(1)
  set msg($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);

  @$pb.TagNumber(4)
  GiftRankConfig get data => $_getN(2);
  @$pb.TagNumber(4)
  set data(GiftRankConfig v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);
  @$pb.TagNumber(4)
  GiftRankConfig ensureData() => $_ensure(2);
}

class GiftRankConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftRankConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ruleUrl')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background')
    ..pc<GiftObj>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'thisWeekGifts',
        $pb.PbFieldType.PM,
        subBuilder: GiftObj.create)
    ..pc<GiftObj>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastWeekGifts',
        $pb.PbFieldType.PM,
        subBuilder: GiftObj.create)
    ..pc<WeekStar>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekStar',
        $pb.PbFieldType.PM,
        subBuilder: WeekStar.create)
    ..pc<RankTab>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankTab',
        $pb.PbFieldType.PM,
        subBuilder: RankTab.create)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'backgroundBottom')
    ..hasRequiredFields = false;

  GiftRankConfig._() : super();
  factory GiftRankConfig({
    $core.String? ruleUrl,
    $core.String? background,
    $core.Iterable<GiftObj>? thisWeekGifts,
    $core.Iterable<GiftObj>? lastWeekGifts,
    $core.Iterable<WeekStar>? weekStar,
    $core.Iterable<RankTab>? rankTab,
    $core.String? backgroundBottom,
  }) {
    final _result = create();
    if (ruleUrl != null) {
      _result.ruleUrl = ruleUrl;
    }
    if (background != null) {
      _result.background = background;
    }
    if (thisWeekGifts != null) {
      _result.thisWeekGifts.addAll(thisWeekGifts);
    }
    if (lastWeekGifts != null) {
      _result.lastWeekGifts.addAll(lastWeekGifts);
    }
    if (weekStar != null) {
      _result.weekStar.addAll(weekStar);
    }
    if (rankTab != null) {
      _result.rankTab.addAll(rankTab);
    }
    if (backgroundBottom != null) {
      _result.backgroundBottom = backgroundBottom;
    }
    return _result;
  }
  factory GiftRankConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftRankConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftRankConfig clone() => GiftRankConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftRankConfig copyWith(void Function(GiftRankConfig) updates) =>
      super.copyWith((message) => updates(message as GiftRankConfig))
          as GiftRankConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftRankConfig create() => GiftRankConfig._();
  GiftRankConfig createEmptyInstance() => create();
  static $pb.PbList<GiftRankConfig> createRepeated() =>
      $pb.PbList<GiftRankConfig>();
  @$core.pragma('dart2js:noInline')
  static GiftRankConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftRankConfig>(create);
  static GiftRankConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ruleUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set ruleUrl($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRuleUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearRuleUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get background => $_getSZ(1);
  @$pb.TagNumber(2)
  set background($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBackground() => $_has(1);
  @$pb.TagNumber(2)
  void clearBackground() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<GiftObj> get thisWeekGifts => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<GiftObj> get lastWeekGifts => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<WeekStar> get weekStar => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<RankTab> get rankTab => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get backgroundBottom => $_getSZ(6);
  @$pb.TagNumber(7)
  set backgroundBottom($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBackgroundBottom() => $_has(6);
  @$pb.TagNumber(7)
  void clearBackgroundBottom() => clearField(7);
}

class RankTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RankTab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabName')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankType',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RankTab._() : super();
  factory RankTab({
    $core.String? tabName,
    $core.int? rankType,
  }) {
    final _result = create();
    if (tabName != null) {
      _result.tabName = tabName;
    }
    if (rankType != null) {
      _result.rankType = rankType;
    }
    return _result;
  }
  factory RankTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RankTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RankTab clone() => RankTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RankTab copyWith(void Function(RankTab) updates) =>
      super.copyWith((message) => updates(message as RankTab))
          as RankTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RankTab create() => RankTab._();
  RankTab createEmptyInstance() => create();
  static $pb.PbList<RankTab> createRepeated() => $pb.PbList<RankTab>();
  @$core.pragma('dart2js:noInline')
  static RankTab getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RankTab>(create);
  static RankTab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tabName => $_getSZ(0);
  @$pb.TagNumber(1)
  set tabName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTabName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTabName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rankType => $_getIZ(1);
  @$pb.TagNumber(2)
  set rankType($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRankType() => $_has(1);
  @$pb.TagNumber(2)
  void clearRankType() => clearField(2);
}

class GiftObj extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftObj',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftIcon')
    ..hasRequiredFields = false;

  GiftObj._() : super();
  factory GiftObj({
    $core.int? giftId,
    $core.String? giftName,
    $core.String? giftIcon,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (giftIcon != null) {
      _result.giftIcon = giftIcon;
    }
    return _result;
  }
  factory GiftObj.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftObj.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftObj clone() => GiftObj()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftObj copyWith(void Function(GiftObj) updates) =>
      super.copyWith((message) => updates(message as GiftObj))
          as GiftObj; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftObj create() => GiftObj._();
  GiftObj createEmptyInstance() => create();
  static $pb.PbList<GiftObj> createRepeated() => $pb.PbList<GiftObj>();
  @$core.pragma('dart2js:noInline')
  static GiftObj getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GiftObj>(create);
  static GiftObj? _defaultInstance;

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
  $core.String get giftIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set giftIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftIcon() => clearField(3);
}

class WeekStar extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WeekStar',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftIcon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userName')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  WeekStar._() : super();
  factory WeekStar({
    $core.int? giftId,
    $core.String? giftName,
    $core.String? giftIcon,
    $core.int? uid,
    $core.String? userIcon,
    $core.String? userName,
    $core.int? giftNum,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (giftIcon != null) {
      _result.giftIcon = giftIcon;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (giftNum != null) {
      _result.giftNum = giftNum;
    }
    return _result;
  }
  factory WeekStar.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WeekStar.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WeekStar clone() => WeekStar()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WeekStar copyWith(void Function(WeekStar) updates) =>
      super.copyWith((message) => updates(message as WeekStar))
          as WeekStar; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WeekStar create() => WeekStar._();
  WeekStar createEmptyInstance() => create();
  static $pb.PbList<WeekStar> createRepeated() => $pb.PbList<WeekStar>();
  @$core.pragma('dart2js:noInline')
  static WeekStar getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WeekStar>(create);
  static WeekStar? _defaultInstance;

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
  $core.String get giftIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set giftIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get uid => $_getIZ(3);
  @$pb.TagNumber(4)
  set uid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set userIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUserIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get userName => $_getSZ(5);
  @$pb.TagNumber(6)
  set userName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUserName() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserName() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get giftNum => $_getIZ(6);
  @$pb.TagNumber(7)
  set giftNum($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGiftNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearGiftNum() => clearField(7);
}

class GiftRankListRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftRankListRes',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
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
    ..aOM<GiftRankList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftRankList.create)
    ..hasRequiredFields = false;

  GiftRankListRes._() : super();
  factory GiftRankListRes({
    $core.bool? success,
    $core.String? msg,
    GiftRankList? data,
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
  factory GiftRankListRes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftRankListRes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftRankListRes clone() => GiftRankListRes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftRankListRes copyWith(void Function(GiftRankListRes) updates) =>
      super.copyWith((message) => updates(message as GiftRankListRes))
          as GiftRankListRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftRankListRes create() => GiftRankListRes._();
  GiftRankListRes createEmptyInstance() => create();
  static $pb.PbList<GiftRankListRes> createRepeated() =>
      $pb.PbList<GiftRankListRes>();
  @$core.pragma('dart2js:noInline')
  static GiftRankListRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftRankListRes>(create);
  static GiftRankListRes? _defaultInstance;

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
  GiftRankList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftRankList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftRankList ensureData() => $_ensure(2);
}

class MyRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MyRank',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
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
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  MyRank._() : super();
  factory MyRank({
    $core.int? giftNum,
    $core.int? rank,
    $core.String? name,
    $core.int? uid,
    $core.String? icon,
  }) {
    final _result = create();
    if (giftNum != null) {
      _result.giftNum = giftNum;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (name != null) {
      _result.name = name;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory MyRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MyRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MyRank clone() => MyRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MyRank copyWith(void Function(MyRank) updates) =>
      super.copyWith((message) => updates(message as MyRank))
          as MyRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MyRank create() => MyRank._();
  MyRank createEmptyInstance() => create();
  static $pb.PbList<MyRank> createRepeated() => $pb.PbList<MyRank>();
  @$core.pragma('dart2js:noInline')
  static MyRank getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MyRank>(create);
  static MyRank? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rank => $_getIZ(1);
  @$pb.TagNumber(2)
  set rank($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearRank() => clearField(2);

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
  $core.int get uid => $_getIZ(3);
  @$pb.TagNumber(4)
  set uid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);
}

class RankList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RankList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RankList._() : super();
  factory RankList({
    $core.String? icon,
    $core.String? name,
    $core.int? uid,
    $core.int? giftNum,
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
    if (giftNum != null) {
      _result.giftNum = giftNum;
    }
    return _result;
  }
  factory RankList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RankList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RankList clone() => RankList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RankList copyWith(void Function(RankList) updates) =>
      super.copyWith((message) => updates(message as RankList))
          as RankList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RankList create() => RankList._();
  RankList createEmptyInstance() => create();
  static $pb.PbList<RankList> createRepeated() => $pb.PbList<RankList>();
  @$core.pragma('dart2js:noInline')
  static RankList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RankList>(create);
  static RankList? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.int get giftNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set giftNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftNum() => clearField(4);
}

class GiftRankList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftRankList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..aOM<MyRank>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'myRank',
        subBuilder: MyRank.create)
    ..pc<RankList>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankList',
        $pb.PbFieldType.PM,
        subBuilder: RankList.create)
    ..hasRequiredFields = false;

  GiftRankList._() : super();
  factory GiftRankList({
    MyRank? myRank,
    $core.Iterable<RankList>? rankList,
  }) {
    final _result = create();
    if (myRank != null) {
      _result.myRank = myRank;
    }
    if (rankList != null) {
      _result.rankList.addAll(rankList);
    }
    return _result;
  }
  factory GiftRankList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftRankList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftRankList clone() => GiftRankList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftRankList copyWith(void Function(GiftRankList) updates) =>
      super.copyWith((message) => updates(message as GiftRankList))
          as GiftRankList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftRankList create() => GiftRankList._();
  GiftRankList createEmptyInstance() => create();
  static $pb.PbList<GiftRankList> createRepeated() =>
      $pb.PbList<GiftRankList>();
  @$core.pragma('dart2js:noInline')
  static GiftRankList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftRankList>(create);
  static GiftRankList? _defaultInstance;

  @$pb.TagNumber(1)
  MyRank get myRank => $_getN(0);
  @$pb.TagNumber(1)
  set myRank(MyRank v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMyRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearMyRank() => clearField(1);
  @$pb.TagNumber(1)
  MyRank ensureMyRank() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<RankList> get rankList => $_getList(1);
}
