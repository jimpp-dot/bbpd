///
//  Generated code. Do not modify.
//  source: ranking_contribute.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RankList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RankList',
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
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payRoomMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vipNew',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RankList._() : super();
  factory RankList({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.int? birthday,
    $core.int? version,
    $core.int? payMoney,
    $core.int? payRoomMoney,
    $core.int? money,
    $core.int? title,
    $core.int? titleNew,
    $core.int? vip,
    $core.int? vipNew,
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
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (version != null) {
      _result.version = version;
    }
    if (payMoney != null) {
      _result.payMoney = payMoney;
    }
    if (payRoomMoney != null) {
      _result.payRoomMoney = payRoomMoney;
    }
    if (money != null) {
      _result.money = money;
    }
    if (title != null) {
      _result.title = title;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (vipNew != null) {
      _result.vipNew = vipNew;
    }
    return _result;
  }
  factory RankList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RankList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RankList clone() => RankList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RankList copyWith(void Function(RankList) updates) =>
      super.copyWith((message) => updates(message as RankList))
          as RankList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RankList create() => RankList._();
  RankList createEmptyInstance() => create();
  static $pb.PbList<RankList> createRepeated() => $pb.PbList<RankList>();
  @$core.pragma('dart2js:noInline')
  static RankList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RankList>(create);
  static RankList? _defaultInstance;

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
  $core.int get sex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get birthday => $_getIZ(4);
  @$pb.TagNumber(5)
  set birthday($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBirthday() => $_has(4);
  @$pb.TagNumber(5)
  void clearBirthday() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get version => $_getIZ(5);
  @$pb.TagNumber(6)
  set version($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearVersion() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get payMoney => $_getIZ(6);
  @$pb.TagNumber(7)
  set payMoney($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPayMoney() => $_has(6);
  @$pb.TagNumber(7)
  void clearPayMoney() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get payRoomMoney => $_getIZ(7);
  @$pb.TagNumber(8)
  set payRoomMoney($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPayRoomMoney() => $_has(7);
  @$pb.TagNumber(8)
  void clearPayRoomMoney() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get money => $_getIZ(8);
  @$pb.TagNumber(9)
  set money($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasMoney() => $_has(8);
  @$pb.TagNumber(9)
  void clearMoney() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get title => $_getIZ(9);
  @$pb.TagNumber(10)
  set title($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTitle() => $_has(9);
  @$pb.TagNumber(10)
  void clearTitle() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get titleNew => $_getIZ(10);
  @$pb.TagNumber(11)
  set titleNew($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTitleNew() => $_has(10);
  @$pb.TagNumber(11)
  void clearTitleNew() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get vip => $_getIZ(11);
  @$pb.TagNumber(12)
  set vip($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasVip() => $_has(11);
  @$pb.TagNumber(12)
  void clearVip() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get vipNew => $_getIZ(12);
  @$pb.TagNumber(13)
  set vipNew($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasVipNew() => $_has(12);
  @$pb.TagNumber(13)
  void clearVipNew() => clearField(13);
}

class ResRankingContribute extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRankingContribute',
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
    ..pc<RankList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: RankList.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hideRank',
        protoName: 'hideRank')
    ..hasRequiredFields = false;

  ResRankingContribute._() : super();
  factory ResRankingContribute({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<RankList>? data,
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
  factory ResRankingContribute.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRankingContribute.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRankingContribute clone() =>
      ResRankingContribute()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRankingContribute copyWith(void Function(ResRankingContribute) updates) =>
      super.copyWith((message) => updates(message as ResRankingContribute))
          as ResRankingContribute; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRankingContribute create() => ResRankingContribute._();
  ResRankingContribute createEmptyInstance() => create();
  static $pb.PbList<ResRankingContribute> createRepeated() =>
      $pb.PbList<ResRankingContribute>();
  @$core.pragma('dart2js:noInline')
  static ResRankingContribute getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRankingContribute>(create);
  static ResRankingContribute? _defaultInstance;

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
  $core.List<RankList> get data => $_getList(2);

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
