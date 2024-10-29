///
//  Generated code. Do not modify.
//  source: grabmic2.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'grabmic2.pbenum.dart';

export 'grabmic2.pbenum.dart';

class GrabMicToken extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicToken',
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
            : 'sid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vvc',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
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
            : 'isTurn',
        $pb.PbFieldType.OU3,
        protoName: 'isTurn')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'turnIndex',
        $pb.PbFieldType.OU3,
        protoName: 'turnIndex')
    ..hasRequiredFields = false;

  GrabMicToken._() : super();
  factory GrabMicToken({
    $core.int? uid,
    $core.int? position,
    $core.int? sid,
    $core.int? version,
    $core.int? vvc,
    $core.int? rid,
    $core.String? name,
    $core.String? icon,
    $core.int? isTurn,
    $core.int? turnIndex,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (position != null) {
      _result.position = position;
    }
    if (sid != null) {
      _result.sid = sid;
    }
    if (version != null) {
      _result.version = version;
    }
    if (vvc != null) {
      _result.vvc = vvc;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (isTurn != null) {
      _result.isTurn = isTurn;
    }
    if (turnIndex != null) {
      _result.turnIndex = turnIndex;
    }
    return _result;
  }
  factory GrabMicToken.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicToken.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicToken clone() => GrabMicToken()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicToken copyWith(void Function(GrabMicToken) updates) =>
      super.copyWith((message) => updates(message as GrabMicToken))
          as GrabMicToken; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicToken create() => GrabMicToken._();
  GrabMicToken createEmptyInstance() => create();
  static $pb.PbList<GrabMicToken> createRepeated() =>
      $pb.PbList<GrabMicToken>();
  @$core.pragma('dart2js:noInline')
  static GrabMicToken getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicToken>(create);
  static GrabMicToken? _defaultInstance;

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
  $core.int get sid => $_getIZ(2);
  @$pb.TagNumber(3)
  set sid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSid() => $_has(2);
  @$pb.TagNumber(3)
  void clearSid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get version => $_getIZ(3);
  @$pb.TagNumber(4)
  set version($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearVersion() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get vvc => $_getIZ(4);
  @$pb.TagNumber(5)
  set vvc($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasVvc() => $_has(4);
  @$pb.TagNumber(5)
  void clearVvc() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get rid => $_getIZ(5);
  @$pb.TagNumber(6)
  set rid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRid() => $_has(5);
  @$pb.TagNumber(6)
  void clearRid() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get name => $_getSZ(6);
  @$pb.TagNumber(7)
  set name($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasName() => $_has(6);
  @$pb.TagNumber(7)
  void clearName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get icon => $_getSZ(7);
  @$pb.TagNumber(8)
  set icon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearIcon() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get isTurn => $_getIZ(8);
  @$pb.TagNumber(9)
  set isTurn($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasIsTurn() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsTurn() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get turnIndex => $_getIZ(9);
  @$pb.TagNumber(10)
  set turnIndex($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTurnIndex() => $_has(9);
  @$pb.TagNumber(10)
  void clearTurnIndex() => clearField(10);
}

class GrabMicBaseMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicBaseMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sid',
        $pb.PbFieldType.OU3)
    ..e<GrabMicState>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OE,
        defaultOrMaker: GrabMicState.UnknownState,
        valueOf: GrabMicState.valueOf,
        enumValues: GrabMicState.values)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stageEndLine',
        $pb.PbFieldType.OU3,
        protoName: 'stageEndLine')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentStageRunning',
        $pb.PbFieldType.OU3,
        protoName: 'currentStageRunning')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vvc',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grabVersion',
        $pb.PbFieldType.OU3,
        protoName: 'grabVersion')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GrabMicBaseMessage._() : super();
  factory GrabMicBaseMessage({
    $core.int? sid,
    GrabMicState? state,
    $core.int? version,
    $core.int? stageEndLine,
    $core.int? currentStageRunning,
    $core.int? vvc,
    $core.int? grabVersion,
    $core.int? count,
  }) {
    final _result = create();
    if (sid != null) {
      _result.sid = sid;
    }
    if (state != null) {
      _result.state = state;
    }
    if (version != null) {
      _result.version = version;
    }
    if (stageEndLine != null) {
      _result.stageEndLine = stageEndLine;
    }
    if (currentStageRunning != null) {
      _result.currentStageRunning = currentStageRunning;
    }
    if (vvc != null) {
      _result.vvc = vvc;
    }
    if (grabVersion != null) {
      _result.grabVersion = grabVersion;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory GrabMicBaseMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicBaseMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicBaseMessage clone() => GrabMicBaseMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicBaseMessage copyWith(void Function(GrabMicBaseMessage) updates) =>
      super.copyWith((message) => updates(message as GrabMicBaseMessage))
          as GrabMicBaseMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicBaseMessage create() => GrabMicBaseMessage._();
  GrabMicBaseMessage createEmptyInstance() => create();
  static $pb.PbList<GrabMicBaseMessage> createRepeated() =>
      $pb.PbList<GrabMicBaseMessage>();
  @$core.pragma('dart2js:noInline')
  static GrabMicBaseMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicBaseMessage>(create);
  static GrabMicBaseMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sid => $_getIZ(0);
  @$pb.TagNumber(1)
  set sid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSid() => $_has(0);
  @$pb.TagNumber(1)
  void clearSid() => clearField(1);

  @$pb.TagNumber(2)
  GrabMicState get state => $_getN(1);
  @$pb.TagNumber(2)
  set state(GrabMicState v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(3)
  set version($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get stageEndLine => $_getIZ(3);
  @$pb.TagNumber(4)
  set stageEndLine($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStageEndLine() => $_has(3);
  @$pb.TagNumber(4)
  void clearStageEndLine() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get currentStageRunning => $_getIZ(4);
  @$pb.TagNumber(5)
  set currentStageRunning($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCurrentStageRunning() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentStageRunning() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get vvc => $_getIZ(5);
  @$pb.TagNumber(6)
  set vvc($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVvc() => $_has(5);
  @$pb.TagNumber(6)
  void clearVvc() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get grabVersion => $_getIZ(6);
  @$pb.TagNumber(7)
  set grabVersion($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGrabVersion() => $_has(6);
  @$pb.TagNumber(7)
  void clearGrabVersion() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get count => $_getIZ(7);
  @$pb.TagNumber(8)
  set count($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearCount() => clearField(8);
}

class GrabMicSongLyricPart extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicSongLyricPart',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pPS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'part')
    ..hasRequiredFields = false;

  GrabMicSongLyricPart._() : super();
  factory GrabMicSongLyricPart({
    $core.Iterable<$core.String>? part,
  }) {
    final _result = create();
    if (part != null) {
      _result.part.addAll(part);
    }
    return _result;
  }
  factory GrabMicSongLyricPart.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicSongLyricPart.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicSongLyricPart clone() =>
      GrabMicSongLyricPart()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicSongLyricPart copyWith(void Function(GrabMicSongLyricPart) updates) =>
      super.copyWith((message) => updates(message as GrabMicSongLyricPart))
          as GrabMicSongLyricPart; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicSongLyricPart create() => GrabMicSongLyricPart._();
  GrabMicSongLyricPart createEmptyInstance() => create();
  static $pb.PbList<GrabMicSongLyricPart> createRepeated() =>
      $pb.PbList<GrabMicSongLyricPart>();
  @$core.pragma('dart2js:noInline')
  static GrabMicSongLyricPart getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicSongLyricPart>(create);
  static GrabMicSongLyricPart? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get part => $_getList(0);
}

class GrabMicSongLyric extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicSongLyric',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GrabMicSongLyricPart>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lyric',
        $pb.PbFieldType.PM,
        subBuilder: GrabMicSongLyricPart.create)
    ..hasRequiredFields = false;

  GrabMicSongLyric._() : super();
  factory GrabMicSongLyric({
    $core.Iterable<GrabMicSongLyricPart>? lyric,
  }) {
    final _result = create();
    if (lyric != null) {
      _result.lyric.addAll(lyric);
    }
    return _result;
  }
  factory GrabMicSongLyric.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicSongLyric.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicSongLyric clone() => GrabMicSongLyric()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicSongLyric copyWith(void Function(GrabMicSongLyric) updates) =>
      super.copyWith((message) => updates(message as GrabMicSongLyric))
          as GrabMicSongLyric; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicSongLyric create() => GrabMicSongLyric._();
  GrabMicSongLyric createEmptyInstance() => create();
  static $pb.PbList<GrabMicSongLyric> createRepeated() =>
      $pb.PbList<GrabMicSongLyric>();
  @$core.pragma('dart2js:noInline')
  static GrabMicSongLyric getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicSongLyric>(create);
  static GrabMicSongLyric? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GrabMicSongLyricPart> get lyric => $_getList(0);
}

class GrabMicSongInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicSongInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Id',
        $pb.PbFieldType.OU3,
        protoName: 'Id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerName',
        protoName: 'singerName')
    ..aOM<GrabMicSongLyric>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lyric',
        subBuilder: GrabMicSongLyric.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploaderUid',
        $pb.PbFieldType.OU3,
        protoName: 'uploaderUid')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploaderName',
        protoName: 'uploaderName')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploaderIcon',
        protoName: 'uploaderIcon')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mode',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countGood',
        $pb.PbFieldType.OU3,
        protoName: 'countGood')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countBad',
        $pb.PbFieldType.OU3,
        protoName: 'countBad')
    ..hasRequiredFields = false;

  GrabMicSongInfo._() : super();
  factory GrabMicSongInfo({
    $core.int? id,
    $core.String? name,
    $core.String? singerName,
    GrabMicSongLyric? lyric,
    $core.int? duration,
    $core.int? uploaderUid,
    $core.String? uploaderName,
    $core.String? uploaderIcon,
    $core.String? tag,
    $core.int? mode,
    $core.String? url,
    $core.int? countGood,
    $core.int? countBad,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (singerName != null) {
      _result.singerName = singerName;
    }
    if (lyric != null) {
      _result.lyric = lyric;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (uploaderUid != null) {
      _result.uploaderUid = uploaderUid;
    }
    if (uploaderName != null) {
      _result.uploaderName = uploaderName;
    }
    if (uploaderIcon != null) {
      _result.uploaderIcon = uploaderIcon;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (url != null) {
      _result.url = url;
    }
    if (countGood != null) {
      _result.countGood = countGood;
    }
    if (countBad != null) {
      _result.countBad = countBad;
    }
    return _result;
  }
  factory GrabMicSongInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicSongInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicSongInfo clone() => GrabMicSongInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicSongInfo copyWith(void Function(GrabMicSongInfo) updates) =>
      super.copyWith((message) => updates(message as GrabMicSongInfo))
          as GrabMicSongInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicSongInfo create() => GrabMicSongInfo._();
  GrabMicSongInfo createEmptyInstance() => create();
  static $pb.PbList<GrabMicSongInfo> createRepeated() =>
      $pb.PbList<GrabMicSongInfo>();
  @$core.pragma('dart2js:noInline')
  static GrabMicSongInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicSongInfo>(create);
  static GrabMicSongInfo? _defaultInstance;

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
  $core.String get singerName => $_getSZ(2);
  @$pb.TagNumber(3)
  set singerName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSingerName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSingerName() => clearField(3);

  @$pb.TagNumber(4)
  GrabMicSongLyric get lyric => $_getN(3);
  @$pb.TagNumber(4)
  set lyric(GrabMicSongLyric v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLyric() => $_has(3);
  @$pb.TagNumber(4)
  void clearLyric() => clearField(4);
  @$pb.TagNumber(4)
  GrabMicSongLyric ensureLyric() => $_ensure(3);

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
  $core.int get uploaderUid => $_getIZ(5);
  @$pb.TagNumber(6)
  set uploaderUid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUploaderUid() => $_has(5);
  @$pb.TagNumber(6)
  void clearUploaderUid() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get uploaderName => $_getSZ(6);
  @$pb.TagNumber(7)
  set uploaderName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUploaderName() => $_has(6);
  @$pb.TagNumber(7)
  void clearUploaderName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get uploaderIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set uploaderIcon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUploaderIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearUploaderIcon() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get tag => $_getSZ(8);
  @$pb.TagNumber(9)
  set tag($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTag() => $_has(8);
  @$pb.TagNumber(9)
  void clearTag() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get mode => $_getIZ(9);
  @$pb.TagNumber(10)
  set mode($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasMode() => $_has(9);
  @$pb.TagNumber(10)
  void clearMode() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get url => $_getSZ(10);
  @$pb.TagNumber(11)
  set url($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasUrl() => $_has(10);
  @$pb.TagNumber(11)
  void clearUrl() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get countGood => $_getIZ(11);
  @$pb.TagNumber(12)
  set countGood($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasCountGood() => $_has(11);
  @$pb.TagNumber(12)
  void clearCountGood() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get countBad => $_getIZ(12);
  @$pb.TagNumber(13)
  set countBad($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasCountBad() => $_has(12);
  @$pb.TagNumber(13)
  void clearCountBad() => clearField(13);
}

class GrabMicSceneGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicSceneGift',
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
        $pb.PbFieldType.OU3,
        protoName: 'giftId')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftType',
        protoName: 'giftType')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName',
        protoName: 'giftName')
    ..a<$core.double>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  GrabMicSceneGift._() : super();
  factory GrabMicSceneGift({
    $core.int? giftId,
    $core.String? giftType,
    $core.String? giftName,
    $core.double? price,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftType != null) {
      _result.giftType = giftType;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (price != null) {
      _result.price = price;
    }
    return _result;
  }
  factory GrabMicSceneGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicSceneGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicSceneGift clone() => GrabMicSceneGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicSceneGift copyWith(void Function(GrabMicSceneGift) updates) =>
      super.copyWith((message) => updates(message as GrabMicSceneGift))
          as GrabMicSceneGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicSceneGift create() => GrabMicSceneGift._();
  GrabMicSceneGift createEmptyInstance() => create();
  static $pb.PbList<GrabMicSceneGift> createRepeated() =>
      $pb.PbList<GrabMicSceneGift>();
  @$core.pragma('dart2js:noInline')
  static GrabMicSceneGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicSceneGift>(create);
  static GrabMicSceneGift? _defaultInstance;

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
  $core.String get giftType => $_getSZ(1);
  @$pb.TagNumber(2)
  set giftType($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftType() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get giftName => $_getSZ(2);
  @$pb.TagNumber(3)
  set giftName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftName() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftName() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get price => $_getN(3);
  @$pb.TagNumber(4)
  set price($core.double v) {
    $_setFloat(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => clearField(4);
}

class RespGrabMicConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGrabMicConfig',
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
    ..aOM<GrabMicMessage>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'body',
        subBuilder: GrabMicMessage.create)
    ..hasRequiredFields = false;

  RespGrabMicConfig._() : super();
  factory RespGrabMicConfig({
    $core.bool? success,
    $core.String? message,
    GrabMicMessage? body,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (body != null) {
      _result.body = body;
    }
    return _result;
  }
  factory RespGrabMicConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGrabMicConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGrabMicConfig clone() => RespGrabMicConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGrabMicConfig copyWith(void Function(RespGrabMicConfig) updates) =>
      super.copyWith((message) => updates(message as RespGrabMicConfig))
          as RespGrabMicConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGrabMicConfig create() => RespGrabMicConfig._();
  RespGrabMicConfig createEmptyInstance() => create();
  static $pb.PbList<RespGrabMicConfig> createRepeated() =>
      $pb.PbList<RespGrabMicConfig>();
  @$core.pragma('dart2js:noInline')
  static RespGrabMicConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGrabMicConfig>(create);
  static RespGrabMicConfig? _defaultInstance;

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
  GrabMicMessage get body => $_getN(2);
  @$pb.TagNumber(3)
  set body(GrabMicMessage v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBody() => $_has(2);
  @$pb.TagNumber(3)
  void clearBody() => clearField(3);
  @$pb.TagNumber(3)
  GrabMicMessage ensureBody() => $_ensure(2);
}

enum GrabMicMessage_Stage {
  start,
  play,
  grab,
  grabResult,
  sing,
  recognize,
  singResult,
  ending,
  next,
  notSet
}

class GrabMicMessage extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GrabMicMessage_Stage>
      _GrabMicMessage_StageByTag = {
    10: GrabMicMessage_Stage.start,
    11: GrabMicMessage_Stage.play,
    12: GrabMicMessage_Stage.grab,
    13: GrabMicMessage_Stage.grabResult,
    14: GrabMicMessage_Stage.sing,
    15: GrabMicMessage_Stage.recognize,
    16: GrabMicMessage_Stage.singResult,
    17: GrabMicMessage_Stage.ending,
    18: GrabMicMessage_Stage.next,
    0: GrabMicMessage_Stage.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 14, 15, 16, 17, 18])
    ..aOM<GrabMicBaseMessage>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'base',
        subBuilder: GrabMicBaseMessage.create)
    ..aOM<GrabMicSongInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentSong',
        protoName: 'currentSong',
        subBuilder: GrabMicSongInfo.create)
    ..aOM<GrabMicStageStart>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'start',
        subBuilder: GrabMicStageStart.create)
    ..aOM<GrabMicStageSongPlay>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'play',
        subBuilder: GrabMicStageSongPlay.create)
    ..aOM<GrabMicStageSongGrab>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grab',
        subBuilder: GrabMicStageSongGrab.create)
    ..aOM<GrabMicStageSongGrabResult>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grabResult',
        protoName: 'grabResult',
        subBuilder: GrabMicStageSongGrabResult.create)
    ..aOM<GrabMicStageSongSing>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sing',
        subBuilder: GrabMicStageSongSing.create)
    ..aOM<GrabMicStageSongRecognize>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recognize',
        subBuilder: GrabMicStageSongRecognize.create)
    ..aOM<GrabMicStageSingResult>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singResult',
        protoName: 'singResult',
        subBuilder: GrabMicStageSingResult.create)
    ..aOM<GrabMicStageEnding>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ending',
        subBuilder: GrabMicStageEnding.create)
    ..aOM<GrabMicStageSongNext>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'next',
        subBuilder: GrabMicStageSongNext.create)
    ..pc<UserList>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: UserList.create)
    ..hasRequiredFields = false;

  GrabMicMessage._() : super();
  factory GrabMicMessage({
    GrabMicBaseMessage? base,
    GrabMicSongInfo? currentSong,
    GrabMicStageStart? start,
    GrabMicStageSongPlay? play,
    GrabMicStageSongGrab? grab,
    GrabMicStageSongGrabResult? grabResult,
    GrabMicStageSongSing? sing,
    GrabMicStageSongRecognize? recognize,
    GrabMicStageSingResult? singResult,
    GrabMicStageEnding? ending,
    GrabMicStageSongNext? next,
    $core.Iterable<UserList>? list,
  }) {
    final _result = create();
    if (base != null) {
      _result.base = base;
    }
    if (currentSong != null) {
      _result.currentSong = currentSong;
    }
    if (start != null) {
      _result.start = start;
    }
    if (play != null) {
      _result.play = play;
    }
    if (grab != null) {
      _result.grab = grab;
    }
    if (grabResult != null) {
      _result.grabResult = grabResult;
    }
    if (sing != null) {
      _result.sing = sing;
    }
    if (recognize != null) {
      _result.recognize = recognize;
    }
    if (singResult != null) {
      _result.singResult = singResult;
    }
    if (ending != null) {
      _result.ending = ending;
    }
    if (next != null) {
      _result.next = next;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory GrabMicMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicMessage clone() => GrabMicMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicMessage copyWith(void Function(GrabMicMessage) updates) =>
      super.copyWith((message) => updates(message as GrabMicMessage))
          as GrabMicMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicMessage create() => GrabMicMessage._();
  GrabMicMessage createEmptyInstance() => create();
  static $pb.PbList<GrabMicMessage> createRepeated() =>
      $pb.PbList<GrabMicMessage>();
  @$core.pragma('dart2js:noInline')
  static GrabMicMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicMessage>(create);
  static GrabMicMessage? _defaultInstance;

  GrabMicMessage_Stage whichStage() =>
      _GrabMicMessage_StageByTag[$_whichOneof(0)]!;
  void clearStage() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  GrabMicBaseMessage get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(GrabMicBaseMessage v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  GrabMicBaseMessage ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  GrabMicSongInfo get currentSong => $_getN(1);
  @$pb.TagNumber(2)
  set currentSong(GrabMicSongInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCurrentSong() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentSong() => clearField(2);
  @$pb.TagNumber(2)
  GrabMicSongInfo ensureCurrentSong() => $_ensure(1);

  @$pb.TagNumber(10)
  GrabMicStageStart get start => $_getN(2);
  @$pb.TagNumber(10)
  set start(GrabMicStageStart v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasStart() => $_has(2);
  @$pb.TagNumber(10)
  void clearStart() => clearField(10);
  @$pb.TagNumber(10)
  GrabMicStageStart ensureStart() => $_ensure(2);

  @$pb.TagNumber(11)
  GrabMicStageSongPlay get play => $_getN(3);
  @$pb.TagNumber(11)
  set play(GrabMicStageSongPlay v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPlay() => $_has(3);
  @$pb.TagNumber(11)
  void clearPlay() => clearField(11);
  @$pb.TagNumber(11)
  GrabMicStageSongPlay ensurePlay() => $_ensure(3);

  @$pb.TagNumber(12)
  GrabMicStageSongGrab get grab => $_getN(4);
  @$pb.TagNumber(12)
  set grab(GrabMicStageSongGrab v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasGrab() => $_has(4);
  @$pb.TagNumber(12)
  void clearGrab() => clearField(12);
  @$pb.TagNumber(12)
  GrabMicStageSongGrab ensureGrab() => $_ensure(4);

  @$pb.TagNumber(13)
  GrabMicStageSongGrabResult get grabResult => $_getN(5);
  @$pb.TagNumber(13)
  set grabResult(GrabMicStageSongGrabResult v) {
    setField(13, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasGrabResult() => $_has(5);
  @$pb.TagNumber(13)
  void clearGrabResult() => clearField(13);
  @$pb.TagNumber(13)
  GrabMicStageSongGrabResult ensureGrabResult() => $_ensure(5);

  @$pb.TagNumber(14)
  GrabMicStageSongSing get sing => $_getN(6);
  @$pb.TagNumber(14)
  set sing(GrabMicStageSongSing v) {
    setField(14, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasSing() => $_has(6);
  @$pb.TagNumber(14)
  void clearSing() => clearField(14);
  @$pb.TagNumber(14)
  GrabMicStageSongSing ensureSing() => $_ensure(6);

  @$pb.TagNumber(15)
  GrabMicStageSongRecognize get recognize => $_getN(7);
  @$pb.TagNumber(15)
  set recognize(GrabMicStageSongRecognize v) {
    setField(15, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasRecognize() => $_has(7);
  @$pb.TagNumber(15)
  void clearRecognize() => clearField(15);
  @$pb.TagNumber(15)
  GrabMicStageSongRecognize ensureRecognize() => $_ensure(7);

  @$pb.TagNumber(16)
  GrabMicStageSingResult get singResult => $_getN(8);
  @$pb.TagNumber(16)
  set singResult(GrabMicStageSingResult v) {
    setField(16, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasSingResult() => $_has(8);
  @$pb.TagNumber(16)
  void clearSingResult() => clearField(16);
  @$pb.TagNumber(16)
  GrabMicStageSingResult ensureSingResult() => $_ensure(8);

  @$pb.TagNumber(17)
  GrabMicStageEnding get ending => $_getN(9);
  @$pb.TagNumber(17)
  set ending(GrabMicStageEnding v) {
    setField(17, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasEnding() => $_has(9);
  @$pb.TagNumber(17)
  void clearEnding() => clearField(17);
  @$pb.TagNumber(17)
  GrabMicStageEnding ensureEnding() => $_ensure(9);

  @$pb.TagNumber(18)
  GrabMicStageSongNext get next => $_getN(10);
  @$pb.TagNumber(18)
  set next(GrabMicStageSongNext v) {
    setField(18, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasNext() => $_has(10);
  @$pb.TagNumber(18)
  void clearNext() => clearField(18);
  @$pb.TagNumber(18)
  GrabMicStageSongNext ensureNext() => $_ensure(10);

  @$pb.TagNumber(19)
  $core.List<UserList> get list => $_getList(11);
}

class GrabMicStageStart extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicStageStart',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  GrabMicStageStart._() : super();
  factory GrabMicStageStart() => create();
  factory GrabMicStageStart.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicStageStart.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicStageStart clone() => GrabMicStageStart()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicStageStart copyWith(void Function(GrabMicStageStart) updates) =>
      super.copyWith((message) => updates(message as GrabMicStageStart))
          as GrabMicStageStart; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicStageStart create() => GrabMicStageStart._();
  GrabMicStageStart createEmptyInstance() => create();
  static $pb.PbList<GrabMicStageStart> createRepeated() =>
      $pb.PbList<GrabMicStageStart>();
  @$core.pragma('dart2js:noInline')
  static GrabMicStageStart getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicStageStart>(create);
  static GrabMicStageStart? _defaultInstance;
}

class GrabMicStageSongPlay extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicStageSongPlay',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countDown',
        $pb.PbFieldType.O3,
        protoName: 'countDown')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  GrabMicStageSongPlay._() : super();
  factory GrabMicStageSongPlay({
    $core.int? countDown,
    $core.int? duration,
  }) {
    final _result = create();
    if (countDown != null) {
      _result.countDown = countDown;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    return _result;
  }
  factory GrabMicStageSongPlay.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicStageSongPlay.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicStageSongPlay clone() =>
      GrabMicStageSongPlay()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicStageSongPlay copyWith(void Function(GrabMicStageSongPlay) updates) =>
      super.copyWith((message) => updates(message as GrabMicStageSongPlay))
          as GrabMicStageSongPlay; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicStageSongPlay create() => GrabMicStageSongPlay._();
  GrabMicStageSongPlay createEmptyInstance() => create();
  static $pb.PbList<GrabMicStageSongPlay> createRepeated() =>
      $pb.PbList<GrabMicStageSongPlay>();
  @$core.pragma('dart2js:noInline')
  static GrabMicStageSongPlay getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicStageSongPlay>(create);
  static GrabMicStageSongPlay? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get countDown => $_getIZ(0);
  @$pb.TagNumber(1)
  set countDown($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCountDown() => $_has(0);
  @$pb.TagNumber(1)
  void clearCountDown() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get duration => $_getIZ(1);
  @$pb.TagNumber(2)
  set duration($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => clearField(2);
}

class GrabMicStageSongGrab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicStageSongGrab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GrabMicToken>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tokens',
        $pb.PbFieldType.PM,
        subBuilder: GrabMicToken.create)
    ..hasRequiredFields = false;

  GrabMicStageSongGrab._() : super();
  factory GrabMicStageSongGrab({
    $core.Iterable<GrabMicToken>? tokens,
  }) {
    final _result = create();
    if (tokens != null) {
      _result.tokens.addAll(tokens);
    }
    return _result;
  }
  factory GrabMicStageSongGrab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicStageSongGrab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicStageSongGrab clone() =>
      GrabMicStageSongGrab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicStageSongGrab copyWith(void Function(GrabMicStageSongGrab) updates) =>
      super.copyWith((message) => updates(message as GrabMicStageSongGrab))
          as GrabMicStageSongGrab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicStageSongGrab create() => GrabMicStageSongGrab._();
  GrabMicStageSongGrab createEmptyInstance() => create();
  static $pb.PbList<GrabMicStageSongGrab> createRepeated() =>
      $pb.PbList<GrabMicStageSongGrab>();
  @$core.pragma('dart2js:noInline')
  static GrabMicStageSongGrab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicStageSongGrab>(create);
  static GrabMicStageSongGrab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GrabMicToken> get tokens => $_getList(0);
}

class GrabMicStageSongGrabResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicStageSongGrabResult',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GrabMicToken>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singers',
        $pb.PbFieldType.PM,
        subBuilder: GrabMicToken.create)
    ..e<GrabMicResult>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result',
        $pb.PbFieldType.OE,
        defaultOrMaker: GrabMicResult.Unknown,
        valueOf: GrabMicResult.valueOf,
        enumValues: GrabMicResult.values)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effectUrl',
        protoName: 'effectUrl')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..hasRequiredFields = false;

  GrabMicStageSongGrabResult._() : super();
  factory GrabMicStageSongGrabResult({
    $core.Iterable<GrabMicToken>? singers,
    GrabMicResult? result,
    $core.String? effectUrl,
    $core.String? description,
  }) {
    final _result = create();
    if (singers != null) {
      _result.singers.addAll(singers);
    }
    if (result != null) {
      _result.result = result;
    }
    if (effectUrl != null) {
      _result.effectUrl = effectUrl;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory GrabMicStageSongGrabResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicStageSongGrabResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicStageSongGrabResult clone() =>
      GrabMicStageSongGrabResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicStageSongGrabResult copyWith(
          void Function(GrabMicStageSongGrabResult) updates) =>
      super.copyWith(
              (message) => updates(message as GrabMicStageSongGrabResult))
          as GrabMicStageSongGrabResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicStageSongGrabResult create() => GrabMicStageSongGrabResult._();
  GrabMicStageSongGrabResult createEmptyInstance() => create();
  static $pb.PbList<GrabMicStageSongGrabResult> createRepeated() =>
      $pb.PbList<GrabMicStageSongGrabResult>();
  @$core.pragma('dart2js:noInline')
  static GrabMicStageSongGrabResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicStageSongGrabResult>(create);
  static GrabMicStageSongGrabResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GrabMicToken> get singers => $_getList(0);

  @$pb.TagNumber(2)
  GrabMicResult get result => $_getN(1);
  @$pb.TagNumber(2)
  set result(GrabMicResult v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get effectUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set effectUrl($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEffectUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearEffectUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);
}

class GrabMicStageSongSing extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicStageSongSing',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GrabMicToken>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singers',
        $pb.PbFieldType.PM,
        subBuilder: GrabMicToken.create)
    ..pc<GrabMicSceneGift>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gifts',
        $pb.PbFieldType.PM,
        subBuilder: GrabMicSceneGift.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GrabMicStageSongSing._() : super();
  factory GrabMicStageSongSing({
    $core.Iterable<GrabMicToken>? singers,
    $core.Iterable<GrabMicSceneGift>? gifts,
    $core.int? duration,
  }) {
    final _result = create();
    if (singers != null) {
      _result.singers.addAll(singers);
    }
    if (gifts != null) {
      _result.gifts.addAll(gifts);
    }
    if (duration != null) {
      _result.duration = duration;
    }
    return _result;
  }
  factory GrabMicStageSongSing.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicStageSongSing.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicStageSongSing clone() =>
      GrabMicStageSongSing()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicStageSongSing copyWith(void Function(GrabMicStageSongSing) updates) =>
      super.copyWith((message) => updates(message as GrabMicStageSongSing))
          as GrabMicStageSongSing; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicStageSongSing create() => GrabMicStageSongSing._();
  GrabMicStageSongSing createEmptyInstance() => create();
  static $pb.PbList<GrabMicStageSongSing> createRepeated() =>
      $pb.PbList<GrabMicStageSongSing>();
  @$core.pragma('dart2js:noInline')
  static GrabMicStageSongSing getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicStageSongSing>(create);
  static GrabMicStageSongSing? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GrabMicToken> get singers => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<GrabMicSceneGift> get gifts => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get duration => $_getIZ(2);
  @$pb.TagNumber(3)
  set duration($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => clearField(3);
}

class GrabMicStageSongRecognize extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicStageSongRecognize',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  GrabMicStageSongRecognize._() : super();
  factory GrabMicStageSongRecognize() => create();
  factory GrabMicStageSongRecognize.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicStageSongRecognize.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicStageSongRecognize clone() =>
      GrabMicStageSongRecognize()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicStageSongRecognize copyWith(
          void Function(GrabMicStageSongRecognize) updates) =>
      super.copyWith((message) => updates(message as GrabMicStageSongRecognize))
          as GrabMicStageSongRecognize; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicStageSongRecognize create() => GrabMicStageSongRecognize._();
  GrabMicStageSongRecognize createEmptyInstance() => create();
  static $pb.PbList<GrabMicStageSongRecognize> createRepeated() =>
      $pb.PbList<GrabMicStageSongRecognize>();
  @$core.pragma('dart2js:noInline')
  static GrabMicStageSongRecognize getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicStageSongRecognize>(create);
  static GrabMicStageSongRecognize? _defaultInstance;
}

class GrabMicStageSingResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicStageSingResult',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GrabMicToken>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tokens',
        $pb.PbFieldType.PM,
        subBuilder: GrabMicToken.create)
    ..e<GrabMicResult>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result',
        $pb.PbFieldType.OE,
        defaultOrMaker: GrabMicResult.Unknown,
        valueOf: GrabMicResult.valueOf,
        enumValues: GrabMicResult.values)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effect')
    ..hasRequiredFields = false;

  GrabMicStageSingResult._() : super();
  factory GrabMicStageSingResult({
    $core.Iterable<GrabMicToken>? tokens,
    GrabMicResult? result,
    $core.String? effect,
  }) {
    final _result = create();
    if (tokens != null) {
      _result.tokens.addAll(tokens);
    }
    if (result != null) {
      _result.result = result;
    }
    if (effect != null) {
      _result.effect = effect;
    }
    return _result;
  }
  factory GrabMicStageSingResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicStageSingResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicStageSingResult clone() =>
      GrabMicStageSingResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicStageSingResult copyWith(
          void Function(GrabMicStageSingResult) updates) =>
      super.copyWith((message) => updates(message as GrabMicStageSingResult))
          as GrabMicStageSingResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicStageSingResult create() => GrabMicStageSingResult._();
  GrabMicStageSingResult createEmptyInstance() => create();
  static $pb.PbList<GrabMicStageSingResult> createRepeated() =>
      $pb.PbList<GrabMicStageSingResult>();
  @$core.pragma('dart2js:noInline')
  static GrabMicStageSingResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicStageSingResult>(create);
  static GrabMicStageSingResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GrabMicToken> get tokens => $_getList(0);

  @$pb.TagNumber(2)
  GrabMicResult get result => $_getN(1);
  @$pb.TagNumber(2)
  set result(GrabMicResult v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get effect => $_getSZ(2);
  @$pb.TagNumber(3)
  set effect($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEffect() => $_has(2);
  @$pb.TagNumber(3)
  void clearEffect() => clearField(3);
}

class GrabMicStageSongNext extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicStageSongNext',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  GrabMicStageSongNext._() : super();
  factory GrabMicStageSongNext() => create();
  factory GrabMicStageSongNext.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicStageSongNext.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicStageSongNext clone() =>
      GrabMicStageSongNext()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicStageSongNext copyWith(void Function(GrabMicStageSongNext) updates) =>
      super.copyWith((message) => updates(message as GrabMicStageSongNext))
          as GrabMicStageSongNext; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicStageSongNext create() => GrabMicStageSongNext._();
  GrabMicStageSongNext createEmptyInstance() => create();
  static $pb.PbList<GrabMicStageSongNext> createRepeated() =>
      $pb.PbList<GrabMicStageSongNext>();
  @$core.pragma('dart2js:noInline')
  static GrabMicStageSongNext getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicStageSongNext>(create);
  static GrabMicStageSongNext? _defaultInstance;
}

class GrabMicStageEnding extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicStageEnding',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  GrabMicStageEnding._() : super();
  factory GrabMicStageEnding() => create();
  factory GrabMicStageEnding.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicStageEnding.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicStageEnding clone() => GrabMicStageEnding()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicStageEnding copyWith(void Function(GrabMicStageEnding) updates) =>
      super.copyWith((message) => updates(message as GrabMicStageEnding))
          as GrabMicStageEnding; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicStageEnding create() => GrabMicStageEnding._();
  GrabMicStageEnding createEmptyInstance() => create();
  static $pb.PbList<GrabMicStageEnding> createRepeated() =>
      $pb.PbList<GrabMicStageEnding>();
  @$core.pragma('dart2js:noInline')
  static GrabMicStageEnding getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicStageEnding>(create);
  static GrabMicStageEnding? _defaultInstance;
}

class GrabMicStageEnd extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicStageEnd',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  GrabMicStageEnd._() : super();
  factory GrabMicStageEnd() => create();
  factory GrabMicStageEnd.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicStageEnd.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicStageEnd clone() => GrabMicStageEnd()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicStageEnd copyWith(void Function(GrabMicStageEnd) updates) =>
      super.copyWith((message) => updates(message as GrabMicStageEnd))
          as GrabMicStageEnd; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicStageEnd create() => GrabMicStageEnd._();
  GrabMicStageEnd createEmptyInstance() => create();
  static $pb.PbList<GrabMicStageEnd> createRepeated() =>
      $pb.PbList<GrabMicStageEnd>();
  @$core.pragma('dart2js:noInline')
  static GrabMicStageEnd getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicStageEnd>(create);
  static GrabMicStageEnd? _defaultInstance;
}

class UserList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserList',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grabType',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightType')
    ..hasRequiredFields = false;

  UserList._() : super();
  factory UserList({
    $core.int? uid,
    $core.int? grabType,
    $core.String? lightType,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (grabType != null) {
      _result.grabType = grabType;
    }
    if (lightType != null) {
      _result.lightType = lightType;
    }
    return _result;
  }
  factory UserList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserList clone() => UserList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserList copyWith(void Function(UserList) updates) =>
      super.copyWith((message) => updates(message as UserList))
          as UserList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserList create() => UserList._();
  UserList createEmptyInstance() => create();
  static $pb.PbList<UserList> createRepeated() => $pb.PbList<UserList>();
  @$core.pragma('dart2js:noInline')
  static UserList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserList>(create);
  static UserList? _defaultInstance;

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
  $core.int get grabType => $_getIZ(1);
  @$pb.TagNumber(2)
  set grabType($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGrabType() => $_has(1);
  @$pb.TagNumber(2)
  void clearGrabType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lightType => $_getSZ(2);
  @$pb.TagNumber(3)
  set lightType($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLightType() => $_has(2);
  @$pb.TagNumber(3)
  void clearLightType() => clearField(3);
}

class GrabMicLightMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GrabMicLightMsg',
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
    ..hasRequiredFields = false;

  GrabMicLightMsg._() : super();
  factory GrabMicLightMsg({
    $core.int? uid,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory GrabMicLightMsg.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GrabMicLightMsg.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GrabMicLightMsg clone() => GrabMicLightMsg()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GrabMicLightMsg copyWith(void Function(GrabMicLightMsg) updates) =>
      super.copyWith((message) => updates(message as GrabMicLightMsg))
          as GrabMicLightMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GrabMicLightMsg create() => GrabMicLightMsg._();
  GrabMicLightMsg createEmptyInstance() => create();
  static $pb.PbList<GrabMicLightMsg> createRepeated() =>
      $pb.PbList<GrabMicLightMsg>();
  @$core.pragma('dart2js:noInline')
  static GrabMicLightMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabMicLightMsg>(create);
  static GrabMicLightMsg? _defaultInstance;

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
}
