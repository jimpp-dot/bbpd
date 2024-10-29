///
//  Generated code. Do not modify.
//  source: cplink.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'auction.pb.dart' as $0;

class RespCplinkDefendProgressApi extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespCplinkDefendProgressApi',
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
    ..aOM<CplinkMessage>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: CplinkMessage.create)
    ..hasRequiredFields = false;

  RespCplinkDefendProgressApi._() : super();
  factory RespCplinkDefendProgressApi({
    $core.bool? success,
    $core.String? message,
    CplinkMessage? data,
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
  factory RespCplinkDefendProgressApi.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespCplinkDefendProgressApi.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespCplinkDefendProgressApi clone() =>
      RespCplinkDefendProgressApi()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespCplinkDefendProgressApi copyWith(
          void Function(RespCplinkDefendProgressApi) updates) =>
      super.copyWith(
              (message) => updates(message as RespCplinkDefendProgressApi))
          as RespCplinkDefendProgressApi; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespCplinkDefendProgressApi create() =>
      RespCplinkDefendProgressApi._();
  RespCplinkDefendProgressApi createEmptyInstance() => create();
  static $pb.PbList<RespCplinkDefendProgressApi> createRepeated() =>
      $pb.PbList<RespCplinkDefendProgressApi>();
  @$core.pragma('dart2js:noInline')
  static RespCplinkDefendProgressApi getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespCplinkDefendProgressApi>(create);
  static RespCplinkDefendProgressApi? _defaultInstance;

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
  CplinkMessage get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(CplinkMessage v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  CplinkMessage ensureData() => $_ensure(2);
}

class CplinkMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CplinkMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<$0.AuctionRelationTotalProgress>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progress',
        subBuilder: $0.AuctionRelationTotalProgress.create)
    ..aOM<CplinkRelation>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relation',
        subBuilder: CplinkRelation.create)
    ..hasRequiredFields = false;

  CplinkMessage._() : super();
  factory CplinkMessage({
    $0.AuctionRelationTotalProgress? progress,
    CplinkRelation? relation,
  }) {
    final _result = create();
    if (progress != null) {
      _result.progress = progress;
    }
    if (relation != null) {
      _result.relation = relation;
    }
    return _result;
  }
  factory CplinkMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CplinkMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CplinkMessage clone() => CplinkMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CplinkMessage copyWith(void Function(CplinkMessage) updates) =>
      super.copyWith((message) => updates(message as CplinkMessage))
          as CplinkMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CplinkMessage create() => CplinkMessage._();
  CplinkMessage createEmptyInstance() => create();
  static $pb.PbList<CplinkMessage> createRepeated() =>
      $pb.PbList<CplinkMessage>();
  @$core.pragma('dart2js:noInline')
  static CplinkMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CplinkMessage>(create);
  static CplinkMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $0.AuctionRelationTotalProgress get progress => $_getN(0);
  @$pb.TagNumber(1)
  set progress($0.AuctionRelationTotalProgress v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasProgress() => $_has(0);
  @$pb.TagNumber(1)
  void clearProgress() => clearField(1);
  @$pb.TagNumber(1)
  $0.AuctionRelationTotalProgress ensureProgress() => $_ensure(0);

  @$pb.TagNumber(2)
  CplinkRelation get relation => $_getN(1);
  @$pb.TagNumber(2)
  set relation(CplinkRelation v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRelation() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelation() => clearField(2);
  @$pb.TagNumber(2)
  CplinkRelation ensureRelation() => $_ensure(1);
}

class CplinkRelation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CplinkRelation',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relationId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relationName')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentDays',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextDays',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextDaysScoreNeed',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  CplinkRelation._() : super();
  factory CplinkRelation({
    $core.int? relationId,
    $core.String? relationName,
    $core.int? currentDays,
    $core.int? nextDays,
    $core.int? nextDaysScoreNeed,
  }) {
    final _result = create();
    if (relationId != null) {
      _result.relationId = relationId;
    }
    if (relationName != null) {
      _result.relationName = relationName;
    }
    if (currentDays != null) {
      _result.currentDays = currentDays;
    }
    if (nextDays != null) {
      _result.nextDays = nextDays;
    }
    if (nextDaysScoreNeed != null) {
      _result.nextDaysScoreNeed = nextDaysScoreNeed;
    }
    return _result;
  }
  factory CplinkRelation.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CplinkRelation.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CplinkRelation clone() => CplinkRelation()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CplinkRelation copyWith(void Function(CplinkRelation) updates) =>
      super.copyWith((message) => updates(message as CplinkRelation))
          as CplinkRelation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CplinkRelation create() => CplinkRelation._();
  CplinkRelation createEmptyInstance() => create();
  static $pb.PbList<CplinkRelation> createRepeated() =>
      $pb.PbList<CplinkRelation>();
  @$core.pragma('dart2js:noInline')
  static CplinkRelation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CplinkRelation>(create);
  static CplinkRelation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get relationId => $_getIZ(0);
  @$pb.TagNumber(1)
  set relationId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRelationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRelationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get relationName => $_getSZ(1);
  @$pb.TagNumber(2)
  set relationName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRelationName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelationName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get currentDays => $_getIZ(2);
  @$pb.TagNumber(3)
  set currentDays($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCurrentDays() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentDays() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get nextDays => $_getIZ(3);
  @$pb.TagNumber(4)
  set nextDays($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNextDays() => $_has(3);
  @$pb.TagNumber(4)
  void clearNextDays() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get nextDaysScoreNeed => $_getIZ(4);
  @$pb.TagNumber(5)
  set nextDaysScoreNeed($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNextDaysScoreNeed() => $_has(4);
  @$pb.TagNumber(5)
  void clearNextDaysScoreNeed() => clearField(5);
}

class RespCplinkDefendPatRankIndex extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespCplinkDefendPatRankIndex',
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
    ..aOM<PatRankUserData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftUser',
        subBuilder: PatRankUserData.create)
    ..aOM<PatRankUserData>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightUser',
        subBuilder: PatRankUserData.create)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..hasRequiredFields = false;

  RespCplinkDefendPatRankIndex._() : super();
  factory RespCplinkDefendPatRankIndex({
    $core.bool? success,
    $core.String? msg,
    PatRankUserData? leftUser,
    PatRankUserData? rightUser,
    $core.String? content,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (leftUser != null) {
      _result.leftUser = leftUser;
    }
    if (rightUser != null) {
      _result.rightUser = rightUser;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory RespCplinkDefendPatRankIndex.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespCplinkDefendPatRankIndex.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespCplinkDefendPatRankIndex clone() =>
      RespCplinkDefendPatRankIndex()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespCplinkDefendPatRankIndex copyWith(
          void Function(RespCplinkDefendPatRankIndex) updates) =>
      super.copyWith(
              (message) => updates(message as RespCplinkDefendPatRankIndex))
          as RespCplinkDefendPatRankIndex; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespCplinkDefendPatRankIndex create() =>
      RespCplinkDefendPatRankIndex._();
  RespCplinkDefendPatRankIndex createEmptyInstance() => create();
  static $pb.PbList<RespCplinkDefendPatRankIndex> createRepeated() =>
      $pb.PbList<RespCplinkDefendPatRankIndex>();
  @$core.pragma('dart2js:noInline')
  static RespCplinkDefendPatRankIndex getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespCplinkDefendPatRankIndex>(create);
  static RespCplinkDefendPatRankIndex? _defaultInstance;

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
  PatRankUserData get leftUser => $_getN(2);
  @$pb.TagNumber(3)
  set leftUser(PatRankUserData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLeftUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeftUser() => clearField(3);
  @$pb.TagNumber(3)
  PatRankUserData ensureLeftUser() => $_ensure(2);

  @$pb.TagNumber(4)
  PatRankUserData get rightUser => $_getN(3);
  @$pb.TagNumber(4)
  set rightUser(PatRankUserData v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRightUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearRightUser() => clearField(4);
  @$pb.TagNumber(4)
  PatRankUserData ensureRightUser() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get content => $_getSZ(4);
  @$pb.TagNumber(5)
  set content($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasContent() => $_has(4);
  @$pb.TagNumber(5)
  void clearContent() => clearField(5);
}

class ResDefendPatRankList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResDefendPatRankList',
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
    ..pc<DefendPatRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: DefendPatRankData.create)
    ..aOM<DefendPatRankData>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'myself',
        subBuilder: DefendPatRankData.create)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'link')
    ..hasRequiredFields = false;

  ResDefendPatRankList._() : super();
  factory ResDefendPatRankList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<DefendPatRankData>? list,
    DefendPatRankData? myself,
    $core.String? link,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (myself != null) {
      _result.myself = myself;
    }
    if (link != null) {
      _result.link = link;
    }
    return _result;
  }
  factory ResDefendPatRankList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResDefendPatRankList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResDefendPatRankList clone() =>
      ResDefendPatRankList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResDefendPatRankList copyWith(void Function(ResDefendPatRankList) updates) =>
      super.copyWith((message) => updates(message as ResDefendPatRankList))
          as ResDefendPatRankList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResDefendPatRankList create() => ResDefendPatRankList._();
  ResDefendPatRankList createEmptyInstance() => create();
  static $pb.PbList<ResDefendPatRankList> createRepeated() =>
      $pb.PbList<ResDefendPatRankList>();
  @$core.pragma('dart2js:noInline')
  static ResDefendPatRankList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResDefendPatRankList>(create);
  static ResDefendPatRankList? _defaultInstance;

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
  $core.List<DefendPatRankData> get list => $_getList(2);

  @$pb.TagNumber(4)
  DefendPatRankData get myself => $_getN(3);
  @$pb.TagNumber(4)
  set myself(DefendPatRankData v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMyself() => $_has(3);
  @$pb.TagNumber(4)
  void clearMyself() => clearField(4);
  @$pb.TagNumber(4)
  DefendPatRankData ensureMyself() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get link => $_getSZ(4);
  @$pb.TagNumber(5)
  set link($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLink() => $_has(4);
  @$pb.TagNumber(5)
  void clearLink() => clearField(5);
}

class DefendPatRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DefendPatRankData',
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
        $pb.PbFieldType.OU3)
    ..aOM<PatRankUserData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftUser',
        subBuilder: PatRankUserData.create)
    ..aOM<PatRankUserData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightUser',
        subBuilder: PatRankUserData.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relationName')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relationStartTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasRelationDay',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  DefendPatRankData._() : super();
  factory DefendPatRankData({
    $core.int? rank,
    PatRankUserData? leftUser,
    PatRankUserData? rightUser,
    $core.int? score,
    $core.String? relationName,
    $core.int? relationStartTime,
    $core.int? hasRelationDay,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank = rank;
    }
    if (leftUser != null) {
      _result.leftUser = leftUser;
    }
    if (rightUser != null) {
      _result.rightUser = rightUser;
    }
    if (score != null) {
      _result.score = score;
    }
    if (relationName != null) {
      _result.relationName = relationName;
    }
    if (relationStartTime != null) {
      _result.relationStartTime = relationStartTime;
    }
    if (hasRelationDay != null) {
      _result.hasRelationDay = hasRelationDay;
    }
    return _result;
  }
  factory DefendPatRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DefendPatRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DefendPatRankData clone() => DefendPatRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DefendPatRankData copyWith(void Function(DefendPatRankData) updates) =>
      super.copyWith((message) => updates(message as DefendPatRankData))
          as DefendPatRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DefendPatRankData create() => DefendPatRankData._();
  DefendPatRankData createEmptyInstance() => create();
  static $pb.PbList<DefendPatRankData> createRepeated() =>
      $pb.PbList<DefendPatRankData>();
  @$core.pragma('dart2js:noInline')
  static DefendPatRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DefendPatRankData>(create);
  static DefendPatRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rank => $_getIZ(0);
  @$pb.TagNumber(1)
  set rank($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearRank() => clearField(1);

  @$pb.TagNumber(2)
  PatRankUserData get leftUser => $_getN(1);
  @$pb.TagNumber(2)
  set leftUser(PatRankUserData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLeftUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeftUser() => clearField(2);
  @$pb.TagNumber(2)
  PatRankUserData ensureLeftUser() => $_ensure(1);

  @$pb.TagNumber(3)
  PatRankUserData get rightUser => $_getN(2);
  @$pb.TagNumber(3)
  set rightUser(PatRankUserData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRightUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearRightUser() => clearField(3);
  @$pb.TagNumber(3)
  PatRankUserData ensureRightUser() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get score => $_getIZ(3);
  @$pb.TagNumber(4)
  set score($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get relationName => $_getSZ(4);
  @$pb.TagNumber(5)
  set relationName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRelationName() => $_has(4);
  @$pb.TagNumber(5)
  void clearRelationName() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get relationStartTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set relationStartTime($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRelationStartTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearRelationStartTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get hasRelationDay => $_getIZ(6);
  @$pb.TagNumber(7)
  set hasRelationDay($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasHasRelationDay() => $_has(6);
  @$pb.TagNumber(7)
  void clearHasRelationDay() => clearField(7);
}

class PatRankUserData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PatRankUserData',
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

  PatRankUserData._() : super();
  factory PatRankUserData({
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
  factory PatRankUserData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PatRankUserData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PatRankUserData clone() => PatRankUserData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PatRankUserData copyWith(void Function(PatRankUserData) updates) =>
      super.copyWith((message) => updates(message as PatRankUserData))
          as PatRankUserData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PatRankUserData create() => PatRankUserData._();
  PatRankUserData createEmptyInstance() => create();
  static $pb.PbList<PatRankUserData> createRepeated() =>
      $pb.PbList<PatRankUserData>();
  @$core.pragma('dart2js:noInline')
  static PatRankUserData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PatRankUserData>(create);
  static PatRankUserData? _defaultInstance;

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
