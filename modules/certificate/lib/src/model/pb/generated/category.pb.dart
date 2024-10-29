///
//  Generated code. Do not modify.
//  source: category.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'entity_xs_video.pb.dart' as $0;

class ResCategoryIndex extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResCategoryIndex',
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
    ..pc<CategoryList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: CategoryList.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mobile',
        $pb.PbFieldType.OU3)
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'iconOk',
        protoName: 'iconOk')
    ..hasRequiredFields = false;

  ResCategoryIndex._() : super();
  factory ResCategoryIndex({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<CategoryList>? data,
    $core.int? role,
    $core.int? mobile,
    $core.bool? iconOk,
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
    if (role != null) {
      _result.role = role;
    }
    if (mobile != null) {
      _result.mobile = mobile;
    }
    if (iconOk != null) {
      _result.iconOk = iconOk;
    }
    return _result;
  }
  factory ResCategoryIndex.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResCategoryIndex.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResCategoryIndex clone() => ResCategoryIndex()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResCategoryIndex copyWith(void Function(ResCategoryIndex) updates) =>
      super.copyWith((message) => updates(message as ResCategoryIndex))
          as ResCategoryIndex; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResCategoryIndex create() => ResCategoryIndex._();
  ResCategoryIndex createEmptyInstance() => create();
  static $pb.PbList<ResCategoryIndex> createRepeated() =>
      $pb.PbList<ResCategoryIndex>();
  @$core.pragma('dart2js:noInline')
  static ResCategoryIndex getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResCategoryIndex>(create);
  static ResCategoryIndex? _defaultInstance;

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
  $core.List<CategoryList> get data => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get role => $_getIZ(3);
  @$pb.TagNumber(4)
  set role($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get mobile => $_getIZ(4);
  @$pb.TagNumber(5)
  set mobile($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMobile() => $_has(4);
  @$pb.TagNumber(5)
  void clearMobile() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get iconOk => $_getBF(5);
  @$pb.TagNumber(6)
  set iconOk($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIconOk() => $_has(5);
  @$pb.TagNumber(6)
  void clearIconOk() => clearField(6);
}

class CategoryList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CategoryList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..pc<CategoryInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: CategoryInfo.create)
    ..hasRequiredFields = false;

  CategoryList._() : super();
  factory CategoryList({
    $core.String? name,
    $core.Iterable<CategoryInfo>? list,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory CategoryList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CategoryList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CategoryList clone() => CategoryList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CategoryList copyWith(void Function(CategoryList) updates) =>
      super.copyWith((message) => updates(message as CategoryList))
          as CategoryList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CategoryList create() => CategoryList._();
  CategoryList createEmptyInstance() => create();
  static $pb.PbList<CategoryList> createRepeated() =>
      $pb.PbList<CategoryList>();
  @$core.pragma('dart2js:noInline')
  static CategoryList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategoryList>(create);
  static CategoryList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<CategoryInfo> get list => $_getList(1);
}

class CategoryInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CategoryInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pid',
        $pb.PbFieldType.OU3)
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
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dpath',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'verifyState',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  CategoryInfo._() : super();
  factory CategoryInfo({
    $core.int? cid,
    $core.int? pid,
    $core.String? name,
    $core.String? icon,
    $core.int? level,
    $core.int? dpath,
    $core.int? verifyState,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (pid != null) {
      _result.pid = pid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (level != null) {
      _result.level = level;
    }
    if (dpath != null) {
      _result.dpath = dpath;
    }
    if (verifyState != null) {
      _result.verifyState = verifyState;
    }
    return _result;
  }
  factory CategoryInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CategoryInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CategoryInfo clone() => CategoryInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CategoryInfo copyWith(void Function(CategoryInfo) updates) =>
      super.copyWith((message) => updates(message as CategoryInfo))
          as CategoryInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CategoryInfo create() => CategoryInfo._();
  CategoryInfo createEmptyInstance() => create();
  static $pb.PbList<CategoryInfo> createRepeated() =>
      $pb.PbList<CategoryInfo>();
  @$core.pragma('dart2js:noInline')
  static CategoryInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategoryInfo>(create);
  static CategoryInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pid => $_getIZ(1);
  @$pb.TagNumber(2)
  set pid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPid() => $_has(1);
  @$pb.TagNumber(2)
  void clearPid() => clearField(2);

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
  $core.int get level => $_getIZ(4);
  @$pb.TagNumber(5)
  set level($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLevel() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get dpath => $_getIZ(5);
  @$pb.TagNumber(6)
  set dpath($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDpath() => $_has(5);
  @$pb.TagNumber(6)
  void clearDpath() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get verifyState => $_getIZ(6);
  @$pb.TagNumber(7)
  set verifyState($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasVerifyState() => $_has(6);
  @$pb.TagNumber(7)
  void clearVerifyState() => clearField(7);
}

class CategoryRequested extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CategoryRequested',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'verifyState',
        $pb.PbFieldType.OU3,
        protoName: 'verifyState')
    ..hasRequiredFields = false;

  CategoryRequested._() : super();
  factory CategoryRequested({
    $core.int? cid,
    $core.int? verifyState,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (verifyState != null) {
      _result.verifyState = verifyState;
    }
    return _result;
  }
  factory CategoryRequested.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CategoryRequested.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CategoryRequested clone() => CategoryRequested()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CategoryRequested copyWith(void Function(CategoryRequested) updates) =>
      super.copyWith((message) => updates(message as CategoryRequested))
          as CategoryRequested; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CategoryRequested create() => CategoryRequested._();
  CategoryRequested createEmptyInstance() => create();
  static $pb.PbList<CategoryRequested> createRepeated() =>
      $pb.PbList<CategoryRequested>();
  @$core.pragma('dart2js:noInline')
  static CategoryRequested getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategoryRequested>(create);
  static CategoryRequested? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get verifyState => $_getIZ(1);
  @$pb.TagNumber(2)
  set verifyState($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVerifyState() => $_has(1);
  @$pb.TagNumber(2)
  void clearVerifyState() => clearField(2);
}

class ResCategoryDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResCategoryDetail',
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
    ..aOM<CategoryDetail>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category',
        subBuilder: CategoryDetail.create)
    ..aOM<CategoryVerify>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'verify',
        subBuilder: CategoryVerify.create)
    ..hasRequiredFields = false;

  ResCategoryDetail._() : super();
  factory ResCategoryDetail({
    $core.bool? success,
    $core.String? msg,
    CategoryDetail? category,
    CategoryVerify? verify,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (category != null) {
      _result.category = category;
    }
    if (verify != null) {
      _result.verify = verify;
    }
    return _result;
  }
  factory ResCategoryDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResCategoryDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResCategoryDetail clone() => ResCategoryDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResCategoryDetail copyWith(void Function(ResCategoryDetail) updates) =>
      super.copyWith((message) => updates(message as ResCategoryDetail))
          as ResCategoryDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResCategoryDetail create() => ResCategoryDetail._();
  ResCategoryDetail createEmptyInstance() => create();
  static $pb.PbList<ResCategoryDetail> createRepeated() =>
      $pb.PbList<ResCategoryDetail>();
  @$core.pragma('dart2js:noInline')
  static ResCategoryDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResCategoryDetail>(create);
  static ResCategoryDetail? _defaultInstance;

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
  CategoryDetail get category => $_getN(2);
  @$pb.TagNumber(3)
  set category(CategoryDetail v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCategory() => $_has(2);
  @$pb.TagNumber(3)
  void clearCategory() => clearField(3);
  @$pb.TagNumber(3)
  CategoryDetail ensureCategory() => $_ensure(2);

  @$pb.TagNumber(4)
  CategoryVerify get verify => $_getN(3);
  @$pb.TagNumber(4)
  set verify(CategoryVerify v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVerify() => $_has(3);
  @$pb.TagNumber(4)
  void clearVerify() => clearField(4);
  @$pb.TagNumber(4)
  CategoryVerify ensureVerify() => $_ensure(3);
}

class CategoryVerify extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CategoryVerify',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'verifyId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftCid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameId')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audio')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cover')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accompany')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameSystem')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'orderDescription')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'verifyState',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  CategoryVerify._() : super();
  factory CategoryVerify({
    $core.int? verifyId,
    $core.int? giftCid,
    $core.String? gameId,
    $core.String? audio,
    $core.String? cover,
    $core.String? accompany,
    $core.String? gameSystem,
    $core.int? level,
    $core.String? orderDescription,
    $core.int? verifyState,
  }) {
    final _result = create();
    if (verifyId != null) {
      _result.verifyId = verifyId;
    }
    if (giftCid != null) {
      _result.giftCid = giftCid;
    }
    if (gameId != null) {
      _result.gameId = gameId;
    }
    if (audio != null) {
      _result.audio = audio;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (accompany != null) {
      _result.accompany = accompany;
    }
    if (gameSystem != null) {
      _result.gameSystem = gameSystem;
    }
    if (level != null) {
      _result.level = level;
    }
    if (orderDescription != null) {
      _result.orderDescription = orderDescription;
    }
    if (verifyState != null) {
      _result.verifyState = verifyState;
    }
    return _result;
  }
  factory CategoryVerify.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CategoryVerify.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CategoryVerify clone() => CategoryVerify()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CategoryVerify copyWith(void Function(CategoryVerify) updates) =>
      super.copyWith((message) => updates(message as CategoryVerify))
          as CategoryVerify; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CategoryVerify create() => CategoryVerify._();
  CategoryVerify createEmptyInstance() => create();
  static $pb.PbList<CategoryVerify> createRepeated() =>
      $pb.PbList<CategoryVerify>();
  @$core.pragma('dart2js:noInline')
  static CategoryVerify getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategoryVerify>(create);
  static CategoryVerify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get verifyId => $_getIZ(0);
  @$pb.TagNumber(1)
  set verifyId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVerifyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerifyId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get giftCid => $_getIZ(1);
  @$pb.TagNumber(2)
  set giftCid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftCid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get gameId => $_getSZ(2);
  @$pb.TagNumber(3)
  set gameId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGameId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get audio => $_getSZ(3);
  @$pb.TagNumber(4)
  set audio($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAudio() => $_has(3);
  @$pb.TagNumber(4)
  void clearAudio() => clearField(4);

  @$pb.TagNumber(6)
  $core.String get cover => $_getSZ(4);
  @$pb.TagNumber(6)
  set cover($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCover() => $_has(4);
  @$pb.TagNumber(6)
  void clearCover() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get accompany => $_getSZ(5);
  @$pb.TagNumber(7)
  set accompany($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAccompany() => $_has(5);
  @$pb.TagNumber(7)
  void clearAccompany() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get gameSystem => $_getSZ(6);
  @$pb.TagNumber(8)
  set gameSystem($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGameSystem() => $_has(6);
  @$pb.TagNumber(8)
  void clearGameSystem() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get level => $_getIZ(7);
  @$pb.TagNumber(9)
  set level($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasLevel() => $_has(7);
  @$pb.TagNumber(9)
  void clearLevel() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get orderDescription => $_getSZ(8);
  @$pb.TagNumber(10)
  set orderDescription($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasOrderDescription() => $_has(8);
  @$pb.TagNumber(10)
  void clearOrderDescription() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get verifyState => $_getIZ(9);
  @$pb.TagNumber(11)
  set verifyState($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasVerifyState() => $_has(9);
  @$pb.TagNumber(11)
  void clearVerifyState() => clearField(11);
}

class CategoryDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CategoryDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameIdNeed',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audioNeed',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cond')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'coverExample')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'coverDescription')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audioDescription')
    ..pPS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audioExample')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'example')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'coverNeed',
        $pb.PbFieldType.OU3)
    ..pc<CategoryLevel>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelList',
        $pb.PbFieldType.PM,
        subBuilder: CategoryLevel.create)
    ..pPS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'systems')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cancelMoney',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  CategoryDetail._() : super();
  factory CategoryDetail({
    $core.int? cid,
    $core.int? gameIdNeed,
    $core.int? audioNeed,
    $core.String? description,
    $core.String? cond,
    $core.String? name,
    $core.String? coverExample,
    $core.String? coverDescription,
    $core.String? audioDescription,
    $core.Iterable<$core.String>? audioExample,
    $core.String? example,
    $core.int? coverNeed,
    $core.Iterable<CategoryLevel>? levelList,
    $core.Iterable<$core.String>? systems,
    $core.int? cancelMoney,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (gameIdNeed != null) {
      _result.gameIdNeed = gameIdNeed;
    }
    if (audioNeed != null) {
      _result.audioNeed = audioNeed;
    }
    if (description != null) {
      _result.description = description;
    }
    if (cond != null) {
      _result.cond = cond;
    }
    if (name != null) {
      _result.name = name;
    }
    if (coverExample != null) {
      _result.coverExample = coverExample;
    }
    if (coverDescription != null) {
      _result.coverDescription = coverDescription;
    }
    if (audioDescription != null) {
      _result.audioDescription = audioDescription;
    }
    if (audioExample != null) {
      _result.audioExample.addAll(audioExample);
    }
    if (example != null) {
      _result.example = example;
    }
    if (coverNeed != null) {
      _result.coverNeed = coverNeed;
    }
    if (levelList != null) {
      _result.levelList.addAll(levelList);
    }
    if (systems != null) {
      _result.systems.addAll(systems);
    }
    if (cancelMoney != null) {
      _result.cancelMoney = cancelMoney;
    }
    return _result;
  }
  factory CategoryDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CategoryDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CategoryDetail clone() => CategoryDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CategoryDetail copyWith(void Function(CategoryDetail) updates) =>
      super.copyWith((message) => updates(message as CategoryDetail))
          as CategoryDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CategoryDetail create() => CategoryDetail._();
  CategoryDetail createEmptyInstance() => create();
  static $pb.PbList<CategoryDetail> createRepeated() =>
      $pb.PbList<CategoryDetail>();
  @$core.pragma('dart2js:noInline')
  static CategoryDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategoryDetail>(create);
  static CategoryDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get gameIdNeed => $_getIZ(1);
  @$pb.TagNumber(2)
  set gameIdNeed($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGameIdNeed() => $_has(1);
  @$pb.TagNumber(2)
  void clearGameIdNeed() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get audioNeed => $_getIZ(2);
  @$pb.TagNumber(3)
  set audioNeed($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAudioNeed() => $_has(2);
  @$pb.TagNumber(3)
  void clearAudioNeed() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get cond => $_getSZ(4);
  @$pb.TagNumber(5)
  set cond($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCond() => $_has(4);
  @$pb.TagNumber(5)
  void clearCond() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get coverExample => $_getSZ(6);
  @$pb.TagNumber(7)
  set coverExample($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCoverExample() => $_has(6);
  @$pb.TagNumber(7)
  void clearCoverExample() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get coverDescription => $_getSZ(7);
  @$pb.TagNumber(8)
  set coverDescription($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCoverDescription() => $_has(7);
  @$pb.TagNumber(8)
  void clearCoverDescription() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get audioDescription => $_getSZ(8);
  @$pb.TagNumber(9)
  set audioDescription($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAudioDescription() => $_has(8);
  @$pb.TagNumber(9)
  void clearAudioDescription() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get audioExample => $_getList(9);

  @$pb.TagNumber(11)
  $core.String get example => $_getSZ(10);
  @$pb.TagNumber(11)
  set example($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasExample() => $_has(10);
  @$pb.TagNumber(11)
  void clearExample() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get coverNeed => $_getIZ(11);
  @$pb.TagNumber(12)
  set coverNeed($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasCoverNeed() => $_has(11);
  @$pb.TagNumber(12)
  void clearCoverNeed() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<CategoryLevel> get levelList => $_getList(12);

  @$pb.TagNumber(14)
  $core.List<$core.String> get systems => $_getList(13);

  @$pb.TagNumber(15)
  $core.int get cancelMoney => $_getIZ(14);
  @$pb.TagNumber(15)
  set cancelMoney($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasCancelMoney() => $_has(14);
  @$pb.TagNumber(15)
  void clearCancelMoney() => clearField(15);
}

class CategoryLevel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CategoryLevel',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..hasRequiredFields = false;

  CategoryLevel._() : super();
  factory CategoryLevel({
    $core.int? id,
    $core.String? title,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory CategoryLevel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CategoryLevel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CategoryLevel clone() => CategoryLevel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CategoryLevel copyWith(void Function(CategoryLevel) updates) =>
      super.copyWith((message) => updates(message as CategoryLevel))
          as CategoryLevel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CategoryLevel create() => CategoryLevel._();
  CategoryLevel createEmptyInstance() => create();
  static $pb.PbList<CategoryLevel> createRepeated() =>
      $pb.PbList<CategoryLevel>();
  @$core.pragma('dart2js:noInline')
  static CategoryLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategoryLevel>(create);
  static CategoryLevel? _defaultInstance;

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
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);
}

class CategoryGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CategoryGift',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.double>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OD)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftType')
    ..hasRequiredFields = false;

  CategoryGift._() : super();
  factory CategoryGift({
    $core.int? id,
    $core.String? name,
    $core.double? price,
    $core.String? icon,
    $core.String? giftType,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (price != null) {
      _result.price = price;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (giftType != null) {
      _result.giftType = giftType;
    }
    return _result;
  }
  factory CategoryGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CategoryGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CategoryGift clone() => CategoryGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CategoryGift copyWith(void Function(CategoryGift) updates) =>
      super.copyWith((message) => updates(message as CategoryGift))
          as CategoryGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CategoryGift create() => CategoryGift._();
  CategoryGift createEmptyInstance() => create();
  static $pb.PbList<CategoryGift> createRepeated() =>
      $pb.PbList<CategoryGift>();
  @$core.pragma('dart2js:noInline')
  static CategoryGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategoryGift>(create);
  static CategoryGift? _defaultInstance;

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
  $core.double get price => $_getN(2);
  @$pb.TagNumber(3)
  set price($core.double v) {
    $_setDouble(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);

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
  $core.String get giftType => $_getSZ(4);
  @$pb.TagNumber(5)
  set giftType($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftType() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftType() => clearField(5);
}

class ResCategoryVideo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResCategoryVideo',
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
    ..aOM<CategoryVideo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: CategoryVideo.create)
    ..hasRequiredFields = false;

  ResCategoryVideo._() : super();
  factory ResCategoryVideo({
    $core.bool? success,
    $core.String? msg,
    CategoryVideo? data,
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
  factory ResCategoryVideo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResCategoryVideo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResCategoryVideo clone() => ResCategoryVideo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResCategoryVideo copyWith(void Function(ResCategoryVideo) updates) =>
      super.copyWith((message) => updates(message as ResCategoryVideo))
          as ResCategoryVideo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResCategoryVideo create() => ResCategoryVideo._();
  ResCategoryVideo createEmptyInstance() => create();
  static $pb.PbList<ResCategoryVideo> createRepeated() =>
      $pb.PbList<ResCategoryVideo>();
  @$core.pragma('dart2js:noInline')
  static ResCategoryVideo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResCategoryVideo>(create);
  static ResCategoryVideo? _defaultInstance;

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
  CategoryVideo get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(CategoryVideo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  CategoryVideo ensureData() => $_ensure(2);
}

class CategoryVideo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CategoryVideo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<CategoryVideoUser>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: CategoryVideoUser.create)
    ..aOM<CategoryVideoDemo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'demo',
        subBuilder: CategoryVideoDemo.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userGodTagList')
    ..aOM<$0.EntityXsVideo>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'video',
        subBuilder: $0.EntityXsVideo.create)
    ..hasRequiredFields = false;

  CategoryVideo._() : super();
  factory CategoryVideo({
    CategoryVideoUser? user,
    CategoryVideoDemo? demo,
    $core.int? num,
    $core.Iterable<$core.String>? userGodTagList,
    $0.EntityXsVideo? video,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (demo != null) {
      _result.demo = demo;
    }
    if (num != null) {
      _result.num = num;
    }
    if (userGodTagList != null) {
      _result.userGodTagList.addAll(userGodTagList);
    }
    if (video != null) {
      _result.video = video;
    }
    return _result;
  }
  factory CategoryVideo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CategoryVideo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CategoryVideo clone() => CategoryVideo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CategoryVideo copyWith(void Function(CategoryVideo) updates) =>
      super.copyWith((message) => updates(message as CategoryVideo))
          as CategoryVideo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CategoryVideo create() => CategoryVideo._();
  CategoryVideo createEmptyInstance() => create();
  static $pb.PbList<CategoryVideo> createRepeated() =>
      $pb.PbList<CategoryVideo>();
  @$core.pragma('dart2js:noInline')
  static CategoryVideo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategoryVideo>(create);
  static CategoryVideo? _defaultInstance;

  @$pb.TagNumber(1)
  CategoryVideoUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(CategoryVideoUser v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  CategoryVideoUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  CategoryVideoDemo get demo => $_getN(1);
  @$pb.TagNumber(2)
  set demo(CategoryVideoDemo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDemo() => $_has(1);
  @$pb.TagNumber(2)
  void clearDemo() => clearField(2);
  @$pb.TagNumber(2)
  CategoryVideoDemo ensureDemo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get userGodTagList => $_getList(3);

  @$pb.TagNumber(5)
  $0.EntityXsVideo get video => $_getN(4);
  @$pb.TagNumber(5)
  set video($0.EntityXsVideo v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasVideo() => $_has(4);
  @$pb.TagNumber(5)
  void clearVideo() => clearField(5);
  @$pb.TagNumber(5)
  $0.EntityXsVideo ensureVideo() => $_ensure(4);
}

class CategoryVideoUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CategoryVideoUser',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tmpIcon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sign')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'year',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  CategoryVideoUser._() : super();
  factory CategoryVideoUser({
    $core.String? name,
    $core.String? icon,
    $core.String? tmpIcon,
    $core.String? sign,
    $core.int? sex,
    $core.int? year,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (tmpIcon != null) {
      _result.tmpIcon = tmpIcon;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (year != null) {
      _result.year = year;
    }
    return _result;
  }
  factory CategoryVideoUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CategoryVideoUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CategoryVideoUser clone() => CategoryVideoUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CategoryVideoUser copyWith(void Function(CategoryVideoUser) updates) =>
      super.copyWith((message) => updates(message as CategoryVideoUser))
          as CategoryVideoUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CategoryVideoUser create() => CategoryVideoUser._();
  CategoryVideoUser createEmptyInstance() => create();
  static $pb.PbList<CategoryVideoUser> createRepeated() =>
      $pb.PbList<CategoryVideoUser>();
  @$core.pragma('dart2js:noInline')
  static CategoryVideoUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategoryVideoUser>(create);
  static CategoryVideoUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tmpIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set tmpIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTmpIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearTmpIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sign => $_getSZ(3);
  @$pb.TagNumber(4)
  set sign($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearSign() => clearField(4);

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
  $core.int get year => $_getIZ(5);
  @$pb.TagNumber(6)
  set year($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasYear() => $_has(5);
  @$pb.TagNumber(6)
  void clearYear() => clearField(6);
}

class CategoryVideoDemo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CategoryVideoDemo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..hasRequiredFields = false;

  CategoryVideoDemo._() : super();
  factory CategoryVideoDemo({
    $core.String? icon,
    $core.String? description,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory CategoryVideoDemo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CategoryVideoDemo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CategoryVideoDemo clone() => CategoryVideoDemo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CategoryVideoDemo copyWith(void Function(CategoryVideoDemo) updates) =>
      super.copyWith((message) => updates(message as CategoryVideoDemo))
          as CategoryVideoDemo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CategoryVideoDemo create() => CategoryVideoDemo._();
  CategoryVideoDemo createEmptyInstance() => create();
  static $pb.PbList<CategoryVideoDemo> createRepeated() =>
      $pb.PbList<CategoryVideoDemo>();
  @$core.pragma('dart2js:noInline')
  static CategoryVideoDemo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CategoryVideoDemo>(create);
  static CategoryVideoDemo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);
}

class ResNormal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResNormal',
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

  ResNormal._() : super();
  factory ResNormal({
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
  factory ResNormal.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResNormal.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResNormal clone() => ResNormal()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResNormal copyWith(void Function(ResNormal) updates) =>
      super.copyWith((message) => updates(message as ResNormal))
          as ResNormal; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResNormal create() => ResNormal._();
  ResNormal createEmptyInstance() => create();
  static $pb.PbList<ResNormal> createRepeated() => $pb.PbList<ResNormal>();
  @$core.pragma('dart2js:noInline')
  static ResNormal getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResNormal>(create);
  static ResNormal? _defaultInstance;

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
