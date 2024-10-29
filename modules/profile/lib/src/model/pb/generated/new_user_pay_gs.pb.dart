///
//  Generated code. Do not modify.
//  source: new_user_pay_gs.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NewUserPayGsItem_RookieTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NewUserPayGsItem.RookieTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sevenNew',
        $pb.PbFieldType.OU3,
        protoName: 'sevenNew')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payLevel',
        $pb.PbFieldType.OU3,
        protoName: 'payLevel')
    ..hasRequiredFields = false;

  NewUserPayGsItem_RookieTag._() : super();
  factory NewUserPayGsItem_RookieTag({
    $core.int? sevenNew,
    $core.int? payLevel,
  }) {
    final _result = create();
    if (sevenNew != null) {
      _result.sevenNew = sevenNew;
    }
    if (payLevel != null) {
      _result.payLevel = payLevel;
    }
    return _result;
  }
  factory NewUserPayGsItem_RookieTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NewUserPayGsItem_RookieTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NewUserPayGsItem_RookieTag clone() =>
      NewUserPayGsItem_RookieTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NewUserPayGsItem_RookieTag copyWith(
          void Function(NewUserPayGsItem_RookieTag) updates) =>
      super.copyWith(
              (message) => updates(message as NewUserPayGsItem_RookieTag))
          as NewUserPayGsItem_RookieTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewUserPayGsItem_RookieTag create() => NewUserPayGsItem_RookieTag._();
  NewUserPayGsItem_RookieTag createEmptyInstance() => create();
  static $pb.PbList<NewUserPayGsItem_RookieTag> createRepeated() =>
      $pb.PbList<NewUserPayGsItem_RookieTag>();
  @$core.pragma('dart2js:noInline')
  static NewUserPayGsItem_RookieTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewUserPayGsItem_RookieTag>(create);
  static NewUserPayGsItem_RookieTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sevenNew => $_getIZ(0);
  @$pb.TagNumber(1)
  set sevenNew($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSevenNew() => $_has(0);
  @$pb.TagNumber(1)
  void clearSevenNew() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get payLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set payLevel($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPayLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayLevel() => clearField(2);
}

class NewUserPayGsItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NewUserPayGsItem',
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
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'registerTime',
        protoName: 'registerTime')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.OU3,
        protoName: 'onlineStatus')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online')
    ..aOM<NewUserPayGsItem_RookieTag>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rookie',
        subBuilder: NewUserPayGsItem_RookieTag.create)
    ..hasRequiredFields = false;

  NewUserPayGsItem._() : super();
  factory NewUserPayGsItem({
    $core.int? uid,
    $core.int? age,
    $core.int? sex,
    $core.int? vip,
    $core.String? name,
    $core.String? icon,
    $core.String? registerTime,
    $core.int? onlineStatus,
    $core.String? online,
    NewUserPayGsItem_RookieTag? rookie,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (age != null) {
      _result.age = age;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (registerTime != null) {
      _result.registerTime = registerTime;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (online != null) {
      _result.online = online;
    }
    if (rookie != null) {
      _result.rookie = rookie;
    }
    return _result;
  }
  factory NewUserPayGsItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NewUserPayGsItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NewUserPayGsItem clone() => NewUserPayGsItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NewUserPayGsItem copyWith(void Function(NewUserPayGsItem) updates) =>
      super.copyWith((message) => updates(message as NewUserPayGsItem))
          as NewUserPayGsItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewUserPayGsItem create() => NewUserPayGsItem._();
  NewUserPayGsItem createEmptyInstance() => create();
  static $pb.PbList<NewUserPayGsItem> createRepeated() =>
      $pb.PbList<NewUserPayGsItem>();
  @$core.pragma('dart2js:noInline')
  static NewUserPayGsItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewUserPayGsItem>(create);
  static NewUserPayGsItem? _defaultInstance;

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
  $core.int get age => $_getIZ(1);
  @$pb.TagNumber(2)
  set age($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAge() => $_has(1);
  @$pb.TagNumber(2)
  void clearAge() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get sex => $_getIZ(2);
  @$pb.TagNumber(3)
  set sex($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSex() => $_has(2);
  @$pb.TagNumber(3)
  void clearSex() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get vip => $_getIZ(3);
  @$pb.TagNumber(4)
  set vip($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVip() => $_has(3);
  @$pb.TagNumber(4)
  void clearVip() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get icon => $_getSZ(5);
  @$pb.TagNumber(6)
  set icon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get registerTime => $_getSZ(6);
  @$pb.TagNumber(7)
  set registerTime($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRegisterTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearRegisterTime() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get onlineStatus => $_getIZ(7);
  @$pb.TagNumber(8)
  set onlineStatus($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasOnlineStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearOnlineStatus() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get online => $_getSZ(8);
  @$pb.TagNumber(9)
  set online($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasOnline() => $_has(8);
  @$pb.TagNumber(9)
  void clearOnline() => clearField(9);

  @$pb.TagNumber(10)
  NewUserPayGsItem_RookieTag get rookie => $_getN(9);
  @$pb.TagNumber(10)
  set rookie(NewUserPayGsItem_RookieTag v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRookie() => $_has(9);
  @$pb.TagNumber(10)
  void clearRookie() => clearField(10);
  @$pb.TagNumber(10)
  NewUserPayGsItem_RookieTag ensureRookie() => $_ensure(9);
}

class ResNewUserPayGsData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResNewUserPayGsData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<NewUserPayGsItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.PM,
        subBuilder: NewUserPayGsItem.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore',
        protoName: 'hasMore')
    ..hasRequiredFields = false;

  ResNewUserPayGsData._() : super();
  factory ResNewUserPayGsData({
    $core.Iterable<NewUserPayGsItem>? rank,
    $core.bool? hasMore,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank.addAll(rank);
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    return _result;
  }
  factory ResNewUserPayGsData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResNewUserPayGsData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResNewUserPayGsData clone() => ResNewUserPayGsData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResNewUserPayGsData copyWith(void Function(ResNewUserPayGsData) updates) =>
      super.copyWith((message) => updates(message as ResNewUserPayGsData))
          as ResNewUserPayGsData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResNewUserPayGsData create() => ResNewUserPayGsData._();
  ResNewUserPayGsData createEmptyInstance() => create();
  static $pb.PbList<ResNewUserPayGsData> createRepeated() =>
      $pb.PbList<ResNewUserPayGsData>();
  @$core.pragma('dart2js:noInline')
  static ResNewUserPayGsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResNewUserPayGsData>(create);
  static ResNewUserPayGsData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<NewUserPayGsItem> get rank => $_getList(0);

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

class ResNewUserPayGsRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResNewUserPayGsRank',
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
    ..aOM<ResNewUserPayGsData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResNewUserPayGsData.create)
    ..hasRequiredFields = false;

  ResNewUserPayGsRank._() : super();
  factory ResNewUserPayGsRank({
    $core.bool? success,
    $core.String? msg,
    ResNewUserPayGsData? data,
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
  factory ResNewUserPayGsRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResNewUserPayGsRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResNewUserPayGsRank clone() => ResNewUserPayGsRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResNewUserPayGsRank copyWith(void Function(ResNewUserPayGsRank) updates) =>
      super.copyWith((message) => updates(message as ResNewUserPayGsRank))
          as ResNewUserPayGsRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResNewUserPayGsRank create() => ResNewUserPayGsRank._();
  ResNewUserPayGsRank createEmptyInstance() => create();
  static $pb.PbList<ResNewUserPayGsRank> createRepeated() =>
      $pb.PbList<ResNewUserPayGsRank>();
  @$core.pragma('dart2js:noInline')
  static ResNewUserPayGsRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResNewUserPayGsRank>(create);
  static ResNewUserPayGsRank? _defaultInstance;

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
  ResNewUserPayGsData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ResNewUserPayGsData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ResNewUserPayGsData ensureData() => $_ensure(2);
}

class ResGsTransferStat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGsTransferStat',
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
    ..aOM<GsTransferStat>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GsTransferStat.create)
    ..hasRequiredFields = false;

  ResGsTransferStat._() : super();
  factory ResGsTransferStat({
    $core.bool? success,
    $core.String? msg,
    GsTransferStat? data,
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
  factory ResGsTransferStat.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGsTransferStat.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGsTransferStat clone() => ResGsTransferStat()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGsTransferStat copyWith(void Function(ResGsTransferStat) updates) =>
      super.copyWith((message) => updates(message as ResGsTransferStat))
          as ResGsTransferStat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGsTransferStat create() => ResGsTransferStat._();
  ResGsTransferStat createEmptyInstance() => create();
  static $pb.PbList<ResGsTransferStat> createRepeated() =>
      $pb.PbList<ResGsTransferStat>();
  @$core.pragma('dart2js:noInline')
  static ResGsTransferStat getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGsTransferStat>(create);
  static ResGsTransferStat? _defaultInstance;

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
  GsTransferStat get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GsTransferStat v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GsTransferStat ensureData() => $_ensure(2);
}

class GsTransferStat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsTransferStat',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'todayPoints',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currPoints',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sumPoints',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'todayTransfer',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sumTransfer',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GsTransferStat._() : super();
  factory GsTransferStat({
    $core.int? todayPoints,
    $core.int? currPoints,
    $core.int? sumPoints,
    $core.int? todayTransfer,
    $core.int? sumTransfer,
  }) {
    final _result = create();
    if (todayPoints != null) {
      _result.todayPoints = todayPoints;
    }
    if (currPoints != null) {
      _result.currPoints = currPoints;
    }
    if (sumPoints != null) {
      _result.sumPoints = sumPoints;
    }
    if (todayTransfer != null) {
      _result.todayTransfer = todayTransfer;
    }
    if (sumTransfer != null) {
      _result.sumTransfer = sumTransfer;
    }
    return _result;
  }
  factory GsTransferStat.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsTransferStat.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsTransferStat clone() => GsTransferStat()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsTransferStat copyWith(void Function(GsTransferStat) updates) =>
      super.copyWith((message) => updates(message as GsTransferStat))
          as GsTransferStat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsTransferStat create() => GsTransferStat._();
  GsTransferStat createEmptyInstance() => create();
  static $pb.PbList<GsTransferStat> createRepeated() =>
      $pb.PbList<GsTransferStat>();
  @$core.pragma('dart2js:noInline')
  static GsTransferStat getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsTransferStat>(create);
  static GsTransferStat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get todayPoints => $_getIZ(0);
  @$pb.TagNumber(1)
  set todayPoints($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTodayPoints() => $_has(0);
  @$pb.TagNumber(1)
  void clearTodayPoints() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get currPoints => $_getIZ(1);
  @$pb.TagNumber(2)
  set currPoints($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCurrPoints() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrPoints() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get sumPoints => $_getIZ(2);
  @$pb.TagNumber(3)
  set sumPoints($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSumPoints() => $_has(2);
  @$pb.TagNumber(3)
  void clearSumPoints() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get todayTransfer => $_getIZ(3);
  @$pb.TagNumber(4)
  set todayTransfer($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTodayTransfer() => $_has(3);
  @$pb.TagNumber(4)
  void clearTodayTransfer() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get sumTransfer => $_getIZ(4);
  @$pb.TagNumber(5)
  set sumTransfer($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSumTransfer() => $_has(4);
  @$pb.TagNumber(5)
  void clearSumTransfer() => clearField(5);
}

class ResGsTransferPointsDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGsTransferPointsDetail',
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
    ..aOM<GsTransferPointsData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GsTransferPointsData.create)
    ..hasRequiredFields = false;

  ResGsTransferPointsDetail._() : super();
  factory ResGsTransferPointsDetail({
    $core.bool? success,
    $core.String? msg,
    GsTransferPointsData? data,
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
  factory ResGsTransferPointsDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGsTransferPointsDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGsTransferPointsDetail clone() =>
      ResGsTransferPointsDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGsTransferPointsDetail copyWith(
          void Function(ResGsTransferPointsDetail) updates) =>
      super.copyWith((message) => updates(message as ResGsTransferPointsDetail))
          as ResGsTransferPointsDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGsTransferPointsDetail create() => ResGsTransferPointsDetail._();
  ResGsTransferPointsDetail createEmptyInstance() => create();
  static $pb.PbList<ResGsTransferPointsDetail> createRepeated() =>
      $pb.PbList<ResGsTransferPointsDetail>();
  @$core.pragma('dart2js:noInline')
  static ResGsTransferPointsDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGsTransferPointsDetail>(create);
  static ResGsTransferPointsDetail? _defaultInstance;

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
  GsTransferPointsData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GsTransferPointsData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GsTransferPointsData ensureData() => $_ensure(2);
}

class GsTransferPointsData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsTransferPointsData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GsTransferPointsTabs>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabs',
        $pb.PbFieldType.PM,
        subBuilder: GsTransferPointsTabs.create)
    ..pc<GsTransferPointsDetail>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: GsTransferPointsDetail.create)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore',
        protoName: 'hasMore')
    ..hasRequiredFields = false;

  GsTransferPointsData._() : super();
  factory GsTransferPointsData({
    $core.Iterable<GsTransferPointsTabs>? tabs,
    $core.Iterable<GsTransferPointsDetail>? list,
    $core.bool? hasMore,
  }) {
    final _result = create();
    if (tabs != null) {
      _result.tabs.addAll(tabs);
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    return _result;
  }
  factory GsTransferPointsData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsTransferPointsData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsTransferPointsData clone() =>
      GsTransferPointsData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsTransferPointsData copyWith(void Function(GsTransferPointsData) updates) =>
      super.copyWith((message) => updates(message as GsTransferPointsData))
          as GsTransferPointsData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsTransferPointsData create() => GsTransferPointsData._();
  GsTransferPointsData createEmptyInstance() => create();
  static $pb.PbList<GsTransferPointsData> createRepeated() =>
      $pb.PbList<GsTransferPointsData>();
  @$core.pragma('dart2js:noInline')
  static GsTransferPointsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsTransferPointsData>(create);
  static GsTransferPointsData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GsTransferPointsTabs> get tabs => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<GsTransferPointsDetail> get list => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get hasMore => $_getBF(2);
  @$pb.TagNumber(3)
  set hasMore($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHasMore() => $_has(2);
  @$pb.TagNumber(3)
  void clearHasMore() => clearField(3);
}

class GsTransferPointsTabs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsTransferPointsTabs',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabName')
    ..hasRequiredFields = false;

  GsTransferPointsTabs._() : super();
  factory GsTransferPointsTabs({
    $core.int? tabId,
    $core.String? tabName,
  }) {
    final _result = create();
    if (tabId != null) {
      _result.tabId = tabId;
    }
    if (tabName != null) {
      _result.tabName = tabName;
    }
    return _result;
  }
  factory GsTransferPointsTabs.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsTransferPointsTabs.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsTransferPointsTabs clone() =>
      GsTransferPointsTabs()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsTransferPointsTabs copyWith(void Function(GsTransferPointsTabs) updates) =>
      super.copyWith((message) => updates(message as GsTransferPointsTabs))
          as GsTransferPointsTabs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsTransferPointsTabs create() => GsTransferPointsTabs._();
  GsTransferPointsTabs createEmptyInstance() => create();
  static $pb.PbList<GsTransferPointsTabs> createRepeated() =>
      $pb.PbList<GsTransferPointsTabs>();
  @$core.pragma('dart2js:noInline')
  static GsTransferPointsTabs getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsTransferPointsTabs>(create);
  static GsTransferPointsTabs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tabId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tabId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTabId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTabId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tabName => $_getSZ(1);
  @$pb.TagNumber(2)
  set tabName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTabName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTabName() => clearField(2);
}

class GsTransferPointsDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsTransferPointsDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'points',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'opType',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subject')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time')
    ..hasRequiredFields = false;

  GsTransferPointsDetail._() : super();
  factory GsTransferPointsDetail({
    $core.int? points,
    $core.int? opType,
    $core.String? subject,
    $core.String? time,
  }) {
    final _result = create();
    if (points != null) {
      _result.points = points;
    }
    if (opType != null) {
      _result.opType = opType;
    }
    if (subject != null) {
      _result.subject = subject;
    }
    if (time != null) {
      _result.time = time;
    }
    return _result;
  }
  factory GsTransferPointsDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsTransferPointsDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsTransferPointsDetail clone() =>
      GsTransferPointsDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsTransferPointsDetail copyWith(
          void Function(GsTransferPointsDetail) updates) =>
      super.copyWith((message) => updates(message as GsTransferPointsDetail))
          as GsTransferPointsDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsTransferPointsDetail create() => GsTransferPointsDetail._();
  GsTransferPointsDetail createEmptyInstance() => create();
  static $pb.PbList<GsTransferPointsDetail> createRepeated() =>
      $pb.PbList<GsTransferPointsDetail>();
  @$core.pragma('dart2js:noInline')
  static GsTransferPointsDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsTransferPointsDetail>(create);
  static GsTransferPointsDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get points => $_getIZ(0);
  @$pb.TagNumber(1)
  set points($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPoints() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoints() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get opType => $_getIZ(1);
  @$pb.TagNumber(2)
  set opType($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOpType() => $_has(1);
  @$pb.TagNumber(2)
  void clearOpType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get subject => $_getSZ(2);
  @$pb.TagNumber(3)
  set subject($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSubject() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubject() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get time => $_getSZ(3);
  @$pb.TagNumber(4)
  set time($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearTime() => clearField(4);
}
