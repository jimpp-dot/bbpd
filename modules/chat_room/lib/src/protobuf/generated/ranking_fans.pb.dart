///
//  Generated code. Do not modify.
//  source: ranking_fans.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LiveInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LiveInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveUid',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'follow',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  LiveInfo._() : super();
  factory LiveInfo({
    $core.int? liveUid,
    $core.String? name,
    $core.String? icon,
    $core.String? rank,
    $core.int? money,
    $core.int? follow,
  }) {
    final _result = create();
    if (liveUid != null) {
      _result.liveUid = liveUid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (money != null) {
      _result.money = money;
    }
    if (follow != null) {
      _result.follow = follow;
    }
    return _result;
  }
  factory LiveInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LiveInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LiveInfo clone() => LiveInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LiveInfo copyWith(void Function(LiveInfo) updates) =>
      super.copyWith((message) => updates(message as LiveInfo))
          as LiveInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LiveInfo create() => LiveInfo._();
  LiveInfo createEmptyInstance() => create();
  static $pb.PbList<LiveInfo> createRepeated() => $pb.PbList<LiveInfo>();
  @$core.pragma('dart2js:noInline')
  static LiveInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LiveInfo>(create);
  static LiveInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get liveUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set liveUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLiveUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearLiveUid() => clearField(1);

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

  @$pb.TagNumber(4)
  $core.String get rank => $_getSZ(3);
  @$pb.TagNumber(4)
  set rank($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearRank() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get money => $_getIZ(4);
  @$pb.TagNumber(5)
  set money($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMoney() => $_has(4);
  @$pb.TagNumber(5)
  void clearMoney() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get follow => $_getIZ(5);
  @$pb.TagNumber(6)
  set follow($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFollow() => $_has(5);
  @$pb.TagNumber(6)
  void clearFollow() => clearField(6);
}

class FansList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FansList',
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'credit',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'labelImage')
    ..pPS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'labelColors')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isFans',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'creditNeed',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  FansList._() : super();
  factory FansList({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.int? rank,
    $core.int? credit,
    $core.String? label,
    $core.int? level,
    $core.String? labelImage,
    $core.Iterable<$core.String>? labelColors,
    $core.int? isFans,
    $core.int? creditNeed,
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
    if (sex != null) {
      _result.sex = sex;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (credit != null) {
      _result.credit = credit;
    }
    if (label != null) {
      _result.label = label;
    }
    if (level != null) {
      _result.level = level;
    }
    if (labelImage != null) {
      _result.labelImage = labelImage;
    }
    if (labelColors != null) {
      _result.labelColors.addAll(labelColors);
    }
    if (isFans != null) {
      _result.isFans = isFans;
    }
    if (creditNeed != null) {
      _result.creditNeed = creditNeed;
    }
    return _result;
  }
  factory FansList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FansList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FansList clone() => FansList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FansList copyWith(void Function(FansList) updates) =>
      super.copyWith((message) => updates(message as FansList))
          as FansList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FansList create() => FansList._();
  FansList createEmptyInstance() => create();
  static $pb.PbList<FansList> createRepeated() => $pb.PbList<FansList>();
  @$core.pragma('dart2js:noInline')
  static FansList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FansList>(create);
  static FansList? _defaultInstance;

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

  @$pb.TagNumber(6)
  $core.int get credit => $_getIZ(5);
  @$pb.TagNumber(6)
  set credit($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCredit() => $_has(5);
  @$pb.TagNumber(6)
  void clearCredit() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get label => $_getSZ(6);
  @$pb.TagNumber(7)
  set label($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLabel() => $_has(6);
  @$pb.TagNumber(7)
  void clearLabel() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get level => $_getIZ(7);
  @$pb.TagNumber(8)
  set level($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLevel() => $_has(7);
  @$pb.TagNumber(8)
  void clearLevel() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get labelImage => $_getSZ(8);
  @$pb.TagNumber(9)
  set labelImage($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasLabelImage() => $_has(8);
  @$pb.TagNumber(9)
  void clearLabelImage() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get labelColors => $_getList(9);

  @$pb.TagNumber(11)
  $core.int get isFans => $_getIZ(10);
  @$pb.TagNumber(11)
  set isFans($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasIsFans() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsFans() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get creditNeed => $_getIZ(11);
  @$pb.TagNumber(12)
  set creditNeed($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasCreditNeed() => $_has(11);
  @$pb.TagNumber(12)
  void clearCreditNeed() => clearField(12);
}

class FansData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FansData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fansCount',
        $pb.PbFieldType.OU3)
    ..aOM<FansList>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentRank',
        subBuilder: FansList.create)
    ..pc<FansList>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: FansList.create)
    ..aOM<LiveInfo>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveInfo',
        subBuilder: LiveInfo.create)
    ..hasRequiredFields = false;

  FansData._() : super();
  factory FansData({
    $core.int? fansCount,
    FansList? currentRank,
    $core.Iterable<FansList>? list,
    LiveInfo? liveInfo,
  }) {
    final _result = create();
    if (fansCount != null) {
      _result.fansCount = fansCount;
    }
    if (currentRank != null) {
      _result.currentRank = currentRank;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (liveInfo != null) {
      _result.liveInfo = liveInfo;
    }
    return _result;
  }
  factory FansData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FansData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FansData clone() => FansData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FansData copyWith(void Function(FansData) updates) =>
      super.copyWith((message) => updates(message as FansData))
          as FansData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FansData create() => FansData._();
  FansData createEmptyInstance() => create();
  static $pb.PbList<FansData> createRepeated() => $pb.PbList<FansData>();
  @$core.pragma('dart2js:noInline')
  static FansData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FansData>(create);
  static FansData? _defaultInstance;

  @$pb.TagNumber(3)
  $core.int get fansCount => $_getIZ(0);
  @$pb.TagNumber(3)
  set fansCount($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFansCount() => $_has(0);
  @$pb.TagNumber(3)
  void clearFansCount() => clearField(3);

  @$pb.TagNumber(4)
  FansList get currentRank => $_getN(1);
  @$pb.TagNumber(4)
  set currentRank(FansList v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCurrentRank() => $_has(1);
  @$pb.TagNumber(4)
  void clearCurrentRank() => clearField(4);
  @$pb.TagNumber(4)
  FansList ensureCurrentRank() => $_ensure(1);

  @$pb.TagNumber(5)
  $core.List<FansList> get list => $_getList(2);

  @$pb.TagNumber(6)
  LiveInfo get liveInfo => $_getN(3);
  @$pb.TagNumber(6)
  set liveInfo(LiveInfo v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLiveInfo() => $_has(3);
  @$pb.TagNumber(6)
  void clearLiveInfo() => clearField(6);
  @$pb.TagNumber(6)
  LiveInfo ensureLiveInfo() => $_ensure(3);
}

class ResRankingFans extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRankingFans',
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
    ..aOM<FansData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: FansData.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hideRank',
        protoName: 'hideRank')
    ..hasRequiredFields = false;

  ResRankingFans._() : super();
  factory ResRankingFans({
    $core.bool? success,
    $core.String? msg,
    FansData? data,
    $core.bool? hideRank,
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
    if (hideRank != null) {
      _result.hideRank = hideRank;
    }
    return _result;
  }
  factory ResRankingFans.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRankingFans.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRankingFans clone() => ResRankingFans()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRankingFans copyWith(void Function(ResRankingFans) updates) =>
      super.copyWith((message) => updates(message as ResRankingFans))
          as ResRankingFans; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRankingFans create() => ResRankingFans._();
  ResRankingFans createEmptyInstance() => create();
  static $pb.PbList<ResRankingFans> createRepeated() =>
      $pb.PbList<ResRankingFans>();
  @$core.pragma('dart2js:noInline')
  static ResRankingFans getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRankingFans>(create);
  static ResRankingFans? _defaultInstance;

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
  FansData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(FansData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  FansData ensureData() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get hideRank => $_getBF(3);
  @$pb.TagNumber(4)
  set hideRank($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHideRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearHideRank() => clearField(4);
}
