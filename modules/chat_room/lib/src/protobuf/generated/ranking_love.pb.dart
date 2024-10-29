///
//  Generated code. Do not modify.
//  source: ranking_love.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LoveList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LoveList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
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
            : 'money',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uname')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uicon')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitle',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitleNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uvip',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rname')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'touid',
        $pb.PbFieldType.OU3)
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toname')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toicon')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totitle',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totitleNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tovip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftnum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'upopularity',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topopularity',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  LoveList._() : super();
  factory LoveList({
    $core.int? rid,
    $core.int? uid,
    $core.int? money,
    $core.int? giftid,
    $core.int? dateline,
    $core.String? uname,
    $core.String? uicon,
    $core.int? utitle,
    $core.int? utitleNew,
    $core.int? uvip,
    $core.String? rname,
    $core.int? touid,
    $core.String? toname,
    $core.String? toicon,
    $core.int? totitle,
    $core.int? totitleNew,
    $core.int? tovip,
    $core.int? giftnum,
    $core.int? upopularity,
    $core.int? topopularity,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (money != null) {
      _result.money = money;
    }
    if (giftid != null) {
      _result.giftid = giftid;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (uname != null) {
      _result.uname = uname;
    }
    if (uicon != null) {
      _result.uicon = uicon;
    }
    if (utitle != null) {
      _result.utitle = utitle;
    }
    if (utitleNew != null) {
      _result.utitleNew = utitleNew;
    }
    if (uvip != null) {
      _result.uvip = uvip;
    }
    if (rname != null) {
      _result.rname = rname;
    }
    if (touid != null) {
      _result.touid = touid;
    }
    if (toname != null) {
      _result.toname = toname;
    }
    if (toicon != null) {
      _result.toicon = toicon;
    }
    if (totitle != null) {
      _result.totitle = totitle;
    }
    if (totitleNew != null) {
      _result.totitleNew = totitleNew;
    }
    if (tovip != null) {
      _result.tovip = tovip;
    }
    if (giftnum != null) {
      _result.giftnum = giftnum;
    }
    if (upopularity != null) {
      _result.upopularity = upopularity;
    }
    if (topopularity != null) {
      _result.topopularity = topopularity;
    }
    return _result;
  }
  factory LoveList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LoveList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LoveList clone() => LoveList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LoveList copyWith(void Function(LoveList) updates) =>
      super.copyWith((message) => updates(message as LoveList))
          as LoveList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoveList create() => LoveList._();
  LoveList createEmptyInstance() => create();
  static $pb.PbList<LoveList> createRepeated() => $pb.PbList<LoveList>();
  @$core.pragma('dart2js:noInline')
  static LoveList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoveList>(create);
  static LoveList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

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
  $core.int get money => $_getIZ(2);
  @$pb.TagNumber(3)
  set money($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMoney() => $_has(2);
  @$pb.TagNumber(3)
  void clearMoney() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get giftid => $_getIZ(3);
  @$pb.TagNumber(4)
  set giftid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftid() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftid() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get dateline => $_getIZ(4);
  @$pb.TagNumber(5)
  set dateline($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDateline() => $_has(4);
  @$pb.TagNumber(5)
  void clearDateline() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get uname => $_getSZ(5);
  @$pb.TagNumber(6)
  set uname($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUname() => $_has(5);
  @$pb.TagNumber(6)
  void clearUname() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get uicon => $_getSZ(6);
  @$pb.TagNumber(7)
  set uicon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUicon() => $_has(6);
  @$pb.TagNumber(7)
  void clearUicon() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get utitle => $_getIZ(7);
  @$pb.TagNumber(8)
  set utitle($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUtitle() => $_has(7);
  @$pb.TagNumber(8)
  void clearUtitle() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get utitleNew => $_getIZ(8);
  @$pb.TagNumber(9)
  set utitleNew($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasUtitleNew() => $_has(8);
  @$pb.TagNumber(9)
  void clearUtitleNew() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get uvip => $_getIZ(9);
  @$pb.TagNumber(10)
  set uvip($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasUvip() => $_has(9);
  @$pb.TagNumber(10)
  void clearUvip() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get rname => $_getSZ(10);
  @$pb.TagNumber(11)
  set rname($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasRname() => $_has(10);
  @$pb.TagNumber(11)
  void clearRname() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get touid => $_getIZ(11);
  @$pb.TagNumber(12)
  set touid($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasTouid() => $_has(11);
  @$pb.TagNumber(12)
  void clearTouid() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get toname => $_getSZ(12);
  @$pb.TagNumber(13)
  set toname($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasToname() => $_has(12);
  @$pb.TagNumber(13)
  void clearToname() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get toicon => $_getSZ(13);
  @$pb.TagNumber(14)
  set toicon($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasToicon() => $_has(13);
  @$pb.TagNumber(14)
  void clearToicon() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get totitle => $_getIZ(14);
  @$pb.TagNumber(15)
  set totitle($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasTotitle() => $_has(14);
  @$pb.TagNumber(15)
  void clearTotitle() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get totitleNew => $_getIZ(15);
  @$pb.TagNumber(16)
  set totitleNew($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasTotitleNew() => $_has(15);
  @$pb.TagNumber(16)
  void clearTotitleNew() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get tovip => $_getIZ(16);
  @$pb.TagNumber(17)
  set tovip($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasTovip() => $_has(16);
  @$pb.TagNumber(17)
  void clearTovip() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get giftnum => $_getIZ(17);
  @$pb.TagNumber(18)
  set giftnum($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasGiftnum() => $_has(17);
  @$pb.TagNumber(18)
  void clearGiftnum() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get upopularity => $_getIZ(18);
  @$pb.TagNumber(19)
  set upopularity($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasUpopularity() => $_has(18);
  @$pb.TagNumber(19)
  void clearUpopularity() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get topopularity => $_getIZ(19);
  @$pb.TagNumber(20)
  set topopularity($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasTopopularity() => $_has(19);
  @$pb.TagNumber(20)
  void clearTopopularity() => clearField(20);
}

class ResRankingLove extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRankingLove',
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
    ..pc<LoveList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: LoveList.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hideRank',
        protoName: 'hideRank')
    ..hasRequiredFields = false;

  ResRankingLove._() : super();
  factory ResRankingLove({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<LoveList>? data,
    $core.bool? hideRank,
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
    if (hideRank != null) {
      _result.hideRank = hideRank;
    }
    return _result;
  }
  factory ResRankingLove.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRankingLove.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRankingLove clone() => ResRankingLove()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRankingLove copyWith(void Function(ResRankingLove) updates) =>
      super.copyWith((message) => updates(message as ResRankingLove))
          as ResRankingLove; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRankingLove create() => ResRankingLove._();
  ResRankingLove createEmptyInstance() => create();
  static $pb.PbList<ResRankingLove> createRepeated() =>
      $pb.PbList<ResRankingLove>();
  @$core.pragma('dart2js:noInline')
  static ResRankingLove getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRankingLove>(create);
  static ResRankingLove? _defaultInstance;

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
  $core.List<LoveList> get data => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get hideRank => $_getBF(3);
  @$pb.TagNumber(4)
  set hideRank($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHideRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearHideRank() => clearField(4);
}
