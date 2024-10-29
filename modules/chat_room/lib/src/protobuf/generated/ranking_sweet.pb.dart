///
//  Generated code. Do not modify.
//  source: ranking_sweet.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SweetList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SweetList',
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
            : 'uname')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uicon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitle',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitleNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uvip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'touid',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toname')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toicon')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totitle',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totitleNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tovip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'upopularity',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topopularity',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SweetList._() : super();
  factory SweetList({
    $core.int? uid,
    $core.String? uname,
    $core.String? uicon,
    $core.int? utitle,
    $core.int? utitleNew,
    $core.int? uvip,
    $core.int? touid,
    $core.String? toname,
    $core.String? toicon,
    $core.int? totitle,
    $core.int? totitleNew,
    $core.int? tovip,
    $core.int? money,
    $core.int? upopularity,
    $core.int? topopularity,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
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
    if (money != null) {
      _result.money = money;
    }
    if (upopularity != null) {
      _result.upopularity = upopularity;
    }
    if (topopularity != null) {
      _result.topopularity = topopularity;
    }
    return _result;
  }
  factory SweetList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SweetList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SweetList clone() => SweetList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SweetList copyWith(void Function(SweetList) updates) =>
      super.copyWith((message) => updates(message as SweetList))
          as SweetList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SweetList create() => SweetList._();
  SweetList createEmptyInstance() => create();
  static $pb.PbList<SweetList> createRepeated() => $pb.PbList<SweetList>();
  @$core.pragma('dart2js:noInline')
  static SweetList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SweetList>(create);
  static SweetList? _defaultInstance;

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
  $core.String get uname => $_getSZ(1);
  @$pb.TagNumber(2)
  set uname($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUname() => $_has(1);
  @$pb.TagNumber(2)
  void clearUname() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get uicon => $_getSZ(2);
  @$pb.TagNumber(3)
  set uicon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUicon() => $_has(2);
  @$pb.TagNumber(3)
  void clearUicon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get utitle => $_getIZ(3);
  @$pb.TagNumber(4)
  set utitle($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUtitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearUtitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get utitleNew => $_getIZ(4);
  @$pb.TagNumber(5)
  set utitleNew($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUtitleNew() => $_has(4);
  @$pb.TagNumber(5)
  void clearUtitleNew() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get uvip => $_getIZ(5);
  @$pb.TagNumber(6)
  set uvip($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUvip() => $_has(5);
  @$pb.TagNumber(6)
  void clearUvip() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get touid => $_getIZ(6);
  @$pb.TagNumber(7)
  set touid($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTouid() => $_has(6);
  @$pb.TagNumber(7)
  void clearTouid() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get toname => $_getSZ(7);
  @$pb.TagNumber(8)
  set toname($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasToname() => $_has(7);
  @$pb.TagNumber(8)
  void clearToname() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get toicon => $_getSZ(8);
  @$pb.TagNumber(9)
  set toicon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasToicon() => $_has(8);
  @$pb.TagNumber(9)
  void clearToicon() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get totitle => $_getIZ(9);
  @$pb.TagNumber(10)
  set totitle($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTotitle() => $_has(9);
  @$pb.TagNumber(10)
  void clearTotitle() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get totitleNew => $_getIZ(10);
  @$pb.TagNumber(11)
  set totitleNew($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTotitleNew() => $_has(10);
  @$pb.TagNumber(11)
  void clearTotitleNew() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get tovip => $_getIZ(11);
  @$pb.TagNumber(12)
  set tovip($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasTovip() => $_has(11);
  @$pb.TagNumber(12)
  void clearTovip() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get money => $_getIZ(12);
  @$pb.TagNumber(13)
  set money($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasMoney() => $_has(12);
  @$pb.TagNumber(13)
  void clearMoney() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get upopularity => $_getIZ(13);
  @$pb.TagNumber(14)
  set upopularity($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasUpopularity() => $_has(13);
  @$pb.TagNumber(14)
  void clearUpopularity() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get topopularity => $_getIZ(14);
  @$pb.TagNumber(15)
  set topopularity($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasTopopularity() => $_has(14);
  @$pb.TagNumber(15)
  void clearTopopularity() => clearField(15);
}

class ResRankingSweet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRankingSweet',
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
    ..pc<SweetList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: SweetList.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hideRank',
        protoName: 'hideRank')
    ..hasRequiredFields = false;

  ResRankingSweet._() : super();
  factory ResRankingSweet({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<SweetList>? data,
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
  factory ResRankingSweet.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRankingSweet.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRankingSweet clone() => ResRankingSweet()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRankingSweet copyWith(void Function(ResRankingSweet) updates) =>
      super.copyWith((message) => updates(message as ResRankingSweet))
          as ResRankingSweet; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRankingSweet create() => ResRankingSweet._();
  ResRankingSweet createEmptyInstance() => create();
  static $pb.PbList<ResRankingSweet> createRepeated() =>
      $pb.PbList<ResRankingSweet>();
  @$core.pragma('dart2js:noInline')
  static ResRankingSweet getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRankingSweet>(create);
  static ResRankingSweet? _defaultInstance;

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
  $core.List<SweetList> get data => $_getList(2);

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
