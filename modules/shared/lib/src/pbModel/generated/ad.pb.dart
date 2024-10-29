///
//  Generated code. Do not modify.
//  source: ad.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'ad.pbenum.dart';

export 'ad.pbenum.dart';

class AdScreenAdData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AdScreenAdData',
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
            : 'image')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..hasRequiredFields = false;

  AdScreenAdData._() : super();
  factory AdScreenAdData({
    $core.int? id,
    $core.String? image,
    $core.int? width,
    $core.int? height,
    $core.int? duration,
    $core.String? url,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (image != null) {
      _result.image = image;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory AdScreenAdData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AdScreenAdData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AdScreenAdData clone() => AdScreenAdData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AdScreenAdData copyWith(void Function(AdScreenAdData) updates) =>
      super.copyWith((message) => updates(message as AdScreenAdData))
          as AdScreenAdData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AdScreenAdData create() => AdScreenAdData._();
  AdScreenAdData createEmptyInstance() => create();
  static $pb.PbList<AdScreenAdData> createRepeated() =>
      $pb.PbList<AdScreenAdData>();
  @$core.pragma('dart2js:noInline')
  static AdScreenAdData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AdScreenAdData>(create);
  static AdScreenAdData? _defaultInstance;

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
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(2)
  set image($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get duration => $_getIZ(4);
  @$pb.TagNumber(5)
  set duration($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuration() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get url => $_getSZ(5);
  @$pb.TagNumber(6)
  set url($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearUrl() => clearField(6);
}

class AdScreenAudioData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AdScreenAudioData',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nickname')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hotWord')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audioDuration',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AdScreenAudioData._() : super();
  factory AdScreenAudioData({
    $core.int? id,
    $core.int? uid,
    $core.String? icon,
    $core.String? nickname,
    $core.String? hotWord,
    $core.int? audioDuration,
    $core.String? url,
    $core.int? duration,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (nickname != null) {
      _result.nickname = nickname;
    }
    if (hotWord != null) {
      _result.hotWord = hotWord;
    }
    if (audioDuration != null) {
      _result.audioDuration = audioDuration;
    }
    if (url != null) {
      _result.url = url;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    return _result;
  }
  factory AdScreenAudioData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AdScreenAudioData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AdScreenAudioData clone() => AdScreenAudioData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AdScreenAudioData copyWith(void Function(AdScreenAudioData) updates) =>
      super.copyWith((message) => updates(message as AdScreenAudioData))
          as AdScreenAudioData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AdScreenAudioData create() => AdScreenAudioData._();
  AdScreenAudioData createEmptyInstance() => create();
  static $pb.PbList<AdScreenAudioData> createRepeated() =>
      $pb.PbList<AdScreenAudioData>();
  @$core.pragma('dart2js:noInline')
  static AdScreenAudioData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AdScreenAudioData>(create);
  static AdScreenAudioData? _defaultInstance;

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
  $core.int get uid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

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
  $core.String get nickname => $_getSZ(3);
  @$pb.TagNumber(4)
  set nickname($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNickname() => $_has(3);
  @$pb.TagNumber(4)
  void clearNickname() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get hotWord => $_getSZ(4);
  @$pb.TagNumber(5)
  set hotWord($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHotWord() => $_has(4);
  @$pb.TagNumber(5)
  void clearHotWord() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get audioDuration => $_getIZ(5);
  @$pb.TagNumber(6)
  set audioDuration($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAudioDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearAudioDuration() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get url => $_getSZ(6);
  @$pb.TagNumber(7)
  set url($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get duration => $_getIZ(7);
  @$pb.TagNumber(8)
  set duration($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDuration() => $_has(7);
  @$pb.TagNumber(8)
  void clearDuration() => clearField(8);
}

class ResAdScreenAdV2 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAdScreenAdV2',
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
    ..aOM<AdScreenData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AdScreenData.create)
    ..hasRequiredFields = false;

  ResAdScreenAdV2._() : super();
  factory ResAdScreenAdV2({
    $core.bool? success,
    $core.String? msg,
    AdScreenData? data,
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
  factory ResAdScreenAdV2.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAdScreenAdV2.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAdScreenAdV2 clone() => ResAdScreenAdV2()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAdScreenAdV2 copyWith(void Function(ResAdScreenAdV2) updates) =>
      super.copyWith((message) => updates(message as ResAdScreenAdV2))
          as ResAdScreenAdV2; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAdScreenAdV2 create() => ResAdScreenAdV2._();
  ResAdScreenAdV2 createEmptyInstance() => create();
  static $pb.PbList<ResAdScreenAdV2> createRepeated() =>
      $pb.PbList<ResAdScreenAdV2>();
  @$core.pragma('dart2js:noInline')
  static ResAdScreenAdV2 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAdScreenAdV2>(create);
  static ResAdScreenAdV2? _defaultInstance;

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
  AdScreenData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AdScreenData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AdScreenData ensureData() => $_ensure(2);
}

class AdScreenData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AdScreenData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..e<AdScreenType>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'adType',
        $pb.PbFieldType.OE,
        defaultOrMaker: AdScreenType.AdScreenNone,
        valueOf: AdScreenType.valueOf,
        enumValues: AdScreenType.values)
    ..aOM<AdScreenAdData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'adData',
        subBuilder: AdScreenAdData.create)
    ..aOM<AdScreenAudioData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audioData',
        subBuilder: AdScreenAudioData.create)
    ..hasRequiredFields = false;

  AdScreenData._() : super();
  factory AdScreenData({
    AdScreenType? adType,
    AdScreenAdData? adData,
    AdScreenAudioData? audioData,
  }) {
    final _result = create();
    if (adType != null) {
      _result.adType = adType;
    }
    if (adData != null) {
      _result.adData = adData;
    }
    if (audioData != null) {
      _result.audioData = audioData;
    }
    return _result;
  }
  factory AdScreenData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AdScreenData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AdScreenData clone() => AdScreenData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AdScreenData copyWith(void Function(AdScreenData) updates) =>
      super.copyWith((message) => updates(message as AdScreenData))
          as AdScreenData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AdScreenData create() => AdScreenData._();
  AdScreenData createEmptyInstance() => create();
  static $pb.PbList<AdScreenData> createRepeated() =>
      $pb.PbList<AdScreenData>();
  @$core.pragma('dart2js:noInline')
  static AdScreenData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AdScreenData>(create);
  static AdScreenData? _defaultInstance;

  @$pb.TagNumber(1)
  AdScreenType get adType => $_getN(0);
  @$pb.TagNumber(1)
  set adType(AdScreenType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAdType() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdType() => clearField(1);

  @$pb.TagNumber(2)
  AdScreenAdData get adData => $_getN(1);
  @$pb.TagNumber(2)
  set adData(AdScreenAdData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAdData() => $_has(1);
  @$pb.TagNumber(2)
  void clearAdData() => clearField(2);
  @$pb.TagNumber(2)
  AdScreenAdData ensureAdData() => $_ensure(1);

  @$pb.TagNumber(3)
  AdScreenAudioData get audioData => $_getN(2);
  @$pb.TagNumber(3)
  set audioData(AdScreenAudioData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAudioData() => $_has(2);
  @$pb.TagNumber(3)
  void clearAudioData() => clearField(3);
  @$pb.TagNumber(3)
  AdScreenAudioData ensureAudioData() => $_ensure(2);
}
