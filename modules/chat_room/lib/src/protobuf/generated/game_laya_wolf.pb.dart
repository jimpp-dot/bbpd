///
//  Generated code. Do not modify.
//  source: game_laya_wolf.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GamesWolfUpdateMicMessage_Status extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GamesWolfUpdateMicMessage.Status',
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
            : 'speak',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'listen',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GamesWolfUpdateMicMessage_Status._() : super();
  factory GamesWolfUpdateMicMessage_Status({
    $core.int? uid,
    $core.int? speak,
    $core.int? listen,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (speak != null) {
      _result.speak = speak;
    }
    if (listen != null) {
      _result.listen = listen;
    }
    return _result;
  }
  factory GamesWolfUpdateMicMessage_Status.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GamesWolfUpdateMicMessage_Status.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GamesWolfUpdateMicMessage_Status clone() =>
      GamesWolfUpdateMicMessage_Status()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GamesWolfUpdateMicMessage_Status copyWith(
          void Function(GamesWolfUpdateMicMessage_Status) updates) =>
      super.copyWith(
              (message) => updates(message as GamesWolfUpdateMicMessage_Status))
          as GamesWolfUpdateMicMessage_Status; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GamesWolfUpdateMicMessage_Status create() =>
      GamesWolfUpdateMicMessage_Status._();
  GamesWolfUpdateMicMessage_Status createEmptyInstance() => create();
  static $pb.PbList<GamesWolfUpdateMicMessage_Status> createRepeated() =>
      $pb.PbList<GamesWolfUpdateMicMessage_Status>();
  @$core.pragma('dart2js:noInline')
  static GamesWolfUpdateMicMessage_Status getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GamesWolfUpdateMicMessage_Status>(
          create);
  static GamesWolfUpdateMicMessage_Status? _defaultInstance;

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
  $core.int get speak => $_getIZ(1);
  @$pb.TagNumber(2)
  set speak($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSpeak() => $_has(1);
  @$pb.TagNumber(2)
  void clearSpeak() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get listen => $_getIZ(2);
  @$pb.TagNumber(3)
  set listen($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasListen() => $_has(2);
  @$pb.TagNumber(3)
  void clearListen() => clearField(3);
}

class GamesWolfUpdateMicMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GamesWolfUpdateMicMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..pc<GamesWolfUpdateMicMessage_Status>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.PM,
        subBuilder: GamesWolfUpdateMicMessage_Status.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audienceStatus',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GamesWolfUpdateMicMessage._() : super();
  factory GamesWolfUpdateMicMessage({
    $core.int? rid,
    $core.Iterable<GamesWolfUpdateMicMessage_Status>? status,
    $core.int? audienceStatus,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (status != null) {
      _result.status.addAll(status);
    }
    if (audienceStatus != null) {
      _result.audienceStatus = audienceStatus;
    }
    return _result;
  }
  factory GamesWolfUpdateMicMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GamesWolfUpdateMicMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GamesWolfUpdateMicMessage clone() =>
      GamesWolfUpdateMicMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GamesWolfUpdateMicMessage copyWith(
          void Function(GamesWolfUpdateMicMessage) updates) =>
      super.copyWith((message) => updates(message as GamesWolfUpdateMicMessage))
          as GamesWolfUpdateMicMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GamesWolfUpdateMicMessage create() => GamesWolfUpdateMicMessage._();
  GamesWolfUpdateMicMessage createEmptyInstance() => create();
  static $pb.PbList<GamesWolfUpdateMicMessage> createRepeated() =>
      $pb.PbList<GamesWolfUpdateMicMessage>();
  @$core.pragma('dart2js:noInline')
  static GamesWolfUpdateMicMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GamesWolfUpdateMicMessage>(create);
  static GamesWolfUpdateMicMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<GamesWolfUpdateMicMessage_Status> get status => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get audienceStatus => $_getIZ(2);
  @$pb.TagNumber(3)
  set audienceStatus($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAudienceStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearAudienceStatus() => clearField(3);
}
