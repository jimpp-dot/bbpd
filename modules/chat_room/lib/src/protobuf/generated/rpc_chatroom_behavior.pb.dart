///
//  Generated code. Do not modify.
//  source: rpc_chatroom_behavior.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class OnMicParams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OnMicParams',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bossPosition',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isAdmin',
        $pb.PbFieldType.O3,
        protoName: 'isAdmin')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'refreshSuspectRole',
        protoName: 'refreshSuspectRole')
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'refreshGrabmic',
        protoName: 'refreshGrabmic')
    ..hasRequiredFields = false;

  OnMicParams._() : super();
  factory OnMicParams({
    $core.int? position,
    $core.int? uid,
    $core.int? current,
    $core.int? bossPosition,
    $core.int? isAdmin,
    $core.bool? refreshSuspectRole,
    $core.bool? refreshGrabmic,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (current != null) {
      _result.current = current;
    }
    if (bossPosition != null) {
      _result.bossPosition = bossPosition;
    }
    if (isAdmin != null) {
      _result.isAdmin = isAdmin;
    }
    if (refreshSuspectRole != null) {
      _result.refreshSuspectRole = refreshSuspectRole;
    }
    if (refreshGrabmic != null) {
      _result.refreshGrabmic = refreshGrabmic;
    }
    return _result;
  }
  factory OnMicParams.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OnMicParams.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OnMicParams clone() => OnMicParams()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OnMicParams copyWith(void Function(OnMicParams) updates) =>
      super.copyWith((message) => updates(message as OnMicParams))
          as OnMicParams; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OnMicParams create() => OnMicParams._();
  OnMicParams createEmptyInstance() => create();
  static $pb.PbList<OnMicParams> createRepeated() => $pb.PbList<OnMicParams>();
  @$core.pragma('dart2js:noInline')
  static OnMicParams getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OnMicParams>(create);
  static OnMicParams? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);

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
  $core.int get current => $_getIZ(2);
  @$pb.TagNumber(3)
  set current($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCurrent() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrent() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get bossPosition => $_getIZ(3);
  @$pb.TagNumber(4)
  set bossPosition($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBossPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearBossPosition() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get isAdmin => $_getIZ(4);
  @$pb.TagNumber(5)
  set isAdmin($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsAdmin() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsAdmin() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get refreshSuspectRole => $_getBF(5);
  @$pb.TagNumber(6)
  set refreshSuspectRole($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRefreshSuspectRole() => $_has(5);
  @$pb.TagNumber(6)
  void clearRefreshSuspectRole() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get refreshGrabmic => $_getBF(6);
  @$pb.TagNumber(7)
  set refreshGrabmic($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRefreshGrabmic() => $_has(6);
  @$pb.TagNumber(7)
  void clearRefreshGrabmic() => clearField(7);
}

class OffMicParams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OffMicParams',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isAdmin',
        $pb.PbFieldType.O3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'positionRole')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'refreshSuspectRole',
        protoName: 'refreshSuspectRole')
    ..hasRequiredFields = false;

  OffMicParams._() : super();
  factory OffMicParams({
    $core.int? position,
    $core.int? isAdmin,
    $core.String? positionRole,
    $core.bool? refreshSuspectRole,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (isAdmin != null) {
      _result.isAdmin = isAdmin;
    }
    if (positionRole != null) {
      _result.positionRole = positionRole;
    }
    if (refreshSuspectRole != null) {
      _result.refreshSuspectRole = refreshSuspectRole;
    }
    return _result;
  }
  factory OffMicParams.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OffMicParams.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OffMicParams clone() => OffMicParams()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OffMicParams copyWith(void Function(OffMicParams) updates) =>
      super.copyWith((message) => updates(message as OffMicParams))
          as OffMicParams; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OffMicParams create() => OffMicParams._();
  OffMicParams createEmptyInstance() => create();
  static $pb.PbList<OffMicParams> createRepeated() =>
      $pb.PbList<OffMicParams>();
  @$core.pragma('dart2js:noInline')
  static OffMicParams getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OffMicParams>(create);
  static OffMicParams? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get isAdmin => $_getIZ(1);
  @$pb.TagNumber(2)
  set isAdmin($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsAdmin() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAdmin() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get positionRole => $_getSZ(2);
  @$pb.TagNumber(3)
  set positionRole($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPositionRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearPositionRole() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get refreshSuspectRole => $_getBF(3);
  @$pb.TagNumber(4)
  set refreshSuspectRole($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRefreshSuspectRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefreshSuspectRole() => clearField(4);
}

class PositionTable extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PositionTable',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PositionTable._() : super();
  factory PositionTable({
    $core.int? position,
    $core.int? display,
    $core.int? uid,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (display != null) {
      _result.display = display;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PositionTable.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PositionTable.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PositionTable clone() => PositionTable()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PositionTable copyWith(void Function(PositionTable) updates) =>
      super.copyWith((message) => updates(message as PositionTable))
          as PositionTable; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PositionTable create() => PositionTable._();
  PositionTable createEmptyInstance() => create();
  static $pb.PbList<PositionTable> createRepeated() =>
      $pb.PbList<PositionTable>();
  @$core.pragma('dart2js:noInline')
  static PositionTable getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PositionTable>(create);
  static PositionTable? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get display => $_getIZ(1);
  @$pb.TagNumber(2)
  set display($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDisplay() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplay() => clearField(2);

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
}

class Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PositionTable>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'positionTable',
        $pb.PbFieldType.PM,
        subBuilder: PositionTable.create)
    ..hasRequiredFields = false;

  Options._() : super();
  factory Options({
    $core.Iterable<PositionTable>? positionTable,
  }) {
    final _result = create();
    if (positionTable != null) {
      _result.positionTable.addAll(positionTable);
    }
    return _result;
  }
  factory Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Options clone() => Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Options copyWith(void Function(Options) updates) =>
      super.copyWith((message) => updates(message as Options))
          as Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Options create() => Options._();
  Options createEmptyInstance() => create();
  static $pb.PbList<Options> createRepeated() => $pb.PbList<Options>();
  @$core.pragma('dart2js:noInline')
  static Options getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Options>(create);
  static Options? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PositionTable> get positionTable => $_getList(0);
}

class WaitMicParams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WaitMicParams',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'queueType',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        $pb.PbFieldType.O3)
    ..pc<WaitQueueRank>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'queueUsers',
        $pb.PbFieldType.PM,
        protoName: 'queueUsers',
        subBuilder: WaitQueueRank.create)
    ..aOM<Options>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: Options.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bossPosition',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  WaitMicParams._() : super();
  factory WaitMicParams({
    $core.int? queueType,
    $core.int? role,
    $core.Iterable<WaitQueueRank>? queueUsers,
    Options? options,
    $core.int? bossPosition,
  }) {
    final _result = create();
    if (queueType != null) {
      _result.queueType = queueType;
    }
    if (role != null) {
      _result.role = role;
    }
    if (queueUsers != null) {
      _result.queueUsers.addAll(queueUsers);
    }
    if (options != null) {
      _result.options = options;
    }
    if (bossPosition != null) {
      _result.bossPosition = bossPosition;
    }
    return _result;
  }
  factory WaitMicParams.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WaitMicParams.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WaitMicParams clone() => WaitMicParams()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WaitMicParams copyWith(void Function(WaitMicParams) updates) =>
      super.copyWith((message) => updates(message as WaitMicParams))
          as WaitMicParams; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WaitMicParams create() => WaitMicParams._();
  WaitMicParams createEmptyInstance() => create();
  static $pb.PbList<WaitMicParams> createRepeated() =>
      $pb.PbList<WaitMicParams>();
  @$core.pragma('dart2js:noInline')
  static WaitMicParams getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WaitMicParams>(create);
  static WaitMicParams? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get queueType => $_getIZ(0);
  @$pb.TagNumber(1)
  set queueType($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasQueueType() => $_has(0);
  @$pb.TagNumber(1)
  void clearQueueType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get role => $_getIZ(1);
  @$pb.TagNumber(2)
  set role($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<WaitQueueRank> get queueUsers => $_getList(2);

  @$pb.TagNumber(4)
  Options get options => $_getN(3);
  @$pb.TagNumber(4)
  set options(Options v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOptions() => $_has(3);
  @$pb.TagNumber(4)
  void clearOptions() => clearField(4);
  @$pb.TagNumber(4)
  Options ensureOptions() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get bossPosition => $_getIZ(4);
  @$pb.TagNumber(5)
  set bossPosition($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBossPosition() => $_has(4);
  @$pb.TagNumber(5)
  void clearBossPosition() => clearField(5);
}

class WaitQueueRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WaitQueueRank',
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
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payMoney',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payRoomMoney',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'datelineDiff')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'year',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'applyTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  WaitQueueRank._() : super();
  factory WaitQueueRank({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.int? birthday,
    $core.int? version,
    $core.int? payMoney,
    $fixnum.Int64? payRoomMoney,
    $core.int? title,
    $core.String? datelineDiff,
    $core.int? vip,
    $core.int? year,
    $core.int? applyTime,
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
    if (sex != null) {
      _result.sex = sex;
    }
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (version != null) {
      _result.version = version;
    }
    if (payMoney != null) {
      _result.payMoney = payMoney;
    }
    if (payRoomMoney != null) {
      _result.payRoomMoney = payRoomMoney;
    }
    if (title != null) {
      _result.title = title;
    }
    if (datelineDiff != null) {
      _result.datelineDiff = datelineDiff;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (year != null) {
      _result.year = year;
    }
    if (applyTime != null) {
      _result.applyTime = applyTime;
    }
    return _result;
  }
  factory WaitQueueRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WaitQueueRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WaitQueueRank clone() => WaitQueueRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WaitQueueRank copyWith(void Function(WaitQueueRank) updates) =>
      super.copyWith((message) => updates(message as WaitQueueRank))
          as WaitQueueRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WaitQueueRank create() => WaitQueueRank._();
  WaitQueueRank createEmptyInstance() => create();
  static $pb.PbList<WaitQueueRank> createRepeated() =>
      $pb.PbList<WaitQueueRank>();
  @$core.pragma('dart2js:noInline')
  static WaitQueueRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WaitQueueRank>(create);
  static WaitQueueRank? _defaultInstance;

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
  $core.int get sex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get birthday => $_getIZ(4);
  @$pb.TagNumber(5)
  set birthday($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBirthday() => $_has(4);
  @$pb.TagNumber(5)
  void clearBirthday() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get version => $_getIZ(5);
  @$pb.TagNumber(6)
  set version($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearVersion() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get payMoney => $_getIZ(6);
  @$pb.TagNumber(7)
  set payMoney($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPayMoney() => $_has(6);
  @$pb.TagNumber(7)
  void clearPayMoney() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get payRoomMoney => $_getI64(7);
  @$pb.TagNumber(8)
  set payRoomMoney($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPayRoomMoney() => $_has(7);
  @$pb.TagNumber(8)
  void clearPayRoomMoney() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get title => $_getIZ(8);
  @$pb.TagNumber(9)
  set title($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTitle() => $_has(8);
  @$pb.TagNumber(9)
  void clearTitle() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get datelineDiff => $_getSZ(9);
  @$pb.TagNumber(10)
  set datelineDiff($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDatelineDiff() => $_has(9);
  @$pb.TagNumber(10)
  void clearDatelineDiff() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get vip => $_getIZ(10);
  @$pb.TagNumber(11)
  set vip($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasVip() => $_has(10);
  @$pb.TagNumber(11)
  void clearVip() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get year => $_getIZ(11);
  @$pb.TagNumber(12)
  set year($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasYear() => $_has(11);
  @$pb.TagNumber(12)
  void clearYear() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get applyTime => $_getIZ(12);
  @$pb.TagNumber(13)
  set applyTime($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasApplyTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearApplyTime() => clearField(13);
}

class ResActionWaitMic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResActionWaitMic',
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
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data')
    ..hasRequiredFields = false;

  ResActionWaitMic._() : super();
  factory ResActionWaitMic({
    $core.bool? success,
    $core.String? msg,
    $core.String? data,
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
  factory ResActionWaitMic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResActionWaitMic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResActionWaitMic clone() => ResActionWaitMic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResActionWaitMic copyWith(void Function(ResActionWaitMic) updates) =>
      super.copyWith((message) => updates(message as ResActionWaitMic))
          as ResActionWaitMic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResActionWaitMic create() => ResActionWaitMic._();
  ResActionWaitMic createEmptyInstance() => create();
  static $pb.PbList<ResActionWaitMic> createRepeated() =>
      $pb.PbList<ResActionWaitMic>();
  @$core.pragma('dart2js:noInline')
  static ResActionWaitMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResActionWaitMic>(create);
  static ResActionWaitMic? _defaultInstance;

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
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(3)
  set data($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}

class ActionWaitMic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ActionWaitMic',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<WaitQueueRank>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: WaitQueueRank.create)
    ..pc<PositionTable>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'positionTable',
        $pb.PbFieldType.PM,
        subBuilder: PositionTable.create)
    ..hasRequiredFields = false;

  ActionWaitMic._() : super();
  factory ActionWaitMic({
    $core.Iterable<WaitQueueRank>? data,
    $core.Iterable<PositionTable>? positionTable,
  }) {
    final _result = create();
    if (data != null) {
      _result.data.addAll(data);
    }
    if (positionTable != null) {
      _result.positionTable.addAll(positionTable);
    }
    return _result;
  }
  factory ActionWaitMic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ActionWaitMic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ActionWaitMic clone() => ActionWaitMic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ActionWaitMic copyWith(void Function(ActionWaitMic) updates) =>
      super.copyWith((message) => updates(message as ActionWaitMic))
          as ActionWaitMic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ActionWaitMic create() => ActionWaitMic._();
  ActionWaitMic createEmptyInstance() => create();
  static $pb.PbList<ActionWaitMic> createRepeated() =>
      $pb.PbList<ActionWaitMic>();
  @$core.pragma('dart2js:noInline')
  static ActionWaitMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActionWaitMic>(create);
  static ActionWaitMic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<WaitQueueRank> get data => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<PositionTable> get positionTable => $_getList(1);
}

class RspRoomWaitMic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspRoomWaitMic',
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
    ..aOM<ActionWaitMic>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ActionWaitMic.create)
    ..hasRequiredFields = false;

  RspRoomWaitMic._() : super();
  factory RspRoomWaitMic({
    $core.bool? success,
    $core.String? msg,
    ActionWaitMic? data,
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
  factory RspRoomWaitMic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspRoomWaitMic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspRoomWaitMic clone() => RspRoomWaitMic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspRoomWaitMic copyWith(void Function(RspRoomWaitMic) updates) =>
      super.copyWith((message) => updates(message as RspRoomWaitMic))
          as RspRoomWaitMic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspRoomWaitMic create() => RspRoomWaitMic._();
  RspRoomWaitMic createEmptyInstance() => create();
  static $pb.PbList<RspRoomWaitMic> createRepeated() =>
      $pb.PbList<RspRoomWaitMic>();
  @$core.pragma('dart2js:noInline')
  static RspRoomWaitMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RspRoomWaitMic>(create);
  static RspRoomWaitMic? _defaultInstance;

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
  ActionWaitMic get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ActionWaitMic v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ActionWaitMic ensureData() => $_ensure(2);
}

class RspMicOp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RspMicOp',
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

  RspMicOp._() : super();
  factory RspMicOp({
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
  factory RspMicOp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RspMicOp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RspMicOp clone() => RspMicOp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RspMicOp copyWith(void Function(RspMicOp) updates) =>
      super.copyWith((message) => updates(message as RspMicOp))
          as RspMicOp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RspMicOp create() => RspMicOp._();
  RspMicOp createEmptyInstance() => create();
  static $pb.PbList<RspMicOp> createRepeated() => $pb.PbList<RspMicOp>();
  @$core.pragma('dart2js:noInline')
  static RspMicOp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RspMicOp>(create);
  static RspMicOp? _defaultInstance;

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
