///
//  Generated code. Do not modify.
//  source: slp_anchor.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResAnchorCenter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAnchorCenter',
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
    ..aOM<AnchorCenter>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AnchorCenter.create)
    ..hasRequiredFields = false;

  ResAnchorCenter._() : super();
  factory ResAnchorCenter({
    $core.bool? success,
    $core.String? msg,
    AnchorCenter? data,
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
  factory ResAnchorCenter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAnchorCenter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAnchorCenter clone() => ResAnchorCenter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAnchorCenter copyWith(void Function(ResAnchorCenter) updates) =>
      super.copyWith((message) => updates(message as ResAnchorCenter))
          as ResAnchorCenter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAnchorCenter create() => ResAnchorCenter._();
  ResAnchorCenter createEmptyInstance() => create();
  static $pb.PbList<ResAnchorCenter> createRepeated() =>
      $pb.PbList<ResAnchorCenter>();
  @$core.pragma('dart2js:noInline')
  static ResAnchorCenter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAnchorCenter>(create);
  static ResAnchorCenter? _defaultInstance;

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
  AnchorCenter get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AnchorCenter v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AnchorCenter ensureData() => $_ensure(2);
}

class AnchorInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnchorInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'timeDesc')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'behaviorCredit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'resultCredit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'income',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextLevelIncome',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'text')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardDesc')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardPct',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardBPct',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardRPct',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardCPct',
        $pb.PbFieldType.OU3)
    ..aOB(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showPct')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveDurationCredit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardLdPct',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekFlowCredit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardWfPct',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AnchorInfo._() : super();
  factory AnchorInfo({
    $core.String? timeDesc,
    $core.int? behaviorCredit,
    $core.int? resultCredit,
    $core.int? income,
    $core.int? nextLevelIncome,
    $core.String? level,
    $core.String? text,
    $core.String? awardDesc,
    $core.int? awardPct,
    $core.int? awardBPct,
    $core.int? awardRPct,
    $core.int? awardCPct,
    $core.bool? showPct,
    $core.int? liveDurationCredit,
    $core.int? awardLdPct,
    $core.int? weekFlowCredit,
    $core.int? awardWfPct,
  }) {
    final _result = create();
    if (timeDesc != null) {
      _result.timeDesc = timeDesc;
    }
    if (behaviorCredit != null) {
      _result.behaviorCredit = behaviorCredit;
    }
    if (resultCredit != null) {
      _result.resultCredit = resultCredit;
    }
    if (income != null) {
      _result.income = income;
    }
    if (nextLevelIncome != null) {
      _result.nextLevelIncome = nextLevelIncome;
    }
    if (level != null) {
      _result.level = level;
    }
    if (text != null) {
      _result.text = text;
    }
    if (awardDesc != null) {
      _result.awardDesc = awardDesc;
    }
    if (awardPct != null) {
      _result.awardPct = awardPct;
    }
    if (awardBPct != null) {
      _result.awardBPct = awardBPct;
    }
    if (awardRPct != null) {
      _result.awardRPct = awardRPct;
    }
    if (awardCPct != null) {
      _result.awardCPct = awardCPct;
    }
    if (showPct != null) {
      _result.showPct = showPct;
    }
    if (liveDurationCredit != null) {
      _result.liveDurationCredit = liveDurationCredit;
    }
    if (awardLdPct != null) {
      _result.awardLdPct = awardLdPct;
    }
    if (weekFlowCredit != null) {
      _result.weekFlowCredit = weekFlowCredit;
    }
    if (awardWfPct != null) {
      _result.awardWfPct = awardWfPct;
    }
    return _result;
  }
  factory AnchorInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnchorInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnchorInfo clone() => AnchorInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnchorInfo copyWith(void Function(AnchorInfo) updates) =>
      super.copyWith((message) => updates(message as AnchorInfo))
          as AnchorInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnchorInfo create() => AnchorInfo._();
  AnchorInfo createEmptyInstance() => create();
  static $pb.PbList<AnchorInfo> createRepeated() => $pb.PbList<AnchorInfo>();
  @$core.pragma('dart2js:noInline')
  static AnchorInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnchorInfo>(create);
  static AnchorInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get timeDesc => $_getSZ(0);
  @$pb.TagNumber(1)
  set timeDesc($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTimeDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimeDesc() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get behaviorCredit => $_getIZ(1);
  @$pb.TagNumber(2)
  set behaviorCredit($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBehaviorCredit() => $_has(1);
  @$pb.TagNumber(2)
  void clearBehaviorCredit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get resultCredit => $_getIZ(2);
  @$pb.TagNumber(3)
  set resultCredit($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasResultCredit() => $_has(2);
  @$pb.TagNumber(3)
  void clearResultCredit() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get income => $_getIZ(3);
  @$pb.TagNumber(4)
  set income($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIncome() => $_has(3);
  @$pb.TagNumber(4)
  void clearIncome() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get nextLevelIncome => $_getIZ(4);
  @$pb.TagNumber(5)
  set nextLevelIncome($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNextLevelIncome() => $_has(4);
  @$pb.TagNumber(5)
  void clearNextLevelIncome() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get level => $_getSZ(5);
  @$pb.TagNumber(6)
  set level($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearLevel() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get text => $_getSZ(6);
  @$pb.TagNumber(7)
  set text($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasText() => $_has(6);
  @$pb.TagNumber(7)
  void clearText() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get awardDesc => $_getSZ(7);
  @$pb.TagNumber(8)
  set awardDesc($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAwardDesc() => $_has(7);
  @$pb.TagNumber(8)
  void clearAwardDesc() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get awardPct => $_getIZ(8);
  @$pb.TagNumber(9)
  set awardPct($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAwardPct() => $_has(8);
  @$pb.TagNumber(9)
  void clearAwardPct() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get awardBPct => $_getIZ(9);
  @$pb.TagNumber(10)
  set awardBPct($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasAwardBPct() => $_has(9);
  @$pb.TagNumber(10)
  void clearAwardBPct() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get awardRPct => $_getIZ(10);
  @$pb.TagNumber(11)
  set awardRPct($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasAwardRPct() => $_has(10);
  @$pb.TagNumber(11)
  void clearAwardRPct() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get awardCPct => $_getIZ(11);
  @$pb.TagNumber(12)
  set awardCPct($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasAwardCPct() => $_has(11);
  @$pb.TagNumber(12)
  void clearAwardCPct() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get showPct => $_getBF(12);
  @$pb.TagNumber(13)
  set showPct($core.bool v) {
    $_setBool(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasShowPct() => $_has(12);
  @$pb.TagNumber(13)
  void clearShowPct() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get liveDurationCredit => $_getIZ(13);
  @$pb.TagNumber(14)
  set liveDurationCredit($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasLiveDurationCredit() => $_has(13);
  @$pb.TagNumber(14)
  void clearLiveDurationCredit() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get awardLdPct => $_getIZ(14);
  @$pb.TagNumber(15)
  set awardLdPct($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasAwardLdPct() => $_has(14);
  @$pb.TagNumber(15)
  void clearAwardLdPct() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get weekFlowCredit => $_getIZ(15);
  @$pb.TagNumber(16)
  set weekFlowCredit($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasWeekFlowCredit() => $_has(15);
  @$pb.TagNumber(16)
  void clearWeekFlowCredit() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get awardWfPct => $_getIZ(16);
  @$pb.TagNumber(17)
  set awardWfPct($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasAwardWfPct() => $_has(16);
  @$pb.TagNumber(17)
  void clearAwardWfPct() => clearField(17);
}

class AnchorTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnchorTab',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filter')
    ..pc<AnchorSubTab>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'anchorSubTab',
        $pb.PbFieldType.PM,
        subBuilder: AnchorSubTab.create)
    ..pc<AnchorSubTab>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'anchorSubFilter',
        $pb.PbFieldType.PM,
        subBuilder: AnchorSubTab.create)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showDateFilter')
    ..hasRequiredFields = false;

  AnchorTab._() : super();
  factory AnchorTab({
    $core.String? name,
    $core.String? filter,
    $core.Iterable<AnchorSubTab>? anchorSubTab,
    $core.Iterable<AnchorSubTab>? anchorSubFilter,
    $core.bool? showDateFilter,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (filter != null) {
      _result.filter = filter;
    }
    if (anchorSubTab != null) {
      _result.anchorSubTab.addAll(anchorSubTab);
    }
    if (anchorSubFilter != null) {
      _result.anchorSubFilter.addAll(anchorSubFilter);
    }
    if (showDateFilter != null) {
      _result.showDateFilter = showDateFilter;
    }
    return _result;
  }
  factory AnchorTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnchorTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnchorTab clone() => AnchorTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnchorTab copyWith(void Function(AnchorTab) updates) =>
      super.copyWith((message) => updates(message as AnchorTab))
          as AnchorTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnchorTab create() => AnchorTab._();
  AnchorTab createEmptyInstance() => create();
  static $pb.PbList<AnchorTab> createRepeated() => $pb.PbList<AnchorTab>();
  @$core.pragma('dart2js:noInline')
  static AnchorTab getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnchorTab>(create);
  static AnchorTab? _defaultInstance;

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
  $core.String get filter => $_getSZ(1);
  @$pb.TagNumber(2)
  set filter($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFilter() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilter() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<AnchorSubTab> get anchorSubTab => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<AnchorSubTab> get anchorSubFilter => $_getList(3);

  @$pb.TagNumber(5)
  $core.bool get showDateFilter => $_getBF(4);
  @$pb.TagNumber(5)
  set showDateFilter($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasShowDateFilter() => $_has(4);
  @$pb.TagNumber(5)
  void clearShowDateFilter() => clearField(5);
}

class AnchorSubTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnchorSubTab',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filter')
    ..hasRequiredFields = false;

  AnchorSubTab._() : super();
  factory AnchorSubTab({
    $core.String? name,
    $core.String? filter,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (filter != null) {
      _result.filter = filter;
    }
    return _result;
  }
  factory AnchorSubTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnchorSubTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnchorSubTab clone() => AnchorSubTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnchorSubTab copyWith(void Function(AnchorSubTab) updates) =>
      super.copyWith((message) => updates(message as AnchorSubTab))
          as AnchorSubTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnchorSubTab create() => AnchorSubTab._();
  AnchorSubTab createEmptyInstance() => create();
  static $pb.PbList<AnchorSubTab> createRepeated() =>
      $pb.PbList<AnchorSubTab>();
  @$core.pragma('dart2js:noInline')
  static AnchorSubTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnchorSubTab>(create);
  static AnchorSubTab? _defaultInstance;

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
  $core.String get filter => $_getSZ(1);
  @$pb.TagNumber(2)
  set filter($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFilter() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilter() => clearField(2);
}

class AnchorBannerInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnchorBannerInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bannerUrl')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bannerText')
    ..hasRequiredFields = false;

  AnchorBannerInfo._() : super();
  factory AnchorBannerInfo({
    $core.String? bannerUrl,
    $core.String? bannerText,
  }) {
    final _result = create();
    if (bannerUrl != null) {
      _result.bannerUrl = bannerUrl;
    }
    if (bannerText != null) {
      _result.bannerText = bannerText;
    }
    return _result;
  }
  factory AnchorBannerInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnchorBannerInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnchorBannerInfo clone() => AnchorBannerInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnchorBannerInfo copyWith(void Function(AnchorBannerInfo) updates) =>
      super.copyWith((message) => updates(message as AnchorBannerInfo))
          as AnchorBannerInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnchorBannerInfo create() => AnchorBannerInfo._();
  AnchorBannerInfo createEmptyInstance() => create();
  static $pb.PbList<AnchorBannerInfo> createRepeated() =>
      $pb.PbList<AnchorBannerInfo>();
  @$core.pragma('dart2js:noInline')
  static AnchorBannerInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnchorBannerInfo>(create);
  static AnchorBannerInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bannerUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set bannerUrl($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBannerUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearBannerUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bannerText => $_getSZ(1);
  @$pb.TagNumber(2)
  set bannerText($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBannerText() => $_has(1);
  @$pb.TagNumber(2)
  void clearBannerText() => clearField(2);
}

class AnchorCenter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnchorCenter',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<AnchorBannerInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bannerInfo',
        subBuilder: AnchorBannerInfo.create)
    ..aOM<AnchorInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'anchorInfo',
        subBuilder: AnchorInfo.create)
    ..pc<AnchorTab>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'anchorTab',
        $pb.PbFieldType.PM,
        subBuilder: AnchorTab.create)
    ..hasRequiredFields = false;

  AnchorCenter._() : super();
  factory AnchorCenter({
    AnchorBannerInfo? bannerInfo,
    AnchorInfo? anchorInfo,
    $core.Iterable<AnchorTab>? anchorTab,
  }) {
    final _result = create();
    if (bannerInfo != null) {
      _result.bannerInfo = bannerInfo;
    }
    if (anchorInfo != null) {
      _result.anchorInfo = anchorInfo;
    }
    if (anchorTab != null) {
      _result.anchorTab.addAll(anchorTab);
    }
    return _result;
  }
  factory AnchorCenter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnchorCenter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnchorCenter clone() => AnchorCenter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnchorCenter copyWith(void Function(AnchorCenter) updates) =>
      super.copyWith((message) => updates(message as AnchorCenter))
          as AnchorCenter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnchorCenter create() => AnchorCenter._();
  AnchorCenter createEmptyInstance() => create();
  static $pb.PbList<AnchorCenter> createRepeated() =>
      $pb.PbList<AnchorCenter>();
  @$core.pragma('dart2js:noInline')
  static AnchorCenter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnchorCenter>(create);
  static AnchorCenter? _defaultInstance;

  @$pb.TagNumber(1)
  AnchorBannerInfo get bannerInfo => $_getN(0);
  @$pb.TagNumber(1)
  set bannerInfo(AnchorBannerInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBannerInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearBannerInfo() => clearField(1);
  @$pb.TagNumber(1)
  AnchorBannerInfo ensureBannerInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  AnchorInfo get anchorInfo => $_getN(1);
  @$pb.TagNumber(2)
  set anchorInfo(AnchorInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAnchorInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnchorInfo() => clearField(2);
  @$pb.TagNumber(2)
  AnchorInfo ensureAnchorInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<AnchorTab> get anchorTab => $_getList(2);
}

class ResAnchorUserList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAnchorUserList',
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
    ..aOM<AnchorUserList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AnchorUserList.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore')
    ..hasRequiredFields = false;

  ResAnchorUserList._() : super();
  factory ResAnchorUserList({
    $core.bool? success,
    $core.String? msg,
    AnchorUserList? data,
    $core.bool? hasMore,
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
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    return _result;
  }
  factory ResAnchorUserList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAnchorUserList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAnchorUserList clone() => ResAnchorUserList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAnchorUserList copyWith(void Function(ResAnchorUserList) updates) =>
      super.copyWith((message) => updates(message as ResAnchorUserList))
          as ResAnchorUserList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAnchorUserList create() => ResAnchorUserList._();
  ResAnchorUserList createEmptyInstance() => create();
  static $pb.PbList<ResAnchorUserList> createRepeated() =>
      $pb.PbList<ResAnchorUserList>();
  @$core.pragma('dart2js:noInline')
  static ResAnchorUserList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAnchorUserList>(create);
  static ResAnchorUserList? _defaultInstance;

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
  AnchorUserList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AnchorUserList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AnchorUserList ensureData() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get hasMore => $_getBF(3);
  @$pb.TagNumber(4)
  set hasMore($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHasMore() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasMore() => clearField(4);
}

class AnchorUserList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnchorUserList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<AnchorUserItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        $pb.PbFieldType.PM,
        subBuilder: AnchorUserItem.create)
    ..hasRequiredFields = false;

  AnchorUserList._() : super();
  factory AnchorUserList({
    $core.Iterable<AnchorUserItem>? user,
  }) {
    final _result = create();
    if (user != null) {
      _result.user.addAll(user);
    }
    return _result;
  }
  factory AnchorUserList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnchorUserList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnchorUserList clone() => AnchorUserList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnchorUserList copyWith(void Function(AnchorUserList) updates) =>
      super.copyWith((message) => updates(message as AnchorUserList))
          as AnchorUserList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnchorUserList create() => AnchorUserList._();
  AnchorUserList createEmptyInstance() => create();
  static $pb.PbList<AnchorUserList> createRepeated() =>
      $pb.PbList<AnchorUserList>();
  @$core.pragma('dart2js:noInline')
  static AnchorUserList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnchorUserList>(create);
  static AnchorUserList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AnchorUserItem> get user => $_getList(0);
}

class AnchorUserItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnchorUserItem',
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'datelineDiff')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'addBehaviorCredit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'addResultCredit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ridAddTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDatelineDiff',
        $pb.PbFieldType.OU3)
    ..pPS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tags')
    ..hasRequiredFields = false;

  AnchorUserItem._() : super();
  factory AnchorUserItem({
    $core.String? name,
    $core.String? icon,
    $core.int? uid,
    $core.int? onlineStatus,
    $core.int? vip,
    $core.String? datelineDiff,
    $core.int? addBehaviorCredit,
    $core.int? addResultCredit,
    $core.int? rid,
    $core.int? ridAddTime,
    $core.int? onlineDatelineDiff,
    $core.Iterable<$core.String>? tags,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (datelineDiff != null) {
      _result.datelineDiff = datelineDiff;
    }
    if (addBehaviorCredit != null) {
      _result.addBehaviorCredit = addBehaviorCredit;
    }
    if (addResultCredit != null) {
      _result.addResultCredit = addResultCredit;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (ridAddTime != null) {
      _result.ridAddTime = ridAddTime;
    }
    if (onlineDatelineDiff != null) {
      _result.onlineDatelineDiff = onlineDatelineDiff;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    return _result;
  }
  factory AnchorUserItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnchorUserItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnchorUserItem clone() => AnchorUserItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnchorUserItem copyWith(void Function(AnchorUserItem) updates) =>
      super.copyWith((message) => updates(message as AnchorUserItem))
          as AnchorUserItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnchorUserItem create() => AnchorUserItem._();
  AnchorUserItem createEmptyInstance() => create();
  static $pb.PbList<AnchorUserItem> createRepeated() =>
      $pb.PbList<AnchorUserItem>();
  @$core.pragma('dart2js:noInline')
  static AnchorUserItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnchorUserItem>(create);
  static AnchorUserItem? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.int get onlineStatus => $_getIZ(3);
  @$pb.TagNumber(4)
  set onlineStatus($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOnlineStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearOnlineStatus() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get vip => $_getIZ(4);
  @$pb.TagNumber(5)
  set vip($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasVip() => $_has(4);
  @$pb.TagNumber(5)
  void clearVip() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get datelineDiff => $_getSZ(5);
  @$pb.TagNumber(6)
  set datelineDiff($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDatelineDiff() => $_has(5);
  @$pb.TagNumber(6)
  void clearDatelineDiff() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get addBehaviorCredit => $_getIZ(6);
  @$pb.TagNumber(7)
  set addBehaviorCredit($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAddBehaviorCredit() => $_has(6);
  @$pb.TagNumber(7)
  void clearAddBehaviorCredit() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get addResultCredit => $_getIZ(7);
  @$pb.TagNumber(8)
  set addResultCredit($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAddResultCredit() => $_has(7);
  @$pb.TagNumber(8)
  void clearAddResultCredit() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get rid => $_getIZ(8);
  @$pb.TagNumber(9)
  set rid($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRid() => $_has(8);
  @$pb.TagNumber(9)
  void clearRid() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get ridAddTime => $_getIZ(9);
  @$pb.TagNumber(10)
  set ridAddTime($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRidAddTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearRidAddTime() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get onlineDatelineDiff => $_getIZ(10);
  @$pb.TagNumber(11)
  set onlineDatelineDiff($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasOnlineDatelineDiff() => $_has(10);
  @$pb.TagNumber(11)
  void clearOnlineDatelineDiff() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<$core.String> get tags => $_getList(11);
}

class ResAnchorUserChangeList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAnchorUserChangeList',
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
    ..aOM<AnchorUserChangeList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AnchorUserChangeList.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore')
    ..hasRequiredFields = false;

  ResAnchorUserChangeList._() : super();
  factory ResAnchorUserChangeList({
    $core.bool? success,
    $core.String? msg,
    AnchorUserChangeList? data,
    $core.bool? hasMore,
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
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    return _result;
  }
  factory ResAnchorUserChangeList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAnchorUserChangeList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAnchorUserChangeList clone() =>
      ResAnchorUserChangeList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAnchorUserChangeList copyWith(
          void Function(ResAnchorUserChangeList) updates) =>
      super.copyWith((message) => updates(message as ResAnchorUserChangeList))
          as ResAnchorUserChangeList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAnchorUserChangeList create() => ResAnchorUserChangeList._();
  ResAnchorUserChangeList createEmptyInstance() => create();
  static $pb.PbList<ResAnchorUserChangeList> createRepeated() =>
      $pb.PbList<ResAnchorUserChangeList>();
  @$core.pragma('dart2js:noInline')
  static ResAnchorUserChangeList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAnchorUserChangeList>(create);
  static ResAnchorUserChangeList? _defaultInstance;

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
  AnchorUserChangeList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AnchorUserChangeList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AnchorUserChangeList ensureData() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get hasMore => $_getBF(3);
  @$pb.TagNumber(4)
  set hasMore($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHasMore() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasMore() => clearField(4);
}

class AnchorUserChangeList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnchorUserChangeList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<AnchorUserChangeItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        $pb.PbFieldType.PM,
        subBuilder: AnchorUserChangeItem.create)
    ..hasRequiredFields = false;

  AnchorUserChangeList._() : super();
  factory AnchorUserChangeList({
    $core.Iterable<AnchorUserChangeItem>? user,
  }) {
    final _result = create();
    if (user != null) {
      _result.user.addAll(user);
    }
    return _result;
  }
  factory AnchorUserChangeList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnchorUserChangeList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnchorUserChangeList clone() =>
      AnchorUserChangeList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnchorUserChangeList copyWith(void Function(AnchorUserChangeList) updates) =>
      super.copyWith((message) => updates(message as AnchorUserChangeList))
          as AnchorUserChangeList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnchorUserChangeList create() => AnchorUserChangeList._();
  AnchorUserChangeList createEmptyInstance() => create();
  static $pb.PbList<AnchorUserChangeList> createRepeated() =>
      $pb.PbList<AnchorUserChangeList>();
  @$core.pragma('dart2js:noInline')
  static AnchorUserChangeList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnchorUserChangeList>(create);
  static AnchorUserChangeList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AnchorUserChangeItem> get user => $_getList(0);
}

class AnchorUserChangeItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnchorUserChangeItem',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reason')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'opText')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'opTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AnchorUserChangeItem._() : super();
  factory AnchorUserChangeItem({
    $core.String? name,
    $core.String? icon,
    $core.int? uid,
    $core.String? reason,
    $core.String? opText,
    $core.int? opTime,
    $core.int? vip,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (reason != null) {
      _result.reason = reason;
    }
    if (opText != null) {
      _result.opText = opText;
    }
    if (opTime != null) {
      _result.opTime = opTime;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    return _result;
  }
  factory AnchorUserChangeItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnchorUserChangeItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnchorUserChangeItem clone() =>
      AnchorUserChangeItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnchorUserChangeItem copyWith(void Function(AnchorUserChangeItem) updates) =>
      super.copyWith((message) => updates(message as AnchorUserChangeItem))
          as AnchorUserChangeItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnchorUserChangeItem create() => AnchorUserChangeItem._();
  AnchorUserChangeItem createEmptyInstance() => create();
  static $pb.PbList<AnchorUserChangeItem> createRepeated() =>
      $pb.PbList<AnchorUserChangeItem>();
  @$core.pragma('dart2js:noInline')
  static AnchorUserChangeItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnchorUserChangeItem>(create);
  static AnchorUserChangeItem? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.String get reason => $_getSZ(3);
  @$pb.TagNumber(4)
  set reason($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasReason() => $_has(3);
  @$pb.TagNumber(4)
  void clearReason() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get opText => $_getSZ(4);
  @$pb.TagNumber(5)
  set opText($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOpText() => $_has(4);
  @$pb.TagNumber(5)
  void clearOpText() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get opTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set opTime($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOpTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearOpTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get vip => $_getIZ(6);
  @$pb.TagNumber(7)
  set vip($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasVip() => $_has(6);
  @$pb.TagNumber(7)
  void clearVip() => clearField(7);
}

class ResAnchorMissionList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAnchorMissionList',
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
    ..aOM<AnchorMissionList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AnchorMissionList.create)
    ..hasRequiredFields = false;

  ResAnchorMissionList._() : super();
  factory ResAnchorMissionList({
    $core.bool? success,
    $core.String? msg,
    AnchorMissionList? data,
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
  factory ResAnchorMissionList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAnchorMissionList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAnchorMissionList clone() =>
      ResAnchorMissionList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAnchorMissionList copyWith(void Function(ResAnchorMissionList) updates) =>
      super.copyWith((message) => updates(message as ResAnchorMissionList))
          as ResAnchorMissionList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAnchorMissionList create() => ResAnchorMissionList._();
  ResAnchorMissionList createEmptyInstance() => create();
  static $pb.PbList<ResAnchorMissionList> createRepeated() =>
      $pb.PbList<ResAnchorMissionList>();
  @$core.pragma('dart2js:noInline')
  static ResAnchorMissionList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAnchorMissionList>(create);
  static ResAnchorMissionList? _defaultInstance;

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
  AnchorMissionList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AnchorMissionList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AnchorMissionList ensureData() => $_ensure(2);
}

class AnchorMissionList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnchorMissionList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<AnchorMissionItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mission',
        $pb.PbFieldType.PM,
        subBuilder: AnchorMissionItem.create)
    ..hasRequiredFields = false;

  AnchorMissionList._() : super();
  factory AnchorMissionList({
    $core.Iterable<AnchorMissionItem>? mission,
  }) {
    final _result = create();
    if (mission != null) {
      _result.mission.addAll(mission);
    }
    return _result;
  }
  factory AnchorMissionList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnchorMissionList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnchorMissionList clone() => AnchorMissionList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnchorMissionList copyWith(void Function(AnchorMissionList) updates) =>
      super.copyWith((message) => updates(message as AnchorMissionList))
          as AnchorMissionList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnchorMissionList create() => AnchorMissionList._();
  AnchorMissionList createEmptyInstance() => create();
  static $pb.PbList<AnchorMissionList> createRepeated() =>
      $pb.PbList<AnchorMissionList>();
  @$core.pragma('dart2js:noInline')
  static AnchorMissionList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnchorMissionList>(create);
  static AnchorMissionList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AnchorMissionItem> get mission => $_getList(0);
}

class AnchorMissionItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnchorMissionItem',
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
            : 'desc')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'addCredit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'limitCredit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasDetail',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AnchorMissionItem._() : super();
  factory AnchorMissionItem({
    $core.int? id,
    $core.String? name,
    $core.String? desc,
    $core.int? addCredit,
    $core.int? limitCredit,
    $core.int? hasDetail,
    $core.int? type,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (addCredit != null) {
      _result.addCredit = addCredit;
    }
    if (limitCredit != null) {
      _result.limitCredit = limitCredit;
    }
    if (hasDetail != null) {
      _result.hasDetail = hasDetail;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory AnchorMissionItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnchorMissionItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnchorMissionItem clone() => AnchorMissionItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnchorMissionItem copyWith(void Function(AnchorMissionItem) updates) =>
      super.copyWith((message) => updates(message as AnchorMissionItem))
          as AnchorMissionItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnchorMissionItem create() => AnchorMissionItem._();
  AnchorMissionItem createEmptyInstance() => create();
  static $pb.PbList<AnchorMissionItem> createRepeated() =>
      $pb.PbList<AnchorMissionItem>();
  @$core.pragma('dart2js:noInline')
  static AnchorMissionItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnchorMissionItem>(create);
  static AnchorMissionItem? _defaultInstance;

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
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get addCredit => $_getIZ(3);
  @$pb.TagNumber(4)
  set addCredit($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAddCredit() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddCredit() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get limitCredit => $_getIZ(4);
  @$pb.TagNumber(5)
  set limitCredit($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLimitCredit() => $_has(4);
  @$pb.TagNumber(5)
  void clearLimitCredit() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get hasDetail => $_getIZ(5);
  @$pb.TagNumber(6)
  set hasDetail($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHasDetail() => $_has(5);
  @$pb.TagNumber(6)
  void clearHasDetail() => clearField(6);

  @$pb.TagNumber(9)
  $core.int get type => $_getIZ(6);
  @$pb.TagNumber(9)
  set type($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(9)
  void clearType() => clearField(9);
}

class ResAnchorMissionDetailList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAnchorMissionDetailList',
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
    ..aOM<AnchorMissionDetailList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AnchorMissionDetailList.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore')
    ..hasRequiredFields = false;

  ResAnchorMissionDetailList._() : super();
  factory ResAnchorMissionDetailList({
    $core.bool? success,
    $core.String? msg,
    AnchorMissionDetailList? data,
    $core.bool? hasMore,
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
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    return _result;
  }
  factory ResAnchorMissionDetailList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAnchorMissionDetailList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAnchorMissionDetailList clone() =>
      ResAnchorMissionDetailList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAnchorMissionDetailList copyWith(
          void Function(ResAnchorMissionDetailList) updates) =>
      super.copyWith(
              (message) => updates(message as ResAnchorMissionDetailList))
          as ResAnchorMissionDetailList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAnchorMissionDetailList create() => ResAnchorMissionDetailList._();
  ResAnchorMissionDetailList createEmptyInstance() => create();
  static $pb.PbList<ResAnchorMissionDetailList> createRepeated() =>
      $pb.PbList<ResAnchorMissionDetailList>();
  @$core.pragma('dart2js:noInline')
  static ResAnchorMissionDetailList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAnchorMissionDetailList>(create);
  static ResAnchorMissionDetailList? _defaultInstance;

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
  AnchorMissionDetailList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AnchorMissionDetailList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AnchorMissionDetailList ensureData() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get hasMore => $_getBF(3);
  @$pb.TagNumber(4)
  set hasMore($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHasMore() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasMore() => clearField(4);
}

class AnchorMissionDetailList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnchorMissionDetailList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<AnchorMissionDetail>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'detail',
        $pb.PbFieldType.PM,
        subBuilder: AnchorMissionDetail.create)
    ..hasRequiredFields = false;

  AnchorMissionDetailList._() : super();
  factory AnchorMissionDetailList({
    $core.Iterable<AnchorMissionDetail>? detail,
  }) {
    final _result = create();
    if (detail != null) {
      _result.detail.addAll(detail);
    }
    return _result;
  }
  factory AnchorMissionDetailList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnchorMissionDetailList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnchorMissionDetailList clone() =>
      AnchorMissionDetailList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnchorMissionDetailList copyWith(
          void Function(AnchorMissionDetailList) updates) =>
      super.copyWith((message) => updates(message as AnchorMissionDetailList))
          as AnchorMissionDetailList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnchorMissionDetailList create() => AnchorMissionDetailList._();
  AnchorMissionDetailList createEmptyInstance() => create();
  static $pb.PbList<AnchorMissionDetailList> createRepeated() =>
      $pb.PbList<AnchorMissionDetailList>();
  @$core.pragma('dart2js:noInline')
  static AnchorMissionDetailList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnchorMissionDetailList>(create);
  static AnchorMissionDetailList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AnchorMissionDetail> get detail => $_getList(0);
}

class AnchorMissionDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AnchorMissionDetail',
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'addTime',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'addText')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'addCredit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'datelineDiff')
    ..hasRequiredFields = false;

  AnchorMissionDetail._() : super();
  factory AnchorMissionDetail({
    $core.String? name,
    $core.String? icon,
    $core.int? uid,
    $core.int? addTime,
    $core.String? addText,
    $core.int? addCredit,
    $core.int? vip,
    $core.String? datelineDiff,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (addTime != null) {
      _result.addTime = addTime;
    }
    if (addText != null) {
      _result.addText = addText;
    }
    if (addCredit != null) {
      _result.addCredit = addCredit;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (datelineDiff != null) {
      _result.datelineDiff = datelineDiff;
    }
    return _result;
  }
  factory AnchorMissionDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AnchorMissionDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AnchorMissionDetail clone() => AnchorMissionDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AnchorMissionDetail copyWith(void Function(AnchorMissionDetail) updates) =>
      super.copyWith((message) => updates(message as AnchorMissionDetail))
          as AnchorMissionDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnchorMissionDetail create() => AnchorMissionDetail._();
  AnchorMissionDetail createEmptyInstance() => create();
  static $pb.PbList<AnchorMissionDetail> createRepeated() =>
      $pb.PbList<AnchorMissionDetail>();
  @$core.pragma('dart2js:noInline')
  static AnchorMissionDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnchorMissionDetail>(create);
  static AnchorMissionDetail? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.int get addTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set addTime($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAddTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get addText => $_getSZ(4);
  @$pb.TagNumber(5)
  set addText($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAddText() => $_has(4);
  @$pb.TagNumber(5)
  void clearAddText() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get addCredit => $_getIZ(5);
  @$pb.TagNumber(6)
  set addCredit($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAddCredit() => $_has(5);
  @$pb.TagNumber(6)
  void clearAddCredit() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get vip => $_getIZ(6);
  @$pb.TagNumber(7)
  set vip($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasVip() => $_has(6);
  @$pb.TagNumber(7)
  void clearVip() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get datelineDiff => $_getSZ(7);
  @$pb.TagNumber(8)
  set datelineDiff($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDatelineDiff() => $_has(7);
  @$pb.TagNumber(8)
  void clearDatelineDiff() => clearField(8);
}

class ResHistoryAnchorInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHistoryAnchorInfo',
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
    ..aOM<HistoryAnchorInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HistoryAnchorInfo.create)
    ..hasRequiredFields = false;

  ResHistoryAnchorInfo._() : super();
  factory ResHistoryAnchorInfo({
    $core.bool? success,
    $core.String? msg,
    HistoryAnchorInfo? data,
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
  factory ResHistoryAnchorInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHistoryAnchorInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHistoryAnchorInfo clone() =>
      ResHistoryAnchorInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHistoryAnchorInfo copyWith(void Function(ResHistoryAnchorInfo) updates) =>
      super.copyWith((message) => updates(message as ResHistoryAnchorInfo))
          as ResHistoryAnchorInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHistoryAnchorInfo create() => ResHistoryAnchorInfo._();
  ResHistoryAnchorInfo createEmptyInstance() => create();
  static $pb.PbList<ResHistoryAnchorInfo> createRepeated() =>
      $pb.PbList<ResHistoryAnchorInfo>();
  @$core.pragma('dart2js:noInline')
  static ResHistoryAnchorInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHistoryAnchorInfo>(create);
  static ResHistoryAnchorInfo? _defaultInstance;

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
  HistoryAnchorInfo get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HistoryAnchorInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HistoryAnchorInfo ensureData() => $_ensure(2);
}

class HistoryAnchorInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HistoryAnchorInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<HistoryAnchorInfoItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hisory',
        $pb.PbFieldType.PM,
        subBuilder: HistoryAnchorInfoItem.create)
    ..hasRequiredFields = false;

  HistoryAnchorInfo._() : super();
  factory HistoryAnchorInfo({
    $core.Iterable<HistoryAnchorInfoItem>? hisory,
  }) {
    final _result = create();
    if (hisory != null) {
      _result.hisory.addAll(hisory);
    }
    return _result;
  }
  factory HistoryAnchorInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HistoryAnchorInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HistoryAnchorInfo clone() => HistoryAnchorInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HistoryAnchorInfo copyWith(void Function(HistoryAnchorInfo) updates) =>
      super.copyWith((message) => updates(message as HistoryAnchorInfo))
          as HistoryAnchorInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HistoryAnchorInfo create() => HistoryAnchorInfo._();
  HistoryAnchorInfo createEmptyInstance() => create();
  static $pb.PbList<HistoryAnchorInfo> createRepeated() =>
      $pb.PbList<HistoryAnchorInfo>();
  @$core.pragma('dart2js:noInline')
  static HistoryAnchorInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HistoryAnchorInfo>(create);
  static HistoryAnchorInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<HistoryAnchorInfoItem> get hisory => $_getList(0);
}

class HistoryAnchorInfoItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HistoryAnchorInfoItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'timeDesc')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveDurationCredit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'behaviorCredit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekFlowCredit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..aOB(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isFinished')
    ..hasRequiredFields = false;

  HistoryAnchorInfoItem._() : super();
  factory HistoryAnchorInfoItem({
    $core.String? timeDesc,
    $core.int? liveDurationCredit,
    $core.int? behaviorCredit,
    $core.int? weekFlowCredit,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? vip,
    $core.bool? isFinished,
  }) {
    final _result = create();
    if (timeDesc != null) {
      _result.timeDesc = timeDesc;
    }
    if (liveDurationCredit != null) {
      _result.liveDurationCredit = liveDurationCredit;
    }
    if (behaviorCredit != null) {
      _result.behaviorCredit = behaviorCredit;
    }
    if (weekFlowCredit != null) {
      _result.weekFlowCredit = weekFlowCredit;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (isFinished != null) {
      _result.isFinished = isFinished;
    }
    return _result;
  }
  factory HistoryAnchorInfoItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HistoryAnchorInfoItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HistoryAnchorInfoItem clone() =>
      HistoryAnchorInfoItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HistoryAnchorInfoItem copyWith(
          void Function(HistoryAnchorInfoItem) updates) =>
      super.copyWith((message) => updates(message as HistoryAnchorInfoItem))
          as HistoryAnchorInfoItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HistoryAnchorInfoItem create() => HistoryAnchorInfoItem._();
  HistoryAnchorInfoItem createEmptyInstance() => create();
  static $pb.PbList<HistoryAnchorInfoItem> createRepeated() =>
      $pb.PbList<HistoryAnchorInfoItem>();
  @$core.pragma('dart2js:noInline')
  static HistoryAnchorInfoItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HistoryAnchorInfoItem>(create);
  static HistoryAnchorInfoItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get timeDesc => $_getSZ(0);
  @$pb.TagNumber(1)
  set timeDesc($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTimeDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimeDesc() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get liveDurationCredit => $_getIZ(1);
  @$pb.TagNumber(2)
  set liveDurationCredit($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLiveDurationCredit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLiveDurationCredit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get behaviorCredit => $_getIZ(2);
  @$pb.TagNumber(3)
  set behaviorCredit($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBehaviorCredit() => $_has(2);
  @$pb.TagNumber(3)
  void clearBehaviorCredit() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get weekFlowCredit => $_getIZ(3);
  @$pb.TagNumber(4)
  set weekFlowCredit($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWeekFlowCredit() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeekFlowCredit() => clearField(4);

  @$pb.TagNumber(6)
  $core.int get uid => $_getIZ(4);
  @$pb.TagNumber(6)
  set uid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUid() => $_has(4);
  @$pb.TagNumber(6)
  void clearUid() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(7)
  set name($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(7)
  void clearName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get icon => $_getSZ(6);
  @$pb.TagNumber(8)
  set icon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIcon() => $_has(6);
  @$pb.TagNumber(8)
  void clearIcon() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get vip => $_getIZ(7);
  @$pb.TagNumber(9)
  set vip($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasVip() => $_has(7);
  @$pb.TagNumber(9)
  void clearVip() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isFinished => $_getBF(8);
  @$pb.TagNumber(10)
  set isFinished($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasIsFinished() => $_has(8);
  @$pb.TagNumber(10)
  void clearIsFinished() => clearField(10);
}
