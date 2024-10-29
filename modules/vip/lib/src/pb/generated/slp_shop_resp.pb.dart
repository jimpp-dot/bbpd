///
//  Generated code. Do not modify.
//  source: slp_shop_resp.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'rpc_shop.pb.dart' as $0;
import 'rpc_credit_shop.pb.dart' as $1;

class ShopIndexResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShopIndexResp',
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
    ..aOM<$0.ShopIndexData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: $0.ShopIndexData.create)
    ..hasRequiredFields = false;

  ShopIndexResp._() : super();
  factory ShopIndexResp({
    $core.bool? success,
    $core.String? msg,
    $0.ShopIndexData? data,
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
  factory ShopIndexResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShopIndexResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShopIndexResp clone() => ShopIndexResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShopIndexResp copyWith(void Function(ShopIndexResp) updates) =>
      super.copyWith((message) => updates(message as ShopIndexResp))
          as ShopIndexResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopIndexResp create() => ShopIndexResp._();
  ShopIndexResp createEmptyInstance() => create();
  static $pb.PbList<ShopIndexResp> createRepeated() =>
      $pb.PbList<ShopIndexResp>();
  @$core.pragma('dart2js:noInline')
  static ShopIndexResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShopIndexResp>(create);
  static ShopIndexResp? _defaultInstance;

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
  $0.ShopIndexData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($0.ShopIndexData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  $0.ShopIndexData ensureData() => $_ensure(2);
}

class ShopCateListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShopCateListResp',
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
    ..pc<$0.ShopCateInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: $0.ShopCateInfo.create)
    ..hasRequiredFields = false;

  ShopCateListResp._() : super();
  factory ShopCateListResp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<$0.ShopCateInfo>? data,
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
  factory ShopCateListResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShopCateListResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShopCateListResp clone() => ShopCateListResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShopCateListResp copyWith(void Function(ShopCateListResp) updates) =>
      super.copyWith((message) => updates(message as ShopCateListResp))
          as ShopCateListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopCateListResp create() => ShopCateListResp._();
  ShopCateListResp createEmptyInstance() => create();
  static $pb.PbList<ShopCateListResp> createRepeated() =>
      $pb.PbList<ShopCateListResp>();
  @$core.pragma('dart2js:noInline')
  static ShopCateListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShopCateListResp>(create);
  static ShopCateListResp? _defaultInstance;

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
  $core.List<$0.ShopCateInfo> get data => $_getList(2);
}

class ShopBagDetailResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShopBagDetailResp',
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
    ..aOM<$0.ShopBag>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: $0.ShopBag.create)
    ..hasRequiredFields = false;

  ShopBagDetailResp._() : super();
  factory ShopBagDetailResp({
    $core.bool? success,
    $core.String? msg,
    $0.ShopBag? data,
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
  factory ShopBagDetailResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShopBagDetailResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShopBagDetailResp clone() => ShopBagDetailResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShopBagDetailResp copyWith(void Function(ShopBagDetailResp) updates) =>
      super.copyWith((message) => updates(message as ShopBagDetailResp))
          as ShopBagDetailResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopBagDetailResp create() => ShopBagDetailResp._();
  ShopBagDetailResp createEmptyInstance() => create();
  static $pb.PbList<ShopBagDetailResp> createRepeated() =>
      $pb.PbList<ShopBagDetailResp>();
  @$core.pragma('dart2js:noInline')
  static ShopBagDetailResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShopBagDetailResp>(create);
  static ShopBagDetailResp? _defaultInstance;

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
  $0.ShopBag get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($0.ShopBag v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  $0.ShopBag ensureData() => $_ensure(2);
}

class ShopBagListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShopBagListResp',
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
    ..pc<$0.ShopBag>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: $0.ShopBag.create)
    ..hasRequiredFields = false;

  ShopBagListResp._() : super();
  factory ShopBagListResp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<$0.ShopBag>? data,
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
  factory ShopBagListResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShopBagListResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShopBagListResp clone() => ShopBagListResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShopBagListResp copyWith(void Function(ShopBagListResp) updates) =>
      super.copyWith((message) => updates(message as ShopBagListResp))
          as ShopBagListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopBagListResp create() => ShopBagListResp._();
  ShopBagListResp createEmptyInstance() => create();
  static $pb.PbList<ShopBagListResp> createRepeated() =>
      $pb.PbList<ShopBagListResp>();
  @$core.pragma('dart2js:noInline')
  static ShopBagListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShopBagListResp>(create);
  static ShopBagListResp? _defaultInstance;

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
  $core.List<$0.ShopBag> get data => $_getList(2);
}

class GetPayUserListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetPayUserListResp',
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
    ..pc<BagPayUserInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: BagPayUserInfo.create)
    ..hasRequiredFields = false;

  GetPayUserListResp._() : super();
  factory GetPayUserListResp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<BagPayUserInfo>? data,
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
  factory GetPayUserListResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetPayUserListResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetPayUserListResp clone() => GetPayUserListResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetPayUserListResp copyWith(void Function(GetPayUserListResp) updates) =>
      super.copyWith((message) => updates(message as GetPayUserListResp))
          as GetPayUserListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPayUserListResp create() => GetPayUserListResp._();
  GetPayUserListResp createEmptyInstance() => create();
  static $pb.PbList<GetPayUserListResp> createRepeated() =>
      $pb.PbList<GetPayUserListResp>();
  @$core.pragma('dart2js:noInline')
  static GetPayUserListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPayUserListResp>(create);
  static GetPayUserListResp? _defaultInstance;

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
  $core.List<BagPayUserInfo> get data => $_getList(2);
}

class GetPropListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetPropListResp',
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
    ..pc<ShopProp>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: ShopProp.create)
    ..hasRequiredFields = false;

  GetPropListResp._() : super();
  factory GetPropListResp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<ShopProp>? data,
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
  factory GetPropListResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetPropListResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetPropListResp clone() => GetPropListResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetPropListResp copyWith(void Function(GetPropListResp) updates) =>
      super.copyWith((message) => updates(message as GetPropListResp))
          as GetPropListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPropListResp create() => GetPropListResp._();
  GetPropListResp createEmptyInstance() => create();
  static $pb.PbList<GetPropListResp> createRepeated() =>
      $pb.PbList<GetPropListResp>();
  @$core.pragma('dart2js:noInline')
  static GetPropListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPropListResp>(create);
  static GetPropListResp? _defaultInstance;

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
  $core.List<ShopProp> get data => $_getList(2);
}

class BagPayUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BagPayUserInfo',
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
            : 'getTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularityLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vipLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleLevel',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  BagPayUserInfo._() : super();
  factory BagPayUserInfo({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? getTime,
    $core.int? popularityLevel,
    $core.int? vipLevel,
    $core.int? titleLevel,
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
    if (getTime != null) {
      _result.getTime = getTime;
    }
    if (popularityLevel != null) {
      _result.popularityLevel = popularityLevel;
    }
    if (vipLevel != null) {
      _result.vipLevel = vipLevel;
    }
    if (titleLevel != null) {
      _result.titleLevel = titleLevel;
    }
    return _result;
  }
  factory BagPayUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BagPayUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BagPayUserInfo clone() => BagPayUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BagPayUserInfo copyWith(void Function(BagPayUserInfo) updates) =>
      super.copyWith((message) => updates(message as BagPayUserInfo))
          as BagPayUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BagPayUserInfo create() => BagPayUserInfo._();
  BagPayUserInfo createEmptyInstance() => create();
  static $pb.PbList<BagPayUserInfo> createRepeated() =>
      $pb.PbList<BagPayUserInfo>();
  @$core.pragma('dart2js:noInline')
  static BagPayUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BagPayUserInfo>(create);
  static BagPayUserInfo? _defaultInstance;

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
  $core.int get getTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set getTime($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGetTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearGetTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get popularityLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set popularityLevel($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPopularityLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearPopularityLevel() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get vipLevel => $_getIZ(5);
  @$pb.TagNumber(6)
  set vipLevel($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVipLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearVipLevel() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get titleLevel => $_getIZ(6);
  @$pb.TagNumber(7)
  set titleLevel($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTitleLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearTitleLevel() => clearField(7);
}

class ShopProp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShopProp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pType')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'h5Url')
    ..hasRequiredFields = false;

  ShopProp._() : super();
  factory ShopProp({
    $core.String? pType,
    $core.String? name,
    $core.String? image,
    $core.String? h5Url,
  }) {
    final _result = create();
    if (pType != null) {
      _result.pType = pType;
    }
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    if (h5Url != null) {
      _result.h5Url = h5Url;
    }
    return _result;
  }
  factory ShopProp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShopProp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShopProp clone() => ShopProp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShopProp copyWith(void Function(ShopProp) updates) =>
      super.copyWith((message) => updates(message as ShopProp))
          as ShopProp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShopProp create() => ShopProp._();
  ShopProp createEmptyInstance() => create();
  static $pb.PbList<ShopProp> createRepeated() => $pb.PbList<ShopProp>();
  @$core.pragma('dart2js:noInline')
  static ShopProp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShopProp>(create);
  static ShopProp? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get pType => $_getSZ(0);
  @$pb.TagNumber(2)
  set pType($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPType() => $_has(0);
  @$pb.TagNumber(2)
  void clearPType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get image => $_getSZ(2);
  @$pb.TagNumber(4)
  set image($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(4)
  void clearImage() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get h5Url => $_getSZ(3);
  @$pb.TagNumber(5)
  set h5Url($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasH5Url() => $_has(3);
  @$pb.TagNumber(5)
  void clearH5Url() => clearField(5);
}

class GetCreditGoodsIndexResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetCreditGoodsIndexResp',
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
    ..aOM<$1.CreditGoodsIndex>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: $1.CreditGoodsIndex.create)
    ..hasRequiredFields = false;

  GetCreditGoodsIndexResp._() : super();
  factory GetCreditGoodsIndexResp({
    $core.bool? success,
    $core.String? msg,
    $1.CreditGoodsIndex? data,
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
  factory GetCreditGoodsIndexResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetCreditGoodsIndexResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetCreditGoodsIndexResp clone() =>
      GetCreditGoodsIndexResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetCreditGoodsIndexResp copyWith(
          void Function(GetCreditGoodsIndexResp) updates) =>
      super.copyWith((message) => updates(message as GetCreditGoodsIndexResp))
          as GetCreditGoodsIndexResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetCreditGoodsIndexResp create() => GetCreditGoodsIndexResp._();
  GetCreditGoodsIndexResp createEmptyInstance() => create();
  static $pb.PbList<GetCreditGoodsIndexResp> createRepeated() =>
      $pb.PbList<GetCreditGoodsIndexResp>();
  @$core.pragma('dart2js:noInline')
  static GetCreditGoodsIndexResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCreditGoodsIndexResp>(create);
  static GetCreditGoodsIndexResp? _defaultInstance;

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
  $1.CreditGoodsIndex get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($1.CreditGoodsIndex v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  $1.CreditGoodsIndex ensureData() => $_ensure(2);
}

class GetExchangeListResp_ExchangeRecord extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetExchangeListResp.ExchangeRecord',
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
            : 'desc')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.O3)
    ..aInt64(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createTime')
    ..hasRequiredFields = false;

  GetExchangeListResp_ExchangeRecord._() : super();
  factory GetExchangeListResp_ExchangeRecord({
    $core.int? id,
    $core.String? desc,
    $core.int? score,
    $core.int? money,
    $fixnum.Int64? createTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (score != null) {
      _result.score = score;
    }
    if (money != null) {
      _result.money = money;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    return _result;
  }
  factory GetExchangeListResp_ExchangeRecord.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetExchangeListResp_ExchangeRecord.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetExchangeListResp_ExchangeRecord clone() =>
      GetExchangeListResp_ExchangeRecord()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetExchangeListResp_ExchangeRecord copyWith(
          void Function(GetExchangeListResp_ExchangeRecord) updates) =>
      super.copyWith((message) =>
              updates(message as GetExchangeListResp_ExchangeRecord))
          as GetExchangeListResp_ExchangeRecord; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetExchangeListResp_ExchangeRecord create() =>
      GetExchangeListResp_ExchangeRecord._();
  GetExchangeListResp_ExchangeRecord createEmptyInstance() => create();
  static $pb.PbList<GetExchangeListResp_ExchangeRecord> createRepeated() =>
      $pb.PbList<GetExchangeListResp_ExchangeRecord>();
  @$core.pragma('dart2js:noInline')
  static GetExchangeListResp_ExchangeRecord getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetExchangeListResp_ExchangeRecord>(
          create);
  static GetExchangeListResp_ExchangeRecord? _defaultInstance;

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
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get score => $_getIZ(2);
  @$pb.TagNumber(3)
  set score($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get money => $_getIZ(3);
  @$pb.TagNumber(4)
  set money($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMoney() => $_has(3);
  @$pb.TagNumber(4)
  void clearMoney() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get createTime => $_getI64(4);
  @$pb.TagNumber(5)
  set createTime($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCreateTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateTime() => clearField(5);
}

class GetExchangeListResp_ExchangeData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetExchangeListResp.ExchangeData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GetExchangeListResp_ExchangeRecord>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'records',
        $pb.PbFieldType.PM,
        subBuilder: GetExchangeListResp_ExchangeRecord.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isMore')
    ..hasRequiredFields = false;

  GetExchangeListResp_ExchangeData._() : super();
  factory GetExchangeListResp_ExchangeData({
    $core.Iterable<GetExchangeListResp_ExchangeRecord>? records,
    $core.bool? isMore,
  }) {
    final _result = create();
    if (records != null) {
      _result.records.addAll(records);
    }
    if (isMore != null) {
      _result.isMore = isMore;
    }
    return _result;
  }
  factory GetExchangeListResp_ExchangeData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetExchangeListResp_ExchangeData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetExchangeListResp_ExchangeData clone() =>
      GetExchangeListResp_ExchangeData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetExchangeListResp_ExchangeData copyWith(
          void Function(GetExchangeListResp_ExchangeData) updates) =>
      super.copyWith(
              (message) => updates(message as GetExchangeListResp_ExchangeData))
          as GetExchangeListResp_ExchangeData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetExchangeListResp_ExchangeData create() =>
      GetExchangeListResp_ExchangeData._();
  GetExchangeListResp_ExchangeData createEmptyInstance() => create();
  static $pb.PbList<GetExchangeListResp_ExchangeData> createRepeated() =>
      $pb.PbList<GetExchangeListResp_ExchangeData>();
  @$core.pragma('dart2js:noInline')
  static GetExchangeListResp_ExchangeData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetExchangeListResp_ExchangeData>(
          create);
  static GetExchangeListResp_ExchangeData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GetExchangeListResp_ExchangeRecord> get records => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get isMore => $_getBF(1);
  @$pb.TagNumber(2)
  set isMore($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsMore() => clearField(2);
}

class GetExchangeListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetExchangeListResp',
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
    ..aOM<GetExchangeListResp_ExchangeData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GetExchangeListResp_ExchangeData.create)
    ..hasRequiredFields = false;

  GetExchangeListResp._() : super();
  factory GetExchangeListResp({
    $core.bool? success,
    $core.String? msg,
    GetExchangeListResp_ExchangeData? data,
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
  factory GetExchangeListResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetExchangeListResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetExchangeListResp clone() => GetExchangeListResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetExchangeListResp copyWith(void Function(GetExchangeListResp) updates) =>
      super.copyWith((message) => updates(message as GetExchangeListResp))
          as GetExchangeListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetExchangeListResp create() => GetExchangeListResp._();
  GetExchangeListResp createEmptyInstance() => create();
  static $pb.PbList<GetExchangeListResp> createRepeated() =>
      $pb.PbList<GetExchangeListResp>();
  @$core.pragma('dart2js:noInline')
  static GetExchangeListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetExchangeListResp>(create);
  static GetExchangeListResp? _defaultInstance;

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
  GetExchangeListResp_ExchangeData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GetExchangeListResp_ExchangeData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GetExchangeListResp_ExchangeData ensureData() => $_ensure(2);
}

class SubmitCustomApplyResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SubmitCustomApplyResp',
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

  SubmitCustomApplyResp._() : super();
  factory SubmitCustomApplyResp({
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
  factory SubmitCustomApplyResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubmitCustomApplyResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubmitCustomApplyResp clone() =>
      SubmitCustomApplyResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubmitCustomApplyResp copyWith(
          void Function(SubmitCustomApplyResp) updates) =>
      super.copyWith((message) => updates(message as SubmitCustomApplyResp))
          as SubmitCustomApplyResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubmitCustomApplyResp create() => SubmitCustomApplyResp._();
  SubmitCustomApplyResp createEmptyInstance() => create();
  static $pb.PbList<SubmitCustomApplyResp> createRepeated() =>
      $pb.PbList<SubmitCustomApplyResp>();
  @$core.pragma('dart2js:noInline')
  static SubmitCustomApplyResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitCustomApplyResp>(create);
  static SubmitCustomApplyResp? _defaultInstance;

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
