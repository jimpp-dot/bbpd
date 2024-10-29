///
//  Generated code. Do not modify.
//  source: invite_for_gift.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class UnionInviteReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionInviteReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  UnionInviteReq._() : super();
  factory UnionInviteReq({
    $core.int? userId,
    $core.int? startId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (startId != null) {
      _result.startId = startId;
    }
    return _result;
  }
  factory UnionInviteReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionInviteReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionInviteReq clone() => UnionInviteReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionInviteReq copyWith(void Function(UnionInviteReq) updates) =>
      super.copyWith((message) => updates(message as UnionInviteReq))
          as UnionInviteReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionInviteReq create() => UnionInviteReq._();
  UnionInviteReq createEmptyInstance() => create();
  static $pb.PbList<UnionInviteReq> createRepeated() =>
      $pb.PbList<UnionInviteReq>();
  @$core.pragma('dart2js:noInline')
  static UnionInviteReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionInviteReq>(create);
  static UnionInviteReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get startId => $_getIZ(1);
  @$pb.TagNumber(2)
  set startId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStartId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartId() => clearField(2);
}

class ResInviteInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResInviteInfo',
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
    ..aOM<InviteDetail>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: InviteDetail.create)
    ..hasRequiredFields = false;

  ResInviteInfo._() : super();
  factory ResInviteInfo({
    $core.bool? success,
    $core.String? msg,
    InviteDetail? data,
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
  factory ResInviteInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResInviteInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResInviteInfo clone() => ResInviteInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResInviteInfo copyWith(void Function(ResInviteInfo) updates) =>
      super.copyWith((message) => updates(message as ResInviteInfo))
          as ResInviteInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResInviteInfo create() => ResInviteInfo._();
  ResInviteInfo createEmptyInstance() => create();
  static $pb.PbList<ResInviteInfo> createRepeated() =>
      $pb.PbList<ResInviteInfo>();
  @$core.pragma('dart2js:noInline')
  static ResInviteInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResInviteInfo>(create);
  static ResInviteInfo? _defaultInstance;

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
  InviteDetail get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(InviteDetail v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  InviteDetail ensureData() => $_ensure(2);
}

class InviteDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'InviteDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalReward')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekReward')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inviteCode')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startId',
        $pb.PbFieldType.OU3)
    ..pc<InvitedList>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inviteList',
        $pb.PbFieldType.PM,
        subBuilder: InvitedList.create)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
    ..hasRequiredFields = false;

  InviteDetail._() : super();
  factory InviteDetail({
    $core.int? userId,
    $core.String? userName,
    $core.String? totalReward,
    $core.String? weekReward,
    $core.String? inviteCode,
    $core.int? startId,
    $core.Iterable<InvitedList>? inviteList,
    $core.String? userIcon,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (totalReward != null) {
      _result.totalReward = totalReward;
    }
    if (weekReward != null) {
      _result.weekReward = weekReward;
    }
    if (inviteCode != null) {
      _result.inviteCode = inviteCode;
    }
    if (startId != null) {
      _result.startId = startId;
    }
    if (inviteList != null) {
      _result.inviteList.addAll(inviteList);
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    return _result;
  }
  factory InviteDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InviteDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InviteDetail clone() => InviteDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InviteDetail copyWith(void Function(InviteDetail) updates) =>
      super.copyWith((message) => updates(message as InviteDetail))
          as InviteDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InviteDetail create() => InviteDetail._();
  InviteDetail createEmptyInstance() => create();
  static $pb.PbList<InviteDetail> createRepeated() =>
      $pb.PbList<InviteDetail>();
  @$core.pragma('dart2js:noInline')
  static InviteDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteDetail>(create);
  static InviteDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get totalReward => $_getSZ(2);
  @$pb.TagNumber(3)
  set totalReward($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTotalReward() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalReward() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get weekReward => $_getSZ(3);
  @$pb.TagNumber(4)
  set weekReward($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWeekReward() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeekReward() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get inviteCode => $_getSZ(4);
  @$pb.TagNumber(5)
  set inviteCode($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasInviteCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearInviteCode() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get startId => $_getIZ(5);
  @$pb.TagNumber(6)
  set startId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStartId() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartId() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<InvitedList> get inviteList => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get userIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set userIcon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUserIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearUserIcon() => clearField(8);
}

class InvitedList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'InvitedList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userName')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userId',
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
            : 'outReward')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  InvitedList._() : super();
  factory InvitedList({
    $core.String? userName,
    $core.int? userId,
    $core.String? icon,
    $core.String? outReward,
    $core.int? status,
  }) {
    final _result = create();
    if (userName != null) {
      _result.userName = userName;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (outReward != null) {
      _result.outReward = outReward;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory InvitedList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InvitedList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InvitedList clone() => InvitedList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InvitedList copyWith(void Function(InvitedList) updates) =>
      super.copyWith((message) => updates(message as InvitedList))
          as InvitedList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InvitedList create() => InvitedList._();
  InvitedList createEmptyInstance() => create();
  static $pb.PbList<InvitedList> createRepeated() => $pb.PbList<InvitedList>();
  @$core.pragma('dart2js:noInline')
  static InvitedList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvitedList>(create);
  static InvitedList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userName => $_getSZ(0);
  @$pb.TagNumber(1)
  set userName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserName() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userId => $_getIZ(1);
  @$pb.TagNumber(2)
  set userId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

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
  $core.String get outReward => $_getSZ(3);
  @$pb.TagNumber(4)
  set outReward($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOutReward() => $_has(3);
  @$pb.TagNumber(4)
  void clearOutReward() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get status => $_getIZ(4);
  @$pb.TagNumber(5)
  set status($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);
}
