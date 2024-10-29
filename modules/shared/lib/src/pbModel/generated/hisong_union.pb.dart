///
//  Generated code. Do not modify.
//  source: hisong_union.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class UnionIndexRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionIndexRsp',
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
    ..aOM<UnionIndexData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: UnionIndexData.create)
    ..hasRequiredFields = false;

  UnionIndexRsp._() : super();
  factory UnionIndexRsp({
    $core.bool? success,
    $core.String? msg,
    UnionIndexData? data,
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
  factory UnionIndexRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionIndexRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionIndexRsp clone() => UnionIndexRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionIndexRsp copyWith(void Function(UnionIndexRsp) updates) =>
      super.copyWith((message) => updates(message as UnionIndexRsp))
          as UnionIndexRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionIndexRsp create() => UnionIndexRsp._();
  UnionIndexRsp createEmptyInstance() => create();
  static $pb.PbList<UnionIndexRsp> createRepeated() =>
      $pb.PbList<UnionIndexRsp>();
  @$core.pragma('dart2js:noInline')
  static UnionIndexRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionIndexRsp>(create);
  static UnionIndexRsp? _defaultInstance;

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
  UnionIndexData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(UnionIndexData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  UnionIndexData ensureData() => $_ensure(2);
}

class UnionIndexData_Award_AwardItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionIndexData.Award.AwardItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ctype',
        $pb.PbFieldType.OU3)
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
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pic')
    ..hasRequiredFields = false;

  UnionIndexData_Award_AwardItem._() : super();
  factory UnionIndexData_Award_AwardItem({
    $core.int? ctype,
    $core.int? cid,
    $core.String? name,
    $core.int? num,
    $core.String? pic,
  }) {
    final _result = create();
    if (ctype != null) {
      _result.ctype = ctype;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (num != null) {
      _result.num = num;
    }
    if (pic != null) {
      _result.pic = pic;
    }
    return _result;
  }
  factory UnionIndexData_Award_AwardItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionIndexData_Award_AwardItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionIndexData_Award_AwardItem clone() =>
      UnionIndexData_Award_AwardItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionIndexData_Award_AwardItem copyWith(
          void Function(UnionIndexData_Award_AwardItem) updates) =>
      super.copyWith(
              (message) => updates(message as UnionIndexData_Award_AwardItem))
          as UnionIndexData_Award_AwardItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionIndexData_Award_AwardItem create() =>
      UnionIndexData_Award_AwardItem._();
  UnionIndexData_Award_AwardItem createEmptyInstance() => create();
  static $pb.PbList<UnionIndexData_Award_AwardItem> createRepeated() =>
      $pb.PbList<UnionIndexData_Award_AwardItem>();
  @$core.pragma('dart2js:noInline')
  static UnionIndexData_Award_AwardItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionIndexData_Award_AwardItem>(create);
  static UnionIndexData_Award_AwardItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get ctype => $_getIZ(0);
  @$pb.TagNumber(1)
  set ctype($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCtype() => $_has(0);
  @$pb.TagNumber(1)
  void clearCtype() => clearField(1);

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
  $core.int get num => $_getIZ(3);
  @$pb.TagNumber(4)
  set num($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get pic => $_getSZ(4);
  @$pb.TagNumber(5)
  set pic($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPic() => $_has(4);
  @$pb.TagNumber(5)
  void clearPic() => clearField(5);
}

class UnionIndexData_Award extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionIndexData.Award',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activeNum',
        $pb.PbFieldType.OU3,
        protoName: 'activeNum')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userActiveNum',
        $pb.PbFieldType.OU3,
        protoName: 'userActiveNum')
    ..pc<UnionIndexData_Award_AwardItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Items',
        $pb.PbFieldType.PM,
        protoName: 'Items',
        subBuilder: UnionIndexData_Award_AwardItem.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userActiveTips',
        protoName: 'userActiveTips')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mark',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  UnionIndexData_Award._() : super();
  factory UnionIndexData_Award({
    $core.int? activeNum,
    $core.int? userActiveNum,
    $core.Iterable<UnionIndexData_Award_AwardItem>? items,
    $core.String? userActiveTips,
    $core.int? mark,
    $core.int? state,
  }) {
    final _result = create();
    if (activeNum != null) {
      _result.activeNum = activeNum;
    }
    if (userActiveNum != null) {
      _result.userActiveNum = userActiveNum;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    if (userActiveTips != null) {
      _result.userActiveTips = userActiveTips;
    }
    if (mark != null) {
      _result.mark = mark;
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory UnionIndexData_Award.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionIndexData_Award.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionIndexData_Award clone() =>
      UnionIndexData_Award()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionIndexData_Award copyWith(void Function(UnionIndexData_Award) updates) =>
      super.copyWith((message) => updates(message as UnionIndexData_Award))
          as UnionIndexData_Award; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionIndexData_Award create() => UnionIndexData_Award._();
  UnionIndexData_Award createEmptyInstance() => create();
  static $pb.PbList<UnionIndexData_Award> createRepeated() =>
      $pb.PbList<UnionIndexData_Award>();
  @$core.pragma('dart2js:noInline')
  static UnionIndexData_Award getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionIndexData_Award>(create);
  static UnionIndexData_Award? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get activeNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set activeNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasActiveNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearActiveNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userActiveNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set userActiveNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserActiveNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserActiveNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<UnionIndexData_Award_AwardItem> get items => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get userActiveTips => $_getSZ(3);
  @$pb.TagNumber(4)
  set userActiveTips($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUserActiveTips() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserActiveTips() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get mark => $_getIZ(4);
  @$pb.TagNumber(5)
  set mark($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMark() => $_has(4);
  @$pb.TagNumber(5)
  void clearMark() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get state => $_getIZ(5);
  @$pb.TagNumber(6)
  set state($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => clearField(6);
}

class UnionIndexData_Solution extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionIndexData.Solution',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cycle',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'outputGold',
        $pb.PbFieldType.OU3,
        protoName: 'outputGold')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'outputSilver',
        $pb.PbFieldType.OU3,
        protoName: 'outputSilver')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'outputUserActive',
        $pb.PbFieldType.OU3,
        protoName: 'outputUserActive')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'outputUnionActive',
        $pb.PbFieldType.OU3,
        protoName: 'outputUnionActive')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'outputCid',
        $pb.PbFieldType.OU3,
        protoName: 'outputCid')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'outputCidName',
        protoName: 'outputCidName')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tips')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dayLimit',
        $pb.PbFieldType.OU3,
        protoName: 'dayLimit')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekLimit',
        $pb.PbFieldType.OU3,
        protoName: 'weekLimit')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redirect')
    ..aOB(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlyHisong',
        protoName: 'onlyHisong')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mark',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'finishNum',
        $pb.PbFieldType.OU3,
        protoName: 'finishNum')
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cidIcon',
        protoName: 'cidIcon')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cidName',
        protoName: 'cidName')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cidShowTime',
        protoName: 'cidShowTime')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cidNum',
        $pb.PbFieldType.OU3,
        protoName: 'cidNum')
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'outputMoneyCoupon',
        $pb.PbFieldType.OU3,
        protoName: 'outputMoneyCoupon')
    ..hasRequiredFields = false;

  UnionIndexData_Solution._() : super();
  factory UnionIndexData_Solution({
    $core.int? cycle,
    $core.int? outputGold,
    $core.int? outputSilver,
    $core.int? outputUserActive,
    $core.int? outputUnionActive,
    $core.int? outputCid,
    $core.String? outputCidName,
    $core.String? name,
    $core.String? tips,
    $core.int? dayLimit,
    $core.int? weekLimit,
    $core.String? redirect,
    $core.bool? onlyHisong,
    $core.int? mark,
    $core.int? finishNum,
    $core.int? state,
    $core.String? cidIcon,
    $core.String? cidName,
    $core.String? cidShowTime,
    $core.int? cidNum,
    $core.int? outputMoneyCoupon,
  }) {
    final _result = create();
    if (cycle != null) {
      _result.cycle = cycle;
    }
    if (outputGold != null) {
      _result.outputGold = outputGold;
    }
    if (outputSilver != null) {
      _result.outputSilver = outputSilver;
    }
    if (outputUserActive != null) {
      _result.outputUserActive = outputUserActive;
    }
    if (outputUnionActive != null) {
      _result.outputUnionActive = outputUnionActive;
    }
    if (outputCid != null) {
      _result.outputCid = outputCid;
    }
    if (outputCidName != null) {
      _result.outputCidName = outputCidName;
    }
    if (name != null) {
      _result.name = name;
    }
    if (tips != null) {
      _result.tips = tips;
    }
    if (dayLimit != null) {
      _result.dayLimit = dayLimit;
    }
    if (weekLimit != null) {
      _result.weekLimit = weekLimit;
    }
    if (redirect != null) {
      _result.redirect = redirect;
    }
    if (onlyHisong != null) {
      _result.onlyHisong = onlyHisong;
    }
    if (mark != null) {
      _result.mark = mark;
    }
    if (finishNum != null) {
      _result.finishNum = finishNum;
    }
    if (state != null) {
      _result.state = state;
    }
    if (cidIcon != null) {
      _result.cidIcon = cidIcon;
    }
    if (cidName != null) {
      _result.cidName = cidName;
    }
    if (cidShowTime != null) {
      _result.cidShowTime = cidShowTime;
    }
    if (cidNum != null) {
      _result.cidNum = cidNum;
    }
    if (outputMoneyCoupon != null) {
      _result.outputMoneyCoupon = outputMoneyCoupon;
    }
    return _result;
  }
  factory UnionIndexData_Solution.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionIndexData_Solution.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionIndexData_Solution clone() =>
      UnionIndexData_Solution()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionIndexData_Solution copyWith(
          void Function(UnionIndexData_Solution) updates) =>
      super.copyWith((message) => updates(message as UnionIndexData_Solution))
          as UnionIndexData_Solution; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionIndexData_Solution create() => UnionIndexData_Solution._();
  UnionIndexData_Solution createEmptyInstance() => create();
  static $pb.PbList<UnionIndexData_Solution> createRepeated() =>
      $pb.PbList<UnionIndexData_Solution>();
  @$core.pragma('dart2js:noInline')
  static UnionIndexData_Solution getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionIndexData_Solution>(create);
  static UnionIndexData_Solution? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cycle => $_getIZ(0);
  @$pb.TagNumber(1)
  set cycle($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCycle() => $_has(0);
  @$pb.TagNumber(1)
  void clearCycle() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get outputGold => $_getIZ(1);
  @$pb.TagNumber(2)
  set outputGold($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOutputGold() => $_has(1);
  @$pb.TagNumber(2)
  void clearOutputGold() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get outputSilver => $_getIZ(2);
  @$pb.TagNumber(3)
  set outputSilver($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOutputSilver() => $_has(2);
  @$pb.TagNumber(3)
  void clearOutputSilver() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get outputUserActive => $_getIZ(3);
  @$pb.TagNumber(4)
  set outputUserActive($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOutputUserActive() => $_has(3);
  @$pb.TagNumber(4)
  void clearOutputUserActive() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get outputUnionActive => $_getIZ(4);
  @$pb.TagNumber(5)
  set outputUnionActive($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOutputUnionActive() => $_has(4);
  @$pb.TagNumber(5)
  void clearOutputUnionActive() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get outputCid => $_getIZ(5);
  @$pb.TagNumber(6)
  set outputCid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOutputCid() => $_has(5);
  @$pb.TagNumber(6)
  void clearOutputCid() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get outputCidName => $_getSZ(6);
  @$pb.TagNumber(7)
  set outputCidName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOutputCidName() => $_has(6);
  @$pb.TagNumber(7)
  void clearOutputCidName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get name => $_getSZ(7);
  @$pb.TagNumber(8)
  set name($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasName() => $_has(7);
  @$pb.TagNumber(8)
  void clearName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get tips => $_getSZ(8);
  @$pb.TagNumber(9)
  set tips($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTips() => $_has(8);
  @$pb.TagNumber(9)
  void clearTips() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get dayLimit => $_getIZ(9);
  @$pb.TagNumber(10)
  set dayLimit($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDayLimit() => $_has(9);
  @$pb.TagNumber(10)
  void clearDayLimit() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get weekLimit => $_getIZ(10);
  @$pb.TagNumber(11)
  set weekLimit($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasWeekLimit() => $_has(10);
  @$pb.TagNumber(11)
  void clearWeekLimit() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get redirect => $_getSZ(11);
  @$pb.TagNumber(12)
  set redirect($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasRedirect() => $_has(11);
  @$pb.TagNumber(12)
  void clearRedirect() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get onlyHisong => $_getBF(12);
  @$pb.TagNumber(13)
  set onlyHisong($core.bool v) {
    $_setBool(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasOnlyHisong() => $_has(12);
  @$pb.TagNumber(13)
  void clearOnlyHisong() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get mark => $_getIZ(13);
  @$pb.TagNumber(14)
  set mark($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasMark() => $_has(13);
  @$pb.TagNumber(14)
  void clearMark() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get finishNum => $_getIZ(14);
  @$pb.TagNumber(15)
  set finishNum($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasFinishNum() => $_has(14);
  @$pb.TagNumber(15)
  void clearFinishNum() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get state => $_getIZ(15);
  @$pb.TagNumber(16)
  set state($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasState() => $_has(15);
  @$pb.TagNumber(16)
  void clearState() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get cidIcon => $_getSZ(16);
  @$pb.TagNumber(17)
  set cidIcon($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasCidIcon() => $_has(16);
  @$pb.TagNumber(17)
  void clearCidIcon() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get cidName => $_getSZ(17);
  @$pb.TagNumber(18)
  set cidName($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasCidName() => $_has(17);
  @$pb.TagNumber(18)
  void clearCidName() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get cidShowTime => $_getSZ(18);
  @$pb.TagNumber(19)
  set cidShowTime($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasCidShowTime() => $_has(18);
  @$pb.TagNumber(19)
  void clearCidShowTime() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get cidNum => $_getIZ(19);
  @$pb.TagNumber(20)
  set cidNum($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasCidNum() => $_has(19);
  @$pb.TagNumber(20)
  void clearCidNum() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get outputMoneyCoupon => $_getIZ(20);
  @$pb.TagNumber(21)
  set outputMoneyCoupon($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasOutputMoneyCoupon() => $_has(20);
  @$pb.TagNumber(21)
  void clearOutputMoneyCoupon() => clearField(21);
}

class UnionIndexData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionIndexData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activeNum',
        protoName: 'activeNum')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'silverNum',
        protoName: 'silverNum')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activeNumToday',
        protoName: 'activeNumToday')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekActiveNum',
        protoName: 'weekActiveNum')
    ..a<$core.double>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progress',
        $pb.PbFieldType.OF)
    ..pc<UnionIndexData_Award>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awards',
        $pb.PbFieldType.PM,
        subBuilder: UnionIndexData_Award.create)
    ..pc<UnionIndexData_Solution>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'solutions',
        $pb.PbFieldType.PM,
        subBuilder: UnionIndexData_Solution.create)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unionWeekActiveNum',
        $pb.PbFieldType.OU3,
        protoName: 'unionWeekActive_num')
    ..hasRequiredFields = false;

  UnionIndexData._() : super();
  factory UnionIndexData({
    $core.String? activeNum,
    $core.String? silverNum,
    $core.String? activeNumToday,
    $core.String? weekActiveNum,
    $core.double? progress,
    $core.Iterable<UnionIndexData_Award>? awards,
    $core.Iterable<UnionIndexData_Solution>? solutions,
    $core.int? unionWeekActiveNum,
  }) {
    final _result = create();
    if (activeNum != null) {
      _result.activeNum = activeNum;
    }
    if (silverNum != null) {
      _result.silverNum = silverNum;
    }
    if (activeNumToday != null) {
      _result.activeNumToday = activeNumToday;
    }
    if (weekActiveNum != null) {
      _result.weekActiveNum = weekActiveNum;
    }
    if (progress != null) {
      _result.progress = progress;
    }
    if (awards != null) {
      _result.awards.addAll(awards);
    }
    if (solutions != null) {
      _result.solutions.addAll(solutions);
    }
    if (unionWeekActiveNum != null) {
      _result.unionWeekActiveNum = unionWeekActiveNum;
    }
    return _result;
  }
  factory UnionIndexData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionIndexData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionIndexData clone() => UnionIndexData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionIndexData copyWith(void Function(UnionIndexData) updates) =>
      super.copyWith((message) => updates(message as UnionIndexData))
          as UnionIndexData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionIndexData create() => UnionIndexData._();
  UnionIndexData createEmptyInstance() => create();
  static $pb.PbList<UnionIndexData> createRepeated() =>
      $pb.PbList<UnionIndexData>();
  @$core.pragma('dart2js:noInline')
  static UnionIndexData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionIndexData>(create);
  static UnionIndexData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get activeNum => $_getSZ(0);
  @$pb.TagNumber(1)
  set activeNum($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasActiveNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearActiveNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get silverNum => $_getSZ(1);
  @$pb.TagNumber(2)
  set silverNum($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSilverNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearSilverNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get activeNumToday => $_getSZ(2);
  @$pb.TagNumber(3)
  set activeNumToday($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasActiveNumToday() => $_has(2);
  @$pb.TagNumber(3)
  void clearActiveNumToday() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get weekActiveNum => $_getSZ(3);
  @$pb.TagNumber(4)
  set weekActiveNum($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWeekActiveNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeekActiveNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get progress => $_getN(4);
  @$pb.TagNumber(5)
  set progress($core.double v) {
    $_setFloat(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasProgress() => $_has(4);
  @$pb.TagNumber(5)
  void clearProgress() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<UnionIndexData_Award> get awards => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<UnionIndexData_Solution> get solutions => $_getList(6);

  @$pb.TagNumber(8)
  $core.int get unionWeekActiveNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set unionWeekActiveNum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUnionWeekActiveNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearUnionWeekActiveNum() => clearField(8);
}

class UnionInfoResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionInfoResp',
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
    ..aOM<UnionInfoData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: UnionInfoData.create)
    ..hasRequiredFields = false;

  UnionInfoResp._() : super();
  factory UnionInfoResp({
    $core.bool? success,
    $core.String? msg,
    UnionInfoData? data,
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
  factory UnionInfoResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionInfoResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionInfoResp clone() => UnionInfoResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionInfoResp copyWith(void Function(UnionInfoResp) updates) =>
      super.copyWith((message) => updates(message as UnionInfoResp))
          as UnionInfoResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionInfoResp create() => UnionInfoResp._();
  UnionInfoResp createEmptyInstance() => create();
  static $pb.PbList<UnionInfoResp> createRepeated() =>
      $pb.PbList<UnionInfoResp>();
  @$core.pragma('dart2js:noInline')
  static UnionInfoResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionInfoResp>(create);
  static UnionInfoResp? _defaultInstance;

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
  UnionInfoData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(UnionInfoData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  UnionInfoData ensureData() => $_ensure(2);
}

class UnionInfoData_ChatroomInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionInfoData.ChatroomInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineUserNum',
        $pb.PbFieldType.OU3,
        protoName: 'onlineUserNum')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomId',
        $pb.PbFieldType.OU3,
        protoName: 'roomId')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomName',
        protoName: 'roomName')
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcons',
        protoName: 'userIcons')
    ..hasRequiredFields = false;

  UnionInfoData_ChatroomInfo._() : super();
  factory UnionInfoData_ChatroomInfo({
    $core.int? onlineUserNum,
    $core.int? roomId,
    $core.String? roomName,
    $core.Iterable<$core.String>? userIcons,
  }) {
    final _result = create();
    if (onlineUserNum != null) {
      _result.onlineUserNum = onlineUserNum;
    }
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roomName != null) {
      _result.roomName = roomName;
    }
    if (userIcons != null) {
      _result.userIcons.addAll(userIcons);
    }
    return _result;
  }
  factory UnionInfoData_ChatroomInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionInfoData_ChatroomInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionInfoData_ChatroomInfo clone() =>
      UnionInfoData_ChatroomInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionInfoData_ChatroomInfo copyWith(
          void Function(UnionInfoData_ChatroomInfo) updates) =>
      super.copyWith(
              (message) => updates(message as UnionInfoData_ChatroomInfo))
          as UnionInfoData_ChatroomInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionInfoData_ChatroomInfo create() => UnionInfoData_ChatroomInfo._();
  UnionInfoData_ChatroomInfo createEmptyInstance() => create();
  static $pb.PbList<UnionInfoData_ChatroomInfo> createRepeated() =>
      $pb.PbList<UnionInfoData_ChatroomInfo>();
  @$core.pragma('dart2js:noInline')
  static UnionInfoData_ChatroomInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionInfoData_ChatroomInfo>(create);
  static UnionInfoData_ChatroomInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get onlineUserNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set onlineUserNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOnlineUserNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearOnlineUserNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get roomId => $_getIZ(1);
  @$pb.TagNumber(2)
  set roomId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomName => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRoomName() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get userIcons => $_getList(3);
}

class UnionInfoData_LuckyDipInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionInfoData.LuckyDipInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gachaNum',
        $pb.PbFieldType.OU3,
        protoName: 'gachaNum')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..pc<UnionNormalReward>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'normalRewards',
        $pb.PbFieldType.PM,
        protoName: 'normalRewards',
        subBuilder: UnionNormalReward.create)
    ..hasRequiredFields = false;

  UnionInfoData_LuckyDipInfo._() : super();
  factory UnionInfoData_LuckyDipInfo({
    $core.int? gachaNum,
    $core.int? level,
    $core.String? desc,
    $core.Iterable<UnionNormalReward>? normalRewards,
  }) {
    final _result = create();
    if (gachaNum != null) {
      _result.gachaNum = gachaNum;
    }
    if (level != null) {
      _result.level = level;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (normalRewards != null) {
      _result.normalRewards.addAll(normalRewards);
    }
    return _result;
  }
  factory UnionInfoData_LuckyDipInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionInfoData_LuckyDipInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionInfoData_LuckyDipInfo clone() =>
      UnionInfoData_LuckyDipInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionInfoData_LuckyDipInfo copyWith(
          void Function(UnionInfoData_LuckyDipInfo) updates) =>
      super.copyWith(
              (message) => updates(message as UnionInfoData_LuckyDipInfo))
          as UnionInfoData_LuckyDipInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionInfoData_LuckyDipInfo create() => UnionInfoData_LuckyDipInfo._();
  UnionInfoData_LuckyDipInfo createEmptyInstance() => create();
  static $pb.PbList<UnionInfoData_LuckyDipInfo> createRepeated() =>
      $pb.PbList<UnionInfoData_LuckyDipInfo>();
  @$core.pragma('dart2js:noInline')
  static UnionInfoData_LuckyDipInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionInfoData_LuckyDipInfo>(create);
  static UnionInfoData_LuckyDipInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gachaNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set gachaNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGachaNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearGachaNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get level => $_getIZ(1);
  @$pb.TagNumber(2)
  set level($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<UnionNormalReward> get normalRewards => $_getList(3);
}

class UnionInfoData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionInfoData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
        protoName: 'appId')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'shortName',
        protoName: 'shortName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createUid',
        $pb.PbFieldType.OU3,
        protoName: 'createUid')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createName',
        protoName: 'createName')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logo')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bgPic',
        protoName: 'bgPic')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'headerPic',
        protoName: 'headerPic')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unId',
        $pb.PbFieldType.OU3,
        protoName: 'unId')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activeNum',
        $pb.PbFieldType.OU3,
        protoName: 'activeNum')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxUserNum',
        $pb.PbFieldType.OU3,
        protoName: 'maxUserNum')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userNum',
        $pb.PbFieldType.OU3,
        protoName: 'userNum')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'highActivePoint',
        $pb.PbFieldType.OU3,
        protoName: 'highActivePoint')
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'condition',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isNotify',
        $pb.PbFieldType.OU3,
        protoName: 'isNotify')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tempName',
        protoName: 'tempName')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tempLogo',
        protoName: 'tempLogo')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tempDesc',
        protoName: 'tempDesc')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tempShortName',
        protoName: 'tempShortName')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'post')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tmpPost',
        protoName: 'tmpPost')
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inUnion',
        $pb.PbFieldType.OU3,
        protoName: 'inUnion')
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userTitle',
        $pb.PbFieldType.OU3,
        protoName: 'userTitle')
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userActiveNum',
        $pb.PbFieldType.OU3,
        protoName: 'userActiveNum')
    ..aOS(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goldNum',
        protoName: 'goldNum')
    ..aOS(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'silverNum',
        protoName: 'silverNum')
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankNum',
        $pb.PbFieldType.OU3,
        protoName: 'rankNum')
    ..aOM<UnionInfoData_ChatroomInfo>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chatroomInfo',
        protoName: 'chatroomInfo',
        subBuilder: UnionInfoData_ChatroomInfo.create)
    ..aOM<UnionInfoData_LuckyDipInfo>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'luckyDipInfo',
        protoName: 'luckyDipInfo',
        subBuilder: UnionInfoData_LuckyDipInfo.create)
    ..a<$core.int>(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'applyingCount',
        $pb.PbFieldType.OU3,
        protoName: 'applyingCount')
    ..a<$core.int>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineUserNum',
        $pb.PbFieldType.OU3,
        protoName: 'onlineUserNum')
    ..a<$core.int>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'conditionVip',
        $pb.PbFieldType.OU3,
        protoName: 'conditionVip')
    ..a<$core.int>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'conditionPopularity',
        $pb.PbFieldType.OU3,
        protoName: 'conditionPopularity')
    ..a<$core.int>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'elderRecept',
        $pb.PbFieldType.OU3,
        protoName: 'elderRecept')
    ..hasRequiredFields = false;

  UnionInfoData._() : super();
  factory UnionInfoData({
    $core.String? appId,
    $core.String? name,
    $core.String? shortName,
    $core.int? createUid,
    $core.String? createName,
    $core.String? logo,
    $core.String? bgPic,
    $core.String? headerPic,
    $core.String? desc,
    $core.int? unId,
    $core.int? activeNum,
    $core.int? level,
    $core.int? maxUserNum,
    $core.int? userNum,
    $core.int? highActivePoint,
    $core.int? condition,
    $core.int? isNotify,
    $core.String? tempName,
    $core.String? tempLogo,
    $core.String? tempDesc,
    $core.String? tempShortName,
    $core.String? post,
    $core.String? tmpPost,
    $core.int? inUnion,
    $core.int? userTitle,
    $core.int? userActiveNum,
    $core.String? goldNum,
    $core.String? silverNum,
    $core.int? rankNum,
    UnionInfoData_ChatroomInfo? chatroomInfo,
    UnionInfoData_LuckyDipInfo? luckyDipInfo,
    $core.int? applyingCount,
    $core.int? onlineUserNum,
    $core.int? conditionVip,
    $core.int? conditionPopularity,
    $core.int? elderRecept,
  }) {
    final _result = create();
    if (appId != null) {
      _result.appId = appId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (shortName != null) {
      _result.shortName = shortName;
    }
    if (createUid != null) {
      _result.createUid = createUid;
    }
    if (createName != null) {
      _result.createName = createName;
    }
    if (logo != null) {
      _result.logo = logo;
    }
    if (bgPic != null) {
      _result.bgPic = bgPic;
    }
    if (headerPic != null) {
      _result.headerPic = headerPic;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (unId != null) {
      _result.unId = unId;
    }
    if (activeNum != null) {
      _result.activeNum = activeNum;
    }
    if (level != null) {
      _result.level = level;
    }
    if (maxUserNum != null) {
      _result.maxUserNum = maxUserNum;
    }
    if (userNum != null) {
      _result.userNum = userNum;
    }
    if (highActivePoint != null) {
      _result.highActivePoint = highActivePoint;
    }
    if (condition != null) {
      _result.condition = condition;
    }
    if (isNotify != null) {
      _result.isNotify = isNotify;
    }
    if (tempName != null) {
      _result.tempName = tempName;
    }
    if (tempLogo != null) {
      _result.tempLogo = tempLogo;
    }
    if (tempDesc != null) {
      _result.tempDesc = tempDesc;
    }
    if (tempShortName != null) {
      _result.tempShortName = tempShortName;
    }
    if (post != null) {
      _result.post = post;
    }
    if (tmpPost != null) {
      _result.tmpPost = tmpPost;
    }
    if (inUnion != null) {
      _result.inUnion = inUnion;
    }
    if (userTitle != null) {
      _result.userTitle = userTitle;
    }
    if (userActiveNum != null) {
      _result.userActiveNum = userActiveNum;
    }
    if (goldNum != null) {
      _result.goldNum = goldNum;
    }
    if (silverNum != null) {
      _result.silverNum = silverNum;
    }
    if (rankNum != null) {
      _result.rankNum = rankNum;
    }
    if (chatroomInfo != null) {
      _result.chatroomInfo = chatroomInfo;
    }
    if (luckyDipInfo != null) {
      _result.luckyDipInfo = luckyDipInfo;
    }
    if (applyingCount != null) {
      _result.applyingCount = applyingCount;
    }
    if (onlineUserNum != null) {
      _result.onlineUserNum = onlineUserNum;
    }
    if (conditionVip != null) {
      _result.conditionVip = conditionVip;
    }
    if (conditionPopularity != null) {
      _result.conditionPopularity = conditionPopularity;
    }
    if (elderRecept != null) {
      _result.elderRecept = elderRecept;
    }
    return _result;
  }
  factory UnionInfoData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionInfoData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionInfoData clone() => UnionInfoData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionInfoData copyWith(void Function(UnionInfoData) updates) =>
      super.copyWith((message) => updates(message as UnionInfoData))
          as UnionInfoData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionInfoData create() => UnionInfoData._();
  UnionInfoData createEmptyInstance() => create();
  static $pb.PbList<UnionInfoData> createRepeated() =>
      $pb.PbList<UnionInfoData>();
  @$core.pragma('dart2js:noInline')
  static UnionInfoData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionInfoData>(create);
  static UnionInfoData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get appId => $_getSZ(0);
  @$pb.TagNumber(1)
  set appId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAppId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppId() => clearField(1);

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
  $core.String get shortName => $_getSZ(2);
  @$pb.TagNumber(3)
  set shortName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShortName() => $_has(2);
  @$pb.TagNumber(3)
  void clearShortName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get createUid => $_getIZ(3);
  @$pb.TagNumber(4)
  set createUid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCreateUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreateUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get createName => $_getSZ(4);
  @$pb.TagNumber(5)
  set createName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCreateName() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get logo => $_getSZ(5);
  @$pb.TagNumber(6)
  set logo($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLogo() => $_has(5);
  @$pb.TagNumber(6)
  void clearLogo() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get bgPic => $_getSZ(6);
  @$pb.TagNumber(7)
  set bgPic($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBgPic() => $_has(6);
  @$pb.TagNumber(7)
  void clearBgPic() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get headerPic => $_getSZ(7);
  @$pb.TagNumber(8)
  set headerPic($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasHeaderPic() => $_has(7);
  @$pb.TagNumber(8)
  void clearHeaderPic() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get desc => $_getSZ(8);
  @$pb.TagNumber(9)
  set desc($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasDesc() => $_has(8);
  @$pb.TagNumber(9)
  void clearDesc() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get unId => $_getIZ(9);
  @$pb.TagNumber(10)
  set unId($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasUnId() => $_has(9);
  @$pb.TagNumber(10)
  void clearUnId() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get activeNum => $_getIZ(10);
  @$pb.TagNumber(11)
  set activeNum($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasActiveNum() => $_has(10);
  @$pb.TagNumber(11)
  void clearActiveNum() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get level => $_getIZ(11);
  @$pb.TagNumber(12)
  set level($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasLevel() => $_has(11);
  @$pb.TagNumber(12)
  void clearLevel() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get maxUserNum => $_getIZ(12);
  @$pb.TagNumber(13)
  set maxUserNum($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasMaxUserNum() => $_has(12);
  @$pb.TagNumber(13)
  void clearMaxUserNum() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get userNum => $_getIZ(13);
  @$pb.TagNumber(14)
  set userNum($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasUserNum() => $_has(13);
  @$pb.TagNumber(14)
  void clearUserNum() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get highActivePoint => $_getIZ(14);
  @$pb.TagNumber(15)
  set highActivePoint($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasHighActivePoint() => $_has(14);
  @$pb.TagNumber(15)
  void clearHighActivePoint() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get condition => $_getIZ(15);
  @$pb.TagNumber(16)
  set condition($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasCondition() => $_has(15);
  @$pb.TagNumber(16)
  void clearCondition() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get isNotify => $_getIZ(16);
  @$pb.TagNumber(17)
  set isNotify($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasIsNotify() => $_has(16);
  @$pb.TagNumber(17)
  void clearIsNotify() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get tempName => $_getSZ(17);
  @$pb.TagNumber(18)
  set tempName($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasTempName() => $_has(17);
  @$pb.TagNumber(18)
  void clearTempName() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get tempLogo => $_getSZ(18);
  @$pb.TagNumber(19)
  set tempLogo($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasTempLogo() => $_has(18);
  @$pb.TagNumber(19)
  void clearTempLogo() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get tempDesc => $_getSZ(19);
  @$pb.TagNumber(20)
  set tempDesc($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasTempDesc() => $_has(19);
  @$pb.TagNumber(20)
  void clearTempDesc() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get tempShortName => $_getSZ(20);
  @$pb.TagNumber(21)
  set tempShortName($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasTempShortName() => $_has(20);
  @$pb.TagNumber(21)
  void clearTempShortName() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get post => $_getSZ(21);
  @$pb.TagNumber(22)
  set post($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasPost() => $_has(21);
  @$pb.TagNumber(22)
  void clearPost() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get tmpPost => $_getSZ(22);
  @$pb.TagNumber(23)
  set tmpPost($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasTmpPost() => $_has(22);
  @$pb.TagNumber(23)
  void clearTmpPost() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get inUnion => $_getIZ(23);
  @$pb.TagNumber(24)
  set inUnion($core.int v) {
    $_setUnsignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasInUnion() => $_has(23);
  @$pb.TagNumber(24)
  void clearInUnion() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get userTitle => $_getIZ(24);
  @$pb.TagNumber(25)
  set userTitle($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasUserTitle() => $_has(24);
  @$pb.TagNumber(25)
  void clearUserTitle() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get userActiveNum => $_getIZ(25);
  @$pb.TagNumber(26)
  set userActiveNum($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasUserActiveNum() => $_has(25);
  @$pb.TagNumber(26)
  void clearUserActiveNum() => clearField(26);

  @$pb.TagNumber(27)
  $core.String get goldNum => $_getSZ(26);
  @$pb.TagNumber(27)
  set goldNum($core.String v) {
    $_setString(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasGoldNum() => $_has(26);
  @$pb.TagNumber(27)
  void clearGoldNum() => clearField(27);

  @$pb.TagNumber(28)
  $core.String get silverNum => $_getSZ(27);
  @$pb.TagNumber(28)
  set silverNum($core.String v) {
    $_setString(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasSilverNum() => $_has(27);
  @$pb.TagNumber(28)
  void clearSilverNum() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get rankNum => $_getIZ(28);
  @$pb.TagNumber(29)
  set rankNum($core.int v) {
    $_setUnsignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasRankNum() => $_has(28);
  @$pb.TagNumber(29)
  void clearRankNum() => clearField(29);

  @$pb.TagNumber(30)
  UnionInfoData_ChatroomInfo get chatroomInfo => $_getN(29);
  @$pb.TagNumber(30)
  set chatroomInfo(UnionInfoData_ChatroomInfo v) {
    setField(30, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasChatroomInfo() => $_has(29);
  @$pb.TagNumber(30)
  void clearChatroomInfo() => clearField(30);
  @$pb.TagNumber(30)
  UnionInfoData_ChatroomInfo ensureChatroomInfo() => $_ensure(29);

  @$pb.TagNumber(31)
  UnionInfoData_LuckyDipInfo get luckyDipInfo => $_getN(30);
  @$pb.TagNumber(31)
  set luckyDipInfo(UnionInfoData_LuckyDipInfo v) {
    setField(31, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasLuckyDipInfo() => $_has(30);
  @$pb.TagNumber(31)
  void clearLuckyDipInfo() => clearField(31);
  @$pb.TagNumber(31)
  UnionInfoData_LuckyDipInfo ensureLuckyDipInfo() => $_ensure(30);

  @$pb.TagNumber(32)
  $core.int get applyingCount => $_getIZ(31);
  @$pb.TagNumber(32)
  set applyingCount($core.int v) {
    $_setUnsignedInt32(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasApplyingCount() => $_has(31);
  @$pb.TagNumber(32)
  void clearApplyingCount() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get onlineUserNum => $_getIZ(32);
  @$pb.TagNumber(33)
  set onlineUserNum($core.int v) {
    $_setUnsignedInt32(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasOnlineUserNum() => $_has(32);
  @$pb.TagNumber(33)
  void clearOnlineUserNum() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get conditionVip => $_getIZ(33);
  @$pb.TagNumber(34)
  set conditionVip($core.int v) {
    $_setUnsignedInt32(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasConditionVip() => $_has(33);
  @$pb.TagNumber(34)
  void clearConditionVip() => clearField(34);

  @$pb.TagNumber(35)
  $core.int get conditionPopularity => $_getIZ(34);
  @$pb.TagNumber(35)
  set conditionPopularity($core.int v) {
    $_setUnsignedInt32(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasConditionPopularity() => $_has(34);
  @$pb.TagNumber(35)
  void clearConditionPopularity() => clearField(35);

  @$pb.TagNumber(36)
  $core.int get elderRecept => $_getIZ(35);
  @$pb.TagNumber(36)
  set elderRecept($core.int v) {
    $_setUnsignedInt32(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasElderRecept() => $_has(35);
  @$pb.TagNumber(36)
  void clearElderRecept() => clearField(36);
}

class UnionRoomInfo_Tag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionRoomInfo.Tag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'val')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagColor',
        protoName: 'tagColor')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..pPS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bgColors',
        protoName: 'bgColors')
    ..hasRequiredFields = false;

  UnionRoomInfo_Tag._() : super();
  factory UnionRoomInfo_Tag({
    $core.String? label,
    $core.String? val,
    $core.String? tagColor,
    $core.String? show,
    $core.Iterable<$core.String>? bgColors,
  }) {
    final _result = create();
    if (label != null) {
      _result.label = label;
    }
    if (val != null) {
      _result.val = val;
    }
    if (tagColor != null) {
      _result.tagColor = tagColor;
    }
    if (show != null) {
      _result.show = show;
    }
    if (bgColors != null) {
      _result.bgColors.addAll(bgColors);
    }
    return _result;
  }
  factory UnionRoomInfo_Tag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionRoomInfo_Tag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionRoomInfo_Tag clone() => UnionRoomInfo_Tag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionRoomInfo_Tag copyWith(void Function(UnionRoomInfo_Tag) updates) =>
      super.copyWith((message) => updates(message as UnionRoomInfo_Tag))
          as UnionRoomInfo_Tag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionRoomInfo_Tag create() => UnionRoomInfo_Tag._();
  UnionRoomInfo_Tag createEmptyInstance() => create();
  static $pb.PbList<UnionRoomInfo_Tag> createRepeated() =>
      $pb.PbList<UnionRoomInfo_Tag>();
  @$core.pragma('dart2js:noInline')
  static UnionRoomInfo_Tag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionRoomInfo_Tag>(create);
  static UnionRoomInfo_Tag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get val => $_getSZ(1);
  @$pb.TagNumber(2)
  set val($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearVal() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tagColor => $_getSZ(2);
  @$pb.TagNumber(3)
  set tagColor($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTagColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearTagColor() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get show => $_getSZ(3);
  @$pb.TagNumber(4)
  set show($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasShow() => $_has(3);
  @$pb.TagNumber(4)
  void clearShow() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get bgColors => $_getList(4);
}

class UnionRoomInfo_RoomTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionRoomInfo.RoomTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Id',
        $pb.PbFieldType.OU3,
        protoName: 'Id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Show',
        protoName: 'Show')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Label',
        protoName: 'Label')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'AcuteIcon',
        protoName: 'AcuteIcon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'FirstColor',
        protoName: 'FirstColor')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'SecColor',
        protoName: 'SecColor')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'CreateTime',
        $pb.PbFieldType.OU3,
        protoName: 'CreateTime')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'UpdateTime',
        $pb.PbFieldType.OU3,
        protoName: 'UpdateTime')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'TagIcon',
        protoName: 'TagIcon')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'TagColor',
        protoName: 'TagColor')
    ..hasRequiredFields = false;

  UnionRoomInfo_RoomTag._() : super();
  factory UnionRoomInfo_RoomTag({
    $core.int? id,
    $core.String? show,
    $core.String? label,
    $core.String? acuteIcon,
    $core.String? firstColor,
    $core.String? secColor,
    $core.int? createTime,
    $core.int? updateTime,
    $core.String? tagIcon,
    $core.String? tagColor,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (show != null) {
      _result.show = show;
    }
    if (label != null) {
      _result.label = label;
    }
    if (acuteIcon != null) {
      _result.acuteIcon = acuteIcon;
    }
    if (firstColor != null) {
      _result.firstColor = firstColor;
    }
    if (secColor != null) {
      _result.secColor = secColor;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    if (tagIcon != null) {
      _result.tagIcon = tagIcon;
    }
    if (tagColor != null) {
      _result.tagColor = tagColor;
    }
    return _result;
  }
  factory UnionRoomInfo_RoomTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionRoomInfo_RoomTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionRoomInfo_RoomTag clone() =>
      UnionRoomInfo_RoomTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionRoomInfo_RoomTag copyWith(
          void Function(UnionRoomInfo_RoomTag) updates) =>
      super.copyWith((message) => updates(message as UnionRoomInfo_RoomTag))
          as UnionRoomInfo_RoomTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionRoomInfo_RoomTag create() => UnionRoomInfo_RoomTag._();
  UnionRoomInfo_RoomTag createEmptyInstance() => create();
  static $pb.PbList<UnionRoomInfo_RoomTag> createRepeated() =>
      $pb.PbList<UnionRoomInfo_RoomTag>();
  @$core.pragma('dart2js:noInline')
  static UnionRoomInfo_RoomTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionRoomInfo_RoomTag>(create);
  static UnionRoomInfo_RoomTag? _defaultInstance;

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
  $core.String get show => $_getSZ(1);
  @$pb.TagNumber(2)
  set show($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShow() => $_has(1);
  @$pb.TagNumber(2)
  void clearShow() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get label => $_getSZ(2);
  @$pb.TagNumber(3)
  set label($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLabel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLabel() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get acuteIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set acuteIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAcuteIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearAcuteIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get firstColor => $_getSZ(4);
  @$pb.TagNumber(5)
  set firstColor($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFirstColor() => $_has(4);
  @$pb.TagNumber(5)
  void clearFirstColor() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get secColor => $_getSZ(5);
  @$pb.TagNumber(6)
  set secColor($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSecColor() => $_has(5);
  @$pb.TagNumber(6)
  void clearSecColor() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get createTime => $_getIZ(6);
  @$pb.TagNumber(7)
  set createTime($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCreateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreateTime() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get updateTime => $_getIZ(7);
  @$pb.TagNumber(8)
  set updateTime($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUpdateTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdateTime() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get tagIcon => $_getSZ(8);
  @$pb.TagNumber(9)
  set tagIcon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTagIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearTagIcon() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get tagColor => $_getSZ(9);
  @$pb.TagNumber(10)
  set tagColor($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTagColor() => $_has(9);
  @$pb.TagNumber(10)
  void clearTagColor() => clearField(10);
}

class UnionRoomInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionRoomInfo',
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
            : 'rid',
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
            : 'uname')
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
            : 'roomUserName',
        protoName: 'roomUserName')
    ..aOM<UnionRoomInfo_Tag>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagInfo',
        protoName: 'tagInfo',
        subBuilder: UnionRoomInfo_Tag.create)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleName',
        protoName: 'titleName')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'repeated',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineUser',
        $pb.PbFieldType.OU3,
        protoName: 'onlineUser')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hotNum',
        $pb.PbFieldType.OU3,
        protoName: 'hotNum')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankNum',
        $pb.PbFieldType.OU3,
        protoName: 'rankNum')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'open',
        $pb.PbFieldType.OU3)
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomName',
        protoName: 'roomName')
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.OU3,
        protoName: 'onlineStatus')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline',
        protoName: 'onlineDateline')
    ..aOM<UnionRoomInfo_RoomTag>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomTag',
        protoName: 'roomTag',
        subBuilder: UnionRoomInfo_RoomTag.create)
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partyStyle',
        protoName: 'partyStyle')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'real',
        $pb.PbFieldType.OU3)
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'types')
    ..hasRequiredFields = false;

  UnionRoomInfo._() : super();
  factory UnionRoomInfo({
    $core.int? uid,
    $core.int? rid,
    $core.String? icon,
    $core.String? uname,
    $core.int? sex,
    $core.String? roomUserName,
    UnionRoomInfo_Tag? tagInfo,
    $core.String? type,
    $core.String? titleName,
    $core.int? repeated,
    $core.int? onlineUser,
    $core.int? hotNum,
    $core.int? rankNum,
    $core.int? open,
    $core.String? roomName,
    $core.int? onlineStatus,
    $core.String? onlineDateline,
    UnionRoomInfo_RoomTag? roomTag,
    $core.String? partyStyle,
    $core.int? real,
    $core.String? types,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (uname != null) {
      _result.uname = uname;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (roomUserName != null) {
      _result.roomUserName = roomUserName;
    }
    if (tagInfo != null) {
      _result.tagInfo = tagInfo;
    }
    if (type != null) {
      _result.type = type;
    }
    if (titleName != null) {
      _result.titleName = titleName;
    }
    if (repeated != null) {
      _result.repeated = repeated;
    }
    if (onlineUser != null) {
      _result.onlineUser = onlineUser;
    }
    if (hotNum != null) {
      _result.hotNum = hotNum;
    }
    if (rankNum != null) {
      _result.rankNum = rankNum;
    }
    if (open != null) {
      _result.open = open;
    }
    if (roomName != null) {
      _result.roomName = roomName;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (roomTag != null) {
      _result.roomTag = roomTag;
    }
    if (partyStyle != null) {
      _result.partyStyle = partyStyle;
    }
    if (real != null) {
      _result.real = real;
    }
    if (types != null) {
      _result.types = types;
    }
    return _result;
  }
  factory UnionRoomInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionRoomInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionRoomInfo clone() => UnionRoomInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionRoomInfo copyWith(void Function(UnionRoomInfo) updates) =>
      super.copyWith((message) => updates(message as UnionRoomInfo))
          as UnionRoomInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionRoomInfo create() => UnionRoomInfo._();
  UnionRoomInfo createEmptyInstance() => create();
  static $pb.PbList<UnionRoomInfo> createRepeated() =>
      $pb.PbList<UnionRoomInfo>();
  @$core.pragma('dart2js:noInline')
  static UnionRoomInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionRoomInfo>(create);
  static UnionRoomInfo? _defaultInstance;

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
  $core.int get rid => $_getIZ(1);
  @$pb.TagNumber(2)
  set rid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => clearField(2);

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
  $core.String get uname => $_getSZ(3);
  @$pb.TagNumber(4)
  set uname($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUname() => $_has(3);
  @$pb.TagNumber(4)
  void clearUname() => clearField(4);

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
  $core.String get roomUserName => $_getSZ(5);
  @$pb.TagNumber(6)
  set roomUserName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRoomUserName() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomUserName() => clearField(6);

  @$pb.TagNumber(7)
  UnionRoomInfo_Tag get tagInfo => $_getN(6);
  @$pb.TagNumber(7)
  set tagInfo(UnionRoomInfo_Tag v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTagInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearTagInfo() => clearField(7);
  @$pb.TagNumber(7)
  UnionRoomInfo_Tag ensureTagInfo() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get type => $_getSZ(7);
  @$pb.TagNumber(8)
  set type($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasType() => $_has(7);
  @$pb.TagNumber(8)
  void clearType() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get titleName => $_getSZ(8);
  @$pb.TagNumber(9)
  set titleName($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTitleName() => $_has(8);
  @$pb.TagNumber(9)
  void clearTitleName() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get repeated => $_getIZ(9);
  @$pb.TagNumber(10)
  set repeated($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRepeated() => $_has(9);
  @$pb.TagNumber(10)
  void clearRepeated() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get onlineUser => $_getIZ(10);
  @$pb.TagNumber(11)
  set onlineUser($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasOnlineUser() => $_has(10);
  @$pb.TagNumber(11)
  void clearOnlineUser() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get hotNum => $_getIZ(11);
  @$pb.TagNumber(12)
  set hotNum($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasHotNum() => $_has(11);
  @$pb.TagNumber(12)
  void clearHotNum() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get rankNum => $_getIZ(12);
  @$pb.TagNumber(13)
  set rankNum($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasRankNum() => $_has(12);
  @$pb.TagNumber(13)
  void clearRankNum() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get open => $_getIZ(13);
  @$pb.TagNumber(14)
  set open($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasOpen() => $_has(13);
  @$pb.TagNumber(14)
  void clearOpen() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get roomName => $_getSZ(14);
  @$pb.TagNumber(15)
  set roomName($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasRoomName() => $_has(14);
  @$pb.TagNumber(15)
  void clearRoomName() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get onlineStatus => $_getIZ(15);
  @$pb.TagNumber(16)
  set onlineStatus($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasOnlineStatus() => $_has(15);
  @$pb.TagNumber(16)
  void clearOnlineStatus() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get onlineDateline => $_getSZ(16);
  @$pb.TagNumber(17)
  set onlineDateline($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasOnlineDateline() => $_has(16);
  @$pb.TagNumber(17)
  void clearOnlineDateline() => clearField(17);

  @$pb.TagNumber(18)
  UnionRoomInfo_RoomTag get roomTag => $_getN(17);
  @$pb.TagNumber(18)
  set roomTag(UnionRoomInfo_RoomTag v) {
    setField(18, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasRoomTag() => $_has(17);
  @$pb.TagNumber(18)
  void clearRoomTag() => clearField(18);
  @$pb.TagNumber(18)
  UnionRoomInfo_RoomTag ensureRoomTag() => $_ensure(17);

  @$pb.TagNumber(19)
  $core.String get partyStyle => $_getSZ(18);
  @$pb.TagNumber(19)
  set partyStyle($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasPartyStyle() => $_has(18);
  @$pb.TagNumber(19)
  void clearPartyStyle() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get real => $_getIZ(19);
  @$pb.TagNumber(20)
  set real($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasReal() => $_has(19);
  @$pb.TagNumber(20)
  void clearReal() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get types => $_getSZ(20);
  @$pb.TagNumber(21)
  set types($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasTypes() => $_has(20);
  @$pb.TagNumber(21)
  void clearTypes() => clearField(21);
}

class UnionOnlineRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionOnlineRsp',
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
    ..aOM<UnionOnlineData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: UnionOnlineData.create)
    ..hasRequiredFields = false;

  UnionOnlineRsp._() : super();
  factory UnionOnlineRsp({
    $core.bool? success,
    $core.String? msg,
    UnionOnlineData? data,
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
  factory UnionOnlineRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionOnlineRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionOnlineRsp clone() => UnionOnlineRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionOnlineRsp copyWith(void Function(UnionOnlineRsp) updates) =>
      super.copyWith((message) => updates(message as UnionOnlineRsp))
          as UnionOnlineRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionOnlineRsp create() => UnionOnlineRsp._();
  UnionOnlineRsp createEmptyInstance() => create();
  static $pb.PbList<UnionOnlineRsp> createRepeated() =>
      $pb.PbList<UnionOnlineRsp>();
  @$core.pragma('dart2js:noInline')
  static UnionOnlineRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionOnlineRsp>(create);
  static UnionOnlineRsp? _defaultInstance;

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
  UnionOnlineData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(UnionOnlineData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  UnionOnlineData ensureData() => $_ensure(2);
}

class UnionOnlineData_Temp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionOnlineData.Temp',
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
            : 'icon')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateLine',
        $pb.PbFieldType.OU3,
        protoName: 'onlineDateLine')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOM<UnionOnlineData_RoomTag>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomTag',
        subBuilder: UnionOnlineData_RoomTag.create)
    ..hasRequiredFields = false;

  UnionOnlineData_Temp._() : super();
  factory UnionOnlineData_Temp({
    $core.int? uid,
    $core.String? icon,
    $core.int? onlineDateLine,
    $core.int? rid,
    UnionOnlineData_RoomTag? roomTag,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (onlineDateLine != null) {
      _result.onlineDateLine = onlineDateLine;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (roomTag != null) {
      _result.roomTag = roomTag;
    }
    return _result;
  }
  factory UnionOnlineData_Temp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionOnlineData_Temp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionOnlineData_Temp clone() =>
      UnionOnlineData_Temp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionOnlineData_Temp copyWith(void Function(UnionOnlineData_Temp) updates) =>
      super.copyWith((message) => updates(message as UnionOnlineData_Temp))
          as UnionOnlineData_Temp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionOnlineData_Temp create() => UnionOnlineData_Temp._();
  UnionOnlineData_Temp createEmptyInstance() => create();
  static $pb.PbList<UnionOnlineData_Temp> createRepeated() =>
      $pb.PbList<UnionOnlineData_Temp>();
  @$core.pragma('dart2js:noInline')
  static UnionOnlineData_Temp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionOnlineData_Temp>(create);
  static UnionOnlineData_Temp? _defaultInstance;

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
  $core.int get onlineDateLine => $_getIZ(2);
  @$pb.TagNumber(3)
  set onlineDateLine($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOnlineDateLine() => $_has(2);
  @$pb.TagNumber(3)
  void clearOnlineDateLine() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get rid => $_getIZ(3);
  @$pb.TagNumber(4)
  set rid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRid() => $_has(3);
  @$pb.TagNumber(4)
  void clearRid() => clearField(4);

  @$pb.TagNumber(5)
  UnionOnlineData_RoomTag get roomTag => $_getN(4);
  @$pb.TagNumber(5)
  set roomTag(UnionOnlineData_RoomTag v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRoomTag() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomTag() => clearField(5);
  @$pb.TagNumber(5)
  UnionOnlineData_RoomTag ensureRoomTag() => $_ensure(4);
}

class UnionOnlineData_RoomTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionOnlineData.RoomTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Id',
        $pb.PbFieldType.OU3,
        protoName: 'Id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Show',
        protoName: 'Show')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'Label',
        protoName: 'Label')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'AcuteIcon',
        protoName: 'AcuteIcon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'FirstColor',
        protoName: 'FirstColor')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'SecColor',
        protoName: 'SecColor')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'CreateTime',
        $pb.PbFieldType.OU3,
        protoName: 'CreateTime')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'UpdateTime',
        $pb.PbFieldType.OU3,
        protoName: 'UpdateTime')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'TagIcon',
        protoName: 'TagIcon')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'TagColor',
        protoName: 'TagColor')
    ..hasRequiredFields = false;

  UnionOnlineData_RoomTag._() : super();
  factory UnionOnlineData_RoomTag({
    $core.int? id,
    $core.String? show,
    $core.String? label,
    $core.String? acuteIcon,
    $core.String? firstColor,
    $core.String? secColor,
    $core.int? createTime,
    $core.int? updateTime,
    $core.String? tagIcon,
    $core.String? tagColor,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (show != null) {
      _result.show = show;
    }
    if (label != null) {
      _result.label = label;
    }
    if (acuteIcon != null) {
      _result.acuteIcon = acuteIcon;
    }
    if (firstColor != null) {
      _result.firstColor = firstColor;
    }
    if (secColor != null) {
      _result.secColor = secColor;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    if (tagIcon != null) {
      _result.tagIcon = tagIcon;
    }
    if (tagColor != null) {
      _result.tagColor = tagColor;
    }
    return _result;
  }
  factory UnionOnlineData_RoomTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionOnlineData_RoomTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionOnlineData_RoomTag clone() =>
      UnionOnlineData_RoomTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionOnlineData_RoomTag copyWith(
          void Function(UnionOnlineData_RoomTag) updates) =>
      super.copyWith((message) => updates(message as UnionOnlineData_RoomTag))
          as UnionOnlineData_RoomTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionOnlineData_RoomTag create() => UnionOnlineData_RoomTag._();
  UnionOnlineData_RoomTag createEmptyInstance() => create();
  static $pb.PbList<UnionOnlineData_RoomTag> createRepeated() =>
      $pb.PbList<UnionOnlineData_RoomTag>();
  @$core.pragma('dart2js:noInline')
  static UnionOnlineData_RoomTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionOnlineData_RoomTag>(create);
  static UnionOnlineData_RoomTag? _defaultInstance;

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
  $core.String get show => $_getSZ(1);
  @$pb.TagNumber(2)
  set show($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShow() => $_has(1);
  @$pb.TagNumber(2)
  void clearShow() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get label => $_getSZ(2);
  @$pb.TagNumber(3)
  set label($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLabel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLabel() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get acuteIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set acuteIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAcuteIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearAcuteIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get firstColor => $_getSZ(4);
  @$pb.TagNumber(5)
  set firstColor($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFirstColor() => $_has(4);
  @$pb.TagNumber(5)
  void clearFirstColor() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get secColor => $_getSZ(5);
  @$pb.TagNumber(6)
  set secColor($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSecColor() => $_has(5);
  @$pb.TagNumber(6)
  void clearSecColor() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get createTime => $_getIZ(6);
  @$pb.TagNumber(7)
  set createTime($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCreateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreateTime() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get updateTime => $_getIZ(7);
  @$pb.TagNumber(8)
  set updateTime($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUpdateTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdateTime() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get tagIcon => $_getSZ(8);
  @$pb.TagNumber(9)
  set tagIcon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTagIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearTagIcon() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get tagColor => $_getSZ(9);
  @$pb.TagNumber(10)
  set tagColor($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTagColor() => $_has(9);
  @$pb.TagNumber(10)
  void clearTagColor() => clearField(10);
}

class UnionOnlineData_ProfileBubbleTail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionOnlineData.ProfileBubbleTail',
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
    ..hasRequiredFields = false;

  UnionOnlineData_ProfileBubbleTail._() : super();
  factory UnionOnlineData_ProfileBubbleTail({
    $core.int? cid,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    return _result;
  }
  factory UnionOnlineData_ProfileBubbleTail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionOnlineData_ProfileBubbleTail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionOnlineData_ProfileBubbleTail clone() =>
      UnionOnlineData_ProfileBubbleTail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionOnlineData_ProfileBubbleTail copyWith(
          void Function(UnionOnlineData_ProfileBubbleTail) updates) =>
      super.copyWith((message) =>
              updates(message as UnionOnlineData_ProfileBubbleTail))
          as UnionOnlineData_ProfileBubbleTail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionOnlineData_ProfileBubbleTail create() =>
      UnionOnlineData_ProfileBubbleTail._();
  UnionOnlineData_ProfileBubbleTail createEmptyInstance() => create();
  static $pb.PbList<UnionOnlineData_ProfileBubbleTail> createRepeated() =>
      $pb.PbList<UnionOnlineData_ProfileBubbleTail>();
  @$core.pragma('dart2js:noInline')
  static UnionOnlineData_ProfileBubbleTail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionOnlineData_ProfileBubbleTail>(
          create);
  static UnionOnlineData_ProfileBubbleTail? _defaultInstance;

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
}

class UnionOnlineData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionOnlineData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..pc<UnionOnlineData_Temp>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: UnionOnlineData_Temp.create)
    ..pc<UnionOnlineData_ProfileBubbleTail>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubbleTail',
        $pb.PbFieldType.PM,
        subBuilder: UnionOnlineData_ProfileBubbleTail.create)
    ..hasRequiredFields = false;

  UnionOnlineData._() : super();
  factory UnionOnlineData({
    $core.String? title,
    $core.int? num,
    $core.Iterable<UnionOnlineData_Temp>? list,
    $core.Iterable<UnionOnlineData_ProfileBubbleTail>? bubbleTail,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (num != null) {
      _result.num = num;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (bubbleTail != null) {
      _result.bubbleTail.addAll(bubbleTail);
    }
    return _result;
  }
  factory UnionOnlineData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionOnlineData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionOnlineData clone() => UnionOnlineData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionOnlineData copyWith(void Function(UnionOnlineData) updates) =>
      super.copyWith((message) => updates(message as UnionOnlineData))
          as UnionOnlineData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionOnlineData create() => UnionOnlineData._();
  UnionOnlineData createEmptyInstance() => create();
  static $pb.PbList<UnionOnlineData> createRepeated() =>
      $pb.PbList<UnionOnlineData>();
  @$core.pragma('dart2js:noInline')
  static UnionOnlineData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionOnlineData>(create);
  static UnionOnlineData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get num => $_getIZ(1);
  @$pb.TagNumber(2)
  set num($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<UnionOnlineData_Temp> get list => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<UnionOnlineData_ProfileBubbleTail> get bubbleTail => $_getList(3);
}

class MyUnionRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MyUnionRsp',
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
    ..aOM<MyUnionInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: MyUnionInfo.create)
    ..hasRequiredFields = false;

  MyUnionRsp._() : super();
  factory MyUnionRsp({
    $core.bool? success,
    $core.String? msg,
    MyUnionInfo? data,
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
  factory MyUnionRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MyUnionRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MyUnionRsp clone() => MyUnionRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MyUnionRsp copyWith(void Function(MyUnionRsp) updates) =>
      super.copyWith((message) => updates(message as MyUnionRsp))
          as MyUnionRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MyUnionRsp create() => MyUnionRsp._();
  MyUnionRsp createEmptyInstance() => create();
  static $pb.PbList<MyUnionRsp> createRepeated() => $pb.PbList<MyUnionRsp>();
  @$core.pragma('dart2js:noInline')
  static MyUnionRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MyUnionRsp>(create);
  static MyUnionRsp? _defaultInstance;

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
  MyUnionInfo get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(MyUnionInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  MyUnionInfo ensureData() => $_ensure(2);
}

class MyUnionInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MyUnionInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
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
            : 'shortName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createName')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logo')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bgPic')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'headerPic')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activeNum',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxUserNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userNum',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'highActivePoint',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'condition',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isNotify',
        $pb.PbFieldType.O3)
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tempName')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tempLogo')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tempDesc')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tempShortName')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'post')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tmpPost')
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'conditionVip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'conditionPopularity',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MyUnionInfo._() : super();
  factory MyUnionInfo({
    $core.int? appId,
    $core.String? name,
    $core.String? shortName,
    $core.int? createUid,
    $core.String? createName,
    $core.String? logo,
    $core.String? bgPic,
    $core.String? headerPic,
    $core.String? desc,
    $core.int? unId,
    $core.int? activeNum,
    $core.int? level,
    $core.int? maxUserNum,
    $core.int? userNum,
    $fixnum.Int64? highActivePoint,
    $core.int? condition,
    $core.int? isNotify,
    $core.String? tempName,
    $core.String? tempLogo,
    $core.String? tempDesc,
    $core.String? tempShortName,
    $core.String? post,
    $core.String? tmpPost,
    $core.int? conditionVip,
    $core.int? conditionPopularity,
  }) {
    final _result = create();
    if (appId != null) {
      _result.appId = appId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (shortName != null) {
      _result.shortName = shortName;
    }
    if (createUid != null) {
      _result.createUid = createUid;
    }
    if (createName != null) {
      _result.createName = createName;
    }
    if (logo != null) {
      _result.logo = logo;
    }
    if (bgPic != null) {
      _result.bgPic = bgPic;
    }
    if (headerPic != null) {
      _result.headerPic = headerPic;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (unId != null) {
      _result.unId = unId;
    }
    if (activeNum != null) {
      _result.activeNum = activeNum;
    }
    if (level != null) {
      _result.level = level;
    }
    if (maxUserNum != null) {
      _result.maxUserNum = maxUserNum;
    }
    if (userNum != null) {
      _result.userNum = userNum;
    }
    if (highActivePoint != null) {
      _result.highActivePoint = highActivePoint;
    }
    if (condition != null) {
      _result.condition = condition;
    }
    if (isNotify != null) {
      _result.isNotify = isNotify;
    }
    if (tempName != null) {
      _result.tempName = tempName;
    }
    if (tempLogo != null) {
      _result.tempLogo = tempLogo;
    }
    if (tempDesc != null) {
      _result.tempDesc = tempDesc;
    }
    if (tempShortName != null) {
      _result.tempShortName = tempShortName;
    }
    if (post != null) {
      _result.post = post;
    }
    if (tmpPost != null) {
      _result.tmpPost = tmpPost;
    }
    if (conditionVip != null) {
      _result.conditionVip = conditionVip;
    }
    if (conditionPopularity != null) {
      _result.conditionPopularity = conditionPopularity;
    }
    return _result;
  }
  factory MyUnionInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MyUnionInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MyUnionInfo clone() => MyUnionInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MyUnionInfo copyWith(void Function(MyUnionInfo) updates) =>
      super.copyWith((message) => updates(message as MyUnionInfo))
          as MyUnionInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MyUnionInfo create() => MyUnionInfo._();
  MyUnionInfo createEmptyInstance() => create();
  static $pb.PbList<MyUnionInfo> createRepeated() => $pb.PbList<MyUnionInfo>();
  @$core.pragma('dart2js:noInline')
  static MyUnionInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MyUnionInfo>(create);
  static MyUnionInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get appId => $_getIZ(0);
  @$pb.TagNumber(1)
  set appId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAppId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppId() => clearField(1);

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
  $core.String get shortName => $_getSZ(2);
  @$pb.TagNumber(3)
  set shortName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShortName() => $_has(2);
  @$pb.TagNumber(3)
  void clearShortName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get createUid => $_getIZ(3);
  @$pb.TagNumber(4)
  set createUid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCreateUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreateUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get createName => $_getSZ(4);
  @$pb.TagNumber(5)
  set createName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCreateName() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get logo => $_getSZ(5);
  @$pb.TagNumber(6)
  set logo($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLogo() => $_has(5);
  @$pb.TagNumber(6)
  void clearLogo() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get bgPic => $_getSZ(6);
  @$pb.TagNumber(7)
  set bgPic($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBgPic() => $_has(6);
  @$pb.TagNumber(7)
  void clearBgPic() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get headerPic => $_getSZ(7);
  @$pb.TagNumber(8)
  set headerPic($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasHeaderPic() => $_has(7);
  @$pb.TagNumber(8)
  void clearHeaderPic() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get desc => $_getSZ(8);
  @$pb.TagNumber(9)
  set desc($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasDesc() => $_has(8);
  @$pb.TagNumber(9)
  void clearDesc() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get unId => $_getIZ(9);
  @$pb.TagNumber(10)
  set unId($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasUnId() => $_has(9);
  @$pb.TagNumber(10)
  void clearUnId() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get activeNum => $_getIZ(10);
  @$pb.TagNumber(11)
  set activeNum($core.int v) {
    $_setSignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasActiveNum() => $_has(10);
  @$pb.TagNumber(11)
  void clearActiveNum() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get level => $_getIZ(11);
  @$pb.TagNumber(12)
  set level($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasLevel() => $_has(11);
  @$pb.TagNumber(12)
  void clearLevel() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get maxUserNum => $_getIZ(12);
  @$pb.TagNumber(13)
  set maxUserNum($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasMaxUserNum() => $_has(12);
  @$pb.TagNumber(13)
  void clearMaxUserNum() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get userNum => $_getIZ(13);
  @$pb.TagNumber(14)
  set userNum($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasUserNum() => $_has(13);
  @$pb.TagNumber(14)
  void clearUserNum() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get highActivePoint => $_getI64(14);
  @$pb.TagNumber(15)
  set highActivePoint($fixnum.Int64 v) {
    $_setInt64(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasHighActivePoint() => $_has(14);
  @$pb.TagNumber(15)
  void clearHighActivePoint() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get condition => $_getIZ(15);
  @$pb.TagNumber(16)
  set condition($core.int v) {
    $_setSignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasCondition() => $_has(15);
  @$pb.TagNumber(16)
  void clearCondition() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get isNotify => $_getIZ(16);
  @$pb.TagNumber(17)
  set isNotify($core.int v) {
    $_setSignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasIsNotify() => $_has(16);
  @$pb.TagNumber(17)
  void clearIsNotify() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get tempName => $_getSZ(17);
  @$pb.TagNumber(18)
  set tempName($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasTempName() => $_has(17);
  @$pb.TagNumber(18)
  void clearTempName() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get tempLogo => $_getSZ(18);
  @$pb.TagNumber(19)
  set tempLogo($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasTempLogo() => $_has(18);
  @$pb.TagNumber(19)
  void clearTempLogo() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get tempDesc => $_getSZ(19);
  @$pb.TagNumber(20)
  set tempDesc($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasTempDesc() => $_has(19);
  @$pb.TagNumber(20)
  void clearTempDesc() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get tempShortName => $_getSZ(20);
  @$pb.TagNumber(21)
  set tempShortName($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasTempShortName() => $_has(20);
  @$pb.TagNumber(21)
  void clearTempShortName() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get post => $_getSZ(21);
  @$pb.TagNumber(22)
  set post($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasPost() => $_has(21);
  @$pb.TagNumber(22)
  void clearPost() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get tmpPost => $_getSZ(22);
  @$pb.TagNumber(23)
  set tmpPost($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasTmpPost() => $_has(22);
  @$pb.TagNumber(23)
  void clearTmpPost() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get conditionVip => $_getIZ(23);
  @$pb.TagNumber(24)
  set conditionVip($core.int v) {
    $_setUnsignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasConditionVip() => $_has(23);
  @$pb.TagNumber(24)
  void clearConditionVip() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get conditionPopularity => $_getIZ(24);
  @$pb.TagNumber(25)
  set conditionPopularity($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasConditionPopularity() => $_has(24);
  @$pb.TagNumber(25)
  void clearConditionPopularity() => clearField(25);
}

class UnionBaseResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionBaseResp',
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

  UnionBaseResp._() : super();
  factory UnionBaseResp({
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
  factory UnionBaseResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionBaseResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionBaseResp clone() => UnionBaseResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionBaseResp copyWith(void Function(UnionBaseResp) updates) =>
      super.copyWith((message) => updates(message as UnionBaseResp))
          as UnionBaseResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionBaseResp create() => UnionBaseResp._();
  UnionBaseResp createEmptyInstance() => create();
  static $pb.PbList<UnionBaseResp> createRepeated() =>
      $pb.PbList<UnionBaseResp>();
  @$core.pragma('dart2js:noInline')
  static UnionBaseResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionBaseResp>(create);
  static UnionBaseResp? _defaultInstance;

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

class UnionCommonRewardResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionCommonRewardResp',
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
    ..aOM<UnionIndexData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: UnionIndexData.create)
    ..pc<UnionNormalReward>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'normalRewards',
        $pb.PbFieldType.PM,
        protoName: 'normalRewards',
        subBuilder: UnionNormalReward.create)
    ..hasRequiredFields = false;

  UnionCommonRewardResp._() : super();
  factory UnionCommonRewardResp({
    $core.bool? success,
    $core.String? msg,
    UnionIndexData? data,
    $core.Iterable<UnionNormalReward>? normalRewards,
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
    if (normalRewards != null) {
      _result.normalRewards.addAll(normalRewards);
    }
    return _result;
  }
  factory UnionCommonRewardResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionCommonRewardResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionCommonRewardResp clone() =>
      UnionCommonRewardResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionCommonRewardResp copyWith(
          void Function(UnionCommonRewardResp) updates) =>
      super.copyWith((message) => updates(message as UnionCommonRewardResp))
          as UnionCommonRewardResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionCommonRewardResp create() => UnionCommonRewardResp._();
  UnionCommonRewardResp createEmptyInstance() => create();
  static $pb.PbList<UnionCommonRewardResp> createRepeated() =>
      $pb.PbList<UnionCommonRewardResp>();
  @$core.pragma('dart2js:noInline')
  static UnionCommonRewardResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionCommonRewardResp>(create);
  static UnionCommonRewardResp? _defaultInstance;

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
  UnionIndexData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(UnionIndexData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  UnionIndexData ensureData() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<UnionNormalReward> get normalRewards => $_getList(3);
}

class UnionNormalReward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionNormalReward',
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
            : 'avatar')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cNum',
        $pb.PbFieldType.OU3,
        protoName: 'cNum')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cType',
        protoName: 'cType')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3,
        protoName: 'groupId')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subType',
        protoName: 'subType')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageBg',
        protoName: 'imageBg')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubbleDesc',
        protoName: 'bubbleDesc')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubbleFrontColor',
        protoName: 'bubbleFrontColor')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'period')
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boxType',
        $pb.PbFieldType.OU3,
        protoName: 'boxType')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imagePop',
        protoName: 'imagePop')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isLimited',
        $pb.PbFieldType.OU3,
        protoName: 'isLimited')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cornerIcon',
        protoName: 'cornerIcon')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cornerDesc',
        protoName: 'cornerDesc')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'moneyType',
        protoName: 'moneyType')
    ..aOM<UnionGiftColorConfig>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'colorConfig',
        protoName: 'colorConfig',
        subBuilder: UnionGiftColorConfig.create)
    ..pc<UnionCommodityGift>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gifts',
        $pb.PbFieldType.PM,
        subBuilder: UnionCommodityGift.create)
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'returnNum',
        $pb.PbFieldType.OU3,
        protoName: 'returnNum')
    ..aOS(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filterTabName',
        protoName: 'filterTabName')
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveOnly',
        $pb.PbFieldType.OU3,
        protoName: 'liveOnly')
    ..aOS(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveLabel',
        protoName: 'liveLabel')
    ..aOS(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpPath',
        protoName: 'jumpPath')
    ..aOS(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inUseDesc',
        protoName: 'inUseDesc')
    ..hasRequiredFields = false;

  UnionNormalReward._() : super();
  factory UnionNormalReward({
    $core.int? id,
    $core.String? avatar,
    $core.int? cid,
    $core.int? cNum,
    $core.String? cType,
    $core.int? groupId,
    $core.String? name,
    $core.String? subType,
    $core.String? desc,
    $core.String? type,
    $core.String? image,
    $core.String? imageBg,
    $core.String? bubbleDesc,
    $core.String? bubbleFrontColor,
    $core.String? period,
    $core.int? price,
    $core.int? boxType,
    $core.String? content,
    $core.String? imagePop,
    $core.int? isLimited,
    $core.String? cornerIcon,
    $core.String? cornerDesc,
    $core.String? moneyType,
    UnionGiftColorConfig? colorConfig,
    $core.Iterable<UnionCommodityGift>? gifts,
    $core.int? num,
    $core.int? returnNum,
    $core.String? filterTabName,
    $core.int? liveOnly,
    $core.String? liveLabel,
    $core.String? jumpPath,
    $core.String? inUseDesc,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (cNum != null) {
      _result.cNum = cNum;
    }
    if (cType != null) {
      _result.cType = cType;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (subType != null) {
      _result.subType = subType;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (type != null) {
      _result.type = type;
    }
    if (image != null) {
      _result.image = image;
    }
    if (imageBg != null) {
      _result.imageBg = imageBg;
    }
    if (bubbleDesc != null) {
      _result.bubbleDesc = bubbleDesc;
    }
    if (bubbleFrontColor != null) {
      _result.bubbleFrontColor = bubbleFrontColor;
    }
    if (period != null) {
      _result.period = period;
    }
    if (price != null) {
      _result.price = price;
    }
    if (boxType != null) {
      _result.boxType = boxType;
    }
    if (content != null) {
      _result.content = content;
    }
    if (imagePop != null) {
      _result.imagePop = imagePop;
    }
    if (isLimited != null) {
      _result.isLimited = isLimited;
    }
    if (cornerIcon != null) {
      _result.cornerIcon = cornerIcon;
    }
    if (cornerDesc != null) {
      _result.cornerDesc = cornerDesc;
    }
    if (moneyType != null) {
      _result.moneyType = moneyType;
    }
    if (colorConfig != null) {
      _result.colorConfig = colorConfig;
    }
    if (gifts != null) {
      _result.gifts.addAll(gifts);
    }
    if (num != null) {
      _result.num = num;
    }
    if (returnNum != null) {
      _result.returnNum = returnNum;
    }
    if (filterTabName != null) {
      _result.filterTabName = filterTabName;
    }
    if (liveOnly != null) {
      _result.liveOnly = liveOnly;
    }
    if (liveLabel != null) {
      _result.liveLabel = liveLabel;
    }
    if (jumpPath != null) {
      _result.jumpPath = jumpPath;
    }
    if (inUseDesc != null) {
      _result.inUseDesc = inUseDesc;
    }
    return _result;
  }
  factory UnionNormalReward.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionNormalReward.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionNormalReward clone() => UnionNormalReward()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionNormalReward copyWith(void Function(UnionNormalReward) updates) =>
      super.copyWith((message) => updates(message as UnionNormalReward))
          as UnionNormalReward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionNormalReward create() => UnionNormalReward._();
  UnionNormalReward createEmptyInstance() => create();
  static $pb.PbList<UnionNormalReward> createRepeated() =>
      $pb.PbList<UnionNormalReward>();
  @$core.pragma('dart2js:noInline')
  static UnionNormalReward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionNormalReward>(create);
  static UnionNormalReward? _defaultInstance;

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
  $core.String get avatar => $_getSZ(1);
  @$pb.TagNumber(2)
  set avatar($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAvatar() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvatar() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get cid => $_getIZ(2);
  @$pb.TagNumber(3)
  set cid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCid() => $_has(2);
  @$pb.TagNumber(3)
  void clearCid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get cNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set cNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearCNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get cType => $_getSZ(4);
  @$pb.TagNumber(5)
  set cType($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCType() => $_has(4);
  @$pb.TagNumber(5)
  void clearCType() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get groupId => $_getIZ(5);
  @$pb.TagNumber(6)
  set groupId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGroupId() => $_has(5);
  @$pb.TagNumber(6)
  void clearGroupId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get name => $_getSZ(6);
  @$pb.TagNumber(7)
  set name($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasName() => $_has(6);
  @$pb.TagNumber(7)
  void clearName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get subType => $_getSZ(7);
  @$pb.TagNumber(8)
  set subType($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSubType() => $_has(7);
  @$pb.TagNumber(8)
  void clearSubType() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get desc => $_getSZ(8);
  @$pb.TagNumber(9)
  set desc($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasDesc() => $_has(8);
  @$pb.TagNumber(9)
  void clearDesc() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get type => $_getSZ(9);
  @$pb.TagNumber(10)
  set type($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasType() => $_has(9);
  @$pb.TagNumber(10)
  void clearType() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get image => $_getSZ(10);
  @$pb.TagNumber(11)
  set image($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasImage() => $_has(10);
  @$pb.TagNumber(11)
  void clearImage() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get imageBg => $_getSZ(11);
  @$pb.TagNumber(12)
  set imageBg($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasImageBg() => $_has(11);
  @$pb.TagNumber(12)
  void clearImageBg() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get bubbleDesc => $_getSZ(12);
  @$pb.TagNumber(13)
  set bubbleDesc($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasBubbleDesc() => $_has(12);
  @$pb.TagNumber(13)
  void clearBubbleDesc() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get bubbleFrontColor => $_getSZ(13);
  @$pb.TagNumber(14)
  set bubbleFrontColor($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasBubbleFrontColor() => $_has(13);
  @$pb.TagNumber(14)
  void clearBubbleFrontColor() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get period => $_getSZ(14);
  @$pb.TagNumber(15)
  set period($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasPeriod() => $_has(14);
  @$pb.TagNumber(15)
  void clearPeriod() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get price => $_getIZ(15);
  @$pb.TagNumber(16)
  set price($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasPrice() => $_has(15);
  @$pb.TagNumber(16)
  void clearPrice() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get boxType => $_getIZ(16);
  @$pb.TagNumber(17)
  set boxType($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasBoxType() => $_has(16);
  @$pb.TagNumber(17)
  void clearBoxType() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get content => $_getSZ(17);
  @$pb.TagNumber(18)
  set content($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasContent() => $_has(17);
  @$pb.TagNumber(18)
  void clearContent() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get imagePop => $_getSZ(18);
  @$pb.TagNumber(19)
  set imagePop($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasImagePop() => $_has(18);
  @$pb.TagNumber(19)
  void clearImagePop() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get isLimited => $_getIZ(19);
  @$pb.TagNumber(20)
  set isLimited($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasIsLimited() => $_has(19);
  @$pb.TagNumber(20)
  void clearIsLimited() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get cornerIcon => $_getSZ(20);
  @$pb.TagNumber(21)
  set cornerIcon($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasCornerIcon() => $_has(20);
  @$pb.TagNumber(21)
  void clearCornerIcon() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get cornerDesc => $_getSZ(21);
  @$pb.TagNumber(22)
  set cornerDesc($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasCornerDesc() => $_has(21);
  @$pb.TagNumber(22)
  void clearCornerDesc() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get moneyType => $_getSZ(22);
  @$pb.TagNumber(23)
  set moneyType($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasMoneyType() => $_has(22);
  @$pb.TagNumber(23)
  void clearMoneyType() => clearField(23);

  @$pb.TagNumber(24)
  UnionGiftColorConfig get colorConfig => $_getN(23);
  @$pb.TagNumber(24)
  set colorConfig(UnionGiftColorConfig v) {
    setField(24, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasColorConfig() => $_has(23);
  @$pb.TagNumber(24)
  void clearColorConfig() => clearField(24);
  @$pb.TagNumber(24)
  UnionGiftColorConfig ensureColorConfig() => $_ensure(23);

  @$pb.TagNumber(25)
  $core.List<UnionCommodityGift> get gifts => $_getList(24);

  @$pb.TagNumber(26)
  $core.int get num => $_getIZ(25);
  @$pb.TagNumber(26)
  set num($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasNum() => $_has(25);
  @$pb.TagNumber(26)
  void clearNum() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get returnNum => $_getIZ(26);
  @$pb.TagNumber(27)
  set returnNum($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasReturnNum() => $_has(26);
  @$pb.TagNumber(27)
  void clearReturnNum() => clearField(27);

  @$pb.TagNumber(28)
  $core.String get filterTabName => $_getSZ(27);
  @$pb.TagNumber(28)
  set filterTabName($core.String v) {
    $_setString(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasFilterTabName() => $_has(27);
  @$pb.TagNumber(28)
  void clearFilterTabName() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get liveOnly => $_getIZ(28);
  @$pb.TagNumber(29)
  set liveOnly($core.int v) {
    $_setUnsignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasLiveOnly() => $_has(28);
  @$pb.TagNumber(29)
  void clearLiveOnly() => clearField(29);

  @$pb.TagNumber(30)
  $core.String get liveLabel => $_getSZ(29);
  @$pb.TagNumber(30)
  set liveLabel($core.String v) {
    $_setString(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasLiveLabel() => $_has(29);
  @$pb.TagNumber(30)
  void clearLiveLabel() => clearField(30);

  @$pb.TagNumber(31)
  $core.String get jumpPath => $_getSZ(30);
  @$pb.TagNumber(31)
  set jumpPath($core.String v) {
    $_setString(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasJumpPath() => $_has(30);
  @$pb.TagNumber(31)
  void clearJumpPath() => clearField(31);

  @$pb.TagNumber(32)
  $core.String get inUseDesc => $_getSZ(31);
  @$pb.TagNumber(32)
  set inUseDesc($core.String v) {
    $_setString(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasInUseDesc() => $_has(31);
  @$pb.TagNumber(32)
  void clearInUseDesc() => clearField(32);
}

class UnionGiftColorConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionGiftColorConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bgColors',
        protoName: 'bgColors')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'textColor',
        protoName: 'textColor')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'itemBgColor',
        protoName: 'itemBgColor')
    ..hasRequiredFields = false;

  UnionGiftColorConfig._() : super();
  factory UnionGiftColorConfig({
    $core.String? bgColors,
    $core.String? textColor,
    $core.String? itemBgColor,
  }) {
    final _result = create();
    if (bgColors != null) {
      _result.bgColors = bgColors;
    }
    if (textColor != null) {
      _result.textColor = textColor;
    }
    if (itemBgColor != null) {
      _result.itemBgColor = itemBgColor;
    }
    return _result;
  }
  factory UnionGiftColorConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionGiftColorConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionGiftColorConfig clone() =>
      UnionGiftColorConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionGiftColorConfig copyWith(void Function(UnionGiftColorConfig) updates) =>
      super.copyWith((message) => updates(message as UnionGiftColorConfig))
          as UnionGiftColorConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionGiftColorConfig create() => UnionGiftColorConfig._();
  UnionGiftColorConfig createEmptyInstance() => create();
  static $pb.PbList<UnionGiftColorConfig> createRepeated() =>
      $pb.PbList<UnionGiftColorConfig>();
  @$core.pragma('dart2js:noInline')
  static UnionGiftColorConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionGiftColorConfig>(create);
  static UnionGiftColorConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bgColors => $_getSZ(0);
  @$pb.TagNumber(1)
  set bgColors($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBgColors() => $_has(0);
  @$pb.TagNumber(1)
  void clearBgColors() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get textColor => $_getSZ(1);
  @$pb.TagNumber(2)
  set textColor($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTextColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearTextColor() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get itemBgColor => $_getSZ(2);
  @$pb.TagNumber(3)
  set itemBgColor($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasItemBgColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearItemBgColor() => clearField(3);
}

class UnionCommodityGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionCommodityGift',
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
            : 'groupId',
        $pb.PbFieldType.OU3,
        protoName: 'groupId')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subType',
        protoName: 'subType')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cNum',
        $pb.PbFieldType.OU3,
        protoName: 'cNum')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubbleDesc',
        protoName: 'bubbleDesc')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'avatar')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubbleFontColor',
        protoName: 'bubbleFontColor')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageBg',
        protoName: 'imageBg')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'period')
    ..hasRequiredFields = false;

  UnionCommodityGift._() : super();
  factory UnionCommodityGift({
    $core.int? id,
    $core.int? cid,
    $core.String? ctype,
    $core.int? groupId,
    $core.String? subType,
    $core.int? cNum,
    $core.String? image,
    $core.String? name,
    $core.String? type,
    $core.String? bubbleDesc,
    $core.String? avatar,
    $core.String? bubbleFontColor,
    $core.String? desc,
    $core.String? imageBg,
    $core.int? price,
    $core.String? period,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (ctype != null) {
      _result.ctype = ctype;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (subType != null) {
      _result.subType = subType;
    }
    if (cNum != null) {
      _result.cNum = cNum;
    }
    if (image != null) {
      _result.image = image;
    }
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    if (bubbleDesc != null) {
      _result.bubbleDesc = bubbleDesc;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    if (bubbleFontColor != null) {
      _result.bubbleFontColor = bubbleFontColor;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (imageBg != null) {
      _result.imageBg = imageBg;
    }
    if (price != null) {
      _result.price = price;
    }
    if (period != null) {
      _result.period = period;
    }
    return _result;
  }
  factory UnionCommodityGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionCommodityGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionCommodityGift clone() => UnionCommodityGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionCommodityGift copyWith(void Function(UnionCommodityGift) updates) =>
      super.copyWith((message) => updates(message as UnionCommodityGift))
          as UnionCommodityGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionCommodityGift create() => UnionCommodityGift._();
  UnionCommodityGift createEmptyInstance() => create();
  static $pb.PbList<UnionCommodityGift> createRepeated() =>
      $pb.PbList<UnionCommodityGift>();
  @$core.pragma('dart2js:noInline')
  static UnionCommodityGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionCommodityGift>(create);
  static UnionCommodityGift? _defaultInstance;

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
  $core.int get groupId => $_getIZ(3);
  @$pb.TagNumber(4)
  set groupId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGroupId() => $_has(3);
  @$pb.TagNumber(4)
  void clearGroupId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get subType => $_getSZ(4);
  @$pb.TagNumber(5)
  set subType($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSubType() => $_has(4);
  @$pb.TagNumber(5)
  void clearSubType() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get cNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set cNum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearCNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get image => $_getSZ(6);
  @$pb.TagNumber(7)
  set image($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasImage() => $_has(6);
  @$pb.TagNumber(7)
  void clearImage() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get name => $_getSZ(7);
  @$pb.TagNumber(8)
  set name($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasName() => $_has(7);
  @$pb.TagNumber(8)
  void clearName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get type => $_getSZ(8);
  @$pb.TagNumber(9)
  set type($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasType() => $_has(8);
  @$pb.TagNumber(9)
  void clearType() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get bubbleDesc => $_getSZ(9);
  @$pb.TagNumber(10)
  set bubbleDesc($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasBubbleDesc() => $_has(9);
  @$pb.TagNumber(10)
  void clearBubbleDesc() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get avatar => $_getSZ(10);
  @$pb.TagNumber(11)
  set avatar($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasAvatar() => $_has(10);
  @$pb.TagNumber(11)
  void clearAvatar() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get bubbleFontColor => $_getSZ(11);
  @$pb.TagNumber(12)
  set bubbleFontColor($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasBubbleFontColor() => $_has(11);
  @$pb.TagNumber(12)
  void clearBubbleFontColor() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get desc => $_getSZ(12);
  @$pb.TagNumber(13)
  set desc($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasDesc() => $_has(12);
  @$pb.TagNumber(13)
  void clearDesc() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get imageBg => $_getSZ(13);
  @$pb.TagNumber(14)
  set imageBg($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasImageBg() => $_has(13);
  @$pb.TagNumber(14)
  void clearImageBg() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get price => $_getIZ(14);
  @$pb.TagNumber(15)
  set price($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasPrice() => $_has(14);
  @$pb.TagNumber(15)
  void clearPrice() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get period => $_getSZ(15);
  @$pb.TagNumber(16)
  set period($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasPeriod() => $_has(15);
  @$pb.TagNumber(16)
  void clearPeriod() => clearField(16);
}

class UnionExchangeBoxResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionExchangeBoxResp',
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
    ..pc<UnionCommodityGift>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: UnionCommodityGift.create)
    ..hasRequiredFields = false;

  UnionExchangeBoxResp._() : super();
  factory UnionExchangeBoxResp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<UnionCommodityGift>? data,
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
  factory UnionExchangeBoxResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionExchangeBoxResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionExchangeBoxResp clone() =>
      UnionExchangeBoxResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionExchangeBoxResp copyWith(void Function(UnionExchangeBoxResp) updates) =>
      super.copyWith((message) => updates(message as UnionExchangeBoxResp))
          as UnionExchangeBoxResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionExchangeBoxResp create() => UnionExchangeBoxResp._();
  UnionExchangeBoxResp createEmptyInstance() => create();
  static $pb.PbList<UnionExchangeBoxResp> createRepeated() =>
      $pb.PbList<UnionExchangeBoxResp>();
  @$core.pragma('dart2js:noInline')
  static UnionExchangeBoxResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionExchangeBoxResp>(create);
  static UnionExchangeBoxResp? _defaultInstance;

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
  $core.List<UnionCommodityGift> get data => $_getList(2);
}

class UnionRankListResp_UnionRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionRankListResp.UnionRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'next',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'page',
        $pb.PbFieldType.OU3)
    ..pc<UnionRankListResp_UnionRankInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: UnionRankListResp_UnionRankInfo.create)
    ..hasRequiredFields = false;

  UnionRankListResp_UnionRankData._() : super();
  factory UnionRankListResp_UnionRankData({
    $core.int? next,
    $core.int? page,
    $core.Iterable<UnionRankListResp_UnionRankInfo>? list,
  }) {
    final _result = create();
    if (next != null) {
      _result.next = next;
    }
    if (page != null) {
      _result.page = page;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory UnionRankListResp_UnionRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionRankListResp_UnionRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionRankListResp_UnionRankData clone() =>
      UnionRankListResp_UnionRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionRankListResp_UnionRankData copyWith(
          void Function(UnionRankListResp_UnionRankData) updates) =>
      super.copyWith(
              (message) => updates(message as UnionRankListResp_UnionRankData))
          as UnionRankListResp_UnionRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionRankListResp_UnionRankData create() =>
      UnionRankListResp_UnionRankData._();
  UnionRankListResp_UnionRankData createEmptyInstance() => create();
  static $pb.PbList<UnionRankListResp_UnionRankData> createRepeated() =>
      $pb.PbList<UnionRankListResp_UnionRankData>();
  @$core.pragma('dart2js:noInline')
  static UnionRankListResp_UnionRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionRankListResp_UnionRankData>(
          create);
  static UnionRankListResp_UnionRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get next => $_getIZ(0);
  @$pb.TagNumber(1)
  set next($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNext() => $_has(0);
  @$pb.TagNumber(1)
  void clearNext() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get page => $_getIZ(1);
  @$pb.TagNumber(2)
  set page($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<UnionRankListResp_UnionRankInfo> get list => $_getList(2);
}

class UnionRankListResp_UnionRankInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionRankListResp.UnionRankInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankNum',
        $pb.PbFieldType.OU3,
        protoName: 'rankNum')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logo')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
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
            : 'activeNum',
        $pb.PbFieldType.OU3,
        protoName: 'activeNum')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userNum',
        $pb.PbFieldType.OU3,
        protoName: 'userNum')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxUserNum',
        $pb.PbFieldType.OU3,
        protoName: 'maxUserNum')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'headerPic',
        protoName: 'headerPic')
    ..hasRequiredFields = false;

  UnionRankListResp_UnionRankInfo._() : super();
  factory UnionRankListResp_UnionRankInfo({
    $core.int? unid,
    $core.int? rankNum,
    $core.String? logo,
    $core.String? name,
    $core.int? level,
    $core.int? activeNum,
    $core.int? userNum,
    $core.int? maxUserNum,
    $core.String? headerPic,
  }) {
    final _result = create();
    if (unid != null) {
      _result.unid = unid;
    }
    if (rankNum != null) {
      _result.rankNum = rankNum;
    }
    if (logo != null) {
      _result.logo = logo;
    }
    if (name != null) {
      _result.name = name;
    }
    if (level != null) {
      _result.level = level;
    }
    if (activeNum != null) {
      _result.activeNum = activeNum;
    }
    if (userNum != null) {
      _result.userNum = userNum;
    }
    if (maxUserNum != null) {
      _result.maxUserNum = maxUserNum;
    }
    if (headerPic != null) {
      _result.headerPic = headerPic;
    }
    return _result;
  }
  factory UnionRankListResp_UnionRankInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionRankListResp_UnionRankInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionRankListResp_UnionRankInfo clone() =>
      UnionRankListResp_UnionRankInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionRankListResp_UnionRankInfo copyWith(
          void Function(UnionRankListResp_UnionRankInfo) updates) =>
      super.copyWith(
              (message) => updates(message as UnionRankListResp_UnionRankInfo))
          as UnionRankListResp_UnionRankInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionRankListResp_UnionRankInfo create() =>
      UnionRankListResp_UnionRankInfo._();
  UnionRankListResp_UnionRankInfo createEmptyInstance() => create();
  static $pb.PbList<UnionRankListResp_UnionRankInfo> createRepeated() =>
      $pb.PbList<UnionRankListResp_UnionRankInfo>();
  @$core.pragma('dart2js:noInline')
  static UnionRankListResp_UnionRankInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionRankListResp_UnionRankInfo>(
          create);
  static UnionRankListResp_UnionRankInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get unid => $_getIZ(0);
  @$pb.TagNumber(1)
  set unid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUnid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rankNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set rankNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRankNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearRankNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get logo => $_getSZ(2);
  @$pb.TagNumber(3)
  set logo($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLogo() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogo() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

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
  $core.int get activeNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set activeNum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasActiveNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearActiveNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get userNum => $_getIZ(6);
  @$pb.TagNumber(7)
  set userNum($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUserNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserNum() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get maxUserNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set maxUserNum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMaxUserNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaxUserNum() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get headerPic => $_getSZ(8);
  @$pb.TagNumber(9)
  set headerPic($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasHeaderPic() => $_has(8);
  @$pb.TagNumber(9)
  void clearHeaderPic() => clearField(9);
}

class UnionRankListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionRankListResp',
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
    ..aOM<UnionRankListResp_UnionRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: UnionRankListResp_UnionRankData.create)
    ..hasRequiredFields = false;

  UnionRankListResp._() : super();
  factory UnionRankListResp({
    $core.bool? success,
    $core.String? msg,
    UnionRankListResp_UnionRankData? data,
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
  factory UnionRankListResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionRankListResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionRankListResp clone() => UnionRankListResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionRankListResp copyWith(void Function(UnionRankListResp) updates) =>
      super.copyWith((message) => updates(message as UnionRankListResp))
          as UnionRankListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionRankListResp create() => UnionRankListResp._();
  UnionRankListResp createEmptyInstance() => create();
  static $pb.PbList<UnionRankListResp> createRepeated() =>
      $pb.PbList<UnionRankListResp>();
  @$core.pragma('dart2js:noInline')
  static UnionRankListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionRankListResp>(create);
  static UnionRankListResp? _defaultInstance;

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
  UnionRankListResp_UnionRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(UnionRankListResp_UnionRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  UnionRankListResp_UnionRankData ensureData() => $_ensure(2);
}

class UnionBoxListResp_List extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionBoxListResp.List',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poolId',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'moneyType')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOM<UnionGiftColorConfig>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'colorConfig',
        subBuilder: UnionGiftColorConfig.create)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boxType',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..pc<UnionCommodityGift>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gifts',
        $pb.PbFieldType.PM,
        subBuilder: UnionCommodityGift.create)
    ..hasRequiredFields = false;

  UnionBoxListResp_List._() : super();
  factory UnionBoxListResp_List({
    $core.String? name,
    $core.int? price,
    $core.int? poolId,
    $core.String? moneyType,
    $core.String? image,
    UnionGiftColorConfig? colorConfig,
    $core.int? boxType,
    $core.String? desc,
    $core.Iterable<UnionCommodityGift>? gifts,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (price != null) {
      _result.price = price;
    }
    if (poolId != null) {
      _result.poolId = poolId;
    }
    if (moneyType != null) {
      _result.moneyType = moneyType;
    }
    if (image != null) {
      _result.image = image;
    }
    if (colorConfig != null) {
      _result.colorConfig = colorConfig;
    }
    if (boxType != null) {
      _result.boxType = boxType;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (gifts != null) {
      _result.gifts.addAll(gifts);
    }
    return _result;
  }
  factory UnionBoxListResp_List.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionBoxListResp_List.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionBoxListResp_List clone() =>
      UnionBoxListResp_List()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionBoxListResp_List copyWith(
          void Function(UnionBoxListResp_List) updates) =>
      super.copyWith((message) => updates(message as UnionBoxListResp_List))
          as UnionBoxListResp_List; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionBoxListResp_List create() => UnionBoxListResp_List._();
  UnionBoxListResp_List createEmptyInstance() => create();
  static $pb.PbList<UnionBoxListResp_List> createRepeated() =>
      $pb.PbList<UnionBoxListResp_List>();
  @$core.pragma('dart2js:noInline')
  static UnionBoxListResp_List getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionBoxListResp_List>(create);
  static UnionBoxListResp_List? _defaultInstance;

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
  $core.int get price => $_getIZ(1);
  @$pb.TagNumber(2)
  set price($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get poolId => $_getIZ(2);
  @$pb.TagNumber(3)
  set poolId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPoolId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPoolId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get moneyType => $_getSZ(3);
  @$pb.TagNumber(4)
  set moneyType($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMoneyType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMoneyType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get image => $_getSZ(4);
  @$pb.TagNumber(5)
  set image($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearImage() => clearField(5);

  @$pb.TagNumber(6)
  UnionGiftColorConfig get colorConfig => $_getN(5);
  @$pb.TagNumber(6)
  set colorConfig(UnionGiftColorConfig v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasColorConfig() => $_has(5);
  @$pb.TagNumber(6)
  void clearColorConfig() => clearField(6);
  @$pb.TagNumber(6)
  UnionGiftColorConfig ensureColorConfig() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get boxType => $_getIZ(6);
  @$pb.TagNumber(7)
  set boxType($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBoxType() => $_has(6);
  @$pb.TagNumber(7)
  void clearBoxType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get desc => $_getSZ(7);
  @$pb.TagNumber(8)
  set desc($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDesc() => $_has(7);
  @$pb.TagNumber(8)
  void clearDesc() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<UnionCommodityGift> get gifts => $_getList(8);
}

class UnionBoxListResp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionBoxListResp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goldNum',
        protoName: 'goldNum')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'silverNum',
        protoName: 'silverNum')
    ..pc<UnionBoxListResp_List>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: UnionBoxListResp_List.create)
    ..hasRequiredFields = false;

  UnionBoxListResp_Data._() : super();
  factory UnionBoxListResp_Data({
    $core.String? goldNum,
    $core.String? silverNum,
    $core.Iterable<UnionBoxListResp_List>? list,
  }) {
    final _result = create();
    if (goldNum != null) {
      _result.goldNum = goldNum;
    }
    if (silverNum != null) {
      _result.silverNum = silverNum;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory UnionBoxListResp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionBoxListResp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionBoxListResp_Data clone() =>
      UnionBoxListResp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionBoxListResp_Data copyWith(
          void Function(UnionBoxListResp_Data) updates) =>
      super.copyWith((message) => updates(message as UnionBoxListResp_Data))
          as UnionBoxListResp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionBoxListResp_Data create() => UnionBoxListResp_Data._();
  UnionBoxListResp_Data createEmptyInstance() => create();
  static $pb.PbList<UnionBoxListResp_Data> createRepeated() =>
      $pb.PbList<UnionBoxListResp_Data>();
  @$core.pragma('dart2js:noInline')
  static UnionBoxListResp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionBoxListResp_Data>(create);
  static UnionBoxListResp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get goldNum => $_getSZ(0);
  @$pb.TagNumber(1)
  set goldNum($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGoldNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearGoldNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get silverNum => $_getSZ(1);
  @$pb.TagNumber(2)
  set silverNum($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSilverNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearSilverNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<UnionBoxListResp_List> get list => $_getList(2);
}

class UnionBoxListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionBoxListResp',
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
    ..aOM<UnionBoxListResp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: UnionBoxListResp_Data.create)
    ..hasRequiredFields = false;

  UnionBoxListResp._() : super();
  factory UnionBoxListResp({
    $core.bool? success,
    $core.String? msg,
    UnionBoxListResp_Data? data,
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
  factory UnionBoxListResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionBoxListResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionBoxListResp clone() => UnionBoxListResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionBoxListResp copyWith(void Function(UnionBoxListResp) updates) =>
      super.copyWith((message) => updates(message as UnionBoxListResp))
          as UnionBoxListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionBoxListResp create() => UnionBoxListResp._();
  UnionBoxListResp createEmptyInstance() => create();
  static $pb.PbList<UnionBoxListResp> createRepeated() =>
      $pb.PbList<UnionBoxListResp>();
  @$core.pragma('dart2js:noInline')
  static UnionBoxListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionBoxListResp>(create);
  static UnionBoxListResp? _defaultInstance;

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
  UnionBoxListResp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(UnionBoxListResp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  UnionBoxListResp_Data ensureData() => $_ensure(2);
}

class UnionUsersResp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionUsersResp.Data',
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
            : 'appId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'silverNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activeNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekActiveNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'joinTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'updateTime',
        $pb.PbFieldType.OU3)
    ..a<$core.double>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goldNum',
        $pb.PbFieldType.OF)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastWeekActiveNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userName')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
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
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleName')
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  UnionUsersResp_Data._() : super();
  factory UnionUsersResp_Data({
    $core.int? id,
    $core.int? appId,
    $core.int? unId,
    $core.int? uid,
    $core.int? title,
    $core.int? state,
    $core.int? silverNum,
    $core.int? activeNum,
    $core.int? weekActiveNum,
    $core.int? weekTime,
    $core.int? joinTime,
    $core.int? createTime,
    $core.int? updateTime,
    $core.double? goldNum,
    $core.int? lastWeekActiveNum,
    $core.String? userName,
    $core.String? userIcon,
    $core.int? onlineStatus,
    $core.int? onlineDateline,
    $core.String? titleName,
    $core.int? titleNum,
    $core.int? rid,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (unId != null) {
      _result.unId = unId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (title != null) {
      _result.title = title;
    }
    if (state != null) {
      _result.state = state;
    }
    if (silverNum != null) {
      _result.silverNum = silverNum;
    }
    if (activeNum != null) {
      _result.activeNum = activeNum;
    }
    if (weekActiveNum != null) {
      _result.weekActiveNum = weekActiveNum;
    }
    if (weekTime != null) {
      _result.weekTime = weekTime;
    }
    if (joinTime != null) {
      _result.joinTime = joinTime;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    if (goldNum != null) {
      _result.goldNum = goldNum;
    }
    if (lastWeekActiveNum != null) {
      _result.lastWeekActiveNum = lastWeekActiveNum;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (titleName != null) {
      _result.titleName = titleName;
    }
    if (titleNum != null) {
      _result.titleNum = titleNum;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    return _result;
  }
  factory UnionUsersResp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionUsersResp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionUsersResp_Data clone() => UnionUsersResp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionUsersResp_Data copyWith(void Function(UnionUsersResp_Data) updates) =>
      super.copyWith((message) => updates(message as UnionUsersResp_Data))
          as UnionUsersResp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionUsersResp_Data create() => UnionUsersResp_Data._();
  UnionUsersResp_Data createEmptyInstance() => create();
  static $pb.PbList<UnionUsersResp_Data> createRepeated() =>
      $pb.PbList<UnionUsersResp_Data>();
  @$core.pragma('dart2js:noInline')
  static UnionUsersResp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionUsersResp_Data>(create);
  static UnionUsersResp_Data? _defaultInstance;

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
  $core.int get appId => $_getIZ(1);
  @$pb.TagNumber(2)
  set appId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAppId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAppId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get unId => $_getIZ(2);
  @$pb.TagNumber(3)
  set unId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUnId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get uid => $_getIZ(3);
  @$pb.TagNumber(4)
  set uid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get title => $_getIZ(4);
  @$pb.TagNumber(5)
  set title($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get state => $_getIZ(5);
  @$pb.TagNumber(6)
  set state($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get silverNum => $_getIZ(6);
  @$pb.TagNumber(7)
  set silverNum($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSilverNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearSilverNum() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get activeNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set activeNum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasActiveNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearActiveNum() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get weekActiveNum => $_getIZ(8);
  @$pb.TagNumber(9)
  set weekActiveNum($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasWeekActiveNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearWeekActiveNum() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get weekTime => $_getIZ(9);
  @$pb.TagNumber(10)
  set weekTime($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasWeekTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearWeekTime() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get joinTime => $_getIZ(10);
  @$pb.TagNumber(11)
  set joinTime($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasJoinTime() => $_has(10);
  @$pb.TagNumber(11)
  void clearJoinTime() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get createTime => $_getIZ(11);
  @$pb.TagNumber(12)
  set createTime($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasCreateTime() => $_has(11);
  @$pb.TagNumber(12)
  void clearCreateTime() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get updateTime => $_getIZ(12);
  @$pb.TagNumber(13)
  set updateTime($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasUpdateTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearUpdateTime() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get goldNum => $_getN(13);
  @$pb.TagNumber(14)
  set goldNum($core.double v) {
    $_setFloat(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasGoldNum() => $_has(13);
  @$pb.TagNumber(14)
  void clearGoldNum() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get lastWeekActiveNum => $_getIZ(14);
  @$pb.TagNumber(15)
  set lastWeekActiveNum($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasLastWeekActiveNum() => $_has(14);
  @$pb.TagNumber(15)
  void clearLastWeekActiveNum() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get userName => $_getSZ(15);
  @$pb.TagNumber(16)
  set userName($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasUserName() => $_has(15);
  @$pb.TagNumber(16)
  void clearUserName() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get userIcon => $_getSZ(16);
  @$pb.TagNumber(17)
  set userIcon($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasUserIcon() => $_has(16);
  @$pb.TagNumber(17)
  void clearUserIcon() => clearField(17);

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
  $core.String get titleName => $_getSZ(19);
  @$pb.TagNumber(20)
  set titleName($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasTitleName() => $_has(19);
  @$pb.TagNumber(20)
  void clearTitleName() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get titleNum => $_getIZ(20);
  @$pb.TagNumber(21)
  set titleNum($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasTitleNum() => $_has(20);
  @$pb.TagNumber(21)
  void clearTitleNum() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get rid => $_getIZ(21);
  @$pb.TagNumber(22)
  set rid($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasRid() => $_has(21);
  @$pb.TagNumber(22)
  void clearRid() => clearField(22);
}

class UnionUsersResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionUsersResp',
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
    ..a<$core.double>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unionGold',
        $pb.PbFieldType.OF)
    ..pc<UnionUsersResp_Data>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: UnionUsersResp_Data.create)
    ..hasRequiredFields = false;

  UnionUsersResp._() : super();
  factory UnionUsersResp({
    $core.bool? success,
    $core.String? msg,
    $core.double? unionGold,
    $core.Iterable<UnionUsersResp_Data>? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (unionGold != null) {
      _result.unionGold = unionGold;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory UnionUsersResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionUsersResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionUsersResp clone() => UnionUsersResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionUsersResp copyWith(void Function(UnionUsersResp) updates) =>
      super.copyWith((message) => updates(message as UnionUsersResp))
          as UnionUsersResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionUsersResp create() => UnionUsersResp._();
  UnionUsersResp createEmptyInstance() => create();
  static $pb.PbList<UnionUsersResp> createRepeated() =>
      $pb.PbList<UnionUsersResp>();
  @$core.pragma('dart2js:noInline')
  static UnionUsersResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionUsersResp>(create);
  static UnionUsersResp? _defaultInstance;

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
  $core.double get unionGold => $_getN(2);
  @$pb.TagNumber(3)
  set unionGold($core.double v) {
    $_setFloat(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUnionGold() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnionGold() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<UnionUsersResp_Data> get data => $_getList(3);
}

class AccountDetailResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccountDetailResp',
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
    ..pc<AccountDetailData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: AccountDetailData.create)
    ..hasRequiredFields = false;

  AccountDetailResp._() : super();
  factory AccountDetailResp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<AccountDetailData>? data,
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
  factory AccountDetailResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountDetailResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountDetailResp clone() => AccountDetailResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountDetailResp copyWith(void Function(AccountDetailResp) updates) =>
      super.copyWith((message) => updates(message as AccountDetailResp))
          as AccountDetailResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountDetailResp create() => AccountDetailResp._();
  AccountDetailResp createEmptyInstance() => create();
  static $pb.PbList<AccountDetailResp> createRepeated() =>
      $pb.PbList<AccountDetailResp>();
  @$core.pragma('dart2js:noInline')
  static AccountDetailResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountDetailResp>(create);
  static AccountDetailResp? _defaultInstance;

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
  $core.List<AccountDetailData> get data => $_getList(2);
}

class AccountDetailData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccountDetailData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.double>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'changeNum',
        $pb.PbFieldType.OF)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'op',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subject')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createTime',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'changeNumStr')
    ..hasRequiredFields = false;

  AccountDetailData._() : super();
  factory AccountDetailData({
    $core.double? changeNum,
    $core.int? op,
    $core.String? subject,
    $core.int? createTime,
    $core.String? changeNumStr,
  }) {
    final _result = create();
    if (changeNum != null) {
      _result.changeNum = changeNum;
    }
    if (op != null) {
      _result.op = op;
    }
    if (subject != null) {
      _result.subject = subject;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (changeNumStr != null) {
      _result.changeNumStr = changeNumStr;
    }
    return _result;
  }
  factory AccountDetailData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountDetailData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountDetailData clone() => AccountDetailData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountDetailData copyWith(void Function(AccountDetailData) updates) =>
      super.copyWith((message) => updates(message as AccountDetailData))
          as AccountDetailData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountDetailData create() => AccountDetailData._();
  AccountDetailData createEmptyInstance() => create();
  static $pb.PbList<AccountDetailData> createRepeated() =>
      $pb.PbList<AccountDetailData>();
  @$core.pragma('dart2js:noInline')
  static AccountDetailData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountDetailData>(create);
  static AccountDetailData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get changeNum => $_getN(0);
  @$pb.TagNumber(1)
  set changeNum($core.double v) {
    $_setFloat(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasChangeNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearChangeNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get op => $_getIZ(1);
  @$pb.TagNumber(2)
  set op($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOp() => $_has(1);
  @$pb.TagNumber(2)
  void clearOp() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get subject => $_getSZ(2);
  @$pb.TagNumber(3)
  set subject($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSubject() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubject() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get createTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set createTime($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCreateTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreateTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get changeNumStr => $_getSZ(4);
  @$pb.TagNumber(5)
  set changeNumStr($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasChangeNumStr() => $_has(4);
  @$pb.TagNumber(5)
  void clearChangeNumStr() => clearField(5);
}

class GetApplyListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetApplyListResp',
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
    ..pc<ApplyListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: ApplyListData.create)
    ..hasRequiredFields = false;

  GetApplyListResp._() : super();
  factory GetApplyListResp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<ApplyListData>? data,
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
  factory GetApplyListResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetApplyListResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetApplyListResp clone() => GetApplyListResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetApplyListResp copyWith(void Function(GetApplyListResp) updates) =>
      super.copyWith((message) => updates(message as GetApplyListResp))
          as GetApplyListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetApplyListResp create() => GetApplyListResp._();
  GetApplyListResp createEmptyInstance() => create();
  static $pb.PbList<GetApplyListResp> createRepeated() =>
      $pb.PbList<GetApplyListResp>();
  @$core.pragma('dart2js:noInline')
  static GetApplyListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetApplyListResp>(create);
  static GetApplyListResp? _defaultInstance;

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
  $core.List<ApplyListData> get data => $_getList(2);
}

class ApplyListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApplyListData',
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
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'applyTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkTime',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'applyNote')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkNote')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userName')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userIcon')
    ..hasRequiredFields = false;

  ApplyListData._() : super();
  factory ApplyListData({
    $core.int? id,
    $core.int? uid,
    $core.int? unId,
    $core.int? state,
    $core.int? applyTime,
    $core.int? checkTime,
    $core.String? applyNote,
    $core.String? checkNote,
    $core.String? userName,
    $core.String? userIcon,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (unId != null) {
      _result.unId = unId;
    }
    if (state != null) {
      _result.state = state;
    }
    if (applyTime != null) {
      _result.applyTime = applyTime;
    }
    if (checkTime != null) {
      _result.checkTime = checkTime;
    }
    if (applyNote != null) {
      _result.applyNote = applyNote;
    }
    if (checkNote != null) {
      _result.checkNote = checkNote;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (userIcon != null) {
      _result.userIcon = userIcon;
    }
    return _result;
  }
  factory ApplyListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApplyListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApplyListData clone() => ApplyListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApplyListData copyWith(void Function(ApplyListData) updates) =>
      super.copyWith((message) => updates(message as ApplyListData))
          as ApplyListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApplyListData create() => ApplyListData._();
  ApplyListData createEmptyInstance() => create();
  static $pb.PbList<ApplyListData> createRepeated() =>
      $pb.PbList<ApplyListData>();
  @$core.pragma('dart2js:noInline')
  static ApplyListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApplyListData>(create);
  static ApplyListData? _defaultInstance;

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
  $core.int get unId => $_getIZ(2);
  @$pb.TagNumber(3)
  set unId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUnId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnId() => clearField(3);

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
  $core.int get applyTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set applyTime($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasApplyTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearApplyTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get checkTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set checkTime($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCheckTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCheckTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get applyNote => $_getSZ(6);
  @$pb.TagNumber(7)
  set applyNote($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasApplyNote() => $_has(6);
  @$pb.TagNumber(7)
  void clearApplyNote() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get checkNote => $_getSZ(7);
  @$pb.TagNumber(8)
  set checkNote($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCheckNote() => $_has(7);
  @$pb.TagNumber(8)
  void clearCheckNote() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get userName => $_getSZ(8);
  @$pb.TagNumber(9)
  set userName($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasUserName() => $_has(8);
  @$pb.TagNumber(9)
  void clearUserName() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get userIcon => $_getSZ(9);
  @$pb.TagNumber(10)
  set userIcon($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasUserIcon() => $_has(9);
  @$pb.TagNumber(10)
  void clearUserIcon() => clearField(10);
}

class CreateResp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateResp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  CreateResp_Data._() : super();
  factory CreateResp_Data({
    $core.int? unId,
  }) {
    final _result = create();
    if (unId != null) {
      _result.unId = unId;
    }
    return _result;
  }
  factory CreateResp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateResp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateResp_Data clone() => CreateResp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateResp_Data copyWith(void Function(CreateResp_Data) updates) =>
      super.copyWith((message) => updates(message as CreateResp_Data))
          as CreateResp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateResp_Data create() => CreateResp_Data._();
  CreateResp_Data createEmptyInstance() => create();
  static $pb.PbList<CreateResp_Data> createRepeated() =>
      $pb.PbList<CreateResp_Data>();
  @$core.pragma('dart2js:noInline')
  static CreateResp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateResp_Data>(create);
  static CreateResp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get unId => $_getIZ(0);
  @$pb.TagNumber(1)
  set unId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUnId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnId() => clearField(1);
}

class CreateResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateResp',
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
    ..aOM<CreateResp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: CreateResp_Data.create)
    ..hasRequiredFields = false;

  CreateResp._() : super();
  factory CreateResp({
    $core.bool? success,
    $core.String? msg,
    CreateResp_Data? data,
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
  factory CreateResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateResp clone() => CreateResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateResp copyWith(void Function(CreateResp) updates) =>
      super.copyWith((message) => updates(message as CreateResp))
          as CreateResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateResp create() => CreateResp._();
  CreateResp createEmptyInstance() => create();
  static $pb.PbList<CreateResp> createRepeated() => $pb.PbList<CreateResp>();
  @$core.pragma('dart2js:noInline')
  static CreateResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateResp>(create);
  static CreateResp? _defaultInstance;

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
  CreateResp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(CreateResp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  CreateResp_Data ensureData() => $_ensure(2);
}

class JoinUnionResp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JoinUnionResp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unionId',
        $pb.PbFieldType.OU3,
        protoName: 'unionId')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inUnion',
        $pb.PbFieldType.OU3,
        protoName: 'inUnion')
    ..hasRequiredFields = false;

  JoinUnionResp_Data._() : super();
  factory JoinUnionResp_Data({
    $core.int? unionId,
    $core.int? inUnion,
  }) {
    final _result = create();
    if (unionId != null) {
      _result.unionId = unionId;
    }
    if (inUnion != null) {
      _result.inUnion = inUnion;
    }
    return _result;
  }
  factory JoinUnionResp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JoinUnionResp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JoinUnionResp_Data clone() => JoinUnionResp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JoinUnionResp_Data copyWith(void Function(JoinUnionResp_Data) updates) =>
      super.copyWith((message) => updates(message as JoinUnionResp_Data))
          as JoinUnionResp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JoinUnionResp_Data create() => JoinUnionResp_Data._();
  JoinUnionResp_Data createEmptyInstance() => create();
  static $pb.PbList<JoinUnionResp_Data> createRepeated() =>
      $pb.PbList<JoinUnionResp_Data>();
  @$core.pragma('dart2js:noInline')
  static JoinUnionResp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinUnionResp_Data>(create);
  static JoinUnionResp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get unionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set unionId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUnionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get inUnion => $_getIZ(1);
  @$pb.TagNumber(2)
  set inUnion($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasInUnion() => $_has(1);
  @$pb.TagNumber(2)
  void clearInUnion() => clearField(2);
}

class JoinUnionResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JoinUnionResp',
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
    ..aOM<JoinUnionResp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: JoinUnionResp_Data.create)
    ..hasRequiredFields = false;

  JoinUnionResp._() : super();
  factory JoinUnionResp({
    $core.bool? success,
    $core.String? msg,
    JoinUnionResp_Data? data,
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
  factory JoinUnionResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JoinUnionResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JoinUnionResp clone() => JoinUnionResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JoinUnionResp copyWith(void Function(JoinUnionResp) updates) =>
      super.copyWith((message) => updates(message as JoinUnionResp))
          as JoinUnionResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JoinUnionResp create() => JoinUnionResp._();
  JoinUnionResp createEmptyInstance() => create();
  static $pb.PbList<JoinUnionResp> createRepeated() =>
      $pb.PbList<JoinUnionResp>();
  @$core.pragma('dart2js:noInline')
  static JoinUnionResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinUnionResp>(create);
  static JoinUnionResp? _defaultInstance;

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
  JoinUnionResp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(JoinUnionResp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  JoinUnionResp_Data ensureData() => $_ensure(2);
}

class LuckDipIndexResp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LuckDipIndexResp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'luckydipId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'luckDipLevel',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'luckDipDesc')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unionId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dayPrice',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'availableTimes',
        $pb.PbFieldType.OU3)
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasFree')
    ..aOB(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canMaintenance')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'advanceRewardsDesc')
    ..pc<UnionCommodityGift>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'normalRewards',
        $pb.PbFieldType.PM,
        subBuilder: UnionCommodityGift.create)
    ..pc<UnionCommodityGift>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'advanceRewards',
        $pb.PbFieldType.PM,
        subBuilder: UnionCommodityGift.create)
    ..pc<UnionBuyOptions>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'buyOptions',
        $pb.PbFieldType.PM,
        subBuilder: UnionBuyOptions.create)
    ..aOB(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'repairStatus')
    ..aOB(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'needRepairFee')
    ..hasRequiredFields = false;

  LuckDipIndexResp_Data._() : super();
  factory LuckDipIndexResp_Data({
    $core.int? luckydipId,
    $core.int? luckDipLevel,
    $core.String? luckDipDesc,
    $core.int? unionId,
    $core.int? dayPrice,
    $core.int? availableTimes,
    $core.bool? hasFree,
    $core.bool? canMaintenance,
    $core.String? advanceRewardsDesc,
    $core.Iterable<UnionCommodityGift>? normalRewards,
    $core.Iterable<UnionCommodityGift>? advanceRewards,
    $core.Iterable<UnionBuyOptions>? buyOptions,
    $core.bool? repairStatus,
    $core.bool? needRepairFee,
  }) {
    final _result = create();
    if (luckydipId != null) {
      _result.luckydipId = luckydipId;
    }
    if (luckDipLevel != null) {
      _result.luckDipLevel = luckDipLevel;
    }
    if (luckDipDesc != null) {
      _result.luckDipDesc = luckDipDesc;
    }
    if (unionId != null) {
      _result.unionId = unionId;
    }
    if (dayPrice != null) {
      _result.dayPrice = dayPrice;
    }
    if (availableTimes != null) {
      _result.availableTimes = availableTimes;
    }
    if (hasFree != null) {
      _result.hasFree = hasFree;
    }
    if (canMaintenance != null) {
      _result.canMaintenance = canMaintenance;
    }
    if (advanceRewardsDesc != null) {
      _result.advanceRewardsDesc = advanceRewardsDesc;
    }
    if (normalRewards != null) {
      _result.normalRewards.addAll(normalRewards);
    }
    if (advanceRewards != null) {
      _result.advanceRewards.addAll(advanceRewards);
    }
    if (buyOptions != null) {
      _result.buyOptions.addAll(buyOptions);
    }
    if (repairStatus != null) {
      _result.repairStatus = repairStatus;
    }
    if (needRepairFee != null) {
      _result.needRepairFee = needRepairFee;
    }
    return _result;
  }
  factory LuckDipIndexResp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LuckDipIndexResp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LuckDipIndexResp_Data clone() =>
      LuckDipIndexResp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LuckDipIndexResp_Data copyWith(
          void Function(LuckDipIndexResp_Data) updates) =>
      super.copyWith((message) => updates(message as LuckDipIndexResp_Data))
          as LuckDipIndexResp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LuckDipIndexResp_Data create() => LuckDipIndexResp_Data._();
  LuckDipIndexResp_Data createEmptyInstance() => create();
  static $pb.PbList<LuckDipIndexResp_Data> createRepeated() =>
      $pb.PbList<LuckDipIndexResp_Data>();
  @$core.pragma('dart2js:noInline')
  static LuckDipIndexResp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LuckDipIndexResp_Data>(create);
  static LuckDipIndexResp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get luckydipId => $_getIZ(0);
  @$pb.TagNumber(1)
  set luckydipId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLuckydipId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLuckydipId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get luckDipLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set luckDipLevel($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLuckDipLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLuckDipLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get luckDipDesc => $_getSZ(2);
  @$pb.TagNumber(3)
  set luckDipDesc($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLuckDipDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearLuckDipDesc() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get unionId => $_getIZ(3);
  @$pb.TagNumber(4)
  set unionId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUnionId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnionId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get dayPrice => $_getIZ(4);
  @$pb.TagNumber(5)
  set dayPrice($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDayPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearDayPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get availableTimes => $_getIZ(5);
  @$pb.TagNumber(6)
  set availableTimes($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAvailableTimes() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvailableTimes() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get hasFree => $_getBF(6);
  @$pb.TagNumber(7)
  set hasFree($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasHasFree() => $_has(6);
  @$pb.TagNumber(7)
  void clearHasFree() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get canMaintenance => $_getBF(7);
  @$pb.TagNumber(8)
  set canMaintenance($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCanMaintenance() => $_has(7);
  @$pb.TagNumber(8)
  void clearCanMaintenance() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get advanceRewardsDesc => $_getSZ(8);
  @$pb.TagNumber(9)
  set advanceRewardsDesc($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAdvanceRewardsDesc() => $_has(8);
  @$pb.TagNumber(9)
  void clearAdvanceRewardsDesc() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<UnionCommodityGift> get normalRewards => $_getList(9);

  @$pb.TagNumber(11)
  $core.List<UnionCommodityGift> get advanceRewards => $_getList(10);

  @$pb.TagNumber(12)
  $core.List<UnionBuyOptions> get buyOptions => $_getList(11);

  @$pb.TagNumber(13)
  $core.bool get repairStatus => $_getBF(12);
  @$pb.TagNumber(13)
  set repairStatus($core.bool v) {
    $_setBool(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasRepairStatus() => $_has(12);
  @$pb.TagNumber(13)
  void clearRepairStatus() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get needRepairFee => $_getBF(13);
  @$pb.TagNumber(14)
  set needRepairFee($core.bool v) {
    $_setBool(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasNeedRepairFee() => $_has(13);
  @$pb.TagNumber(14)
  void clearNeedRepairFee() => clearField(14);
}

class LuckDipIndexResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LuckDipIndexResp',
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
    ..aOM<LuckDipIndexResp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: LuckDipIndexResp_Data.create)
    ..hasRequiredFields = false;

  LuckDipIndexResp._() : super();
  factory LuckDipIndexResp({
    $core.bool? success,
    $core.String? msg,
    LuckDipIndexResp_Data? data,
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
  factory LuckDipIndexResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LuckDipIndexResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LuckDipIndexResp clone() => LuckDipIndexResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LuckDipIndexResp copyWith(void Function(LuckDipIndexResp) updates) =>
      super.copyWith((message) => updates(message as LuckDipIndexResp))
          as LuckDipIndexResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LuckDipIndexResp create() => LuckDipIndexResp._();
  LuckDipIndexResp createEmptyInstance() => create();
  static $pb.PbList<LuckDipIndexResp> createRepeated() =>
      $pb.PbList<LuckDipIndexResp>();
  @$core.pragma('dart2js:noInline')
  static LuckDipIndexResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LuckDipIndexResp>(create);
  static LuckDipIndexResp? _defaultInstance;

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
  LuckDipIndexResp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(LuckDipIndexResp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  LuckDipIndexResp_Data ensureData() => $_ensure(2);
}

class UnionBuyOptions extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionBuyOptions',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'moneyType')
    ..hasRequiredFields = false;

  UnionBuyOptions._() : super();
  factory UnionBuyOptions({
    $core.String? name,
    $core.int? price,
    $core.int? num,
    $core.String? moneyType,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (price != null) {
      _result.price = price;
    }
    if (num != null) {
      _result.num = num;
    }
    if (moneyType != null) {
      _result.moneyType = moneyType;
    }
    return _result;
  }
  factory UnionBuyOptions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionBuyOptions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionBuyOptions clone() => UnionBuyOptions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionBuyOptions copyWith(void Function(UnionBuyOptions) updates) =>
      super.copyWith((message) => updates(message as UnionBuyOptions))
          as UnionBuyOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionBuyOptions create() => UnionBuyOptions._();
  UnionBuyOptions createEmptyInstance() => create();
  static $pb.PbList<UnionBuyOptions> createRepeated() =>
      $pb.PbList<UnionBuyOptions>();
  @$core.pragma('dart2js:noInline')
  static UnionBuyOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionBuyOptions>(create);
  static UnionBuyOptions? _defaultInstance;

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
  $core.int get price => $_getIZ(1);
  @$pb.TagNumber(2)
  set price($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

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
  $core.String get moneyType => $_getSZ(3);
  @$pb.TagNumber(4)
  set moneyType($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMoneyType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMoneyType() => clearField(4);
}

class LuckDipLotteryResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LuckDipLotteryResp',
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
    ..pc<UnionCommodityGift>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: UnionCommodityGift.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..hasRequiredFields = false;

  LuckDipLotteryResp._() : super();
  factory LuckDipLotteryResp({
    $core.bool? success,
    $core.Iterable<UnionCommodityGift>? data,
    $core.String? msg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory LuckDipLotteryResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LuckDipLotteryResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LuckDipLotteryResp clone() => LuckDipLotteryResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LuckDipLotteryResp copyWith(void Function(LuckDipLotteryResp) updates) =>
      super.copyWith((message) => updates(message as LuckDipLotteryResp))
          as LuckDipLotteryResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LuckDipLotteryResp create() => LuckDipLotteryResp._();
  LuckDipLotteryResp createEmptyInstance() => create();
  static $pb.PbList<LuckDipLotteryResp> createRepeated() =>
      $pb.PbList<LuckDipLotteryResp>();
  @$core.pragma('dart2js:noInline')
  static LuckDipLotteryResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LuckDipLotteryResp>(create);
  static LuckDipLotteryResp? _defaultInstance;

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
  $core.List<UnionCommodityGift> get data => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);
}

class UnionCommonResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UnionCommonResp',
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

  UnionCommonResp._() : super();
  factory UnionCommonResp({
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
  factory UnionCommonResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnionCommonResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnionCommonResp clone() => UnionCommonResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnionCommonResp copyWith(void Function(UnionCommonResp) updates) =>
      super.copyWith((message) => updates(message as UnionCommonResp))
          as UnionCommonResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnionCommonResp create() => UnionCommonResp._();
  UnionCommonResp createEmptyInstance() => create();
  static $pb.PbList<UnionCommonResp> createRepeated() =>
      $pb.PbList<UnionCommonResp>();
  @$core.pragma('dart2js:noInline')
  static UnionCommonResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnionCommonResp>(create);
  static UnionCommonResp? _defaultInstance;

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

class GetAwardResp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetAwardResp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'info')
    ..hasRequiredFields = false;

  GetAwardResp_Data._() : super();
  factory GetAwardResp_Data({
    $core.String? info,
  }) {
    final _result = create();
    if (info != null) {
      _result.info = info;
    }
    return _result;
  }
  factory GetAwardResp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetAwardResp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetAwardResp_Data clone() => GetAwardResp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetAwardResp_Data copyWith(void Function(GetAwardResp_Data) updates) =>
      super.copyWith((message) => updates(message as GetAwardResp_Data))
          as GetAwardResp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAwardResp_Data create() => GetAwardResp_Data._();
  GetAwardResp_Data createEmptyInstance() => create();
  static $pb.PbList<GetAwardResp_Data> createRepeated() =>
      $pb.PbList<GetAwardResp_Data>();
  @$core.pragma('dart2js:noInline')
  static GetAwardResp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAwardResp_Data>(create);
  static GetAwardResp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get info => $_getSZ(0);
  @$pb.TagNumber(1)
  set info($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => clearField(1);
}

class GetAwardResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetAwardResp',
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
    ..aOM<GetAwardResp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GetAwardResp_Data.create)
    ..hasRequiredFields = false;

  GetAwardResp._() : super();
  factory GetAwardResp({
    $core.bool? success,
    $core.String? msg,
    GetAwardResp_Data? data,
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
  factory GetAwardResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetAwardResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetAwardResp clone() => GetAwardResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetAwardResp copyWith(void Function(GetAwardResp) updates) =>
      super.copyWith((message) => updates(message as GetAwardResp))
          as GetAwardResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAwardResp create() => GetAwardResp._();
  GetAwardResp createEmptyInstance() => create();
  static $pb.PbList<GetAwardResp> createRepeated() =>
      $pb.PbList<GetAwardResp>();
  @$core.pragma('dart2js:noInline')
  static GetAwardResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAwardResp>(create);
  static GetAwardResp? _defaultInstance;

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
  GetAwardResp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GetAwardResp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GetAwardResp_Data ensureData() => $_ensure(2);
}
