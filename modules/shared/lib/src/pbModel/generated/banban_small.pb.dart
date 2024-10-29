///
//  Generated code. Do not modify.
//  source: banban_small.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResSmallAccountList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSmallAccountList',
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
    ..pc<SmallAccountList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: SmallAccountList.create)
    ..hasRequiredFields = false;

  ResSmallAccountList._() : super();
  factory ResSmallAccountList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<SmallAccountList>? list,
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
    return _result;
  }
  factory ResSmallAccountList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSmallAccountList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSmallAccountList clone() => ResSmallAccountList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSmallAccountList copyWith(void Function(ResSmallAccountList) updates) =>
      super.copyWith((message) => updates(message as ResSmallAccountList))
          as ResSmallAccountList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSmallAccountList create() => ResSmallAccountList._();
  ResSmallAccountList createEmptyInstance() => create();
  static $pb.PbList<ResSmallAccountList> createRepeated() =>
      $pb.PbList<ResSmallAccountList>();
  @$core.pragma('dart2js:noInline')
  static ResSmallAccountList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSmallAccountList>(create);
  static ResSmallAccountList? _defaultInstance;

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
  $core.List<SmallAccountList> get list => $_getList(2);
}

class ResSmallAccountListUid extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSmallAccountListUid',
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
    ..pc<UserItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: UserItem.create)
    ..hasRequiredFields = false;

  ResSmallAccountListUid._() : super();
  factory ResSmallAccountListUid({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<UserItem>? list,
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
    return _result;
  }
  factory ResSmallAccountListUid.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSmallAccountListUid.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSmallAccountListUid clone() =>
      ResSmallAccountListUid()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSmallAccountListUid copyWith(
          void Function(ResSmallAccountListUid) updates) =>
      super.copyWith((message) => updates(message as ResSmallAccountListUid))
          as ResSmallAccountListUid; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSmallAccountListUid create() => ResSmallAccountListUid._();
  ResSmallAccountListUid createEmptyInstance() => create();
  static $pb.PbList<ResSmallAccountListUid> createRepeated() =>
      $pb.PbList<ResSmallAccountListUid>();
  @$core.pragma('dart2js:noInline')
  static ResSmallAccountListUid getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSmallAccountListUid>(create);
  static ResSmallAccountListUid? _defaultInstance;

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
  $core.List<UserItem> get list => $_getList(2);
}

class ResTipsSwitchState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResTipsSwitchState',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'allowTips',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ResTipsSwitchState._() : super();
  factory ResTipsSwitchState({
    $core.bool? success,
    $core.String? msg,
    $core.int? allowTips,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (allowTips != null) {
      _result.allowTips = allowTips;
    }
    return _result;
  }
  factory ResTipsSwitchState.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResTipsSwitchState.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResTipsSwitchState clone() => ResTipsSwitchState()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResTipsSwitchState copyWith(void Function(ResTipsSwitchState) updates) =>
      super.copyWith((message) => updates(message as ResTipsSwitchState))
          as ResTipsSwitchState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResTipsSwitchState create() => ResTipsSwitchState._();
  ResTipsSwitchState createEmptyInstance() => create();
  static $pb.PbList<ResTipsSwitchState> createRepeated() =>
      $pb.PbList<ResTipsSwitchState>();
  @$core.pragma('dart2js:noInline')
  static ResTipsSwitchState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResTipsSwitchState>(create);
  static ResTipsSwitchState? _defaultInstance;

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
  $core.int get allowTips => $_getIZ(2);
  @$pb.TagNumber(3)
  set allowTips($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAllowTips() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowTips() => clearField(3);
}

class SmallAccountList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SmallAccountList',
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
            : 'state',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDiff')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineFriendCount',
        $pb.PbFieldType.OU3)
    ..pc<UserItem>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineFriendList',
        $pb.PbFieldType.PM,
        subBuilder: UserItem.create)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mobile')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prettyUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msgCount',
        $pb.PbFieldType.OU3)
    ..pc<UserItem>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msgList',
        $pb.PbFieldType.PM,
        subBuilder: UserItem.create)
    ..hasRequiredFields = false;

  SmallAccountList._() : super();
  factory SmallAccountList({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? state,
    $core.String? onlineDiff,
    $core.int? onlineFriendCount,
    $core.Iterable<UserItem>? onlineFriendList,
    $core.String? mobile,
    $core.int? prettyUid,
    $core.int? onlineDateline,
    $core.int? onlineStatus,
    $core.int? msgCount,
    $core.Iterable<UserItem>? msgList,
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
    if (state != null) {
      _result.state = state;
    }
    if (onlineDiff != null) {
      _result.onlineDiff = onlineDiff;
    }
    if (onlineFriendCount != null) {
      _result.onlineFriendCount = onlineFriendCount;
    }
    if (onlineFriendList != null) {
      _result.onlineFriendList.addAll(onlineFriendList);
    }
    if (mobile != null) {
      _result.mobile = mobile;
    }
    if (prettyUid != null) {
      _result.prettyUid = prettyUid;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (msgCount != null) {
      _result.msgCount = msgCount;
    }
    if (msgList != null) {
      _result.msgList.addAll(msgList);
    }
    return _result;
  }
  factory SmallAccountList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SmallAccountList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SmallAccountList clone() => SmallAccountList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SmallAccountList copyWith(void Function(SmallAccountList) updates) =>
      super.copyWith((message) => updates(message as SmallAccountList))
          as SmallAccountList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SmallAccountList create() => SmallAccountList._();
  SmallAccountList createEmptyInstance() => create();
  static $pb.PbList<SmallAccountList> createRepeated() =>
      $pb.PbList<SmallAccountList>();
  @$core.pragma('dart2js:noInline')
  static SmallAccountList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SmallAccountList>(create);
  static SmallAccountList? _defaultInstance;

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
  $core.int get state => $_getIZ(3);
  @$pb.TagNumber(4)
  set state($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get onlineDiff => $_getSZ(4);
  @$pb.TagNumber(5)
  set onlineDiff($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOnlineDiff() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineDiff() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get onlineFriendCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set onlineFriendCount($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOnlineFriendCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnlineFriendCount() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<UserItem> get onlineFriendList => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get mobile => $_getSZ(7);
  @$pb.TagNumber(8)
  set mobile($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMobile() => $_has(7);
  @$pb.TagNumber(8)
  void clearMobile() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get prettyUid => $_getIZ(8);
  @$pb.TagNumber(9)
  set prettyUid($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPrettyUid() => $_has(8);
  @$pb.TagNumber(9)
  void clearPrettyUid() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get onlineDateline => $_getIZ(9);
  @$pb.TagNumber(10)
  set onlineDateline($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasOnlineDateline() => $_has(9);
  @$pb.TagNumber(10)
  void clearOnlineDateline() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get onlineStatus => $_getIZ(10);
  @$pb.TagNumber(11)
  set onlineStatus($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasOnlineStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearOnlineStatus() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get msgCount => $_getIZ(11);
  @$pb.TagNumber(12)
  set msgCount($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasMsgCount() => $_has(11);
  @$pb.TagNumber(12)
  void clearMsgCount() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<UserItem> get msgList => $_getList(12);
}

class UserItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserItem',
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

  UserItem._() : super();
  factory UserItem({
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
  factory UserItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserItem clone() => UserItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserItem copyWith(void Function(UserItem) updates) =>
      super.copyWith((message) => updates(message as UserItem))
          as UserItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserItem create() => UserItem._();
  UserItem createEmptyInstance() => create();
  static $pb.PbList<UserItem> createRepeated() => $pb.PbList<UserItem>();
  @$core.pragma('dart2js:noInline')
  static UserItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserItem>(create);
  static UserItem? _defaultInstance;

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

class SmallAccountEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SmallAccountEntry',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showType',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showInterval',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SmallAccountEntry._() : super();
  factory SmallAccountEntry({
    $core.int? showType,
    $core.int? showInterval,
  }) {
    final _result = create();
    if (showType != null) {
      _result.showType = showType;
    }
    if (showInterval != null) {
      _result.showInterval = showInterval;
    }
    return _result;
  }
  factory SmallAccountEntry.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SmallAccountEntry.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SmallAccountEntry clone() => SmallAccountEntry()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SmallAccountEntry copyWith(void Function(SmallAccountEntry) updates) =>
      super.copyWith((message) => updates(message as SmallAccountEntry))
          as SmallAccountEntry; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SmallAccountEntry create() => SmallAccountEntry._();
  SmallAccountEntry createEmptyInstance() => create();
  static $pb.PbList<SmallAccountEntry> createRepeated() =>
      $pb.PbList<SmallAccountEntry>();
  @$core.pragma('dart2js:noInline')
  static SmallAccountEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SmallAccountEntry>(create);
  static SmallAccountEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get showType => $_getIZ(0);
  @$pb.TagNumber(1)
  set showType($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShowType() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get showInterval => $_getIZ(1);
  @$pb.TagNumber(2)
  set showInterval($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShowInterval() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowInterval() => clearField(2);
}

class ResSmallAccountEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSmallAccountEntry',
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
    ..aOM<SmallAccountEntry>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'entryInfo',
        subBuilder: SmallAccountEntry.create)
    ..hasRequiredFields = false;

  ResSmallAccountEntry._() : super();
  factory ResSmallAccountEntry({
    $core.bool? success,
    $core.String? msg,
    SmallAccountEntry? entryInfo,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (entryInfo != null) {
      _result.entryInfo = entryInfo;
    }
    return _result;
  }
  factory ResSmallAccountEntry.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSmallAccountEntry.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSmallAccountEntry clone() =>
      ResSmallAccountEntry()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSmallAccountEntry copyWith(void Function(ResSmallAccountEntry) updates) =>
      super.copyWith((message) => updates(message as ResSmallAccountEntry))
          as ResSmallAccountEntry; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSmallAccountEntry create() => ResSmallAccountEntry._();
  ResSmallAccountEntry createEmptyInstance() => create();
  static $pb.PbList<ResSmallAccountEntry> createRepeated() =>
      $pb.PbList<ResSmallAccountEntry>();
  @$core.pragma('dart2js:noInline')
  static ResSmallAccountEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSmallAccountEntry>(create);
  static ResSmallAccountEntry? _defaultInstance;

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
  SmallAccountEntry get entryInfo => $_getN(2);
  @$pb.TagNumber(3)
  set entryInfo(SmallAccountEntry v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEntryInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearEntryInfo() => clearField(3);
  @$pb.TagNumber(3)
  SmallAccountEntry ensureEntryInfo() => $_ensure(2);
}
