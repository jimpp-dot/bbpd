///
//  Generated code. Do not modify.
//  source: esportmate.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class EsportTopInRoomDataNotify extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EsportTopInRoomDataNotify',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..aOM<EsportTopInRoomData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: EsportTopInRoomData.create)
    ..hasRequiredFields = false;

  EsportTopInRoomDataNotify._() : super();
  factory EsportTopInRoomDataNotify({
    $core.bool? show,
    EsportTopInRoomData? data,
  }) {
    final _result = create();
    if (show != null) {
      _result.show = show;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory EsportTopInRoomDataNotify.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EsportTopInRoomDataNotify.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EsportTopInRoomDataNotify clone() =>
      EsportTopInRoomDataNotify()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EsportTopInRoomDataNotify copyWith(
          void Function(EsportTopInRoomDataNotify) updates) =>
      super.copyWith((message) => updates(message as EsportTopInRoomDataNotify))
          as EsportTopInRoomDataNotify; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EsportTopInRoomDataNotify create() => EsportTopInRoomDataNotify._();
  EsportTopInRoomDataNotify createEmptyInstance() => create();
  static $pb.PbList<EsportTopInRoomDataNotify> createRepeated() =>
      $pb.PbList<EsportTopInRoomDataNotify>();
  @$core.pragma('dart2js:noInline')
  static EsportTopInRoomDataNotify getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EsportTopInRoomDataNotify>(create);
  static EsportTopInRoomDataNotify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get show => $_getBF(0);
  @$pb.TagNumber(1)
  set show($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShow() => $_has(0);
  @$pb.TagNumber(1)
  void clearShow() => clearField(1);

  @$pb.TagNumber(2)
  EsportTopInRoomData get data => $_getN(1);
  @$pb.TagNumber(2)
  set data(EsportTopInRoomData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
  @$pb.TagNumber(2)
  EsportTopInRoomData ensureData() => $_ensure(1);
}

class RespEsportTopInRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespEsportTopInRoom',
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
    ..aOM<EsportTopInRoomData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: EsportTopInRoomData.create)
    ..hasRequiredFields = false;

  RespEsportTopInRoom._() : super();
  factory RespEsportTopInRoom({
    $core.bool? success,
    $core.String? msg,
    EsportTopInRoomData? data,
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
  factory RespEsportTopInRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespEsportTopInRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespEsportTopInRoom clone() => RespEsportTopInRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespEsportTopInRoom copyWith(void Function(RespEsportTopInRoom) updates) =>
      super.copyWith((message) => updates(message as RespEsportTopInRoom))
          as RespEsportTopInRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespEsportTopInRoom create() => RespEsportTopInRoom._();
  RespEsportTopInRoom createEmptyInstance() => create();
  static $pb.PbList<RespEsportTopInRoom> createRepeated() =>
      $pb.PbList<RespEsportTopInRoom>();
  @$core.pragma('dart2js:noInline')
  static RespEsportTopInRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespEsportTopInRoom>(create);
  static RespEsportTopInRoom? _defaultInstance;

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
  EsportTopInRoomData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(EsportTopInRoomData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  EsportTopInRoomData ensureData() => $_ensure(2);
}

class EsportTopInRoomData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EsportTopInRoomData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'has')
    ..aOM<EsportMateUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'left',
        subBuilder: EsportMateUser.create)
    ..aOM<EsportMateUser>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'right',
        subBuilder: EsportMateUser.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  EsportTopInRoomData._() : super();
  factory EsportTopInRoomData({
    $core.bool? has,
    EsportMateUser? left,
    EsportMateUser? right,
    $core.int? money,
  }) {
    final _result = create();
    if (has != null) {
      _result.has = has;
    }
    if (left != null) {
      _result.left = left;
    }
    if (right != null) {
      _result.right = right;
    }
    if (money != null) {
      _result.money = money;
    }
    return _result;
  }
  factory EsportTopInRoomData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EsportTopInRoomData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EsportTopInRoomData clone() => EsportTopInRoomData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EsportTopInRoomData copyWith(void Function(EsportTopInRoomData) updates) =>
      super.copyWith((message) => updates(message as EsportTopInRoomData))
          as EsportTopInRoomData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EsportTopInRoomData create() => EsportTopInRoomData._();
  EsportTopInRoomData createEmptyInstance() => create();
  static $pb.PbList<EsportTopInRoomData> createRepeated() =>
      $pb.PbList<EsportTopInRoomData>();
  @$core.pragma('dart2js:noInline')
  static EsportTopInRoomData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EsportTopInRoomData>(create);
  static EsportTopInRoomData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get has => $_getBF(0);
  @$pb.TagNumber(1)
  set has($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHas() => $_has(0);
  @$pb.TagNumber(1)
  void clearHas() => clearField(1);

  @$pb.TagNumber(2)
  EsportMateUser get left => $_getN(1);
  @$pb.TagNumber(2)
  set left(EsportMateUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLeft() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeft() => clearField(2);
  @$pb.TagNumber(2)
  EsportMateUser ensureLeft() => $_ensure(1);

  @$pb.TagNumber(3)
  EsportMateUser get right => $_getN(2);
  @$pb.TagNumber(3)
  set right(EsportMateUser v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRight() => $_has(2);
  @$pb.TagNumber(3)
  void clearRight() => clearField(3);
  @$pb.TagNumber(3)
  EsportMateUser ensureRight() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get money => $_getIZ(3);
  @$pb.TagNumber(4)
  set money($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMoney() => $_has(3);
  @$pb.TagNumber(4)
  void clearMoney() => clearField(4);
}

class EsportMateUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EsportMateUser',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..hasRequiredFields = false;

  EsportMateUser._() : super();
  factory EsportMateUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? frame,
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
    if (frame != null) {
      _result.frame = frame;
    }
    return _result;
  }
  factory EsportMateUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EsportMateUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EsportMateUser clone() => EsportMateUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EsportMateUser copyWith(void Function(EsportMateUser) updates) =>
      super.copyWith((message) => updates(message as EsportMateUser))
          as EsportMateUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EsportMateUser create() => EsportMateUser._();
  EsportMateUser createEmptyInstance() => create();
  static $pb.PbList<EsportMateUser> createRepeated() =>
      $pb.PbList<EsportMateUser>();
  @$core.pragma('dart2js:noInline')
  static EsportMateUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EsportMateUser>(create);
  static EsportMateUser? _defaultInstance;

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
  $core.String get frame => $_getSZ(3);
  @$pb.TagNumber(4)
  set frame($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFrame() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrame() => clearField(4);
}

class RespEsportRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespEsportRank',
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
    ..aOM<EsportRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: EsportRankData.create)
    ..hasRequiredFields = false;

  RespEsportRank._() : super();
  factory RespEsportRank({
    $core.bool? success,
    $core.String? msg,
    EsportRankData? data,
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
  factory RespEsportRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespEsportRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespEsportRank clone() => RespEsportRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespEsportRank copyWith(void Function(RespEsportRank) updates) =>
      super.copyWith((message) => updates(message as RespEsportRank))
          as RespEsportRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespEsportRank create() => RespEsportRank._();
  RespEsportRank createEmptyInstance() => create();
  static $pb.PbList<RespEsportRank> createRepeated() =>
      $pb.PbList<RespEsportRank>();
  @$core.pragma('dart2js:noInline')
  static RespEsportRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespEsportRank>(create);
  static RespEsportRank? _defaultInstance;

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
  EsportRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(EsportRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  EsportRankData ensureData() => $_ensure(2);
}

class EsportRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EsportRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<EsportRankMember>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'todayRank',
        $pb.PbFieldType.PM,
        subBuilder: EsportRankMember.create)
    ..aOM<EsportRankMember>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'yestdayTop',
        subBuilder: EsportRankMember.create)
    ..aOM<EsportRankMe>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'todayMe',
        subBuilder: EsportRankMe.create)
    ..hasRequiredFields = false;

  EsportRankData._() : super();
  factory EsportRankData({
    $core.Iterable<EsportRankMember>? todayRank,
    EsportRankMember? yestdayTop,
    EsportRankMe? todayMe,
  }) {
    final _result = create();
    if (todayRank != null) {
      _result.todayRank.addAll(todayRank);
    }
    if (yestdayTop != null) {
      _result.yestdayTop = yestdayTop;
    }
    if (todayMe != null) {
      _result.todayMe = todayMe;
    }
    return _result;
  }
  factory EsportRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EsportRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EsportRankData clone() => EsportRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EsportRankData copyWith(void Function(EsportRankData) updates) =>
      super.copyWith((message) => updates(message as EsportRankData))
          as EsportRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EsportRankData create() => EsportRankData._();
  EsportRankData createEmptyInstance() => create();
  static $pb.PbList<EsportRankData> createRepeated() =>
      $pb.PbList<EsportRankData>();
  @$core.pragma('dart2js:noInline')
  static EsportRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EsportRankData>(create);
  static EsportRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<EsportRankMember> get todayRank => $_getList(0);

  @$pb.TagNumber(2)
  EsportRankMember get yestdayTop => $_getN(1);
  @$pb.TagNumber(2)
  set yestdayTop(EsportRankMember v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasYestdayTop() => $_has(1);
  @$pb.TagNumber(2)
  void clearYestdayTop() => clearField(2);
  @$pb.TagNumber(2)
  EsportRankMember ensureYestdayTop() => $_ensure(1);

  @$pb.TagNumber(3)
  EsportRankMe get todayMe => $_getN(2);
  @$pb.TagNumber(3)
  set todayMe(EsportRankMe v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTodayMe() => $_has(2);
  @$pb.TagNumber(3)
  void clearTodayMe() => clearField(3);
  @$pb.TagNumber(3)
  EsportRankMe ensureTodayMe() => $_ensure(2);
}

class EsportRankMember extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EsportRankMember',
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
        $pb.PbFieldType.O3)
    ..aOM<EsportMateUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'left',
        subBuilder: EsportMateUser.create)
    ..aOM<EsportMateUser>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'right',
        subBuilder: EsportMateUser.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  EsportRankMember._() : super();
  factory EsportRankMember({
    $core.int? rank,
    EsportMateUser? left,
    EsportMateUser? right,
    $core.int? money,
  }) {
    final _result = create();
    if (rank != null) {
      _result.rank = rank;
    }
    if (left != null) {
      _result.left = left;
    }
    if (right != null) {
      _result.right = right;
    }
    if (money != null) {
      _result.money = money;
    }
    return _result;
  }
  factory EsportRankMember.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EsportRankMember.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EsportRankMember clone() => EsportRankMember()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EsportRankMember copyWith(void Function(EsportRankMember) updates) =>
      super.copyWith((message) => updates(message as EsportRankMember))
          as EsportRankMember; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EsportRankMember create() => EsportRankMember._();
  EsportRankMember createEmptyInstance() => create();
  static $pb.PbList<EsportRankMember> createRepeated() =>
      $pb.PbList<EsportRankMember>();
  @$core.pragma('dart2js:noInline')
  static EsportRankMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EsportRankMember>(create);
  static EsportRankMember? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rank => $_getIZ(0);
  @$pb.TagNumber(1)
  set rank($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearRank() => clearField(1);

  @$pb.TagNumber(2)
  EsportMateUser get left => $_getN(1);
  @$pb.TagNumber(2)
  set left(EsportMateUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLeft() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeft() => clearField(2);
  @$pb.TagNumber(2)
  EsportMateUser ensureLeft() => $_ensure(1);

  @$pb.TagNumber(3)
  EsportMateUser get right => $_getN(2);
  @$pb.TagNumber(3)
  set right(EsportMateUser v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRight() => $_has(2);
  @$pb.TagNumber(3)
  void clearRight() => clearField(3);
  @$pb.TagNumber(3)
  EsportMateUser ensureRight() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get money => $_getIZ(3);
  @$pb.TagNumber(4)
  set money($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMoney() => $_has(3);
  @$pb.TagNumber(4)
  void clearMoney() => clearField(4);
}

class EsportRankMe extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EsportRankMe',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlock')
    ..aOM<EsportRankMember>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'me',
        subBuilder: EsportRankMember.create)
    ..hasRequiredFields = false;

  EsportRankMe._() : super();
  factory EsportRankMe({
    $core.bool? unlock,
    EsportRankMember? me,
  }) {
    final _result = create();
    if (unlock != null) {
      _result.unlock = unlock;
    }
    if (me != null) {
      _result.me = me;
    }
    return _result;
  }
  factory EsportRankMe.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EsportRankMe.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EsportRankMe clone() => EsportRankMe()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EsportRankMe copyWith(void Function(EsportRankMe) updates) =>
      super.copyWith((message) => updates(message as EsportRankMe))
          as EsportRankMe; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EsportRankMe create() => EsportRankMe._();
  EsportRankMe createEmptyInstance() => create();
  static $pb.PbList<EsportRankMe> createRepeated() =>
      $pb.PbList<EsportRankMe>();
  @$core.pragma('dart2js:noInline')
  static EsportRankMe getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EsportRankMe>(create);
  static EsportRankMe? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get unlock => $_getBF(0);
  @$pb.TagNumber(1)
  set unlock($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUnlock() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnlock() => clearField(1);

  @$pb.TagNumber(2)
  EsportRankMember get me => $_getN(1);
  @$pb.TagNumber(2)
  set me(EsportRankMember v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMe() => $_has(1);
  @$pb.TagNumber(2)
  void clearMe() => clearField(2);
  @$pb.TagNumber(2)
  EsportRankMember ensureMe() => $_ensure(1);
}
