///
//  Generated code. Do not modify.
//  source: chat_account_info.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ResAccountUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAccountUserInfo',
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
    ..aOM<AccountUserInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AccountUserInfo.create)
    ..hasRequiredFields = false;

  ResAccountUserInfo._() : super();
  factory ResAccountUserInfo({
    $core.bool? success,
    $core.String? msg,
    AccountUserInfo? data,
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
  factory ResAccountUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAccountUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAccountUserInfo clone() => ResAccountUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAccountUserInfo copyWith(void Function(ResAccountUserInfo) updates) =>
      super.copyWith((message) => updates(message as ResAccountUserInfo))
          as ResAccountUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAccountUserInfo create() => ResAccountUserInfo._();
  ResAccountUserInfo createEmptyInstance() => create();
  static $pb.PbList<ResAccountUserInfo> createRepeated() =>
      $pb.PbList<ResAccountUserInfo>();
  @$core.pragma('dart2js:noInline')
  static ResAccountUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAccountUserInfo>(create);
  static ResAccountUserInfo? _defaultInstance;

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
  AccountUserInfo get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AccountUserInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AccountUserInfo ensureData() => $_ensure(2);
}

class AccountUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccountUserInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<UserProfile>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Profile',
        protoName: 'Profile',
        subBuilder: UserProfile.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'markName')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isFollow',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userType',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..pc<ChatBgImage>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ChatBgImage.create)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalCount',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canUseCount',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AccountUserInfo._() : super();
  factory AccountUserInfo({
    UserProfile? profile,
    $core.String? markName,
    $core.int? isFollow,
    $core.int? userType,
    $core.int? age,
    $core.Iterable<ChatBgImage>? list,
    $core.int? totalCount,
    $core.int? canUseCount,
  }) {
    final _result = create();
    if (profile != null) {
      _result.profile = profile;
    }
    if (markName != null) {
      _result.markName = markName;
    }
    if (isFollow != null) {
      _result.isFollow = isFollow;
    }
    if (userType != null) {
      _result.userType = userType;
    }
    if (age != null) {
      _result.age = age;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (totalCount != null) {
      _result.totalCount = totalCount;
    }
    if (canUseCount != null) {
      _result.canUseCount = canUseCount;
    }
    return _result;
  }
  factory AccountUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountUserInfo clone() => AccountUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountUserInfo copyWith(void Function(AccountUserInfo) updates) =>
      super.copyWith((message) => updates(message as AccountUserInfo))
          as AccountUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountUserInfo create() => AccountUserInfo._();
  AccountUserInfo createEmptyInstance() => create();
  static $pb.PbList<AccountUserInfo> createRepeated() =>
      $pb.PbList<AccountUserInfo>();
  @$core.pragma('dart2js:noInline')
  static AccountUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountUserInfo>(create);
  static AccountUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  UserProfile get profile => $_getN(0);
  @$pb.TagNumber(1)
  set profile(UserProfile v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfile() => clearField(1);
  @$pb.TagNumber(1)
  UserProfile ensureProfile() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get markName => $_getSZ(1);
  @$pb.TagNumber(2)
  set markName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMarkName() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarkName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get isFollow => $_getIZ(2);
  @$pb.TagNumber(3)
  set isFollow($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsFollow() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsFollow() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get userType => $_getIZ(3);
  @$pb.TagNumber(4)
  set userType($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUserType() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserType() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get age => $_getIZ(4);
  @$pb.TagNumber(5)
  set age($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAge() => $_has(4);
  @$pb.TagNumber(5)
  void clearAge() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<ChatBgImage> get list => $_getList(5);

  @$pb.TagNumber(7)
  $core.int get totalCount => $_getIZ(6);
  @$pb.TagNumber(7)
  set totalCount($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTotalCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalCount() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get canUseCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set canUseCount($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCanUseCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearCanUseCount() => clearField(8);
}

class ChatBgImage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ChatBgImage',
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
            : 'status',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isUse',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..hasRequiredFields = false;

  ChatBgImage._() : super();
  factory ChatBgImage({
    $core.int? id,
    $core.int? status,
    $core.int? isUse,
    $core.String? url,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (status != null) {
      _result.status = status;
    }
    if (isUse != null) {
      _result.isUse = isUse;
    }
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory ChatBgImage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChatBgImage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChatBgImage clone() => ChatBgImage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChatBgImage copyWith(void Function(ChatBgImage) updates) =>
      super.copyWith((message) => updates(message as ChatBgImage))
          as ChatBgImage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatBgImage create() => ChatBgImage._();
  ChatBgImage createEmptyInstance() => create();
  static $pb.PbList<ChatBgImage> createRepeated() => $pb.PbList<ChatBgImage>();
  @$core.pragma('dart2js:noInline')
  static ChatBgImage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatBgImage>(create);
  static ChatBgImage? _defaultInstance;

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
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(2)
  set status($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get isUse => $_getIZ(2);
  @$pb.TagNumber(3)
  set isUse($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsUse() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsUse() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => clearField(4);
}

class UserProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserProfile',
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
            : 'appId',
        $pb.PbFieldType.O3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'video')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cover')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'job',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godCategory')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godMonthNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godWeekNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godDayNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godNowNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godDateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'city')
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cityCode',
        $pb.PbFieldType.OU3)
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..a<$core.double>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'longitude',
        $pb.PbFieldType.OD)
    ..a<$core.double>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'latitude',
        $pb.PbFieldType.OD)
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star',
        $pb.PbFieldType.O3)
    ..aOS(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tmpIcon')
    ..a<$core.int>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'updateTime',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blockUnAutherMessage',
        $pb.PbFieldType.OU3)
    ..aOS(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sign')
    ..a<$core.int>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payMoney',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payRoomMoney',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payOrderNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payReceiveToday',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godDefaultId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godDefaultCid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godDiscount',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godDiscountId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godDiscountCid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serviceScore',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serviceBusy',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'servicePause',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        46,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noticeOrder',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        47,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        48,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noticePower',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        49,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noticeGame',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        50,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'creditGod',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        51,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'creditUser',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        52,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'creditGodNow',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        53,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'creditGodWeek',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        54,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'creditGodDay',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        55,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        56,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friendState',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        57,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasVideo',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  UserProfile._() : super();
  factory UserProfile({
    $core.int? uid,
    $core.int? appId,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.String? video,
    $core.String? cover,
    $core.int? birthday,
    $core.int? job,
    $core.int? role,
    $core.String? godCategory,
    $core.int? godNum,
    $core.int? godMonthNum,
    $core.int? godWeekNum,
    $core.int? godDayNum,
    $core.int? godNowNum,
    $core.int? godDateline,
    $core.int? onlineStatus,
    $core.int? onlineDateline,
    $core.int? version,
    $core.String? city,
    $core.int? cityCode,
    $core.String? position,
    $core.double? longitude,
    $core.double? latitude,
    $core.int? dateline,
    $core.int? deleted,
    $core.int? star,
    $core.String? tmpIcon,
    $core.int? updateTime,
    $core.int? blockUnAutherMessage,
    $core.String? sign,
    $core.int? payNum,
    $core.int? payMoney,
    $fixnum.Int64? payRoomMoney,
    $core.int? payOrderNum,
    $core.int? payReceiveToday,
    $core.int? godDefaultId,
    $core.int? godDefaultCid,
    $core.int? godDiscount,
    $core.int? godDiscountId,
    $core.int? godDiscountCid,
    $core.int? serviceScore,
    $core.int? serviceBusy,
    $core.int? servicePause,
    $core.int? noticeOrder,
    $core.int? title,
    $core.int? noticePower,
    $core.int? noticeGame,
    $core.int? creditGod,
    $core.int? creditUser,
    $core.int? creditGodNow,
    $core.int? creditGodWeek,
    $core.int? creditGodDay,
    $core.int? tag,
    $core.int? friendState,
    $core.int? hasVideo_57,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (appId != null) {
      _result.appId = appId;
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
    if (video != null) {
      _result.video = video;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (job != null) {
      _result.job = job;
    }
    if (role != null) {
      _result.role = role;
    }
    if (godCategory != null) {
      _result.godCategory = godCategory;
    }
    if (godNum != null) {
      _result.godNum = godNum;
    }
    if (godMonthNum != null) {
      _result.godMonthNum = godMonthNum;
    }
    if (godWeekNum != null) {
      _result.godWeekNum = godWeekNum;
    }
    if (godDayNum != null) {
      _result.godDayNum = godDayNum;
    }
    if (godNowNum != null) {
      _result.godNowNum = godNowNum;
    }
    if (godDateline != null) {
      _result.godDateline = godDateline;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (version != null) {
      _result.version = version;
    }
    if (city != null) {
      _result.city = city;
    }
    if (cityCode != null) {
      _result.cityCode = cityCode;
    }
    if (position != null) {
      _result.position = position;
    }
    if (longitude != null) {
      _result.longitude = longitude;
    }
    if (latitude != null) {
      _result.latitude = latitude;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (star != null) {
      _result.star = star;
    }
    if (tmpIcon != null) {
      _result.tmpIcon = tmpIcon;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    if (blockUnAutherMessage != null) {
      _result.blockUnAutherMessage = blockUnAutherMessage;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    if (payNum != null) {
      _result.payNum = payNum;
    }
    if (payMoney != null) {
      _result.payMoney = payMoney;
    }
    if (payRoomMoney != null) {
      _result.payRoomMoney = payRoomMoney;
    }
    if (payOrderNum != null) {
      _result.payOrderNum = payOrderNum;
    }
    if (payReceiveToday != null) {
      _result.payReceiveToday = payReceiveToday;
    }
    if (godDefaultId != null) {
      _result.godDefaultId = godDefaultId;
    }
    if (godDefaultCid != null) {
      _result.godDefaultCid = godDefaultCid;
    }
    if (godDiscount != null) {
      _result.godDiscount = godDiscount;
    }
    if (godDiscountId != null) {
      _result.godDiscountId = godDiscountId;
    }
    if (godDiscountCid != null) {
      _result.godDiscountCid = godDiscountCid;
    }
    if (serviceScore != null) {
      _result.serviceScore = serviceScore;
    }
    if (serviceBusy != null) {
      _result.serviceBusy = serviceBusy;
    }
    if (servicePause != null) {
      _result.servicePause = servicePause;
    }
    if (noticeOrder != null) {
      _result.noticeOrder = noticeOrder;
    }
    if (title != null) {
      _result.title = title;
    }
    if (noticePower != null) {
      _result.noticePower = noticePower;
    }
    if (noticeGame != null) {
      _result.noticeGame = noticeGame;
    }
    if (creditGod != null) {
      _result.creditGod = creditGod;
    }
    if (creditUser != null) {
      _result.creditUser = creditUser;
    }
    if (creditGodNow != null) {
      _result.creditGodNow = creditGodNow;
    }
    if (creditGodWeek != null) {
      _result.creditGodWeek = creditGodWeek;
    }
    if (creditGodDay != null) {
      _result.creditGodDay = creditGodDay;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (friendState != null) {
      _result.friendState = friendState;
    }
    if (hasVideo_57 != null) {
      _result.hasVideo_57 = hasVideo_57;
    }
    return _result;
  }
  factory UserProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserProfile clone() => UserProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserProfile copyWith(void Function(UserProfile) updates) =>
      super.copyWith((message) => updates(message as UserProfile))
          as UserProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserProfile create() => UserProfile._();
  UserProfile createEmptyInstance() => create();
  static $pb.PbList<UserProfile> createRepeated() => $pb.PbList<UserProfile>();
  @$core.pragma('dart2js:noInline')
  static UserProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserProfile>(create);
  static UserProfile? _defaultInstance;

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
  $core.int get appId => $_getIZ(1);
  @$pb.TagNumber(2)
  set appId($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAppId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAppId() => clearField(2);

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
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get sex => $_getIZ(4);
  @$pb.TagNumber(5)
  set sex($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSex() => $_has(4);
  @$pb.TagNumber(5)
  void clearSex() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get video => $_getSZ(5);
  @$pb.TagNumber(6)
  set video($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVideo() => $_has(5);
  @$pb.TagNumber(6)
  void clearVideo() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get cover => $_getSZ(6);
  @$pb.TagNumber(7)
  set cover($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCover() => $_has(6);
  @$pb.TagNumber(7)
  void clearCover() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get birthday => $_getIZ(7);
  @$pb.TagNumber(8)
  set birthday($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasBirthday() => $_has(7);
  @$pb.TagNumber(8)
  void clearBirthday() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get job => $_getIZ(8);
  @$pb.TagNumber(9)
  set job($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasJob() => $_has(8);
  @$pb.TagNumber(9)
  void clearJob() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get role => $_getIZ(9);
  @$pb.TagNumber(10)
  set role($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRole() => $_has(9);
  @$pb.TagNumber(10)
  void clearRole() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get godCategory => $_getSZ(10);
  @$pb.TagNumber(11)
  set godCategory($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasGodCategory() => $_has(10);
  @$pb.TagNumber(11)
  void clearGodCategory() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get godNum => $_getIZ(11);
  @$pb.TagNumber(12)
  set godNum($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasGodNum() => $_has(11);
  @$pb.TagNumber(12)
  void clearGodNum() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get godMonthNum => $_getIZ(12);
  @$pb.TagNumber(13)
  set godMonthNum($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasGodMonthNum() => $_has(12);
  @$pb.TagNumber(13)
  void clearGodMonthNum() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get godWeekNum => $_getIZ(13);
  @$pb.TagNumber(14)
  set godWeekNum($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasGodWeekNum() => $_has(13);
  @$pb.TagNumber(14)
  void clearGodWeekNum() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get godDayNum => $_getIZ(14);
  @$pb.TagNumber(15)
  set godDayNum($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasGodDayNum() => $_has(14);
  @$pb.TagNumber(15)
  void clearGodDayNum() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get godNowNum => $_getIZ(15);
  @$pb.TagNumber(16)
  set godNowNum($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasGodNowNum() => $_has(15);
  @$pb.TagNumber(16)
  void clearGodNowNum() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get godDateline => $_getIZ(16);
  @$pb.TagNumber(17)
  set godDateline($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasGodDateline() => $_has(16);
  @$pb.TagNumber(17)
  void clearGodDateline() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get onlineStatus => $_getIZ(17);
  @$pb.TagNumber(18)
  set onlineStatus($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasOnlineStatus() => $_has(17);
  @$pb.TagNumber(18)
  void clearOnlineStatus() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get onlineDateline => $_getIZ(18);
  @$pb.TagNumber(19)
  set onlineDateline($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasOnlineDateline() => $_has(18);
  @$pb.TagNumber(19)
  void clearOnlineDateline() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get version => $_getIZ(19);
  @$pb.TagNumber(20)
  set version($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasVersion() => $_has(19);
  @$pb.TagNumber(20)
  void clearVersion() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get city => $_getSZ(20);
  @$pb.TagNumber(21)
  set city($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasCity() => $_has(20);
  @$pb.TagNumber(21)
  void clearCity() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get cityCode => $_getIZ(21);
  @$pb.TagNumber(22)
  set cityCode($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasCityCode() => $_has(21);
  @$pb.TagNumber(22)
  void clearCityCode() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get position => $_getSZ(22);
  @$pb.TagNumber(23)
  set position($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasPosition() => $_has(22);
  @$pb.TagNumber(23)
  void clearPosition() => clearField(23);

  @$pb.TagNumber(24)
  $core.double get longitude => $_getN(23);
  @$pb.TagNumber(24)
  set longitude($core.double v) {
    $_setDouble(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasLongitude() => $_has(23);
  @$pb.TagNumber(24)
  void clearLongitude() => clearField(24);

  @$pb.TagNumber(25)
  $core.double get latitude => $_getN(24);
  @$pb.TagNumber(25)
  set latitude($core.double v) {
    $_setDouble(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasLatitude() => $_has(24);
  @$pb.TagNumber(25)
  void clearLatitude() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get dateline => $_getIZ(25);
  @$pb.TagNumber(26)
  set dateline($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasDateline() => $_has(25);
  @$pb.TagNumber(26)
  void clearDateline() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get deleted => $_getIZ(26);
  @$pb.TagNumber(27)
  set deleted($core.int v) {
    $_setSignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasDeleted() => $_has(26);
  @$pb.TagNumber(27)
  void clearDeleted() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get star => $_getIZ(27);
  @$pb.TagNumber(28)
  set star($core.int v) {
    $_setSignedInt32(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasStar() => $_has(27);
  @$pb.TagNumber(28)
  void clearStar() => clearField(28);

  @$pb.TagNumber(29)
  $core.String get tmpIcon => $_getSZ(28);
  @$pb.TagNumber(29)
  set tmpIcon($core.String v) {
    $_setString(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasTmpIcon() => $_has(28);
  @$pb.TagNumber(29)
  void clearTmpIcon() => clearField(29);

  @$pb.TagNumber(30)
  $core.int get updateTime => $_getIZ(29);
  @$pb.TagNumber(30)
  set updateTime($core.int v) {
    $_setSignedInt32(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasUpdateTime() => $_has(29);
  @$pb.TagNumber(30)
  void clearUpdateTime() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get blockUnAutherMessage => $_getIZ(30);
  @$pb.TagNumber(31)
  set blockUnAutherMessage($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasBlockUnAutherMessage() => $_has(30);
  @$pb.TagNumber(31)
  void clearBlockUnAutherMessage() => clearField(31);

  @$pb.TagNumber(32)
  $core.String get sign => $_getSZ(31);
  @$pb.TagNumber(32)
  set sign($core.String v) {
    $_setString(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasSign() => $_has(31);
  @$pb.TagNumber(32)
  void clearSign() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get payNum => $_getIZ(32);
  @$pb.TagNumber(33)
  set payNum($core.int v) {
    $_setUnsignedInt32(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasPayNum() => $_has(32);
  @$pb.TagNumber(33)
  void clearPayNum() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get payMoney => $_getIZ(33);
  @$pb.TagNumber(34)
  set payMoney($core.int v) {
    $_setUnsignedInt32(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasPayMoney() => $_has(33);
  @$pb.TagNumber(34)
  void clearPayMoney() => clearField(34);

  @$pb.TagNumber(35)
  $fixnum.Int64 get payRoomMoney => $_getI64(34);
  @$pb.TagNumber(35)
  set payRoomMoney($fixnum.Int64 v) {
    $_setInt64(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasPayRoomMoney() => $_has(34);
  @$pb.TagNumber(35)
  void clearPayRoomMoney() => clearField(35);

  @$pb.TagNumber(36)
  $core.int get payOrderNum => $_getIZ(35);
  @$pb.TagNumber(36)
  set payOrderNum($core.int v) {
    $_setUnsignedInt32(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasPayOrderNum() => $_has(35);
  @$pb.TagNumber(36)
  void clearPayOrderNum() => clearField(36);

  @$pb.TagNumber(37)
  $core.int get payReceiveToday => $_getIZ(36);
  @$pb.TagNumber(37)
  set payReceiveToday($core.int v) {
    $_setUnsignedInt32(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasPayReceiveToday() => $_has(36);
  @$pb.TagNumber(37)
  void clearPayReceiveToday() => clearField(37);

  @$pb.TagNumber(38)
  $core.int get godDefaultId => $_getIZ(37);
  @$pb.TagNumber(38)
  set godDefaultId($core.int v) {
    $_setUnsignedInt32(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasGodDefaultId() => $_has(37);
  @$pb.TagNumber(38)
  void clearGodDefaultId() => clearField(38);

  @$pb.TagNumber(39)
  $core.int get godDefaultCid => $_getIZ(38);
  @$pb.TagNumber(39)
  set godDefaultCid($core.int v) {
    $_setUnsignedInt32(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasGodDefaultCid() => $_has(38);
  @$pb.TagNumber(39)
  void clearGodDefaultCid() => clearField(39);

  @$pb.TagNumber(40)
  $core.int get godDiscount => $_getIZ(39);
  @$pb.TagNumber(40)
  set godDiscount($core.int v) {
    $_setUnsignedInt32(39, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasGodDiscount() => $_has(39);
  @$pb.TagNumber(40)
  void clearGodDiscount() => clearField(40);

  @$pb.TagNumber(41)
  $core.int get godDiscountId => $_getIZ(40);
  @$pb.TagNumber(41)
  set godDiscountId($core.int v) {
    $_setUnsignedInt32(40, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasGodDiscountId() => $_has(40);
  @$pb.TagNumber(41)
  void clearGodDiscountId() => clearField(41);

  @$pb.TagNumber(42)
  $core.int get godDiscountCid => $_getIZ(41);
  @$pb.TagNumber(42)
  set godDiscountCid($core.int v) {
    $_setUnsignedInt32(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasGodDiscountCid() => $_has(41);
  @$pb.TagNumber(42)
  void clearGodDiscountCid() => clearField(42);

  @$pb.TagNumber(43)
  $core.int get serviceScore => $_getIZ(42);
  @$pb.TagNumber(43)
  set serviceScore($core.int v) {
    $_setUnsignedInt32(42, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasServiceScore() => $_has(42);
  @$pb.TagNumber(43)
  void clearServiceScore() => clearField(43);

  @$pb.TagNumber(44)
  $core.int get serviceBusy => $_getIZ(43);
  @$pb.TagNumber(44)
  set serviceBusy($core.int v) {
    $_setUnsignedInt32(43, v);
  }

  @$pb.TagNumber(44)
  $core.bool hasServiceBusy() => $_has(43);
  @$pb.TagNumber(44)
  void clearServiceBusy() => clearField(44);

  @$pb.TagNumber(45)
  $core.int get servicePause => $_getIZ(44);
  @$pb.TagNumber(45)
  set servicePause($core.int v) {
    $_setUnsignedInt32(44, v);
  }

  @$pb.TagNumber(45)
  $core.bool hasServicePause() => $_has(44);
  @$pb.TagNumber(45)
  void clearServicePause() => clearField(45);

  @$pb.TagNumber(46)
  $core.int get noticeOrder => $_getIZ(45);
  @$pb.TagNumber(46)
  set noticeOrder($core.int v) {
    $_setUnsignedInt32(45, v);
  }

  @$pb.TagNumber(46)
  $core.bool hasNoticeOrder() => $_has(45);
  @$pb.TagNumber(46)
  void clearNoticeOrder() => clearField(46);

  @$pb.TagNumber(47)
  $core.int get title => $_getIZ(46);
  @$pb.TagNumber(47)
  set title($core.int v) {
    $_setUnsignedInt32(46, v);
  }

  @$pb.TagNumber(47)
  $core.bool hasTitle() => $_has(46);
  @$pb.TagNumber(47)
  void clearTitle() => clearField(47);

  @$pb.TagNumber(48)
  $core.int get noticePower => $_getIZ(47);
  @$pb.TagNumber(48)
  set noticePower($core.int v) {
    $_setUnsignedInt32(47, v);
  }

  @$pb.TagNumber(48)
  $core.bool hasNoticePower() => $_has(47);
  @$pb.TagNumber(48)
  void clearNoticePower() => clearField(48);

  @$pb.TagNumber(49)
  $core.int get noticeGame => $_getIZ(48);
  @$pb.TagNumber(49)
  set noticeGame($core.int v) {
    $_setUnsignedInt32(48, v);
  }

  @$pb.TagNumber(49)
  $core.bool hasNoticeGame() => $_has(48);
  @$pb.TagNumber(49)
  void clearNoticeGame() => clearField(49);

  @$pb.TagNumber(50)
  $core.int get creditGod => $_getIZ(49);
  @$pb.TagNumber(50)
  set creditGod($core.int v) {
    $_setSignedInt32(49, v);
  }

  @$pb.TagNumber(50)
  $core.bool hasCreditGod() => $_has(49);
  @$pb.TagNumber(50)
  void clearCreditGod() => clearField(50);

  @$pb.TagNumber(51)
  $core.int get creditUser => $_getIZ(50);
  @$pb.TagNumber(51)
  set creditUser($core.int v) {
    $_setSignedInt32(50, v);
  }

  @$pb.TagNumber(51)
  $core.bool hasCreditUser() => $_has(50);
  @$pb.TagNumber(51)
  void clearCreditUser() => clearField(51);

  @$pb.TagNumber(52)
  $core.int get creditGodNow => $_getIZ(51);
  @$pb.TagNumber(52)
  set creditGodNow($core.int v) {
    $_setSignedInt32(51, v);
  }

  @$pb.TagNumber(52)
  $core.bool hasCreditGodNow() => $_has(51);
  @$pb.TagNumber(52)
  void clearCreditGodNow() => clearField(52);

  @$pb.TagNumber(53)
  $core.int get creditGodWeek => $_getIZ(52);
  @$pb.TagNumber(53)
  set creditGodWeek($core.int v) {
    $_setSignedInt32(52, v);
  }

  @$pb.TagNumber(53)
  $core.bool hasCreditGodWeek() => $_has(52);
  @$pb.TagNumber(53)
  void clearCreditGodWeek() => clearField(53);

  @$pb.TagNumber(54)
  $core.int get creditGodDay => $_getIZ(53);
  @$pb.TagNumber(54)
  set creditGodDay($core.int v) {
    $_setSignedInt32(53, v);
  }

  @$pb.TagNumber(54)
  $core.bool hasCreditGodDay() => $_has(53);
  @$pb.TagNumber(54)
  void clearCreditGodDay() => clearField(54);

  @$pb.TagNumber(55)
  $core.int get tag => $_getIZ(54);
  @$pb.TagNumber(55)
  set tag($core.int v) {
    $_setUnsignedInt32(54, v);
  }

  @$pb.TagNumber(55)
  $core.bool hasTag() => $_has(54);
  @$pb.TagNumber(55)
  void clearTag() => clearField(55);

  @$pb.TagNumber(56)
  $core.int get friendState => $_getIZ(55);
  @$pb.TagNumber(56)
  set friendState($core.int v) {
    $_setUnsignedInt32(55, v);
  }

  @$pb.TagNumber(56)
  $core.bool hasFriendState() => $_has(55);
  @$pb.TagNumber(56)
  void clearFriendState() => clearField(56);

  @$pb.TagNumber(57)
  $core.int get hasVideo_57 => $_getIZ(56);
  @$pb.TagNumber(57)
  set hasVideo_57($core.int v) {
    $_setUnsignedInt32(56, v);
  }

  @$pb.TagNumber(57)
  $core.bool hasHasVideo_57() => $_has(56);
  @$pb.TagNumber(57)
  void clearHasVideo_57() => clearField(57);
}

class SetBgImgResNormal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SetBgImgResNormal',
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

  SetBgImgResNormal._() : super();
  factory SetBgImgResNormal({
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
  factory SetBgImgResNormal.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SetBgImgResNormal.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SetBgImgResNormal clone() => SetBgImgResNormal()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SetBgImgResNormal copyWith(void Function(SetBgImgResNormal) updates) =>
      super.copyWith((message) => updates(message as SetBgImgResNormal))
          as SetBgImgResNormal; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetBgImgResNormal create() => SetBgImgResNormal._();
  SetBgImgResNormal createEmptyInstance() => create();
  static $pb.PbList<SetBgImgResNormal> createRepeated() =>
      $pb.PbList<SetBgImgResNormal>();
  @$core.pragma('dart2js:noInline')
  static SetBgImgResNormal getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetBgImgResNormal>(create);
  static SetBgImgResNormal? _defaultInstance;

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
