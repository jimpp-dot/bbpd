///
//  Generated code. Do not modify.
//  source: guest.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RespGuestStats extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGuestStats',
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
            : 'total',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RespGuestStats._() : super();
  factory RespGuestStats({
    $core.bool? success,
    $core.String? msg,
    $core.int? total,
    $core.int? newNum,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (total != null) {
      _result.total = total;
    }
    if (newNum != null) {
      _result.newNum = newNum;
    }
    return _result;
  }
  factory RespGuestStats.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGuestStats.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGuestStats clone() => RespGuestStats()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGuestStats copyWith(void Function(RespGuestStats) updates) =>
      super.copyWith((message) => updates(message as RespGuestStats))
          as RespGuestStats; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGuestStats create() => RespGuestStats._();
  RespGuestStats createEmptyInstance() => create();
  static $pb.PbList<RespGuestStats> createRepeated() =>
      $pb.PbList<RespGuestStats>();
  @$core.pragma('dart2js:noInline')
  static RespGuestStats getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGuestStats>(create);
  static RespGuestStats? _defaultInstance;

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
  $core.int get total => $_getIZ(2);
  @$pb.TagNumber(3)
  set total($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotal() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get newNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set newNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNewNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearNewNum() => clearField(4);
}

class RespGuestList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGuestList',
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
            : 'next',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'page',
        $pb.PbFieldType.OU3)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hidden')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recharge')
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'registerLimit')
    ..pc<GuestUsers>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'users',
        $pb.PbFieldType.PM,
        subBuilder: GuestUsers.create)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'haveForbidden',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'profileIntegrity',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RespGuestList._() : super();
  factory RespGuestList({
    $core.bool? success,
    $core.String? msg,
    $core.int? next,
    $core.int? page,
    $core.bool? hidden,
    $core.bool? recharge,
    $core.bool? registerLimit,
    $core.Iterable<GuestUsers>? users,
    $core.int? haveForbidden,
    $core.int? profileIntegrity,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (next != null) {
      _result.next = next;
    }
    if (page != null) {
      _result.page = page;
    }
    if (hidden != null) {
      _result.hidden = hidden;
    }
    if (recharge != null) {
      _result.recharge = recharge;
    }
    if (registerLimit != null) {
      _result.registerLimit = registerLimit;
    }
    if (users != null) {
      _result.users.addAll(users);
    }
    if (haveForbidden != null) {
      _result.haveForbidden = haveForbidden;
    }
    if (profileIntegrity != null) {
      _result.profileIntegrity = profileIntegrity;
    }
    return _result;
  }
  factory RespGuestList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGuestList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGuestList clone() => RespGuestList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGuestList copyWith(void Function(RespGuestList) updates) =>
      super.copyWith((message) => updates(message as RespGuestList))
          as RespGuestList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGuestList create() => RespGuestList._();
  RespGuestList createEmptyInstance() => create();
  static $pb.PbList<RespGuestList> createRepeated() =>
      $pb.PbList<RespGuestList>();
  @$core.pragma('dart2js:noInline')
  static RespGuestList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGuestList>(create);
  static RespGuestList? _defaultInstance;

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
  $core.int get next => $_getIZ(2);
  @$pb.TagNumber(3)
  set next($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNext() => $_has(2);
  @$pb.TagNumber(3)
  void clearNext() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get page => $_getIZ(3);
  @$pb.TagNumber(4)
  set page($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPage() => $_has(3);
  @$pb.TagNumber(4)
  void clearPage() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get hidden => $_getBF(4);
  @$pb.TagNumber(5)
  set hidden($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHidden() => $_has(4);
  @$pb.TagNumber(5)
  void clearHidden() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get recharge => $_getBF(5);
  @$pb.TagNumber(6)
  set recharge($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRecharge() => $_has(5);
  @$pb.TagNumber(6)
  void clearRecharge() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get registerLimit => $_getBF(6);
  @$pb.TagNumber(7)
  set registerLimit($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRegisterLimit() => $_has(6);
  @$pb.TagNumber(7)
  void clearRegisterLimit() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<GuestUsers> get users => $_getList(7);

  @$pb.TagNumber(9)
  $core.int get haveForbidden => $_getIZ(8);
  @$pb.TagNumber(9)
  set haveForbidden($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasHaveForbidden() => $_has(8);
  @$pb.TagNumber(9)
  void clearHaveForbidden() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get profileIntegrity => $_getIZ(9);
  @$pb.TagNumber(10)
  set profileIntegrity($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasProfileIntegrity() => $_has(9);
  @$pb.TagNumber(10)
  void clearProfileIntegrity() => clearField(10);
}

class GuestUsers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuestUsers',
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
            : 'sex')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vnum',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'src')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isnew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GuestUsers._() : super();
  factory GuestUsers({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? sex,
    $core.int? deleted,
    $core.int? age,
    $core.int? titleNew,
    $core.int? vnum,
    $core.String? src,
    $core.int? isnew,
    $core.int? rid,
    $core.int? mic,
    $core.int? online,
    $core.int? time,
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
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (age != null) {
      _result.age = age;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    if (vnum != null) {
      _result.vnum = vnum;
    }
    if (src != null) {
      _result.src = src;
    }
    if (isnew != null) {
      _result.isnew = isnew;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (mic != null) {
      _result.mic = mic;
    }
    if (online != null) {
      _result.online = online;
    }
    if (time != null) {
      _result.time = time;
    }
    return _result;
  }
  factory GuestUsers.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuestUsers.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuestUsers clone() => GuestUsers()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuestUsers copyWith(void Function(GuestUsers) updates) =>
      super.copyWith((message) => updates(message as GuestUsers))
          as GuestUsers; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuestUsers create() => GuestUsers._();
  GuestUsers createEmptyInstance() => create();
  static $pb.PbList<GuestUsers> createRepeated() => $pb.PbList<GuestUsers>();
  @$core.pragma('dart2js:noInline')
  static GuestUsers getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuestUsers>(create);
  static GuestUsers? _defaultInstance;

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
  $core.String get sex => $_getSZ(3);
  @$pb.TagNumber(4)
  set sex($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get deleted => $_getIZ(4);
  @$pb.TagNumber(5)
  set deleted($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDeleted() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeleted() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get age => $_getIZ(5);
  @$pb.TagNumber(6)
  set age($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAge() => $_has(5);
  @$pb.TagNumber(6)
  void clearAge() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get titleNew => $_getIZ(6);
  @$pb.TagNumber(7)
  set titleNew($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTitleNew() => $_has(6);
  @$pb.TagNumber(7)
  void clearTitleNew() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get vnum => $_getIZ(7);
  @$pb.TagNumber(8)
  set vnum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasVnum() => $_has(7);
  @$pb.TagNumber(8)
  void clearVnum() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get src => $_getSZ(8);
  @$pb.TagNumber(9)
  set src($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSrc() => $_has(8);
  @$pb.TagNumber(9)
  void clearSrc() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get isnew => $_getIZ(9);
  @$pb.TagNumber(10)
  set isnew($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasIsnew() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsnew() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get rid => $_getIZ(10);
  @$pb.TagNumber(11)
  set rid($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasRid() => $_has(10);
  @$pb.TagNumber(11)
  void clearRid() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get mic => $_getIZ(11);
  @$pb.TagNumber(12)
  set mic($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasMic() => $_has(11);
  @$pb.TagNumber(12)
  void clearMic() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get online => $_getIZ(12);
  @$pb.TagNumber(13)
  set online($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasOnline() => $_has(12);
  @$pb.TagNumber(13)
  void clearOnline() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get time => $_getIZ(13);
  @$pb.TagNumber(14)
  set time($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasTime() => $_has(13);
  @$pb.TagNumber(14)
  void clearTime() => clearField(14);
}
