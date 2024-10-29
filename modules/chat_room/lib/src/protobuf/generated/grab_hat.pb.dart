///
//  Generated code. Do not modify.
//  source: grab_hat.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'grab_hat_rank.pb.dart' as $0;

class ResHatIndex extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHatIndex',
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
    ..aOM<HatIndexData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HatIndexData.create)
    ..hasRequiredFields = false;

  ResHatIndex._() : super();
  factory ResHatIndex({
    $core.bool? success,
    $core.String? message,
    HatIndexData? data,
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
  factory ResHatIndex.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHatIndex.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHatIndex clone() => ResHatIndex()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHatIndex copyWith(void Function(ResHatIndex) updates) =>
      super.copyWith((message) => updates(message as ResHatIndex))
          as ResHatIndex; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHatIndex create() => ResHatIndex._();
  ResHatIndex createEmptyInstance() => create();
  static $pb.PbList<ResHatIndex> createRepeated() => $pb.PbList<ResHatIndex>();
  @$core.pragma('dart2js:noInline')
  static ResHatIndex getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHatIndex>(create);
  static ResHatIndex? _defaultInstance;

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
  HatIndexData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HatIndexData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HatIndexData ensureData() => $_ensure(2);
}

class HatIndexData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatIndexData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<HatSeries>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hat',
        $pb.PbFieldType.PM,
        subBuilder: HatSeries.create)
    ..p<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countTime',
        $pb.PbFieldType.PU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..aOM<HatPlayingData>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playData',
        subBuilder: HatPlayingData.create)
    ..hasRequiredFields = false;

  HatIndexData._() : super();
  factory HatIndexData({
    $core.Iterable<HatSeries>? hat,
    $core.Iterable<$core.int>? countTime,
    $core.int? state,
    HatPlayingData? playData,
  }) {
    final _result = create();
    if (hat != null) {
      _result.hat.addAll(hat);
    }
    if (countTime != null) {
      _result.countTime.addAll(countTime);
    }
    if (state != null) {
      _result.state = state;
    }
    if (playData != null) {
      _result.playData = playData;
    }
    return _result;
  }
  factory HatIndexData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatIndexData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatIndexData clone() => HatIndexData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatIndexData copyWith(void Function(HatIndexData) updates) =>
      super.copyWith((message) => updates(message as HatIndexData))
          as HatIndexData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatIndexData create() => HatIndexData._();
  HatIndexData createEmptyInstance() => create();
  static $pb.PbList<HatIndexData> createRepeated() =>
      $pb.PbList<HatIndexData>();
  @$core.pragma('dart2js:noInline')
  static HatIndexData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatIndexData>(create);
  static HatIndexData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<HatSeries> get hat => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get countTime => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get state => $_getIZ(2);
  @$pb.TagNumber(3)
  set state($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);

  @$pb.TagNumber(4)
  HatPlayingData get playData => $_getN(3);
  @$pb.TagNumber(4)
  set playData(HatPlayingData v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPlayData() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlayData() => clearField(4);
  @$pb.TagNumber(4)
  HatPlayingData ensurePlayData() => $_ensure(3);
}

class HatSeries extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatSeries',
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
            : 'seriesImage')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hatImage')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelTxt')
    ..hasRequiredFields = false;

  HatSeries._() : super();
  factory HatSeries({
    $core.int? id,
    $core.String? seriesImage,
    $core.String? hatImage,
    $core.int? level,
    $core.String? levelTxt,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (seriesImage != null) {
      _result.seriesImage = seriesImage;
    }
    if (hatImage != null) {
      _result.hatImage = hatImage;
    }
    if (level != null) {
      _result.level = level;
    }
    if (levelTxt != null) {
      _result.levelTxt = levelTxt;
    }
    return _result;
  }
  factory HatSeries.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatSeries.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatSeries clone() => HatSeries()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatSeries copyWith(void Function(HatSeries) updates) =>
      super.copyWith((message) => updates(message as HatSeries))
          as HatSeries; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatSeries create() => HatSeries._();
  HatSeries createEmptyInstance() => create();
  static $pb.PbList<HatSeries> createRepeated() => $pb.PbList<HatSeries>();
  @$core.pragma('dart2js:noInline')
  static HatSeries getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HatSeries>(create);
  static HatSeries? _defaultInstance;

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
  $core.String get seriesImage => $_getSZ(1);
  @$pb.TagNumber(2)
  set seriesImage($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSeriesImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeriesImage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get hatImage => $_getSZ(2);
  @$pb.TagNumber(3)
  set hatImage($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHatImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearHatImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get level => $_getIZ(3);
  @$pb.TagNumber(4)
  set level($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get levelTxt => $_getSZ(4);
  @$pb.TagNumber(5)
  set levelTxt($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLevelTxt() => $_has(4);
  @$pb.TagNumber(5)
  void clearLevelTxt() => clearField(5);
}

class HatPlayingData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatPlayingData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalSeconds',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'remainSeconds',
        $pb.PbFieldType.OU3)
    ..pc<HatMvpData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: HatMvpData.create)
    ..hasRequiredFields = false;

  HatPlayingData._() : super();
  factory HatPlayingData({
    $core.int? totalSeconds,
    $core.int? remainSeconds,
    $core.Iterable<HatMvpData>? data,
  }) {
    final _result = create();
    if (totalSeconds != null) {
      _result.totalSeconds = totalSeconds;
    }
    if (remainSeconds != null) {
      _result.remainSeconds = remainSeconds;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory HatPlayingData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatPlayingData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatPlayingData clone() => HatPlayingData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatPlayingData copyWith(void Function(HatPlayingData) updates) =>
      super.copyWith((message) => updates(message as HatPlayingData))
          as HatPlayingData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatPlayingData create() => HatPlayingData._();
  HatPlayingData createEmptyInstance() => create();
  static $pb.PbList<HatPlayingData> createRepeated() =>
      $pb.PbList<HatPlayingData>();
  @$core.pragma('dart2js:noInline')
  static HatPlayingData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatPlayingData>(create);
  static HatPlayingData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalSeconds => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalSeconds($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTotalSeconds() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalSeconds() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get remainSeconds => $_getIZ(1);
  @$pb.TagNumber(2)
  set remainSeconds($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRemainSeconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemainSeconds() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<HatMvpData> get data => $_getList(2);
}

class HatMvpData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatMvpData',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num')
    ..hasRequiredFields = false;

  HatMvpData._() : super();
  factory HatMvpData({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
    $core.String? num,
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
    if (num != null) {
      _result.num = num;
    }
    return _result;
  }
  factory HatMvpData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatMvpData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatMvpData clone() => HatMvpData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatMvpData copyWith(void Function(HatMvpData) updates) =>
      super.copyWith((message) => updates(message as HatMvpData))
          as HatMvpData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatMvpData create() => HatMvpData._();
  HatMvpData createEmptyInstance() => create();
  static $pb.PbList<HatMvpData> createRepeated() => $pb.PbList<HatMvpData>();
  @$core.pragma('dart2js:noInline')
  static HatMvpData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatMvpData>(create);
  static HatMvpData? _defaultInstance;

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
  $core.String get num => $_getSZ(3);
  @$pb.TagNumber(4)
  set num($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearNum() => clearField(4);
}

class ResHatRandom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHatRandom',
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
    ..aOM<HatRandomData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HatRandomData.create)
    ..hasRequiredFields = false;

  ResHatRandom._() : super();
  factory ResHatRandom({
    $core.bool? success,
    $core.String? message,
    HatRandomData? data,
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
  factory ResHatRandom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHatRandom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHatRandom clone() => ResHatRandom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHatRandom copyWith(void Function(ResHatRandom) updates) =>
      super.copyWith((message) => updates(message as ResHatRandom))
          as ResHatRandom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHatRandom create() => ResHatRandom._();
  ResHatRandom createEmptyInstance() => create();
  static $pb.PbList<ResHatRandom> createRepeated() =>
      $pb.PbList<ResHatRandom>();
  @$core.pragma('dart2js:noInline')
  static ResHatRandom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHatRandom>(create);
  static ResHatRandom? _defaultInstance;

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
  HatRandomData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HatRandomData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HatRandomData ensureData() => $_ensure(2);
}

class HatRandomData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HatRandomData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<HatSeries>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hat',
        $pb.PbFieldType.PM,
        subBuilder: HatSeries.create)
    ..hasRequiredFields = false;

  HatRandomData._() : super();
  factory HatRandomData({
    $core.Iterable<HatSeries>? hat,
  }) {
    final _result = create();
    if (hat != null) {
      _result.hat.addAll(hat);
    }
    return _result;
  }
  factory HatRandomData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HatRandomData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HatRandomData clone() => HatRandomData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HatRandomData copyWith(void Function(HatRandomData) updates) =>
      super.copyWith((message) => updates(message as HatRandomData))
          as HatRandomData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HatRandomData create() => HatRandomData._();
  HatRandomData createEmptyInstance() => create();
  static $pb.PbList<HatRandomData> createRepeated() =>
      $pb.PbList<HatRandomData>();
  @$core.pragma('dart2js:noInline')
  static HatRandomData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HatRandomData>(create);
  static HatRandomData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<HatSeries> get hat => $_getList(0);
}

class ResHatMerge extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHatMerge',
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
    ..aOM<$0.HatActivityRewardCommodity>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: $0.HatActivityRewardCommodity.create)
    ..hasRequiredFields = false;

  ResHatMerge._() : super();
  factory ResHatMerge({
    $core.bool? success,
    $core.String? message,
    $0.HatActivityRewardCommodity? data,
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
  factory ResHatMerge.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHatMerge.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHatMerge clone() => ResHatMerge()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHatMerge copyWith(void Function(ResHatMerge) updates) =>
      super.copyWith((message) => updates(message as ResHatMerge))
          as ResHatMerge; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHatMerge create() => ResHatMerge._();
  ResHatMerge createEmptyInstance() => create();
  static $pb.PbList<ResHatMerge> createRepeated() => $pb.PbList<ResHatMerge>();
  @$core.pragma('dart2js:noInline')
  static ResHatMerge getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHatMerge>(create);
  static ResHatMerge? _defaultInstance;

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
  $0.HatActivityRewardCommodity get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($0.HatActivityRewardCommodity v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  $0.HatActivityRewardCommodity ensureData() => $_ensure(2);
}
