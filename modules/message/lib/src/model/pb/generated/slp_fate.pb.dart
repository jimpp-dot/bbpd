///
//  Generated code. Do not modify.
//  source: slp_fate.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResFateMatch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResFateMatch',
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
    ..aOM<FateMatchData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: FateMatchData.create)
    ..hasRequiredFields = false;

  ResFateMatch._() : super();
  factory ResFateMatch({
    $core.bool? success,
    $core.String? msg,
    FateMatchData? data,
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
  factory ResFateMatch.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResFateMatch.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResFateMatch clone() => ResFateMatch()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResFateMatch copyWith(void Function(ResFateMatch) updates) =>
      super.copyWith((message) => updates(message as ResFateMatch))
          as ResFateMatch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResFateMatch create() => ResFateMatch._();
  ResFateMatch createEmptyInstance() => create();
  static $pb.PbList<ResFateMatch> createRepeated() =>
      $pb.PbList<ResFateMatch>();
  @$core.pragma('dart2js:noInline')
  static ResFateMatch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResFateMatch>(create);
  static ResFateMatch? _defaultInstance;

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
  FateMatchData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(FateMatchData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  FateMatchData ensureData() => $_ensure(2);
}

class FateMatchData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FateMatchData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<FateCard>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cards',
        $pb.PbFieldType.PM,
        subBuilder: FateCard.create)
    ..aOM<FateCard>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'myCard',
        subBuilder: FateCard.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'autoPlayAudio',
        protoName: 'autoPlayAudio')
    ..hasRequiredFields = false;

  FateMatchData._() : super();
  factory FateMatchData({
    $core.Iterable<FateCard>? cards,
    FateCard? myCard,
    $core.int? rid,
    $core.bool? autoPlayAudio,
  }) {
    final _result = create();
    if (cards != null) {
      _result.cards.addAll(cards);
    }
    if (myCard != null) {
      _result.myCard = myCard;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (autoPlayAudio != null) {
      _result.autoPlayAudio = autoPlayAudio;
    }
    return _result;
  }
  factory FateMatchData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FateMatchData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FateMatchData clone() => FateMatchData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FateMatchData copyWith(void Function(FateMatchData) updates) =>
      super.copyWith((message) => updates(message as FateMatchData))
          as FateMatchData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FateMatchData create() => FateMatchData._();
  FateMatchData createEmptyInstance() => create();
  static $pb.PbList<FateMatchData> createRepeated() =>
      $pb.PbList<FateMatchData>();
  @$core.pragma('dart2js:noInline')
  static FateMatchData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FateMatchData>(create);
  static FateMatchData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FateCard> get cards => $_getList(0);

  @$pb.TagNumber(2)
  FateCard get myCard => $_getN(1);
  @$pb.TagNumber(2)
  set myCard(FateCard v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMyCard() => $_has(1);
  @$pb.TagNumber(2)
  void clearMyCard() => clearField(2);
  @$pb.TagNumber(2)
  FateCard ensureMyCard() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get rid => $_getIZ(2);
  @$pb.TagNumber(3)
  set rid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRid() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get autoPlayAudio => $_getBF(3);
  @$pb.TagNumber(4)
  set autoPlayAudio($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAutoPlayAudio() => $_has(3);
  @$pb.TagNumber(4)
  void clearAutoPlayAudio() => clearField(4);
}

class FateCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FateCard',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pPS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'photos')
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
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDatelineDiff')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'distance')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audio')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration')
    ..pPS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tags')
    ..pPS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friendTags')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'match',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOB(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isSpecMatch')
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.OU3)
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'industry')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'education')
    ..hasRequiredFields = false;

  FateCard._() : super();
  factory FateCard({
    $core.Iterable<$core.String>? photos,
    $core.String? name,
    $core.int? uid,
    $core.int? age,
    $core.int? sex,
    $core.int? onlineStatus,
    $core.String? onlineDatelineDiff,
    $core.String? distance,
    $core.String? audio,
    $core.String? duration,
    $core.Iterable<$core.String>? tags,
    $core.Iterable<$core.String>? friendTags,
    $core.int? match,
    $core.int? rid,
    $core.bool? isSpecMatch,
    $core.int? height,
    $core.String? industry,
    $core.String? education,
  }) {
    final _result = create();
    if (photos != null) {
      _result.photos.addAll(photos);
    }
    if (name != null) {
      _result.name = name;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (age != null) {
      _result.age = age;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (onlineDatelineDiff != null) {
      _result.onlineDatelineDiff = onlineDatelineDiff;
    }
    if (distance != null) {
      _result.distance = distance;
    }
    if (audio != null) {
      _result.audio = audio;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    if (friendTags != null) {
      _result.friendTags.addAll(friendTags);
    }
    if (match != null) {
      _result.match = match;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (isSpecMatch != null) {
      _result.isSpecMatch = isSpecMatch;
    }
    if (height != null) {
      _result.height = height;
    }
    if (industry != null) {
      _result.industry = industry;
    }
    if (education != null) {
      _result.education = education;
    }
    return _result;
  }
  factory FateCard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FateCard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FateCard clone() => FateCard()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FateCard copyWith(void Function(FateCard) updates) =>
      super.copyWith((message) => updates(message as FateCard))
          as FateCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FateCard create() => FateCard._();
  FateCard createEmptyInstance() => create();
  static $pb.PbList<FateCard> createRepeated() => $pb.PbList<FateCard>();
  @$core.pragma('dart2js:noInline')
  static FateCard getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FateCard>(create);
  static FateCard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get photos => $_getList(0);

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
  $core.int get age => $_getIZ(3);
  @$pb.TagNumber(4)
  set age($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAge() => $_has(3);
  @$pb.TagNumber(4)
  void clearAge() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get sex => $_getIZ(4);
  @$pb.TagNumber(5)
  set sex($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSex() => $_has(4);
  @$pb.TagNumber(5)
  void clearSex() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get onlineStatus => $_getIZ(5);
  @$pb.TagNumber(6)
  set onlineStatus($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOnlineStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnlineStatus() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get onlineDatelineDiff => $_getSZ(6);
  @$pb.TagNumber(7)
  set onlineDatelineDiff($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOnlineDatelineDiff() => $_has(6);
  @$pb.TagNumber(7)
  void clearOnlineDatelineDiff() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get distance => $_getSZ(7);
  @$pb.TagNumber(8)
  set distance($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDistance() => $_has(7);
  @$pb.TagNumber(8)
  void clearDistance() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get audio => $_getSZ(8);
  @$pb.TagNumber(9)
  set audio($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAudio() => $_has(8);
  @$pb.TagNumber(9)
  void clearAudio() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get duration => $_getSZ(9);
  @$pb.TagNumber(10)
  set duration($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDuration() => $_has(9);
  @$pb.TagNumber(10)
  void clearDuration() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<$core.String> get tags => $_getList(10);

  @$pb.TagNumber(12)
  $core.List<$core.String> get friendTags => $_getList(11);

  @$pb.TagNumber(13)
  $core.int get match => $_getIZ(12);
  @$pb.TagNumber(13)
  set match($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasMatch() => $_has(12);
  @$pb.TagNumber(13)
  void clearMatch() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get rid => $_getIZ(13);
  @$pb.TagNumber(14)
  set rid($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasRid() => $_has(13);
  @$pb.TagNumber(14)
  void clearRid() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get isSpecMatch => $_getBF(14);
  @$pb.TagNumber(15)
  set isSpecMatch($core.bool v) {
    $_setBool(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasIsSpecMatch() => $_has(14);
  @$pb.TagNumber(15)
  void clearIsSpecMatch() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get height => $_getIZ(15);
  @$pb.TagNumber(16)
  set height($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasHeight() => $_has(15);
  @$pb.TagNumber(16)
  void clearHeight() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get industry => $_getSZ(16);
  @$pb.TagNumber(17)
  set industry($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasIndustry() => $_has(16);
  @$pb.TagNumber(17)
  void clearIndustry() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get education => $_getSZ(17);
  @$pb.TagNumber(18)
  set education($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasEducation() => $_has(17);
  @$pb.TagNumber(18)
  void clearEducation() => clearField(18);
}

class ResFateLike extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResFateLike',
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
    ..hasRequiredFields = false;

  ResFateLike._() : super();
  factory ResFateLike({
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
  factory ResFateLike.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResFateLike.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResFateLike clone() => ResFateLike()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResFateLike copyWith(void Function(ResFateLike) updates) =>
      super.copyWith((message) => updates(message as ResFateLike))
          as ResFateLike; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResFateLike create() => ResFateLike._();
  ResFateLike createEmptyInstance() => create();
  static $pb.PbList<ResFateLike> createRepeated() => $pb.PbList<ResFateLike>();
  @$core.pragma('dart2js:noInline')
  static ResFateLike getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResFateLike>(create);
  static ResFateLike? _defaultInstance;

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
