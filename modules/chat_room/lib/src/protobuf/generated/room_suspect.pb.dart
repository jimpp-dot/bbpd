///
//  Generated code. Do not modify.
//  source: room_suspect.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'room_suspect.pbenum.dart';

export 'room_suspect.pbenum.dart';

class ResSuspectExchangeWitness extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuspectExchangeWitness',
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

  ResSuspectExchangeWitness._() : super();
  factory ResSuspectExchangeWitness({
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
  factory ResSuspectExchangeWitness.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuspectExchangeWitness.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuspectExchangeWitness clone() =>
      ResSuspectExchangeWitness()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuspectExchangeWitness copyWith(
          void Function(ResSuspectExchangeWitness) updates) =>
      super.copyWith((message) => updates(message as ResSuspectExchangeWitness))
          as ResSuspectExchangeWitness; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuspectExchangeWitness create() => ResSuspectExchangeWitness._();
  ResSuspectExchangeWitness createEmptyInstance() => create();
  static $pb.PbList<ResSuspectExchangeWitness> createRepeated() =>
      $pb.PbList<ResSuspectExchangeWitness>();
  @$core.pragma('dart2js:noInline')
  static ResSuspectExchangeWitness getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuspectExchangeWitness>(create);
  static ResSuspectExchangeWitness? _defaultInstance;

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

class ResSuspectAgreeExchange extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuspectAgreeExchange',
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

  ResSuspectAgreeExchange._() : super();
  factory ResSuspectAgreeExchange({
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
  factory ResSuspectAgreeExchange.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuspectAgreeExchange.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuspectAgreeExchange clone() =>
      ResSuspectAgreeExchange()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuspectAgreeExchange copyWith(
          void Function(ResSuspectAgreeExchange) updates) =>
      super.copyWith((message) => updates(message as ResSuspectAgreeExchange))
          as ResSuspectAgreeExchange; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuspectAgreeExchange create() => ResSuspectAgreeExchange._();
  ResSuspectAgreeExchange createEmptyInstance() => create();
  static $pb.PbList<ResSuspectAgreeExchange> createRepeated() =>
      $pb.PbList<ResSuspectAgreeExchange>();
  @$core.pragma('dart2js:noInline')
  static ResSuspectAgreeExchange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuspectAgreeExchange>(create);
  static ResSuspectAgreeExchange? _defaultInstance;

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

class SuspectRoleList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectRoleList',
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
            : 'position',
        $pb.PbFieldType.OU3)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prepare')
    ..e<RoomSuspectRole>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomSuspectRole.ROOM_SUSPECT_ROLE_NONE,
        valueOf: RoomSuspectRole.valueOf,
        enumValues: RoomSuspectRole.values)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'releaseCount',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SuspectRoleList._() : super();
  factory SuspectRoleList({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? position,
    $core.bool? prepare,
    RoomSuspectRole? role,
    $core.int? releaseCount,
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
    if (position != null) {
      _result.position = position;
    }
    if (prepare != null) {
      _result.prepare = prepare;
    }
    if (role != null) {
      _result.role = role;
    }
    if (releaseCount != null) {
      _result.releaseCount = releaseCount;
    }
    return _result;
  }
  factory SuspectRoleList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectRoleList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectRoleList clone() => SuspectRoleList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectRoleList copyWith(void Function(SuspectRoleList) updates) =>
      super.copyWith((message) => updates(message as SuspectRoleList))
          as SuspectRoleList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectRoleList create() => SuspectRoleList._();
  SuspectRoleList createEmptyInstance() => create();
  static $pb.PbList<SuspectRoleList> createRepeated() =>
      $pb.PbList<SuspectRoleList>();
  @$core.pragma('dart2js:noInline')
  static SuspectRoleList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectRoleList>(create);
  static SuspectRoleList? _defaultInstance;

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
  $core.bool get prepare => $_getBF(4);
  @$pb.TagNumber(5)
  set prepare($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPrepare() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrepare() => clearField(5);

  @$pb.TagNumber(6)
  RoomSuspectRole get role => $_getN(5);
  @$pb.TagNumber(6)
  set role(RoomSuspectRole v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRole() => $_has(5);
  @$pb.TagNumber(6)
  void clearRole() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get releaseCount => $_getIZ(6);
  @$pb.TagNumber(7)
  set releaseCount($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasReleaseCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearReleaseCount() => clearField(7);
}

class SuspectPendingData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectPendingData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'notice')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'date')
    ..hasRequiredFields = false;

  SuspectPendingData._() : super();
  factory SuspectPendingData({
    $core.String? notice,
    $core.String? name,
    $core.String? date,
  }) {
    final _result = create();
    if (notice != null) {
      _result.notice = notice;
    }
    if (name != null) {
      _result.name = name;
    }
    if (date != null) {
      _result.date = date;
    }
    return _result;
  }
  factory SuspectPendingData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectPendingData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectPendingData clone() => SuspectPendingData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectPendingData copyWith(void Function(SuspectPendingData) updates) =>
      super.copyWith((message) => updates(message as SuspectPendingData))
          as SuspectPendingData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectPendingData create() => SuspectPendingData._();
  SuspectPendingData createEmptyInstance() => create();
  static $pb.PbList<SuspectPendingData> createRepeated() =>
      $pb.PbList<SuspectPendingData>();
  @$core.pragma('dart2js:noInline')
  static SuspectPendingData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectPendingData>(create);
  static SuspectPendingData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get notice => $_getSZ(0);
  @$pb.TagNumber(1)
  set notice($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNotice() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotice() => clearField(1);

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
  $core.String get date => $_getSZ(2);
  @$pb.TagNumber(3)
  set date($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDate() => clearField(3);
}

class SuspectReadyData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectReadyData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'portrait')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newsDate')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newsTitle')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newsSerialNo')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newsContent')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'detectiveWork')
    ..hasRequiredFields = false;

  SuspectReadyData._() : super();
  factory SuspectReadyData({
    $core.String? portrait,
    $core.String? newsDate,
    $core.String? newsTitle,
    $core.String? newsSerialNo,
    $core.String? newsContent,
    $core.String? detectiveWork,
  }) {
    final _result = create();
    if (portrait != null) {
      _result.portrait = portrait;
    }
    if (newsDate != null) {
      _result.newsDate = newsDate;
    }
    if (newsTitle != null) {
      _result.newsTitle = newsTitle;
    }
    if (newsSerialNo != null) {
      _result.newsSerialNo = newsSerialNo;
    }
    if (newsContent != null) {
      _result.newsContent = newsContent;
    }
    if (detectiveWork != null) {
      _result.detectiveWork = detectiveWork;
    }
    return _result;
  }
  factory SuspectReadyData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectReadyData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectReadyData clone() => SuspectReadyData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectReadyData copyWith(void Function(SuspectReadyData) updates) =>
      super.copyWith((message) => updates(message as SuspectReadyData))
          as SuspectReadyData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectReadyData create() => SuspectReadyData._();
  SuspectReadyData createEmptyInstance() => create();
  static $pb.PbList<SuspectReadyData> createRepeated() =>
      $pb.PbList<SuspectReadyData>();
  @$core.pragma('dart2js:noInline')
  static SuspectReadyData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectReadyData>(create);
  static SuspectReadyData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get portrait => $_getSZ(0);
  @$pb.TagNumber(1)
  set portrait($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPortrait() => $_has(0);
  @$pb.TagNumber(1)
  void clearPortrait() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get newsDate => $_getSZ(1);
  @$pb.TagNumber(2)
  set newsDate($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNewsDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewsDate() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get newsTitle => $_getSZ(2);
  @$pb.TagNumber(3)
  set newsTitle($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNewsTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewsTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get newsSerialNo => $_getSZ(3);
  @$pb.TagNumber(4)
  set newsSerialNo($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNewsSerialNo() => $_has(3);
  @$pb.TagNumber(4)
  void clearNewsSerialNo() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get newsContent => $_getSZ(4);
  @$pb.TagNumber(5)
  set newsContent($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNewsContent() => $_has(4);
  @$pb.TagNumber(5)
  void clearNewsContent() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get detectiveWork => $_getSZ(5);
  @$pb.TagNumber(6)
  set detectiveWork($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDetectiveWork() => $_has(5);
  @$pb.TagNumber(6)
  void clearDetectiveWork() => clearField(6);
}

class SuspectQuestionData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectQuestionData',
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
            : 'content')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'round',
        $pb.PbFieldType.OU3)
    ..aInt64(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalTime')
    ..hasRequiredFields = false;

  SuspectQuestionData._() : super();
  factory SuspectQuestionData({
    $core.int? id,
    $core.String? content,
    $core.int? round,
    $fixnum.Int64? totalTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (content != null) {
      _result.content = content;
    }
    if (round != null) {
      _result.round = round;
    }
    if (totalTime != null) {
      _result.totalTime = totalTime;
    }
    return _result;
  }
  factory SuspectQuestionData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectQuestionData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectQuestionData clone() => SuspectQuestionData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectQuestionData copyWith(void Function(SuspectQuestionData) updates) =>
      super.copyWith((message) => updates(message as SuspectQuestionData))
          as SuspectQuestionData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectQuestionData create() => SuspectQuestionData._();
  SuspectQuestionData createEmptyInstance() => create();
  static $pb.PbList<SuspectQuestionData> createRepeated() =>
      $pb.PbList<SuspectQuestionData>();
  @$core.pragma('dart2js:noInline')
  static SuspectQuestionData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectQuestionData>(create);
  static SuspectQuestionData? _defaultInstance;

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
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get round => $_getIZ(2);
  @$pb.TagNumber(3)
  set round($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRound() => $_has(2);
  @$pb.TagNumber(3)
  void clearRound() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalTime => $_getI64(3);
  @$pb.TagNumber(4)
  set totalTime($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTotalTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalTime() => clearField(4);
}

class SuspectAnswerData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectAnswerData',
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
            : 'content')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'round',
        $pb.PbFieldType.OU3)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'answer')
    ..hasRequiredFields = false;

  SuspectAnswerData._() : super();
  factory SuspectAnswerData({
    $core.int? id,
    $core.String? content,
    $core.int? round,
    $core.bool? answer,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (content != null) {
      _result.content = content;
    }
    if (round != null) {
      _result.round = round;
    }
    if (answer != null) {
      _result.answer = answer;
    }
    return _result;
  }
  factory SuspectAnswerData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectAnswerData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectAnswerData clone() => SuspectAnswerData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectAnswerData copyWith(void Function(SuspectAnswerData) updates) =>
      super.copyWith((message) => updates(message as SuspectAnswerData))
          as SuspectAnswerData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectAnswerData create() => SuspectAnswerData._();
  SuspectAnswerData createEmptyInstance() => create();
  static $pb.PbList<SuspectAnswerData> createRepeated() =>
      $pb.PbList<SuspectAnswerData>();
  @$core.pragma('dart2js:noInline')
  static SuspectAnswerData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectAnswerData>(create);
  static SuspectAnswerData? _defaultInstance;

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
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get round => $_getIZ(2);
  @$pb.TagNumber(3)
  set round($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRound() => $_has(2);
  @$pb.TagNumber(3)
  void clearRound() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get answer => $_getBF(3);
  @$pb.TagNumber(4)
  set answer($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAnswer() => $_has(3);
  @$pb.TagNumber(4)
  void clearAnswer() => clearField(4);
}

class SuspectPersonList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectPersonList',
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
            : 'suspectImage')
    ..e<RoomSuspectReleaseStatus>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'suspectStatus',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomSuspectReleaseStatus.ROOM_SUSPECT_RELEASE_NONE,
        valueOf: RoomSuspectReleaseStatus.valueOf,
        enumValues: RoomSuspectReleaseStatus.values)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'detectiveUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'detectiveIcon')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'suspectImageRole',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SuspectPersonList._() : super();
  factory SuspectPersonList({
    $core.int? id,
    $core.String? suspectImage,
    RoomSuspectReleaseStatus? suspectStatus,
    $core.int? detectiveUid,
    $core.String? detectiveIcon,
    $core.int? suspectImageRole,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (suspectImage != null) {
      _result.suspectImage = suspectImage;
    }
    if (suspectStatus != null) {
      _result.suspectStatus = suspectStatus;
    }
    if (detectiveUid != null) {
      _result.detectiveUid = detectiveUid;
    }
    if (detectiveIcon != null) {
      _result.detectiveIcon = detectiveIcon;
    }
    if (suspectImageRole != null) {
      _result.suspectImageRole = suspectImageRole;
    }
    return _result;
  }
  factory SuspectPersonList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectPersonList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectPersonList clone() => SuspectPersonList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectPersonList copyWith(void Function(SuspectPersonList) updates) =>
      super.copyWith((message) => updates(message as SuspectPersonList))
          as SuspectPersonList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectPersonList create() => SuspectPersonList._();
  SuspectPersonList createEmptyInstance() => create();
  static $pb.PbList<SuspectPersonList> createRepeated() =>
      $pb.PbList<SuspectPersonList>();
  @$core.pragma('dart2js:noInline')
  static SuspectPersonList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectPersonList>(create);
  static SuspectPersonList? _defaultInstance;

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
  $core.String get suspectImage => $_getSZ(1);
  @$pb.TagNumber(2)
  set suspectImage($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSuspectImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuspectImage() => clearField(2);

  @$pb.TagNumber(3)
  RoomSuspectReleaseStatus get suspectStatus => $_getN(2);
  @$pb.TagNumber(3)
  set suspectStatus(RoomSuspectReleaseStatus v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSuspectStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuspectStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get detectiveUid => $_getIZ(3);
  @$pb.TagNumber(4)
  set detectiveUid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDetectiveUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearDetectiveUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get detectiveIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set detectiveIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDetectiveIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearDetectiveIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get suspectImageRole => $_getIZ(5);
  @$pb.TagNumber(6)
  set suspectImageRole($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSuspectImageRole() => $_has(5);
  @$pb.TagNumber(6)
  void clearSuspectImageRole() => clearField(6);
}

class SuspectPlayingData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectPlayingData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<SuspectPersonList>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'personList',
        $pb.PbFieldType.PM,
        subBuilder: SuspectPersonList.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'round',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'releaseCount',
        $pb.PbFieldType.OU3)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showClue')
    ..aInt64(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftTime')
    ..aInt64(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'detectiveExcludeSec')
    ..hasRequiredFields = false;

  SuspectPlayingData._() : super();
  factory SuspectPlayingData({
    $core.Iterable<SuspectPersonList>? personList,
    $core.int? round,
    $core.int? releaseCount,
    $core.bool? showClue,
    $fixnum.Int64? leftTime,
    $fixnum.Int64? detectiveExcludeSec,
  }) {
    final _result = create();
    if (personList != null) {
      _result.personList.addAll(personList);
    }
    if (round != null) {
      _result.round = round;
    }
    if (releaseCount != null) {
      _result.releaseCount = releaseCount;
    }
    if (showClue != null) {
      _result.showClue = showClue;
    }
    if (leftTime != null) {
      _result.leftTime = leftTime;
    }
    if (detectiveExcludeSec != null) {
      _result.detectiveExcludeSec = detectiveExcludeSec;
    }
    return _result;
  }
  factory SuspectPlayingData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectPlayingData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectPlayingData clone() => SuspectPlayingData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectPlayingData copyWith(void Function(SuspectPlayingData) updates) =>
      super.copyWith((message) => updates(message as SuspectPlayingData))
          as SuspectPlayingData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectPlayingData create() => SuspectPlayingData._();
  SuspectPlayingData createEmptyInstance() => create();
  static $pb.PbList<SuspectPlayingData> createRepeated() =>
      $pb.PbList<SuspectPlayingData>();
  @$core.pragma('dart2js:noInline')
  static SuspectPlayingData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectPlayingData>(create);
  static SuspectPlayingData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SuspectPersonList> get personList => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get round => $_getIZ(1);
  @$pb.TagNumber(2)
  set round($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRound() => $_has(1);
  @$pb.TagNumber(2)
  void clearRound() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get releaseCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set releaseCount($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasReleaseCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearReleaseCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get showClue => $_getBF(3);
  @$pb.TagNumber(4)
  set showClue($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasShowClue() => $_has(3);
  @$pb.TagNumber(4)
  void clearShowClue() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get leftTime => $_getI64(4);
  @$pb.TagNumber(5)
  set leftTime($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLeftTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearLeftTime() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get detectiveExcludeSec => $_getI64(5);
  @$pb.TagNumber(6)
  set detectiveExcludeSec($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDetectiveExcludeSec() => $_has(5);
  @$pb.TagNumber(6)
  void clearDetectiveExcludeSec() => clearField(6);
}

class SuspectEndSuccessData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectEndSuccessData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'portrait')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'des')
    ..hasRequiredFields = false;

  SuspectEndSuccessData._() : super();
  factory SuspectEndSuccessData({
    $core.String? portrait,
    $core.String? des,
  }) {
    final _result = create();
    if (portrait != null) {
      _result.portrait = portrait;
    }
    if (des != null) {
      _result.des = des;
    }
    return _result;
  }
  factory SuspectEndSuccessData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectEndSuccessData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectEndSuccessData clone() =>
      SuspectEndSuccessData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectEndSuccessData copyWith(
          void Function(SuspectEndSuccessData) updates) =>
      super.copyWith((message) => updates(message as SuspectEndSuccessData))
          as SuspectEndSuccessData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectEndSuccessData create() => SuspectEndSuccessData._();
  SuspectEndSuccessData createEmptyInstance() => create();
  static $pb.PbList<SuspectEndSuccessData> createRepeated() =>
      $pb.PbList<SuspectEndSuccessData>();
  @$core.pragma('dart2js:noInline')
  static SuspectEndSuccessData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectEndSuccessData>(create);
  static SuspectEndSuccessData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get portrait => $_getSZ(0);
  @$pb.TagNumber(1)
  set portrait($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPortrait() => $_has(0);
  @$pb.TagNumber(1)
  void clearPortrait() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get des => $_getSZ(1);
  @$pb.TagNumber(2)
  set des($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDes() => $_has(1);
  @$pb.TagNumber(2)
  void clearDes() => clearField(2);
}

class SuspectEndFailureData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectEndFailureData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'failureCode',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'des')
    ..hasRequiredFields = false;

  SuspectEndFailureData._() : super();
  factory SuspectEndFailureData({
    $core.int? failureCode,
    $core.String? des,
  }) {
    final _result = create();
    if (failureCode != null) {
      _result.failureCode = failureCode;
    }
    if (des != null) {
      _result.des = des;
    }
    return _result;
  }
  factory SuspectEndFailureData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectEndFailureData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectEndFailureData clone() =>
      SuspectEndFailureData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectEndFailureData copyWith(
          void Function(SuspectEndFailureData) updates) =>
      super.copyWith((message) => updates(message as SuspectEndFailureData))
          as SuspectEndFailureData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectEndFailureData create() => SuspectEndFailureData._();
  SuspectEndFailureData createEmptyInstance() => create();
  static $pb.PbList<SuspectEndFailureData> createRepeated() =>
      $pb.PbList<SuspectEndFailureData>();
  @$core.pragma('dart2js:noInline')
  static SuspectEndFailureData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectEndFailureData>(create);
  static SuspectEndFailureData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get failureCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set failureCode($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFailureCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearFailureCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get des => $_getSZ(1);
  @$pb.TagNumber(2)
  set des($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDes() => $_has(1);
  @$pb.TagNumber(2)
  void clearDes() => clearField(2);
}

class SuspectEndData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectEndData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskState')
    ..aOM<SuspectEndSuccessData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'successData',
        subBuilder: SuspectEndSuccessData.create)
    ..aOM<SuspectEndFailureData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'failureData',
        subBuilder: SuspectEndFailureData.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'detectiveIcon')
    ..hasRequiredFields = false;

  SuspectEndData._() : super();
  factory SuspectEndData({
    $core.bool? taskState,
    SuspectEndSuccessData? successData,
    SuspectEndFailureData? failureData,
    $core.String? detectiveIcon,
  }) {
    final _result = create();
    if (taskState != null) {
      _result.taskState = taskState;
    }
    if (successData != null) {
      _result.successData = successData;
    }
    if (failureData != null) {
      _result.failureData = failureData;
    }
    if (detectiveIcon != null) {
      _result.detectiveIcon = detectiveIcon;
    }
    return _result;
  }
  factory SuspectEndData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectEndData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectEndData clone() => SuspectEndData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectEndData copyWith(void Function(SuspectEndData) updates) =>
      super.copyWith((message) => updates(message as SuspectEndData))
          as SuspectEndData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectEndData create() => SuspectEndData._();
  SuspectEndData createEmptyInstance() => create();
  static $pb.PbList<SuspectEndData> createRepeated() =>
      $pb.PbList<SuspectEndData>();
  @$core.pragma('dart2js:noInline')
  static SuspectEndData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectEndData>(create);
  static SuspectEndData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get taskState => $_getBF(0);
  @$pb.TagNumber(1)
  set taskState($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTaskState() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskState() => clearField(1);

  @$pb.TagNumber(2)
  SuspectEndSuccessData get successData => $_getN(1);
  @$pb.TagNumber(2)
  set successData(SuspectEndSuccessData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSuccessData() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessData() => clearField(2);
  @$pb.TagNumber(2)
  SuspectEndSuccessData ensureSuccessData() => $_ensure(1);

  @$pb.TagNumber(3)
  SuspectEndFailureData get failureData => $_getN(2);
  @$pb.TagNumber(3)
  set failureData(SuspectEndFailureData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFailureData() => $_has(2);
  @$pb.TagNumber(3)
  void clearFailureData() => clearField(3);
  @$pb.TagNumber(3)
  SuspectEndFailureData ensureFailureData() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get detectiveIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set detectiveIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDetectiveIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearDetectiveIcon() => clearField(4);
}

class SuspectRoleData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectRoleData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<SuspectRoleList>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: SuspectRoleList.create)
    ..hasRequiredFields = false;

  SuspectRoleData._() : super();
  factory SuspectRoleData({
    $core.Iterable<SuspectRoleList>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory SuspectRoleData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectRoleData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectRoleData clone() => SuspectRoleData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectRoleData copyWith(void Function(SuspectRoleData) updates) =>
      super.copyWith((message) => updates(message as SuspectRoleData))
          as SuspectRoleData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectRoleData create() => SuspectRoleData._();
  SuspectRoleData createEmptyInstance() => create();
  static $pb.PbList<SuspectRoleData> createRepeated() =>
      $pb.PbList<SuspectRoleData>();
  @$core.pragma('dart2js:noInline')
  static SuspectRoleData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectRoleData>(create);
  static SuspectRoleData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SuspectRoleList> get list => $_getList(0);
}

class ResSuspectBaseData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuspectBaseData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..e<RoomSuspectStage>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stage',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomSuspectStage.ROOM_SUSPECT_STAGE_PENDING,
        valueOf: RoomSuspectStage.valueOf,
        enumValues: RoomSuspectStage.values)
    ..aOM<SuspectRoleData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roleData',
        subBuilder: SuspectRoleData.create)
    ..aOM<SuspectPendingData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pendingData',
        subBuilder: SuspectPendingData.create)
    ..aOM<SuspectReadyData>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'readyData',
        subBuilder: SuspectReadyData.create)
    ..aOM<SuspectPlayingData>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playingData',
        subBuilder: SuspectPlayingData.create)
    ..aOM<SuspectEndData>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endData',
        subBuilder: SuspectEndData.create)
    ..aOM<ResSuspectTextList>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showText',
        subBuilder: ResSuspectTextList.create)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'NoAnswerQuestionNum',
        $pb.PbFieldType.OU3,
        protoName: 'NoAnswerQuestionNum')
    ..hasRequiredFields = false;

  ResSuspectBaseData._() : super();
  factory ResSuspectBaseData({
    RoomSuspectStage? stage,
    SuspectRoleData? roleData,
    SuspectPendingData? pendingData,
    SuspectReadyData? readyData,
    SuspectPlayingData? playingData,
    SuspectEndData? endData,
    ResSuspectTextList? showText,
    $core.int? noAnswerQuestionNum,
  }) {
    final _result = create();
    if (stage != null) {
      _result.stage = stage;
    }
    if (roleData != null) {
      _result.roleData = roleData;
    }
    if (pendingData != null) {
      _result.pendingData = pendingData;
    }
    if (readyData != null) {
      _result.readyData = readyData;
    }
    if (playingData != null) {
      _result.playingData = playingData;
    }
    if (endData != null) {
      _result.endData = endData;
    }
    if (showText != null) {
      _result.showText = showText;
    }
    if (noAnswerQuestionNum != null) {
      _result.noAnswerQuestionNum = noAnswerQuestionNum;
    }
    return _result;
  }
  factory ResSuspectBaseData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuspectBaseData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuspectBaseData clone() => ResSuspectBaseData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuspectBaseData copyWith(void Function(ResSuspectBaseData) updates) =>
      super.copyWith((message) => updates(message as ResSuspectBaseData))
          as ResSuspectBaseData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuspectBaseData create() => ResSuspectBaseData._();
  ResSuspectBaseData createEmptyInstance() => create();
  static $pb.PbList<ResSuspectBaseData> createRepeated() =>
      $pb.PbList<ResSuspectBaseData>();
  @$core.pragma('dart2js:noInline')
  static ResSuspectBaseData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuspectBaseData>(create);
  static ResSuspectBaseData? _defaultInstance;

  @$pb.TagNumber(1)
  RoomSuspectStage get stage => $_getN(0);
  @$pb.TagNumber(1)
  set stage(RoomSuspectStage v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStage() => $_has(0);
  @$pb.TagNumber(1)
  void clearStage() => clearField(1);

  @$pb.TagNumber(2)
  SuspectRoleData get roleData => $_getN(1);
  @$pb.TagNumber(2)
  set roleData(SuspectRoleData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoleData() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleData() => clearField(2);
  @$pb.TagNumber(2)
  SuspectRoleData ensureRoleData() => $_ensure(1);

  @$pb.TagNumber(3)
  SuspectPendingData get pendingData => $_getN(2);
  @$pb.TagNumber(3)
  set pendingData(SuspectPendingData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPendingData() => $_has(2);
  @$pb.TagNumber(3)
  void clearPendingData() => clearField(3);
  @$pb.TagNumber(3)
  SuspectPendingData ensurePendingData() => $_ensure(2);

  @$pb.TagNumber(4)
  SuspectReadyData get readyData => $_getN(3);
  @$pb.TagNumber(4)
  set readyData(SuspectReadyData v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasReadyData() => $_has(3);
  @$pb.TagNumber(4)
  void clearReadyData() => clearField(4);
  @$pb.TagNumber(4)
  SuspectReadyData ensureReadyData() => $_ensure(3);

  @$pb.TagNumber(5)
  SuspectPlayingData get playingData => $_getN(4);
  @$pb.TagNumber(5)
  set playingData(SuspectPlayingData v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPlayingData() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlayingData() => clearField(5);
  @$pb.TagNumber(5)
  SuspectPlayingData ensurePlayingData() => $_ensure(4);

  @$pb.TagNumber(6)
  SuspectEndData get endData => $_getN(5);
  @$pb.TagNumber(6)
  set endData(SuspectEndData v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasEndData() => $_has(5);
  @$pb.TagNumber(6)
  void clearEndData() => clearField(6);
  @$pb.TagNumber(6)
  SuspectEndData ensureEndData() => $_ensure(5);

  @$pb.TagNumber(7)
  ResSuspectTextList get showText => $_getN(6);
  @$pb.TagNumber(7)
  set showText(ResSuspectTextList v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasShowText() => $_has(6);
  @$pb.TagNumber(7)
  void clearShowText() => clearField(7);
  @$pb.TagNumber(7)
  ResSuspectTextList ensureShowText() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get noAnswerQuestionNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set noAnswerQuestionNum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasNoAnswerQuestionNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearNoAnswerQuestionNum() => clearField(8);
}

class ResSuspectBase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuspectBase',
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
    ..aOM<ResSuspectBaseData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResSuspectBaseData.create)
    ..hasRequiredFields = false;

  ResSuspectBase._() : super();
  factory ResSuspectBase({
    $core.bool? success,
    $core.String? msg,
    ResSuspectBaseData? data,
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
  factory ResSuspectBase.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuspectBase.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuspectBase clone() => ResSuspectBase()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuspectBase copyWith(void Function(ResSuspectBase) updates) =>
      super.copyWith((message) => updates(message as ResSuspectBase))
          as ResSuspectBase; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuspectBase create() => ResSuspectBase._();
  ResSuspectBase createEmptyInstance() => create();
  static $pb.PbList<ResSuspectBase> createRepeated() =>
      $pb.PbList<ResSuspectBase>();
  @$core.pragma('dart2js:noInline')
  static ResSuspectBase getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuspectBase>(create);
  static ResSuspectBase? _defaultInstance;

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
  ResSuspectBaseData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ResSuspectBaseData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ResSuspectBaseData ensureData() => $_ensure(2);
}

class SuspectExchangeWitnessMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectExchangeWitnessMsg',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fromUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'witnessPosition',
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
            : 'toUid',
        $pb.PbFieldType.OU3)
    ..aInt64(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reqTime')
    ..hasRequiredFields = false;

  SuspectExchangeWitnessMsg._() : super();
  factory SuspectExchangeWitnessMsg({
    $core.int? fromUid,
    $core.int? witnessPosition,
    $core.String? name,
    $core.int? toUid,
    $fixnum.Int64? reqTime,
  }) {
    final _result = create();
    if (fromUid != null) {
      _result.fromUid = fromUid;
    }
    if (witnessPosition != null) {
      _result.witnessPosition = witnessPosition;
    }
    if (name != null) {
      _result.name = name;
    }
    if (toUid != null) {
      _result.toUid = toUid;
    }
    if (reqTime != null) {
      _result.reqTime = reqTime;
    }
    return _result;
  }
  factory SuspectExchangeWitnessMsg.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectExchangeWitnessMsg.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectExchangeWitnessMsg clone() =>
      SuspectExchangeWitnessMsg()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectExchangeWitnessMsg copyWith(
          void Function(SuspectExchangeWitnessMsg) updates) =>
      super.copyWith((message) => updates(message as SuspectExchangeWitnessMsg))
          as SuspectExchangeWitnessMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectExchangeWitnessMsg create() => SuspectExchangeWitnessMsg._();
  SuspectExchangeWitnessMsg createEmptyInstance() => create();
  static $pb.PbList<SuspectExchangeWitnessMsg> createRepeated() =>
      $pb.PbList<SuspectExchangeWitnessMsg>();
  @$core.pragma('dart2js:noInline')
  static SuspectExchangeWitnessMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectExchangeWitnessMsg>(create);
  static SuspectExchangeWitnessMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fromUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set fromUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFromUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get witnessPosition => $_getIZ(1);
  @$pb.TagNumber(2)
  set witnessPosition($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWitnessPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearWitnessPosition() => clearField(2);

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
  $core.int get toUid => $_getIZ(3);
  @$pb.TagNumber(4)
  set toUid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasToUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearToUid() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get reqTime => $_getI64(4);
  @$pb.TagNumber(5)
  set reqTime($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasReqTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearReqTime() => clearField(5);
}

class ResSuspectStart extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuspectStart',
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

  ResSuspectStart._() : super();
  factory ResSuspectStart({
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
  factory ResSuspectStart.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuspectStart.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuspectStart clone() => ResSuspectStart()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuspectStart copyWith(void Function(ResSuspectStart) updates) =>
      super.copyWith((message) => updates(message as ResSuspectStart))
          as ResSuspectStart; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuspectStart create() => ResSuspectStart._();
  ResSuspectStart createEmptyInstance() => create();
  static $pb.PbList<ResSuspectStart> createRepeated() =>
      $pb.PbList<ResSuspectStart>();
  @$core.pragma('dart2js:noInline')
  static ResSuspectStart getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuspectStart>(create);
  static ResSuspectStart? _defaultInstance;

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

class ResSuspectPrepare extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuspectPrepare',
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

  ResSuspectPrepare._() : super();
  factory ResSuspectPrepare({
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
  factory ResSuspectPrepare.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuspectPrepare.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuspectPrepare clone() => ResSuspectPrepare()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuspectPrepare copyWith(void Function(ResSuspectPrepare) updates) =>
      super.copyWith((message) => updates(message as ResSuspectPrepare))
          as ResSuspectPrepare; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuspectPrepare create() => ResSuspectPrepare._();
  ResSuspectPrepare createEmptyInstance() => create();
  static $pb.PbList<ResSuspectPrepare> createRepeated() =>
      $pb.PbList<ResSuspectPrepare>();
  @$core.pragma('dart2js:noInline')
  static ResSuspectPrepare getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuspectPrepare>(create);
  static ResSuspectPrepare? _defaultInstance;

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

class ResSuspectGrabPosition extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuspectGrabPosition',
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

  ResSuspectGrabPosition._() : super();
  factory ResSuspectGrabPosition({
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
  factory ResSuspectGrabPosition.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuspectGrabPosition.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuspectGrabPosition clone() =>
      ResSuspectGrabPosition()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuspectGrabPosition copyWith(
          void Function(ResSuspectGrabPosition) updates) =>
      super.copyWith((message) => updates(message as ResSuspectGrabPosition))
          as ResSuspectGrabPosition; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuspectGrabPosition create() => ResSuspectGrabPosition._();
  ResSuspectGrabPosition createEmptyInstance() => create();
  static $pb.PbList<ResSuspectGrabPosition> createRepeated() =>
      $pb.PbList<ResSuspectGrabPosition>();
  @$core.pragma('dart2js:noInline')
  static ResSuspectGrabPosition getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuspectGrabPosition>(create);
  static ResSuspectGrabPosition? _defaultInstance;

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

class ResSuspectAnswer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuspectAnswer',
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

  ResSuspectAnswer._() : super();
  factory ResSuspectAnswer({
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
  factory ResSuspectAnswer.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuspectAnswer.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuspectAnswer clone() => ResSuspectAnswer()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuspectAnswer copyWith(void Function(ResSuspectAnswer) updates) =>
      super.copyWith((message) => updates(message as ResSuspectAnswer))
          as ResSuspectAnswer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuspectAnswer create() => ResSuspectAnswer._();
  ResSuspectAnswer createEmptyInstance() => create();
  static $pb.PbList<ResSuspectAnswer> createRepeated() =>
      $pb.PbList<ResSuspectAnswer>();
  @$core.pragma('dart2js:noInline')
  static ResSuspectAnswer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuspectAnswer>(create);
  static ResSuspectAnswer? _defaultInstance;

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

class SuspectReleaseData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectReleaseData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'suspectOrCri',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  SuspectReleaseData._() : super();
  factory SuspectReleaseData({
    $core.int? suspectOrCri,
    $core.String? desc,
  }) {
    final _result = create();
    if (suspectOrCri != null) {
      _result.suspectOrCri = suspectOrCri;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory SuspectReleaseData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectReleaseData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectReleaseData clone() => SuspectReleaseData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectReleaseData copyWith(void Function(SuspectReleaseData) updates) =>
      super.copyWith((message) => updates(message as SuspectReleaseData))
          as SuspectReleaseData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectReleaseData create() => SuspectReleaseData._();
  SuspectReleaseData createEmptyInstance() => create();
  static $pb.PbList<SuspectReleaseData> createRepeated() =>
      $pb.PbList<SuspectReleaseData>();
  @$core.pragma('dart2js:noInline')
  static SuspectReleaseData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectReleaseData>(create);
  static SuspectReleaseData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get suspectOrCri => $_getIZ(0);
  @$pb.TagNumber(1)
  set suspectOrCri($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuspectOrCri() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuspectOrCri() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => clearField(2);
}

class ResSuspectRelease extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuspectRelease',
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
    ..aOM<SuspectReleaseData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SuspectReleaseData.create)
    ..hasRequiredFields = false;

  ResSuspectRelease._() : super();
  factory ResSuspectRelease({
    $core.bool? success,
    $core.String? msg,
    SuspectReleaseData? data,
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
  factory ResSuspectRelease.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuspectRelease.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuspectRelease clone() => ResSuspectRelease()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuspectRelease copyWith(void Function(ResSuspectRelease) updates) =>
      super.copyWith((message) => updates(message as ResSuspectRelease))
          as ResSuspectRelease; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuspectRelease create() => ResSuspectRelease._();
  ResSuspectRelease createEmptyInstance() => create();
  static $pb.PbList<ResSuspectRelease> createRepeated() =>
      $pb.PbList<ResSuspectRelease>();
  @$core.pragma('dart2js:noInline')
  static ResSuspectRelease getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuspectRelease>(create);
  static ResSuspectRelease? _defaultInstance;

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
  SuspectReleaseData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SuspectReleaseData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SuspectReleaseData ensureData() => $_ensure(2);
}

class ResSuspectSelectClue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuspectSelectClue',
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

  ResSuspectSelectClue._() : super();
  factory ResSuspectSelectClue({
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
  factory ResSuspectSelectClue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuspectSelectClue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuspectSelectClue clone() =>
      ResSuspectSelectClue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuspectSelectClue copyWith(void Function(ResSuspectSelectClue) updates) =>
      super.copyWith((message) => updates(message as ResSuspectSelectClue))
          as ResSuspectSelectClue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuspectSelectClue create() => ResSuspectSelectClue._();
  ResSuspectSelectClue createEmptyInstance() => create();
  static $pb.PbList<ResSuspectSelectClue> createRepeated() =>
      $pb.PbList<ResSuspectSelectClue>();
  @$core.pragma('dart2js:noInline')
  static ResSuspectSelectClue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuspectSelectClue>(create);
  static ResSuspectSelectClue? _defaultInstance;

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

class SuspectQuestionRecordList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectQuestionRecordList',
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
            : 'round',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'question')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'answer',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SuspectQuestionRecordList._() : super();
  factory SuspectQuestionRecordList({
    $core.int? id,
    $core.int? round,
    $core.String? question,
    $core.int? answer,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (round != null) {
      _result.round = round;
    }
    if (question != null) {
      _result.question = question;
    }
    if (answer != null) {
      _result.answer = answer;
    }
    return _result;
  }
  factory SuspectQuestionRecordList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectQuestionRecordList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectQuestionRecordList clone() =>
      SuspectQuestionRecordList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectQuestionRecordList copyWith(
          void Function(SuspectQuestionRecordList) updates) =>
      super.copyWith((message) => updates(message as SuspectQuestionRecordList))
          as SuspectQuestionRecordList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectQuestionRecordList create() => SuspectQuestionRecordList._();
  SuspectQuestionRecordList createEmptyInstance() => create();
  static $pb.PbList<SuspectQuestionRecordList> createRepeated() =>
      $pb.PbList<SuspectQuestionRecordList>();
  @$core.pragma('dart2js:noInline')
  static SuspectQuestionRecordList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectQuestionRecordList>(create);
  static SuspectQuestionRecordList? _defaultInstance;

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
  $core.int get round => $_getIZ(1);
  @$pb.TagNumber(2)
  set round($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRound() => $_has(1);
  @$pb.TagNumber(2)
  void clearRound() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get question => $_getSZ(2);
  @$pb.TagNumber(3)
  set question($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasQuestion() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuestion() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get answer => $_getIZ(3);
  @$pb.TagNumber(4)
  set answer($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAnswer() => $_has(3);
  @$pb.TagNumber(4)
  void clearAnswer() => clearField(4);
}

class SuspectQuestionRecord extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectQuestionRecord',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<SuspectQuestionRecordList>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: SuspectQuestionRecordList.create)
    ..aOM<SuspectQuestionRecordList>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentQuestion',
        subBuilder: SuspectQuestionRecordList.create)
    ..hasRequiredFields = false;

  SuspectQuestionRecord._() : super();
  factory SuspectQuestionRecord({
    $core.Iterable<SuspectQuestionRecordList>? list,
    SuspectQuestionRecordList? currentQuestion,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (currentQuestion != null) {
      _result.currentQuestion = currentQuestion;
    }
    return _result;
  }
  factory SuspectQuestionRecord.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectQuestionRecord.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectQuestionRecord clone() =>
      SuspectQuestionRecord()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectQuestionRecord copyWith(
          void Function(SuspectQuestionRecord) updates) =>
      super.copyWith((message) => updates(message as SuspectQuestionRecord))
          as SuspectQuestionRecord; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectQuestionRecord create() => SuspectQuestionRecord._();
  SuspectQuestionRecord createEmptyInstance() => create();
  static $pb.PbList<SuspectQuestionRecord> createRepeated() =>
      $pb.PbList<SuspectQuestionRecord>();
  @$core.pragma('dart2js:noInline')
  static SuspectQuestionRecord getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectQuestionRecord>(create);
  static SuspectQuestionRecord? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SuspectQuestionRecordList> get list => $_getList(0);

  @$pb.TagNumber(2)
  SuspectQuestionRecordList get currentQuestion => $_getN(1);
  @$pb.TagNumber(2)
  set currentQuestion(SuspectQuestionRecordList v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCurrentQuestion() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentQuestion() => clearField(2);
  @$pb.TagNumber(2)
  SuspectQuestionRecordList ensureCurrentQuestion() => $_ensure(1);
}

class ResSuspectQuestionList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuspectQuestionList',
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
    ..aOM<SuspectQuestionRecord>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SuspectQuestionRecord.create)
    ..hasRequiredFields = false;

  ResSuspectQuestionList._() : super();
  factory ResSuspectQuestionList({
    $core.bool? success,
    $core.String? msg,
    SuspectQuestionRecord? data,
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
  factory ResSuspectQuestionList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuspectQuestionList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuspectQuestionList clone() =>
      ResSuspectQuestionList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuspectQuestionList copyWith(
          void Function(ResSuspectQuestionList) updates) =>
      super.copyWith((message) => updates(message as ResSuspectQuestionList))
          as ResSuspectQuestionList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuspectQuestionList create() => ResSuspectQuestionList._();
  ResSuspectQuestionList createEmptyInstance() => create();
  static $pb.PbList<ResSuspectQuestionList> createRepeated() =>
      $pb.PbList<ResSuspectQuestionList>();
  @$core.pragma('dart2js:noInline')
  static ResSuspectQuestionList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuspectQuestionList>(create);
  static ResSuspectQuestionList? _defaultInstance;

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
  SuspectQuestionRecord get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SuspectQuestionRecord v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SuspectQuestionRecord ensureData() => $_ensure(2);
}

class SuspectTimeRecordList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectTimeRecordList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'round',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'releaseCount',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'costTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SuspectTimeRecordList._() : super();
  factory SuspectTimeRecordList({
    $core.int? round,
    $core.int? releaseCount,
    $core.int? costTime,
  }) {
    final _result = create();
    if (round != null) {
      _result.round = round;
    }
    if (releaseCount != null) {
      _result.releaseCount = releaseCount;
    }
    if (costTime != null) {
      _result.costTime = costTime;
    }
    return _result;
  }
  factory SuspectTimeRecordList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectTimeRecordList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectTimeRecordList clone() =>
      SuspectTimeRecordList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectTimeRecordList copyWith(
          void Function(SuspectTimeRecordList) updates) =>
      super.copyWith((message) => updates(message as SuspectTimeRecordList))
          as SuspectTimeRecordList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectTimeRecordList create() => SuspectTimeRecordList._();
  SuspectTimeRecordList createEmptyInstance() => create();
  static $pb.PbList<SuspectTimeRecordList> createRepeated() =>
      $pb.PbList<SuspectTimeRecordList>();
  @$core.pragma('dart2js:noInline')
  static SuspectTimeRecordList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectTimeRecordList>(create);
  static SuspectTimeRecordList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get round => $_getIZ(0);
  @$pb.TagNumber(1)
  set round($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRound() => $_has(0);
  @$pb.TagNumber(1)
  void clearRound() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get releaseCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set releaseCount($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasReleaseCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearReleaseCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get costTime => $_getIZ(2);
  @$pb.TagNumber(3)
  set costTime($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCostTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearCostTime() => clearField(3);
}

class SuspectTimeRecord extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuspectTimeRecord',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<SuspectTimeRecordList>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: SuspectTimeRecordList.create)
    ..hasRequiredFields = false;

  SuspectTimeRecord._() : super();
  factory SuspectTimeRecord({
    $core.Iterable<SuspectTimeRecordList>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory SuspectTimeRecord.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuspectTimeRecord.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuspectTimeRecord clone() => SuspectTimeRecord()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuspectTimeRecord copyWith(void Function(SuspectTimeRecord) updates) =>
      super.copyWith((message) => updates(message as SuspectTimeRecord))
          as SuspectTimeRecord; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuspectTimeRecord create() => SuspectTimeRecord._();
  SuspectTimeRecord createEmptyInstance() => create();
  static $pb.PbList<SuspectTimeRecord> createRepeated() =>
      $pb.PbList<SuspectTimeRecord>();
  @$core.pragma('dart2js:noInline')
  static SuspectTimeRecord getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuspectTimeRecord>(create);
  static SuspectTimeRecord? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SuspectTimeRecordList> get list => $_getList(0);
}

class ResSuspectTimeList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuspectTimeList',
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
    ..aOM<SuspectTimeRecord>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SuspectTimeRecord.create)
    ..hasRequiredFields = false;

  ResSuspectTimeList._() : super();
  factory ResSuspectTimeList({
    $core.bool? success,
    $core.String? msg,
    SuspectTimeRecord? data,
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
  factory ResSuspectTimeList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuspectTimeList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuspectTimeList clone() => ResSuspectTimeList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuspectTimeList copyWith(void Function(ResSuspectTimeList) updates) =>
      super.copyWith((message) => updates(message as ResSuspectTimeList))
          as ResSuspectTimeList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuspectTimeList create() => ResSuspectTimeList._();
  ResSuspectTimeList createEmptyInstance() => create();
  static $pb.PbList<ResSuspectTimeList> createRepeated() =>
      $pb.PbList<ResSuspectTimeList>();
  @$core.pragma('dart2js:noInline')
  static ResSuspectTimeList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuspectTimeList>(create);
  static ResSuspectTimeList? _defaultInstance;

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
  SuspectTimeRecord get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SuspectTimeRecord v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SuspectTimeRecord ensureData() => $_ensure(2);
}

class ResSuspectTextList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSuspectTextList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'witnessText')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'detectiveText')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'otherText')
    ..hasRequiredFields = false;

  ResSuspectTextList._() : super();
  factory ResSuspectTextList({
    $core.String? witnessText,
    $core.String? detectiveText,
    $core.String? otherText,
  }) {
    final _result = create();
    if (witnessText != null) {
      _result.witnessText = witnessText;
    }
    if (detectiveText != null) {
      _result.detectiveText = detectiveText;
    }
    if (otherText != null) {
      _result.otherText = otherText;
    }
    return _result;
  }
  factory ResSuspectTextList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSuspectTextList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSuspectTextList clone() => ResSuspectTextList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSuspectTextList copyWith(void Function(ResSuspectTextList) updates) =>
      super.copyWith((message) => updates(message as ResSuspectTextList))
          as ResSuspectTextList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSuspectTextList create() => ResSuspectTextList._();
  ResSuspectTextList createEmptyInstance() => create();
  static $pb.PbList<ResSuspectTextList> createRepeated() =>
      $pb.PbList<ResSuspectTextList>();
  @$core.pragma('dart2js:noInline')
  static ResSuspectTextList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSuspectTextList>(create);
  static ResSuspectTextList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get witnessText => $_getSZ(0);
  @$pb.TagNumber(1)
  set witnessText($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasWitnessText() => $_has(0);
  @$pb.TagNumber(1)
  void clearWitnessText() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get detectiveText => $_getSZ(1);
  @$pb.TagNumber(2)
  set detectiveText($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDetectiveText() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetectiveText() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get otherText => $_getSZ(2);
  @$pb.TagNumber(3)
  set otherText($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOtherText() => $_has(2);
  @$pb.TagNumber(3)
  void clearOtherText() => clearField(3);
}

class NoviceGuidance extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NoviceGuidance',
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
    ..aOM<NewUserPageInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: NewUserPageInfo.create)
    ..hasRequiredFields = false;

  NoviceGuidance._() : super();
  factory NoviceGuidance({
    $core.bool? success,
    $core.String? msg,
    NewUserPageInfo? data,
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
  factory NoviceGuidance.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NoviceGuidance.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NoviceGuidance clone() => NoviceGuidance()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NoviceGuidance copyWith(void Function(NoviceGuidance) updates) =>
      super.copyWith((message) => updates(message as NoviceGuidance))
          as NoviceGuidance; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NoviceGuidance create() => NoviceGuidance._();
  NoviceGuidance createEmptyInstance() => create();
  static $pb.PbList<NoviceGuidance> createRepeated() =>
      $pb.PbList<NoviceGuidance>();
  @$core.pragma('dart2js:noInline')
  static NoviceGuidance getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NoviceGuidance>(create);
  static NoviceGuidance? _defaultInstance;

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
  NewUserPageInfo get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(NewUserPageInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  NewUserPageInfo ensureData() => $_ensure(2);
}

class NewUserPageInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NewUserPageInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'whoMurderer')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playTitle')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'motion')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'oneRuleContent')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'oneGameTimeText')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onePageImgUrl')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'twoContent')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'twoPopWindowContent')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'twoWindowYesAnswer')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'twoWindowNoAnswer')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'twoPageImgUrl')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'threeContent')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'threePopWindowContent')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'threeButtonContent')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'threePageImgUrl')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fourContent')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fourSuccessContent')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fourSuccessContentUrl')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fourSuccessText')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fourSuccessButton')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'forePageImgUrl')
    ..hasRequiredFields = false;

  NewUserPageInfo._() : super();
  factory NewUserPageInfo({
    $core.String? whoMurderer,
    $core.String? playTitle,
    $core.String? motion,
    $core.String? oneRuleContent,
    $core.String? oneGameTimeText,
    $core.String? onePageImgUrl,
    $core.String? twoContent,
    $core.String? twoPopWindowContent,
    $core.String? twoWindowYesAnswer,
    $core.String? twoWindowNoAnswer,
    $core.String? twoPageImgUrl,
    $core.String? threeContent,
    $core.String? threePopWindowContent,
    $core.String? threeButtonContent,
    $core.String? threePageImgUrl,
    $core.String? fourContent,
    $core.String? fourSuccessContent,
    $core.String? fourSuccessContentUrl,
    $core.String? fourSuccessText,
    $core.String? fourSuccessButton,
    $core.String? forePageImgUrl,
  }) {
    final _result = create();
    if (whoMurderer != null) {
      _result.whoMurderer = whoMurderer;
    }
    if (playTitle != null) {
      _result.playTitle = playTitle;
    }
    if (motion != null) {
      _result.motion = motion;
    }
    if (oneRuleContent != null) {
      _result.oneRuleContent = oneRuleContent;
    }
    if (oneGameTimeText != null) {
      _result.oneGameTimeText = oneGameTimeText;
    }
    if (onePageImgUrl != null) {
      _result.onePageImgUrl = onePageImgUrl;
    }
    if (twoContent != null) {
      _result.twoContent = twoContent;
    }
    if (twoPopWindowContent != null) {
      _result.twoPopWindowContent = twoPopWindowContent;
    }
    if (twoWindowYesAnswer != null) {
      _result.twoWindowYesAnswer = twoWindowYesAnswer;
    }
    if (twoWindowNoAnswer != null) {
      _result.twoWindowNoAnswer = twoWindowNoAnswer;
    }
    if (twoPageImgUrl != null) {
      _result.twoPageImgUrl = twoPageImgUrl;
    }
    if (threeContent != null) {
      _result.threeContent = threeContent;
    }
    if (threePopWindowContent != null) {
      _result.threePopWindowContent = threePopWindowContent;
    }
    if (threeButtonContent != null) {
      _result.threeButtonContent = threeButtonContent;
    }
    if (threePageImgUrl != null) {
      _result.threePageImgUrl = threePageImgUrl;
    }
    if (fourContent != null) {
      _result.fourContent = fourContent;
    }
    if (fourSuccessContent != null) {
      _result.fourSuccessContent = fourSuccessContent;
    }
    if (fourSuccessContentUrl != null) {
      _result.fourSuccessContentUrl = fourSuccessContentUrl;
    }
    if (fourSuccessText != null) {
      _result.fourSuccessText = fourSuccessText;
    }
    if (fourSuccessButton != null) {
      _result.fourSuccessButton = fourSuccessButton;
    }
    if (forePageImgUrl != null) {
      _result.forePageImgUrl = forePageImgUrl;
    }
    return _result;
  }
  factory NewUserPageInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NewUserPageInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NewUserPageInfo clone() => NewUserPageInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NewUserPageInfo copyWith(void Function(NewUserPageInfo) updates) =>
      super.copyWith((message) => updates(message as NewUserPageInfo))
          as NewUserPageInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewUserPageInfo create() => NewUserPageInfo._();
  NewUserPageInfo createEmptyInstance() => create();
  static $pb.PbList<NewUserPageInfo> createRepeated() =>
      $pb.PbList<NewUserPageInfo>();
  @$core.pragma('dart2js:noInline')
  static NewUserPageInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewUserPageInfo>(create);
  static NewUserPageInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get whoMurderer => $_getSZ(0);
  @$pb.TagNumber(1)
  set whoMurderer($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasWhoMurderer() => $_has(0);
  @$pb.TagNumber(1)
  void clearWhoMurderer() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get playTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set playTitle($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPlayTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get motion => $_getSZ(2);
  @$pb.TagNumber(3)
  set motion($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMotion() => $_has(2);
  @$pb.TagNumber(3)
  void clearMotion() => clearField(3);

  @$pb.TagNumber(7)
  $core.String get oneRuleContent => $_getSZ(3);
  @$pb.TagNumber(7)
  set oneRuleContent($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOneRuleContent() => $_has(3);
  @$pb.TagNumber(7)
  void clearOneRuleContent() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get oneGameTimeText => $_getSZ(4);
  @$pb.TagNumber(8)
  set oneGameTimeText($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasOneGameTimeText() => $_has(4);
  @$pb.TagNumber(8)
  void clearOneGameTimeText() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get onePageImgUrl => $_getSZ(5);
  @$pb.TagNumber(9)
  set onePageImgUrl($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasOnePageImgUrl() => $_has(5);
  @$pb.TagNumber(9)
  void clearOnePageImgUrl() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get twoContent => $_getSZ(6);
  @$pb.TagNumber(10)
  set twoContent($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTwoContent() => $_has(6);
  @$pb.TagNumber(10)
  void clearTwoContent() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get twoPopWindowContent => $_getSZ(7);
  @$pb.TagNumber(11)
  set twoPopWindowContent($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTwoPopWindowContent() => $_has(7);
  @$pb.TagNumber(11)
  void clearTwoPopWindowContent() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get twoWindowYesAnswer => $_getSZ(8);
  @$pb.TagNumber(12)
  set twoWindowYesAnswer($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasTwoWindowYesAnswer() => $_has(8);
  @$pb.TagNumber(12)
  void clearTwoWindowYesAnswer() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get twoWindowNoAnswer => $_getSZ(9);
  @$pb.TagNumber(13)
  set twoWindowNoAnswer($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasTwoWindowNoAnswer() => $_has(9);
  @$pb.TagNumber(13)
  void clearTwoWindowNoAnswer() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get twoPageImgUrl => $_getSZ(10);
  @$pb.TagNumber(14)
  set twoPageImgUrl($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasTwoPageImgUrl() => $_has(10);
  @$pb.TagNumber(14)
  void clearTwoPageImgUrl() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get threeContent => $_getSZ(11);
  @$pb.TagNumber(15)
  set threeContent($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasThreeContent() => $_has(11);
  @$pb.TagNumber(15)
  void clearThreeContent() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get threePopWindowContent => $_getSZ(12);
  @$pb.TagNumber(16)
  set threePopWindowContent($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasThreePopWindowContent() => $_has(12);
  @$pb.TagNumber(16)
  void clearThreePopWindowContent() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get threeButtonContent => $_getSZ(13);
  @$pb.TagNumber(17)
  set threeButtonContent($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasThreeButtonContent() => $_has(13);
  @$pb.TagNumber(17)
  void clearThreeButtonContent() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get threePageImgUrl => $_getSZ(14);
  @$pb.TagNumber(18)
  set threePageImgUrl($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasThreePageImgUrl() => $_has(14);
  @$pb.TagNumber(18)
  void clearThreePageImgUrl() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get fourContent => $_getSZ(15);
  @$pb.TagNumber(19)
  set fourContent($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasFourContent() => $_has(15);
  @$pb.TagNumber(19)
  void clearFourContent() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get fourSuccessContent => $_getSZ(16);
  @$pb.TagNumber(20)
  set fourSuccessContent($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasFourSuccessContent() => $_has(16);
  @$pb.TagNumber(20)
  void clearFourSuccessContent() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get fourSuccessContentUrl => $_getSZ(17);
  @$pb.TagNumber(21)
  set fourSuccessContentUrl($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasFourSuccessContentUrl() => $_has(17);
  @$pb.TagNumber(21)
  void clearFourSuccessContentUrl() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get fourSuccessText => $_getSZ(18);
  @$pb.TagNumber(22)
  set fourSuccessText($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasFourSuccessText() => $_has(18);
  @$pb.TagNumber(22)
  void clearFourSuccessText() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get fourSuccessButton => $_getSZ(19);
  @$pb.TagNumber(23)
  set fourSuccessButton($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasFourSuccessButton() => $_has(19);
  @$pb.TagNumber(23)
  void clearFourSuccessButton() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get forePageImgUrl => $_getSZ(20);
  @$pb.TagNumber(24)
  set forePageImgUrl($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasForePageImgUrl() => $_has(20);
  @$pb.TagNumber(24)
  void clearForePageImgUrl() => clearField(24);
}
