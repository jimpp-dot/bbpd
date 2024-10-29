///
//  Generated code. Do not modify.
//  source: chat_hi.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResMathCount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMathCount',
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
            : 'leftNum',
        $pb.PbFieldType.OU3,
        protoName: 'leftNum')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utype')
    ..pPS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'femaleList')
    ..pPS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maleList')
    ..hasRequiredFields = false;

  ResMathCount._() : super();
  factory ResMathCount({
    $core.bool? success,
    $core.String? msg,
    $core.int? leftNum,
    $core.String? utype,
    $core.Iterable<$core.String>? femaleList,
    $core.Iterable<$core.String>? maleList,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (leftNum != null) {
      _result.leftNum = leftNum;
    }
    if (utype != null) {
      _result.utype = utype;
    }
    if (femaleList != null) {
      _result.femaleList.addAll(femaleList);
    }
    if (maleList != null) {
      _result.maleList.addAll(maleList);
    }
    return _result;
  }
  factory ResMathCount.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMathCount.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMathCount clone() => ResMathCount()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMathCount copyWith(void Function(ResMathCount) updates) =>
      super.copyWith((message) => updates(message as ResMathCount))
          as ResMathCount; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMathCount create() => ResMathCount._();
  ResMathCount createEmptyInstance() => create();
  static $pb.PbList<ResMathCount> createRepeated() =>
      $pb.PbList<ResMathCount>();
  @$core.pragma('dart2js:noInline')
  static ResMathCount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMathCount>(create);
  static ResMathCount? _defaultInstance;

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
  $core.int get leftNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set leftNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLeftNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeftNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get utype => $_getSZ(3);
  @$pb.TagNumber(4)
  set utype($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUtype() => $_has(3);
  @$pb.TagNumber(4)
  void clearUtype() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get femaleList => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get maleList => $_getList(5);
}

class PreUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PreUser',
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

  PreUser._() : super();
  factory PreUser({
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
  factory PreUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PreUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PreUser clone() => PreUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PreUser copyWith(void Function(PreUser) updates) =>
      super.copyWith((message) => updates(message as PreUser))
          as PreUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PreUser create() => PreUser._();
  PreUser createEmptyInstance() => create();
  static $pb.PbList<PreUser> createRepeated() => $pb.PbList<PreUser>();
  @$core.pragma('dart2js:noInline')
  static PreUser getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PreUser>(create);
  static PreUser? _defaultInstance;

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

class LimitData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LimitData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpType',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tips')
    ..hasRequiredFields = false;

  LimitData._() : super();
  factory LimitData({
    $core.int? jumpType,
    $core.String? tips,
  }) {
    final _result = create();
    if (jumpType != null) {
      _result.jumpType = jumpType;
    }
    if (tips != null) {
      _result.tips = tips;
    }
    return _result;
  }
  factory LimitData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LimitData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LimitData clone() => LimitData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LimitData copyWith(void Function(LimitData) updates) =>
      super.copyWith((message) => updates(message as LimitData))
          as LimitData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LimitData create() => LimitData._();
  LimitData createEmptyInstance() => create();
  static $pb.PbList<LimitData> createRepeated() => $pb.PbList<LimitData>();
  @$core.pragma('dart2js:noInline')
  static LimitData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LimitData>(create);
  static LimitData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get jumpType => $_getIZ(0);
  @$pb.TagNumber(1)
  set jumpType($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasJumpType() => $_has(0);
  @$pb.TagNumber(1)
  void clearJumpType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tips => $_getSZ(1);
  @$pb.TagNumber(2)
  set tips($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTips() => $_has(1);
  @$pb.TagNumber(2)
  void clearTips() => clearField(2);
}

class ResMath extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMath',
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
    ..pc<PreUser>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: PreUser.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftNum',
        $pb.PbFieldType.OU3,
        protoName: 'leftNum')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'exception',
        $pb.PbFieldType.OU3)
    ..aOM<LimitData>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'limit',
        subBuilder: LimitData.create)
    ..hasRequiredFields = false;

  ResMath._() : super();
  factory ResMath({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<PreUser>? list,
    $core.int? leftNum,
    $core.int? exception,
    LimitData? limit,
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
    if (leftNum != null) {
      _result.leftNum = leftNum;
    }
    if (exception != null) {
      _result.exception = exception;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    return _result;
  }
  factory ResMath.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMath.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMath clone() => ResMath()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMath copyWith(void Function(ResMath) updates) =>
      super.copyWith((message) => updates(message as ResMath))
          as ResMath; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMath create() => ResMath._();
  ResMath createEmptyInstance() => create();
  static $pb.PbList<ResMath> createRepeated() => $pb.PbList<ResMath>();
  @$core.pragma('dart2js:noInline')
  static ResMath getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResMath>(create);
  static ResMath? _defaultInstance;

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
  $core.List<PreUser> get list => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get leftNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set leftNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLeftNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeftNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get exception => $_getIZ(4);
  @$pb.TagNumber(5)
  set exception($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasException() => $_has(4);
  @$pb.TagNumber(5)
  void clearException() => clearField(5);

  @$pb.TagNumber(6)
  LimitData get limit => $_getN(5);
  @$pb.TagNumber(6)
  set limit(LimitData v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLimit() => $_has(5);
  @$pb.TagNumber(6)
  void clearLimit() => clearField(6);
  @$pb.TagNumber(6)
  LimitData ensureLimit() => $_ensure(5);
}

class ResMsgList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMsgList',
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
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list')
    ..hasRequiredFields = false;

  ResMsgList._() : super();
  factory ResMsgList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<$core.String>? list,
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
  factory ResMsgList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMsgList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMsgList clone() => ResMsgList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMsgList copyWith(void Function(ResMsgList) updates) =>
      super.copyWith((message) => updates(message as ResMsgList))
          as ResMsgList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMsgList create() => ResMsgList._();
  ResMsgList createEmptyInstance() => create();
  static $pb.PbList<ResMsgList> createRepeated() => $pb.PbList<ResMsgList>();
  @$core.pragma('dart2js:noInline')
  static ResMsgList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMsgList>(create);
  static ResMsgList? _defaultInstance;

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
  $core.List<$core.String> get list => $_getList(2);
}
