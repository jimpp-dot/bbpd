///
//  Generated code. Do not modify.
//  source: vip_api_pretend.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'vip_rpc_pretend.pb.dart' as $0;

class ResPretendCateList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResPretendCateList',
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
    ..pc<$0.PretendCategory>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: $0.PretendCategory.create)
    ..hasRequiredFields = false;

  ResPretendCateList._() : super();
  factory ResPretendCateList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<$0.PretendCategory>? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory ResPretendCateList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResPretendCateList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResPretendCateList clone() => ResPretendCateList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResPretendCateList copyWith(void Function(ResPretendCateList) updates) =>
      super.copyWith((message) => updates(message as ResPretendCateList))
          as ResPretendCateList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResPretendCateList create() => ResPretendCateList._();
  ResPretendCateList createEmptyInstance() => create();
  static $pb.PbList<ResPretendCateList> createRepeated() =>
      $pb.PbList<ResPretendCateList>();
  @$core.pragma('dart2js:noInline')
  static ResPretendCateList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResPretendCateList>(create);
  static ResPretendCateList? _defaultInstance;

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
  $core.List<$0.PretendCategory> get data => $_getList(2);
}

class ResGroupList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGroupList',
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
    ..pc<$0.PretendGroupDetail>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: $0.PretendGroupDetail.create)
    ..hasRequiredFields = false;

  ResGroupList._() : super();
  factory ResGroupList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<$0.PretendGroupDetail>? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory ResGroupList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGroupList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGroupList clone() => ResGroupList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGroupList copyWith(void Function(ResGroupList) updates) =>
      super.copyWith((message) => updates(message as ResGroupList))
          as ResGroupList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGroupList create() => ResGroupList._();
  ResGroupList createEmptyInstance() => create();
  static $pb.PbList<ResGroupList> createRepeated() =>
      $pb.PbList<ResGroupList>();
  @$core.pragma('dart2js:noInline')
  static ResGroupList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGroupList>(create);
  static ResGroupList? _defaultInstance;

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
  $core.List<$0.PretendGroupDetail> get data => $_getList(2);
}

class ResPretend extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResPretend',
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
    ..aOM<$0.PretendGroupDetail>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: $0.PretendGroupDetail.create)
    ..hasRequiredFields = false;

  ResPretend._() : super();
  factory ResPretend({
    $core.bool? success,
    $core.String? msg,
    $0.PretendGroupDetail? data,
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
  factory ResPretend.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResPretend.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResPretend clone() => ResPretend()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResPretend copyWith(void Function(ResPretend) updates) =>
      super.copyWith((message) => updates(message as ResPretend))
          as ResPretend; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResPretend create() => ResPretend._();
  ResPretend createEmptyInstance() => create();
  static $pb.PbList<ResPretend> createRepeated() => $pb.PbList<ResPretend>();
  @$core.pragma('dart2js:noInline')
  static ResPretend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResPretend>(create);
  static ResPretend? _defaultInstance;

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
  $0.PretendGroupDetail get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($0.PretendGroupDetail v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  $0.PretendGroupDetail ensureData() => $_ensure(2);
}

class pretendLevelList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'pretendLevelList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starScore',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  pretendLevelList._() : super();
  factory pretendLevelList({
    $core.int? level,
    $core.int? starScore,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (starScore != null) {
      _result.starScore = starScore;
    }
    return _result;
  }
  factory pretendLevelList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory pretendLevelList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  pretendLevelList clone() => pretendLevelList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  pretendLevelList copyWith(void Function(pretendLevelList) updates) =>
      super.copyWith((message) => updates(message as pretendLevelList))
          as pretendLevelList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static pretendLevelList create() => pretendLevelList._();
  pretendLevelList createEmptyInstance() => create();
  static $pb.PbList<pretendLevelList> createRepeated() =>
      $pb.PbList<pretendLevelList>();
  @$core.pragma('dart2js:noInline')
  static pretendLevelList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<pretendLevelList>(create);
  static pretendLevelList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get starScore => $_getIZ(1);
  @$pb.TagNumber(2)
  set starScore($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStarScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearStarScore() => clearField(2);
}

class pretendMy extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'pretendMy',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<$0.PretendMyInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'my',
        subBuilder: $0.PretendMyInfo.create)
    ..pc<pretendLevelList>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: pretendLevelList.create)
    ..hasRequiredFields = false;

  pretendMy._() : super();
  factory pretendMy({
    $0.PretendMyInfo? my,
    $core.Iterable<pretendLevelList>? list,
  }) {
    final _result = create();
    if (my != null) {
      _result.my = my;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory pretendMy.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory pretendMy.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  pretendMy clone() => pretendMy()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  pretendMy copyWith(void Function(pretendMy) updates) =>
      super.copyWith((message) => updates(message as pretendMy))
          as pretendMy; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static pretendMy create() => pretendMy._();
  pretendMy createEmptyInstance() => create();
  static $pb.PbList<pretendMy> createRepeated() => $pb.PbList<pretendMy>();
  @$core.pragma('dart2js:noInline')
  static pretendMy getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<pretendMy>(create);
  static pretendMy? _defaultInstance;

  @$pb.TagNumber(1)
  $0.PretendMyInfo get my => $_getN(0);
  @$pb.TagNumber(1)
  set my($0.PretendMyInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMy() => $_has(0);
  @$pb.TagNumber(1)
  void clearMy() => clearField(1);
  @$pb.TagNumber(1)
  $0.PretendMyInfo ensureMy() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<pretendLevelList> get list => $_getList(1);
}

class ResPretendMy extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResPretendMy',
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
    ..aOM<pretendMy>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: pretendMy.create)
    ..hasRequiredFields = false;

  ResPretendMy._() : super();
  factory ResPretendMy({
    $core.bool? success,
    $core.String? msg,
    pretendMy? data,
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
  factory ResPretendMy.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResPretendMy.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResPretendMy clone() => ResPretendMy()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResPretendMy copyWith(void Function(ResPretendMy) updates) =>
      super.copyWith((message) => updates(message as ResPretendMy))
          as ResPretendMy; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResPretendMy create() => ResPretendMy._();
  ResPretendMy createEmptyInstance() => create();
  static $pb.PbList<ResPretendMy> createRepeated() =>
      $pb.PbList<ResPretendMy>();
  @$core.pragma('dart2js:noInline')
  static ResPretendMy getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResPretendMy>(create);
  static ResPretendMy? _defaultInstance;

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
  pretendMy get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(pretendMy v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  pretendMy ensureData() => $_ensure(2);
}
