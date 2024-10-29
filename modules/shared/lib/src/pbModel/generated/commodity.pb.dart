///
//  Generated code. Do not modify.
//  source: commodity.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'entity_xs_gift.pb.dart' as $0;

class RepCommodityUserNew extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RepCommodityUserNew',
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
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data')
    ..hasRequiredFields = false;

  RepCommodityUserNew._() : super();
  factory RepCommodityUserNew({
    $core.bool? success,
    $core.String? msg,
    $core.bool? data,
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
  factory RepCommodityUserNew.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RepCommodityUserNew.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RepCommodityUserNew clone() => RepCommodityUserNew()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RepCommodityUserNew copyWith(void Function(RepCommodityUserNew) updates) =>
      super.copyWith((message) => updates(message as RepCommodityUserNew))
          as RepCommodityUserNew; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RepCommodityUserNew create() => RepCommodityUserNew._();
  RepCommodityUserNew createEmptyInstance() => create();
  static $pb.PbList<RepCommodityUserNew> createRepeated() =>
      $pb.PbList<RepCommodityUserNew>();
  @$core.pragma('dart2js:noInline')
  static RepCommodityUserNew getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RepCommodityUserNew>(create);
  static RepCommodityUserNew? _defaultInstance;

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
  $core.bool get data => $_getBF(2);
  @$pb.TagNumber(3)
  set data($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}

class RepGiftList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RepGiftList',
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
    ..pc<RepGiftListItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: RepGiftListItem.create)
    ..hasRequiredFields = false;

  RepGiftList._() : super();
  factory RepGiftList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<RepGiftListItem>? data,
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
  factory RepGiftList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RepGiftList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RepGiftList clone() => RepGiftList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RepGiftList copyWith(void Function(RepGiftList) updates) =>
      super.copyWith((message) => updates(message as RepGiftList))
          as RepGiftList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RepGiftList create() => RepGiftList._();
  RepGiftList createEmptyInstance() => create();
  static $pb.PbList<RepGiftList> createRepeated() => $pb.PbList<RepGiftList>();
  @$core.pragma('dart2js:noInline')
  static RepGiftList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RepGiftList>(create);
  static RepGiftList? _defaultInstance;

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
  $core.List<RepGiftListItem> get data => $_getList(2);
}

class RepGiftListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RepGiftListItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<$0.EntityXsGift>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        subBuilder: $0.EntityXsGift.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ctype')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ductionMoney',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RepGiftListItem._() : super();
  factory RepGiftListItem({
    $0.EntityXsGift? gift,
    $core.int? cid,
    $core.String? ctype,
    $core.int? ductionMoney,
  }) {
    final _result = create();
    if (gift != null) {
      _result.gift = gift;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (ctype != null) {
      _result.ctype = ctype;
    }
    if (ductionMoney != null) {
      _result.ductionMoney = ductionMoney;
    }
    return _result;
  }
  factory RepGiftListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RepGiftListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RepGiftListItem clone() => RepGiftListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RepGiftListItem copyWith(void Function(RepGiftListItem) updates) =>
      super.copyWith((message) => updates(message as RepGiftListItem))
          as RepGiftListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RepGiftListItem create() => RepGiftListItem._();
  RepGiftListItem createEmptyInstance() => create();
  static $pb.PbList<RepGiftListItem> createRepeated() =>
      $pb.PbList<RepGiftListItem>();
  @$core.pragma('dart2js:noInline')
  static RepGiftListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RepGiftListItem>(create);
  static RepGiftListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $0.EntityXsGift get gift => $_getN(0);
  @$pb.TagNumber(1)
  set gift($0.EntityXsGift v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGift() => $_has(0);
  @$pb.TagNumber(1)
  void clearGift() => clearField(1);
  @$pb.TagNumber(1)
  $0.EntityXsGift ensureGift() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get cid => $_getIZ(1);
  @$pb.TagNumber(2)
  set cid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ctype => $_getSZ(2);
  @$pb.TagNumber(3)
  set ctype($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCtype() => $_has(2);
  @$pb.TagNumber(3)
  void clearCtype() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get ductionMoney => $_getIZ(3);
  @$pb.TagNumber(4)
  set ductionMoney($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDuctionMoney() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuctionMoney() => clearField(4);
}

class RepCommodityResolve extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RepCommodityResolve',
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
            : 'num',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RepCommodityResolve._() : super();
  factory RepCommodityResolve({
    $core.bool? success,
    $core.String? msg,
    $core.int? num,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (num != null) {
      _result.num = num;
    }
    return _result;
  }
  factory RepCommodityResolve.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RepCommodityResolve.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RepCommodityResolve clone() => RepCommodityResolve()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RepCommodityResolve copyWith(void Function(RepCommodityResolve) updates) =>
      super.copyWith((message) => updates(message as RepCommodityResolve))
          as RepCommodityResolve; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RepCommodityResolve create() => RepCommodityResolve._();
  RepCommodityResolve createEmptyInstance() => create();
  static $pb.PbList<RepCommodityResolve> createRepeated() =>
      $pb.PbList<RepCommodityResolve>();
  @$core.pragma('dart2js:noInline')
  static RepCommodityResolve getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RepCommodityResolve>(create);
  static RepCommodityResolve? _defaultInstance;

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
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => clearField(3);
}
