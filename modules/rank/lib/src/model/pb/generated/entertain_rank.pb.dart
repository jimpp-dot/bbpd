///
//  Generated code. Do not modify.
//  source: entertain_rank.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResEntertainRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResEntertainRank',
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
    ..aOM<EntertainRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: EntertainRankData.create)
    ..hasRequiredFields = false;

  ResEntertainRank._() : super();
  factory ResEntertainRank({
    $core.bool? success,
    $core.String? msg,
    EntertainRankData? data,
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
  factory ResEntertainRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResEntertainRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResEntertainRank clone() => ResEntertainRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResEntertainRank copyWith(void Function(ResEntertainRank) updates) =>
      super.copyWith((message) => updates(message as ResEntertainRank))
          as ResEntertainRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResEntertainRank create() => ResEntertainRank._();
  ResEntertainRank createEmptyInstance() => create();
  static $pb.PbList<ResEntertainRank> createRepeated() =>
      $pb.PbList<ResEntertainRank>();
  @$core.pragma('dart2js:noInline')
  static ResEntertainRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResEntertainRank>(create);
  static ResEntertainRank? _defaultInstance;

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
  EntertainRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(EntertainRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  EntertainRankData ensureData() => $_ensure(2);
}

class EntertainRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EntertainRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<EntertainRankItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: EntertainRankItem.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore')
    ..hasRequiredFields = false;

  EntertainRankData._() : super();
  factory EntertainRankData({
    $core.Iterable<EntertainRankItem>? list,
    $core.bool? hasMore,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    return _result;
  }
  factory EntertainRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EntertainRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EntertainRankData clone() => EntertainRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EntertainRankData copyWith(void Function(EntertainRankData) updates) =>
      super.copyWith((message) => updates(message as EntertainRankData))
          as EntertainRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EntertainRankData create() => EntertainRankData._();
  EntertainRankData createEmptyInstance() => create();
  static $pb.PbList<EntertainRankData> createRepeated() =>
      $pb.PbList<EntertainRankData>();
  @$core.pragma('dart2js:noInline')
  static EntertainRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EntertainRankData>(create);
  static EntertainRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<EntertainRankItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get hasMore => $_getBF(1);
  @$pb.TagNumber(2)
  set hasMore($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasMore() => clearField(2);
}

class EntertainRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EntertainRankItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<EntertainRankUser>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftUser',
        subBuilder: EntertainRankUser.create)
    ..aOM<EntertainRankUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightUser',
        subBuilder: EntertainRankUser.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
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
            : 'relation')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendLevel',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  EntertainRankItem._() : super();
  factory EntertainRankItem({
    EntertainRankUser? leftUser,
    EntertainRankUser? rightUser,
    $core.int? rank,
    $core.int? score,
    $core.String? relation,
    $core.int? defendLevel,
  }) {
    final _result = create();
    if (leftUser != null) {
      _result.leftUser = leftUser;
    }
    if (rightUser != null) {
      _result.rightUser = rightUser;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (score != null) {
      _result.score = score;
    }
    if (relation != null) {
      _result.relation = relation;
    }
    if (defendLevel != null) {
      _result.defendLevel = defendLevel;
    }
    return _result;
  }
  factory EntertainRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EntertainRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EntertainRankItem clone() => EntertainRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EntertainRankItem copyWith(void Function(EntertainRankItem) updates) =>
      super.copyWith((message) => updates(message as EntertainRankItem))
          as EntertainRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EntertainRankItem create() => EntertainRankItem._();
  EntertainRankItem createEmptyInstance() => create();
  static $pb.PbList<EntertainRankItem> createRepeated() =>
      $pb.PbList<EntertainRankItem>();
  @$core.pragma('dart2js:noInline')
  static EntertainRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EntertainRankItem>(create);
  static EntertainRankItem? _defaultInstance;

  @$pb.TagNumber(1)
  EntertainRankUser get leftUser => $_getN(0);
  @$pb.TagNumber(1)
  set leftUser(EntertainRankUser v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeftUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftUser() => clearField(1);
  @$pb.TagNumber(1)
  EntertainRankUser ensureLeftUser() => $_ensure(0);

  @$pb.TagNumber(2)
  EntertainRankUser get rightUser => $_getN(1);
  @$pb.TagNumber(2)
  set rightUser(EntertainRankUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRightUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightUser() => clearField(2);
  @$pb.TagNumber(2)
  EntertainRankUser ensureRightUser() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get rank => $_getIZ(2);
  @$pb.TagNumber(3)
  set rank($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRank() => $_has(2);
  @$pb.TagNumber(3)
  void clearRank() => clearField(3);

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
  $core.String get relation => $_getSZ(4);
  @$pb.TagNumber(5)
  set relation($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRelation() => $_has(4);
  @$pb.TagNumber(5)
  void clearRelation() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get defendLevel => $_getIZ(5);
  @$pb.TagNumber(6)
  set defendLevel($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDefendLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearDefendLevel() => clearField(6);
}

class EntertainRankUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EntertainRankUser',
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

  EntertainRankUser._() : super();
  factory EntertainRankUser({
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
  factory EntertainRankUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EntertainRankUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EntertainRankUser clone() => EntertainRankUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EntertainRankUser copyWith(void Function(EntertainRankUser) updates) =>
      super.copyWith((message) => updates(message as EntertainRankUser))
          as EntertainRankUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EntertainRankUser create() => EntertainRankUser._();
  EntertainRankUser createEmptyInstance() => create();
  static $pb.PbList<EntertainRankUser> createRepeated() =>
      $pb.PbList<EntertainRankUser>();
  @$core.pragma('dart2js:noInline')
  static EntertainRankUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EntertainRankUser>(create);
  static EntertainRankUser? _defaultInstance;

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
